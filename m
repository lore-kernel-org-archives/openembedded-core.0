Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 40EEB60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 07:23:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U7NEgo002146
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 00:23:14 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 30 Mar 2016 00:23:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 00:23:09 -0700
Message-ID: <0929a8782c6ed26baeb8b367af3ae07b6aa6f68d.1459322435.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459322435.git.liezhi.yang@windriver.com>
References: <cover.1459322435.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] boot-directdisk.bbclass: merge it into image-vm.bbclass
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

They are doing the same things: create virtual machine images, merge
them into one bbclass makes it easy to understand.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/boot-directdisk.bbclass | 190 ------------------------------
 meta/classes/image-vm.bbclass        | 216 ++++++++++++++++++++++++++++++++---
 2 files changed, 198 insertions(+), 208 deletions(-)
 delete mode 100644 meta/classes/boot-directdisk.bbclass

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
deleted file mode 100644
index 46f88ac9..0000000
--- a/meta/classes/boot-directdisk.bbclass
+++ /dev/null
@@ -1,190 +0,0 @@
-# boot-directdisk.bbclass
-# (loosly based off bootimg.bbclass Copyright (C) 2004, Advanced Micro Devices, Inc.)
-#
-# Create an image which can be placed directly onto a harddisk using dd and then
-# booted.
-#
-# This uses syslinux. extlinux would have been nice but required the ext2/3 
-# partition to be mounted. grub requires to run itself as part of the install 
-# process.
-#
-# The end result is a 512 boot sector populated with an MBR and partition table
-# followed by an msdos fat16 partition containing syslinux and a linux kernel
-# completed by the ext2/3 rootfs.
-#
-# We have to push the msdos parition table size > 16MB so fat 16 is used as parted
-# won't touch fat12 partitions.
-
-# External variables needed
-
-# ${ROOTFS} - the rootfs image to incorporate
-
-do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
-                               virtual/kernel:do_deploy \
-                               syslinux:do_populate_sysroot \
-                               syslinux-native:do_populate_sysroot \
-                               parted-native:do_populate_sysroot \
-                               mtools-native:do_populate_sysroot "
-
-PACKAGES = " "
-EXCLUDE_FROM_WORLD = "1"
-
-BOOTDD_VOLUME_ID   ?= "boot"
-BOOTDD_EXTRA_SPACE ?= "16384"
-
-EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
-EFI_PROVIDER ?= "grub-efi"
-EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
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
-def pcbios_class(d):
-    if d.getVar("PCBIOS", True) == "1":
-        return "syslinux"
-    return ""
-
-PCBIOS = "${@pcbios(d)}"
-PCBIOS_CLASS = "${@pcbios_class(d)}"
-
-# Get the build_syslinux_cfg() function from the syslinux class
-inherit ${PCBIOS_CLASS}
-inherit ${EFI_CLASS}
-
-DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
-ROOT_VM ?= "root=/dev/sda2"
-
-boot_direct_populate() {
-	dest=$1
-	install -d $dest
-
-	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	if [ -e ${DEPLOY_DIR_IMAGE}/bzImage ]; then
-		install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage $dest/vmlinuz
-	fi
-
-	# initrd is made of concatenation of multiple filesystem images
-	if [ -n "${INITRD}" ]; then
-		rm -f $dest/initrd
-		for fs in ${INITRD}
-		do
-			if [ -s "${fs}" ]; then
-				cat ${fs} >> $dest/initrd
-			else
-				bbfatal "${fs} is invalid. initrd image creation failed."
-			fi
-		done
-		chmod 0644 $dest/initrd
-	fi
-}
-
-build_boot_dd() {
-	HDDDIR="${S}/hdd/boot"
-	HDDIMG="${S}/hdd.image"
-	IMAGE=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect
-
-	boot_direct_populate $HDDDIR
-
-	if [ "${PCBIOS}" = "1" ]; then
-		syslinux_hddimg_populate $HDDDIR
-	fi
-	if [ "${EFI}" = "1" ]; then
-		efi_hddimg_populate $HDDDIR
-	fi
-
-	if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
-		install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 $HDDDIR/${SYSLINUXDIR}/
-		if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
-			install -m 0644 ${SYSLINUX_SPLASH} $HDDDIR/${SYSLINUXDIR}/splash.lss
-		fi
-	fi
-
-	BLOCKS=`du -bks $HDDDIR | cut -f 1`
-	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
-
-	# Ensure total sectors is an integral number of sectors per
-	# track or mcopy will complain. Sectors are 512 bytes, and we
-	# generate images with 32 sectors per track. This calculation is
-	# done in blocks, thus the mod by 16 instead of 32.
-	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
-
-	# Remove it since mkdosfs would fail when it exists
-	rm -f $HDDIMG
-	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS 
-	mcopy -i $HDDIMG -s $HDDDIR/* ::/
-
-	if [ "${PCBIOS}" = "1" ]; then
-		syslinux_hdddirect_install $HDDIMG
-	fi	
-	chmod 644 $HDDIMG
-
-	ROOTFSBLOCKS=`du -Lbks ${ROOTFS} | cut -f 1`
-	TOTALSIZE=`expr $BLOCKS + $ROOTFSBLOCKS`
-	END1=`expr $BLOCKS \* 1024`
-	END2=`expr $END1 + 512`
-	END3=`expr \( $ROOTFSBLOCKS \* 1024 \) + $END1`
-
-	echo $ROOTFSBLOCKS $TOTALSIZE $END1 $END2 $END3
-	rm -rf $IMAGE
-	dd if=/dev/zero of=$IMAGE bs=1024 seek=$TOTALSIZE count=1
-
-	parted $IMAGE mklabel msdos
-	parted $IMAGE mkpart primary fat16 0 ${END1}B
-	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
-	parted $IMAGE set 1 boot on 
-
-	parted $IMAGE print
-
-	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
-		dd of=$IMAGE bs=1 seek=440 conv=notrunc
-
-	OFFSET=`expr $END2 / 512`
-	if [ "${PCBIOS}" = "1" ]; then
-		dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
-	fi
-
-	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
-	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
-
-	cd ${DEPLOY_DIR_IMAGE}
-	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
-	ln -s ${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
-} 
-
-python do_bootdirectdisk() {
-    validate_disk_signature(d)
-    set_live_vm_vars(d, 'VM')
-    if d.getVar("PCBIOS", True) == "1":
-        bb.build.exec_func('build_syslinux_cfg', d)
-    if d.getVar("EFI", True) == "1":
-        bb.build.exec_func('build_efi_cfg', d)
-    bb.build.exec_func('build_boot_dd', d)
-}
-
-def generate_disk_signature():
-    import uuid
-
-    signature = str(uuid.uuid4())[:8]
-
-    if signature != '00000000':
-        return signature
-    else:
-        return 'ffffffff'
-
-def validate_disk_signature(d):
-    import re
-
-    disk_signature = d.getVar("DISK_SIGNATURE", True)
-
-    if not re.match(r'^[0-9a-fA-F]{8}$', disk_signature):
-        bb.fatal("DISK_SIGNATURE '%s' must be an 8 digit hex string" % disk_signature)
-
-DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
-
-addtask bootdirectdisk before do_image_complete
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 8608ec0..68cf89b 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -1,37 +1,217 @@
+# image-vm.bbclass
+# (loosly based off bootimg.bbclass Copyright (C) 2004, Advanced Micro Devices, Inc.)
+#
+# Create an image which can be placed directly onto a harddisk using dd and then
+# booted.
+#
+# This uses syslinux. extlinux would have been nice but required the ext2/3
+# partition to be mounted. grub requires to run itself as part of the install
+# process.
+#
+# The end result is a 512 boot sector populated with an MBR and partition table
+# followed by an msdos fat16 partition containing syslinux and a linux kernel
+# completed by the ext2/3 rootfs.
+#
+# We have to push the msdos parition table size > 16MB so fat 16 is used as parted
+# won't touch fat12 partitions.
 
-LABELS_VM ?= "boot"
+do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
+                               virtual/kernel:do_deploy \
+                               syslinux:do_populate_sysroot \
+                               syslinux-native:do_populate_sysroot \
+                               parted-native:do_populate_sysroot \
+                               mtools-native:do_populate_sysroot \
+                               ${PN}:do_image_ext4 \
+                               "
+
+IMAGE_TYPEDEP_vmdk = "ext4"
+IMAGE_TYPEDEP_vdi = "ext4"
+IMAGE_TYPEDEP_qcow2 = "ext4"
+IMAGE_TYPEDEP_hdddirect = "ext4"
+IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect"
 
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
+
+# Used by bootloader
+LABELS_VM ?= "boot"
+ROOT_VM ?= "root=/dev/sda2"
 # Using an initramfs is optional. Enable it by setting INITRD_IMAGE_VM.
 INITRD_IMAGE_VM ?= ""
 INITRD_VM ?= "${@'${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_VM}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE_VM}' else ''}"
 do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE_VM}:do_image_complete' if '${INITRD_IMAGE_VM}' else ''}"
 
-# need to define the dependency and the ROOTFS for directdisk
-do_bootdirectdisk[depends] += "${PN}:do_image_ext4"
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
+BOOTDD_VOLUME_ID   ?= "boot"
+BOOTDD_EXTRA_SPACE ?= "16384"
 
-# creating VM images relies on having a hdddirect so ensure we inherit it here.
-inherit boot-directdisk
+EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
+EFI_PROVIDER ?= "grub-efi"
+EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
 
-IMAGE_TYPEDEP_vmdk = "ext4"
-IMAGE_TYPEDEP_vdi = "ext4"
-IMAGE_TYPEDEP_qcow2 = "ext4"
-IMAGE_TYPEDEP_hdddirect = "ext4"
-IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect"
+# Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
+# contain "efi". This way legacy is supported by default if neither is
+# specified, maintaining the original behavior.
+def pcbios(d):
+    pcbios = bb.utils.contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
+    if pcbios == "0":
+        pcbios = bb.utils.contains("MACHINE_FEATURES", "efi", "0", "1", d)
+    return pcbios
+
+def pcbios_class(d):
+    if d.getVar("PCBIOS", True) == "1":
+        return "syslinux"
+    return ""
+
+PCBIOS = "${@pcbios(d)}"
+PCBIOS_CLASS = "${@pcbios_class(d)}"
+
+# Get the build_syslinux_cfg() function from the syslinux class
+inherit ${PCBIOS_CLASS}
+inherit ${EFI_CLASS}
+
+DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
+
+boot_direct_populate() {
+	dest=$1
+	install -d $dest
+
+	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
+	if [ -e ${DEPLOY_DIR_IMAGE}/bzImage ]; then
+		install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage $dest/vmlinuz
+	fi
+
+	# initrd is made of concatenation of multiple filesystem images
+	if [ -n "${INITRD}" ]; then
+		rm -f $dest/initrd
+		for fs in ${INITRD}
+		do
+			if [ -s "${fs}" ]; then
+				cat ${fs} >> $dest/initrd
+			else
+				bbfatal "${fs} is invalid. initrd image creation failed."
+			fi
+		done
+		chmod 0644 $dest/initrd
+	fi
+}
+
+build_boot_dd() {
+	HDDDIR="${S}/hdd/boot"
+	HDDIMG="${S}/hdd.image"
+	IMAGE=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect
+
+	boot_direct_populate $HDDDIR
 
+	if [ "${PCBIOS}" = "1" ]; then
+		syslinux_hddimg_populate $HDDDIR
+	fi
+	if [ "${EFI}" = "1" ]; then
+		efi_hddimg_populate $HDDDIR
+	fi
+
+	if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
+		install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 $HDDDIR/${SYSLINUXDIR}/
+		if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
+			install -m 0644 ${SYSLINUX_SPLASH} $HDDDIR/${SYSLINUXDIR}/splash.lss
+		fi
+	fi
+
+	BLOCKS=`du -bks $HDDDIR | cut -f 1`
+	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
+
+	# Ensure total sectors is an integral number of sectors per
+	# track or mcopy will complain. Sectors are 512 bytes, and we
+	# generate images with 32 sectors per track. This calculation is
+	# done in blocks, thus the mod by 16 instead of 32.
+	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
+
+	# Remove it since mkdosfs would fail when it exists
+	rm -f $HDDIMG
+	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS 
+	mcopy -i $HDDIMG -s $HDDDIR/* ::/
+
+	if [ "${PCBIOS}" = "1" ]; then
+		syslinux_hdddirect_install $HDDIMG
+	fi	
+	chmod 644 $HDDIMG
+
+	ROOTFSBLOCKS=`du -Lbks ${ROOTFS} | cut -f 1`
+	TOTALSIZE=`expr $BLOCKS + $ROOTFSBLOCKS`
+	END1=`expr $BLOCKS \* 1024`
+	END2=`expr $END1 + 512`
+	END3=`expr \( $ROOTFSBLOCKS \* 1024 \) + $END1`
+
+	echo $ROOTFSBLOCKS $TOTALSIZE $END1 $END2 $END3
+	rm -rf $IMAGE
+	dd if=/dev/zero of=$IMAGE bs=1024 seek=$TOTALSIZE count=1
+
+	parted $IMAGE mklabel msdos
+	parted $IMAGE mkpart primary fat16 0 ${END1}B
+	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
+	parted $IMAGE set 1 boot on 
+
+	parted $IMAGE print
+
+	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
+		dd of=$IMAGE bs=1 seek=440 conv=notrunc
+
+	OFFSET=`expr $END2 / 512`
+	if [ "${PCBIOS}" = "1" ]; then
+		dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
+	fi
+
+	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
+	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
+
+	cd ${DEPLOY_DIR_IMAGE}
+	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
+	ln -s ${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
+} 
+
+python do_bootdirectdisk() {
+    validate_disk_signature(d)
+    set_live_vm_vars(d, 'VM')
+    if d.getVar("PCBIOS", True) == "1":
+        bb.build.exec_func('build_syslinux_cfg', d)
+    if d.getVar("EFI", True) == "1":
+        bb.build.exec_func('build_efi_cfg', d)
+    bb.build.exec_func('build_boot_dd', d)
+}
+
+def generate_disk_signature():
+    import uuid
+
+    signature = str(uuid.uuid4())[:8]
+
+    if signature != '00000000':
+        return signature
+    else:
+        return 'ffffffff'
+
+def validate_disk_signature(d):
+    import re
+
+    disk_signature = d.getVar("DISK_SIGNATURE", True)
+
+    if not re.match(r'^[0-9a-fA-F]{8}$', disk_signature):
+        bb.fatal("DISK_SIGNATURE '%s' must be an 8 digit hex string" % disk_signature)
+
+DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
+
+run_qemu_img (){
+    type="$1"
+    qemu-img convert -O $type ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.$type
+    ln -sf ${IMAGE_NAME}.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
+}
 create_vmdk_image () {
-    qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
-    ln -sf ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
+    run_qemu_img vmdk
 }
 
 create_vdi_image () {
-    qemu-img convert -O vdi ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vdi
-    ln -sf ${IMAGE_NAME}.vdi ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vdi
+    run_qemu_img vdi
 }
 
 create_qcow2_image () {
-    qemu-img convert -O qcow2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.qcow2
-    ln -sf ${IMAGE_NAME}.qcow2 ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.qcow2
+    run_qemu_img qcow2
 }
 
 python do_vmimg() {
@@ -43,6 +223,6 @@ python do_vmimg() {
         bb.build.exec_func('create_qcow2_image', d)
 }
 
+addtask bootdirectdisk before do_vmimg
 addtask vmimg after do_bootdirectdisk before do_image_complete
 do_vmimg[depends] += "qemu-native:do_populate_sysroot"
-
-- 
2.7.4


