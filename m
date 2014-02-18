Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4BDA16E8E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:50:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2014 05:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,501,1389772800"; d="scan'208";a="485189762"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2014 05:49:47 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2014 15:49:43 +0200
Message-Id: <56ca3eefe7d19484d459821cb6910e607acdcd31.1392731055.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392731055.git.laurentiu.palcu@intel.com>
References: <cover.1392731055.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392731055.git.laurentiu.palcu@intel.com>
References: <cover.1392731055.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] image*.bbclass, bootimg.bbclass: add image type dependencies
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
X-List-Received-Date: Tue, 18 Feb 2014 13:50:14 -0000

The following dependencies were manually added in the image creation
code. However, in order to have an image dependency mechanism in place,
use a new variable, IMAGE_TYPEDEP, to declare that an image type depends
on another being already created.

The following dependencies are added by this commit:

elf -> cpio.gz
live -> ext3
vmdk -> ext3
iso -> ext3
hddimg -> ext3

This commit adds also another new variable: IMAGE_TYPES_MASKED. Currently,
masking out certain types from IMAGE_FSTYPES was hardcoded in the image
creation code.

[YOCTO #5830]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/bootimg.bbclass     |    4 ++++
 meta/classes/image-live.bbclass  |    3 +++
 meta/classes/image-vmdk.bbclass  |    3 +++
 meta/classes/image_types.bbclass |    5 +++++
 4 files changed, 15 insertions(+)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 395085d..c370bd6 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -232,4 +232,8 @@ python do_bootimg() {
     bb.build.exec_func('build_iso', d)
 }
 
+IMAGE_TYPEDEP_iso = "ext3"
+IMAGE_TYPEDEP_hddimg = "ext3"
+IMAGE_TYPES_MASKED += "iso hddimg"
+
 addtask bootimg before do_build
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index bfb59f8..c7e6937 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -13,3 +13,6 @@ do_bootimg[depends] += "${INITRD_IMAGE}:do_rootfs"
 do_bootimg[depends] += "${PN}:do_rootfs"
 
 inherit bootimg
+
+IMAGE_TYPEDEP_live = "ext3"
+IMAGE_TYPES_MASKED += "live"
diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
index 6983e5c..6a98f17 100644
--- a/meta/classes/image-vmdk.bbclass
+++ b/meta/classes/image-vmdk.bbclass
@@ -16,6 +16,9 @@ ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
 #inherit image-live
 inherit boot-directdisk
 
+IMAGE_TYPEDEP_vmdk = "ext3"
+IMAGE_TYPES_MASKED += "vmdk"
+
 create_vmdk_image () {
 	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
 	ln -sf ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 944e6db..200e2e7 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -84,6 +84,7 @@ IMAGE_CMD_elf () {
 	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf && rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf
 	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
 }
+IMAGE_TYPEDEP_elf = "cpio.gz"
 
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 
@@ -150,3 +151,7 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 
 # Use IMAGE_EXTENSION_xxx to map image type 'xxx' with real image file extension name(s) for Hob
 IMAGE_EXTENSION_live = "hddimg iso"
+
+# The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
+# images that will not be built at do_rootfs time: vmdk, hddimg, iso, etc.
+IMAGE_TYPES_MASKED ?= ""
-- 
1.7.9.5


