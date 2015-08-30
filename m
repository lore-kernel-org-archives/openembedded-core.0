Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6166E76E6A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:08:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2015 09:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="758326758"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2015 09:08:51 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id C11316A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:08:00 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:34 +0300
Message-Id: <8c9a985168c6e8d52ac777bc7322c6fda92983c2.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/11] devtool: make 2 functions public
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
X-List-Received-Date: Sun, 30 Aug 2015 16:08:53 -0000

Moved standard.py:_parse_recipe -> __init__.py:parse_recipe and
      standard.py:_get_recipe_file ->  __init__.py:get_recipe_file
to be able to call them from other modules.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 27 +++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py | 36 ++++--------------------------------
 2 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 1747fff..97ac6ae 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -116,3 +116,30 @@ def add_md5(config, recipename, filename):
     md5 = bb.utils.md5_file(filename)
     with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a') as f:
         f.write('%s|%s|%s\n' % (recipename, os.path.relpath(filename, config.workspace_path), md5))
+
+def get_recipe_file(cooker, pn):
+    """Find recipe file corresponding a package name"""
+    import oe.recipeutils
+    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
+    if not recipefile:
+        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
+        if skipreasons:
+            logger.error('\n'.join(skipreasons))
+        else:
+            logger.error("Unable to find any recipe file matching %s" % pn)
+    return recipefile
+
+def parse_recipe(config, tinfoil, pn, appends):
+    """Parse recipe of a package"""
+    import oe.recipeutils
+    recipefile = get_recipe_file(tinfoil.cooker, pn)
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
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4aa6ebd..97c45d9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -26,7 +26,7 @@ import argparse
 import scriptutils
 import errno
 from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
-from devtool import add_md5
+from devtool import add_md5, parse_recipe
 
 logger = logging.getLogger('devtool')
 
@@ -157,34 +157,6 @@ def _check_compatible_recipe(pn, d):
                            "from working. You will need to disable this "
                            "first." % pn)
 
-def _get_recipe_file(cooker, pn):
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
-def _parse_recipe(config, tinfoil, pn, appends):
-    """Parse recipe of a package"""
-    import oe.recipeutils
-    recipefile = _get_recipe_file(tinfoil.cooker, pn)
-    if not recipefile:
-        # Error already logged
-        return None
-    if appends:
-        append_files = tinfoil.cooker.collection.get_file_appends(recipefile)
-        # Filter out appends from the workspace
-        append_files = [path for path in append_files if
-                        not path.startswith(config.workspace_path)]
-    return oe.recipeutils.parse_recipe(recipefile, append_files,
-                                       tinfoil.config_data)
-
-
 def _ls_tree(directory):
     """Recursive listing of files in a directory"""
     ret = []
@@ -200,7 +172,7 @@ def extract(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil()
 
-    rd = _parse_recipe(config, tinfoil, args.recipename, True)
+    rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
         return 1
 
@@ -420,7 +392,7 @@ def modify(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil()
 
-    rd = _parse_recipe(config, tinfoil, args.recipename, True)
+    rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
         return 1
     recipefile = rd.getVar('FILE', True)
@@ -762,7 +734,7 @@ def update_recipe(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil()
 
-    rd = _parse_recipe(config, tinfoil, args.recipename, True)
+    rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
         return 1
 
-- 
2.1.4


