Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id ADAC473199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 21:05:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 13 Jul 2016 14:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,359,1464678000"; d="scan'208";a="733801414"
Received: from apbalanx-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.177.79])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2016 14:04:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 09:04:22 +1200
Message-Id: <76efb0c13edbb8127c2cb8f82e893a5b34332ab0.1468443702.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] devtool: reset: refactor to allow calling separately
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
X-List-Received-Date: Wed, 13 Jul 2016 21:05:09 -0000

This will be called by "devtool finish" to allow it to reset the recipe
at the end.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e198120..769c3ce 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1314,24 +1314,10 @@ def status(args, config, basepath, workspace):
     return 0
 
 
-def reset(args, config, basepath, workspace):
-    """Entry point for the devtool 'reset' subcommand"""
-    import bb
-    if args.recipename:
-        if args.all:
-            raise DevtoolError("Recipe cannot be specified if -a/--all is used")
-        else:
-            for recipe in args.recipename:
-                check_workspace_recipe(workspace, recipe, checksrc=False)
-    elif not args.all:
-        raise DevtoolError("Recipe must be specified, or specify -a/--all to "
-                           "reset all recipes")
-    if args.all:
-        recipes = list(workspace.keys())
-    else:
-        recipes = args.recipename
+def _reset(recipes, no_clean, config, basepath, workspace):
+    """Reset one or more recipes"""
 
-    if recipes and not args.no_clean:
+    if recipes and not no_clean:
         if len(recipes) == 1:
             logger.info('Cleaning sysroot for recipe %s...' % recipes[0])
         else:
@@ -1383,6 +1369,26 @@ def reset(args, config, basepath, workspace):
                 # This is unlikely, but if it's empty we can just remove it
                 os.rmdir(srctree)
 
+
+def reset(args, config, basepath, workspace):
+    """Entry point for the devtool 'reset' subcommand"""
+    import bb
+    if args.recipename:
+        if args.all:
+            raise DevtoolError("Recipe cannot be specified if -a/--all is used")
+        else:
+            for recipe in args.recipename:
+                check_workspace_recipe(workspace, recipe, checksrc=False)
+    elif not args.all:
+        raise DevtoolError("Recipe must be specified, or specify -a/--all to "
+                           "reset all recipes")
+    if args.all:
+        recipes = list(workspace.keys())
+    else:
+        recipes = args.recipename
+
+    _reset(recipes, args.no_clean, config, basepath, workspace)
+
     return 0
 
 
-- 
2.5.5


