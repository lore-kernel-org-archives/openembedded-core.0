Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1666AC4B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 15:38:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 18 Sep 2016 08:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,357,1470726000"; d="scan'208";a="881140320"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 18 Sep 2016 08:38:01 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2016 08:37:45 -0700
Message-Id: <1474213065-21143-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] build-appliance-image: Create image in correct location
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
X-List-Received-Date: Sun, 18 Sep 2016 15:38:12 -0000

Due to the recipe now using variable IMGDEPLOYDIR instead of DEPLOY_DIR_IMAGE,
the final Build Appliance image ended up being created in a wrong location.

This patch assures the final ZIP image is created in identical location as before:

   tmp/deploy/images/<machine>/Yocto_Build_Apliance.zip

[YOCTO#10274]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 1911d4c..4161ab3 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -111,5 +111,4 @@ python do_bundle_files() {
     bb.build.exec_func('create_bundle_files', d)
 }
 
-addtask bundle_files after do_vmimg before do_build
-do_bundle_files[nostamp] = "1"
+addtask bundle_files after do_vmimg before do_image_complete
-- 
2.7.4


