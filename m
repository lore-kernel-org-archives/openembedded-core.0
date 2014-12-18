Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA1897278C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:53:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBI8rwiG021987
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 00:53:58 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 18 Dec 2014 00:53:57 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:51:09 +0800
Message-ID: <753fbc2e1bfa852129865ba40212607cefc6ad09.1418885581.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418885577.git.kai.kang@windriver.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/19] runqemu: add qemuarm64 support.
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
X-List-Received-Date: Thu, 18 Dec 2014 08:53:58 -0000
Content-Type: text/plain

Update scripts runqemu and runqemu-internal to support to boot
qemuarm64.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 scripts/runqemu          |  5 ++++-
 scripts/runqemu-internal | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ff64a1d..da35bb8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -108,7 +108,7 @@ process_filename() {
 while true; do
     arg=${1}
     case "$arg" in
-        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | \
+        "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
         "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
@@ -301,6 +301,9 @@ QEMUX86_64_DEFAULT_FSTYPE=ext3
 QEMUARM_DEFAULT_KERNEL=zImage-qemuarm.bin
 QEMUARM_DEFAULT_FSTYPE=ext3
 
+QEMUARM64_DEFAULT_KERNEL=Image-qemuarm64.bin
+QEMUARM64_DEFAULT_FSTYPE=ext3
+
 QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
 QEMUMIPS_DEFAULT_FSTYPE=ext3
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 38745dd..c219419 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -50,6 +50,9 @@ else
         "qemuarm")
             mem_size=128
             ;;
+        "qemuarm64")
+            mem_size=128
+            ;;
         "qemumicroblaze")
             mem_size=64
             ;;
@@ -260,8 +263,17 @@ else
             DROOT="/dev/hda"
             ROOTFS_OPTIONS="-hda $ROOTFS"
         fi
+        if [ "$MACHINE" = "qemuarm64" ]; then
+            QEMU_NETWORK_CMD="-netdev user,id=net0 -device virtio-net-device,netdev=net0"
+            DROOT="/dev/vda"
+            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS -device virtio-blk-device,drive=disk0"
+        fi
+
         KERNCMDLINE="mem=$QEMU_MEMORY"
         QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
+        if [ $MACHINE = 'qemuarm64' ]; then
+            QEMU_UI_OPTIONS="-nographic"
+        fi
 
         NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
         export NFS_INSTANCE
@@ -274,6 +286,7 @@ fi
 
 case "$MACHINE" in
     "qemuarm") ;;
+    "qemuarm64") ;;
     "qemumicroblaze") ;;
     "qemumips") ;;
     "qemumipsel") ;;
@@ -362,6 +375,19 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     fi
 fi
 
+if [ "$MACHINE" = "qemuarm64" ]; then
+    QEMU=qemu-system-aarch64
+
+    export QEMU_AUDIO_DRV="none"
+    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
+        KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off"
+        # qemu-system-aarch64 only support '-machine virt -cpu cortex-a57' for now
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
+    fi
+fi
+
+
 if [ "$MACHINE" = "qemux86" ]; then
     QEMU=qemu-system-i386
     if [ "$KVM_ACTIVE" = "yes" ]; then
-- 
1.9.1


