#!/bin/bash
CURDIR=$(pwd)
SITE="http://yoursite.com/blog"
echo Updating Wordpress in $CURDIR
echo 1.  downloading latest build
wget -q http://wordpress.org/latest.tar.gz
echo 2.  unpacking latest build
tar zxf latest.tar.gz
cd wordpress/
echo 3.  replacing old files with fresh ones
tar cf - . | (cd $CURDIR; tar xf -)
echo 4.  updating your blog
wget -q -O - ${SITE}/wp-admin/upgrade.php?step=1 > /dev/null
echo 5.  removing unneeded files and directory
rm -f ../latest.tar.gz
echo 6.  all done !
