echo "Thorben's Dotfile Setup"

#locate the dotfiles directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DOTSDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

source "$DOTSDIR/sysinfo.sh"
printProfile

if [[ $OS == mac ]] ; then
	echo "Dotfiles Location: $DOTSDIR"
	$DOTSDIR/setup/osx/install.sh
else
	echo "System not supported..."
fi

echo "Setup Finished"

