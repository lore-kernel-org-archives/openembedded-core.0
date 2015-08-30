Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F036B76E9F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 17:47:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Aug 2015 10:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="793848383"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Aug 2015 10:47:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 423EB6A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:46:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 20:47:06 +0300
Message-Id: <a07c8b4d6cac5af9c86f1a658f3c0bb72e1c5c03.1440956535.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/12] image_types.bbclass: add wic image type
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
X-List-Received-Date: Sun, 30 Aug 2015 17:47:24 -0000

wic image type is used to produce partitioned images.

Image configuration should be stored in either <recipe>.<machine>.wks
or <recipe>.wks file.
.wks file should be put to the same location as image recipe
and have the same name.

[YOCTO #7672]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index acee227..ecb066b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -162,6 +162,16 @@ IMAGE_CMD_ubi = "multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}" "${UBI_VOLNAM
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
 
+IMAGE_CMD_wic () {
+	out=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}
+	wks=${FILE_DIRNAME}/${IMAGE_BASENAME}.${MACHINE}.wks
+	[ -e $wks ] || wks=${FILE_DIRNAME}/${IMAGE_BASENAME}.wks
+	[ -e $wks ] || bbfatal "Kiskstart file $wks doesn't exist"
+	BUILDDIR=${TOPDIR} wic create $wks --vars ${STAGING_DIR_TARGET}/imgdata/ -e ${IMAGE_BASENAME} -o $out/
+	mv $out/build/${IMAGE_BASENAME}*.direct $out.rootfs.wic
+	rm -rf $out/
+}
+
 EXTRA_IMAGECMD = ""
 
 inherit siteinfo
@@ -190,6 +200,7 @@ IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 IMAGE_DEPENDS_multiubi = "mtd-utils-native"
+IMAGE_DEPENDS_wic = "parted-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
@@ -209,6 +220,7 @@ IMAGE_TYPES = " \
     vdi \
     qcow2 \
     elf \
+    wic wic.gz wic.bz2 wic.lzma \
 "
 
 COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
-- 
2.1.4


