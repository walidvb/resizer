#!/bin/bash

for f in "$@" 
	do
		if [ -f "$f" ]
			then 
				path=`dirname "$f"`
				file=`basename "$f"`
				extension="${file##*.}"
				filename="${file%.*}"

				echo "Processing "$filename.$extension""
				out="$path/""$filename""_1600.""$extension"
				sips -Z 1600 "$f" --out "$out"
		else
			echo "Skipping $f"
		fi
done

echo "All images were resized to 1600"
exit