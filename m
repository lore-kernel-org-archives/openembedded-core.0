Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UBkAj-0003E8-Ns
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 12:00:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r22Ahhim019883
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 2 Mar 2013 02:43:43 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 2 Mar 2013 02:43:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Mar 2013 18:46:41 +0800
Message-ID: <cb74ab9c504e321988ebd7cde03b4d57efa4e307.1362217827.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1362217827.git.liezhi.yang@windriver.com>
References: <cover.1362217827.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [RFC PATCH 1/2] e2fsprogs: add populate-extfs.sh
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
X-List-Received-Date: Sat, 02 Mar 2013 11:00:30 -0000
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

[YOCTO #3848]

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh   | 69 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |  2 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
new file mode 100644
index 0000000..638bd74
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
@@ -0,0 +1,69 @@
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
+SRCDIR=$1
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
+		[ ! -z "$TGT" ] || continue
+
+		if [ "$DIR" != "$CWD" ]; then
+			echo "cd $DIR"
+			CWD="$DIR"
+		fi
+
+		# Only stat once since stat is a time consuming command
+		STAT=$(stat -c "TYPE=\"%F\";DEVNO=\"%t %T\";MODE=\"%f\";U=\"%u\";G=\"%g\"" $FILE)
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
+} | $DEBUGFS -w -f - $DEVICE
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
index 9e22563..9b65184 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
@@ -4,6 +4,7 @@ PR = "r0"
 
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
+            file://populate-extfs.sh \
 "
 
 SRC_URI[md5sum] = "a1ec22ef003688dae9f76c74881b22b9"
@@ -41,6 +42,7 @@ do_install_append () {
 		mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
 		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 	fi
+	install -m 0755 ${WORKDIR}/populate-extfs.sh ${D}${bindir}
 }
 
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
-- 
1.7.11.2



