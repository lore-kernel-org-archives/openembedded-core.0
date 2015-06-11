Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 356B8758EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 11:34:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2015 04:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="709156477"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2015 04:34:28 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 14:34:14 +0300
Message-Id: <1434022456-26266-9-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 08/10] devtool: split out 'patch' update mode into a separate function
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
X-List-Received-Date: Thu, 11 Jun 2015 11:34:28 -0000

Continue refactoring of update_recipe() by splitting out the 'patch'
mode into a separate function.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 236 +++++++++++++++++++++-------------------
 1 file changed, 122 insertions(+), 114 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index af73009..fb3cc78 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -645,6 +645,119 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
 
     _remove_patch_files(args, removepatches, destpath)
 
+def _update_recipe_patch(args, config, srctree, rd, config_data):
+    """Implement the 'patch' mode of update-recipe"""
+    import bb
+    import oe.recipeutils
+    from oe.patch import GitApplyTree
+
+    recipefile = rd.getVar('FILE', True)
+    append = os.path.join(config.workspace_path, 'appends', '%s.bbappend' %
+                          os.path.splitext(os.path.basename(recipefile))[0])
+    if not os.path.exists(append):
+        raise DevtoolError('unable to find workspace bbappend for recipe %s' %
+                           args.recipename)
+
+    initial_rev, update_rev = _get_patchset_revs(args, srctree, append)
+    if not initial_rev:
+        raise DevtoolError('Unable to find initial revision - please specify '
+                           'it with --initial-rev')
+
+    # Find list of existing patches in recipe file
+    existing_patches = oe.recipeutils.get_recipe_patches(rd)
+
+    removepatches = []
+    seqpatch_re = re.compile('^([0-9]{4}-)?(.+)')
+    if not args.no_remove:
+        # Get all patches from source tree and check if any should be removed
+        tempdir = tempfile.mkdtemp(prefix='devtool')
+        try:
+            GitApplyTree.extractPatches(srctree, initial_rev, tempdir)
+            # Strip numbering from patch names. If it's a git sequence named
+            # patch, the numbers might not match up since we are starting from
+            # a different revision This does assume that people are using
+            # unique shortlog values, but they ought to be anyway...
+            newpatches = [seqpatch_re.match(fname).group(2) for fname in
+                          os.listdir(tempdir)]
+            for patch in existing_patches:
+                basename = seqpatch_re.match(
+                                os.path.basename(patch)).group(2)
+                if basename not in newpatches:
+                    removepatches.append(patch)
+        finally:
+            shutil.rmtree(tempdir)
+
+    # Get updated patches from source tree
+    tempdir = tempfile.mkdtemp(prefix='devtool')
+    try:
+        GitApplyTree.extractPatches(srctree, update_rev, tempdir)
+
+        # Match up and replace existing patches with corresponding new patches
+        updatepatches = False
+        updaterecipe = False
+        destpath = None
+        newpatches = os.listdir(tempdir)
+        if args.append:
+            patchfiles = {}
+            for patch in existing_patches:
+                patchfile = os.path.basename(patch)
+                if patchfile in newpatches:
+                    patchfiles[os.path.join(tempdir, patchfile)] = patchfile
+                    newpatches.remove(patchfile)
+            for patchfile in newpatches:
+                patchfiles[os.path.join(tempdir, patchfile)] = None
+
+            if patchfiles or removepatches:
+                removevalues = None
+                if removepatches:
+                    srcuri = (rd.getVar('SRC_URI', False) or '').split()
+                    removedentries, remaining = _remove_patch_entries(
+                                                    srcuri, removepatches)
+                    if removedentries or remaining:
+                        remaining = ['file://' + os.path.basename(item) for
+                                     item in remaining]
+                        removevalues = {'SRC_URI': removedentries + remaining}
+                _, destpath = oe.recipeutils.bbappend_recipe(
+                                rd, args.append, patchfiles,
+                                removevalues=removevalues)
+            else:
+                logger.info('No patches needed updating')
+        else:
+            for patch in existing_patches:
+                patchfile = os.path.basename(patch)
+                if patchfile in newpatches:
+                    logger.info('Updating patch %s' % patchfile)
+                    shutil.move(os.path.join(tempdir, patchfile), patch)
+                    newpatches.remove(patchfile)
+                    updatepatches = True
+            srcuri = (rd.getVar('SRC_URI', False) or '').split()
+            if newpatches:
+                # Add any patches left over
+                patchdir = os.path.join(os.path.dirname(recipefile),
+                                        rd.getVar('BPN', True))
+                bb.utils.mkdirhier(patchdir)
+                for patchfile in newpatches:
+                    logger.info('Adding new patch %s' % patchfile)
+                    shutil.move(os.path.join(tempdir, patchfile),
+                                os.path.join(patchdir, patchfile))
+                    srcuri.append('file://%s' % patchfile)
+                    updaterecipe = True
+            if removepatches:
+                removedentries, _ = _remove_patch_entries(srcuri, removepatches)
+                if removedentries:
+                    updaterecipe = True
+            if updaterecipe:
+                logger.info('Updating recipe %s' % os.path.basename(recipefile))
+                oe.recipeutils.patch_recipe(config_data, recipefile,
+                                            {'SRC_URI': ' '.join(srcuri)})
+            elif not updatepatches:
+                # Neither patches nor recipe were updated
+                logger.info('No patches need updating')
+    finally:
+        shutil.rmtree(tempdir)
+
+    _remove_patch_files(args, removepatches, destpath)
+
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
     if not args.recipename in workspace:
@@ -660,20 +773,10 @@ def update_recipe(args, config, basepath, workspace):
             return 2
 
     tinfoil = setup_tinfoil()
-    import bb
-    from oe.patch import GitApplyTree
-    import oe.recipeutils
 
     rd = _parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
         return -1
-    recipefile = rd.getVar('FILE', True)
-
-    # Get initial revision from bbappend
-    append = os.path.join(config.workspace_path, 'appends', '%s.bbappend' % os.path.splitext(os.path.basename(recipefile))[0])
-    if not os.path.exists(append):
-        logger.error('unable to find workspace bbappend for recipe %s' % args.recipename)
-        return -1
 
     orig_src_uri = rd.getVar('SRC_URI', False) or ''
     if args.mode == 'auto':
@@ -686,111 +789,16 @@ def update_recipe(args, config, basepath, workspace):
 
     srctree = workspace[args.recipename]
 
-    removepatches = []
-    destpath = None
-    if mode == 'srcrev':
-        try:
+    try:
+        if mode == 'srcrev':
             _update_recipe_srcrev(args, srctree, rd, tinfoil.config_data)
-        except DevtoolError as err:
-            logger.error(err)
-            return 1
-    elif mode == 'patch':
-        initial_rev, update_rev = _get_patchset_revs(args, srctree, append)
-        if not initial_rev:
-            logger.error('Unable to find initial revision - please specify it with --initial-rev')
-            return -1
-
-        # Find list of existing patches in recipe file
-        existing_patches = oe.recipeutils.get_recipe_patches(rd)
-
-        removepatches = []
-        seqpatch_re = re.compile('^([0-9]{4}-)?(.+)')
-        if not args.no_remove:
-            # Get all patches from source tree and check if any should be removed
-            tempdir = tempfile.mkdtemp(prefix='devtool')
-            try:
-                GitApplyTree.extractPatches(srctree, initial_rev, tempdir)
-                # Strip numbering from patch names. If it's a git sequence
-                # named patch, the numbers might not match up since we are
-                # starting from a different revision This does assume that
-                # people are using unique shortlog values, but they ought to be
-                # anyway...
-                newpatches = [seqpatch_re.match(fname).group(2) for fname in
-                              os.listdir(tempdir)]
-                for patch in existing_patches:
-                    basename = seqpatch_re.match(
-                                    os.path.basename(patch)).group(2)
-                    if basename not in newpatches:
-                        removepatches.append(patch)
-            finally:
-                shutil.rmtree(tempdir)
-
-        # Get updated patches from source tree
-        tempdir = tempfile.mkdtemp(prefix='devtool')
-        try:
-            GitApplyTree.extractPatches(srctree, update_rev, tempdir)
-
-            # Match up and replace existing patches with corresponding new patches
-            updatepatches = False
-            updaterecipe = False
-            newpatches = os.listdir(tempdir)
-            if args.append:
-                patchfiles = {}
-                for patch in existing_patches:
-                    patchfile = os.path.basename(patch)
-                    if patchfile in newpatches:
-                        patchfiles[os.path.join(tempdir, patchfile)] = patchfile
-                        newpatches.remove(patchfile)
-                for patchfile in newpatches:
-                    patchfiles[os.path.join(tempdir, patchfile)] = None
-
-                if patchfiles or removepatches:
-                    removevalues = None
-                    if removepatches:
-                        srcuri = (rd.getVar('SRC_URI', False) or '').split()
-                        removedentries, remaining = _remove_patch_entries(srcuri, removepatches)
-                        if removedentries or remaining:
-                            removevalues = {'SRC_URI': removedentries + ['file://' + os.path.basename(item) for item in remaining]}
-                    (appendfile, destpath) = oe.recipeutils.bbappend_recipe(rd, args.append, patchfiles, removevalues=removevalues)
-                else:
-                    logger.info('No patches needed updating')
-            else:
-                for patch in existing_patches:
-                    patchfile = os.path.basename(patch)
-                    if patchfile in newpatches:
-                        logger.info('Updating patch %s' % patchfile)
-                        shutil.move(os.path.join(tempdir, patchfile), patch)
-                        newpatches.remove(patchfile)
-                        updatepatches = True
-                srcuri = (rd.getVar('SRC_URI', False) or '').split()
-                if newpatches:
-                    # Add any patches left over
-                    patchdir = os.path.join(os.path.dirname(recipefile), rd.getVar('BPN', True))
-                    bb.utils.mkdirhier(patchdir)
-                    for patchfile in newpatches:
-                        logger.info('Adding new patch %s' % patchfile)
-                        shutil.move(os.path.join(tempdir, patchfile), os.path.join(patchdir, patchfile))
-                        srcuri.append('file://%s' % patchfile)
-                        updaterecipe = True
-                if removepatches:
-                    removedentries, _ = remove_patch_entries(srcuri, removepatches)
-                    if removedentries:
-                        updaterecipe = True
-                if updaterecipe:
-                    logger.info('Updating recipe %s' % os.path.basename(recipefile))
-                    oe.recipeutils.patch_recipe(tinfoil.config_data,
-                            recipefile, {'SRC_URI': ' '.join(srcuri)})
-                elif not updatepatches:
-                    # Neither patches nor recipe were updated
-                    logger.info('No patches need updating')
-
-        finally:
-            shutil.rmtree(tempdir)
-
-        _remove_patch_files(args, removepatches, destpath)
-
-    else:
-        logger.error('update_recipe: invalid mode %s' % mode)
+        elif mode == 'patch':
+            _update_recipe_patch(args, config, srctree, rd,
+                                 tinfoil.config_data)
+        else:
+            raise DevtoolError('update_recipe: invalid mode %s' % mode)
+    except DevtoolError as err:
+        logger.error(err)
         return 1
 
     return 0
-- 
2.1.4


