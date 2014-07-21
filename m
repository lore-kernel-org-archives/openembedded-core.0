Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8037270656
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 22:46:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jul 2014 15:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,705,1400050800"; d="scan'208";a="576683416"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2014 15:46:04 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 22:45:57 +0000
Message-Id: <3ef5564ecb54ed9e9663eefd2a05390ad890f5cf.1405982758.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/2] mkefidisk.sh: Fix redirection to 1
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
X-List-Received-Date: Mon, 21 Jul 2014 22:46:08 -0000

The current script intends to redirect stderr to stdout, but instead
redirects to a file named 1. No doubt a regex replace error.

Replace all instances of 2>1 with 2>&1.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 7ec373e..44ab8d5 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -257,22 +257,22 @@ echo ""
 info "Partitioning installation media ($DEVICE)"
 
 debug "Deleting partition table on $DEVICE"
-dd if=/dev/zero of=$DEVICE bs=512 count=2 >$OUT 2>1 || die "Failed to zero beginning of $DEVICE"
+dd if=/dev/zero of=$DEVICE bs=512 count=2 >$OUT 2>&1 || die "Failed to zero beginning of $DEVICE"
 
 debug "Creating new partition table (MSDOS) on $DEVICE"
-parted $DEVICE mklabel msdos >$OUT 2>1 || die "Failed to create MSDOS partition table"
+parted $DEVICE mklabel msdos >$OUT 2>&1 || die "Failed to create MSDOS partition table"
 
 debug "Creating boot partition on $BOOTFS"
-parted $DEVICE mkpart primary 0% $BOOT_SIZE >$OUT 2>1 || die "Failed to create BOOT partition"
+parted $DEVICE mkpart primary 0% $BOOT_SIZE >$OUT 2>&1 || die "Failed to create BOOT partition"
 
 debug "Enabling boot flag on $BOOTFS"
-parted $DEVICE set 1 boot on >$OUT 2>1 || die "Failed to enable boot flag"
+parted $DEVICE set 1 boot on >$OUT 2>&1 || die "Failed to enable boot flag"
 
 debug "Creating ROOTFS partition on $ROOTFS"
-parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END >$OUT 2>1 || die "Failed to create ROOTFS partition"
+parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END >$OUT 2>&1 || die "Failed to create ROOTFS partition"
 
 debug "Creating swap partition on $SWAP"
-parted $DEVICE mkpart primary $SWAP_START 100% >$OUT 2>1 || die "Failed to create SWAP partition"
+parted $DEVICE mkpart primary $SWAP_START 100% >$OUT 2>&1 || die "Failed to create SWAP partition"
 
 if [ $DEBUG -eq 1 ]; then
 	parted $DEVICE print
@@ -291,34 +291,34 @@ unmount_device || die "Failed to unmount $DEVICE partitions"
 info "Formating partitions"
 debug "Formatting $BOOTFS as vfat"
 if [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
-	mkfs.vfat -I $BOOTFS -n "EFI" >$OUT 2>1 || die "Failed to format $BOOTFS"
+	mkfs.vfat -I $BOOTFS -n "EFI" >$OUT 2>&1 || die "Failed to format $BOOTFS"
 else
-	mkfs.vfat $BOOTFS -n "EFI" >$OUT 2>1 || die "Failed to format $BOOTFS"
+	mkfs.vfat $BOOTFS -n "EFI" >$OUT 2>&1 || die "Failed to format $BOOTFS"
 fi
 
 debug "Formatting $ROOTFS as ext3"
-mkfs.ext3 -F $ROOTFS -L "ROOT" >$OUT 2>1 || die "Failed to format $ROOTFS"
+mkfs.ext3 -F $ROOTFS -L "ROOT" >$OUT 2>&1 || die "Failed to format $ROOTFS"
 
 debug "Formatting swap partition ($SWAP)"
-mkswap $SWAP >$OUT 2>1 || die "Failed to prepare swap"
+mkswap $SWAP >$OUT 2>&1 || die "Failed to prepare swap"
 
 
 #
 # Installing to $DEVICE
 #
 debug "Mounting images and device in preparation for installation"
-mount -o loop $HDDIMG $HDDIMG_MNT >$OUT 2>1 || error "Failed to mount $HDDIMG"
-mount -o loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT >$OUT 2>1 || error "Failed to mount rootfs.img"
-mount $ROOTFS $ROOTFS_MNT >$OUT 2>1 || error "Failed to mount $ROOTFS on $ROOTFS_MNT"
-mount $BOOTFS $BOOTFS_MNT >$OUT 2>1 || error "Failed to mount $BOOTFS on $BOOTFS_MNT"
+mount -o loop $HDDIMG $HDDIMG_MNT >$OUT 2>&1 || error "Failed to mount $HDDIMG"
+mount -o loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT >$OUT 2>&1 || error "Failed to mount rootfs.img"
+mount $ROOTFS $ROOTFS_MNT >$OUT 2>&1 || error "Failed to mount $ROOTFS on $ROOTFS_MNT"
+mount $BOOTFS $BOOTFS_MNT >$OUT 2>&1 || error "Failed to mount $BOOTFS on $BOOTFS_MNT"
 
 info "Preparing boot partition"
 EFIDIR="$BOOTFS_MNT/EFI/BOOT"
-cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT >$OUT 2>1 || error "Failed to copy vmlinuz"
+cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT >$OUT 2>&1 || error "Failed to copy vmlinuz"
 # Copy the efi loader and configs (booti*.efi and grub.cfg if it exists)
-cp -r $HDDIMG_MNT/EFI $BOOTFS_MNT >$OUT 2>1 || error "Failed to copy EFI dir"
+cp -r $HDDIMG_MNT/EFI $BOOTFS_MNT >$OUT 2>&1 || error "Failed to copy EFI dir"
 # Silently ignore a missing gummiboot loader dir (we might just be a GRUB image)
-cp -r $HDDIMG_MNT/loader $BOOTFS_MNT >$OUT 2>1
+cp -r $HDDIMG_MNT/loader $BOOTFS_MNT >$OUT 2>&1
 
 # Update the boot loaders configurations for an installed image
 # Remove any existing root= kernel parameters and:
@@ -349,7 +349,7 @@ GUMMI_CFG="$GUMMI_ENTRIES/boot.conf"
 if [ -d "$GUMMI_ENTRIES" ]; then
 	info "Configuring Gummiboot"
 	# remove the install target if it exists
-	rm $GUMMI_ENTRIES/install.conf >$OUT 2>1
+	rm $GUMMI_ENTRIES/install.conf >$OUT 2>&1
 
 	if [ ! -e "$GUMMI_CFG" ]; then
 		echo "ERROR: $GUMMI_CFG not found"
@@ -366,7 +366,7 @@ fi
 
 
 info "Copying ROOTFS files (this may take a while)"
-cp -a $HDDIMG_ROOTFS_MNT/* $ROOTFS_MNT >$OUT 2>1 || die "Root FS copy failed"
+cp -a $HDDIMG_ROOTFS_MNT/* $ROOTFS_MNT >$OUT 2>&1 || die "Root FS copy failed"
 
 echo "$TARGET_SWAP     swap             swap       defaults              0 0" >> $ROOTFS_MNT/etc/fstab
 
-- 
2.0.0


