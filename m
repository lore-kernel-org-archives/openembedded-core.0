Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0D26B25D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 13:13:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7MDDTeu020145
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2013 06:13:29 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 22 Aug 2013 06:13:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 09:13:13 -0400
Message-ID: <0fdd588a60edecc0aa11bfbb3ac8eb3d56a2b940.1377175027.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377175027.git.liezhi.yang@windriver.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 5/6] e2fsprogs: add populate-extfs.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2013 13:13:28 -0000
Content-Type: text/plain

This script is originally from Darren Hart, it will be used for creating
the ext* filesystem from a given directory, which will replace the
genext2fs in image_types.bbclass at the moment, we may use the mke2fs to
replace this script again when it has the initial directory support.

Changes of the script:
* Rename it from mkdebugfs.sh to populate-extfs.sh
* Add a simple usage
* Add checking for the number of the parameters
* Add the "regular empty file" and "fifo" file type
* Set mode, uid and gid for the file
* Save the command lines to a file and batch run them
* Change the error message
* Improve the performance
* Add the support for hardlink

[YOCTO #3848]

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |   96 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
new file mode 100644
index 0000000..9eff030
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
@@ -0,0 +1,96 @@
+#!/bin/sh
+
+do_usage () {
+	cat << _EOF
+Usage: populate-extfs.sh <source> <device>
+Create an ext2/ext3/ext4 filesystem from a directory or file
+
+  source: The source directory or file
+  device: The target device
+
+_EOF
+	exit 1
+}
+
+[ $# -ne 2 ] && do_usage
+
+SRCDIR=${1%%/}
+DEVICE=$2
+DEBUGFS="debugfs"
+
+{
+	CWD="/"
+	find $SRCDIR | while read FILE; do
+                TGT="${FILE##*/}"
+                DIR="${FILE#$SRCDIR}"
+                DIR="${DIR%$TGT}"
+
+		# Skip the root dir
+		[ ! -z "$DIR" ] || continue
+		[ ! -z "$TGT" ] || continue
+
+		if [ "$DIR" != "$CWD" ]; then
+			echo "cd $DIR"
+			CWD="$DIR"
+		fi
+
+		# Only stat once since stat is a time consuming command
+		STAT=$(stat -c "TYPE=\"%F\";DEVNO=\"0x%t 0x%T\";MODE=\"%f\";U=\"%u\";G=\"%g\"" $FILE)
+		eval $STAT
+
+		case $TYPE in
+		"directory")
+			echo "mkdir $TGT"
+			;;
+		"regular file" | "regular empty file")
+			echo "write $FILE $TGT"
+			;;
+		"symbolic link")
+			LINK_TGT=$(readlink $FILE)
+			echo "symlink $TGT $LINK_TGT"
+			;;
+		"block special file")
+			echo "mknod $TGT b $DEVNO"
+			;;
+		"character special file")
+			echo "mknod $TGT c $DEVNO"
+			;;
+		"fifo")
+			echo "mknod $TGT p"
+			;;
+		*)
+			echo "Unknown/unhandled file type '$TYPE' file: $FILE" 1>&2
+			;;
+		esac
+
+		# Set the file mode
+		echo "sif $TGT mode 0x$MODE"
+
+		# Set uid and gid
+		echo "sif $TGT uid $U"
+		echo "sif $TGT gid $G"
+	done
+
+	# Handle the hard links.
+	# Save the hard links to a file, use the inode number as the filename, for example:
+	# If a and b's inode number is 6775928, save a and b to /tmp/tmp.VrCwHh5gdt/6775928.
+	INODE_DIR=`mktemp -d` || exit 1
+	for i in `find $SRCDIR -type f -links +1 -printf 'INODE=%i###FN=%p\n'`; do
+		eval `echo $i | sed 's$###$ $'`
+		echo ${FN#$SRCDIR} >>$INODE_DIR/$INODE
+	done
+	# Use the debugfs' ln and "sif links_count" to handle them.
+	for i in `ls $INODE_DIR`; do
+		# The link source
+		SRC=`head -1 $INODE_DIR/$i`
+		# Remove the files and link them again except the first one
+		for TGT in `sed -n -e '1!p' $INODE_DIR/$i`; do
+			echo "rm $TGT"
+			echo "ln $SRC $TGT"
+		done
+		LN_CNT=`cat $INODE_DIR/$i | wc -l`
+		# Set the links count
+		echo "sif $SRC links_count $LN_CNT"
+	done
+	rm -fr $INODE_DIR
+} | $DEBUGFS -w -f - $DEVICE
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
index 2dc9dab..8b69b22 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
@@ -45,6 +45,7 @@ do_install_append () {
 		mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
 		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 	fi
+	install -m 0755 ${WORKDIR}/populate-extfs.sh ${D}${bindir}
 }
 
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
-- 
1.7.10.4


