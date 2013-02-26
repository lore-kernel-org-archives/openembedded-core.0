Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UAGz6-0000yi-TE
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 10:38:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q9LjaB007877
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 01:21:45 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Tue, 26 Feb 2013 01:21:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 17:24:38 +0800
Message-ID: <e62df3d50df79849ea916095fd028b688b75df52.1361862860.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1361862860.git.liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 5/7] mkdebugfs.sh: several fixes
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
X-List-Received-Date: Tue, 26 Feb 2013 09:38:12 -0000
Content-Type: text/plain

Fix mkdebugfs.sh:

* Add a simple usage
* Add checking for the number of the parameters
* Add the "regular empty file" and "fifo" file type
* Set mode, uid and gid for the file
* Save the command lines to a file and batch run them

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/e2fsprogs/mkdebugfs.sh               | 43 +++++++++++++++++++---
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
index 41a13cb..88abc35 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
@@ -1,10 +1,25 @@
 #!/bin/sh
+
+do_usage () {
+    cat << _EOF
+Usage: mkdebugfs.sh <source> <device>
+Create an ext2/ext3/ext4 filesystem from a directory or file
+
+  source: The source directory or file
+  device: The target device
+
+_EOF
+    exit 1
+}
+
+[ $# -ne 2 ] && do_usage
+
 SRCDIR=$1
 DEVICE=$2
-DEBUGFS="debugfs/debugfs"
-
-yes | mkfs.ext4 test.img
+DEBUGFS="debugfs"
+CMD_FILE=`mktemp`
 
+# Save the debugfs command lines to a file, then run them
 {
     CWD="/"
     find $SRCDIR | while read FILE; do
@@ -26,7 +41,7 @@ yes | mkfs.ext4 test.img
         "directory")
             echo "mkdir $TGT"
             ;;
-        "regular file")
+        "regular file" | "regular empty file")
             echo "write $FILE $TGT"
             ;;
         "symbolic link")
@@ -41,9 +56,27 @@ yes | mkfs.ext4 test.img
             DEVNO=$(stat -c "%t %T" $FILE)
             echo "mknod $TGT c $DEVNO"
             ;;
+        "fifo")
+            echo "mknod $TGT p"
+            ;;
         *)
             echo "Unknown file $FILE" 1>&2
             ;;
         esac
+
+        # Set the file mode
+        MY_MODE=$(stat -c "%f" $FILE)
+        echo "sif $TGT mode 0x$MY_MODE"
+
+        # Set uid and gid
+        MY_UID=$(stat -c "%u" $FILE)
+        echo "sif $TGT uid $MY_UID"
+        MY_GID=$(stat -c "%g" $FILE)
+        echo "sif $TGT gid $MY_GID"
     done
-} | $DEBUGFS -w -f /dev/stdin $DEVICE
+} > $CMD_FILE
+
+# Run the command lines
+$DEBUGFS -w -f $CMD_FILE $DEVICE
+
+rm -f $CMD_FILE
-- 
1.7.11.2



