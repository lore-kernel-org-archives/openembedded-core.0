Return-Path: <george.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 07ECD7237A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 15:14:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Jan 2015 07:11:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,756,1413270000"; d="scan'208";a="669798008"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 14 Jan 2015 07:14:38 -0800
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id EFD256A408F;
	Wed, 14 Jan 2015 07:14:32 -0800 (PST)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jan 2015 17:14:15 +0200
Message-Id: <1421248456-2542-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/2] oeqa/ptest: Removed buildhistory as requirement for ptest
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
X-List-Received-Date: Wed, 14 Jan 2015 15:14:43 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/_ptest.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
index 4c58dc1..01ecfe3 100644
--- a/meta/lib/oeqa/runtime/_ptest.py
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -99,8 +99,6 @@ class PtestRunnerTest(oeRuntimeTest):
         return complementary_pkgs.split()
 
     def setUp(self):
-        self.buildhist_dir = oeRuntimeTest.tc.d.getVar("BUILDHISTORY_DIR_IMAGE", True)
-        self.assertTrue(os.path.exists(self.buildhist_dir))
         self.ptest_log = os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR",True), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME', True))
 
     @skipUnlessPassed('test_ssh')
@@ -113,12 +111,12 @@ class PtestRunnerTest(oeRuntimeTest):
 
         self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)
         self.target.copy_from('/tmp/ptest.log', self.ptest_log)
-        shutil.copyfile(self.ptest_log, os.path.join(self.buildhist_dir, "ptest.log"))
+        shutil.copyfile(self.ptest_log, "ptest.log")
 
-        result = self.parse_ptest(os.path.join(self.buildhist_dir, "ptest.log"))
+        result = self.parse_ptest("ptest.log")
         log_results_to_location = "./results"
         if os.path.exists(log_results_to_location):
             shutil.rmtree(log_results_to_location)
         os.makedirs(log_results_to_location)
 
-        result.log_as_files(log_results_to_location, test_status = ['fail'])
+        result.log_as_files(log_results_to_location, test_status = ['pass','fail'])
-- 
2.1.0


