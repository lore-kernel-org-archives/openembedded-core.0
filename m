Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4138B7016E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:53:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2E6r45C001580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:53:05 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:53:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:52:59 -0700
Message-ID: <4c3ba7baae53233bd922f3d9b2b15c7d4ff0da85.1457938286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1457938286.git.liezhi.yang@windriver.com>
References: <cover.1457938286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] runqemu-internal: split the code into functions
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
X-List-Received-Date: Mon, 14 Mar 2016 06:53:04 -0000
Content-Type: text/plain

Use config_<machine> to split the code into separate functions, so that
different machines won't affect each other, and they will have a better
structure.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu-internal |  180 +++++++++++++++++++++++-----------------------
 1 file changed, 89 insertions(+), 91 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index e042161..72221ed 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -38,49 +38,6 @@ mem_set=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-m[[:space:]] *[0-9]*\)'`
 if [ ! -z "$mem_set" ] ; then
 #Get memory setting size from user input
   mem_size=`echo $mem_set | sed 's/-m[[:space:]] *//'`
-else
-    case "$MACHINE" in
-        "qemux86")
-            mem_size=256
-            ;;
-        "qemux86-64")
-            mem_size=256
-            ;;
-        "qemuarm")
-            mem_size=128
-            ;;
-        "qemuarm64")
-            mem_size=512
-            ;;
-        "qemumicroblaze")
-            mem_size=256
-            ;;
-        "qemumips"|"qemumips64")
-            mem_size=256
-            ;;
-        "qemuppc")
-            mem_size=256
-            ;;
-        "qemush4")
-            mem_size=1024
-            ;;
-        "qemuzynq")
-            mem_size=1024
-            ;;
-        *)
-            mem_size=64
-            ;;
-    esac
-
-fi
-
-# QEMU_MEMORY has 'M' appended to mem_size
-QEMU_MEMORY="$mem_size"M
-
-# We need to specify -m <mem_size> to overcome a bug in qemu 0.14.0
-# https://bugs.launchpad.net/ubuntu/+source/qemu-kvm/+bug/584480
-if [ -z "$mem_set" ] ; then
-  SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT -m $mem_size"
 fi
 
 # This file is created when runqemu-gen-tapdevs creates a bank of tap
@@ -267,26 +224,6 @@ else
         fi
 fi
 
-case "$MACHINE" in
-    "qemuarm") ;;
-    "qemuarm64") ;;
-    "qemumicroblaze") ;;
-    "qemumips") ;;
-    "qemumipsel") ;;
-    "qemumips64") ;;
-    "qemush4") ;;
-    "qemuppc") ;;
-    "qemuarmv6") ;;
-    "qemuarmv7") ;;
-    "qemux86") ;;
-    "qemux86-64") ;;
-    "qemuzynq") ;;
-    *)
-        echo "Error: Unsupported machine type $MACHINE"
-        return 1
-    ;;
-esac
-
 if [ ! -f "$KERNEL" -a "$IS_VM" = "false" ]; then
     echo "Error: Kernel image file $KERNEL doesn't exist"
     cleanup
@@ -329,12 +266,25 @@ if [ "$FSTYPE" = "nfs" ]; then
     NFSRUNNING="true"
 fi
 
-if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarmv7" ]; then
+
+set_mem_size() {
+    if [ ! -z "$mem_set" ] ; then
+        #Get memory setting size from user input
+        mem_size=`echo $mem_set | sed 's/-m[[:space:]] *//'`
+    else
+        mem_size=$1
+    fi
+    # QEMU_MEMORY has 'M' appended to mem_size
+    QEMU_MEMORY="$mem_size"M
+
+}
+
+config_qemuarm() {
+    set_mem_size 128
     QEMU=qemu-system-arm
     MACHINE_SUBTYPE=versatilepb
     export QEMU_AUDIO_DRV="none"
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
         KERNCMDLINE="root=$DROOT rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
@@ -354,9 +304,10 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     if [ "$MACHINE" = "qemuarmv7" ]; then
         QEMUOPTIONS="$QEMUOPTIONS -cpu cortex-a8"
     fi
-fi
+}
 
-if [ "$MACHINE" = "qemuarm64" ]; then
+config_qemuarm64() {
+    set_mem_size 512
     QEMU=qemu-system-aarch64
 
     QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
@@ -383,9 +334,10 @@ if [ "$MACHINE" = "qemuarm64" ]; then
         KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $QEMU_UI_OPTIONS"
     fi
-fi
+}
 
-if [ "$MACHINE" = "qemux86" ]; then
+config_qemux86() {
+    set_mem_size 256
     QEMU=qemu-system-i386
     if [ "$KVM_ACTIVE" = "yes" ]; then
         CPU_SUBTYPE=kvm32
@@ -421,9 +373,10 @@ if [ "$MACHINE" = "qemux86" ]; then
     # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
     # qemux86 and qemux86-64. We can use timer interrupt mode for now.
     KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
-fi
+}
 
-if [ "$MACHINE" = "qemux86-64" ]; then
+config_qemux86_64() {
+    set_mem_size 256
     QEMU=qemu-system-x86_64
     if [ "$KVM_ACTIVE" = "yes" ]; then
         CPU_SUBTYPE=kvm64
@@ -457,9 +410,10 @@ if [ "$MACHINE" = "qemux86-64" ]; then
     # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
     # qemux86 and qemux86-64. We can use timer interrupt mode for now.
     KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
-fi
+}
 
-if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemumips64" ]; then
+config_qemumips() {
+    set_mem_size 256
     case "$MACHINE" in
        qemumips)   QEMU=qemu-system-mips ;;
        qemumipsel) QEMU=qemu-system-mipsel ;;
@@ -481,9 +435,10 @@ if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemum
         KERNCMDLINE="root=/dev/nfs console=ttyS0 console=tty nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS"
     fi
-fi
+}
 
-if [ "$MACHINE" = "qemuppc" ]; then
+config_qemuppc() {
+    set_mem_size 256
     QEMU=qemu-system-ppc
     MACHINE_SUBTYPE=mac99
     CPU_SUBTYPE=G4
@@ -506,9 +461,10 @@ if [ "$MACHINE" = "qemuppc" ]; then
         KERNCMDLINE="root=/dev/nfs console=ttyS0 console=tty nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS"
     fi
-fi
+}
 
-if [ "$MACHINE" = "qemush4" ]; then
+config_qemush4() {
+    set_mem_size 1024
     QEMU=qemu-system-sh4
     MACHINE_SUBTYPE=r2d
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
@@ -528,30 +484,72 @@ if [ "$MACHINE" = "qemush4" ]; then
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
         SERIALSTDIO="1"
     fi
-fi
-
-if [ "${FSTYPE:0:3}" = "ext" ]; then
-    KERNCMDLINE="$KERNCMDLINE rootfstype=$FSTYPE"
-fi
+}
 
-if [ "$MACHINE" = "qemumicroblaze" ]; then
-    QEMU=qemu-system-microblazeel
-    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M petalogix-ml605 -serial mon:stdio"
+config_qemuzynq() {
+    set_mem_size 1024
+    QEMU=qemu-system-arm
+    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xilinx-zynq-a9 -serial null -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
+    # zynq serial ports are named 'ttyPS0' and 'ttyPS1', fixup the default values
+    SCRIPT_KERNEL_OPT=$(echo "$SCRIPT_KERNEL_OPT" | sed 's/console=ttyS/console=ttyPS/g')
     if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
         KERNCMDLINE="earlyprintk root=/dev/ram rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS -initrd $ROOTFS"
     fi
-fi
+}
 
-if [ "$MACHINE" = "qemuzynq" ]; then
-    QEMU=qemu-system-arm
-    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xilinx-zynq-a9 -serial null -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
-    # zynq serial ports are named 'ttyPS0' and 'ttyPS1', fixup the default values
-    SCRIPT_KERNEL_OPT=$(echo "$SCRIPT_KERNEL_OPT" | sed 's/console=ttyS/console=ttyPS/g')
+config_qemumicroblaze() {
+    set_mem_size 256
+    QEMU=qemu-system-microblazeel
+    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M petalogix-ml605 -serial mon:stdio"
     if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
         KERNCMDLINE="earlyprintk root=/dev/ram rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS -initrd $ROOTFS"
     fi
+}
+
+case "$MACHINE" in
+    "qemuarm" | "qemuarmv6" | "qemuarmv7")
+        config_qemuarm
+        ;;
+    "qemuarm64")
+        config_qemuarm64
+        ;;
+    "qemux86")
+        config_qemux86
+        ;;
+    "qemux86-64")
+        config_qemux86_64
+        ;;
+    "qemumips" | "qemumipsel" | "qemumips64")
+        config_qemumips
+        ;;
+    "qemuppc")
+        config_qemuppc
+        ;;
+    "qemush4")
+        config_qemush4
+        ;;
+    "qemuzynq")
+        config_qemuzynq
+        ;;
+    "qemumicroblaze")
+        config_qemumicroblaze
+        ;;
+    *)
+        echo "Error: Unsupported machine type $MACHINE"
+        return 1
+    ;;
+esac
+
+# We need to specify -m <mem_size> to overcome a bug in qemu 0.14.0
+# https://bugs.launchpad.net/ubuntu/+source/qemu-kvm/+bug/584480
+if [ -z "$mem_set" ] ; then
+  SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT -m $mem_size"
+fi
+
+if [ "${FSTYPE:0:3}" = "ext" ]; then
+    KERNCMDLINE="$KERNCMDLINE rootfstype=$FSTYPE"
 fi
 
 if [ "$FSTYPE" = "cpio.gz" ]; then
-- 
1.7.9.5


