Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7678C79C23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:09:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2018 00:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,411,1534834800"; d="scan'208";a="243249377"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga004.jf.intel.com with ESMTP; 22 Oct 2018 00:09:38 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 14:54:22 +0800
Message-Id: <1540191264-12332-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/4] oeqa/selftest/context: write testresult to json files
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
X-List-Received-Date: Mon, 22 Oct 2018 07:09:37 -0000

As part of the solution to replace Testopia to store testresult,
OEQA selftest need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

To configure multiple instances of bitbake to write json testresult
to a single testresult file, user will define the variable
"OEQA_JSON_RESULT_COMMON_DIR" with the common directory for writing
json testresult.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/context.py | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c78947e..e053183 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -99,8 +99,8 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         return cases_paths
 
     def _process_args(self, logger, args):
-        args.output_log = '%s-results-%s.log' % (self.name,
-                time.strftime("%Y%m%d%H%M%S"))
+        args.test_start_time = time.strftime("%Y%m%d%H%M%S")
+        args.output_log = '%s-results-%s.log' % (self.name, args.test_start_time)
         args.test_data_file = None
         args.CASES_PATHS = None
 
@@ -204,6 +204,32 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.tc.logger.info("Running bitbake -e to test the configuration is valid/parsable")
         runCmd("bitbake -e")
 
+    def _get_json_result_dir(self, args):
+        json_result_dir = os.path.join(os.path.dirname(os.path.abspath(args.output_log)),
+                                       'json_testresults-%s' % args.test_start_time,
+                                       'oe-selftest')
+        if "OEQA_JSON_RESULT_COMMON_DIR" in self.tc.td:
+            json_result_dir = self.tc.td["OEQA_JSON_RESULT_COMMON_DIR"]
+
+        return json_result_dir
+
+    def _get_configuration(self, args):
+        import platform
+        from oeqa.utils.metadata import metadata_from_bb
+
+        metadata = metadata_from_bb()
+        return {'TEST_TYPE': 'oeselftest',
+                'BRANCH': metadata['layers']['meta']['branch'],
+                'COMMIT': metadata['layers']['meta']['commit'],
+                'START_TIME': args.test_start_time,
+                'MACHINE': self.tc.td["MACHINE"],
+                'HOST_DISTRO': platform.linux_distribution(),
+                'HOST_NAME': metadata['hostname']}
+
+    def _get_result_id(self, configuration):
+        distro = '_'.join(configuration['HOST_DISTRO'])
+        return '%s-%s-%s' % (configuration['TEST_TYPE'], distro, configuration['MACHINE'])
+
     def _internal_run(self, logger, args):
         self.module_paths = self._get_cases_paths(
                 self.tc_kwargs['init']['td']['BBPATH'].split(':'))
@@ -220,7 +246,10 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         else:
             self._pre_run()
             rc = self.tc.runTests(**self.tc_kwargs['run'])
-            rc.logDetails()
+            configuration = self._get_configuration(args)
+            rc.logDetails(self._get_json_result_dir(args),
+                          configuration,
+                          self._get_result_id(configuration))
             rc.logSummary(self.name)
 
         return rc
-- 
2.7.4


