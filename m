Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9ABAA6AC4C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:10:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213294"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:21 +1300
Message-Id: <fe217d7d868d2593b32dc67a10ae578317b7fde6.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/18] devtool: upgrade: fix updating PV and SRCREV
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
X-List-Received-Date: Mon, 23 Nov 2015 02:10:28 -0000

This code was clearly never tested. Fix the following issues:
* Actually set SRCREV if it's been specified
* Enable history tracking and reparse so that we handle if variables are
  set in an inc file next to the recipe
* Use a more accurate check for PV being in the recipe which will work
  if it's in an inc file next to the recipe

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index d387623..ace0b76 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -91,15 +91,13 @@ def _remove_patch_dirs(recipefolder):
         for d in dirs:
             shutil.rmtree(os.path.join(root,d))
 
-def _recipe_contains(rf, var):
-    import re
-    found = False
-    with open(rf) as f:
-        for line in f:
-            if re.match("^%s.*=.*" % var, line):
-                found = True
-                break
-    return found
+def _recipe_contains(rd, var):
+    rf = rd.getVar('FILE', True)
+    varfiles = oe.recipeutils.get_var_files(rf, [var], rd)
+    for var, fn in varfiles.iteritems():
+        if fn and fn.startswith(os.path.dirname(rf) + os.sep):
+            return True
+    return False
 
 def _rename_recipe_dirs(oldpv, newpv, path):
     for root, dirs, files in os.walk(path):
@@ -257,7 +255,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
 
     return (rev, md5, sha256)
 
-def _create_new_recipe(newpv, md5, sha256, workspace, rd):
+def _create_new_recipe(newpv, md5, sha256, srcrev, workspace, tinfoil, rd):
     """Creates the new recipe under workspace"""
     crd = rd.createCopy()
 
@@ -271,8 +269,16 @@ def _create_new_recipe(newpv, md5, sha256, workspace, rd):
         newpv = oldpv
     fullpath = _rename_recipe_files(bpn, oldpv, newpv, path)
 
-    if _recipe_contains(fullpath, 'PV') and newpv != oldpv:
-        oe.recipeutils.patch_recipe(d, fullpath, {'PV':newpv})
+    newvalues = {}
+    if _recipe_contains(rd, 'PV') and newpv != oldpv:
+        newvalues['PV'] = newpv
+
+    if srcrev:
+        newvalues['SRCREV'] = srcrev
+
+    if newvalues:
+        rd = oe.recipeutils.parse_recipe(fullpath, None, tinfoil.config_data)
+        oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
 
     if md5 and sha256:
         # Unfortunately, oe.recipeutils.patch_recipe cannot update flags.
@@ -294,7 +300,7 @@ def upgrade(args, config, basepath, workspace):
     if reason:
         raise DevtoolError(reason)
 
-    tinfoil = setup_tinfoil(basepath=basepath)
+    tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
@@ -316,7 +322,7 @@ def upgrade(args, config, basepath, workspace):
         rev2, md5, sha256 = _extract_new_source(args.version, args.srctree, args.no_patch,
                                                 args.srcrev, args.branch, args.keep_temp,
                                                 tinfoil, rd)
-        rf = _create_new_recipe(args.version, md5, sha256, config.workspace_path, rd)
+        rf = _create_new_recipe(args.version, md5, sha256, args.srcrev, config.workspace_path, tinfoil, rd)
     except bb.process.CmdError as e:
         _upgrade_error(e, rf, args.srctree)
     except DevtoolError as e:
-- 
2.1.0


