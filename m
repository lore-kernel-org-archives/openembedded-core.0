Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPqId-0008Kf-EX
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 10:22:38 +0200
Received: by mail-ea0-f179.google.com with SMTP id f15so83429eak.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 01:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=HdD1FaoaAku6vbLvQ4KdBy87x7oygY/oLSSBdHY/LJY=;
	b=Xng63K/1CaJ9MZIjj0SxYegAoHiZsOn+y6dfK8sCW4+tsmPIRe92rPdvBEJzkgjyNr
	UtQtFEufWNu+EJ/dtaWG0byGoQ0enTF0feRo6xrNG5/2MpuG1FRvbKSQQRFvx25qEKdX
	MAs8ylk12+azp8htNa8TGf35Eq4hfFsu0j4rDFKfCBl8PYNj/otclPfLPFbAADbDIE0B
	xIwO5HYoyYukZaDL4BXemADMoHP5ut+UJwiqb/be2yY6ZJr/8ZCvbGbLJo2Q1BcySjId
	EXp6AZmA145efCBLGQjhoDh4a4rEZ0Lll1zsgWk5mQ57YZFdM0n5OBbqJHbbtSG+39Ub
	vSfg==
X-Received: by 10.15.98.141 with SMTP id bj13mr2948097eeb.29.1365581114212;
	Wed, 10 Apr 2013 01:05:14 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id v6sm4035641eel.10.2013.04.10.01.05.11
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 01:05:12 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 10:05:01 +0200
Message-Id: <1365581101-3810-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQmmv0AwiZtm2kJCv5vu49HqPYXIl/cUPB9qjPUXvCAtlBhGeUfqdJoHhXjv0LOoCFn/Wl0d
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][PATCHv2] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Wed, 10 Apr 2013 08:22:39 -0000

This allows a clean seperation between all image outputs and making it possible to have convinience symlinks to make it ready to deploy. And while it isn't a valid reason, it must be mentioned: BSP layers which do use convenience symlinks already don't step on files owned by others anymore.

I assumed this was the default behaviour in OE-classic, but as it turns out every DISTRO set it to deploy/images/$MACHINE on its own.

Code inspections shows that the all references to the image deploy dir in classes and scripts in OE-core do the right thing and parse the DEPLOY_DIR_IMAGE variable, except runqemu.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/bitbake.conf |  2 +-
 scripts/runqemu        | 37 ++++++++++++++++++++++++++++++++++---
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cd5d61e..0540766 100644
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
diff --git a/scripts/runqemu b/scripts/runqemu
index 8ed1226..94aa054 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -339,6 +339,34 @@ setup_tmpdir() {
     fi
 }
 
+setup_deploydir() {
+    if [ -z "$DEPLOY_DIR_IMAGE" ]; then
+        # Try to get DEPLOY_DIR_IMAGE from bitbake
+        type -P bitbake &>/dev/null || {
+            echo "In order for this script to dynamically infer paths";
+            echo "to kernels or filesystem images, you either need";
+            echo "bitbake in your PATH or to source oe-init-build-env";
+            echo "before running this script" >&2;
+            exit 1; }
+
+        # We have bitbake in PATH, get DEPLOY_DIR_IMAGE from bitbake
+        OE_TMPDIR=`MACHINE=$MACHINE bitbake -e | sed -n 's/^DEPLOY_DIR_IMAGE=\"\(.*\)\"/\1/p'`
+        if [ -z "$DEPLOY_DIR_IMAGE" ]; then
+            # Check for errors from bitbake that the user needs to know about
+            BITBAKE_OUTPUT=`bitbake -e | wc -l`
+            if [ "$BITBAKE_OUTPUT" -eq "0" ]; then
+                echo "Error: this script needs to be run from your build directory,"
+                echo "or you need to explicitly set DEPLOY_DIR_IMAGE in your environment"
+            else
+                echo "There was an error running bitbake to determine DEPLOY_DIR_IMAGE"
+                echo "Here is the output from 'bitbake -e':"
+                bitbake -e
+            fi
+            exit 1
+        fi
+    fi
+}
+
 setup_sysroot() {
     # Toolchain installs set up $OECORE_NATIVE_SYSROOT in their
     # environment script. If that variable isn't set, we're
@@ -395,8 +423,9 @@ fi
 
 if [ -z "$KERNEL" -a "x$FSTYPE" != "xvmdk" ]; then
     setup_tmpdir
+    setup_deploydir
     eval kernel_file=\$${machine2}_DEFAULT_KERNEL
-    KERNEL=$OE_TMPDIR/deploy/images/$kernel_file
+    KERNEL=$DEPLOY_DIR_IMAGE/$kernel_file
 
     if [ -z "$KERNEL" ]; then
         error "Unable to determine default kernel for MACHINE [$MACHINE]"
@@ -418,13 +447,15 @@ fi
 # core-image-sato
 if [ "$LAZY_ROOTFS" = "true" ]; then
     setup_tmpdir
+    setup_deploydir
     echo "Assuming $ROOTFS really means $OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE"
-    ROOTFS=$OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE
+    ROOTFS=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
 fi
 
 if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" ]; then
     setup_tmpdir
-    T=$OE_TMPDIR/deploy/images
+    setup_deploydir
+    T=$DEPLOY_DIR_IMAGE
     eval rootfs_list=\$${machine2}_DEFAULT_ROOTFS
     findimage $T $MACHINE $FSTYPE
 
-- 
1.8.1.4



