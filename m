Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3630870331
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 18:08:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2015 11:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,548,1427785200"; d="scan'208";a="581512553"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 03 Jun 2015 11:08:57 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Wed,  3 Jun 2015 11:07:23 -0700
Message-Id: <1433354849-16843-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
References: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 1/7] image: Support for VDI
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
X-List-Received-Date: Wed, 03 Jun 2015 18:08:56 -0000

Added support for VirtualBox VDI format. The support was
implemented by merging with the already existing VMDK support
for VM player by creating a new class image-vm.bbclass.
This class replaces the previous VMDK only image-vmdk.class.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/image-vm.bbclass    | 38 ++++++++++++++++++++++++++++++++++++++
 meta/classes/image-vmdk.bbclass  | 35 -----------------------------------
 meta/classes/image.bbclass       |  6 +++---
 meta/classes/image_types.bbclass |  5 +++--
 meta/lib/oe/image.py             |  4 ++--
 5 files changed, 46 insertions(+), 42 deletions(-)
 create mode 100644 meta/classes/image-vm.bbclass
 delete mode 100644 meta/classes/image-vmdk.bbclass

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
new file mode 100644
index 0000000..fdfd14f
--- /dev/null
+++ b/meta/classes/image-vm.bbclass
@@ -0,0 +1,38 @@
+
+SYSLINUX_ROOT ?= "root=/dev/sda2"
+SYSLINUX_PROMPT ?= "0"
+SYSLINUX_TIMEOUT ?= "10"
+SYSLINUX_LABELS = "boot"
+LABELS_append = " ${SYSLINUX_LABELS} "
+
+# need to define the dependency and the ROOTFS for directdisk
+do_bootdirectdisk[depends] += "${PN}:do_rootfs"
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
+
+# creating VM images relies on having a hddimg so ensure we inherit it here.
+inherit boot-directdisk
+
+IMAGE_TYPEDEP_vmdk = "ext3"
+IMAGE_TYPEDEP_vdi = "ext3"
+IMAGE_TYPES_MASKED += "vmdk vdi"
+
+create_vmdk_image () {
+    qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
+    ln -sf ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
+}
+
+create_vdi_image () {
+    qemu-img convert -O vdi ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vdi
+    ln -sf ${IMAGE_NAME}.vdi ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vdi
+}
+
+python do_vmimg() {
+    if 'vmdk' in d.getVar('IMAGE_FSTYPES', True):
+        bb.build.exec_func('create_vmdk_image', d)
+    if 'vdi' in d.getVar('IMAGE_FSTYPES', True):
+        bb.build.exec_func('create_vdi_image', d)        
+}
+
+addtask vmimg after do_bootdirectdisk before do_build
+do_vmimg[depends] += "qemu-native:do_populate_sysroot"
+
diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
deleted file mode 100644
index 77b7fac..0000000
--- a/meta/classes/image-vmdk.bbclass
+++ /dev/null
@@ -1,35 +0,0 @@
-
-#NOISO = "1"
-
-SYSLINUX_ROOT ?= "root=/dev/sda2"
-SYSLINUX_PROMPT ?= "0"
-SYSLINUX_TIMEOUT ?= "10"
-SYSLINUX_LABELS = "boot"
-LABELS_append = " ${SYSLINUX_LABELS} "
-
-# need to define the dependency and the ROOTFS for directdisk
-do_bootdirectdisk[depends] += "${PN}:do_rootfs"
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
-
-# creating VMDK relies on having a live hddimg so ensure we
-# inherit it here.
-#inherit image-live
-inherit boot-directdisk
-
-IMAGE_TYPEDEP_vmdk = "ext3"
-IMAGE_TYPES_MASKED += "vmdk"
-
-create_vmdk_image () {
-	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
-	ln -sf ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
-}
-
-python do_vmdkimg() {
-        bb.build.exec_func('create_vmdk_image', d)
-}
-
-#addtask vmdkimg after do_bootimg before do_build
-addtask vmdkimg after do_bootdirectdisk before do_build
-
-do_vmdkimg[depends] += "qemu-native:do_populate_sysroot" 
-
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 58b4add..64ae2cb 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -130,10 +130,10 @@ def build_live(d):
     return "image-live"
 
 IMAGE_TYPE_live = "${@build_live(d)}"
-
 inherit ${IMAGE_TYPE_live}
-IMAGE_TYPE_vmdk = '${@bb.utils.contains("IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'
-inherit ${IMAGE_TYPE_vmdk}
+
+IMAGE_TYPE_vm = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi"], "image-vm", "", d)}'
+inherit ${IMAGE_TYPE_vm}
 
 python () {
     deps = " " + imagetypes_getdepends(d)
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 72c7337..d86d108 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -13,7 +13,7 @@ def imagetypes_getdepends(d):
     deps = []
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
-        if type in ["vmdk", "live", "iso", "hddimg"]:
+        if type in ["vmdk", "vdi", "live", "iso", "hddimg"]:
             type = "ext3"
         basetype = type
         for ctype in ctypes:
@@ -155,6 +155,7 @@ IMAGE_TYPES = " \
     tar tar.gz tar.bz2 tar.xz tar.lz4 \
     cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
     vmdk \
+    vdi \
     elf \
 "
 
@@ -181,5 +182,5 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 IMAGE_EXTENSION_live = "hddimg iso"
 
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
-# images that will not be built at do_rootfs time: vmdk, hddimg, iso, etc.
+# images that will not be built at do_rootfs time: vmdk, vdi, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 0ce303d..40f6151 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -66,7 +66,7 @@ class ImageDepGraph(object):
         return graph
 
     def _clean_graph(self):
-        # Live and VMDK images will be processed via inheriting
+        # Live and VMDK/VDI images will be processed via inheriting
         # bbclass and does not get processed here. Remove them from the fstypes
         # graph. Their dependencies are already added, so no worries here.
         remove_list = (self.d.getVar('IMAGE_TYPES_MASKED', True) or "").split()
@@ -76,7 +76,7 @@ class ImageDepGraph(object):
 
     def _image_base_type(self, type):
         ctypes = self.d.getVar('COMPRESSIONTYPES', True).split()
-        if type in ["vmdk", "live", "iso", "hddimg"]:
+        if type in ["vmdk", "vdi", "live", "iso", "hddimg"]:
             type = "ext3"
         basetype = type
         for ctype in ctypes:
-- 
1.9.1


