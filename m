Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 34BDA71B23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:06 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885809"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:36 +1300
Message-Id: <e3c4d1d529e88398599e53b078aed63595ecd328.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/14] devtool / recipetool: use tinfoil parsing API
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:06 -0000

Use Tinfoil.parse_recipe_file() and Tinfoil.parse_recipe() instead of
the recipeutils equivalents, and replace any local duplicate
implementations. This not only tidies up the code but also allows these
calls to work in memres mode.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py     | 26 +++++++-------------------
 scripts/lib/devtool/deploy.py       |  2 +-
 scripts/lib/devtool/standard.py     |  2 +-
 scripts/lib/devtool/upgrade.py      |  2 +-
 scripts/lib/recipetool/append.py    | 21 ++++-----------------
 scripts/lib/recipetool/newappend.py | 14 +-------------
 scripts/lib/recipetool/setvar.py    |  2 +-
 7 files changed, 16 insertions(+), 53 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 31ecb65..99c5534 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -120,34 +120,22 @@ def setup_tinfoil(config_only=False, basepath=None, tracking=False):
         os.chdir(orig_cwd)
     return tinfoil
 
-def get_recipe_file(cooker, pn):
-    """Find recipe file corresponding a package name"""
-    import oe.recipeutils
-    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
-    if not recipefile:
-        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
-        if skipreasons:
-            logger.error('\n'.join(skipreasons))
-        else:
-            logger.error("Unable to find any recipe file matching %s" % pn)
-    return recipefile
-
 def parse_recipe(config, tinfoil, pn, appends, filter_workspace=True):
-    """Parse recipe of a package"""
-    import oe.recipeutils
-    recipefile = get_recipe_file(tinfoil.cooker, pn)
-    if not recipefile:
-        # Error already logged
+    """Parse the specified recipe"""
+    try:
+        recipefile = tinfoil.get_recipe_file(pn)
+    except bb.providers.NoProvider as e:
+        logger.error(str(e))
         return None
     if appends:
-        append_files = tinfoil.cooker.collection.get_file_appends(recipefile)
+        append_files = tinfoil.get_file_appends(recipefile)
         if filter_workspace:
             # Filter out appends from the workspace
             append_files = [path for path in append_files if
                             not path.startswith(config.workspace_path)]
     else:
         append_files = None
-    return oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, append_files)
+    return tinfoil.parse_recipe_file(recipefile, appends, append_files)
 
 def check_workspace_recipe(workspace, pn, checksrc=True, bbclassextend=False):
     """
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index c4c7bf6..db7dffa 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -156,7 +156,7 @@ def deploy(args, config, basepath, workspace):
     tinfoil = setup_tinfoil(basepath=basepath)
     try:
         try:
-            rd = oe.recipeutils.parse_recipe_simple(tinfoil.cooker, args.recipename, tinfoil.config_data)
+            rd = tinfoil.parse_recipe(args.recipename)
         except Exception as e:
             raise DevtoolError('Exception parsing recipe %s: %s' %
                             (args.recipename, e))
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e4d2a57..87d3f5d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -224,7 +224,7 @@ def add(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     try:
-        rd = oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, None)
+        rd = tinfoil.parse_recipe_file(recipefile, False)
         if not rd:
             return 1
 
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index a4239f1..52f9ab1 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -320,7 +320,7 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
         newvalues['SRC_URI[md5sum]'] = md5
         newvalues['SRC_URI[sha256sum]'] = sha256
 
-    rd = oe.recipeutils.parse_recipe(tinfoil.cooker, fullpath, None)
+    rd = tinfoil.parse_recipe_file(fullpath, False)
     oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
 
     return fullpath, copied
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 1e0fc1e..3e85a0c 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -97,25 +97,12 @@ def find_target_file(targetpath, d, pkglist=None):
                             recipes[targetpath].append('!%s' % pn)
     return recipes
 
-def _get_recipe_file(cooker, pn):
-    import oe.recipeutils
-    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
-    if not recipefile:
-        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
-        if skipreasons:
-            logger.error('\n'.join(skipreasons))
-        else:
-            logger.error("Unable to find any recipe file matching %s" % pn)
-    return recipefile
-
 def _parse_recipe(pn, tinfoil):
-    import oe.recipeutils
-    recipefile = _get_recipe_file(tinfoil.cooker, pn)
-    if not recipefile:
-        # Error already logged
+    try:
+        rd = tinfoil.parse_recipe(pn)
+    except bb.providers.NoProvider as e:
+        logger.error(str(e))
         return None
-    append_files = tinfoil.cooker.collection.get_file_appends(recipefile)
-    rd = oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, append_files)
     return rd
 
 def determine_file_source(targetpath, rd):
diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index fbdd7bc..3760840 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -39,18 +39,6 @@ def tinfoil_init(instance):
     tinfoil = instance
 
 
-def _get_recipe_file(cooker, pn):
-    import oe.recipeutils
-    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
-    if not recipefile:
-        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
-        if skipreasons:
-            logger.error('\n'.join(skipreasons))
-        else:
-            logger.error("Unable to find any recipe file matching %s" % pn)
-    return recipefile
-
-
 def layer(layerpath):
     if not os.path.exists(os.path.join(layerpath, 'conf', 'layer.conf')):
         raise argparse.ArgumentTypeError('{0!r} must be a path to a valid layer'.format(layerpath))
@@ -60,7 +48,7 @@ def layer(layerpath):
 def newappend(args):
     import oe.recipeutils
 
-    recipe_path = _get_recipe_file(tinfoil.cooker, args.target)
+    recipe_path = tinfoil.get_recipe_file(args.target)
 
     rd = tinfoil.config_data.createCopy()
     rd.setVar('FILE', recipe_path)
diff --git a/scripts/lib/recipetool/setvar.py b/scripts/lib/recipetool/setvar.py
index 85701c0..9de315a 100644
--- a/scripts/lib/recipetool/setvar.py
+++ b/scripts/lib/recipetool/setvar.py
@@ -51,7 +51,7 @@ def setvar(args):
     if args.recipe_only:
         patches = [oe.recipeutils.patch_recipe_file(args.recipefile, varvalues, patch=args.patch)]
     else:
-        rd = oe.recipeutils.parse_recipe(tinfoil.cooker, args.recipefile, None)
+        rd = tinfoil.parse_recipe_file(args.recipefile, False)
         if not rd:
             return 1
         patches = oe.recipeutils.patch_recipe(rd, args.recipefile, varvalues, patch=args.patch)
-- 
2.5.5


