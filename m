Return-Path: <ee.peng.yeoh@intel.com>
X-Greylist: delayed 554 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Apr 2019 03:10:50 UTC
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 974DD7D3C9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 03:10:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2019 20:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="220388005"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2019 20:01:38 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 10:30:35 +0800
Message-Id: <1554345037-72697-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554345037-72697-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1554345037-72697-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 1/3] resulttool/resultutils: Enable add extra configurations to results
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
X-List-Received-Date: Thu, 04 Apr 2019 03:10:50 -0000

Current resultutils library always add "TESTSERIES" configuration
to results. Enhance this to allow control of adding "TESTSERIES"
configuration as well as allow adding extra configurations
when needed.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/resultutils.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 153f2b8..bfbd381 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -39,10 +39,12 @@ store_map = {
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'MACHINE', 'IMAGE_BASENAME']
 }
 
+extra_configs = {'TESTSERIES': ''}
+
 #
 # Load the json file and append the results data into the provided results dict
 #
-def append_resultsdata(results, f, configmap=store_map):
+def append_resultsdata(results, f, configmap=store_map, configs=extra_configs):
     if type(f) is str:
         with open(f, "r") as filedata:
             data = json.load(filedata)
@@ -51,12 +53,15 @@ def append_resultsdata(results, f, configmap=store_map):
     for res in data:
         if "configuration" not in data[res] or "result" not in data[res]:
             raise ValueError("Test results data without configuration or result section?")
-        if "TESTSERIES" not in data[res]["configuration"]:
-            data[res]["configuration"]["TESTSERIES"] = os.path.basename(os.path.dirname(f))
+        for config in configs:
+            if config == "TESTSERIES" and "TESTSERIES" not in data[res]["configuration"]:
+                data[res]["configuration"]["TESTSERIES"] = os.path.basename(os.path.dirname(f))
+                continue
+            if config not in data[res]["configuration"]:
+                data[res]["configuration"][config] = configs[config]
         testtype = data[res]["configuration"].get("TEST_TYPE")
         if testtype not in configmap:
             raise ValueError("Unknown test type %s" % testtype)
-        configvars = configmap[testtype]
         testpath = "/".join(data[res]["configuration"].get(i) for i in configmap[testtype])
         if testpath not in results:
             results[testpath] = {}
@@ -72,16 +77,16 @@ def append_resultsdata(results, f, configmap=store_map):
 # Walk a directory and find/load results data
 # or load directly from a file
 #
-def load_resultsdata(source, configmap=store_map):
+def load_resultsdata(source, configmap=store_map, configs=extra_configs):
     results = {}
     if os.path.isfile(source):
-        append_resultsdata(results, source, configmap)
+        append_resultsdata(results, source, configmap, configs)
         return results
     for root, dirs, files in os.walk(source):
         for name in files:
             f = os.path.join(root, name)
             if name == "testresults.json":
-                append_resultsdata(results, f, configmap)
+                append_resultsdata(results, f, configmap, configs)
     return results
 
 def filter_resultsdata(results, resultid):
-- 
2.7.4


