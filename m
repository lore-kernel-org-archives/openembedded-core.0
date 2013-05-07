Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZemn-0003Wo-A9
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:06:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r479mGX6004143
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2013 02:48:16 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 7 May 2013 02:48:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <dvhart@linux.intel.com>
Date: Tue, 7 May 2013 05:48:07 -0400
Message-ID: <94be0555ccb2640be96633e8753c1bc6b70477b8.1367919920.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367919920.git.liezhi.yang@windriver.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] e2fsprogs: add populate-extfs.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 10:06:50 -0000
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
 .../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh   |   93 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    2 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
new file mode 100644
index 0000000..5f2c307
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
@@ -0,0 +1,93 @@
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
+		"block special file" | "character special file")
+			echo "mknod $TGT b $DEVNO"
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
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
index b547036..f2590f5 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
             file://debugfs-too-short.patch \
             file://sparse_copy.patch \
+            file://populate-extfs.sh \
 "
 
 SRC_URI[md5sum] = "a1ec22ef003688dae9f76c74881b22b9"
@@ -43,6 +44,7 @@ do_install_append () {
 		mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
 		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 	fi
+	install -m 0755 ${WORKDIR}/populate-extfs.sh ${D}${bindir}
 }
 
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
-- 
1.7.10.4



