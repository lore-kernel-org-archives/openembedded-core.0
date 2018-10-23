Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 525E479BEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 06:12:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2018 23:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,415,1534834800"; d="scan'208";a="97699692"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2018 23:12:36 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2018 13:57:20 +0800
Message-Id: <1540274242-78226-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540274242-78226-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1540274242-78226-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Tue, 23 Oct 2018 06:12:35 -0000

As part of the solution to replace Testopia to store testresult,
OEQA selftest need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

By default, json testresult file will be written to "oeqa"
directory under the oe-selftest log directory.

To configure multiple instances of bitbake to write json testresult
to a single testresult file at custom directory, user will define
the variable "OEQA_JSON_RESULT_DIR" with the custom directory for
json testresult.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/context.py | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c78947e..ee83a91 100644
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
 
@@ -204,6 +204,31 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.tc.logger.info("Running bitbake -e to test the configuration is valid/parsable")
         runCmd("bitbake -e")
 
+    def _get_json_result_dir(self, args):
+        json_result_dir = os.path.join(os.path.dirname(os.path.abspath(args.output_log)), 'oeqa')
+        if "OEQA_JSON_RESULT_DIR" in self.tc.td:
+            json_result_dir = self.tc.td["OEQA_JSON_RESULT_DIR"]
+
+        return json_result_dir
+
+    def _get_configuration(self, args):
+        import platform
+        from oeqa.utils.metadata import metadata_from_bb
+        metadata = metadata_from_bb()
+        configuration = {'TEST_TYPE': 'oeselftest',
+                        'START_TIME': args.test_start_time,
+                        'MACHINE': self.tc.td["MACHINE"],
+                        'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-'),
+                        'HOST_NAME': metadata['hostname']}
+        layers = metadata['layers']
+        for l in layers:
+            configuration['%s_BRANCH_REV' % os.path.basename(l)] = '%s:%s' % (metadata['layers'][l]['branch'],
+                                                                              metadata['layers'][l]['commit'])
+        return configuration
+
+    def _get_result_id(self, configuration):
+        return '%s_%s_%s' % (configuration['TEST_TYPE'], configuration['HOST_DISTRO'], configuration['MACHINE'])
+
     def _internal_run(self, logger, args):
         self.module_paths = self._get_cases_paths(
                 self.tc_kwargs['init']['td']['BBPATH'].split(':'))
@@ -220,7 +245,10 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
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


