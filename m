Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 26EFC6C6E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:05:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Sep 2013 08:05:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="398739999"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Sep 2013 08:05:01 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 18:04:03 +0300
Message-Id: <bf446596f51d2750050e8fc0818bbc44954634e2.1378393096.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378393096.git.laurentiu.palcu@intel.com>
References: <cover.1378393096.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1378393096.git.laurentiu.palcu@intel.com>
References: <cover.1378393096.git.laurentiu.palcu@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 1/1] run-postinsts: move script execution from S98 to S99 in rcS.d
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
X-List-Received-Date: Thu, 05 Sep 2013 15:05:02 -0000

Apparently, when opkg/dpkg and run-postinsts are installed in the same
time, opkg/dpkg postinstall overwrites the run-postinsts link in rcS.d.
This will make run-postinsts script useless and the delayed postinstalls
will not be run.

This issue happens only when 'package-management' is disabled and, in
the same time, dpkg/opkg ends up in the image: either pulled by some
dependency or manually installed.

With this patch, both opkg/dpkg and run-postinsts scripts will run but
the former will silently fail because the package metadata is removed from
the image since 'pacakge-management' is disabled.

[YOCTO #4484]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../run-postinsts/run-postinsts_1.0.bb             |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 5dd1709..e18e7b6 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 SRC_URI = "file://run-postinsts"
 
 INITSCRIPT_NAME = "run-postinsts"
-INITSCRIPT_PARAMS = "start 98 S ."
+INITSCRIPT_PARAMS = "start 99 S ."
 
 inherit update-rc.d
 
-- 
1.7.9.5


