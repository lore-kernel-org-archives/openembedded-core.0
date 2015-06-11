Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 32AF275645
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 11:34:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2015 04:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="709156461"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2015 04:34:24 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 14:34:11 +0300
Message-Id: <1434022456-26266-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 05/10] devtool: simplify few conditionals a bit
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
X-List-Received-Date: Thu, 11 Jun 2015 11:34:23 -0000

Just refactor the code.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index aa95e6e..4b9cebb 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -57,10 +57,9 @@ def add(args, config, basepath, workspace):
             elif os.listdir(srctree):
                 logger.error("Cannot fetch into source tree path %s as it already exists and is non-empty" % srctree)
                 return 1
-    else:
-        if not args.fetch:
-            logger.error("Specified source tree %s could not be found" % srctree)
-            return 1
+    elif not args.fetch:
+        logger.error("Specified source tree %s could not be found" % srctree)
+        return 1
 
     appendpath = os.path.join(config.workspace_path, 'appends')
     if not os.path.exists(appendpath):
@@ -424,10 +423,9 @@ def modify(args, config, basepath, workspace):
         logger.error("recipe %s is already in your workspace" % args.recipename)
         return -1
 
-    if not args.extract:
-        if not os.path.isdir(args.srctree):
-            logger.error("directory %s does not exist or not a directory (specify -x to extract source from recipe)" % args.srctree)
-            return -1
+    if not args.extract and not os.path.isdir(args.srctree):
+        logger.error("directory %s does not exist or not a directory (specify -x to extract source from recipe)" % args.srctree)
+        return -1
 
     tinfoil = setup_tinfoil()
 
-- 
2.1.4


