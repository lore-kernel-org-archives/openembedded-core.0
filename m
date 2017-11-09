Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 63E4E7850D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:57:23 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:57:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401177"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:57:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:23 +1300
Message-Id: <c88f0be9ac94d79883074f8d5d2e5c8ca44fcbaf.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 22/24] devtool: finish: improve reporting for removed files
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
X-List-Received-Date: Thu, 09 Nov 2017 01:57:23 -0000

If a file is going to be effectively removed from the destination by
devtool finish, we should report that rather than just reporting that
we're removing files from the workspace. This is a little tricky because
the way we actually operate when finishing is to:
 (1) remove all original files (as recorded by devtool upgrade, if that
     was used)
 (2) as part of updating the recipe file, remove the files from next to
     the new recipe (i.e. in the workspace for an upgrade, real recipe
     otherwise) corresponding to commits not in the git tree
 (3) copy over remaining files from the workspace to the destination

To report the files removed with respect to what was originally there,
we need to swap steps 1 and 2 so we can see what no longer exists after
the deletion, and suppress the reporting currently done in step 2 -
however, we still want to report removal in step 2 for the non-upgrade
case, so the latter is conditional.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1e7d707..9d9031c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1054,7 +1054,7 @@ def _replace_srcuri_entry(srcuri, filename, newentry):
             srcuri.insert(i, newentry)
             break
 
-def _remove_source_files(append, files, destpath):
+def _remove_source_files(append, files, destpath, no_report_remove=False):
     """Unlink existing patch files"""
     for path in files:
         if append:
@@ -1063,7 +1063,8 @@ def _remove_source_files(append, files, destpath):
             path = os.path.join(destpath, os.path.basename(path))
 
         if os.path.exists(path):
-            logger.info('Removing file %s' % path)
+            if not no_report_remove:
+                logger.info('Removing file %s' % path)
             # FIXME "git rm" here would be nice if the file in question is
             #       tracked
             # FIXME there's a chance that this file is referred to by
@@ -1276,7 +1277,7 @@ def _determine_files_dir(rd):
     return os.path.join(recipedir, rd.getVar('BPN'))
 
 
-def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove):
+def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove):
     """Implement the 'srcrev' mode of update-recipe"""
     import bb
     import oe.recipeutils
@@ -1357,10 +1358,10 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
                     'point to a git repository where you have pushed your '
                     'changes')
 
-    _remove_source_files(appendlayerdir, remove_files, destpath)
+    _remove_source_files(appendlayerdir, remove_files, destpath, no_report_remove)
     return True
 
-def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, initial_rev):
+def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev):
     """Implement the 'patch' mode of update-recipe"""
     import bb
     import oe.recipeutils
@@ -1476,7 +1477,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     finally:
         shutil.rmtree(tempdir)
 
-    _remove_source_files(appendlayerdir, remove_files, destpath)
+    _remove_source_files(appendlayerdir, remove_files, destpath, no_report_remove)
     return True
 
 def _guess_recipe_update_mode(srctree, rdata):
@@ -1501,15 +1502,15 @@ def _guess_recipe_update_mode(srctree, rdata):
 
     return 'patch'
 
-def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev):
+def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev, no_report_remove=False):
     srctree = workspace[recipename]['srctree']
     if mode == 'auto':
         mode = _guess_recipe_update_mode(srctree, rd)
 
     if mode == 'srcrev':
-        updated = _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove)
+        updated = _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove)
     elif mode == 'patch':
-        updated = _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, initial_rev)
+        updated = _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev)
     else:
         raise DevtoolError('update_recipe: invalid mode %s' % mode)
     return updated
@@ -1745,24 +1746,27 @@ def finish(args, config, basepath, workspace):
             appendlayerdir = destlayerdir
             destpath = None
 
+        # Actually update the recipe / bbappend
+        removing_original = (origpath and origfilelist and oe.recipeutils.find_layerdir(origpath) == destlayerbasedir)
+        _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, initial_rev=args.initial_rev, no_report_remove=removing_original)
+
         # Remove any old files in the case of an upgrade
-        if origpath and origfilelist and oe.recipeutils.find_layerdir(origpath) == destlayerbasedir:
+        recipedir = os.path.dirname(rd.getVar('FILE'))
+        if removing_original:
             for fn in origfilelist:
                 fnp = os.path.join(origpath, fn)
+                if not os.path.exists(os.path.join(recipedir, fn)):
+                    logger.info('Removing file %s' % fnp)
                 try:
                     os.remove(fnp)
                 except FileNotFoundError:
                     pass
 
-        # Actually update the recipe / bbappend
-        _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, initial_rev=args.initial_rev)
-
         if origlayerdir == config.workspace_path and destpath:
             # Recipe file itself is in the workspace - need to move it and any
             # associated files to the specified layer
             no_clean = True
             logger.info('Moving recipe file to %s' % destpath)
-            recipedir = os.path.dirname(rd.getVar('FILE'))
             for root, _, files in os.walk(recipedir):
                 for fn in files:
                     srcpath = os.path.join(root, fn)
-- 
2.9.5


