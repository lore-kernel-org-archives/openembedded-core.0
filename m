Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BD94960FF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 05:47:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jan 2020 21:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,384,1574150400"; d="scan'208";a="223035255"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 30 Jan 2020 21:47:44 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2020 13:47:42 +0800
Message-Id: <1580449662-57462-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] scripts/lib/resulttool/report: Enable report selected test case result
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
X-List-Received-Date: Fri, 31 Jan 2020 08:00:05 -0000

Enable reporting selected test case result given the user provided
the selected test case id. If both test result id and test case id
were provided, report the selected test case result from the
selected test result id.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/report.py | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 692dd7a..7ceceac 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -212,7 +212,21 @@ class ResultsTextReport(object):
                                  maxlen=maxlen)
         print(output)
 
-    def view_test_report(self, logger, source_dir, branch, commit, tag, use_regression_map, raw_test):
+    def view_test_report(self, logger, source_dir, branch, commit, tag, use_regression_map, raw_test, selected_test_case_only):
+        def print_selected_testcase_result(testresults, selected_test_case_only):
+            for testsuite in testresults:
+                for resultid in testresults[testsuite]:
+                    result = testresults[testsuite][resultid]['result']
+                    test_case_result = result.get(selected_test_case_only, {})
+                    if test_case_result.get('status'):
+                        print('Found selected test case result for %s from %s' % (selected_test_case_only,
+                                                                                           resultid))
+                        print(test_case_result['status'])
+                    else:
+                        print('Could not find selected test case result for %s from %s' % (selected_test_case_only,
+                                                                                           resultid))
+                    if test_case_result.get('log'):
+                        print(test_case_result['log'])
         test_count_reports = []
         configmap = resultutils.store_map
         if use_regression_map:
@@ -235,12 +249,18 @@ class ResultsTextReport(object):
             for testsuite in testresults:
                 result = testresults[testsuite].get(raw_test, {})
                 if result:
-                    raw_results[testsuite] = result
+                    raw_results[testsuite] = {raw_test: result}
             if raw_results:
-                print(json.dumps(raw_results, sort_keys=True, indent=4))
+                if selected_test_case_only:
+                    print_selected_testcase_result(raw_results, selected_test_case_only)
+                else:
+                    print(json.dumps(raw_results, sort_keys=True, indent=4))
             else:
                 print('Could not find raw test result for %s' % raw_test)
             return 0
+        if selected_test_case_only:
+            print_selected_testcase_result(testresults, selected_test_case_only)
+            return 0
         for testsuite in testresults:
             for resultid in testresults[testsuite]:
                 skip = False
@@ -268,7 +288,7 @@ class ResultsTextReport(object):
 def report(args, logger):
     report = ResultsTextReport()
     report.view_test_report(logger, args.source_dir, args.branch, args.commit, args.tag, args.use_regression_map,
-                            args.raw_test_only)
+                            args.raw_test_only, args.selected_test_case_only)
     return 0
 
 def register_commands(subparsers):
@@ -287,4 +307,7 @@ def register_commands(subparsers):
                               help='instead of the default "store_map", use the "regression_map" for report')
     parser_build.add_argument('-r', '--raw_test_only', default='',
                               help='output raw test result only for the user provided test result id')
-
+    parser_build.add_argument('-s', '--selected_test_case_only', default='',
+                              help='output selected test case result for the user provided test case id, if both test '
+                                   'result id and test case id are provided then output the selected test case result '
+                                   'from the provided test result id')
-- 
2.7.4


