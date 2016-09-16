Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC136FEFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 14:43:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 16 Sep 2016 07:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,345,1470726000"; d="scan'208";a="1051844311"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2016 07:43:43 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 4E8136A4006;
	Fri, 16 Sep 2016 07:43:17 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 17:32:53 +0300
Message-Id: <1474036373-13300-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] image_types: add parted-native to do_image_wic depends
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
X-List-Received-Date: Fri, 16 Sep 2016 14:43:43 -0000

As parted is always used by wic it makes sense to make do_image_wic
dependent on parted-native:do_populate_sysroot. This should help
to avoid adding it to all wic image recipes.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 +-
 meta/classes/image_types.bbclass                       | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 754689f..58bf5a5 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -7,7 +7,7 @@ IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
 IMAGE_FSTYPES = "wic"
 RM_OLD_IMAGE = "1"
 
-DEPENDS = "syslinux syslinux-native parted-native dosfstools-native mtools-native gptfdisk-native"
+DEPENDS = "syslinux syslinux-native dosfstools-native mtools-native gptfdisk-native"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5ef6f60..0bb6252 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -218,6 +218,7 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
+do_image_wic[depends] += "parted-native:do_populate_sysroot"
 
 python do_write_wks_template () {
     """Write out expanded template contents to WKS_FULL_PATH."""
-- 
2.1.4


