Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A9CB57018F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:16:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2014 14:10:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="544425851"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2014 14:16:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 14:16:02 +0000
Message-Id: <1f674b1aa2bf06ec16f2dcf82dd33d7c0ba11da6.1405520111.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
Subject: [PATCH 6/8] mkefidisk.sh: Add die() and cleanup() routines
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
X-List-Received-Date: Wed, 16 Jul 2014 21:16:18 -0000

Currently the script will attempt to continue even after a fatal error.
Add a die() routine which will abort in the case of a fatal error and
call a cleanup() routine to unmount any images or devices and remove the
TMPDIR.

Move the variable assignment and directory creation earlier in the
script, making it more obvious what we need to clean up.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 115 +++++++++++++++++++++++++------------------
 1 file changed, 68 insertions(+), 47 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 530b784..6cc6b78 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -28,6 +28,22 @@ BOOT_SIZE=20
 # 5% for swap
 SWAP_RATIO=5
 
+# Cleanup after die()
+cleanup() {
+	echo "Syncing and unmounting devices..."
+	# Unmount anything we mounted
+	unmount $ROOTFS_MNT || error "Failed to unmount $ROOTFS_MNT"
+	unmount $BOOTFS_MNT || error "Failed to unmount $BOOTFS_MNT"
+	unmount $HDDIMG_ROOTFS_MNT || error "Failed to unmount $HDDIMG_ROOTFS_MNT"
+	unmount $HDDIMG_MNT || error "Failed to unmount $HDDIMG_MNT"
+
+	# Remove the TMPDIR
+	echo "Removing temporary files..."
+	if [ -d "$TMPDIR" ]; then
+		rm -rf $TMPDIR || error "Failed to remove $TMPDIR"
+	fi
+}
+
 # Logging routines
 WARNINGS=0
 ERRORS=0
@@ -50,6 +66,11 @@ warn() {
 success() {
 	echo "${GREEN}$1${CLEAR}"
 }
+die() {
+	error $1
+	cleanup
+	exit 1
+}
 
 usage() {
 	echo "Usage: $(basename $0) DEVICE HDDIMG TARGET_DEVICE"
@@ -99,14 +120,20 @@ unmount_device() {
 	if [ $? -eq 0 ]; then
 		warn "$DEVICE listed in /proc/mounts, attempting to unmount..."
 		umount $DEVICE* 2>/dev/null
-		grep -q $DEVICE /proc/mounts
-		if [ $? -eq 0 ]; then
-			error "Failed to unmount $DEVICE"
-			exit 1
-		fi
+		return $?
 	fi
+	return 0
 }
 
+unmount() {
+	grep -q $1 /proc/mounts
+	if [ $? -eq 0 ]; then
+		echo "Unmounting $1..."
+		umount $1
+		return $?
+	fi
+	return 0
+}
 
 #
 # Parse and validate arguments
@@ -126,23 +153,24 @@ if [ $? -eq 0 ]; then
 fi
 
 if [ ! -w "$DEVICE" ]; then
-	error "Device $DEVICE does not exist or is not writable"
 	usage
-	exit 1
+	die "Device $DEVICE does not exist or is not writable"
 fi
 
 if [ ! -e "$HDDIMG" ]; then
-	error "HDDIMG $HDDIMG does not exist"
 	usage
-	exit 1
+	die "HDDIMG $HDDIMG does not exist"
 fi
 
+#
+# Ensure the hddimg is not mounted
+#
+unmount "$HDDIMG" || die "Failed to unmount $HDDIMG"
 
 #
 # Check if any $DEVICE partitions are mounted
 #
-unmount_device
-
+unmount_device || die "Failed to unmount $DEVICE"
 
 #
 # Confirm device with user
@@ -158,12 +186,26 @@ fi
 
 
 #
+# Prepare the temporary working space
+#
+TMPDIR=$(mktemp -d mkefidisk-XXX) || die "Failed to create temporary mounting directory."
+HDDIMG_MNT=$TMPDIR/hddimg
+HDDIMG_ROOTFS_MNT=$TMPDIR/hddimg_rootfs
+ROOTFS_MNT=$TMPDIR/rootfs
+BOOTFS_MNT=$TMPDIR/bootfs
+mkdir $HDDIMG_MNT || die "Failed to create $HDDIMG_MNT"
+mkdir $HDDIMG_ROOTFS_MNT || die "Failed to create $HDDIMG_ROOTFS_MNT"
+mkdir $ROOTFS_MNT || die "Failed to create $ROOTFS_MNT"
+mkdir $BOOTFS_MNT || die "Failed to create $BOOTFS_MNT"
+
+
+#
 # Partition $DEVICE
 #
 DEVICE_SIZE=$(parted $DEVICE unit mb print | grep ^Disk | cut -d" " -f 3 | sed -e "s/MB//")
 # If the device size is not reported there may not be a valid label
 if [ "$DEVICE_SIZE" = "" ] ; then
-	parted $DEVICE mklabel msdos
+	parted $DEVICE mklabel msdos || die "Failed to create MSDOS partition table"
 	DEVICE_SIZE=$(parted $DEVICE unit mb print | grep ^Disk | cut -d" " -f 3 | sed -e "s/MB//")
 fi
 SWAP_SIZE=$((DEVICE_SIZE*SWAP_RATIO/100))
@@ -195,25 +237,25 @@ echo "Swap partition size:   $SWAP_SIZE MB ($SWAP)"
 echo "*****************"
 
 echo "Deleting partition table on $DEVICE ..."
-dd if=/dev/zero of=$DEVICE bs=512 count=2
+dd if=/dev/zero of=$DEVICE bs=512 count=2 > /dev/null || die "Failed to zero beginning of $DEVICE"
 
 # Use MSDOS by default as GPT cannot be reliably distributed in disk image form
 # as it requires the backup table to be on the last block of the device, which
 # of course varies from device to device.
 echo "Creating new partition table (MSDOS) on $DEVICE ..."
-parted $DEVICE mklabel msdos
+parted $DEVICE mklabel msdos || die "Failed to create MSDOS partition table"
 
 echo "Creating boot partition on $BOOTFS"
-parted $DEVICE mkpart primary 0% $BOOT_SIZE
+parted $DEVICE mkpart primary 0% $BOOT_SIZE || die "Failed to create BOOT partition"
 
 echo "Enabling boot flag on $BOOTFS"
-parted $DEVICE set 1 boot on
+parted $DEVICE set 1 boot on || die "Failed to enable boot flag"
 
 echo "Creating ROOTFS partition on $ROOTFS"
-parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END
+parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END || die "Failed to create ROOTFS partition"
 
 echo "Creating swap partition on $SWAP"
-parted $DEVICE mkpart primary $SWAP_START 100%
+parted $DEVICE mkpart primary $SWAP_START 100% || die "Failed to create SWAP partition"
 
 parted $DEVICE print
 
@@ -221,7 +263,7 @@ parted $DEVICE print
 #
 # Check if any $DEVICE partitions are mounted after partitioning
 #
-unmount_device
+unmount_device || die "Failed to unmount $DEVICE partitions"
 
 
 #
@@ -230,16 +272,16 @@ unmount_device
 echo ""
 echo "Formatting $BOOTFS as vfat..."
 if [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
-	mkfs.vfat -I $BOOTFS -n "EFI" || error "Failed to format $BOOTFS"
+	mkfs.vfat -I $BOOTFS -n "EFI" || die "Failed to format $BOOTFS"
 else
-	mkfs.vfat $BOOTFS -n "EFI" || error "Failed to format $BOOTFS"
+	mkfs.vfat $BOOTFS -n "EFI" || die "Failed to format $BOOTFS"
 fi
 
 echo "Formatting $ROOTFS as ext3..."
-mkfs.ext3 -F $ROOTFS -L "ROOT" || error "Failed to format $ROOTFS"
+mkfs.ext3 -F $ROOTFS -L "ROOT" || die "Failed to format $ROOTFS"
 
 echo "Formatting swap partition...($SWAP)"
-mkswap $SWAP || error "Failed to prepare swap"
+mkswap $SWAP || die "Failed to prepare swap"
 
 
 #
@@ -247,24 +289,8 @@ mkswap $SWAP || error "Failed to prepare swap"
 #
 echo ""
 echo "Mounting images and device in preparation for installation..."
-TMPDIR=$(mktemp -d mkefidisk-XXX)
-if [ $? -ne 0 ]; then
-	error "Failed to create temporary mounting directory."
-	exit 1
-fi
-HDDIMG_MNT=$TMPDIR/hddimg
-HDDIMG_ROOTFS_MNT=$TMPDIR/hddimg_rootfs
-ROOTFS_MNT=$TMPDIR/rootfs
-BOOTFS_MNT=$TMPDIR/bootfs
-mkdir $HDDIMG_MNT
-mkdir $HDDIMG_ROOTFS_MNT
-mkdir $ROOTFS_MNT
-mkdir $BOOTFS_MNT
-
 mount -o loop $HDDIMG $HDDIMG_MNT || error "Failed to mount $HDDIMG"
-
 mount -o loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT || error "Failed to mount rootfs.img"
-
 mount $ROOTFS $ROOTFS_MNT || error "Failed to mount $ROOTFS on $ROOTFS_MNT"
 mount $BOOTFS $BOOTFS_MNT || error "Failed to mount $BOOTFS on $BOOTFS_MNT"
 
@@ -278,9 +304,6 @@ if [ -d $ROOTFS_MNT/etc/udev/ ] ; then
 	echo "$TARGET_DEVICE" >> $ROOTFS_MNT/etc/udev/mount.blacklist
 fi
 
-umount $ROOTFS_MNT || error "Failed to unmount $ROOTFS_MNT"
-umount $HDDIMG_ROOTFS_MNT || error "Failed to unmount $HDDIMG_ROOTFS_MNT"
-
 echo "Preparing boot partition..."
 EFIDIR="$BOOTFS_MNT/EFI/BOOT"
 cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT || error "Failed to copy vmlinuz"
@@ -330,13 +353,11 @@ fi
 
 # Ensure we have at least one EFI bootloader configured
 if [ ! -e $GRUB_CFG ] && [ ! -e $GUMMI_CFG ]; then
-	error "No EFI bootloader configuration found"
+	die "No EFI bootloader configuration found"
 fi
 
-umount $BOOTFS_MNT || error "Failed to unmount $BOOTFS_MNT"
-umount $HDDIMG_MNT || error "Failed to unmount $HDDIMG_MNT"
-rm -rf $TMPDIR || error "Failed to cleanup $TMPDIR"
-sync
+# Call cleanup to unmount devices and images and remove the TMPDIR
+cleanup
 
 if [ $WARNINGS -ne 0 ] && [ $ERRORS -eq 0 ]; then
 	echo "${YELLOW}Installation completed with warnings${CLEAR}"
-- 
2.0.0


