Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 396A576953
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:06:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 11 Aug 2015 12:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,655,1432623600"; d="scan'208";a="623570882"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2015 12:06:53 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Tue, 11 Aug 2015 12:02:42 -0700
Message-Id: <1439319763-29159-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] IMAGES_FSTYPES: default to EXT4
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
X-List-Received-Date: Tue, 11 Aug 2015 19:06:58 -0000

The following IMAGES_FSTYPES defaulted to ext3:
"vmdk", "vdi", "qcow2", "live", "iso", "hddimg"

This patch changes the default for those IMAGES_FSTYPES to
ext4 in order to bring the images more in line with other BSPs.

Besides improvements in performance and reliability ext4 provides
additional functionality as well (option to turn off the journaling,
dynamic resizing of VDI volumes etc.).

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/bootimg.bbclass     | 4 ++--
 meta/classes/image-live.bbclass  | 4 ++--
 meta/classes/image-vm.bbclass    | 8 ++++----
 meta/classes/image_types.bbclass | 2 +-
 meta/lib/oe/image.py             | 4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 5adcacc..ec9d0b7 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -296,8 +296,8 @@ python do_bootimg() {
     bb.build.exec_func('build_iso', d)
 }
 
-IMAGE_TYPEDEP_iso = "ext3"
-IMAGE_TYPEDEP_hddimg = "ext3"
+IMAGE_TYPEDEP_iso = "ext4"
+IMAGE_TYPEDEP_hddimg = "ext4"
 IMAGE_TYPES_MASKED += "iso hddimg"
 
 addtask bootimg before do_build
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 52b6de7..fa7a131 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -7,12 +7,12 @@ SYSLINUX_TIMEOUT ?= "50"
 SYSLINUX_LABELS ?= "boot install"
 LABELS_append = " ${SYSLINUX_LABELS} "
 
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext4"
 
 do_bootimg[depends] += "${INITRD_IMAGE}:do_rootfs"
 do_bootimg[depends] += "${PN}:do_rootfs"
 
 inherit bootimg
 
-IMAGE_TYPEDEP_live = "ext3"
+IMAGE_TYPEDEP_live = "ext4"
 IMAGE_TYPES_MASKED += "live"
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 28519c8..bc0503b 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -7,14 +7,14 @@ LABELS_append = " ${SYSLINUX_LABELS} "
 
 # need to define the dependency and the ROOTFS for directdisk
 do_bootdirectdisk[depends] += "${PN}:do_rootfs"
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext4"
 
 # creating VM images relies on having a hddimg so ensure we inherit it here.
 inherit boot-directdisk
 
-IMAGE_TYPEDEP_vmdk = "ext3"
-IMAGE_TYPEDEP_vdi = "ext3"
-IMAGE_TYPEDEP_qcow2 = "ext3"
+IMAGE_TYPEDEP_vmdk = "ext4"
+IMAGE_TYPEDEP_vdi = "ext4"
+IMAGE_TYPEDEP_qcow2 = "ext4"
 IMAGE_TYPES_MASKED += "vmdk vdi qcow2"
 
 create_vmdk_image () {
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index cc789fc..35ceb7b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -14,7 +14,7 @@ def imagetypes_getdepends(d):
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
         if type in ["vmdk", "vdi", "qcow2", "live", "iso", "hddimg"]:
-            type = "ext3"
+            type = "ext4"
         basetype = type
         for ctype in ctypes:
             if type.endswith("." + ctype):
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 40f6151..699c30f 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -76,8 +76,8 @@ class ImageDepGraph(object):
 
     def _image_base_type(self, type):
         ctypes = self.d.getVar('COMPRESSIONTYPES', True).split()
-        if type in ["vmdk", "vdi", "live", "iso", "hddimg"]:
-            type = "ext3"
+        if type in ["vmdk", "vdi", "qcow2", "live", "iso", "hddimg"]:
+            type = "ext4"
         basetype = type
         for ctype in ctypes:
             if type.endswith("." + ctype):
-- 
1.9.1


