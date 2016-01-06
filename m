Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A5B373211
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:17:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594598"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:17:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:55 +1300
Message-Id: <611ea247254a0f6fe663771e440ea80c5453d201.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/14] devtool: build: support using BBCLASSEXTENDed names
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
X-List-Received-Date: Wed, 06 Jan 2016 11:17:10 -0000

It's logical that you would want to build BBCLASSEXTENDed items
separately through devtool build, so simply allow that - we're just
passing the name verbatim to bitbake, so all it means is adjusting the
validation.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 26 +++++++++++++++++++++-----
 scripts/lib/devtool/build.py    |  4 ++--
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 253e4d5..0405d22 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -146,19 +146,35 @@ def parse_recipe(config, tinfoil, pn, appends):
     return oe.recipeutils.parse_recipe(recipefile, append_files,
                                        tinfoil.config_data)
 
-def check_workspace_recipe(workspace, pn, checksrc=True):
+def check_workspace_recipe(workspace, pn, checksrc=True, bbclassextend=False):
     """
     Check that a recipe is in the workspace and (optionally) that source
     is present.
     """
-    if not pn in workspace:
+
+    workspacepn = pn
+
+    for recipe, value in workspace.iteritems():
+        if recipe == pn:
+            break
+        if bbclassextend:
+            recipefile = value['recipefile']
+            if recipefile:
+                targets = get_bbclassextend_targets(recipefile, recipe)
+                if pn in targets:
+                    workspacepn = recipe
+                    break
+    else:
         raise DevtoolError("No recipe named '%s' in your workspace" % pn)
+
     if checksrc:
-        srctree = workspace[pn]['srctree']
+        srctree = workspace[workspacepn]['srctree']
         if not os.path.exists(srctree):
-            raise DevtoolError("Source tree %s for recipe %s does not exist" % (srctree, pn))
+            raise DevtoolError("Source tree %s for recipe %s does not exist" % (srctree, workspacepn))
         if not os.listdir(srctree):
-            raise DevtoolError("Source tree %s for recipe %s is empty" % (srctree, pn))
+            raise DevtoolError("Source tree %s for recipe %s is empty" % (srctree, workspacepn))
+
+    return workspacepn
 
 def use_external_build(same_dir, no_same_dir, d):
     """
diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index a9a0778..c4c0c9f 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -51,11 +51,11 @@ def _get_build_task(config):
 
 def build(args, config, basepath, workspace):
     """Entry point for the devtool 'build' subcommand"""
-    check_workspace_recipe(workspace, args.recipename)
+    workspacepn = check_workspace_recipe(workspace, args.recipename, bbclassextend=True)
 
     build_task = _get_build_task(config)
 
-    bbappend = workspace[args.recipename]['bbappend']
+    bbappend = workspace[workspacepn]['bbappend']
     if args.disable_parallel_make:
         logger.info("Disabling 'make' parallelism")
         _set_file_values(bbappend, {'PARALLEL_MAKE': ''})
-- 
2.5.0


