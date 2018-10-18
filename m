Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFED79BCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 09:26:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2018 02:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,396,1534834800"; d="scan'208";a="101236459"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 18 Oct 2018 02:26:25 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 17:11:07 +0800
Message-Id: <1539853869-53465-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539853869-53465-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1539853869-53465-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 3/5] oeqa/selftest/context: write testresult to json files
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
X-List-Received-Date: Thu, 18 Oct 2018 09:26:25 -0000

As part of the solution to replace Testopia to store testresult,
OEQA selftest need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/context.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c78947e..c443e74 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -73,7 +73,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         parser.add_argument('--machine', required=False, choices=['random', 'all'],
                             help='Run tests on different machines (random/all).')
-        
+
         parser.set_defaults(func=self.run)
 
     def _get_available_machines(self):
@@ -99,8 +99,8 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         return cases_paths
 
     def _process_args(self, logger, args):
-        args.output_log = '%s-results-%s.log' % (self.name,
-                time.strftime("%Y%m%d%H%M%S"))
+        args.test_start_time = time.strftime("%Y%m%d%H%M%S")
+        args.output_log = '%s-results-%s.log' % (self.name, args.test_start_time)
         args.test_data_file = None
         args.CASES_PATHS = None
 
@@ -205,6 +205,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         runCmd("bitbake -e")
 
     def _internal_run(self, logger, args):
+        import platform
         self.module_paths = self._get_cases_paths(
                 self.tc_kwargs['init']['td']['BBPATH'].split(':'))
 
@@ -220,7 +221,11 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         else:
             self._pre_run()
             rc = self.tc.runTests(**self.tc_kwargs['run'])
-            rc.logDetails()
+            json_result_dir = os.path.join(os.path.dirname(os.path.abspath(args.output_log)),
+                                           'json_testresults-%s' % args.test_start_time,
+                                           'oe-selftest')
+            rc.logDetails(json_result_dir, {'TEST_TYPE': 'oe-selftest',
+                                            'HOST_OS': platform.linux_distribution()})
             rc.logSummary(self.name)
 
         return rc
-- 
2.7.4


