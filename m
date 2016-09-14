Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0340673232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 23:15:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 14 Sep 2016 16:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,336,1470726000"; d="scan'208";a="1050407365"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga002.jf.intel.com with ESMTP; 14 Sep 2016 16:15:31 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 16:15:24 -0700
Message-Id: <1473894924-10137-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] build-appliance-image: Create image in correct location
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
X-List-Received-Date: Wed, 14 Sep 2016 23:15:34 -0000

Due to the variable IMGDEPLOYDIR being recently re-defined, the Build Appliance image
ended up being created in a wrong location.

This patch assures the final ZIP image is created in identical location as before:

   tmp/deploy/images/<machine>/Yocto_Build_Apliance.zip

[YOCTO#10274]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 1911d4c..922db14 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -102,8 +102,8 @@ create_bundle_files () {
 	mkdir -p Yocto_Build_Appliance
 	cp *.vmx* Yocto_Build_Appliance
 	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
-	zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
-	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${IMGDEPLOYDIR}/Yocto_Build_Appliance.zip
+	zip -r ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
+	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance.zip
 }
 create_bundle_files[vardepsexclude] = "DATETIME"
 
-- 
2.7.4


