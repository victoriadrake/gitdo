#!/bin/bash

dir="$1"

# No directory has been provided, use current
if [ -z "$dir" ]
then
    dir="`pwd`"
fi

# Make sure directory ends with "/"
if [[ $dir != */ ]]
then
	dir="$dir/*"
else
	dir="$dir*"
fi

# Loop all sub-directories
for f in $dir
do
	# Only interested in directories
	[ -d "${f}" ] || continue

	# Check if directory is a git repository
	if [ -d "$f/.git" ]
	then
        mod=0
		cd "$f"

		# Print origin push url
        s=$(git remote -v | grep push | awk '{print $2}')
		echo -en "${s}\n"
	fi
done

