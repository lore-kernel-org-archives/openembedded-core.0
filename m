Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14C587D118
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 02:33:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Mar 2019 19:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,271,1549958400"; d="scan'208";a="310401921"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 25 Mar 2019 19:33:29 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 10:02:28 +0800
Message-Id: <1553565748-76030-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] resulttool/merge: Enable merge results to one file
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
X-List-Received-Date: Tue, 26 Mar 2019 02:33:32 -0000

QA team execute extra testing that create multiple test result files,
where these test result files need to be merged into a single file
under certain use case.

Enable merge to allow merging results into a single test result file.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/merge.py       | 29 ++++++++++++-
 scripts/lib/resulttool/resultutils.py | 76 +++++++++++++++++++++++++----------
 2 files changed, 82 insertions(+), 23 deletions(-)

diff --git a/scripts/lib/resulttool/merge.py b/scripts/lib/resulttool/merge.py
index 3e4b7a3..90b3cb3 100644
--- a/scripts/lib/resulttool/merge.py
+++ b/scripts/lib/resulttool/merge.py
@@ -17,6 +17,26 @@ import json
 import resulttool.resultutils as resultutils
 
 def merge(args, logger):
+    if args.merge_to_one:
+        if os.path.isdir(args.target_results):
+            target_results = resultutils.load_results(args.target_results)
+        else:
+            target_results = resultutils.append_results({}, args.target_results)
+        if os.path.isdir(args.base_results):
+            base_results = resultutils.load_results(args.base_results)
+            results = resultutils.append_results(target_results, base_results)
+        else:
+            results = resultutils.append_results(target_results, args.base_results)
+
+        target_file_dir = os.path.join(os.path.dirname(args.target_results), 'merged_results/testresults.json')
+        if os.path.isdir(args.target_results):
+            target_file_dir = os.path.join(args.target_results, 'merged_results/testresults.json')
+        if args.merge_to_one_dir:
+            target_file_dir = os.path.join(args.merge_to_one_dir, 'testresults.json')
+        resultutils.make_directory_and_write_json_file(target_file_dir, results)
+        logger.info('Merged results to %s' % target_file_dir)
+        return 0
+
     if os.path.isdir(args.target_results):
         results = resultutils.load_resultsdata(args.target_results, configmap=resultutils.store_map)
         resultutils.append_resultsdata(results, args.base_results, configmap=resultutils.store_map)
@@ -26,7 +46,7 @@ def merge(args, logger):
         if os.path.exists(args.target_results):
             resultutils.append_resultsdata(results, args.target_results, configmap=resultutils.flatten_map)
         resultutils.save_resultsdata(results, os.path.dirname(args.target_results), fn=os.path.basename(args.target_results))
-
+    logger.info('Merged results to %s' % os.path.dirname(args.target_results))
     return 0
 
 def register_commands(subparsers):
@@ -39,4 +59,9 @@ def register_commands(subparsers):
                               help='the results file/directory to import')
     parser_build.add_argument('target_results',
                               help='the target file or directory to merge the base_results with')
-
+    parser_build.add_argument('-o', '--merge-to-one', action='store_true',
+                              help='merge results into one file only, does not add any new configurations to results '
+                                   'and does not create additional directory structure which based on configurations')
+    parser_build.add_argument('-d', '--merge-to-one-dir', default='',
+                              help='target directory to merge results into one file, default directory was based on '
+                                   'target_results directory')
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 153f2b8..e76045b 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -39,18 +39,47 @@ store_map = {
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'MACHINE', 'IMAGE_BASENAME']
 }
 
+def load_json_data(f):
+    if type(f) is str:
+        with open(f, "r") as filedata:
+            return json.load(filedata)
+    else:
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
+def get_testresults_files(source):
+    testresults_files = []
+    for root, dirs, files in os.walk(source):
+        for name in files:
+            f = os.path.join(root, name)
+            if name == "testresults.json":
+                testresults_files.append(f)
+    return testresults_files
+
+def make_directory_and_write_json_file(dst, results):
+    os.makedirs(os.path.dirname(dst), exist_ok=True)
+    with open(dst, 'w') as f:
+        f.write(json.dumps(results, sort_keys=True, indent=4))
+
 #
 # Load the json file and append the results data into the provided results dict
+# Add TESTSERIES as configuration and create results dict with testpath as the key
 #
 def append_resultsdata(results, f, configmap=store_map):
-    if type(f) is str:
-        with open(f, "r") as filedata:
-            data = json.load(filedata)
-    else:
-        data = f
+    data = load_json_data(f)
     for res in data:
-        if "configuration" not in data[res] or "result" not in data[res]:
-            raise ValueError("Test results data without configuration or result section?")
+        validate_result(data[res])
         if "TESTSERIES" not in data[res]["configuration"]:
             data[res]["configuration"]["TESTSERIES"] = os.path.basename(os.path.dirname(f))
         testtype = data[res]["configuration"].get("TEST_TYPE")
@@ -60,12 +89,7 @@ def append_resultsdata(results, f, configmap=store_map):
         testpath = "/".join(data[res]["configuration"].get(i) for i in configmap[testtype])
         if testpath not in results:
             results[testpath] = {}
-        if 'ptestresult.rawlogs' in data[res]['result']:
-            del data[res]['result']['ptestresult.rawlogs']
-        if 'ptestresult.sections' in data[res]['result']:
-            for i in data[res]['result']['ptestresult.sections']:
-                if 'log' in data[res]['result']['ptestresult.sections'][i]:
-                    del data[res]['result']['ptestresult.sections'][i]['log']
+        delete_extra_ptest_data(data[res])
         results[testpath][res] = data[res]
 
 #
@@ -77,11 +101,8 @@ def load_resultsdata(source, configmap=store_map):
     if os.path.isfile(source):
         append_resultsdata(results, source, configmap)
         return results
-    for root, dirs, files in os.walk(source):
-        for name in files:
-            f = os.path.join(root, name)
-            if name == "testresults.json":
-                append_resultsdata(results, f, configmap)
+    for f in get_testresults_files(source):
+        append_resultsdata(results, f, configmap)
     return results
 
 def filter_resultsdata(results, resultid):
@@ -99,9 +120,22 @@ def save_resultsdata(results, destdir, fn="testresults.json"):
             dst = destdir + "/" + res + "/" + fn
         else:
             dst = destdir + "/" + fn
-        os.makedirs(os.path.dirname(dst), exist_ok=True)
-        with open(dst, 'w') as f:
-            f.write(json.dumps(results[res], sort_keys=True, indent=4))
+        make_directory_and_write_json_file(dst, results[res])
+
+def append_results(results, f):
+    data = load_json_data(f)
+    for res in data:
+        results[res] = data[res]
+    return results
+
+def load_results(source):
+    results = {}
+    if os.path.isfile(source):
+        append_results(results, source)
+        return results
+    for f in get_testresults_files(source):
+        append_results(results, f)
+    return results
 
 def git_get_result(repo, tags):
     git_objs = []
-- 
2.7.4


