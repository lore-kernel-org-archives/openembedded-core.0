Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E0B6C76AB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:04:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 25 Aug 2015 02:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="548073848"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2015 02:04:50 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B0EE36A4083;
	Tue, 25 Aug 2015 02:04:00 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:23 +0300
Message-Id: <5615adf8a3d194f11430dc722ae518698cb9b31c.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
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
X-List-Received-Date: Tue, 25 Aug 2015 09:04:53 -0000

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


