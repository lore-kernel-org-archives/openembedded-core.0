Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 74C7575C40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 15:04:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2015 08:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,699,1427785200"; d="scan'208";a="596768034"
Received: from sentry.rb.intel.com ([10.237.105.157])
	by orsmga003.jf.intel.com with ESMTP; 29 Jun 2015 08:03:02 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 18:03:11 +0300
Message-Id: <78fec302449585cc3514146d0cb3f0d5e9f36d06.1435590134.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1435590134.git.cristian.iorga@intel.com>
References: <cover.1435590134.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1435590134.git.cristian.iorga@intel.com>
References: <cover.1435590134.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] runqemu-internal: correctly set format for root FS as raw
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
X-List-Received-Date: Mon, 29 Jun 2015 15:04:45 -0000

qemu guesses via probing the format of root FS, but
gives a warning and restricts write operations on block 0.
Fix it by setting correctly the format as raw for more
machines and non-KVM machines.
In some cases, replaced the way machine disk is set for qemu.

Fix for [YOCTO #7918]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 scripts/runqemu-internal | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 694815f..6878251 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -127,7 +127,7 @@ if [ "$SLIRP_ENABLED" = "yes" ]; then
     else
         QEMU_NETWORK_CMD=""
         DROOT="/dev/hda"
-        ROOTFS_OPTIONS="-hda $ROOTFS"
+        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=ide,format=raw"
     fi
 
 else
@@ -265,12 +265,12 @@ else
         else
             QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
             DROOT="/dev/hda"
-            ROOTFS_OPTIONS="-hda $ROOTFS"
+            ROOTFS_OPTIONS="-drive file=$ROOTFS,if=ide,format=raw"
         fi
         if [ "$MACHINE" = "qemuarm64" ]; then
             QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
             DROOT="/dev/vda"
-            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS -device virtio-blk-device,drive=disk0"
+            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,format=raw -device virtio-blk-device,drive=disk0"
         fi
 
         KERNCMDLINE="mem=$QEMU_MEMORY"
@@ -357,7 +357,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="root=/dev/sda rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -drive file=$ROOTFS,format=raw -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
@@ -501,7 +501,7 @@ if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemum
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -drive file=$ROOTFS,format=raw -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
@@ -526,7 +526,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
     fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -drive file=$ROOTFS,format=raw -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-- 
2.1.4


