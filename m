Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SPzjS-0002W2-J6
	for openembedded-core@openembedded.org; Thu, 03 May 2012 19:22:22 +0200
Received: by wibhm17 with SMTP id hm17so513070wib.0
	for <openembedded-core@openembedded.org>;
	Thu, 03 May 2012 10:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gZ3QdL2ROZj6QbfEiBH5jHMVrahlRwIFrohas7w2yjc=;
	b=II66YwyS9oBV9/BRSWG9zNe2Py3PzZzJHem/xlVj4XzuYnqANWBsTBdF1Map0cFZc4
	aDh2u4l5a6XTWE53VACWVNF7iGa/pxFiChOZnvP08DGB4lmgvsnBO+MCDmGAURQ7SLMZ
	XNJ1syIbueaa/y/6aHga5NfJe8MKfBRfZ6Bx38kyS56H6+138aCIAm8mMrcdY0BKyoi9
	CHA7aRE8k8Bz9qLpHrS+Mr4oXjzc4NQJ4FJVTiLLatC29aHZKveZKO8DlqKP1dyHeYLy
	wTGEmVvfKcdUz0PIYCSZ1DI6ztBfHiewe/50T9U6PWCuBw5lfp/2fZHcihPgaoXoQF4Y
	pCug==
Received: by 10.180.86.197 with SMTP id r5mr5113949wiz.21.1336065157116;
	Thu, 03 May 2012 10:12:37 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id du4sm5015890wib.10.2012.05.03.10.12.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:12:36 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SPzZz-0002Ds-AX; Thu, 03 May 2012 19:12:35 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu,  3 May 2012 19:12:29 +0200
Message-Id: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
Subject: [PATCH 1/6] runqemu: Use OE_TMPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 17:22:22 -0000

The error message erroneously talked about TMPDIR.
Just use OE_TMPDIR everywhere to make the name of the variable obvious.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/runqemu |   27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index caabf61..7c2c4b3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -55,11 +55,6 @@ SCRIPT_QEMU_OPT=""
 SCRIPT_QEMU_EXTRA_OPT=""
 SCRIPT_KERNEL_OPT=""
 
-# Don't use TMPDIR from the external environment, it may be a distro
-# variable pointing to /tmp (e.g. within X on OpenSUSE)
-# Instead, use OE_TMPDIR for passing this in externally.
-TMPDIR="$OE_TMPDIR"
-
 # Determine whether the file is a kernel or QEMU image, and set the
 # appropriate variables
 process_filename() {
@@ -273,8 +268,8 @@ SPITZ_DEFAULT_KERNEL=zImage-spitz.bin
 SPITZ_DEFAULT_FSTYPE=ext3
 
 setup_tmpdir() {
-    if [ -z "$TMPDIR" ]; then
-        # Try to get TMPDIR from bitbake
+    if [ -z "$OE_TMPDIR" ]; then
+        # Try to get OE_TMPDIR from bitbake
         type -P bitbake &>/dev/null || {
             echo "In order for this script to dynamically infer paths";
             echo "to kernels or filesystem images, you either need";
@@ -282,11 +277,11 @@ setup_tmpdir() {
             echo "before running this script" >&2;
             exit 1; }
 
-        # We have bitbake in PATH, get TMPDIR from bitbake
-        TMPDIR=`bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
-        if [ -z "$TMPDIR" ]; then
+        # We have bitbake in PATH, get OE_TMPDIR from bitbake
+        OE_TMPDIR=`bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
+        if [ -z "$OE_TMPDIR" ]; then
             echo "Error: this script needs to be run from your build directory,"
-            echo "or you need to explicitly set TMPDIR in your environment"
+            echo "or you need to explicitly set OE_TMPDIR in your environment"
             exit 1
         fi
     fi
@@ -303,7 +298,7 @@ setup_sysroot() {
         BUILD_OS=`uname | tr '[A-Z]' '[a-z]'`
         BUILD_SYS="$BUILD_ARCH-$BUILD_OS"
 
-        OECORE_NATIVE_SYSROOT=$TMPDIR/sysroots/$BUILD_SYS
+        OECORE_NATIVE_SYSROOT=$OE_TMPDIR/sysroots/$BUILD_SYS
     fi 
 }
 
@@ -348,7 +343,7 @@ fi
 if [ -z "$KERNEL" ]; then
     setup_tmpdir
     eval kernel_file=\$${machine2}_DEFAULT_KERNEL
-    KERNEL=$TMPDIR/deploy/images/$kernel_file
+    KERNEL=$OE_TMPDIR/deploy/images/$kernel_file
 
     if [ -z "$KERNEL" ]; then
         echo "Error: Unable to determine default kernel for MACHINE [$MACHINE]"
@@ -372,13 +367,13 @@ fi
 # core-image-sato
 if [ "$LAZY_ROOTFS" = "true" ]; then
     setup_tmpdir
-    echo "Assuming $ROOTFS really means $TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE"
-    ROOTFS=$TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE
+    echo "Assuming $ROOTFS really means $OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE"
+    ROOTFS=$OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE
 fi
 
 if [ -z "$ROOTFS" ]; then
     setup_tmpdir
-    T=$TMPDIR/deploy/images
+    T=$OE_TMPDIR/deploy/images
     eval rootfs_list=\$${machine2}_DEFAULT_ROOTFS
     findimage $T $MACHINE $FSTYPE
 
-- 
1.7.10



