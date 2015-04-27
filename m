Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 15952734DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 09:53:35 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2015 02:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,656,1422950400"; d="scan'208";a="562337847"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.219])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2015 02:53:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2015 10:53:16 +0100
Message-Id: <c6004b2c14265e1e9c98c44441b71080f764ead2.1430128109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 4/9] devtool: include bbappends in recipe parsing
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
X-List-Received-Date: Mon, 27 Apr 2015 09:53:35 -0000

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
index aa30a98..faf5c92 100644
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
@@ -327,11 +338,10 @@ def modify(args, config, basepath, workspace):
 
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
@@ -428,11 +438,10 @@ def update_recipe(args, config, basepath, workspace):
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


