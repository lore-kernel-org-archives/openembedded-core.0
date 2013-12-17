Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A197C6D86B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 10:22:51 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Dec 2013 02:22:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,501,1384329600"; d="scan'208";a="328432374"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Dec 2013 02:22:49 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id EE0BD6A4092;
	Tue, 17 Dec 2013 02:22:46 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2013 12:33:59 +0100
Message-Id: <1387280039-3792-3-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1387280039-3792-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1387280039-3792-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 3/3] oe-selftest: added buildhistory buildtime tests in module buildoptions.py
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
X-List-Received-Date: Tue, 17 Dec 2013 10:22:51 -0000

---
 meta/lib/oeqa/selftest/buildoptions.py |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 5fb69d8..ef6579b 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -4,6 +4,7 @@ import logging
 import re
 
 from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import oeqa.utils.ftools as ftools
 
@@ -85,3 +86,22 @@ class SanityOptionsTest(oeSelfTest):
         res = bitbake("gzip nfs-utils")
         self.assertTrue("WARNING: QA Issue: gzip" in res.output)
         self.assertTrue("WARNING: QA Issue: nfs-utils" in res.output)
+
+class BuildhistoryTests(BuildhistoryBase):
+
+    def test_buildhistory_basic(self):
+        self.run_buildhistory_operation('xcursor-transparent-theme')
+        self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')))
+
+    def test_buildhistory_buildtime_pr_backwards(self):
+        self.add_command_to_tearDown('cleanup-workdir')
+        target = 'xcursor-transparent-theme'
+        error = "ERROR: QA Issue: Package version for package %s went backwards which would break package feeds from (.*-r1 to .*-r0)" % target
+        self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
+        self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
+
+
+
+
+
+
-- 
1.7.9.5


