Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 00C8C76AB4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:56:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 20 Aug 2015 04:56:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787700992"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2015 04:56:57 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 562386A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:56:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:25 +0300
Message-Id: <da3060504d7afecd5f6b93e74253a5444fc60a38.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 12/17] image_types.bbclass: add wic image type
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
X-List-Received-Date: Thu, 20 Aug 2015 11:56:57 -0000

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
index 8547574..cdd66ff 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -154,6 +154,16 @@ IMAGE_CMD_ubi = "multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}" "${UBI_VOLNAM
 
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
@@ -182,6 +192,7 @@ IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 IMAGE_DEPENDS_multiubi = "mtd-utils-native"
+IMAGE_DEPENDS_wic = "parted-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
@@ -201,6 +212,7 @@ IMAGE_TYPES = " \
     vdi \
     qcow2 \
     elf \
+    wic wic.gz wic.bz2 wic.lzma \
 "
 
 COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
-- 
2.1.4


