Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA7A97F7A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 09:50:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 01:50:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; d="scan'208";a="201359968"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 07 Nov 2019 01:50:34 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 17:50:27 +0800
Message-Id: <1573120230-33685-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573120230-33685-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1573120230-33685-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 1/4] scripts/resulttool/report: Enable report to use regression_map
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
X-List-Received-Date: Thu, 07 Nov 2019 09:50:35 -0000

By default, report will use the store_map to generate the key
to reference each result set. In some situation when using store_map
with multiple set of tests sharing similar test configurations,
the report will only showing partial result set for results
that having identical result_id (use of multiconfig to run tests
where it generate identical result_id).

Enable report to have the option to use the regression_map (optional)
instead of the default store_map, where it will take larger
set of configurations to generate the key to reference each
result set, this will prevent the report from only showing
partial result set.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/report.py      | 16 +++++++++++-----
 scripts/lib/resulttool/resultutils.py |  4 ++--
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 883b525..d2d4d1b 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -207,8 +207,11 @@ class ResultsTextReport(object):
                                  maxlen=maxlen)
         print(output)
 
-    def view_test_report(self, logger, source_dir, branch, commit, tag):
+    def view_test_report(self, logger, source_dir, branch, commit, tag, use_regression_map):
         test_count_reports = []
+        configmap = resultutils.store_map
+        if use_regression_map:
+            configmap = resultutils.regression_map
         if commit:
             if tag:
                 logger.warning("Ignoring --tag as --commit was specified")
@@ -216,12 +219,12 @@ class ResultsTextReport(object):
             repo = GitRepo(source_dir)
             revs = gitarchive.get_test_revs(logger, repo, tag_name, branch=branch)
             rev_index = gitarchive.rev_find(revs, 'commit', commit)
-            testresults = resultutils.git_get_result(repo, revs[rev_index][2])
+            testresults = resultutils.git_get_result(repo, revs[rev_index][2], configmap=configmap)
         elif tag:
             repo = GitRepo(source_dir)
-            testresults = resultutils.git_get_result(repo, [tag])
+            testresults = resultutils.git_get_result(repo, [tag], configmap=configmap)
         else:
-            testresults = resultutils.load_resultsdata(source_dir)
+            testresults = resultutils.load_resultsdata(source_dir, configmap=configmap)
         for testsuite in testresults:
             for resultid in testresults[testsuite]:
                 skip = False
@@ -248,7 +251,7 @@ class ResultsTextReport(object):
 
 def report(args, logger):
     report = ResultsTextReport()
-    report.view_test_report(logger, args.source_dir, args.branch, args.commit, args.tag)
+    report.view_test_report(logger, args.source_dir, args.branch, args.commit, args.tag, args.use_regression_map)
     return 0
 
 def register_commands(subparsers):
@@ -263,3 +266,6 @@ def register_commands(subparsers):
     parser_build.add_argument('--commit', help="Revision to report")
     parser_build.add_argument('-t', '--tag', default='',
                               help='source_dir is a git repository, report on the tag specified from that repository')
+    parser_build.add_argument('-m', '--use_regression_map', action='store_true',
+                              help='instead of the default "store_map", use the "regression_map" for report')
+
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 7cb85a6..f0ae8ec 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -177,7 +177,7 @@ def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, p
                             with open(dst.replace(fn, "ptest-%s.log" % i), "w+") as f:
                                 f.write(sectionlog)
 
-def git_get_result(repo, tags):
+def git_get_result(repo, tags, configmap=store_map):
     git_objs = []
     for tag in tags:
         files = repo.run_cmd(['ls-tree', "--name-only", "-r", tag]).splitlines()
@@ -200,7 +200,7 @@ def git_get_result(repo, tags):
     # Optimize by reading all data with one git command
     results = {}
     for obj in parse_json_stream(repo.run_cmd(['show'] + git_objs + ['--'])):
-        append_resultsdata(results, obj)
+        append_resultsdata(results, obj, configmap=configmap)
 
     return results
 
-- 
2.7.4


