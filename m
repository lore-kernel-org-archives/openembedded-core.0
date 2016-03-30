Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75E4560017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 07:23:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2U7NFv2018833
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 00:23:15 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 30 Mar 2016 00:23:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 00:23:10 -0700
Message-ID: <cdda3b460f1af06f2fcb15fb035d6d5ce1b88a52.1459322435.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459322435.git.liezhi.yang@windriver.com>
References: <cover.1459322435.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] bootimg.bbclass: merge it into image-live.bbclass
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
X-List-Received-Date: Wed, 30 Mar 2016 07:23:15 -0000
Content-Type: text/plain

They are doing the same things: create live images, merge them into one
bbclass makes it easy to understand.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/bootimg.bbclass    | 304 ---------------------------------------
 meta/classes/gummiboot.bbclass  |   2 +-
 meta/classes/image-live.bbclass | 308 +++++++++++++++++++++++++++++++++++++++-
 meta/classes/image-vm.bbclass   |   2 +-
 4 files changed, 304 insertions(+), 312 deletions(-)
 delete mode 100644 meta/classes/bootimg.bbclass

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
deleted file mode 100644
index d9ed7db..0000000
--- a/meta/classes/bootimg.bbclass
+++ /dev/null
@@ -1,304 +0,0 @@
-# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-# Creates a bootable image using syslinux, your kernel and an optional
-# initrd
-
-#
-# End result is two things:
-#
-# 1. A .hddimg file which is an msdos filesystem containing syslinux, a kernel,
-# an initrd and a rootfs image. These can be written to harddisks directly and
-# also booted on USB flash disks (write them there with dd).
-#
-# 2. A CD .iso image
-
-# Boot process is that the initrd will boot and process which label was selected
-# in syslinux. Actions based on the label are then performed (e.g. installing to
-# an hdd)
-
-# External variables (also used by syslinux.bbclass)
-# ${INITRD} - indicates a list of filesystem images to concatenate and use as an initrd (optional)
-# ${COMPRESSISO} - Transparent compress ISO, reduce size ~40% if set to 1
-# ${NOISO}  - skip building the ISO image if set to 1
-# ${NOHDD}  - skip building the HDD image if set to 1
-# ${HDDIMG_ID} - FAT image volume-id
-# ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
-
-do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
-                        mtools-native:do_populate_sysroot \
-                        cdrtools-native:do_populate_sysroot \
-                        virtual/kernel:do_deploy \
-                        ${@oe.utils.ifelse(d.getVar('COMPRESSISO', False),'zisofs-tools-native:do_populate_sysroot','')}"
-
-PACKAGES = " "
-EXCLUDE_FROM_WORLD = "1"
-
-HDDDIR = "${S}/hddimg"
-ISODIR = "${S}/iso"
-EFIIMGDIR = "${S}/efi_img"
-COMPACT_ISODIR = "${S}/iso.z"
-COMPRESSISO ?= "0"
-
-ISOLINUXDIR ?= "/isolinux"
-ISO_BOOTIMG = "isolinux/isolinux.bin"
-ISO_BOOTCAT = "isolinux/boot.cat"
-MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
-
-BOOTIMG_VOLUME_ID   ?= "boot"
-BOOTIMG_EXTRA_SPACE ?= "512"
-
-EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
-EFI_PROVIDER ?= "grub-efi"
-EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
-
-KERNEL_IMAGETYPE ??= "bzImage"
-
-# Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
-# contain "efi". This way legacy is supported by default if neither is
-# specified, maintaining the original behavior.
-def pcbios(d):
-    pcbios = bb.utils.contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
-    if pcbios == "0":
-        pcbios = bb.utils.contains("MACHINE_FEATURES", "efi", "0", "1", d)
-    return pcbios
-
-PCBIOS = "${@pcbios(d)}"
-PCBIOS_CLASS = "${@['','syslinux'][d.getVar('PCBIOS', True) == '1']}"
-
-inherit ${EFI_CLASS}
-inherit ${PCBIOS_CLASS}
-
-populate() {
-	DEST=$1
-	install -d ${DEST}
-
-	# Install kernel, initrd, and rootfs.img in DEST for all loaders to use.
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${DEST}/vmlinuz
-	
-	# initrd is made of concatenation of multiple filesystem images
-	if [ -n "${INITRD}" ]; then
-		rm -f ${DEST}/initrd
-		for fs in ${INITRD}
-		do
-			if [ -s "${fs}" ]; then
-				cat ${fs} >> ${DEST}/initrd
-			else
-				bbfatal "${fs} is invalid. initrd image creation failed."
-			fi
-		done
-		chmod 0644 ${DEST}/initrd
-	fi
-
-	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
-		install -m 0644 ${ROOTFS} ${DEST}/rootfs.img
-	fi
-
-}
-
-build_iso() {
-	# Only create an ISO if we have an INITRD and NOISO was not set
-	if [ -z "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
-		bbnote "ISO image will not be created."
-		return
-	fi
-	# ${INITRD} is a list of multiple filesystem images
-	for fs in ${INITRD}
-	do
-		if [ ! -s "${fs}" ]; then
-			bbnote "ISO image will not be created. ${fs} is invalid."
-			return
-		fi
-	done
-
-
-	populate ${ISODIR}
-
-	if [ "${PCBIOS}" = "1" ]; then
-		syslinux_iso_populate ${ISODIR}
-	fi
-	if [ "${EFI}" = "1" ]; then
-		efi_iso_populate ${ISODIR}
-		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
-	fi
-
-	# EFI only
-	if [ "${PCBIOS}" != "1" ] && [ "${EFI}" = "1" ] ; then
-		# Work around bug in isohybrid where it requires isolinux.bin
-		# In the boot catalog, even though it is not used
-		mkdir -p ${ISODIR}/${ISOLINUXDIR}
-		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
-	fi
-
-	if [ "${COMPRESSISO}" = "1" ] ; then
-		# create compact directory, compress iso
-		mkdir -p ${COMPACT_ISODIR}
-		mkzftree -z 9 -p 4 -F ${ISODIR}/rootfs.img ${COMPACT_ISODIR}/rootfs.img
-
-		# move compact iso to iso, then remove compact directory
-		mv ${COMPACT_ISODIR}/rootfs.img ${ISODIR}/rootfs.img
-		rm -Rf ${COMPACT_ISODIR}
-		mkisofs_compress_opts="-R -z -D -l"
-	else
-		mkisofs_compress_opts="-r"
-	fi
-
-	# Check the size of ${ISODIR}/rootfs.img, use mkisofs -iso-level 3
-	# when it exceeds 3.8GB, the specification is 4G - 1 bytes, we need
-	# leave a few space for other files.
-	mkisofs_iso_level=""
-
-        if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
-		rootfs_img_size=`stat -c '%s' ${ISODIR}/rootfs.img`
-		# 4080218931 = 3.8 * 1024 * 1024 * 1024
-		if [ $rootfs_img_size -gt 4080218931 ]; then
-			bbnote "${ISODIR}/rootfs.img execeeds 3.8GB, using '-iso-level 3' for mkisofs"
-			mkisofs_iso_level="-iso-level 3"
-		fi
-	fi
-
-	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
-		# PCBIOS only media
-		mkisofs -V ${BOOTIMG_VOLUME_ID} \
-		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
-			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
-			$mkisofs_compress_opts \
-			${MKISOFS_OPTIONS} $mkisofs_iso_level ${ISODIR}
-	else
-		# EFI only OR EFI+PCBIOS
-		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
-		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
-			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
-			$mkisofs_compress_opts ${MKISOFS_OPTIONS} $mkisofs_iso_level \
-			-eltorito-alt-boot -eltorito-platform efi \
-			-b efi.img -no-emul-boot \
-			${ISODIR}
-		isohybrid_args="-u"
-	fi
-
-	isohybrid $isohybrid_args ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
-}
-
-build_fat_img() {
-	FATSOURCEDIR=$1
-	FATIMG=$2
-
-	# Calculate the size required for the final image including the
-	# data and filesystem overhead.
-	# Sectors: 512 bytes
-	#  Blocks: 1024 bytes
-
-	# Determine the sector count just for the data
-	SECTORS=$(expr $(du --apparent-size -ks ${FATSOURCEDIR} | cut -f 1) \* 2)
-
-	# Account for the filesystem overhead. This includes directory
-	# entries in the clusters as well as the FAT itself.
-	# Assumptions:
-	#   FAT32 (12 or 16 may be selected by mkdosfs, but the extra
-	#   padding will be minimal on those smaller images and not
-	#   worth the logic here to caclulate the smaller FAT sizes)
-	#   < 16 entries per directory
-	#   8.3 filenames only
-
-	# 32 bytes per dir entry
-	DIR_BYTES=$(expr $(find ${FATSOURCEDIR} | tail -n +2 | wc -l) \* 32)
-	# 32 bytes for every end-of-directory dir entry
-	DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find ${FATSOURCEDIR} -type d | tail -n +2 | wc -l) \* 32))
-	# 4 bytes per FAT entry per sector of data
-	FAT_BYTES=$(expr $SECTORS \* 4)
-	# 4 bytes per FAT entry per end-of-cluster list
-	FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find ${FATSOURCEDIR} -type d | tail -n +2 | wc -l) \* 4))
-
-	# Use a ceiling function to determine FS overhead in sectors
-	DIR_SECTORS=$(expr $(expr $DIR_BYTES + 511) / 512)
-	# There are two FATs on the image
-	FAT_SECTORS=$(expr $(expr $(expr $FAT_BYTES + 511) / 512) \* 2)
-	SECTORS=$(expr $SECTORS + $(expr $DIR_SECTORS + $FAT_SECTORS))
-
-	# Determine the final size in blocks accounting for some padding
-	BLOCKS=$(expr $(expr $SECTORS / 2) + ${BOOTIMG_EXTRA_SPACE})
-
-	# Ensure total sectors is an integral number of sectors per
-	# track or mcopy will complain. Sectors are 512 bytes, and we
-	# generate images with 32 sectors per track. This calculation is
-	# done in blocks, thus the mod by 16 instead of 32.
-	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
-
-	# mkdosfs will sometimes use FAT16 when it is not appropriate,
-	# resulting in a boot failure from SYSLINUX. Use FAT32 for
-	# images larger than 512MB, otherwise let mkdosfs decide.
-	if [ $(expr $BLOCKS / 1024) -gt 512 ]; then
-		FATSIZE="-F 32"
-	fi
-
-	# mkdosfs will fail if ${FATIMG} exists. Since we are creating an
-	# new image, it is safe to delete any previous image.
-	if [ -e ${FATIMG} ]; then
-		rm ${FATIMG}
-	fi
-
-	if [ -z "${HDDIMG_ID}" ]; then
-		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} \
-			${BLOCKS}
-	else
-		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} \
-		${BLOCKS} -i ${HDDIMG_ID}
-	fi
-
-	# Copy FATSOURCEDIR recursively into the image file directly
-	mcopy -i ${FATIMG} -s ${FATSOURCEDIR}/* ::/
-}
-
-build_hddimg() {
-	# Create an HDD image
-	if [ "${NOHDD}" != "1" ] ; then
-		populate ${HDDDIR}
-
-		if [ "${PCBIOS}" = "1" ]; then
-			syslinux_hddimg_populate ${HDDDIR}
-		fi
-		if [ "${EFI}" = "1" ]; then
-			efi_hddimg_populate ${HDDDIR}
-		fi
-
-		# Check the size of ${HDDDIR}/rootfs.img, error out if it
-		# exceeds 4GB, it is the single file's max size of FAT fs.
-		if [ -f ${HDDDIR}/rootfs.img ]; then
-			rootfs_img_size=`stat -c '%s' ${HDDDIR}/rootfs.img`
-			max_size=`expr 4 \* 1024 \* 1024 \* 1024`
-			if [ $rootfs_img_size -gt $max_size ]; then
-				bberror "${HDDDIR}/rootfs.img execeeds 4GB,"
-				bberror "this doesn't work on FAT filesystem, you can try either of:"
-				bberror "1) Reduce the size of rootfs.img"
-				bbfatal "2) Use iso, vmdk or vdi to instead of hddimg\n"
-			fi
-		fi
-
-		build_fat_img ${HDDDIR} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
-
-		if [ "${PCBIOS}" = "1" ]; then
-			syslinux_hddimg_install
-		fi
-
-		chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
-	fi
-}
-
-python do_bootimg() {
-    set_live_vm_vars(d, 'LIVE')
-    if d.getVar("PCBIOS", True) == "1":
-        bb.build.exec_func('build_syslinux_cfg', d)
-    if d.getVar("EFI", True) == "1":
-        bb.build.exec_func('build_efi_cfg', d)
-    bb.build.exec_func('build_hddimg', d)
-    bb.build.exec_func('build_iso', d)
-    bb.build.exec_func('create_symlinks', d)
-}
-do_bootimg[subimages] = "hddimg iso"
-do_bootimg[imgsuffix] = "."
-
-IMAGE_TYPEDEP_iso = "ext4"
-IMAGE_TYPEDEP_hddimg = "ext4"
-IMAGE_TYPES_MASKED += "iso hddimg"
-
-addtask bootimg before do_image_complete
diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbclass
index 9a97ac1..1ebb946 100644
--- a/meta/classes/gummiboot.bbclass
+++ b/meta/classes/gummiboot.bbclass
@@ -4,7 +4,7 @@
 
 # gummiboot.bbclass - equivalent of grub-efi.bbclass
 # Set EFI_PROVIDER = "gummiboot" to use gummiboot on your live images instead of grub-efi
-# (images built by bootimage.bbclass or boot-directdisk.bbclass)
+# (images built by image-live.bbclass or image-vm.bbclass)
 
 do_bootimg[depends] += "${MLPREFIX}gummiboot:do_deploy"
 do_bootdirectdisk[depends] += "${MLPREFIX}gummiboot:do_deploy"
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 05e416a..9c725c0 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -1,15 +1,46 @@
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
 
+# Creates a bootable image using syslinux, your kernel and an optional
+# initrd
+
+#
+# End result is two things:
+#
+# 1. A .hddimg file which is an msdos filesystem containing syslinux, a kernel,
+# an initrd and a rootfs image. These can be written to harddisks directly and
+# also booted on USB flash disks (write them there with dd).
+#
+# 2. A CD .iso image
+
+# Boot process is that the initrd will boot and process which label was selected
+# in syslinux. Actions based on the label are then performed (e.g. installing to
+# an hdd)
+
+# External variables (also used by syslinux.bbclass)
+# ${INITRD} - indicates a list of filesystem images to concatenate and use as an initrd (optional)
+# ${COMPRESSISO} - Transparent compress ISO, reduce size ~40% if set to 1
+# ${NOISO}  - skip building the ISO image if set to 1
+# ${NOHDD}  - skip building the HDD image if set to 1
+# ${HDDIMG_ID} - FAT image volume-id
+# ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
+
+do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
+                        mtools-native:do_populate_sysroot \
+                        cdrtools-native:do_populate_sysroot \
+                        virtual/kernel:do_deploy \
+                        ${@oe.utils.ifelse(d.getVar('COMPRESSISO', False),'zisofs-tools-native:do_populate_sysroot','')} \
+                        ${PN}:do_image_ext4 \
+                        "
+
+
+LABELS_LIVE ?= "boot install"
+ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
 INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
-ROOT_LIVE ?= "root=/dev/ram0"
-LABELS_LIVE ?= "boot install"
 
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
 
-do_bootimg[depends] += "${PN}:do_image_ext4"
-
-inherit bootimg
-
 IMAGE_TYPEDEP_live = "ext4"
 IMAGE_TYPEDEP_iso = "ext4"
 IMAGE_TYPEDEP_hddimg = "ext4"
@@ -24,3 +55,268 @@ python() {
     else:
         d.appendVarFlag('do_bootimg', 'depends', ' %s:do_image_complete' % initrd_i)
 }
+
+HDDDIR = "${S}/hddimg"
+ISODIR = "${S}/iso"
+EFIIMGDIR = "${S}/efi_img"
+COMPACT_ISODIR = "${S}/iso.z"
+COMPRESSISO ?= "0"
+
+ISOLINUXDIR ?= "/isolinux"
+ISO_BOOTIMG = "isolinux/isolinux.bin"
+ISO_BOOTCAT = "isolinux/boot.cat"
+MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
+
+BOOTIMG_VOLUME_ID   ?= "boot"
+BOOTIMG_EXTRA_SPACE ?= "512"
+
+EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
+EFI_PROVIDER ?= "grub-efi"
+EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
+
+KERNEL_IMAGETYPE ??= "bzImage"
+
+# Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
+# contain "efi". This way legacy is supported by default if neither is
+# specified, maintaining the original behavior.
+def pcbios(d):
+    pcbios = bb.utils.contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
+    if pcbios == "0":
+        pcbios = bb.utils.contains("MACHINE_FEATURES", "efi", "0", "1", d)
+    return pcbios
+
+PCBIOS = "${@pcbios(d)}"
+PCBIOS_CLASS = "${@['','syslinux'][d.getVar('PCBIOS', True) == '1']}"
+
+inherit ${EFI_CLASS}
+inherit ${PCBIOS_CLASS}
+
+populate() {
+	DEST=$1
+	install -d ${DEST}
+
+	# Install kernel, initrd, and rootfs.img in DEST for all loaders to use.
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${DEST}/vmlinuz
+
+	# initrd is made of concatenation of multiple filesystem images
+	if [ -n "${INITRD}" ]; then
+		rm -f ${DEST}/initrd
+		for fs in ${INITRD}
+		do
+			if [ -s "${fs}" ]; then
+				cat ${fs} >> ${DEST}/initrd
+			else
+				bbfatal "${fs} is invalid. initrd image creation failed."
+			fi
+		done
+		chmod 0644 ${DEST}/initrd
+	fi
+
+	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
+		install -m 0644 ${ROOTFS} ${DEST}/rootfs.img
+	fi
+
+}
+
+build_iso() {
+	# Only create an ISO if we have an INITRD and NOISO was not set
+	if [ -z "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
+		bbnote "ISO image will not be created."
+		return
+	fi
+	# ${INITRD} is a list of multiple filesystem images
+	for fs in ${INITRD}
+	do
+		if [ ! -s "${fs}" ]; then
+			bbnote "ISO image will not be created. ${fs} is invalid."
+			return
+		fi
+	done
+
+
+	populate ${ISODIR}
+
+	if [ "${PCBIOS}" = "1" ]; then
+		syslinux_iso_populate ${ISODIR}
+	fi
+	if [ "${EFI}" = "1" ]; then
+		efi_iso_populate ${ISODIR}
+		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
+	fi
+
+	# EFI only
+	if [ "${PCBIOS}" != "1" ] && [ "${EFI}" = "1" ] ; then
+		# Work around bug in isohybrid where it requires isolinux.bin
+		# In the boot catalog, even though it is not used
+		mkdir -p ${ISODIR}/${ISOLINUXDIR}
+		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
+	fi
+
+	if [ "${COMPRESSISO}" = "1" ] ; then
+		# create compact directory, compress iso
+		mkdir -p ${COMPACT_ISODIR}
+		mkzftree -z 9 -p 4 -F ${ISODIR}/rootfs.img ${COMPACT_ISODIR}/rootfs.img
+
+		# move compact iso to iso, then remove compact directory
+		mv ${COMPACT_ISODIR}/rootfs.img ${ISODIR}/rootfs.img
+		rm -Rf ${COMPACT_ISODIR}
+		mkisofs_compress_opts="-R -z -D -l"
+	else
+		mkisofs_compress_opts="-r"
+	fi
+
+	# Check the size of ${ISODIR}/rootfs.img, use mkisofs -iso-level 3
+	# when it exceeds 3.8GB, the specification is 4G - 1 bytes, we need
+	# leave a few space for other files.
+	mkisofs_iso_level=""
+
+        if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
+		rootfs_img_size=`stat -c '%s' ${ISODIR}/rootfs.img`
+		# 4080218931 = 3.8 * 1024 * 1024 * 1024
+		if [ $rootfs_img_size -gt 4080218931 ]; then
+			bbnote "${ISODIR}/rootfs.img execeeds 3.8GB, using '-iso-level 3' for mkisofs"
+			mkisofs_iso_level="-iso-level 3"
+		fi
+	fi
+
+	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
+		# PCBIOS only media
+		mkisofs -V ${BOOTIMG_VOLUME_ID} \
+		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
+			$mkisofs_compress_opts \
+			${MKISOFS_OPTIONS} $mkisofs_iso_level ${ISODIR}
+	else
+		# EFI only OR EFI+PCBIOS
+		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
+		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
+			$mkisofs_compress_opts ${MKISOFS_OPTIONS} $mkisofs_iso_level \
+			-eltorito-alt-boot -eltorito-platform efi \
+			-b efi.img -no-emul-boot \
+			${ISODIR}
+		isohybrid_args="-u"
+	fi
+
+	isohybrid $isohybrid_args ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
+}
+
+build_fat_img() {
+	FATSOURCEDIR=$1
+	FATIMG=$2
+
+	# Calculate the size required for the final image including the
+	# data and filesystem overhead.
+	# Sectors: 512 bytes
+	#  Blocks: 1024 bytes
+
+	# Determine the sector count just for the data
+	SECTORS=$(expr $(du --apparent-size -ks ${FATSOURCEDIR} | cut -f 1) \* 2)
+
+	# Account for the filesystem overhead. This includes directory
+	# entries in the clusters as well as the FAT itself.
+	# Assumptions:
+	#   FAT32 (12 or 16 may be selected by mkdosfs, but the extra
+	#   padding will be minimal on those smaller images and not
+	#   worth the logic here to caclulate the smaller FAT sizes)
+	#   < 16 entries per directory
+	#   8.3 filenames only
+
+	# 32 bytes per dir entry
+	DIR_BYTES=$(expr $(find ${FATSOURCEDIR} | tail -n +2 | wc -l) \* 32)
+	# 32 bytes for every end-of-directory dir entry
+	DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find ${FATSOURCEDIR} -type d | tail -n +2 | wc -l) \* 32))
+	# 4 bytes per FAT entry per sector of data
+	FAT_BYTES=$(expr $SECTORS \* 4)
+	# 4 bytes per FAT entry per end-of-cluster list
+	FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find ${FATSOURCEDIR} -type d | tail -n +2 | wc -l) \* 4))
+
+	# Use a ceiling function to determine FS overhead in sectors
+	DIR_SECTORS=$(expr $(expr $DIR_BYTES + 511) / 512)
+	# There are two FATs on the image
+	FAT_SECTORS=$(expr $(expr $(expr $FAT_BYTES + 511) / 512) \* 2)
+	SECTORS=$(expr $SECTORS + $(expr $DIR_SECTORS + $FAT_SECTORS))
+
+	# Determine the final size in blocks accounting for some padding
+	BLOCKS=$(expr $(expr $SECTORS / 2) + ${BOOTIMG_EXTRA_SPACE})
+
+	# Ensure total sectors is an integral number of sectors per
+	# track or mcopy will complain. Sectors are 512 bytes, and we
+	# generate images with 32 sectors per track. This calculation is
+	# done in blocks, thus the mod by 16 instead of 32.
+	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
+
+	# mkdosfs will sometimes use FAT16 when it is not appropriate,
+	# resulting in a boot failure from SYSLINUX. Use FAT32 for
+	# images larger than 512MB, otherwise let mkdosfs decide.
+	if [ $(expr $BLOCKS / 1024) -gt 512 ]; then
+		FATSIZE="-F 32"
+	fi
+
+	# mkdosfs will fail if ${FATIMG} exists. Since we are creating an
+	# new image, it is safe to delete any previous image.
+	if [ -e ${FATIMG} ]; then
+		rm ${FATIMG}
+	fi
+
+	if [ -z "${HDDIMG_ID}" ]; then
+		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} \
+			${BLOCKS}
+	else
+		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} \
+		${BLOCKS} -i ${HDDIMG_ID}
+	fi
+
+	# Copy FATSOURCEDIR recursively into the image file directly
+	mcopy -i ${FATIMG} -s ${FATSOURCEDIR}/* ::/
+}
+
+build_hddimg() {
+	# Create an HDD image
+	if [ "${NOHDD}" != "1" ] ; then
+		populate ${HDDDIR}
+
+		if [ "${PCBIOS}" = "1" ]; then
+			syslinux_hddimg_populate ${HDDDIR}
+		fi
+		if [ "${EFI}" = "1" ]; then
+			efi_hddimg_populate ${HDDDIR}
+		fi
+
+		# Check the size of ${HDDDIR}/rootfs.img, error out if it
+		# exceeds 4GB, it is the single file's max size of FAT fs.
+		if [ -f ${HDDDIR}/rootfs.img ]; then
+			rootfs_img_size=`stat -c '%s' ${HDDDIR}/rootfs.img`
+			max_size=`expr 4 \* 1024 \* 1024 \* 1024`
+			if [ $rootfs_img_size -gt $max_size ]; then
+				bberror "${HDDDIR}/rootfs.img execeeds 4GB,"
+				bberror "this doesn't work on FAT filesystem, you can try either of:"
+				bberror "1) Reduce the size of rootfs.img"
+				bbfatal "2) Use iso, vmdk or vdi to instead of hddimg\n"
+			fi
+		fi
+
+		build_fat_img ${HDDDIR} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+
+		if [ "${PCBIOS}" = "1" ]; then
+			syslinux_hddimg_install
+		fi
+
+		chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+	fi
+}
+
+python do_bootimg() {
+    set_live_vm_vars(d, 'LIVE')
+    if d.getVar("PCBIOS", True) == "1":
+        bb.build.exec_func('build_syslinux_cfg', d)
+    if d.getVar("EFI", True) == "1":
+        bb.build.exec_func('build_efi_cfg', d)
+    bb.build.exec_func('build_hddimg', d)
+    bb.build.exec_func('build_iso', d)
+    bb.build.exec_func('create_symlinks', d)
+}
+do_bootimg[subimages] = "hddimg iso"
+do_bootimg[imgsuffix] = "."
+
+addtask bootimg before do_image_complete
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 68cf89b..ced8eac 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -1,5 +1,5 @@
 # image-vm.bbclass
-# (loosly based off bootimg.bbclass Copyright (C) 2004, Advanced Micro Devices, Inc.)
+# (loosly based off image-live.bbclass Copyright (C) 2004, Advanced Micro Devices, Inc.)
 #
 # Create an image which can be placed directly onto a harddisk using dd and then
 # booted.
-- 
2.7.4


