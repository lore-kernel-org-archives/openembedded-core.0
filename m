Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1677E77136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:18:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Oct 2015 08:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,182,1444719600"; d="scan'208";a="669605362"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.73])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 08:18:24 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 10:18:39 -0500
Message-Id: <29e78fca9b3400bb224948f60cea0e720d83d473.1445525963.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445525963.git.anibal.limon@linux.intel.com>
References: <cover.1445525963.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1445525963.git.anibal.limon@linux.intel.com>
References: <cover.1445525963.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] runqemu-internal: Enable support for use virtio devices.
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
X-List-Received-Date: Thu, 22 Oct 2015 15:18:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable virtio usage for default in runqemu also get rid
of duplicate configuration from now all qemu machines uses
virtio.

[YOCTO #8427]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/runqemu-internal | 59 ++++++++++++++----------------------------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 38ea965..3b0e54c 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -120,16 +120,9 @@ if [ "$SLIRP_ENABLED" = "yes" ]; then
     KERNEL_NETWORK_CMD="ip=dhcp"
     QEMU_TAP_CMD=""
     QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
-    if [ "$KVM_ACTIVE" = "yes" ]; then
-        QEMU_NETWORK_CMD=""
-        DROOT="/dev/vda"
-        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
-    else
-        QEMU_NETWORK_CMD=""
-        DROOT="/dev/hda"
-        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=ide,format=raw"
-    fi
-
+    QEMU_NETWORK_CMD=""
+    DROOT="/dev/vda"
+    ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
 else
         acquire_lock() {
             lockfile=$1
@@ -266,24 +259,13 @@ else
 
         KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
         QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
-        if [ "$KVM_ACTIVE" = "yes" ]; then
-            if [ "$VHOST_ACTIVE" = "yes" ]; then
-                QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
-            else
-                QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD"
-            fi
-            DROOT="/dev/vda"
-            ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
+        if [ "$VHOST_ACTIVE" = "yes" ]; then
+            QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
         else
-            QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
-            DROOT="/dev/hda"
-            ROOTFS_OPTIONS="-drive file=$ROOTFS,if=ide,format=raw"
-        fi
-        if [ "$MACHINE" = "qemuarm64" ]; then
-            QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
-            DROOT="/dev/vda"
-            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,if=none,format=raw -device virtio-blk-device,drive=disk0"
+            QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD"
         fi
+        DROOT="/dev/vda"
+        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
 
         KERNCMDLINE="mem=$QEMU_MEMORY"
         QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
@@ -368,16 +350,6 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
-        if [ "$MACHINE" = "qemuarm" ]; then
-            QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD"
-            DROOT="/dev/vda"
-            ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
-        else
-            QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
-            DROOT="/dev/sda"
-            ROOTFS_OPTIONS="-drive file=$ROOTFS,format=raw"
-        fi
-
         KERNCMDLINE="root=$DROOT rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
     fi
@@ -401,6 +373,10 @@ fi
 if [ "$MACHINE" = "qemuarm64" ]; then
     QEMU=qemu-system-aarch64
 
+    QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
+    DROOT="/dev/vda"
+    ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,if=none,format=raw -device virtio-blk-device,drive=disk0"
+
     export QEMU_AUDIO_DRV="none"
     if [ "x$SERIALSTDIO" = "x" ] ; then
         QEMU_UI_OPTIONS="-nographic"
@@ -408,7 +384,7 @@ if [ "$MACHINE" = "qemuarm64" ]; then
         QEMU_UI_OPTIONS=""
     fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
+        KERNCMDLINE="root=$DROOT rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
         # qemu-system-aarch64 only support '-machine virt -cpu cortex-a57' for now
         QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
@@ -423,7 +399,6 @@ if [ "$MACHINE" = "qemuarm64" ]; then
     fi
 fi
 
-
 if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu-system-i386
     if [ "$KVM_ACTIVE" = "yes" ]; then
@@ -522,8 +497,8 @@ if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemum
     QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -drive file=$ROOTFS,format=raw -no-reboot $QEMU_UI_OPTIONS"
+        KERNCMDLINE="root=$DROOT rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
@@ -547,8 +522,8 @@ if [ "$MACHINE" = "qemuppc" ]; then
         QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
     fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -drive file=$ROOTFS,format=raw -no-reboot $QEMU_UI_OPTIONS"
+        KERNCMDLINE="root=$DROOT rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-- 
2.1.4


