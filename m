Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 348216F6AB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 07:00:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s27706Uu017152
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 23:00:07 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 23:00:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:35 -0500
Message-ID: <f4d9644bd2cacfa78ac0d83b678f4c6abe8b2899.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174908.git.liezhi.yang@windriver.com>
References: <cover.1394174908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/14] e2fsprogs: populate-extfs.sh: remove it
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
X-List-Received-Date: Fri, 07 Mar 2014 07:00:07 -0000
Content-Type: text/plain

Remove it since we don't need it anymore, and there is one inside the
e2fsprogs.

[YOCTO #4083]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/e2fsprogs/populate-extfs.sh          |   96 --------------------
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    2 -
 2 files changed, 98 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh
deleted file mode 100644
index 7de720b..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh
+++ /dev/null
@@ -1,96 +0,0 @@
-#!/bin/sh
-
-do_usage () {
-	cat << _EOF
-Usage: populate-extfs.sh <source> <device>
-Create an ext2/ext3/ext4 filesystem from a directory or file
-
-  source: The source directory or file
-  device: The target device
-
-_EOF
-	exit 1
-}
-
-[ $# -ne 2 ] && do_usage
-
-SRCDIR=${1%%/}
-DEVICE=$2
-DEBUGFS="debugfs"
-
-{
-	CWD="/"
-	find $SRCDIR | while read FILE; do
-                TGT="${FILE##*/}"
-                DIR="${FILE#$SRCDIR}"
-                DIR="${DIR%$TGT}"
-
-		# Skip the root dir
-		[ ! -z "$DIR" ] || continue
-		[ ! -z "$TGT" ] || continue
-
-		if [ "$DIR" != "$CWD" ]; then
-			echo "cd $DIR"
-			CWD="$DIR"
-		fi
-
-		# Only stat once since stat is a time consuming command
-		STAT=$(stat -c "TYPE=\"%F\";DEVNO=\"0x%t 0x%T\";MODE=\"%f\";U=\"%u\";G=\"%g\"" "$FILE")
-		eval $STAT
-
-		case $TYPE in
-		"directory")
-			echo "mkdir $TGT"
-			;;
-		"regular file" | "regular empty file")
-			echo "write \"$FILE\" \"$TGT\""
-			;;
-		"symbolic link")
-			LINK_TGT=$(readlink "$FILE")
-			echo "symlink \"$TGT\" \"$LINK_TGT\""
-			;;
-		"block special file")
-			echo "mknod \"$TGT\" b $DEVNO"
-			;;
-		"character special file")
-			echo "mknod \"$TGT\" c $DEVNO"
-			;;
-		"fifo")
-			echo "mknod \"$TGT\" p"
-			;;
-		*)
-			echo "Unknown/unhandled file type '$TYPE' file: $FILE" 1>&2
-			;;
-		esac
-
-		# Set the file mode
-		echo "sif \"$TGT\" mode 0x$MODE"
-
-		# Set uid and gid
-		echo "sif \"$TGT\" uid $U"
-		echo "sif \"$TGT\" gid $G"
-	done
-
-	# Handle the hard links.
-	# Save the hard links to a file, use the inode number as the filename, for example:
-	# If a and b's inode number is 6775928, save a and b to /tmp/tmp.VrCwHh5gdt/6775928.
-	INODE_DIR=`mktemp -d` || exit 1
-	for i in `find $SRCDIR -type f -links +1 -printf 'INODE=%i###FN=%p\n'`; do
-		eval `echo $i | sed 's$###$ $'`
-		echo ${FN#$SRCDIR} >>$INODE_DIR/$INODE
-	done
-	# Use the debugfs' ln and "sif links_count" to handle them.
-	for i in `ls $INODE_DIR`; do
-		# The link source
-		SRC=`head -1 $INODE_DIR/$i`
-		# Remove the files and link them again except the first one
-		for TGT in `sed -n -e '1!p' $INODE_DIR/$i`; do
-			echo "rm $TGT"
-			echo "ln $SRC $TGT"
-		done
-		LN_CNT=`cat $INODE_DIR/$i | wc -l`
-		# Set the links count
-		echo "sif $SRC links_count $LN_CNT"
-	done
-	rm -fr $INODE_DIR
-} | $DEBUGFS -w -f - $DEVICE
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index b369038..3864ec1 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -4,7 +4,6 @@ require e2fsprogs.inc
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
             file://fix-icache.patch \
-            file://populate-extfs.sh \
             file://quiet-debugfs.patch \
             file://0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch \
             file://0002-misc-create_inode.c-copy-files-recursively.patch \
@@ -51,7 +50,6 @@ do_install () {
 		mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
 		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 	fi
-	install -m 0755 ${WORKDIR}/populate-extfs.sh ${D}${bindir}
 }
 
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
-- 
1.7.10.4


