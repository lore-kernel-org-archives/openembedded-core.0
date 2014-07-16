Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 98758705ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:16:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2014 14:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="544425850"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2014 14:16:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 14:16:01 +0000
Message-Id: <29495da3f88bf018007e0ea6955ef28ceb331112.1405520111.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
Subject: [PATCH 5/8] mkefidisk.sh: Improve logging
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
X-List-Received-Date: Wed, 16 Jul 2014 21:16:17 -0000

Add logging functions: error, warn, info, and success, using tput to add
color highlighting.

Use these routines throughout the script, replacing echo statements and
adding "|| error" in several places to eliminate silent failures. Add a
simple exit block which checks for issues encountered while running.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 92 +++++++++++++++++++++++++++++---------------
 1 file changed, 60 insertions(+), 32 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 98c43f5..530b784 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -28,6 +28,29 @@ BOOT_SIZE=20
 # 5% for swap
 SWAP_RATIO=5
 
+# Logging routines
+WARNINGS=0
+ERRORS=0
+CLEAR="$(tput sgr0)"
+INFO="$(tput bold)"
+RED="$(tput setaf 1)$(tput bold)"
+GREEN="$(tput setaf 2)$(tput bold)"
+YELLOW="$(tput setaf 3)$(tput bold)"
+info() {
+	echo "${INFO}$1${CLEAR}"
+}
+error() {
+	ERRORS=$((ERRORS+1))
+	echo "${RED}$1${CLEAR}"
+}
+warn() {
+	WARNINGS=$((WARNINGS+1))
+	echo "${YELLOW}$1${CLEAR}"
+}
+success() {
+	echo "${GREEN}$1${CLEAR}"
+}
+
 usage() {
 	echo "Usage: $(basename $0) DEVICE HDDIMG TARGET_DEVICE"
 	echo "       DEVICE: The device to write the image to, e.g. /dev/sdh"
@@ -37,7 +60,7 @@ usage() {
 
 image_details() {
 	IMG=$1
-	echo "Image details"
+	info "Image details"
 	echo "============="
 	echo "    image: $(stat --printf '%N\n' $IMG)"
 	echo "     size: $(stat -L --printf '%s bytes\n' $IMG)"
@@ -50,7 +73,7 @@ device_details() {
 	DEV=$1
 	BLOCK_SIZE=512
 
-	echo "Device details"
+	info "Device details"
 	echo "=============="
 	echo "  device: $DEVICE"
 	if [ -f "/sys/class/block/$DEV/device/vendor" ]; then
@@ -74,14 +97,13 @@ device_details() {
 unmount_device() {
 	grep -q $DEVICE /proc/mounts
 	if [ $? -eq 0 ]; then
-		echo -n "$DEVICE listed in /proc/mounts, attempting to unmount..."
+		warn "$DEVICE listed in /proc/mounts, attempting to unmount..."
 		umount $DEVICE* 2>/dev/null
 		grep -q $DEVICE /proc/mounts
 		if [ $? -eq 0 ]; then
-			echo "FAILED"
+			error "Failed to unmount $DEVICE"
 			exit 1
 		fi
-		echo "OK"
 	fi
 }
 
@@ -104,13 +126,13 @@ if [ $? -eq 0 ]; then
 fi
 
 if [ ! -w "$DEVICE" ]; then
-	echo "ERROR: Device $DEVICE does not exist or is not writable"
+	error "Device $DEVICE does not exist or is not writable"
 	usage
 	exit 1
 fi
 
 if [ ! -e "$HDDIMG" ]; then
-	echo "ERROR: HDDIMG $HDDIMG does not exist"
+	error "HDDIMG $HDDIMG does not exist"
 	usage
 	exit 1
 fi
@@ -127,7 +149,7 @@ unmount_device
 #
 image_details $HDDIMG
 device_details $(basename $DEVICE)
-echo -n "Prepare EFI image on $DEVICE [y/N]? "
+echo -n "${INFO}Prepare EFI image on $DEVICE [y/N]?${CLEAR} "
 read RESPONSE
 if [ "$RESPONSE" != "y" ]; then
 	echo "Image creation aborted"
@@ -208,17 +230,16 @@ unmount_device
 echo ""
 echo "Formatting $BOOTFS as vfat..."
 if [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
-	mkfs.vfat -I $BOOTFS -n "EFI"
+	mkfs.vfat -I $BOOTFS -n "EFI" || error "Failed to format $BOOTFS"
 else
-	mkfs.vfat $BOOTFS -n "EFI"
-
+	mkfs.vfat $BOOTFS -n "EFI" || error "Failed to format $BOOTFS"
 fi
 
 echo "Formatting $ROOTFS as ext3..."
-mkfs.ext3 -F $ROOTFS -L "ROOT"
+mkfs.ext3 -F $ROOTFS -L "ROOT" || error "Failed to format $ROOTFS"
 
 echo "Formatting swap partition...($SWAP)"
-mkswap $SWAP
+mkswap $SWAP || error "Failed to prepare swap"
 
 
 #
@@ -228,7 +249,7 @@ echo ""
 echo "Mounting images and device in preparation for installation..."
 TMPDIR=$(mktemp -d mkefidisk-XXX)
 if [ $? -ne 0 ]; then
-	echo "ERROR: Failed to create temporary mounting directory."
+	error "Failed to create temporary mounting directory."
 	exit 1
 fi
 HDDIMG_MNT=$TMPDIR/hddimg
@@ -240,17 +261,15 @@ mkdir $HDDIMG_ROOTFS_MNT
 mkdir $ROOTFS_MNT
 mkdir $BOOTFS_MNT
 
-mount -o loop $HDDIMG $HDDIMG_MNT
-if [ $? -ne 0 ]; then echo "ERROR: Failed to mount $HDDIMG"; fi
+mount -o loop $HDDIMG $HDDIMG_MNT || error "Failed to mount $HDDIMG"
 
-mount -o loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT
-if [ $? -ne 0 ]; then echo "ERROR: Failed to mount rootfs.img"; fi
+mount -o loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT || error "Failed to mount rootfs.img"
 
-mount $ROOTFS $ROOTFS_MNT
-mount $BOOTFS $BOOTFS_MNT
+mount $ROOTFS $ROOTFS_MNT || error "Failed to mount $ROOTFS on $ROOTFS_MNT"
+mount $BOOTFS $BOOTFS_MNT || error "Failed to mount $BOOTFS on $BOOTFS_MNT"
 
 echo "Copying ROOTFS files..."
-cp -a $HDDIMG_ROOTFS_MNT/* $ROOTFS_MNT
+cp -a $HDDIMG_ROOTFS_MNT/* $ROOTFS_MNT || error "Root FS copy failed"
 
 echo "$TARGET_SWAP     swap             swap       defaults              0 0" >> $ROOTFS_MNT/etc/fstab
 
@@ -259,14 +278,14 @@ if [ -d $ROOTFS_MNT/etc/udev/ ] ; then
 	echo "$TARGET_DEVICE" >> $ROOTFS_MNT/etc/udev/mount.blacklist
 fi
 
-umount $ROOTFS_MNT
-umount $HDDIMG_ROOTFS_MNT
+umount $ROOTFS_MNT || error "Failed to unmount $ROOTFS_MNT"
+umount $HDDIMG_ROOTFS_MNT || error "Failed to unmount $HDDIMG_ROOTFS_MNT"
 
 echo "Preparing boot partition..."
 EFIDIR="$BOOTFS_MNT/EFI/BOOT"
-cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT
+cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT || error "Failed to copy vmlinuz"
 # Copy the efi loader and configs (booti*.efi and grub.cfg if it exists)
-cp -r $HDDIMG_MNT/EFI $BOOTFS_MNT
+cp -r $HDDIMG_MNT/EFI $BOOTFS_MNT || error "Failed to copy EFI dir"
 # Silently ignore a missing gummiboot loader dir (we might just be a GRUB image)
 cp -r $HDDIMG_MNT/loader $BOOTFS_MNT 2> /dev/null
 
@@ -281,7 +300,7 @@ cp -r $HDDIMG_MNT/loader $BOOTFS_MNT 2> /dev/null
 # Look for a GRUB installation
 GRUB_CFG="$EFIDIR/grub.cfg"
 if [ -e "$GRUB_CFG" ]; then
-	echo "Configuring GRUB"
+	info "Configuring GRUB"
 	# Delete the install entry
 	sed -i "/menuentry 'install'/,/^}/d" $GRUB_CFG
 	# Delete the initrd lines
@@ -297,7 +316,7 @@ fi
 GUMMI_ENTRIES="$BOOTFS_MNT/loader/entries"
 GUMMI_CFG="$GUMMI_ENTRIES/boot.conf"
 if [ -d "$GUMMI_ENTRIES" ]; then
-	echo "Configuring Gummiboot"
+	info "Configuring Gummiboot"
 	# remove the install target if it exists
 	rm $GUMMI_ENTRIES/install.conf &> /dev/null
 
@@ -311,12 +330,21 @@ fi
 
 # Ensure we have at least one EFI bootloader configured
 if [ ! -e $GRUB_CFG ] && [ ! -e $GUMMI_CFG ]; then
-	echo "ERROR: No EFI bootloader configuration found"
+	error "No EFI bootloader configuration found"
 fi
 
-umount $BOOTFS_MNT
-umount $HDDIMG_MNT
-rm -rf $TMPDIR
+umount $BOOTFS_MNT || error "Failed to unmount $BOOTFS_MNT"
+umount $HDDIMG_MNT || error "Failed to unmount $HDDIMG_MNT"
+rm -rf $TMPDIR || error "Failed to cleanup $TMPDIR"
 sync
 
-echo "Installation complete"
+if [ $WARNINGS -ne 0 ] && [ $ERRORS -eq 0 ]; then
+	echo "${YELLOW}Installation completed with warnings${CLEAR}"
+	echo "${YELLOW}Warnings: $WARNINGS${CLEAR}"
+elif [ $ERRORS -ne 0 ]; then
+	echo "${RED}Installation encountered errors${CLEAR}"
+	echo "${RED}Errors: $ERRORS${CLEAR}"
+	echo "${YELLOW}Warnings: $WARNINGS${CLEAR}"
+else
+	success "Installation completed successfully"
+fi
-- 
2.0.0


