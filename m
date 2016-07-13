Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 63B77731BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 21:05:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 13 Jul 2016 14:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,359,1464678000"; d="scan'208";a="733801478"
Received: from apbalanx-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.177.79])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2016 14:05:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 09:04:23 +1200
Message-Id: <68dc2d22b71dc60035207000e00f23c355127903.1468443702.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] devtool: update-recipe: refactor to allow calling separately
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
X-List-Received-Date: Wed, 13 Jul 2016 21:05:10 -0000

This will be called by "devtool finish" to allow it to update the recipe
or create the bbappend depending on the destination.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 56 +++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 769c3ce..5a5995f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -876,10 +876,10 @@ def _remove_file_entries(srcuri, filelist):
                 break
     return entries, remaining
 
-def _remove_source_files(args, files, destpath):
+def _remove_source_files(append, files, destpath):
     """Unlink existing patch files"""
     for path in files:
-        if args.append:
+        if append:
             if not destpath:
                 raise Exception('destpath should be set here')
             path = os.path.join(destpath, os.path.basename(path))
@@ -1055,7 +1055,7 @@ def _determine_files_dir(rd):
     return os.path.join(recipedir, rd.getVar('BPN', True))
 
 
-def _update_recipe_srcrev(args, srctree, rd, config_data):
+def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remove):
     """Implement the 'srcrev' mode of update-recipe"""
     import bb
     import oe.recipeutils
@@ -1084,7 +1084,7 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
     try:
         local_files_dir = tempfile.mkdtemp(dir=tempdir)
         upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir)
-        if not args.no_remove:
+        if not no_remove:
             # Find list of existing patches in recipe file
             patches_dir = tempfile.mkdtemp(dir=tempdir)
             old_srcrev = (rd.getVar('SRCREV', False) or '')
@@ -1097,7 +1097,7 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
                 removedentries = _remove_file_entries(srcuri, remove_files)[0]
                 update_srcuri = True
 
-        if args.append:
+        if appendlayerdir:
             files = dict((os.path.join(local_files_dir, key), val) for
                           key, val in list(upd_f.items()) + list(new_f.items()))
             removevalues = {}
@@ -1105,7 +1105,7 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
                 removevalues  = {'SRC_URI': removedentries}
                 patchfields['SRC_URI'] = '\\\n    '.join(srcuri)
             _, destpath = oe.recipeutils.bbappend_recipe(
-                    rd, args.append, files, wildcardver=args.wildcard_version,
+                    rd, appendlayerdir, files, wildcardver=wildcard_version,
                     extralines=patchfields, removevalues=removevalues)
         else:
             files_dir = _determine_files_dir(rd)
@@ -1129,21 +1129,21 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
                     'point to a git repository where you have pushed your '
                     'changes')
 
-    _remove_source_files(args, remove_files, destpath)
+    _remove_source_files(appendlayerdir, remove_files, destpath)
     return True
 
-def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
+def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, initial_rev):
     """Implement the 'patch' mode of update-recipe"""
     import bb
     import oe.recipeutils
 
     recipefile = rd.getVar('FILE', True)
-    append = workspace[args.recipename]['bbappend']
+    append = workspace[recipename]['bbappend']
     if not os.path.exists(append):
         raise DevtoolError('unable to find workspace bbappend for recipe %s' %
-                           args.recipename)
+                           recipename)
 
-    initial_rev, update_rev, changed_revs = _get_patchset_revs(srctree, append, args.initial_rev)
+    initial_rev, update_rev, changed_revs = _get_patchset_revs(srctree, append, initial_rev)
     if not initial_rev:
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
@@ -1154,7 +1154,7 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
         upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir)
 
         remove_files = []
-        if not args.no_remove:
+        if not no_remove:
             # Get all patches from source tree and check if any should be removed
             all_patches_dir = tempfile.mkdtemp(dir=tempdir)
             upd_p, new_p, del_p = _export_patches(srctree, rd, initial_rev,
@@ -1170,7 +1170,7 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
         updaterecipe = False
         destpath = None
         srcuri = (rd.getVar('SRC_URI', False) or '').split()
-        if args.append:
+        if appendlayerdir:
             files = dict((os.path.join(local_files_dir, key), val) for
                          key, val in list(upd_f.items()) + list(new_f.items()))
             files.update(dict((os.path.join(patches_dir, key), val) for
@@ -1185,7 +1185,7 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
                                      item in remaining]
                         removevalues = {'SRC_URI': removedentries + remaining}
                 _, destpath = oe.recipeutils.bbappend_recipe(
-                                rd, args.append, files,
+                                rd, appendlayerdir, files,
                                 removevalues=removevalues)
             else:
                 logger.info('No patches or local source files needed updating')
@@ -1235,7 +1235,7 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
     finally:
         shutil.rmtree(tempdir)
 
-    _remove_source_files(args, remove_files, destpath)
+    _remove_source_files(appendlayerdir, remove_files, destpath)
     return True
 
 def _guess_recipe_update_mode(srctree, rdata):
@@ -1260,6 +1260,19 @@ def _guess_recipe_update_mode(srctree, rdata):
 
     return 'patch'
 
+def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev):
+    srctree = workspace[recipename]['srctree']
+    if mode == 'auto':
+        mode = _guess_recipe_update_mode(srctree, rd)
+
+    if mode == 'srcrev':
+        updated = _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remove)
+    elif mode == 'patch':
+        updated = _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, initial_rev)
+    else:
+        raise DevtoolError('update_recipe: invalid mode %s' % mode)
+    return updated
+
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
     check_workspace_recipe(workspace, args.recipename)
@@ -1278,18 +1291,7 @@ def update_recipe(args, config, basepath, workspace):
     if not rd:
         return 1
 
-    srctree = workspace[args.recipename]['srctree']
-    if args.mode == 'auto':
-        mode = _guess_recipe_update_mode(srctree, rd)
-    else:
-        mode = args.mode
-
-    if mode == 'srcrev':
-        updated = _update_recipe_srcrev(args, srctree, rd, tinfoil.config_data)
-    elif mode == 'patch':
-        updated = _update_recipe_patch(args, config, workspace, srctree, rd, tinfoil.config_data)
-    else:
-        raise DevtoolError('update_recipe: invalid mode %s' % mode)
+    updated = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev)
 
     if updated:
         rf = rd.getVar('FILE', True)
-- 
2.5.5


