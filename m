Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C9F6F60ED9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 11:05:09 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2013 04:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,890,1371106800"; d="scan'208";a="359459988"
Received: from ks-mobl3.gar.corp.intel.com (HELO helios.ger.corp.intel.com)
	([10.252.123.176])
	by azsmga001.ch.intel.com with ESMTP; 12 Sep 2013 04:05:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2013 12:04:52 +0100
Message-Id: <1378983892-7327-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Thu, 12 Sep 2013 11:05:11 -0000

This allows a clean seperation between image outputs from different
machines, and makes it possible to have convenience symlinks to make
the output ready to deploy.

This did require some surgery in runqemu; if explicit paths to the image
and kernel are not supplied then DEPLOY_DIR_IMAGE needs to be determined
from bitbake or set in the environment. However the script does try to
avoid requiring it unless it really is needed. Corresponding changes
were made in the automated testing code as well.

Based on an RFC patch by Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/testimage.bbclass    |  1 +
 meta/conf/bitbake.conf            |  2 +-
 meta/lib/oeqa/utils/qemurunner.py |  8 +++++-
 scripts/runqemu                   | 56 +++++++++++++++++++++++++++------------
 4 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 4eef0be..c83906d 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -122,6 +122,7 @@ def testimage_main(d):
 
     qemu = QemuRunner(machine, rootfs)
     qemu.tmpdir = d.getVar("TMPDIR", True)
+    qemu.deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True)
     qemu.display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
     qemu.logfile = os.path.join(testdir, "qemu_boot_log.%s" % d.getVar('DATETIME', True))
     try:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2d19d86..0e1a9e2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -379,7 +379,7 @@ DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
 DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
-DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images"
+DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index b5c757a..d362ede 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -16,7 +16,7 @@ import bb
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display = None, tmpdir = None, logfile = None, boottime = 400, runqemutime = 60):
+    def __init__(self, machine, rootfs, display = None, tmpdir = None, deploy_dir_image = None, logfile = None, boottime = 400, runqemutime = 60):
         # Popen object
         self.runqemu = None
 
@@ -28,6 +28,7 @@ class QemuRunner:
 
         self.display = display
         self.tmpdir = tmpdir
+        self.deploy_dir_image = deploy_dir_image
         self.logfile = logfile
         self.boottime = boottime
         self.runqemutime = runqemutime
@@ -71,6 +72,11 @@ class QemuRunner:
             return False
         else:
             os.environ["OE_TMPDIR"] = self.tmpdir
+        if not os.path.exists(self.deploy_dir_image):
+            bb.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_dir_image)
+            return False
+        else:
+            os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
         self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial tcp:127.0.0.1:%s"' % self.serverport
         if qemuparams:
diff --git a/scripts/runqemu b/scripts/runqemu
index b496785..efab1a2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -321,9 +321,17 @@ AKITA_DEFAULT_FSTYPE=jffs2
 SPITZ_DEFAULT_KERNEL=zImage-spitz.bin
 SPITZ_DEFAULT_FSTYPE=ext3
 
-setup_tmpdir() {
-    if [ -z "$OE_TMPDIR" ]; then
-        # Try to get OE_TMPDIR from bitbake
+setup_path_vars() {
+    if [ -z "$OE_TMPDIR" ] ; then
+        PATHS_REQUIRED=true
+    elif [ "$1" = "1" -a -z "$DEPLOY_DIR_IMAGE" ] ; then
+        PATHS_REQUIRED=true
+    else
+        PATHS_REQUIRED=false
+    fi
+
+    if [ "$PATHS_REQUIRED" = "true" ]; then
+        # Try to get the variable values from bitbake
         type -P bitbake &>/dev/null || {
             echo "In order for this script to dynamically infer paths";
             echo "to kernels or filesystem images, you either need";
@@ -331,21 +339,35 @@ setup_tmpdir() {
             echo "before running this script" >&2;
             exit 1; }
 
-        # We have bitbake in PATH, get OE_TMPDIR from bitbake
-        OE_TMPDIR=`MACHINE=$MACHINE bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
+        # We have bitbake in PATH, get the variable values from bitbake
+        BITBAKE_ENV_TMPFILE=`mktemp runqemu.XXXXXXXXXX`
+        if [ "$?" != "0" ] ; then
+            echo "Error: mktemp failed for bitbake environment output"
+            exit 1
+        fi
+
+        MACHINE=$MACHINE bitbake -e > $BITBAKE_ENV_TMPFILE
+        if [ -z "$OE_TMPDIR" ] ; then
+            OE_TMPDIR=`cat $BITBAKE_ENV_TMPFILE | sed -n 's/^TMPDIR=\"\(.*\)\"/\1/p'`
+        fi
+        if [ -z "$DEPLOY_DIR_IMAGE" ] ; then
+            DEPLOY_DIR_IMAGE=`cat $BITBAKE_ENV_TMPFILE | sed -n 's/^DEPLOY_DIR_IMAGE=\"\(.*\)\"/\1/p'`
+        fi
         if [ -z "$OE_TMPDIR" ]; then
             # Check for errors from bitbake that the user needs to know about
-            BITBAKE_OUTPUT=`bitbake -e | wc -l`
+            BITBAKE_OUTPUT=`cat $BITBAKE_ENV_TMPFILE | wc -l`
             if [ "$BITBAKE_OUTPUT" -eq "0" ]; then
-                echo "Error: this script needs to be run from your build directory,"
-                echo "or you need to explicitly set OE_TMPDIR in your environment"
+                echo "Error: this script needs to be run from your build directory, or you need"
+                echo "to explicitly set OE_TMPDIR and DEPLOY_DIR_IMAGE in your environment"
             else
                 echo "There was an error running bitbake to determine TMPDIR"
                 echo "Here is the output from 'bitbake -e':"
-                bitbake -e
+                cat $BITBAKE_ENV_TMPFILE
             fi
+            rm $BITBAKE_ENV_TMPFILE
             exit 1
         fi
+        rm $BITBAKE_ENV_TMPFILE
     fi
 }
 
@@ -355,7 +377,7 @@ setup_sysroot() {
     # either in an in-tree build scenario or the environment
     # script wasn't source'd.
     if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
-        setup_tmpdir
+        setup_path_vars
         BUILD_ARCH=`uname -m`
         BUILD_OS=`uname | tr '[A-Z]' '[a-z]'`
         BUILD_SYS="$BUILD_ARCH-$BUILD_OS"
@@ -405,9 +427,9 @@ if [ -e "$ROOTFS" -a -z "$FSTYPE" ]; then
 fi
 
 if [ -z "$KERNEL" -a "x$FSTYPE" != "xvmdk" ]; then
-    setup_tmpdir
+    setup_path_vars 1
     eval kernel_file=\$${machine2}_DEFAULT_KERNEL
-    KERNEL=$OE_TMPDIR/deploy/images/$kernel_file
+    KERNEL=$DEPLOY_DIR_IMAGE/$kernel_file
 
     if [ -z "$KERNEL" ]; then
         error "Unable to determine default kernel for MACHINE [$MACHINE]"
@@ -428,14 +450,14 @@ fi
 # Handle cases where a ROOTFS type is given instead of a filename, e.g.
 # core-image-sato
 if [ "$LAZY_ROOTFS" = "true" ]; then
-    setup_tmpdir
-    echo "Assuming $ROOTFS really means $OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE"
-    ROOTFS=$OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE
+    setup_path_vars 1
+    echo "Assuming $ROOTFS really means $DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE"
+    ROOTFS=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
 fi
 
 if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" ]; then
-    setup_tmpdir
-    T=$OE_TMPDIR/deploy/images
+    setup_path_vars 1
+    T=$DEPLOY_DIR_IMAGE
     eval rootfs_list=\$${machine2}_DEFAULT_ROOTFS
     findimage $T $MACHINE $FSTYPE
 
-- 
1.8.1.2


