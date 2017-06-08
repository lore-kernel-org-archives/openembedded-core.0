Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9E66A782A1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 20:40:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 08 Jun 2017 13:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="1180092780"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2017 13:40:26 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 13:40:22 -0700
Message-Id: <20170608204022.427-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] context: allow test execution with buildhistory unless version-going-backwards is present
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
X-List-Received-Date: Thu, 08 Jun 2017 20:40:26 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Users constantly running oe-selftest find annoying to disable buildhistory before running
'oe-selftest' then enabling after it. To lessen the buildhistory restriction, allow buildhistory
unless 'version-going-backwards' is present on ERROR_QA bitbake variable.

[YOCTO #11580]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/context.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index ca73070c0b..f061b987b0 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -150,7 +150,8 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         _check_required_env_variables(["BUILDDIR"])
         _check_presence_meta_selftest()
 
-        if "buildhistory.bbclass" in self.tc.td["BBINCLUDED"]:
+        # buildhistory introduce QA 'version-going-backwards' errors so stop if the latter are enabled
+        if "buildhistory.bbclass" in self.tc.td["BBINCLUDED"] and 'version-going-backwards' in self.tc.td['ERROR_QA']:
             self.tc.logger.error("You have buildhistory enabled already and this isn't recommended for selftest, please disable it first.")
             raise OEQAPreRun
 
-- 
2.12.0


