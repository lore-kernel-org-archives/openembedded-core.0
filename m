Return-Path: <chee.yang.lee@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAE77D719
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 07:11:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2019 00:11:56 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 00:11:56 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 14:41:02 +0800
Message-Id: <1557297662-16300-5-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
References: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
Subject: [PATCH 4/4] image_types_wic: add dependency for wic based image installer
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
X-List-Received-Date: Wed, 08 May 2019 07:11:55 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

initramfs and rootfs image are required to build wic based
image installer, add both as dependency for do_image_wic.

initiate default value for LIVE_ROOTFS_TYPE, INITRD_IMAGE_LIVE
and INITRD_LIVE

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/classes/image_types_wic.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 5b40a9e..e4f2b8f 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -102,9 +102,15 @@ python () {
                 # a variable and let the metadata deal with the deps.
                 d.setVar('_WKS_TEMPLATE', body)
                 bb.build.addtask('do_write_wks_template', 'do_image_wic', None, d)
+        d.appendVarFlag('do_image_wic', 'depends', ' %s:do_image_complete' % d.getVar('INITRD_IMAGE_LIVE'))
         bb.build.addtask('do_image_wic', 'do_image_complete', None, d)
 }
 
+LIVE_ROOTFS_TYPE ?= "ext4"
+INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
+INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}"
+IMAGE_TYPEDEP_wic = "${LIVE_ROOTFS_TYPE}"
+
 #
 # Write environment variables used by wic
 # to tmp/sysroots/<machine>/imgdata/<image>.env
-- 
2.7.4


