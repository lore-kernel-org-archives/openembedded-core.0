Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6608C601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:53:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2E6r1dn001565
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:53:01 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:53:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:52:53 -0700
Message-ID: <ccbb1da13fb361ebf4df58ab4e47087a86a1a9b5.1457938286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1457938286.git.liezhi.yang@windriver.com>
References: <cover.1457938286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] runqemu: fix ROOTFS for vmdk
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
X-List-Received-Date: Mon, 14 Mar 2016 06:53:00 -0000
Content-Type: text/plain

* Make it can boot scsi and virtio block drive such as root=/dev/sdX and
  /dev/vdX.

* Drop VM from help info, id doesn't work, and the script can check
  whether it is a vm disk or not.

* Make it can be run by:
  $ runqemu tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.vmdk
  or:
  $ runqemu qemux86-64 vmdk

[YOCTO #9170]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu          |   77 ++++++++++++++++++++++++----------------------
 scripts/runqemu-internal |   28 ++++++++++++-----
 2 files changed, 60 insertions(+), 45 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 48b7551..771aa38 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -19,35 +19,36 @@
 
 usage() {
     MYNAME=`basename $0`
-    echo ""
-    echo "Usage: you can run this script with any valid combination"
-    echo "of the following environment variables (in any order):"
-    echo "  KERNEL - the kernel image file to use"
-    echo "  ROOTFS - the rootfs image file or nfsroot directory to use"
-    echo "  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)"
-    echo "  RAMFS - boot a ramfs-based image"
-    echo "  ISO - boot an ISO image"
-    echo "  VM - boot a virtual machine image (= a file representing a full disk with boot loader)"
-    echo "  Simplified QEMU command-line options can be passed with:"
-    echo "    nographic - disables video console"
-    echo "    serial - enables a serial console on /dev/ttyS0"
-    echo "    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)"
-    echo "    kvm-vhost - enables KVM with vhost support when running qemux86/qemux86-64 (VT-capable CPU required)"
-    echo "    publicvnc - enable a VNC server open to all hosts"
-    echo "  qemuparams=\"xyz\" - specify custom parameters to QEMU"
-    echo "  bootparams=\"xyz\" - specify custom kernel parameters during boot"
-    echo ""
-    echo "Examples:"
-    echo "  $MYNAME qemuarm"
-    echo "  $MYNAME qemux86-64 core-image-sato ext4"
-    echo "  $MYNAME qemux86-64 wic-image-minimal wic"
-    echo "  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial"
-    echo "  $MYNAME qemux86 ramfs"
-    echo "  $MYNAME qemux86 iso"
-    echo "  $MYNAME qemux86 qemuparams=\"-m 256\""
-    echo "  $MYNAME qemux86 bootparams=\"psplash=false\""
-    echo "  $MYNAME path/to/<image>-<machine>.vmdk"
-    echo "  $MYNAME path/to/<image>-<machine>.wic"
+cat <<_EOF
+
+Usage: you can run this script with any valid combination
+of the following environment variables (in any order):
+  KERNEL - the kernel image file to use
+  ROOTFS - the rootfs image file or nfsroot directory to use
+  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
+  RAMFS - boot a ramfs-based image
+  ISO - boot an ISO image
+  Simplified QEMU command-line options can be passed with:
+    nographic - disables video console
+    serial - enables a serial console on /dev/ttyS0
+    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)
+    kvm-vhost - enables KVM with vhost support when running qemux86/qemux86-64 (VT-capable CPU required)
+    publicvnc - enable a VNC server open to all hosts
+  qemuparams="xyz" - specify custom parameters to QEMU
+  bootparams="xyz" - specify custom kernel parameters during boot
+
+Examples:
+  $MYNAME qemuarm
+  $MYNAME qemux86-64 core-image-sato ext4
+  $MYNAME qemux86-64 wic-image-minimal wic
+  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
+  $MYNAME qemux86 ramfs
+  $MYNAME qemux86 iso
+  $MYNAME qemux86 qemuparams="-m 256"
+  $MYNAME qemux86 bootparams="psplash=false"
+  $MYNAME path/to/<image>-<machine>.vmdk
+  $MYNAME path/to/<image>-<machine>.wic
+_EOF
     exit 1
 }
 
@@ -63,7 +64,6 @@ error() {
 MACHINE=${MACHINE:=""}
 KERNEL=${KERNEL:=""}
 ROOTFS=${ROOTFS:=""}
-VM=${VM:=""}
 FSTYPE=${FSTYPE:=""}
 LAZY_ROOTFS=""
 SCRIPT_QEMU_OPT=""
@@ -101,6 +101,7 @@ process_filename() {
 	/hddimg/|/hdddirect/|/vmdk/)
 		FSTYPE=$EXT
 		VM=$filename
+		ROOTFS=$filename
 		;;
 	*)
 		error "unknown file arg [$filename]"
@@ -118,7 +119,7 @@ while true; do
             [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
-        "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs" | "hddimg" | "hdddirect" | "wic" )
+        "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs" | "hddimg" | "hdddirect" | "wic" | "vmdk")
             [ -z "$FSTYPE" -o "$FSTYPE" = "$arg" ] && FSTYPE=$arg || \
                 error "conflicting FSTYPE types [$FSTYPE] and [$arg]"
             ;;
@@ -127,8 +128,8 @@ while true; do
             RAMFS=true
             ;;
         "iso")
-	    FSTYPE=iso
-	    ISOFS=true
+            FSTYPE=iso
+            ISOFS=true
 	    ;;
         "nographic")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
@@ -142,7 +143,7 @@ while true; do
         "tcpserial="*)
             TCPSERIAL_PORTNUM=${arg##tcpserial=}
             ;;
-	"biosdir="*)
+        "biosdir="*)
             CUSTOMBIOSDIR="${arg##biosdir=}"
 	    ;;
         "biosfilename="*)
@@ -187,7 +188,7 @@ while true; do
             ;;
         *-image*)
             [ -z "$ROOTFS" ] || \
-		error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
+        		error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
             if [ -f "$arg" ]; then
                 process_filename $arg
             elif [ -d "$arg" ]; then
@@ -237,7 +238,7 @@ fi
 
 # Report errors for missing combinations of options
 if [ -z "$MACHINE" -a -z "$KERNEL" -a -z "$VM" -a "$FSTYPE" != "wic" ]; then
-    error "you must specify at least a MACHINE, VM, or KERNEL argument"
+    error "you must specify at least a MACHINE or KERNEL argument"
 fi
 if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
     error "NFS booting without an explicit ROOTFS path is not yet supported"
@@ -489,7 +490,7 @@ if [ "$LAZY_ROOTFS" = "true" ]; then
     fi
 fi
 
-if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" ]; then
+if [ -z "$ROOTFS" ]; then
     setup_path_vars 1
     T=$DEPLOY_DIR_IMAGE
     eval rootfs_list=\$${machine2}_DEFAULT_ROOTFS
@@ -497,6 +498,8 @@ if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTY
 
     if [ -z "$ROOTFS" ]; then
         error "Unable to determine default rootfs for MACHINE [$MACHINE]"
+    elif [ "x$FSTYPE" = "xvmdk" -o "x$FSTYPE" = "xhddimg" -o "x$FSTYPE" = "xhdddirect" ]; then
+		VM=$ROOTFS
     fi
 fi
 # ROOTFS is now set for all cases, now expand it to be an absolute path, it should exist at this point
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index ebed2bd..9d5d6af 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -28,7 +28,6 @@
 #   ROOTFS - the disk image file to use
 #
 
-
 mem_size=-1
 
 #Get rid of <> and get the contents of extra qemu running params
@@ -720,18 +719,31 @@ elif [ "$NUM_SERIAL_OPTS" = "1" ]; then
     SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $SECOND_SERIAL_OPT"
 fi
 
-
 echo "Running $QEMU..."
 # -no-reboot is a mandatory option - see bug #100
 if [ "$FSTYPE" = "vmdk" -o "$FSTYPE" = "hddimg" -o "$FSTYPE" = "hdddirect" ]; then
-    echo $QEMUBIN $VM $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
-    LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN $VM $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
+    # Check root=/dev/sdX or root=/dev/vdX
+    [ ! -e "$VM" ] && error "VM image is not found!"
+    if grep -q 'root=/dev/sd' $VM; then
+        echo "Using scsi drive"
+        VM_DRIVE="-drive if=none,id=hd,file=$VM -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd"
+    elif grep -q 'root=/dev/vd' $VM; then
+        echo "Using virtio block drive"
+        VM_DRIVE="-drive if=virtio,file=$VM"
+    else
+        VM_DRIVE=$VM
+    fi
+    QEMU_FIRE="$QEMUBIN $VM_DRIVE $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
+    echo $QEMU_FIRE
+    LD_PRELOAD="$GL_LD_PRELOAD" $QEMU_FIRE
 elif [ "$FSTYPE" = "iso" -o "$FSTYPE" = "wic" ]; then
-    echo $QEMUBIN $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
-    LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
+    QEMU_FIRE="$QEMUBIN $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
+    echo $QEMU_FIRE
+    LD_PRELOAD="$GL_LD_PRELOAD" $QEMU_FIRE
 else
-    echo $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SLIRP_CMD $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append '"'$KERNCMDLINE $SCRIPT_KERNEL_OPT'"'
-    LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append "$KERNCMDLINE $SCRIPT_KERNEL_OPT"
+    QEMU_FIRE="$QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SLIRP_CMD $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
+    echo $QEMU_FIRE -append '"'$KERNCMDLINE $SCRIPT_KERNEL_OPT'"'
+    LD_PRELOAD="$GL_LD_PRELOAD" $QEMU_FIRE -append "$KERNCMDLINE $SCRIPT_KERNEL_OPT"
 fi
 ret=$?
 if [ "$SLIRP_ENABLED" != "yes" ]; then
-- 
1.7.9.5


