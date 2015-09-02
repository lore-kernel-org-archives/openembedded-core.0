Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id C4ECC77038
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:48:24 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so24956957ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fs6V/wC1PxZw8h9o49YvN8EM5hZdK2blNkXx3P7XyXQ=;
	b=iKi8xStcD5naOH/BzUuzP2Y1/zI69bUyAFMfYUNWHrCVkUSMRV2S/ZwE0SqXmYLj9p
	IKvL/x0HtRe23pQ9ozOOkOc5ji2cyyf1vhjBpNi0BW0NrIJ1/DWkQLv9FVXVlsVVGycp
	f8XyCeY85UvwMVWPUJLDNOAXXmQWyBLgBdlxxRHEojRbcSgbRgdUI3I55oXxMi1WH8dC
	Ajko/lBRlOnosI8aK+33ZqjznLOh0UvTFVd0c9jATObNuWGaQxcRYGJYBSfpjUmzVLii
	w6l4bYrSeeh6EE4RcS9QVNKWeyt9QwIyg82nRtRRym03PQK8q3pwhwXQyxiltOCpNDSk
	9mDA==
X-Gm-Message-State: ALoCoQlk3h8iPZVfI6m6imaWsxoR3rWdh32rwq5WGaN+CXCM95NB251xFpeBYJShjkoxLRn1aMZh
X-Received: by 10.107.41.142 with SMTP id p136mr20738271iop.19.1441208904430; 
	Wed, 02 Sep 2015 08:48:24 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FD7A.dip0.t-ipconnect.de.
	[93.232.253.122]) by smtp.gmail.com with ESMTPSA id
	o189sm17258398ioe.30.2015.09.02.08.48.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 08:48:23 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:48:37 +0200
Message-Id: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
Subject: [PATCH 01/10] runqemu: support full-disk images
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
X-List-Received-Date: Wed, 02 Sep 2015 15:48:27 -0000

This makes it possible to boot images with multiple partitions (the
ones ending in .hddimg or .hdddirect) in several ways:
   runqemu qemux86 core-image-minimal hddimg
   runqemu tmp/deploy/images/qemux86/core-image-minimal-qemux86.hddimg
   VM=tmp-glibc/deploy/images/qemux86/iot-os-image-qemux86.hddimg FSTYPE=hddimg runqemu

Same for hdddirect.

This is useful for testing initramfs scripts, secure boot (when
switching to UEFI), or boot loaders like syslinux. For testing the
content of the rootfs, the ext4 image is better because that approach
is faster (no need to create another large image during build, rootfs
can be read directly instead of reading boot.img through loop device).

When booting a live image, the kernel, initramfs (if any) and kernel
parameters are taken from the image by the virtual machine's BIOS, so any
additional kernel parameters given to runqemu are ignored. This can be
avoided (already without this change) in a slightly hacky runqemu setup:
   ROOTFS=tmp/deploy/images/qemux86/core-image-minimal-qemux86.hddimg \
   FSTYPE=ext4 \
   KERNEL=tmp/deploy/images/qemux86/bzImage-initramfs-qemux86.bin \
   MACHINE=qemux86 \
   runqemu serial kvm nographic 'bootparams=root=/dev/ram0'

The additional bzImage-initramfs-qemux86.bin kernel here was created
by adding this to local.conf:
   INITRAMFS_IMAGE = "core-image-minimal-initramfs"
   INITRAMFS_IMAGE_BUNDLE = "1"

In the code, the new FSTYPE=hddimg resp. hdddirect behaves almost
exactly like the older vmdk FSTYPE. New types were chosen because it
seemed cleaner than using FSTYPE=vmdk when the actual image pointed to
by VM is not in that format. The downside is that several checks for
FSTYPE=vmdk had to be duplicated for FSTYPE=hddimg.

The VM variable now gets interpreted as "virtual machine disk image"
instead of "vmdk image".
---
 scripts/runqemu          | 24 ++++++++++++++----------
 scripts/runqemu-internal | 10 +++++-----
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8271160..a4d9a23 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -28,7 +28,7 @@ usage() {
     echo "  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)"
     echo "  RAMFS - boot a ramfs-based image"
     echo "  ISO - boot an ISO image"
-    echo "  VM - boot a vmdk image"
+    echo "  VM - boot a virtual machine image (= a file representing a full disk with boot loader)"
     echo "  Simplified QEMU command-line options can be passed with:"
     echo "    nographic - disables video console"
     echo "    serial - enables a serial console on /dev/ttyS0"
@@ -94,7 +94,7 @@ process_filename() {
 		    error "conflicting FSTYPE types [$FSTYPE] and [$EXT]"
 		fi
 		;;
-	/vmdk/)
+	/hddimg/|/hdddirect/|/vmdk/)
 		FSTYPE=$EXT
 		VM=$filename
 		;;
@@ -114,7 +114,7 @@ while true; do
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
-        "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs")
+        "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs" | "hddimg" | "hdddirect" )
             [ -z "$FSTYPE" -o "$FSTYPE" = "$arg" ] && FSTYPE=$arg || \
                 error "conflicting FSTYPE types [$FSTYPE] and [$arg]"
             ;;
@@ -235,12 +235,12 @@ if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
 fi
 
 if [ -z "$MACHINE" ]; then
-    if [ "x$FSTYPE" = "xvmdk" ]; then
+    if [ "x$FSTYPE" = "xvmdk" ] || [ "x$FSTYPE" = "xhddimg" ] || [ "x$FSTYPE" = "xhdddirect" ]; then
         MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
-            error "Unable to set MACHINE from vmdk filename [$VM]"
+            error "Unable to set MACHINE from image filename [$VM]"
         fi
-        echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
+        echo "Set MACHINE to [$MACHINE] based on image [$VM]"
     else
         MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
@@ -436,7 +436,7 @@ if [ -e "$ROOTFS" -a -z "$FSTYPE" ]; then
     fi
 fi
 
-if [ -z "$KERNEL" -a "x$FSTYPE" != "xvmdk" ]; then
+if [ -z "$KERNEL" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" ]; then
     setup_path_vars 1
     eval kernel_file=\$${machine2}_DEFAULT_KERNEL
     KERNEL=$DEPLOY_DIR_IMAGE/$kernel_file
@@ -462,10 +462,14 @@ fi
 if [ "$LAZY_ROOTFS" = "true" ]; then
     setup_path_vars 1
     echo "Assuming $ROOTFS really means $DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE"
-    ROOTFS=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
+    if [ "$FSTYPE" = "hddimg" -o "x$FSTYPE" = "xhdddirect" ]; then
+        VM=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
+    else
+        ROOTFS=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
+    fi
 fi
 
-if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" ]; then
+if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" ]; then
     setup_path_vars 1
     T=$DEPLOY_DIR_IMAGE
     eval rootfs_list=\$${machine2}_DEFAULT_ROOTFS
@@ -481,7 +485,7 @@ ROOTFS=`readlink -f $ROOTFS`
 
 echo ""
 echo "Continuing with the following parameters:"
-if [ "x$FSTYPE" != "xvmdk" ]; then
+if [ "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" ]; then
     echo "KERNEL: [$KERNEL]"
     echo "ROOTFS: [$ROOTFS]"
 else
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index a691a80..1527268 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -315,13 +315,13 @@ case "$MACHINE" in
     ;;
 esac
 
-if [ ! -f "$KERNEL" -a "x$FSTYPE" != "xvmdk" ]; then
+if [ ! -f "$KERNEL" -a "x$FSTYPE" != "xvmdk" -a "x$FSTYPE" != "xhddimg" -a "x$FSTYPE" != "xhdddirect" ]; then
     echo "Error: Kernel image file $KERNEL doesn't exist"
     cleanup
     return 1
 fi
 
-if [ "$FSTYPE" != "nfs" -a "$FSTYPE" != "vmdk" -a ! -f "$ROOTFS" ]; then
+if [ "$FSTYPE" != "nfs" -a "$FSTYPE" != "vmdk" -a "$FSTYPE" != "hddimg" -a "$FSTYPE" != "hdddirect" -a ! -f "$ROOTFS" ]; then
     echo "Error: Image file $ROOTFS doesn't exist"
     cleanup
     return 1
@@ -440,7 +440,7 @@ if [ "$MACHINE" = "qemux86" ]; then
         KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
     fi
-    if [ "$FSTYPE" = "vmdk" ]; then
+    if [ "$FSTYPE" = "vmdk" -o "$FSTYPE" = "hddimg" -o "$FSTYPE" = "hdddirect" ]; then
         QEMUOPTIONS="$QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
     fi
     # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
@@ -476,7 +476,7 @@ if [ "$MACHINE" = "qemux86-64" ]; then
         KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $QEMU_UI_OPTIONS"
     fi
-    if [ "$FSTYPE" = "vmdk" ]; then
+    if [ "$FSTYPE" = "vmdk" -o "$FSTYPE" = "hddimg" -o "$FSTYPE" = "hdddirect" ]; then
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $QEMU_UI_OPTIONS"
     fi
     # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
@@ -702,7 +702,7 @@ fi
 
 echo "Running $QEMU..."
 # -no-reboot is a mandatory option - see bug #100
-if [ "$FSTYPE" = "vmdk" ]; then
+if [ "$FSTYPE" = "vmdk" -o "$FSTYPE" = "hddimg" -o "$FSTYPE" = "hdddirect" ]; then
     echo $QEMUBIN $VM $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
     LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN $VM $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
 elif [ "$FSTYPE" = "iso" ]; then
-- 
2.1.4


