Return-Path: <sk@typedivision.de>
Received: from smtp04-ext3.udag.de (smtp04-ext3.udag.de [62.146.106.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1EEBC61C16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 16:37:35 +0000 (UTC)
Received: from localhost.localdomain (x4e3627bc.dyn.telefonica.de
	[78.54.39.188])
	by smtp04-ext3.udag.de (Postfix) with ESMTPA id C744514B56;
	Wed, 11 Mar 2020 17:37:35 +0100 (CET)
From: Stefan Kral <sk@typedivision.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 17:37:30 +0100
Message-Id: <20200311163730.78078-1-sk@typedivision.de>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
Authentication-Results: smtp04-ext3.udag.de;
	auth=pass smtp.auth=typedivision-de-0001
	smtp.mailfrom=sk@typedivision.de
Cc: Stefan Kral <sk@typedivision.de>
Subject: [PATCH] oeqa: enable testresults.json for testexport
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
X-List-Received-Date: Wed, 11 Mar 2020 16:37:36 -0000

Add the option --json-result-dir to oeqa core context to enable
testresults.json creation for test runs via testexport.

Eg. oe-test runtime --json-result-dir .

Signed-off-by: Stefan Kral <sk@typedivision.de>
---
 meta/lib/oeqa/core/context.py | 30 +++++++++++++++++++++++++++++-
 meta/lib/oeqa/core/runner.py  | 13 ++++++++++---
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 16320af115..b9a28ce319 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -116,6 +116,9 @@ class OETestContextExecutor(object):
                 default=self.default_output_log,
                 help="results output log, default: %s" % self.default_output_log)
 
+        self.parser.add_argument('--json-result-dir', action='store',
+                help="json result output dir, create testresults.json here if set")
+
         group = self.parser.add_mutually_exclusive_group()
         group.add_argument('--run-tests', action='store', nargs='+',
                 default=self.default_tests,
@@ -178,6 +181,22 @@ class OETestContextExecutor(object):
 
         self.module_paths = args.CASES_PATHS
 
+    def _get_json_result_dir(self, args):
+        return args.json_result_dir
+
+    def _get_configuration(self):
+        td = self.tc_kwargs['init']['td']
+        configuration = {'TEST_TYPE': self.name,
+                        'MACHINE': td.get("MACHINE"),
+                        'DISTRO': td.get("DISTRO"),
+                        'IMAGE_BASENAME': td.get("IMAGE_BASENAME"),
+                        'DATETIME': td.get("DATETIME")}
+        return configuration
+
+    def _get_result_id(self, configuration):
+        return '%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'],
+                                configuration['MACHINE'], configuration['DATETIME'])
+
     def _pre_run(self):
         pass
 
@@ -196,7 +215,16 @@ class OETestContextExecutor(object):
         else:
             self._pre_run()
             rc = self.tc.runTests(**self.tc_kwargs['run'])
-            rc.logDetails()
+
+            json_result_dir = self._get_json_result_dir(args)
+            if json_result_dir:
+                configuration = self._get_configuration()
+                rc.logDetails(json_result_dir,
+                              configuration,
+                              self._get_result_id(configuration))
+            else:
+                rc.logDetails()
+
             rc.logSummary(self.name)
 
         output_link = os.path.join(os.path.dirname(args.output_log),
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index f656e1a9c5..fc3872aa73 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -319,10 +319,17 @@ class OETestResultJSONHelper(object):
             the_file.write(file_content)
 
     def dump_testresult_file(self, write_dir, configuration, result_id, test_result):
-        bb.utils.mkdirhier(write_dir)
-        lf = bb.utils.lockfile(os.path.join(write_dir, 'jsontestresult.lock'))
+        try:
+            import bb
+            has_bb = True
+            lf = bb.utils.lockfile(os.path.join(write_dir, 'jsontestresult.lock'))
+            bb.utils.mkdirhier(write_dir, exist_ok=True)
+        except ImportError:
+            has_bb = False
+            os.makedirs(write_dir)
         test_results = self._get_existing_testresults_if_available(write_dir)
         test_results[result_id] = {'configuration': configuration, 'result': test_result}
         json_testresults = json.dumps(test_results, sort_keys=True, indent=4)
         self._write_file(write_dir, self.testresult_filename, json_testresults)
-        bb.utils.unlockfile(lf)
+        if has_bb:
+            bb.utils.unlockfile(lf)
-- 
2.17.2 (Apple Git-113)


