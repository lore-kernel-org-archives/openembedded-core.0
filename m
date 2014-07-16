Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 55146705AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:16:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Jul 2014 14:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="574300360"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2014 14:16:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 14:16:04 +0000
Message-Id: <b436a0bb9c34ccfb37c3c561eb9dd8fb64fd87de.1405520111.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
Subject: [PATCH 8/8] mkefidisk.sh: Reduce output and add verbose flag
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

Remove superfluous output from commands, add a -v verbose flag, and
cleanup output.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 114 +++++++++++++++++++++++++------------------
 1 file changed, 67 insertions(+), 47 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 85e58ef..7ec373e 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -20,6 +20,10 @@
 
 LANG=C
 
+# Set to 1 to enable additional output
+DEBUG=0
+OUT="/dev/null"
+
 #
 # Defaults
 #
@@ -30,7 +34,7 @@ SWAP_RATIO=5
 
 # Cleanup after die()
 cleanup() {
-	echo "Syncing and unmounting devices..."
+	debug "Syncing and unmounting devices"
 	# Unmount anything we mounted
 	unmount $ROOTFS_MNT || error "Failed to unmount $ROOTFS_MNT"
 	unmount $BOOTFS_MNT || error "Failed to unmount $BOOTFS_MNT"
@@ -38,7 +42,7 @@ cleanup() {
 	unmount $HDDIMG_MNT || error "Failed to unmount $HDDIMG_MNT"
 
 	# Remove the TMPDIR
-	echo "Removing temporary files..."
+	debug "Removing temporary files"
 	if [ -d "$TMPDIR" ]; then
 		rm -rf $TMPDIR || error "Failed to remove $TMPDIR"
 	fi
@@ -71,9 +75,15 @@ die() {
 	cleanup
 	exit 1
 }
+debug() {
+	if [ $DEBUG -eq 1 ]; then
+		echo "$1"
+	fi
+}
 
 usage() {
-	echo "Usage: $(basename $0) DEVICE HDDIMG TARGET_DEVICE"
+	echo "Usage: $(basename $0) [-v] DEVICE HDDIMG TARGET_DEVICE"
+	echo "       -v: Verbose debug"
 	echo "       DEVICE: The device to write the image to, e.g. /dev/sdh"
 	echo "       HDDIMG: The hddimg file to generate the efi disk from"
 	echo "       TARGET_DEVICE: The device the target will boot from, e.g.  /dev/mmcblk0"
@@ -82,7 +92,6 @@ usage() {
 image_details() {
 	IMG=$1
 	info "Image details"
-	echo "============="
 	echo "    image: $(stat --printf '%N\n' $IMG)"
 	echo "     size: $(stat -L --printf '%s bytes\n' $IMG)"
 	echo " modified: $(stat -L --printf '%y\n' $IMG)"
@@ -95,7 +104,6 @@ device_details() {
 	BLOCK_SIZE=512
 
 	info "Device details"
-	echo "=============="
 	echo "  device: $DEVICE"
 	if [ -f "/sys/class/block/$DEV/device/vendor" ]; then
 		echo "  vendor: $(cat /sys/class/block/$DEV/device/vendor)"
@@ -118,7 +126,7 @@ device_details() {
 unmount_device() {
 	grep -q $DEVICE /proc/mounts
 	if [ $? -eq 0 ]; then
-		warn "$DEVICE listed in /proc/mounts, attempting to unmount..."
+		warn "$DEVICE listed in /proc/mounts, attempting to unmount"
 		umount $DEVICE* 2>/dev/null
 		return $?
 	fi
@@ -128,7 +136,7 @@ unmount_device() {
 unmount() {
 	grep -q $1 /proc/mounts
 	if [ $? -eq 0 ]; then
-		echo "Unmounting $1..."
+		debug "Unmounting $1"
 		umount $1
 		return $?
 	fi
@@ -138,11 +146,17 @@ unmount() {
 #
 # Parse and validate arguments
 #
-if [ $# -ne 3 ]; then
+if [ $# -lt 3 ] || [ $# -gt 4 ]; then
 	usage
 	exit 1
 fi
 
+if [ "$1" = "-v" ]; then
+	DEBUG=1
+	OUT="1"
+	shift
+fi
+
 DEVICE=$1
 HDDIMG=$2
 TARGET_DEVICE=$3
@@ -230,34 +244,39 @@ fi
 TARGET_ROOTFS=$TARGET_DEVICE${TARGET_PART_PREFIX}2
 TARGET_SWAP=$TARGET_DEVICE${TARGET_PART_PREFIX}3
 
-echo "*****************"
-echo "Boot partition size:   $BOOT_SIZE MB ($BOOTFS)"
-echo "ROOTFS partition size: $ROOTFS_SIZE MB ($ROOTFS)"
-echo "Swap partition size:   $SWAP_SIZE MB ($SWAP)"
-echo "*****************"
-
-echo "Deleting partition table on $DEVICE ..."
-dd if=/dev/zero of=$DEVICE bs=512 count=2 > /dev/null || die "Failed to zero beginning of $DEVICE"
+echo ""
+info "Boot partition size:   $BOOT_SIZE MB ($BOOTFS)"
+info "ROOTFS partition size: $ROOTFS_SIZE MB ($ROOTFS)"
+info "Swap partition size:   $SWAP_SIZE MB ($SWAP)"
+echo ""
 
 # Use MSDOS by default as GPT cannot be reliably distributed in disk image form
 # as it requires the backup table to be on the last block of the device, which
 # of course varies from device to device.
-echo "Creating new partition table (MSDOS) on $DEVICE ..."
-parted $DEVICE mklabel msdos || die "Failed to create MSDOS partition table"
 
-echo "Creating boot partition on $BOOTFS"
-parted $DEVICE mkpart primary 0% $BOOT_SIZE || die "Failed to create BOOT partition"
+info "Partitioning installation media ($DEVICE)"
 
-echo "Enabling boot flag on $BOOTFS"
-parted $DEVICE set 1 boot on || die "Failed to enable boot flag"
+debug "Deleting partition table on $DEVICE"
+dd if=/dev/zero of=$DEVICE bs=512 count=2 >$OUT 2>1 || die "Failed to zero beginning of $DEVICE"
 
-echo "Creating ROOTFS partition on $ROOTFS"
-parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END || die "Failed to create ROOTFS partition"
+debug "Creating new partition table (MSDOS) on $DEVICE"
+parted $DEVICE mklabel msdos >$OUT 2>1 || die "Failed to create MSDOS partition table"
 
-echo "Creating swap partition on $SWAP"
-parted $DEVICE mkpart primary $SWAP_START 100% || die "Failed to create SWAP partition"
+debug "Creating boot partition on $BOOTFS"
+parted $DEVICE mkpart primary 0% $BOOT_SIZE >$OUT 2>1 || die "Failed to create BOOT partition"
 
-parted $DEVICE print
+debug "Enabling boot flag on $BOOTFS"
+parted $DEVICE set 1 boot on >$OUT 2>1 || die "Failed to enable boot flag"
+
+debug "Creating ROOTFS partition on $ROOTFS"
+parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END >$OUT 2>1 || die "Failed to create ROOTFS partition"
+
+debug "Creating swap partition on $SWAP"
+parted $DEVICE mkpart primary $SWAP_START 100% >$OUT 2>1 || die "Failed to create SWAP partition"
+
+if [ $DEBUG -eq 1 ]; then
+	parted $DEVICE print
+fi
 
 
 #
@@ -269,38 +288,37 @@ unmount_device || die "Failed to unmount $DEVICE partitions"
 #
 # Format $DEVICE partitions
 #
-echo ""
-echo "Formatting $BOOTFS as vfat..."
+info "Formating partitions"
+debug "Formatting $BOOTFS as vfat"
 if [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
-	mkfs.vfat -I $BOOTFS -n "EFI" || die "Failed to format $BOOTFS"
+	mkfs.vfat -I $BOOTFS -n "EFI" >$OUT 2>1 || die "Failed to format $BOOTFS"
 else
-	mkfs.vfat $BOOTFS -n "EFI" || die "Failed to format $BOOTFS"
+	mkfs.vfat $BOOTFS -n "EFI" >$OUT 2>1 || die "Failed to format $BOOTFS"
 fi
 
-echo "Formatting $ROOTFS as ext3..."
-mkfs.ext3 -F $ROOTFS -L "ROOT" || die "Failed to format $ROOTFS"
+debug "Formatting $ROOTFS as ext3"
+mkfs.ext3 -F $ROOTFS -L "ROOT" >$OUT 2>1 || die "Failed to format $ROOTFS"
 
-echo "Formatting swap partition...($SWAP)"
-mkswap $SWAP || die "Failed to prepare swap"
+debug "Formatting swap partition ($SWAP)"
+mkswap $SWAP >$OUT 2>1 || die "Failed to prepare swap"
 
 
 #
 # Installing to $DEVICE
 #
-echo ""
-echo "Mounting images and device in preparation for installation..."
-mount -o loop $HDDIMG $HDDIMG_MNT || error "Failed to mount $HDDIMG"
-mount -o loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT || error "Failed to mount rootfs.img"
-mount $ROOTFS $ROOTFS_MNT || error "Failed to mount $ROOTFS on $ROOTFS_MNT"
-mount $BOOTFS $BOOTFS_MNT || error "Failed to mount $BOOTFS on $BOOTFS_MNT"
+debug "Mounting images and device in preparation for installation"
+mount -o loop $HDDIMG $HDDIMG_MNT >$OUT 2>1 || error "Failed to mount $HDDIMG"
+mount -o loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT >$OUT 2>1 || error "Failed to mount rootfs.img"
+mount $ROOTFS $ROOTFS_MNT >$OUT 2>1 || error "Failed to mount $ROOTFS on $ROOTFS_MNT"
+mount $BOOTFS $BOOTFS_MNT >$OUT 2>1 || error "Failed to mount $BOOTFS on $BOOTFS_MNT"
 
-echo "Preparing boot partition..."
+info "Preparing boot partition"
 EFIDIR="$BOOTFS_MNT/EFI/BOOT"
-cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT || error "Failed to copy vmlinuz"
+cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT >$OUT 2>1 || error "Failed to copy vmlinuz"
 # Copy the efi loader and configs (booti*.efi and grub.cfg if it exists)
-cp -r $HDDIMG_MNT/EFI $BOOTFS_MNT || error "Failed to copy EFI dir"
+cp -r $HDDIMG_MNT/EFI $BOOTFS_MNT >$OUT 2>1 || error "Failed to copy EFI dir"
 # Silently ignore a missing gummiboot loader dir (we might just be a GRUB image)
-cp -r $HDDIMG_MNT/loader $BOOTFS_MNT 2> /dev/null
+cp -r $HDDIMG_MNT/loader $BOOTFS_MNT >$OUT 2>1
 
 # Update the boot loaders configurations for an installed image
 # Remove any existing root= kernel parameters and:
@@ -331,7 +349,7 @@ GUMMI_CFG="$GUMMI_ENTRIES/boot.conf"
 if [ -d "$GUMMI_ENTRIES" ]; then
 	info "Configuring Gummiboot"
 	# remove the install target if it exists
-	rm $GUMMI_ENTRIES/install.conf &> /dev/null
+	rm $GUMMI_ENTRIES/install.conf >$OUT 2>1
 
 	if [ ! -e "$GUMMI_CFG" ]; then
 		echo "ERROR: $GUMMI_CFG not found"
@@ -348,7 +366,7 @@ fi
 
 
 info "Copying ROOTFS files (this may take a while)"
-cp -a $HDDIMG_ROOTFS_MNT/* $ROOTFS_MNT || die "Root FS copy failed"
+cp -a $HDDIMG_ROOTFS_MNT/* $ROOTFS_MNT >$OUT 2>1 || die "Root FS copy failed"
 
 echo "$TARGET_SWAP     swap             swap       defaults              0 0" >> $ROOTFS_MNT/etc/fstab
 
@@ -361,6 +379,7 @@ fi
 # Call cleanup to unmount devices and images and remove the TMPDIR
 cleanup
 
+echo ""
 if [ $WARNINGS -ne 0 ] && [ $ERRORS -eq 0 ]; then
 	echo "${YELLOW}Installation completed with warnings${CLEAR}"
 	echo "${YELLOW}Warnings: $WARNINGS${CLEAR}"
@@ -371,3 +390,4 @@ elif [ $ERRORS -ne 0 ]; then
 else
 	success "Installation completed successfully"
 fi
+echo ""
-- 
2.0.0


