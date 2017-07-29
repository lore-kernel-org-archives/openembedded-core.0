Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id BB7BC784CA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 00:13:16 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id t139so6936438ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 17:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hJQcEcr2rfYcVU42+RVj5QlxFVJR8mBshbSOpyAzRaM=;
	b=nBfhare2pmXiBZXUXRv4oD8Abr1md95sbmbtvj1+sMtIBBhp1aGU4l9xT9/1XiaUp5
	QwWbdXHwIxMJAFyqU16Q17NzOg6RmpcPVY0KjXbAFvs1gYjAwE9839l14GBvf1DxcRXl
	VvqVZxztHuo3DFjJKFR8YthsaGNkSoOeNDAxIzLTembyOE+yUOxl+bKlnD8S3RsfueZh
	GEnIxU8vxYhm+PP0DjdrKd9KP95jqTNp8FzFTmpkJOT5Da1EQaObd2hi5cxcAwfTnHwY
	kyAFZfxVB9QFLezl+Pch0xVWzz3zeVYwYexg4xypmqqQp1Wq29GPdNSHdITZfgOxRhs2
	aXCA==
X-Gm-Message-State: AIVw113WxqE7NOq7Yp+sGt/pekoXQ0ozH6NrlhrLDs1jgZWvhq7W06Hy
	0FbMjdhMKLXWpv4v
X-Received: by 10.37.170.8 with SMTP id s8mr8316146ybi.48.1501287197163;
	Fri, 28 Jul 2017 17:13:17 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58])
	by smtp.gmail.com with ESMTPSA id l7sm8368499ywl.92.2017.07.28.17.13.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Jul 2017 17:13:16 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 20:14:32 -0400
Message-Id: <1501287276-28699-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCHv4 1/5] image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types
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
X-List-Received-Date: Sat, 29 Jul 2017 00:13:17 -0000

The vmdk/vdi/qcow2 IMAGE_FSTYPEs predate wic.  As such, they provide
some similar underlying functionality in order to produce a "disk" image
that in turn can be converted into different formats that various
hypervisor types work with.  They do not however provide the ability for
other disk image types to be converted into these same output types.
Furthermore, they are less flexible than what wic does provide.  This
drops the old style vmdk/vdi/qcow2 types and re-introduces them under
the CONVERSION_CMD framework.  The equivalent of vmdk is now wic.vmdk
and so forth for the other types.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v4:
- Rebase to master
- Rework runqemu changes to follow the multi-line convention that was
  just introduced here

Changes in v3:
- Update runqemu to handle 'wic.vmdk' / etc correctly, as spotted by
  oe-selftest -r runqemu
- Update the runqemu tests to build wic.vmdk/etc now

Changes in v2:
- Update runqemu help (code matches .wic.vmdk as vmdk, does right thing,
  tested).
- Supply an update to yocto-docs separately, to be merged once these
  changes are live.
---
 meta/classes/image-vm.bbclass                      | 171 ---------------------
 meta/classes/image.bbclass                         |   3 -
 meta/classes/image_types.bbclass                   |  12 +-
 meta/lib/oeqa/selftest/cases/runqemu.py            |   8 +-
 .../images/build-appliance-image_15.0.0.bb         |   6 +-
 scripts/runqemu                                    |   9 +-
 6 files changed, 20 insertions(+), 189 deletions(-)
 delete mode 100644 meta/classes/image-vm.bbclass

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
deleted file mode 100644
index b52df9fbf5a1..000000000000
--- a/meta/classes/image-vm.bbclass
+++ /dev/null
@@ -1,171 +0,0 @@
-# image-vm.bbclass
-# (loosly based off image-live.bbclass Copyright (C) 2004, Advanced Micro Devices, Inc.)
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
-inherit live-vm-common
-
-do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
-                               virtual/kernel:do_deploy \
-                               syslinux:do_populate_sysroot \
-                               syslinux-native:do_populate_sysroot \
-                               parted-native:do_populate_sysroot \
-                               mtools-native:do_populate_sysroot \
-                               ${PN}:do_image_${VM_ROOTFS_TYPE} \
-                               "
-
-IMAGE_TYPEDEP_vmdk = "${VM_ROOTFS_TYPE}"
-IMAGE_TYPEDEP_vdi = "${VM_ROOTFS_TYPE}"
-IMAGE_TYPEDEP_qcow2 = "${VM_ROOTFS_TYPE}"
-IMAGE_TYPEDEP_hdddirect = "${VM_ROOTFS_TYPE}"
-IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect"
-
-VM_ROOTFS_TYPE ?= "ext4"
-ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}"
-
-# Used by bootloader
-LABELS_VM ?= "boot"
-ROOT_VM ?= "root=/dev/sda2"
-# Using an initramfs is optional. Enable it by setting INITRD_IMAGE_VM.
-INITRD_IMAGE_VM ?= ""
-INITRD_VM ?= "${@'${IMGDEPLOYDIR}/${INITRD_IMAGE_VM}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE_VM}' else ''}"
-do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE_VM}:do_image_complete' if '${INITRD_IMAGE_VM}' else ''}"
-
-BOOTDD_VOLUME_ID   ?= "boot"
-BOOTDD_EXTRA_SPACE ?= "16384"
-
-DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
-DISK_SIGNATURE[vardepsexclude] = "DISK_SIGNATURE_GENERATED"
-
-build_boot_dd() {
-	HDDDIR="${S}/hdd/boot"
-	HDDIMG="${S}/hdd.image"
-	IMAGE=${IMGDEPLOYDIR}/${IMAGE_NAME}.hdddirect
-
-	populate_kernel $HDDDIR
-
-	if [ "${PCBIOS}" = "1" ]; then
-		syslinux_hddimg_populate $HDDDIR
-	fi
-	if [ "${EFI}" = "1" ]; then
-		efi_hddimg_populate $HDDDIR
-	fi
-
-	BLOCKS=`du -bks $HDDDIR | cut -f 1`
-	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
-
-	# Remove it since mkdosfs would fail when it exists
-	rm -f $HDDIMG
-	mkdosfs -n ${BOOTDD_VOLUME_ID} ${MKDOSFS_EXTRAOPTS} -C $HDDIMG $BLOCKS
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
-	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | sed 's/\(..\)\(..\)\(..\)\(..\)/\\x\4\\x\3\\x\2\\x\1/')\" }" | \
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
-	cd ${IMGDEPLOYDIR}
-
-	ln -sf ${IMAGE_NAME}.hdddirect ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect
-} 
-
-python do_bootdirectdisk() {
-    validate_disk_signature(d)
-    set_live_vm_vars(d, 'VM')
-    if d.getVar("PCBIOS") == "1":
-        bb.build.exec_func('build_syslinux_cfg', d)
-    if d.getVar("EFI") == "1":
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
-    disk_signature = d.getVar("DISK_SIGNATURE")
-
-    if not re.match(r'^[0-9a-fA-F]{8}$', disk_signature):
-        bb.fatal("DISK_SIGNATURE '%s' must be an 8 digit hex string" % disk_signature)
-
-DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
-
-run_qemu_img (){
-    type="$1"
-    qemu-img convert -O $type ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect ${IMGDEPLOYDIR}/${IMAGE_NAME}.$type
-
-    ln -sf ${IMAGE_NAME}.$type ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.$type
-}
-create_vmdk_image () {
-    run_qemu_img vmdk
-}
-
-create_vdi_image () {
-    run_qemu_img vdi
-}
-
-create_qcow2_image () {
-    run_qemu_img qcow2
-}
-
-python do_vmimg() {
-    if 'vmdk' in d.getVar('IMAGE_FSTYPES'):
-        bb.build.exec_func('create_vmdk_image', d)
-    if 'vdi' in d.getVar('IMAGE_FSTYPES'):
-        bb.build.exec_func('create_vdi_image', d)
-    if 'qcow2' in d.getVar('IMAGE_FSTYPES'):
-        bb.build.exec_func('create_qcow2_image', d)
-}
-
-addtask bootdirectdisk before do_vmimg
-addtask vmimg after do_bootdirectdisk before do_image_complete
-do_vmimg[depends] += "qemu-native:do_populate_sysroot"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index dee17ae9f966..40bd61480efd 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -138,9 +138,6 @@ def build_live(d):
 IMAGE_TYPE_live = "${@build_live(d)}"
 inherit ${IMAGE_TYPE_live}
 
-IMAGE_TYPE_vm = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2", "hdddirect"], "image-vm", "", d)}'
-inherit ${IMAGE_TYPE_vm}
-
 IMAGE_TYPE_container = '${@bb.utils.contains("IMAGE_FSTYPES", "container", "image-container", "", d)}'
 inherit ${IMAGE_TYPE_container}
 
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index cf946a6874ad..89d68c626f7a 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -254,10 +254,6 @@ IMAGE_TYPES = " \
     ubi ubifs multiubi \
     tar tar.gz tar.bz2 tar.xz tar.lz4 \
     cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
-    vmdk \
-    vdi \
-    qcow2 \
-    hdddirect \
     elf \
     wic wic.gz wic.bz2 wic.lzma \
     container \
@@ -269,7 +265,7 @@ IMAGE_TYPES = " \
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?= ""
 
-CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot ${COMPRESSIONTYPES}"
+CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 ${COMPRESSIONTYPES}"
 CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
@@ -287,6 +283,9 @@ CONVERSION_CMD_sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
 CONVERSION_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
 CONVERSION_CMD_bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
 CONVERSION_CMD_u-boot = "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
+CONVERSION_CMD_vmdk = "qemu-img convert -O vmdk ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
+CONVERSION_CMD_vdi = "qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
+CONVERSION_CMD_qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
 CONVERSION_DEPENDS_lzma = "xz-native"
 CONVERSION_DEPENDS_gz = "pigz-native"
 CONVERSION_DEPENDS_bz2 = "pbzip2-native"
@@ -297,6 +296,9 @@ CONVERSION_DEPENDS_zip = "zip-native"
 CONVERSION_DEPENDS_sum = "mtd-utils-native"
 CONVERSION_DEPENDS_bmap = "bmap-tools-native"
 CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
+CONVERSION_DEPENDS_vmdk = "qemu-native"
+CONVERSION_DEPENDS_vdi = "qemu-native"
+CONVERSION_DEPENDS_qcow2 = "qemu-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 4050a4123ba5..8805a3837ef6 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -19,7 +19,7 @@ class RunqemuTests(OESelftestTestCase):
         super(RunqemuTests, self).setUpLocal()
         self.recipe = 'core-image-minimal'
         self.machine =  'qemux86-64'
-        self.fstypes = "ext4 iso hddimg vmdk qcow2 vdi"
+        self.fstypes = "ext4 iso hddimg wic.vmdk wic.qcow2 wic.vdi"
         self.cmd_common = "runqemu nographic"
 
         # Avoid emit the same record multiple times.
@@ -74,7 +74,7 @@ SYSLINUX_TIMEOUT = "10"
     @OETestID(2005)
     def test_boot_recipe_image_vmdk(self):
         """Test runqemu recipe-image vmdk"""
-        cmd = "%s %s vmdk" % (self.cmd_common, self.recipe)
+        cmd = "%s %s wic.vmdk" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue('format=vmdk' in f.read(), "Failed: %s" % cmd)
@@ -82,7 +82,7 @@ SYSLINUX_TIMEOUT = "10"
     @OETestID(2006)
     def test_boot_recipe_image_vdi(self):
         """Test runqemu recipe-image vdi"""
-        cmd = "%s %s vdi" % (self.cmd_common, self.recipe)
+        cmd = "%s %s wic.vdi" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue('format=vdi' in f.read(), "Failed: %s" % cmd)
@@ -113,7 +113,7 @@ SYSLINUX_TIMEOUT = "10"
     @OETestID(2009)
     def test_boot_machine_slirp_qcow2(self):
         """Test runqemu machine slirp qcow2"""
-        cmd = "%s slirp qcow2 %s" % (self.cmd_common, self.machine)
+        cmd = "%s slirp wic.qcow2 %s" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue('format=qcow2' in f.read(), "Failed: %s" % cmd)
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index f145b5e6568d..927a9310ac24 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -19,7 +19,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 APPEND += "rootfstype=ext4 quiet"
 
 DEPENDS = "zip-native python3-pip-native"
-IMAGE_FSTYPES = "vmdk"
+IMAGE_FSTYPES = "wic.vmdk"
 
 inherit core-image module-base setuptools3
 
@@ -120,7 +120,7 @@ create_bundle_files () {
 	cd ${WORKDIR}
 	mkdir -p Yocto_Build_Appliance
 	cp *.vmx* Yocto_Build_Appliance
-	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
+	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
 	zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
 	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${IMGDEPLOYDIR}/Yocto_Build_Appliance.zip
 }
@@ -130,4 +130,4 @@ python do_bundle_files() {
     bb.build.exec_func('create_bundle_files', d)
 }
 
-addtask bundle_files after do_vmimg before do_image_complete
+addtask bundle_files after do_image_wic before do_image_complete
diff --git a/scripts/runqemu b/scripts/runqemu
index 239c48fface0..fd2717ec87ee 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -96,11 +96,11 @@ Examples:
   runqemu qemux86-64 core-image-sato ext4
   runqemu qemux86-64 wic-image-minimal wic
   runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
-  runqemu qemux86 iso/hddimg/vmdk/qcow2/vdi/ramfs/cpio.gz...
+  runqemu qemux86 iso/hddimg/wic.vmdk/wic.qcow2/wic.vdi/ramfs/cpio.gz...
   runqemu qemux86 qemuparams="-m 256"
   runqemu qemux86 bootparams="psplash=false"
-  runqemu path/to/<image>-<machine>.vmdk
   runqemu path/to/<image>-<machine>.wic
+  runqemu path/to/<image>-<machine>.wic.vmdk
 """)
 
 def check_tun():
@@ -220,7 +220,8 @@ class BaseConfig(object):
         self.snapshot = False
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
                         'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
-        self.vmtypes = ('hddimg', 'hdddirect', 'wic', 'vmdk', 'qcow2', 'vdi', 'iso')
+        self.vmtypes = ('hddimg', 'hdddirect', 'wic', 'wic.vmdk',
+                        'wic.qcow2', 'wic.vdi', 'iso')
         self.network_device = "-device e1000,netdev=net0,mac=@MAC@"
         # Use different mac section for tap and slirp to avoid
         # conflicts, e.g., when one is running with tap, the other is
@@ -987,6 +988,8 @@ class BaseConfig(object):
     def setup_rootfs(self):
         if self.get('QB_ROOTFS') == 'none':
             return
+        if 'wic.' in self.fstype:
+            self.fstype = self.fstype[4:]
         rootfs_format = self.fstype if self.fstype in ('vmdk', 'qcow2', 'vdi') else 'raw'
 
         qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
-- 
1.9.1


