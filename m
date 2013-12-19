Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 11C4E60DFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 14:02:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2013 06:02:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,512,1384329600"; d="scan'208";a="454873508"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2013 06:02:15 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 16:02:57 +0200
Message-Id: <1387461777-25101-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] runqemu: Allow user to set -vga option with qemuparams
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
X-List-Received-Date: Thu, 19 Dec 2013 14:02:25 -0000

At the moment, the user cannot to set -vga other then vmware
(because "vmware" is set by default); and the first argument
in qemuparams has higher precedence.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 scripts/runqemu          |  1 +
 scripts/runqemu-internal | 12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 9c0a03b..dcb2931 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -156,6 +156,7 @@ while true; do
             # to use simplified options instead
             serial_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-serial\)'`
             kvm_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-enable-kvm\)'`
+            vga_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-vga\)'`
             [ ! -z "$serial_option" -o ! -z "$kvm_option" ] && \
                 echo "Please use simplified serial or kvm options instead"
             ;;
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 74b0c35..284b88c 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -357,7 +357,11 @@ fi
 
 if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu-system-i386
-    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
+    if [ ! -z "$vga_option" ]; then
+        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
+    else
+        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
+    fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
@@ -381,7 +385,11 @@ fi
 
 if [ "$MACHINE" = "qemux86-64" ]; then
     QEMU=qemu-system-x86_64
-    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
+    if [ ! -z "$vga_option" ]; then
+        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
+    else
+        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
+    fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
-- 
1.8.3.2


