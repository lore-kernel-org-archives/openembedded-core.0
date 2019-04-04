Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6664B7D42E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 03:11:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2019 20:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="220388016"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2019 20:01:42 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 10:30:37 +0800
Message-Id: <1554345037-72697-4-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554345037-72697-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1554345037-72697-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 3/3] resulttool/merge: Enable control TESTSERIES and extra configurations
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
X-List-Received-Date: Thu, 04 Apr 2019 03:11:03 -0000

Current QA team need to merge test result files from multiple sources.
Adding TESTSERIES configuration too early will have negative
implication to report and regression. Enable control to add TESTSERIES
when needed. Also enable adding EXECUTED_BY configuration when
needed.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/merge.py | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/resulttool/merge.py b/scripts/lib/resulttool/merge.py
index 3e4b7a3..d40a72d 100644
--- a/scripts/lib/resulttool/merge.py
+++ b/scripts/lib/resulttool/merge.py
@@ -17,16 +17,21 @@ import json
 import resulttool.resultutils as resultutils
 
 def merge(args, logger):
+    configs = {}
+    if not args.not_add_testseries:
+        configs = resultutils.extra_configs.copy()
+    if args.executed_by:
+        configs['EXECUTED_BY'] = args.executed_by
     if os.path.isdir(args.target_results):
-        results = resultutils.load_resultsdata(args.target_results, configmap=resultutils.store_map)
-        resultutils.append_resultsdata(results, args.base_results, configmap=resultutils.store_map)
+        results = resultutils.load_resultsdata(args.target_results, configmap=resultutils.store_map, configs=configs)
+        resultutils.append_resultsdata(results, args.base_results, configmap=resultutils.store_map, configs=configs)
         resultutils.save_resultsdata(results, args.target_results)
     else:
-        results = resultutils.load_resultsdata(args.base_results, configmap=resultutils.flatten_map)
+        results = resultutils.load_resultsdata(args.base_results, configmap=resultutils.flatten_map, configs=configs)
         if os.path.exists(args.target_results):
-            resultutils.append_resultsdata(results, args.target_results, configmap=resultutils.flatten_map)
+            resultutils.append_resultsdata(results, args.target_results, configmap=resultutils.flatten_map, configs=configs)
         resultutils.save_resultsdata(results, os.path.dirname(args.target_results), fn=os.path.basename(args.target_results))
-
+    logger.info('Merged results to %s' % os.path.dirname(args.target_results))
     return 0
 
 def register_commands(subparsers):
@@ -39,4 +44,7 @@ def register_commands(subparsers):
                               help='the results file/directory to import')
     parser_build.add_argument('target_results',
                               help='the target file or directory to merge the base_results with')
-
+    parser_build.add_argument('-t', '--not-add-testseries', action='store_true',
+                              help='do not add testseries configuration to results')
+    parser_build.add_argument('-x', '--executed-by', default='',
+                              help='add executed-by configuration to each result file')
-- 
2.7.4


