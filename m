Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DD4717F7A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 09:50:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 01:50:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; d="scan'208";a="201359981"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 07 Nov 2019 01:50:37 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 17:50:28 +0800
Message-Id: <1573120230-33685-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573120230-33685-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1573120230-33685-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/4] scripts/resulttool/report: Enable output raw test results
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
X-List-Received-Date: Thu, 07 Nov 2019 09:50:37 -0000

In case of debugging, report user need to acccess the raw
test result. Instead of going back to source file/directory/URL
to manually pull out the raw result, provide alternative
way to let report showing raw test results by providing
the result id (optional).

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/report.py | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index d2d4d1b..0c83fb6 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -207,7 +207,7 @@ class ResultsTextReport(object):
                                  maxlen=maxlen)
         print(output)
 
-    def view_test_report(self, logger, source_dir, branch, commit, tag, use_regression_map):
+    def view_test_report(self, logger, source_dir, branch, commit, tag, use_regression_map, raw_test):
         test_count_reports = []
         configmap = resultutils.store_map
         if use_regression_map:
@@ -225,6 +225,17 @@ class ResultsTextReport(object):
             testresults = resultutils.git_get_result(repo, [tag], configmap=configmap)
         else:
             testresults = resultutils.load_resultsdata(source_dir, configmap=configmap)
+        if raw_test:
+            raw_results = {}
+            for testsuite in testresults:
+                result = testresults[testsuite].get(raw_test, {})
+                if result:
+                    raw_results[testsuite] = result
+            if raw_results:
+                print(json.dumps(raw_results, sort_keys=True, indent=4))
+            else:
+                print('Could not find raw test result for %s' % raw_test)
+            return 0
         for testsuite in testresults:
             for resultid in testresults[testsuite]:
                 skip = False
@@ -251,7 +262,8 @@ class ResultsTextReport(object):
 
 def report(args, logger):
     report = ResultsTextReport()
-    report.view_test_report(logger, args.source_dir, args.branch, args.commit, args.tag, args.use_regression_map)
+    report.view_test_report(logger, args.source_dir, args.branch, args.commit, args.tag, args.use_regression_map,
+                            args.raw_test_only)
     return 0
 
 def register_commands(subparsers):
@@ -268,4 +280,6 @@ def register_commands(subparsers):
                               help='source_dir is a git repository, report on the tag specified from that repository')
     parser_build.add_argument('-m', '--use_regression_map', action='store_true',
                               help='instead of the default "store_map", use the "regression_map" for report')
+    parser_build.add_argument('-r', '--raw_test_only', default='',
+                              help='output raw test result only for the user provided test result id')
 
-- 
2.7.4


