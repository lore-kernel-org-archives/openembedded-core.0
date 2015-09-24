Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A022277012
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:53:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2015 04:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,580,1437462000"; d="scan'208";a="796374463"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2015 04:53:17 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 14:53:04 +0300
Message-Id: <1443095587-13852-8-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v3 07/10] devtool: update_recipe: refactor patch generation
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
X-List-Received-Date: Thu, 24 Sep 2015 11:53:17 -0000

Implement new function that handles patch file generation. The new
function also does the discovery of new, updated and deleted patches.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 119 ++++++++++++++++++++++++----------------
 1 file changed, 72 insertions(+), 47 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1154030..7c8e447 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -25,6 +25,7 @@ import logging
 import argparse
 import scriptutils
 import errno
+from collections import OrderedDict
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, DevtoolError
 from devtool import parse_recipe
 
@@ -590,11 +591,55 @@ def _remove_patch_files(args, patches, destpath):
                 if ose.errno != errno.ENOTEMPTY:
                     raise
 
+
+def _export_patches(srctree, rd, start_rev, destdir):
+    """Export patches from srctree to given location.
+       Returns three-tuple of dicts:
+         1. updated - patches that already exist in SRCURI
+         2. added - new patches that don't exist in SRCURI
+         3  removed - patches that exist in SRCURI but not in exported patches
+      In each dict the key is the 'basepath' of the URI and value is the
+      absolute path to the existing file in recipe space (if any).
+    """
+    import oe.recipeutils
+    from oe.patch import GitApplyTree
+    updated = OrderedDict()
+    added = OrderedDict()
+    seqpatch_re = re.compile('^([0-9]{4}-)?(.+)')
+
+    existing_patches = dict((os.path.basename(path), path) for path in
+                            oe.recipeutils.get_recipe_patches(rd))
+
+    # Generate patches from Git
+    GitApplyTree.extractPatches(srctree, start_rev, destdir)
+
+    new_patches = sorted(os.listdir(destdir))
+    for new_patch in new_patches:
+        # Strip numbering from patch names. If it's a git sequence named patch,
+        # the numbers might not match up since we are starting from a different
+        # revision This does assume that people are using unique shortlog
+        # values, but they ought to be anyway...
+        new_basename = seqpatch_re.match(new_patch).group(2)
+        found = False
+        for old_patch in existing_patches:
+            old_basename = seqpatch_re.match(old_patch).group(2)
+            if new_basename == old_basename:
+                updated[new_patch] = existing_patches.pop(old_patch)
+                found = True
+                # Rename patch files
+                if new_patch != old_patch:
+                    os.rename(os.path.join(destdir, new_patch),
+                              os.path.join(destdir, old_patch))
+                break
+        if not found:
+            added[new_patch] = None
+    return (updated, added, existing_patches)
+
+
 def _update_recipe_srcrev(args, srctree, rd, config_data):
     """Implement the 'srcrev' mode of update-recipe"""
     import bb
     import oe.recipeutils
-    from oe.patch import GitApplyTree
 
     recipefile = rd.getVar('FILE', True)
     logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipefile))
@@ -621,12 +666,10 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
         old_srcrev = (rd.getVar('SRCREV', False) or '')
         tempdir = tempfile.mkdtemp(prefix='devtool')
         try:
-            GitApplyTree.extractPatches(srctree, old_srcrev, tempdir)
-            newpatches = os.listdir(tempdir)
-            for patch in existing_patches:
-                patchfile = os.path.basename(patch)
-                if patchfile in newpatches:
-                    removepatches.append(patch)
+            upd_p, new_p, del_p = _export_patches(srctree, rd, old_srcrev,
+                                                  tempdir)
+            # Remove "overlapping" patches
+            removepatches = upd_p.values()
         finally:
             shutil.rmtree(tempdir)
 
@@ -654,7 +697,6 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
     """Implement the 'patch' mode of update-recipe"""
     import bb
     import oe.recipeutils
-    from oe.patch import GitApplyTree
 
     recipefile = rd.getVar('FILE', True)
     append = os.path.join(config.workspace_path, 'appends', '%s.bbappend' %
@@ -677,40 +719,27 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
         # Get all patches from source tree and check if any should be removed
         tempdir = tempfile.mkdtemp(prefix='devtool')
         try:
-            GitApplyTree.extractPatches(srctree, initial_rev, tempdir)
-            # Strip numbering from patch names. If it's a git sequence named
-            # patch, the numbers might not match up since we are starting from
-            # a different revision This does assume that people are using
-            # unique shortlog values, but they ought to be anyway...
-            newpatches = [seqpatch_re.match(fname).group(2) for fname in
-                          os.listdir(tempdir)]
-            for patch in existing_patches:
-                basename = seqpatch_re.match(
-                                os.path.basename(patch)).group(2)
-                if basename not in newpatches:
-                    removepatches.append(patch)
+            # Get all patches from source tree and check if any should be removed
+            upd_p, new_p, del_p = _export_patches(srctree, rd, initial_rev,
+                                                  tempdir)
+            # Remove deleted patches
+            removepatches = del_p.values()
         finally:
             shutil.rmtree(tempdir)
 
     # Get updated patches from source tree
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
-        GitApplyTree.extractPatches(srctree, update_rev, tempdir)
+        upd_p, new_p, del_p = _export_patches(srctree, rd, update_rev,
+                                              tempdir)
 
         # Match up and replace existing patches with corresponding new patches
         updatepatches = False
         updaterecipe = False
         destpath = None
-        newpatches = sorted(os.listdir(tempdir))
         if args.append:
-            patchfiles = {}
-            for patch in existing_patches:
-                patchfile = os.path.basename(patch)
-                if patchfile in newpatches:
-                    patchfiles[os.path.join(tempdir, patchfile)] = patchfile
-                    newpatches.remove(patchfile)
-            for patchfile in newpatches:
-                patchfiles[os.path.join(tempdir, patchfile)] = None
+            patchfiles = dict((os.path.join(tempdir, key), val) for
+                              key, val in upd_p.items() + new_p.items())
 
             if patchfiles or removepatches:
                 removevalues = None
@@ -728,25 +757,21 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
             else:
                 logger.info('No patches needed updating')
         else:
-            for patch in existing_patches:
-                patchfile = os.path.basename(patch)
-                if patchfile in newpatches:
-                    logger.info('Updating patch %s' % patchfile)
-                    shutil.move(os.path.join(tempdir, patchfile), patch)
-                    newpatches.remove(patchfile)
-                    updatepatches = True
+            for basepath, path in upd_p.iteritems():
+                logger.info('Updating patch %s' % basepath)
+                shutil.move(os.path.join(tempdir, basepath), path)
+                updatepatches = True
             srcuri = (rd.getVar('SRC_URI', False) or '').split()
-            if newpatches:
-                # Add any patches left over
-                patchdir = os.path.join(os.path.dirname(recipefile),
-                                        rd.getVar('BPN', True))
+            patchdir = os.path.join(os.path.dirname(recipefile),
+                                    rd.getVar('BPN', True))
+            bb.utils.mkdirhier(patchdir)
+            for basepath, path in new_p.iteritems():
+                logger.info('Adding new patch %s' % basepath)
                 bb.utils.mkdirhier(patchdir)
-                for patchfile in newpatches:
-                    logger.info('Adding new patch %s' % patchfile)
-                    shutil.move(os.path.join(tempdir, patchfile),
-                                os.path.join(patchdir, patchfile))
-                    srcuri.append('file://%s' % patchfile)
-                    updaterecipe = True
+                shutil.move(os.path.join(tempdir, basepath),
+                            os.path.join(patchdir, basepath))
+                srcuri.append('file://%s' % basepath)
+                updaterecipe = True
             if removepatches:
                 removedentries, _ = _remove_patch_entries(srcuri, removepatches)
                 if removedentries:
-- 
2.1.4


