Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CDFF9607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 14:21:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 29 Jul 2016 07:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,439,1464678000"; d="scan'208";a="741510824"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2016 07:21:12 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 700646A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 07:20:59 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 16:44:37 +0300
Message-Id: <6b6fbba91ea7ac508bc8f8c53287ac90bdcff1b7.1469799731.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1469799731.git.ed.bartosh@linux.intel.com>
References: <cover.1469799731.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1469799731.git.ed.bartosh@linux.intel.com>
References: <cover.1469799731.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v5 1/2] image creation: support converting masked types
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
X-List-Received-Date: Fri, 29 Jul 2016 14:21:33 -0000

From: Patrick Ohly <patrick.ohly@intel.com>

Conversion to vmdk/vdi/qcow2 is also useful for other base images
types, not just for .hdddirect. This can be achieved by definining
them as conversion commands and relying on the conversion chaining
to convert arbitrary base images.

For this to work when the base image gets created by a masked image
type, the additional conversion commands now get executed in a
do_image_complete prefunc.

With all of that in place it becomes possible to remove the special
purpose code for vmdk/vdi/qcow2 types from image-vm.bbclass and
several other classes. This has (intentional!) implications on the
valid IMAGE_FSTYPES and the file suffices: now
"hdddirect.vmdk/vdi/qcow2" must be used as IMAGE_FSTYPES to select the
former special-case types "vmdk/vdi/qcow2", and the image files and
links will also have the extra .hdddirect suffix.

This is intentional because it makes it makes it possible to
distinguish between virtual machine images created from .hdddirect and
those created from other base images.

The new support for virtual machine images can also be combined with
compression, thus making it possible to create image files for
publication in compressed format, for example with:
  IMAGE_FSTYPES = "hdddirect.vdi.xz"

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-live.bbclass                    |  2 +-
 meta/classes/image-vm.bbclass                      | 33 ++--------
 meta/classes/image.bbclass                         | 73 +++++++++++++++-------
 meta/classes/image_types.bbclass                   | 20 ++++--
 meta/conf/documentation.conf                       |  1 -
 .../images/build-appliance-image_15.0.0.bb         |  6 +-
 6 files changed, 75 insertions(+), 60 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index f0e6647..039a977 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -43,7 +43,7 @@ ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
 INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
 
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ext4"
 
 IMAGE_TYPEDEP_live = "ext4"
 IMAGE_TYPEDEP_iso = "ext4"
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 72f7b4b..d37ce0a 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -26,14 +26,11 @@ do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
                                ${PN}:do_image_${VM_ROOTFS_TYPE} \
                                "
 
-IMAGE_TYPEDEP_vmdk = "${VM_ROOTFS_TYPE}"
-IMAGE_TYPEDEP_vdi = "${VM_ROOTFS_TYPE}"
-IMAGE_TYPEDEP_qcow2 = "${VM_ROOTFS_TYPE}"
+VM_ROOTFS_TYPE ?= "ext4"
 IMAGE_TYPEDEP_hdddirect = "${VM_ROOTFS_TYPE}"
-IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect"
+IMAGE_TYPES_MASKED += "hdddirect"
 
-VM_ROOTFS_TYPE ?= "ext4"
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}"
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ext4"
 
 # Used by bootloader
 LABELS_VM ?= "boot"
@@ -144,27 +141,5 @@ run_qemu_img (){
     qemu-img convert -O $type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.$type
     ln -sf ${IMAGE_NAME}.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
 }
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
-    if 'vmdk' in d.getVar('IMAGE_FSTYPES', True):
-        bb.build.exec_func('create_vmdk_image', d)
-    if 'vdi' in d.getVar('IMAGE_FSTYPES', True):
-        bb.build.exec_func('create_vdi_image', d)
-    if 'qcow2' in d.getVar('IMAGE_FSTYPES', True):
-        bb.build.exec_func('create_qcow2_image', d)
-}
 
-addtask bootdirectdisk before do_vmimg
-addtask vmimg after do_bootdirectdisk before do_image_complete
-do_vmimg[depends] += "qemu-native:do_populate_sysroot"
+addtask bootdirectdisk before do_image_complete
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index af789f4..57e0744 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -127,6 +127,13 @@ do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 
 do_build[depends] += "virtual/kernel:do_deploy"
 
+def image_type_active(type, d):
+    '''True if any entry in IMAGE_FSTYPES is type or depends on it.'''
+    for entry in d.getVar("IMAGE_FSTYPES", True).split():
+        if entry == type or entry.startswith(type + "."):
+            return True
+    return False
+
 def build_live(d):
     if bb.utils.contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
         d.setVar('NOISO', bb.utils.contains('IMAGE_FSTYPES', "iso", "0", "1", d))
@@ -139,7 +146,7 @@ def build_live(d):
 IMAGE_TYPE_live = "${@build_live(d)}"
 inherit ${IMAGE_TYPE_live}
 
-IMAGE_TYPE_vm = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2", "hdddirect"], "image-vm", "", d)}'
+IMAGE_TYPE_vm = '${@ "image-vm" if image_type_active("hdddirect", d) else ""}'
 inherit ${IMAGE_TYPE_vm}
 
 python () {
@@ -414,9 +421,7 @@ python () {
         cmds = []
         subimages = []
         realt = t
-
-        if t in maskedtypes:
-            continue
+        ismasked = t in maskedtypes
 
         localdata = bb.data.createCopy(d)
         debug = ""
@@ -434,12 +439,14 @@ python () {
         localdata.delVar('DATETIME')
         localdata.delVar('TMPDIR')
 
-        image_cmd = localdata.getVar("IMAGE_CMD", True)
-        vardeps.add('IMAGE_CMD_' + realt)
-        if image_cmd:
-            cmds.append("\t" + image_cmd)
-        else:
-            bb.fatal("No IMAGE_CMD defined for IMAGE_FSTYPES entry '%s' - possibly invalid type name or missing support class" % t)
+        if not ismasked:
+            image_cmd = localdata.getVar("IMAGE_CMD", True)
+            vardeps.add('IMAGE_CMD_' + realt)
+            if image_cmd:
+                cmds.append("\t" + image_cmd)
+            else:
+                bb.fatal("No IMAGE_CMD defined for IMAGE_FSTYPES entry '%s' - possibly invalid type name or missing support class" % t)
+
         cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
 
         # Since a copy of IMAGE_CMD_xxx will be inlined within do_image_xxx,
@@ -487,17 +494,41 @@ python () {
 
         t = t.replace("-", "_").replace(".", "_")
 
-        d.setVar('do_image_%s' % t, '\n'.join(cmds))
-        d.setVarFlag('do_image_%s' % t, 'func', '1')
-        d.setVarFlag('do_image_%s' % t, 'fakeroot', '1')
-        d.setVarFlag('do_image_%s' % t, 'prefuncs', debug + 'set_image_size')
-        d.setVarFlag('do_image_%s' % t, 'postfuncs', 'create_symlinks')
-        d.setVarFlag('do_image_%s' % t, 'subimages', ' '.join(subimages))
-        d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
-        d.appendVarFlag('do_image_%s' % t, 'vardepsexclude', 'DATETIME')
-
-        bb.debug(2, "Adding type %s before %s, after %s" % (t, 'do_image_complete', after))
-        bb.build.addtask('do_image_%s' % t, 'do_image_complete', after, d)
+        if ismasked:
+            # If the type is masked, then some unknown task (for example,
+            # do_bootdirectdisk in boot-directdisk.bbclass for IMAGE_FSTYPES hdddirect)
+            # will create the actual base image. All we know is that the files will
+            # be there right before do_image_complete. So in that case we put the
+            # conversion commands into a do_image_complete prefunc. The 'after'
+            # dependencies can be ignored because we are guaranteed to run after
+            # all of them, and the conversion dependencies are dealt with
+            # by making do_rootfs depend on them.
+            d.setVar('image_%s_conversion' % t, '\n'.join(cmds))
+            d.setVarFlag('image_%s_conversion' % t, 'func', '1')
+            d.setVarFlag('image_%s_conversion' % t, 'fakeroot', '1')
+            d.appendVarFlag('image_%s_conversion' % t, 'vardeps', ' '.join(vardeps))
+            d.appendVarFlag('image_%s_conversion' % t, 'vardepsexclude', 'DATETIME')
+            prefuncs = set((d.getVarFlag('do_image_complete', 'prefuncs', True) or '').split())
+            prefuncs.add('image_%s_conversion' % t)
+            # create_symlinks must run after the commands which create the real files
+            # because create_symlinks checks for them.
+            prefuncs.discard('create_symlinks')
+            d.setVarFlag('do_image_complete', 'prefuncs', ' '.join(sorted(prefuncs)) + ' create_symlinks')
+            d.appendVarFlag('do_image_complete', 'subimages', ' ' + ' '.join(subimages))
+        else:
+            # If not masked, we generate a new task which executes the image
+            # creation and the conversion commands.
+            d.setVar('do_image_%s' % t, '\n'.join(cmds))
+            d.setVarFlag('do_image_%s' % t, 'func', '1')
+            d.setVarFlag('do_image_%s' % t, 'fakeroot', '1')
+            d.setVarFlag('do_image_%s' % t, 'prefuncs', debug + 'set_image_size')
+            d.setVarFlag('do_image_%s' % t, 'postfuncs', 'create_symlinks')
+            d.setVarFlag('do_image_%s' % t, 'subimages', ' '.join(subimages))
+            d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
+            d.appendVarFlag('do_image_%s' % t, 'vardepsexclude', 'DATETIME')
+
+            bb.debug(2, "Adding type %s before %s, after %s" % (t, 'do_image_complete', after))
+            bb.build.addtask('do_image_%s' % t, 'do_image_complete', after, d)
 }
 
 #
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 2b97397..c386bb6 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -284,6 +284,7 @@ IMAGE_DEPENDS_cramfs = "util-linux-native"
 IMAGE_DEPENDS_ext2 = "e2fsprogs-native"
 IMAGE_DEPENDS_ext3 = "e2fsprogs-native"
 IMAGE_DEPENDS_ext4 = "e2fsprogs-native"
+IMAGE_DEPENDS_hdddirect = "${IMAGE_DEPENDS_ext4}"
 IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-xz = "squashfs-tools-native"
@@ -295,6 +296,9 @@ IMAGE_DEPENDS_multiubi = "mtd-utils-native"
 IMAGE_DEPENDS_wic = "parted-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
+# TODO: several other variations are now also possible, for example ext4.zip,
+# hdddirect.xz, hdddirect.vdi.xz. Which variations are supposed to be listed here
+# and which not? Generate all possible variations dynamically?
 IMAGE_TYPES = " \
     jffs2 jffs2.sum \
     cramfs \
@@ -308,15 +312,15 @@ IMAGE_TYPES = " \
     ubi ubifs multiubi \
     tar tar.gz tar.bz2 tar.xz tar.lz4 \
     cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
-    vmdk \
-    vdi \
-    qcow2 \
+    hdddirect.vmdk \
+    hdddirect.vdi \
+    hdddirect.qcow2 \
     hdddirect \
     elf \
     wic wic.gz wic.bz2 wic.lzma \
 "
 
-COMPRESSIONTYPES = "gz bz2 lzma xz lz4 zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap"
+COMPRESSIONTYPES = "gz bz2 lzma xz lz4 zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap vmdk vdi qcow2"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
@@ -324,6 +328,9 @@ COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${X
 COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
 COMPRESS_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
+COMPRESS_CMD_vmdk = "qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
+COMPRESS_CMD_vdi = "qemu-img convert -O vdi ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
+COMPRESS_CMD_qcow2 = "qemu-img convert -O qcow2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
 COMPRESS_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
 COMPRESS_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
 COMPRESS_CMD_sha224sum = "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
@@ -339,6 +346,9 @@ COMPRESS_DEPENDS_lz4 = "lz4-native"
 COMPRESS_DEPENDS_zip = "zip-native"
 COMPRESS_DEPENDS_sum = "mtd-utils-native"
 COMPRESS_DEPENDS_bmap = "bmap-tools-native"
+COMPRESS_DEPENDS_vmdk = "qemu-native"
+COMPRESS_DEPENDS_vdi = "qemu-native"
+COMPRESS_DEPENDS_qcow2 = "qemu-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
@@ -349,7 +359,7 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 IMAGE_EXTENSION_live = "hddimg iso"
 
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
-# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
+# images that will not be built at do_rootfs time: hdddirect, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
 
 # The WICVARS variable is used to define list of bitbake variables used in wic code
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 51c4116..35e487c 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -56,7 +56,6 @@ do_testsdk[doc] = "Installs an SDK and performs runtime tests on the tools insta
 do_uboot_mkimage[doc] = "Creates a uImage file from the kernel for the U-Boot bootloader"
 do_unpack[doc] = "Unpacks the source code into a working directory"
 do_validate_branches[doc] = "Ensures that the source/meta branches are on the locations specified by their SRCREV values for a linux-yocto style kernel"
-do_vmimg[doc] = "Creates an image for use with VMware or VirtualBox compatible virtual machine hosts (based on IMAGE_FSTYPES either .vmdk or .vdi)"
 
 # DESCRIPTIONS FOR VARIABLES #
 
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index dc621d6..957b8cf 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -18,7 +18,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 APPEND += "rootfstype=ext4 quiet"
 
 DEPENDS = "zip-native"
-IMAGE_FSTYPES = "vmdk"
+IMAGE_FSTYPES = "hdddirect.vmdk"
 
 inherit core-image module-base
 
@@ -101,7 +101,7 @@ create_bundle_files () {
 	cd ${WORKDIR}
 	mkdir -p Yocto_Build_Appliance
 	cp *.vmx* Yocto_Build_Appliance
-	ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
+	ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
 	zip -r ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
 	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance.zip 
 }
@@ -111,5 +111,5 @@ python do_bundle_files() {
     bb.build.exec_func('create_bundle_files', d)
 }
 
-addtask bundle_files after do_vmimg before do_build
+addtask bundle_files after do_image_complete before do_build
 do_bundle_files[nostamp] = "1"
-- 
2.1.4


