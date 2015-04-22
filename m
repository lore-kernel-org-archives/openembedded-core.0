Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id EC5F671E68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 11:12:31 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Yksa1-0006H0-2c from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Apr 2015 04:12:33 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Wed, 22 Apr 2015 12:12:31 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Apr 2015 14:12:29 +0300
Message-ID: <1429701149-28824-3-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1429701149-28824-1-git-send-email-dmitry_eremin@mentor.com>
References: <1429701149-28824-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] scripts/runqemu: add qemuarma9 support
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
X-List-Received-Date: Wed, 22 Apr 2015 11:12:34 -0000
Content-Type: text/plain

Support new qemuarma9 machine type. It mostly reuses existing qemuarm
setup, but the virtio-based network and disk devices.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 scripts/runqemu          |  9 ++++++---
 scripts/runqemu-internal | 35 +++++++++++++++++++++++++++++++----
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 84ece4d..87834f9 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -108,7 +108,7 @@ process_filename() {
 while true; do
     arg=${1}
     case "$arg" in
-        "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
+        "qemux86" | "qemux86-64" | "qemuarm" | "qemuarma9" | "qemuarm64" | "qemumips" | "qemumipsel" | \
         "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
@@ -232,13 +232,13 @@ fi
 
 if [ -z "$MACHINE" ]; then
     if [ "x$FSTYPE" = "xvmdk" ]; then
-        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarma9\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from vmdk filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
     else
-        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarma9\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename [$KERNEL]"
         fi
@@ -304,6 +304,9 @@ QEMUX86_64_DEFAULT_FSTYPE=ext4
 QEMUARM_DEFAULT_KERNEL=zImage-qemuarm.bin
 QEMUARM_DEFAULT_FSTYPE=ext4
 
+QEMUARMA9_DEFAULT_KERNEL=zImage-qemuarma9.bin
+QEMUARMA9_DEFAULT_FSTYPE=ext4
+
 QEMUARM64_DEFAULT_KERNEL=Image-qemuarm64.bin
 QEMUARM64_DEFAULT_FSTYPE=ext4
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 65dbf21..570c28e 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -50,6 +50,9 @@ else
         "qemuarm")
             mem_size=128
             ;;
+        "qemuarma9")
+            mem_size=512
+            ;;
         "qemuarm64")
             mem_size=512
             ;;
@@ -128,6 +131,11 @@ if [ "$SLIRP_ENABLED" = "yes" ]; then
         QEMU_NETWORK_CMD=""
         DROOT="/dev/sda"
         ROOTFS_OPTIONS="-hda $ROOTFS"
+    elif [ "$MACHINE" = "qemuarma9" ]; then
+        QEMU_UI_OPTIONS="-nographic"
+        QEMU_NETWORK_CMD=""
+        DROOT="/dev/vda"
+        ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS -device virtio-blk-device,drive=disk0"
     else
         QEMU_NETWORK_CMD=""
         DROOT="/dev/hda"
@@ -276,6 +284,11 @@ else
             DROOT="/dev/sda"
             ROOTFS_OPTIONS="-hda $ROOTFS"
         fi
+        if [ "$MACHINE" = "qemuarma9" ]; then
+            QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
+            DROOT="/dev/vda"
+            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS -device virtio-blk-device,drive=disk0"
+        fi
         if [ "$MACHINE" = "qemuarm64" ]; then
             QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
             DROOT="/dev/vda"
@@ -284,7 +297,7 @@ else
 
         KERNCMDLINE="mem=$QEMU_MEMORY"
         QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
-        if [ $MACHINE = 'qemuarm64' ]; then
+        if [ $MACHINE = 'qemuarm64' -o $MACHINE = 'qemuarma9' ]; then
             QEMU_UI_OPTIONS="-nographic"
         fi
 
@@ -308,6 +321,7 @@ case "$MACHINE" in
     "qemuppc") ;;
     "qemuarmv6") ;;
     "qemuarmv7") ;;
+    "qemuarma9") ;;
     "qemux86") ;;
     "qemux86-64") ;;
     "qemuzynq") ;;
@@ -361,14 +375,23 @@ if [ "$FSTYPE" = "nfs" ]; then
     NFSRUNNING="true"
 fi
 
-if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarmv7" ]; then
+if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarmv7" -o "$MACHINE" = "qemuarma9" ]; then
     QEMU=qemu-system-arm
-    MACHINE_SUBTYPE=versatilepb
+    if [ "$MACHINE" = "qemuarma9" ]; then
+        MACHINE_SUBTYPE="vexpress-a9"
+    else
+        MACHINE_SUBTYPE="versatilepb"
+    fi
     export QEMU_AUDIO_DRV="none"
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
+    if [ "$MACHINE" = "qemuarma9" ]; then
+        TTYCONSOLE=""
+    else
+        TTYCONSOLE="console=tty"
+    fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="root=$DROOT rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
+        KERNCMDLINE="root=$DROOT rw console=ttyAMA0,115200 $TTYCONSOLE $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
@@ -386,6 +409,10 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     if [ "$MACHINE" = "qemuarmv7" ]; then
         QEMUOPTIONS="$QEMUOPTIONS -cpu cortex-a8"
     fi
+    if [ "$MACHINE" = "qemuarma9" ]; then
+        DTB="`dirname $KERNEL`/`basename $KERNEL -$MACHINE.bin`-vexpress-v2p-ca9.dtb"
+        QEMUOPTIONS="-dtb $DTB $QEMUOPTIONS -cpu cortex-a9"
+    fi
 fi
 
 if [ "$MACHINE" = "qemuarm64" ]; then
-- 
2.1.4


