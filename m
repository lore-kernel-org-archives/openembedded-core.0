Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4A976959
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:06:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 11 Aug 2015 12:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,655,1432623600"; d="scan'208";a="623570892"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2015 12:06:54 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Tue, 11 Aug 2015 12:02:43 -0700
Message-Id: <1439319763-29159-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439319763-29159-1-git-send-email-juro.bystricky@intel.com>
References: <1439319763-29159-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 2/2] build-appliance-image: use ext4 for rootfs
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

Changes due to IMAGES_FSTYPES "vmdk" and "vdi" now defaulting to ext4.
Switching Build Appliance to Ext4 will bring it more in-line with other BSPs.

[YOCTO #8096]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/images/build-appliance-image_12.0.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_12.0.1.bb b/meta/recipes-core/images/build-appliance-image_12.0.1.bb
index 8e71b36..0a86ba4 100644
--- a/meta/recipes-core/images/build-appliance-image_12.0.1.bb
+++ b/meta/recipes-core/images/build-appliance-image_12.0.1.bb
@@ -14,7 +14,7 @@ IMAGE_FEATURES += "x11-base package-management splash"
 IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
 # Do a quiet boot with limited console messages
-APPEND += "quiet"
+APPEND += "rootfstype=ext4 quiet"
 
 DEPENDS = "zip-native"
 IMAGE_FSTYPES = "vmdk"
@@ -27,9 +27,9 @@ SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmxf \
           "
 
-IMAGE_CMD_ext3_append () {
+IMAGE_CMD_ext4_append () {
 	# We don't need to reserve much space for root, 0.5% is more than enough
-	tune2fs -m 0.5 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
+	tune2fs -m 0.5 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4
 }
 
 fakeroot do_populate_poky_src () {
-- 
1.9.1


