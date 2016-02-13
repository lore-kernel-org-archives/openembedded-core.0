Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 824D873D46
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 13 Feb 2016 03:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="651707031"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Feb 2016 03:12:17 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id C2E1A6A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:07 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:08 +0200
Message-Id: <aa166b9e29f3090d322a797e26160c670148d10a.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 01/14] runqemu: add support for wic images
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:19 -0000

Quemu should be able to run wic images this way:
    runqemu <machine> <image recipe> wic

Tested with 'runqemu qemux86-64 wic-image-minimal wic'

(From OE-Core rev: 8716be799949cb8bde7fa49cbea61312a3a93bb7)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu          |  3 ++-
 scripts/runqemu-internal | 16 ++++++++--------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 46918e2..4bb3bb6 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -40,6 +40,7 @@ usage() {
     echo "Examples:"
     echo "  $MYNAME qemuarm"
     echo "  $MYNAME qemux86-64 core-image-sato ext4"
+    echo "  $MYNAME qemux86-64 wic-image-minimal wic"
     echo "  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial"
     echo "  $MYNAME qemux86 ramfs"
     echo "  $MYNAME qemux86 iso"
@@ -116,7 +117,7 @@ while true; do
             [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
-        "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs" | "hddimg" | "hdddirect" )
+        "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs" | "hddimg" | "hdddirect" | "wic" )
             [ -z "$FSTYPE" -o "$FSTYPE" = "$arg" ] && FSTYPE=$arg || \
                 error "conflicting FSTYPE types [$FSTYPE] and [$arg]"
             ;;
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index fb98a6e..2926024 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -349,7 +349,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     export QEMU_AUDIO_DRV="none"
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
         KERNCMDLINE="root=$DROOT rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
     fi
@@ -383,7 +383,7 @@ if [ "$MACHINE" = "qemuarm64" ]; then
     else
         QEMU_UI_OPTIONS=""
     fi
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
         KERNCMDLINE="root=$DROOT rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
         # qemu-system-aarch64 only support '-machine virt -cpu cortex-a57' for now
         QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
@@ -411,7 +411,7 @@ if [ "$MACHINE" = "qemux86" ]; then
     else
         QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     fi
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
         KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
@@ -449,7 +449,7 @@ if [ "$MACHINE" = "qemux86-64" ]; then
     else
         QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     fi
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
         KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
@@ -495,7 +495,7 @@ if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemum
     esac
     MACHINE_SUBTYPE=malta
     QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
         #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         KERNCMDLINE="root=$DROOT rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
@@ -521,7 +521,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
     else
         QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
     fi
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
         KERNCMDLINE="root=$DROOT rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
     fi
@@ -540,7 +540,7 @@ if [ "$MACHINE" = "qemush4" ]; then
     QEMU=qemu-system-sh4
     MACHINE_SUBTYPE=r2d
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
         #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         KERNCMDLINE="root=/dev/hda rw console=ttySC1 noiotrap earlyprintk=sh-sci.1 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
@@ -726,7 +726,7 @@ echo "Running $QEMU..."
 if [ "$FSTYPE" = "vmdk" -o "$FSTYPE" = "hddimg" -o "$FSTYPE" = "hdddirect" ]; then
     echo $QEMUBIN $VM $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
     LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN $VM $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
-elif [ "$FSTYPE" = "iso" ]; then
+elif [ "$FSTYPE" = "iso" -o "$FSTYPE" = "wic" ]; then
     echo $QEMUBIN $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
     LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
 else
-- 
2.1.4


