Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A9708731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 08:58:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Sep 2016 01:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,266,1470726000"; d="scan'208";a="1023610708"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 01 Sep 2016 01:58:14 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id A80DC6A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 01:57:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 11:56:00 +0300
Message-Id: <2bcf2e0c4a5c04ce0eb8f60288ea50ef3e3db594.1472719962.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472719962.git.ed.bartosh@linux.intel.com>
References: <cover.1472719962.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472719962.git.ed.bartosh@linux.intel.com>
References: <cover.1472719962.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 3/6] image: populate_sdk: deploy images to DEPLOYDIR
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
X-List-Received-Date: Thu, 01 Sep 2016 08:58:14 -0000

Changed deployment directory from DEPLOY_DIR_IMAGE/SDK_DEPLOY to
DEPLOYDIR to make sstate machinery to do final deployment and
generate manifest.

Renamed variable deploy_dir to deploy_dir_image in selftest code
to avoid confusion with DEPLOYDIR variable.

Updated the code of rootfs.py:Rootfs class to use DEPLOYDIR variable
as it's now used as a new deployment destination.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-live.bbclass                    | 12 +++---
 meta/classes/image-vm.bbclass                      | 22 +++++------
 meta/classes/image.bbclass                         |  6 +--
 meta/classes/image_types.bbclass                   | 44 +++++++++++-----------
 meta/classes/image_types_uboot.bbclass             |  2 +-
 meta/classes/populate_sdk_base.bbclass             | 20 +++++-----
 meta/classes/rootfs-postcommands.bbclass           |  4 +-
 meta/classes/syslinux.bbclass                      |  2 +-
 meta/lib/oe/rootfs.py                              |  6 +--
 meta/lib/oeqa/selftest/imagefeatures.py            |  4 +-
 .../images/build-appliance-image_15.0.0.bb         |  8 ++--
 11 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index f0e6647..1294b11 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -43,7 +43,7 @@ ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
 INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
 
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
+ROOTFS ?= "${DEPLOYDIR}/${IMAGE_LINK_NAME}.ext4"
 
 IMAGE_TYPEDEP_live = "ext4"
 IMAGE_TYPEDEP_iso = "ext4"
@@ -144,14 +144,14 @@ build_iso() {
 	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
 		# PCBIOS only media
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
-		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+		        -o ${DEPLOYDIR}/${IMAGE_NAME}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
 			$mkisofs_compress_opts \
 			${MKISOFS_OPTIONS} $mkisofs_iso_level ${ISODIR}
 	else
 		# EFI only OR EFI+PCBIOS
 		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
-		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+		        -o ${DEPLOYDIR}/${IMAGE_NAME}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
 			$mkisofs_compress_opts ${MKISOFS_OPTIONS} $mkisofs_iso_level \
 			-eltorito-alt-boot -eltorito-platform efi \
@@ -160,7 +160,7 @@ build_iso() {
 		isohybrid_args="-u"
 	fi
 
-	isohybrid $isohybrid_args ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
+	isohybrid $isohybrid_args ${DEPLOYDIR}/${IMAGE_NAME}.iso
 }
 
 build_fat_img() {
@@ -252,13 +252,13 @@ build_hddimg() {
 			fi
 		fi
 
-		build_fat_img ${HDDDIR} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+		build_fat_img ${HDDDIR} ${DEPLOYDIR}/${IMAGE_NAME}.hddimg
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_install
 		fi
 
-		chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+		chmod 644 ${DEPLOYDIR}/${IMAGE_NAME}.hddimg
 	fi
 }
 
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index bf57e2c..2a86b40 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -33,14 +33,14 @@ IMAGE_TYPEDEP_hdddirect = "${VM_ROOTFS_TYPE}"
 IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect"
 
 VM_ROOTFS_TYPE ?= "ext4"
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}"
+ROOTFS ?= "${DEPLOYDIR}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}"
 
 # Used by bootloader
 LABELS_VM ?= "boot"
 ROOT_VM ?= "root=/dev/sda2"
 # Using an initramfs is optional. Enable it by setting INITRD_IMAGE_VM.
 INITRD_IMAGE_VM ?= ""
-INITRD_VM ?= "${@'${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_VM}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE_VM}' else ''}"
+INITRD_VM ?= "${@'${DEPLOYDIR}/${INITRD_IMAGE_VM}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE_VM}' else ''}"
 do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE_VM}:do_image_complete' if '${INITRD_IMAGE_VM}' else ''}"
 
 BOOTDD_VOLUME_ID   ?= "boot"
@@ -52,7 +52,7 @@ DISK_SIGNATURE[vardepsexclude] = "DISK_SIGNATURE_GENERATED"
 build_boot_dd() {
 	HDDDIR="${S}/hdd/boot"
 	HDDIMG="${S}/hdd.image"
-	IMAGE=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect
+	IMAGE=${DEPLOYDIR}/${IMAGE_NAME}.hdddirect
 
 	populate_kernel $HDDDIR
 
@@ -104,13 +104,13 @@ build_boot_dd() {
 	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
 	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
 
-	cd ${DEPLOY_DIR_IMAGE}
+	cd ${DEPLOYDIR}
 
-	if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect ]; then
-		rm -f $(readlink -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect)
+	if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${DEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect ]; then
+		rm -f $(readlink -f ${DEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect)
 	fi
 
-	ln -sf ${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
+	ln -sf ${IMAGE_NAME}.hdddirect ${DEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect
 } 
 
 python do_bootdirectdisk() {
@@ -145,13 +145,13 @@ DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
 
 run_qemu_img (){
     type="$1"
-    qemu-img convert -O $type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.$type
+    qemu-img convert -O $type ${DEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect ${DEPLOYDIR}/${IMAGE_NAME}.$type
 
-    if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type ]; then
-        rm -f $(readlink -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type)
+    if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${DEPLOYDIR}/${IMAGE_LINK_NAME}.$type ]; then
+        rm -f $(readlink -f ${DEPLOYDIR}/${IMAGE_LINK_NAME}.$type)
     fi
 
-    ln -sf ${IMAGE_NAME}.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
+    ln -sf ${IMAGE_NAME}.$type ${DEPLOYDIR}/${IMAGE_LINK_NAME}.$type
 }
 create_vmdk_image () {
     run_qemu_img vmdk
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b3dc689..2e75e70 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -120,7 +120,7 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'DEPLOYDIR']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
@@ -442,7 +442,7 @@ python () {
             cmds.append("\t" + image_cmd)
         else:
             bb.fatal("No IMAGE_CMD defined for IMAGE_FSTYPES entry '%s' - possibly invalid type name or missing support class" % t)
-        cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
+        cmds.append(localdata.expand("\tcd ${DEPLOYDIR}"))
 
         # Since a copy of IMAGE_CMD_xxx will be inlined within do_image_xxx,
         # prevent a redundant copy of IMAGE_CMD_xxx being emitted as a function.
@@ -560,7 +560,7 @@ python set_image_size () {
 #
 python create_symlinks() {
 
-    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE', True)
+    deploy_dir = d.getVar('DEPLOYDIR', True)
     img_name = d.getVar('IMAGE_NAME', True)
     link_name = d.getVar('IMAGE_LINK_NAME', True)
     manifest_name = d.getVar('IMAGE_MANIFEST', True)
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 2e852af..6e6fbd7 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -41,9 +41,9 @@ XZ_THREADS ?= "-T 0"
 ZIP_COMPRESSION_LEVEL ?= "-9"
 
 JFFS2_SUM_EXTRA_ARGS ?= ""
-IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 ${EXTRA_IMAGECMD}"
 
-IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cramfs ${EXTRA_IMAGECMD}"
+IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cramfs ${EXTRA_IMAGECMD}"
 
 oe_mkext234fs () {
 	fstype=$1
@@ -63,8 +63,8 @@ oe_mkext234fs () {
 		eval COUNT=\"$MIN_COUNT\"
 	fi
 	# Create a sparse image block
-	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
-	mkfs.$fstype -F $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
+	dd if=/dev/zero of=${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
+	mkfs.$fstype -F $extra_imagecmd ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
 }
 
 IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
@@ -74,16 +74,16 @@ IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
 MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD_btrfs () {
 	if [ ${ROOTFS_SIZE} -gt ${MIN_BTRFS_SIZE} ]; then
-		dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs count=${ROOTFS_SIZE} bs=1024
-		mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
+		dd if=/dev/zero of=${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs count=${ROOTFS_SIZE} bs=1024
+		mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
 	else
 		bbfatal "Rootfs is too small for BTRFS (Rootfs Actual Size: ${ROOTFS_SIZE}, BTRFS Minimum Size: ${MIN_BTRFS_SIZE})"
 	fi
 }
 
-IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs ${EXTRA_IMAGECMD} -noappend"
-IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
-IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
+IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs ${EXTRA_IMAGECMD} -noappend"
+IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
+IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
 
 # By default, tar from the host is used, which can be quite old. If
 # you need special parameters (like --xattrs) which are only supported
@@ -96,11 +96,11 @@ IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE
 # In practice, it turned out to be not needed when creating archives and
 # required when extracting, but it seems prudent to use it in both cases.
 IMAGE_CMD_TAR ?= "tar"
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} ."
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cvf ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} ."
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
+	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 	# We only need the /init symlink if we're building the real
 	# image. The -dbg image doesn't need it! By being clever
 	# about this we also avoid 'touch' below failing, as it
@@ -113,7 +113,7 @@ IMAGE_CMD_cpio () {
 			else
 				touch ${WORKDIR}/cpio_append/init
 			fi
-			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
+			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 		fi
 	fi
 }
@@ -122,8 +122,8 @@ ELF_KERNEL ?= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
 ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
 
 IMAGE_CMD_elf () {
-	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf && rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf
-	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
+	test -f ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf && rm -f ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf
+	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.cpio.gz --output=${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
 }
 
 IMAGE_TYPEDEP_elf = "cpio.gz"
@@ -141,20 +141,20 @@ multiubi_mkfs() {
 
 	echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
 	echo mode=ubi >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
+	echo image=${DEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_id=0 >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_type=dynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
-	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
-	ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
+	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
+	ubinize -o ${DEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
 
 	# Cleanup cfg file
-	mv ubinize${vname}-${IMAGE_NAME}.cfg ${DEPLOY_DIR_IMAGE}/
+	mv ubinize${vname}-${IMAGE_NAME}.cfg ${DEPLOYDIR}/
 
 	# Create own symlinks for 'named' volumes
 	if [ -n "$vname" ]; then
-		cd ${DEPLOY_DIR_IMAGE}
+		cd ${DEPLOYDIR}
 		if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ]; then
 			ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs \
 			${IMAGE_LINK_NAME}${vname}.ubifs
@@ -181,7 +181,7 @@ IMAGE_CMD_ubi () {
 	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
 }
 
-IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
+IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
 
 WKS_FILE ?= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
@@ -201,7 +201,7 @@ def wks_search(files, search_path):
 WIC_CREATE_EXTRA_ARGS ?= ""
 
 IMAGE_CMD_wic () {
-	out="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}"
+	out="${DEPLOYDIR}/${IMAGE_NAME}"
 	wks="${WKS_FULL_PATH}"
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
@@ -360,4 +360,4 @@ IMAGE_TYPES_MASKED ?= ""
 
 # The WICVARS variable is used to define list of bitbake variables used in wic code
 # variables from this list is written to <image>.env file
-WICVARS ?= "BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
+WICVARS ?= "BBLAYERS DEPLOYDIR DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index f72d9b2..b8a281e 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -2,7 +2,7 @@ inherit image_types kernel-arch
 
 oe_mkimage () {
     mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
-        -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
+        -d ${DEPLOYDIR}/$1 ${DEPLOYDIR}/$1.u-boot
     if [ x$3 = x"clean" ]; then
         rm $1
     fi
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index be731c0..1b9aafc 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -60,8 +60,8 @@ SDK_RELOCATE_AFTER_INSTALL ?= "1"
 SDKEXTPATH ?= "~/${@d.getVar('DISTRO', True)}_sdk"
 SDK_TITLE ?= "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} SDK"
 
-SDK_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
-SDK_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
+SDK_TARGET_MANIFEST = "${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
+SDK_HOST_MANIFEST = "${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 python write_target_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
@@ -182,14 +182,14 @@ SDKTAROPTS = "--owner=root --group=root"
 
 fakeroot tar_sdk() {
 	# Package it up
-	mkdir -p ${SDK_DEPLOY}
+	mkdir -p ${DEPLOYDIR}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -cf - . | pixz > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	tar ${SDKTAROPTS} -cf - . | pixz > ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 fakeroot create_shar() {
 	# copy in the template shar extractor script
-	cp ${COREBASE}/meta/files/toolchain-shar-extract.sh ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cp ${COREBASE}/meta/files/toolchain-shar-extract.sh ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	rm -f ${T}/pre_install_command ${T}/post_install_command
 
@@ -205,7 +205,7 @@ ${SDK_POST_INSTALL_COMMAND}
 EOF
 	sed -i -e '/@SDK_PRE_INSTALL_COMMAND@/r ${T}/pre_install_command' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/r ${T}/post_install_command' \
-		${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+		${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# substitute variables
 	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
@@ -217,16 +217,16 @@ EOF
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
 		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
-		${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+		${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# add execution permission
-	chmod +x ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	chmod +x ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# append the SDK tarball
-	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cat ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz >> ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# delete the old tarball, we don't need it anymore
-	rm ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	rm ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 populate_sdk_log_check() {
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index b38b6a5..f8a63b0 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -15,7 +15,7 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
 
 # Write manifest
-IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
+IMAGE_MANIFEST = "${DEPLOYDIR}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
@@ -217,7 +217,7 @@ python write_image_manifest () {
     from oe.rootfs import image_list_installed_packages
     from oe.utils import format_pkg_list
 
-    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE', True)
+    deploy_dir = d.getVar('DEPLOYDIR', True)
     link_name = d.getVar('IMAGE_LINK_NAME', True)
     manifest_name = d.getVar('IMAGE_MANIFEST', True)
 
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 35d9eed..fd4c32e 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -72,7 +72,7 @@ syslinux_hddimg_populate() {
 }
 
 syslinux_hddimg_install() {
-	syslinux ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+	syslinux ${DEPLOYDIR}/${IMAGE_NAME}.hddimg
 }
 
 syslinux_hdddirect_install() {
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 7c620e9..076bc33 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -19,7 +19,7 @@ class Rootfs(object, metaclass=ABCMeta):
         self.d = d
         self.pm = None
         self.image_rootfs = self.d.getVar('IMAGE_ROOTFS', True)
-        self.deploy_dir_image = self.d.getVar('DEPLOY_DIR_IMAGE', True)
+        self.deploydir = self.d.getVar('DEPLOYDIR', True)
         self.progress_reporter = progress_reporter
 
         self.install_order = Manifest.INSTALL_ORDER
@@ -182,12 +182,12 @@ class Rootfs(object, metaclass=ABCMeta):
 
         bb.utils.mkdirhier(self.image_rootfs)
 
-        bb.utils.mkdirhier(self.deploy_dir_image)
+        bb.utils.mkdirhier(self.deploydir)
 
         shutil.copytree(postinst_intercepts_dir, intercepts_dir)
 
         shutil.copy(self.d.expand("${COREBASE}/meta/files/deploydir_readme.txt"),
-                    self.deploy_dir_image +
+                    self.deploydir +
                     "/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt")
 
         execute_pre_post_process(self.d, pre_process_cmds)
diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index 08e382f..d015c49 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -113,9 +113,9 @@ class ImageFeatures(oeSelfTest):
         image_name = 'core-image-minimal'
         bitbake(image_name)
 
-        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
         link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
-        image_path = os.path.join(deploy_dir, "%s.ext4" % link_name)
+        image_path = os.path.join(deploy_dir_image, "%s.ext4" % link_name)
         bmap_path = "%s.bmap" % image_path
 
         # check if result image and bmap file are in deploy directory
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index dc621d6..f7d57a8 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -32,7 +32,7 @@ BA_INCLUDE_SOURCES ??= "0"
 
 IMAGE_CMD_ext4_append () {
 	# We don't need to reserve much space for root, 0.5% is more than enough
-	tune2fs -m 0.5 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4
+	tune2fs -m 0.5 ${DEPLOYDIR}/${IMAGE_NAME}.rootfs.ext4
 }
 
 fakeroot do_populate_poky_src () {
@@ -101,9 +101,9 @@ create_bundle_files () {
 	cd ${WORKDIR}
 	mkdir -p Yocto_Build_Appliance
 	cp *.vmx* Yocto_Build_Appliance
-	ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
-	zip -r ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
-	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance.zip 
+	ln -sf ${DEPLOYDIR}/${IMAGE_NAME}.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
+	zip -r ${DEPLOYDIR}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
+	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${DEPLOYDIR}/Yocto_Build_Appliance.zip
 }
 create_bundle_files[vardepsexclude] = "DATETIME"
 
-- 
2.1.4


