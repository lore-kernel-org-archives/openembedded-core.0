Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 654BA7D1AD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 07:09:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2019 00:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,298,1549958400"; d="scan'208";a="136812753"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 02 Apr 2019 00:09:04 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 14:38:04 +0800
Message-Id: <1554187084-13032-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554187084-13032-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1554187084-13032-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/2] resulttool/merge: Enable turn off testseries configuration creation
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
X-List-Received-Date: Tue, 02 Apr 2019 07:09:04 -0000

Testseries configuration has important implication to report and
regression. Enable turn off testseries configuration creation
during results merge.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/merge.py       | 13 +++++++------
 scripts/lib/resulttool/resultutils.py | 10 +++++-----
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/resulttool/merge.py b/scripts/lib/resulttool/merge.py
index 3e4b7a3..5fffb54 100644
--- a/scripts/lib/resulttool/merge.py
+++ b/scripts/lib/resulttool/merge.py
@@ -18,15 +18,15 @@ import resulttool.resultutils as resultutils
 
 def merge(args, logger):
     if os.path.isdir(args.target_results):
-        results = resultutils.load_resultsdata(args.target_results, configmap=resultutils.store_map)
-        resultutils.append_resultsdata(results, args.base_results, configmap=resultutils.store_map)
+        results = resultutils.load_resultsdata(args.target_results, configmap=resultutils.store_map, add_testseries=args.off_add_testseries)
+        resultutils.append_resultsdata(results, args.base_results, configmap=resultutils.store_map, add_testseries=args.off_add_testseries)
         resultutils.save_resultsdata(results, args.target_results)
     else:
-        results = resultutils.load_resultsdata(args.base_results, configmap=resultutils.flatten_map)
+        results = resultutils.load_resultsdata(args.base_results, configmap=resultutils.flatten_map, add_testseries=args.off_add_testseries)
         if os.path.exists(args.target_results):
-            resultutils.append_resultsdata(results, args.target_results, configmap=resultutils.flatten_map)
+            resultutils.append_resultsdata(results, args.target_results, configmap=resultutils.flatten_map, add_testseries=args.off_add_testseries)
         resultutils.save_resultsdata(results, os.path.dirname(args.target_results), fn=os.path.basename(args.target_results))
-
+    logger.info('Merged results to %s' % os.path.dirname(args.target_results))
     return 0
 
 def register_commands(subparsers):
@@ -39,4 +39,5 @@ def register_commands(subparsers):
                               help='the results file/directory to import')
     parser_build.add_argument('target_results',
                               help='the target file or directory to merge the base_results with')
-
+    parser_build.add_argument('-o', '--off-add-testseries', action='store_false',
+                              help='turn off add testseries configuration to results')
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 153f2b8..4318ee7 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -42,7 +42,7 @@ store_map = {
 #
 # Load the json file and append the results data into the provided results dict
 #
-def append_resultsdata(results, f, configmap=store_map):
+def append_resultsdata(results, f, configmap=store_map, add_testseries=True):
     if type(f) is str:
         with open(f, "r") as filedata:
             data = json.load(filedata)
@@ -51,7 +51,7 @@ def append_resultsdata(results, f, configmap=store_map):
     for res in data:
         if "configuration" not in data[res] or "result" not in data[res]:
             raise ValueError("Test results data without configuration or result section?")
-        if "TESTSERIES" not in data[res]["configuration"]:
+        if add_testseries and "TESTSERIES" not in data[res]["configuration"]:
             data[res]["configuration"]["TESTSERIES"] = os.path.basename(os.path.dirname(f))
         testtype = data[res]["configuration"].get("TEST_TYPE")
         if testtype not in configmap:
@@ -72,16 +72,16 @@ def append_resultsdata(results, f, configmap=store_map):
 # Walk a directory and find/load results data
 # or load directly from a file
 #
-def load_resultsdata(source, configmap=store_map):
+def load_resultsdata(source, configmap=store_map, add_testseries=True):
     results = {}
     if os.path.isfile(source):
-        append_resultsdata(results, source, configmap)
+        append_resultsdata(results, source, configmap, add_testseries)
         return results
     for root, dirs, files in os.walk(source):
         for name in files:
             f = os.path.join(root, name)
             if name == "testresults.json":
-                append_resultsdata(results, f, configmap)
+                append_resultsdata(results, f, configmap, add_testseries)
     return results
 
 def filter_resultsdata(results, resultid):
-- 
2.7.4


