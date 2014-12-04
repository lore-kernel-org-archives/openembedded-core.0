Return-Path: <george.l.musat@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D8C9665D59
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 09:09:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Dec 2014 01:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,514,1413270000"; d="scan'208";a="618451576"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2014 01:09:15 -0800
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 6B55B6A408D;
	Thu,  4 Dec 2014 01:08:16 -0800 (PST)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 11:07:45 +0200
Message-Id: <1417684065-8461-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] oeqa/ptest: Removed buildhistory perequisite. Modified ptest runner detection and finished conditions.
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
X-List-Received-Date: Thu, 04 Dec 2014 09:09:16 -0000

Often ptest-runner will have exit code 1 even if it worked, probably because some of the tests failed. Modified
the condition to ptest-runner existing and having no output.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/_ptest.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
index 4c58dc1..5f9a141 100644
--- a/meta/lib/oeqa/runtime/_ptest.py
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -99,26 +99,26 @@ class PtestRunnerTest(oeRuntimeTest):
         return complementary_pkgs.split()
 
     def setUp(self):
-        self.buildhist_dir = oeRuntimeTest.tc.d.getVar("BUILDHISTORY_DIR_IMAGE", True)
-        self.assertTrue(os.path.exists(self.buildhist_dir))
         self.ptest_log = os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR",True), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME', True))
 
     @skipUnlessPassed('test_ssh')
     def test_ptestrunner(self):
         self.add_smart_channel()
-        cond = oeRuntimeTest.hasPackage("ptest-runner") and oeRuntimeTest.hasFeature("ptest") and oeRuntimeTest.hasPackage("-ptest")
-        if not cond:
-            self.install_packages(self.install_complementary("*-ptest"))
-            self.install_packages(['ptest-runner'])
+        (status, result) = self.target.run('which ptest-runner', 0)
+        if (status != 0):
+             self.install_packages(self.install_complementary("*-ptest"))
+             self.install_packages(['ptest-runner'])
+
+        (status, result) = self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)
+        self.assertTrue(result == "", msg=str(result))
+        self.assertTrue(status != 127, msg="Ptest-runner not found!")
 
-        self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)
         self.target.copy_from('/tmp/ptest.log', self.ptest_log)
-        shutil.copyfile(self.ptest_log, os.path.join(self.buildhist_dir, "ptest.log"))
 
-        result = self.parse_ptest(os.path.join(self.buildhist_dir, "ptest.log"))
+        result = self.parse_ptest(self.ptest_log)
         log_results_to_location = "./results"
         if os.path.exists(log_results_to_location):
             shutil.rmtree(log_results_to_location)
         os.makedirs(log_results_to_location)
 
-        result.log_as_files(log_results_to_location, test_status = ['fail'])
+        result.log_as_files(log_results_to_location, test_status = ['pass','fail'])
-- 
1.9.1


