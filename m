Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D76617D165
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 05:25:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2019 22:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,278,1549958400"; d="scan'208";a="129330446"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 27 Mar 2019 22:25:35 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 12:54:33 +0800
Message-Id: <1553748873-50143-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553748873-50143-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1553748873-50143-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH] resulttool/merge: Merge files from folders and control add testseries
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
X-List-Received-Date: Thu, 28 Mar 2019 05:25:36 -0000

QA team execute extra testing that create multiple test result files,
where these test result files need to be merged under various use cases.
Furthermore, during results merging, user need control over the
testseries configuration creation as this configuration has important
implication to report and regression.

Current merge do not support merge results where both base and target
are directory.

Traceback (most recent call last):
  File "/home/poky/scripts/resulttool", line 93, in <module>
    sys.exit(main())
  File "/home/poky/scripts/resulttool", line 87, in main
    ret = args.func(args, logger)
  File "/home/poky/scripts/lib/resulttool/merge.py", line 22, in merge
    resultutils.append_resultsdata(results, args.base_results, configmap=resultutils.store_map)
  File "/home/poky/scripts/lib/resulttool/resultutils.py", line 47, in append_resultsdata
    with open(f, "r") as filedata:
IsADirectoryError: [Errno 21] Is a directory: '<path_to_base_results>'

This patches enable merge for both base and target as directory.
Also, enable control the creation of testseries configuration.

Previously the append_resultsdata function only allow append
the results data to the map_results data (where map_results data
wrapped the results data with configuration map as the key).
Initially, we tried to implement an extra function where it will
enable append one map_results to another map_results data. But
we abandoned this alternative as this new append function will be
pretty much a duplicated function to the original append_resultsdata,
and these will create two append functions which they might be both
hard to maintain and confusing. Thus, we tried to refactor the
append function to enable a single append function to be used
in all the situation. Futhermore, since the map_results were
only needed by report and regression, we pulled the instructions
used to turn results data to map_results data to another function.
Finally, we renamed the functions and arguments to clearly
seperated the functions using results data from the one using
map_results data.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py |  16 ++--
 scripts/lib/resulttool/merge.py                 |  29 ++++--
 scripts/lib/resulttool/regression.py            |  10 +-
 scripts/lib/resulttool/report.py                |   6 +-
 scripts/lib/resulttool/resultutils.py           | 118 +++++++++++++++---------
 scripts/lib/resulttool/store.py                 |   5 +-
 6 files changed, 112 insertions(+), 72 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index 0a089c0..ea7d02e 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -60,10 +60,11 @@ class ResultToolTests(OESelftestTestCase):
     def test_regression_can_get_regression_base_target_pair(self):
 
         results = {}
-        resultutils.append_resultsdata(results, ResultToolTests.base_results_data)
-        resultutils.append_resultsdata(results, ResultToolTests.target_results_data)
-        self.assertTrue('target_result1' in results['runtime/mydistro/qemux86/image'], msg="Pair not correct:%s" % results)
-        self.assertTrue('target_result3' in results['runtime/mydistro/qemux86-64/image'], msg="Pair not correct:%s" % results)
+        resultutils.append_results(results, ResultToolTests.base_results_data)
+        resultutils.append_results(results, ResultToolTests.target_results_data)
+        map_results = resultutils.get_map_results(results)
+        self.assertTrue('target_result1' in map_results['runtime/mydistro/qemux86/image'], msg="Pair not correct:%s" % map_results)
+        self.assertTrue('target_result3' in map_results['runtime/mydistro/qemux86-64/image'], msg="Pair not correct:%s" % map_results)
 
     def test_regrresion_can_get_regression_result(self):
         base_result_data = {'result': {'test1': {'status': 'PASSED'},
@@ -88,7 +89,8 @@ class ResultToolTests(OESelftestTestCase):
 
     def test_merge_can_merged_results(self):
         results = {}
-        resultutils.append_resultsdata(results, ResultToolTests.base_results_data, configmap=resultutils.flatten_map)
-        resultutils.append_resultsdata(results, ResultToolTests.target_results_data, configmap=resultutils.flatten_map)
-        self.assertEqual(len(results[''].keys()), 5, msg="Flattened results not correct %s" % str(results))
+        resultutils.append_results(results, ResultToolTests.base_results_data)
+        resultutils.append_results(results, ResultToolTests.target_results_data)
+        map_results = resultutils.get_map_results(results, configmap=resultutils.flatten_map)
+        self.assertEqual(len(map_results[''].keys()), 5, msg="Flattened results not correct %s" % str(map_results))
 
diff --git a/scripts/lib/resulttool/merge.py b/scripts/lib/resulttool/merge.py
index 3e4b7a3..fd698f2 100644
--- a/scripts/lib/resulttool/merge.py
+++ b/scripts/lib/resulttool/merge.py
@@ -17,16 +17,18 @@ import json
 import resulttool.resultutils as resultutils
 
 def merge(args, logger):
-    if os.path.isdir(args.target_results):
-        results = resultutils.load_resultsdata(args.target_results, configmap=resultutils.store_map)
-        resultutils.append_resultsdata(results, args.base_results, configmap=resultutils.store_map)
-        resultutils.save_resultsdata(results, args.target_results)
-    else:
-        results = resultutils.load_resultsdata(args.base_results, configmap=resultutils.flatten_map)
-        if os.path.exists(args.target_results):
-            resultutils.append_resultsdata(results, args.target_results, configmap=resultutils.flatten_map)
-        resultutils.save_resultsdata(results, os.path.dirname(args.target_results), fn=os.path.basename(args.target_results))
-
+    target_results = resultutils.load_results(args.target_results, add_testseries=args.add_testseries)
+    base_results = resultutils.load_results(args.base_results, add_testseries=args.add_testseries)
+    resultutils.append_results(target_results, base_results)
+    configmap = resultutils.store_map
+    if args.merge_flat:
+        configmap = resultutils.flatten_map
+    merge_dir = os.path.dirname(args.target_results)
+    if args.merge_dir:
+        merge_dir = args.merge_dir
+    map_results = resultutils.get_map_results(target_results, configmap)
+    resultutils.save_map_results(map_results, merge_dir)
+    logger.info('Merged results to %s' % merge_dir)
     return 0
 
 def register_commands(subparsers):
@@ -39,4 +41,11 @@ def register_commands(subparsers):
                               help='the results file/directory to import')
     parser_build.add_argument('target_results',
                               help='the target file or directory to merge the base_results with')
+    parser_build.add_argument('-a', '--add-testseries', action='store_true',
+                              help='add testseries configuration to results')
+    parser_build.add_argument('-f', '--merge-flat', action='store_true',
+                              help='merge results into one flat file only')
+    parser_build.add_argument('-d', '--merge-dir', default='',
+                              help='target directory to merge results, default directory was based on '
+                                   'target_results directory')
 
diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index bdf531d..e47a0df 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -42,7 +42,7 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
     return result, resultstring
 
 def get_results(logger, source):
-    return resultutils.load_resultsdata(source, configmap=resultutils.regression_map)
+    return resultutils.load_map_results(source, configmap=resultutils.regression_map, add_testseries=True)
 
 def regression(args, logger):
     base_results = get_results(logger, args.base_result)
@@ -52,9 +52,9 @@ def regression(args, logger):
 
 def regression_common(args, logger, base_results, target_results):
     if args.base_result_id:
-        base_results = resultutils.filter_resultsdata(base_results, args.base_result_id)
+        base_results = resultutils.filter_map_results(base_results, args.base_result_id)
     if args.target_result_id:
-        target_results = resultutils.filter_resultsdata(target_results, args.target_result_id)
+        target_results = resultutils.filter_map_results(target_results, args.target_result_id)
 
     matches = []
     regressions = []
@@ -146,8 +146,8 @@ def regression_git(args, logger):
 
     logger.info("Comparing:\n%s\nto\n%s\n" % (revs[index1], revs[index2]))
 
-    base_results = resultutils.git_get_result(repo, revs[index1][2])
-    target_results = resultutils.git_get_result(repo, revs[index2][2])
+    base_results = resultutils.git_get_map_results(repo, revs[index1][2])
+    target_results = resultutils.git_get_map_results(repo, revs[index2][2])
 
     regression_common(args, logger, base_results, target_results)
 
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 9008620..a4debc4 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -116,12 +116,12 @@ class ResultsTextReport(object):
             repo = GitRepo(source_dir)
             revs = gitarchive.get_test_revs(logger, repo, tag_name, branch=branch)
             rev_index = gitarchive.rev_find(revs, 'commit', commit)
-            testresults = resultutils.git_get_result(repo, revs[rev_index][2])
+            testresults = resultutils.git_get_map_results(repo, revs[rev_index][2])
         elif tag:
             repo = GitRepo(source_dir)
-            testresults = resultutils.git_get_result(repo, [tag])
+            testresults = resultutils.git_get_map_results(repo, [tag])
         else:
-            testresults = resultutils.load_resultsdata(source_dir)
+            testresults = resultutils.load_map_results(source_dir, add_testseries=True)
         for testsuite in testresults:
             for resultid in testresults[testsuite]:
                 result = testresults[testsuite][resultid]
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 153f2b8..8c3501b 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -39,71 +39,99 @@ store_map = {
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'MACHINE', 'IMAGE_BASENAME']
 }
 
-#
-# Load the json file and append the results data into the provided results dict
-#
-def append_resultsdata(results, f, configmap=store_map):
+def load_json_data(f):
     if type(f) is str:
         with open(f, "r") as filedata:
-            data = json.load(filedata)
+            return json.load(filedata)
     else:
-        data = f
+        return f
+
+def validate_result(result):
+    if "configuration" not in result or "result" not in result:
+        raise ValueError("Test results data without configuration or result section?")
+
+def delete_extra_ptest_data(result):
+    if 'ptestresult.rawlogs' in result['result']:
+        del result['result']['ptestresult.rawlogs']
+    if 'ptestresult.sections' in result['result']:
+        for i in result['result']['ptestresult.sections']:
+            if 'log' in result['result']['ptestresult.sections'][i]:
+                del result['result']['ptestresult.sections'][i]['log']
+
+def add_testseries_config(result, f):
+    if "TESTSERIES" not in result["configuration"]:
+        result["configuration"]["TESTSERIES"] = os.path.basename(os.path.dirname(f))
+
+def get_testresults_files(source):
+    testresults_files = []
+    for root, dirs, files in os.walk(source):
+        for name in files:
+            f = os.path.join(root, name)
+            if name == "testresults.json":
+                testresults_files.append(f)
+    return testresults_files
+
+def append_results(results, f, add_testseries=False):
+    data = load_json_data(f)
     for res in data:
-        if "configuration" not in data[res] or "result" not in data[res]:
-            raise ValueError("Test results data without configuration or result section?")
-        if "TESTSERIES" not in data[res]["configuration"]:
-            data[res]["configuration"]["TESTSERIES"] = os.path.basename(os.path.dirname(f))
-        testtype = data[res]["configuration"].get("TEST_TYPE")
+        validate_result(data[res])
+        delete_extra_ptest_data(data[res])
+        if add_testseries:
+            add_testseries_config(data[res], f)
+        results[res] = data[res]
+
+def load_results(source, add_testseries=False):
+    results = {}
+    if os.path.isfile(source):
+        append_results(results, source, add_testseries)
+        return results
+    for f in get_testresults_files(source):
+        append_results(results, f, add_testseries)
+    return results
+
+def make_directory_and_write_json_file(dst, results):
+    os.makedirs(os.path.dirname(dst), exist_ok=True)
+    with open(dst, 'w') as f:
+        f.write(json.dumps(results, sort_keys=True, indent=4))
+
+def get_map_results(results, configmap=store_map):
+    map_results = {}
+    for res in results:
+        testtype = results[res]["configuration"].get("TEST_TYPE")
         if testtype not in configmap:
             raise ValueError("Unknown test type %s" % testtype)
-        configvars = configmap[testtype]
-        testpath = "/".join(data[res]["configuration"].get(i) for i in configmap[testtype])
-        if testpath not in results:
-            results[testpath] = {}
-        if 'ptestresult.rawlogs' in data[res]['result']:
-            del data[res]['result']['ptestresult.rawlogs']
-        if 'ptestresult.sections' in data[res]['result']:
-            for i in data[res]['result']['ptestresult.sections']:
-                if 'log' in data[res]['result']['ptestresult.sections'][i]:
-                    del data[res]['result']['ptestresult.sections'][i]['log']
-        results[testpath][res] = data[res]
+        testpath = "/".join(results[res]["configuration"].get(i) for i in configmap[testtype])
+        if testpath not in map_results:
+            map_results[testpath] = {}
+        map_results[testpath][res] = results[res]
+    return map_results
 
 #
 # Walk a directory and find/load results data
 # or load directly from a file
 #
-def load_resultsdata(source, configmap=store_map):
-    results = {}
-    if os.path.isfile(source):
-        append_resultsdata(results, source, configmap)
-        return results
-    for root, dirs, files in os.walk(source):
-        for name in files:
-            f = os.path.join(root, name)
-            if name == "testresults.json":
-                append_resultsdata(results, f, configmap)
-    return results
+def load_map_results(source, configmap=store_map, add_testseries=False):
+    results = load_results(source, add_testseries)
+    return get_map_results(results, configmap)
 
-def filter_resultsdata(results, resultid):
+def filter_map_results(map_results, resultid):
     newresults = {}
-    for r in results:
-        for i in results[r]:
+    for r in map_results:
+        for i in map_results[r]:
             if i == resultsid:
                  newresults[r] = {}
-                 newresults[r][i] = results[r][i]
+                 newresults[r][i] = map_results[r][i]
     return newresults
 
-def save_resultsdata(results, destdir, fn="testresults.json"):
-    for res in results:
+def save_map_results(map_results, destdir, fn="testresults.json"):
+    for res in map_results:
         if res:
             dst = destdir + "/" + res + "/" + fn
         else:
             dst = destdir + "/" + fn
-        os.makedirs(os.path.dirname(dst), exist_ok=True)
-        with open(dst, 'w') as f:
-            f.write(json.dumps(results[res], sort_keys=True, indent=4))
+        make_directory_and_write_json_file(dst, map_results[res])
 
-def git_get_result(repo, tags):
+def git_get_map_results(repo, tags):
     git_objs = []
     for tag in tags:
         files = repo.run_cmd(['ls-tree', "--name-only", "-r", tag]).splitlines()
@@ -126,6 +154,6 @@ def git_get_result(repo, tags):
     # Optimize by reading all data with one git command
     results = {}
     for obj in parse_json_stream(repo.run_cmd(['show'] + git_objs + ['--'])):
-        append_resultsdata(results, obj)
+        append_results(results, obj, add_testseries=True)
 
-    return results
+    return get_map_results(results)
diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 5e33716..8055110 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -33,7 +33,8 @@ def store(args, logger):
             for name in files:
                 f = os.path.join(root, name)
                 if name == "testresults.json":
-                    resultutils.append_resultsdata(results, f)
+                    resultutils.append_results(results, f, add_testseries=True)
+                    results = resultutils.get_map_results(results)
                 elif args.all:
                     dst = f.replace(args.source, tempdir + "/")
                     os.makedirs(os.path.dirname(dst), exist_ok=True)
@@ -65,7 +66,7 @@ def store(args, logger):
             results = revisions[r]
             keywords = {'commit': r[0], 'branch': r[1], "commit_count": r[2]}
             subprocess.check_call(["find", tempdir, "!", "-path", "./.git/*", "-delete"])
-            resultutils.save_resultsdata(results, tempdir)
+            resultutils.save_map_results(results, tempdir)
 
             logger.info('Storing test result into git repository %s' % args.git_dir)
 
-- 
2.7.4


