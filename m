Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29C5873D81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:19:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 09:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,632,1422950400"; d="scan'208";a="484753703"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 09:18:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:18:28 +0100
Message-Id: <cb25d495578c46ecf911d362afabf73689f5dc77.1429805738.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/8] devtool: include bbappends in recipe parsing
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
X-List-Received-Date: Thu, 23 Apr 2015 16:19:10 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

In order to get correct metadata, SRCREV for example.

Fixes [YOCTO #7648].

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/recipeutils.py      |  6 +++---
 scripts/lib/devtool/standard.py | 35 ++++++++++++++++++++++-------------
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 159a103..09bd7fd 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -44,10 +44,10 @@ def get_unavailable_reasons(cooker, pn):
     return taskdata.get_reasons(pn)
 
 
-def parse_recipe(fn, d):
+def parse_recipe(fn, appends, d):
     """Parse an individual recipe"""
     import bb.cache
-    envdata = bb.cache.Cache.loadDataFull(fn, [], d)
+    envdata = bb.cache.Cache.loadDataFull(fn, appends, d)
     return envdata
 
 
@@ -55,7 +55,7 @@ def get_var_files(fn, varlist, d):
     """Find the file in which each of a list of variables is set.
     Note: requires variable history to be enabled when parsing.
     """
-    envdata = parse_recipe(fn, d)
+    envdata = parse_recipe(fn, [], d)
     varfiles = {}
     for v in varlist:
         history = envdata.varhistory.variable(v)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 926ec6c..9abdbd4 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -130,18 +130,29 @@ def _get_recipe_file(cooker, pn):
             logger.error("Unable to find any recipe file matching %s" % pn)
     return recipefile
 
+def _parse_recipe(config, tinfoil, pn, appends):
+    """Parse recipe of a package"""
+    import oe.recipeutils
+    recipefile = _get_recipe_file(tinfoil.cooker, pn)
+    if not recipefile:
+        # Error already logged
+        return None
+    if appends:
+        append_files = tinfoil.cooker.collection.get_file_appends(recipefile)
+        # Filter out appends from the workspace
+        append_files = [path for path in append_files if
+                        not path.startswith(config.workspace_path)]
+    return oe.recipeutils.parse_recipe(recipefile, append_files,
+                                       tinfoil.config_data)
 
 def extract(args, config, basepath, workspace):
     import bb
-    import oe.recipeutils
 
     tinfoil = setup_tinfoil()
 
-    recipefile = _get_recipe_file(tinfoil.cooker, args.recipename)
-    if not recipefile:
-        # Error already logged
+    rd = _parse_recipe(config, tinfoil, args.recipename, True)
+    if not rd:
         return -1
-    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
 
     srctree = os.path.abspath(args.srctree)
     initial_rev = _extract_source(srctree, args.keep_temp, args.branch, rd)
@@ -347,11 +358,10 @@ def modify(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil()
 
-    recipefile = _get_recipe_file(tinfoil.cooker, args.recipename)
-    if not recipefile:
-        # Error already logged
+    rd = _parse_recipe(config, tinfoil, args.recipename, True)
+    if not rd:
         return -1
-    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
+    recipefile = rd.getVar('FILE', True)
 
     if not _check_compatible_recipe(args.recipename, rd):
         return -1
@@ -448,11 +458,10 @@ def update_recipe(args, config, basepath, workspace):
     from oe.patch import GitApplyTree
     import oe.recipeutils
 
-    recipefile = _get_recipe_file(tinfoil.cooker, args.recipename)
-    if not recipefile:
-        # Error already logged
+    rd = _parse_recipe(config, tinfoil, args.recipename, True)
+    if not rd:
         return -1
-    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
+    recipefile = rd.getVar('FILE', True)
 
     orig_src_uri = rd.getVar('SRC_URI', False) or ''
     if args.mode == 'auto':
-- 
2.1.0


