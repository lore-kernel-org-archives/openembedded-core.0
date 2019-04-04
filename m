Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7577D434
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 03:10:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2019 20:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="220388011"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2019 20:01:40 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 10:30:36 +0800
Message-Id: <1554345037-72697-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554345037-72697-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1554345037-72697-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/3] resulttool/store: Enable add EXECUTED_BY config to results
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
X-List-Received-Date: Thu, 04 Apr 2019 03:10:58 -0000

Current results stored does not have information needed to trace who
executed the tests. Enable store to add EXECUTED_BY configuration
to results file in order to track who executed the tests.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/store.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 5e33716..7e89692 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -27,13 +27,16 @@ import oeqa.utils.gitarchive as gitarchive
 def store(args, logger):
     tempdir = tempfile.mkdtemp(prefix='testresults.')
     try:
+        configs = resultutils.extra_configs.copy()
+        if args.executed_by:
+            configs['EXECUTED_BY'] = args.executed_by
         results = {}
         logger.info('Reading files from %s' % args.source)
         for root, dirs,  files in os.walk(args.source):
             for name in files:
                 f = os.path.join(root, name)
                 if name == "testresults.json":
-                    resultutils.append_resultsdata(results, f)
+                    resultutils.append_resultsdata(results, f, configs=configs)
                 elif args.all:
                     dst = f.replace(args.source, tempdir + "/")
                     os.makedirs(os.path.dirname(dst), exist_ok=True)
@@ -96,4 +99,6 @@ def register_commands(subparsers):
                               help='include all files, not just testresults.json files')
     parser_build.add_argument('-e', '--allow-empty', action='store_true',
                               help='don\'t error if no results to store are found')
+    parser_build.add_argument('-x', '--executed-by', default='',
+                              help='add executed-by configuration to each result file')
 
-- 
2.7.4


