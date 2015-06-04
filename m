Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2112F75839
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 16:32:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jun 2015 09:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,553,1427785200"; d="scan'208";a="705387211"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Jun 2015 09:32:07 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 19:31:51 +0300
Message-Id: <1433435514-28677-8-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 07/10] devtool: split out 'srcrev' update mode into a separate function
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
X-List-Received-Date: Thu, 04 Jun 2015 16:32:07 -0000

Refactor update_recipe() (i.e. the implementation of the update-recipe
command)  by splitting out the 'srcrev' into a distinct function.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 188 ++++++++++++++++++++++++----------------
 1 file changed, 111 insertions(+), 77 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c860094..9b5795d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -29,6 +29,12 @@ from devtool import exec_build_env_command, setup_tinfoil
 
 logger = logging.getLogger('devtool')
 
+
+class DevtoolError(Exception):
+    """Exception for handling devtool errors"""
+    pass
+
+
 def plugin_init(pluginlist):
     """Plugin initialization"""
     pass
@@ -542,6 +548,103 @@ def _get_patchset_revs(args, srctree, recipe_path):
 
     return initial_rev, update_rev
 
+def _remove_patch_entries(srcuri, patchlist):
+    """Remove patch entries from SRC_URI"""
+    remaining = patchlist[:]
+    entries = []
+    for patch in patchlist:
+        patchfile = os.path.basename(patch)
+        for i in xrange(len(srcuri)):
+            if srcuri[i].startswith('file://') and os.path.basename(srcuri[i].split(';')[0]) == patchfile:
+                entries.append(srcuri[i])
+                remaining.remove(patch)
+                srcuri.pop(i)
+                break
+    return entries, remaining
+
+def _remove_patch_files(args, patches, destpath):
+    """Unlink existing patch files"""
+    for patchfile in patches:
+        if args.append:
+            if not destpath:
+                raise Exception('destpath should be set here')
+            patchfile = os.path.join(destpath, os.path.basename(patchfile))
+
+        if os.path.exists(patchfile):
+            logger.info('Removing patch %s' % patchfile)
+            # FIXME "git rm" here would be nice if the file in question is
+            #       tracked
+            # FIXME there's a chance that this file is referred to by
+            #       another recipe, in which case deleting wouldn't be the
+            #       right thing to do
+            os.remove(patchfile)
+            # Remove directory if empty
+            try:
+                os.rmdir(os.path.dirname(patchfile))
+            except OSError as ose:
+                if ose.errno != errno.ENOTEMPTY:
+                    raise
+
+def _update_recipe_srcrev(args, srctree, rd, config_data):
+    """Implement the 'srcrev' mode of update-recipe"""
+    import bb
+    import oe.recipeutils
+    from oe.patch import GitApplyTree
+
+    recipefile = rd.getVar('FILE', True)
+    logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipefile))
+
+    # Get HEAD revision
+    try:
+        stdout, _ = bb.process.run('git rev-parse HEAD', cwd=srctree)
+    except bb.process.ExecutionError as err:
+        raise DevtoolError('Failed to get HEAD revision in %s: %s' %
+                           (srctree, err))
+    srcrev = stdout.strip()
+    if len(srcrev) != 40:
+        raise DevtoolError('Invalid hash returned by git: %s' % stdout)
+
+    destpath = None
+    removepatches = []
+    patchfields = {}
+    patchfields['SRCREV'] = srcrev
+    orig_src_uri = rd.getVar('SRC_URI', False) or ''
+    if not args.no_remove:
+        # Find list of existing patches in recipe file
+        existing_patches = oe.recipeutils.get_recipe_patches(rd)
+
+        old_srcrev = (rd.getVar('SRCREV', False) or '')
+        tempdir = tempfile.mkdtemp(prefix='devtool')
+        try:
+            GitApplyTree.extractPatches(srctree, old_srcrev, tempdir)
+            newpatches = os.listdir(tempdir)
+            for patch in existing_patches:
+                patchfile = os.path.basename(patch)
+                if patchfile in newpatches:
+                    removepatches.append(patch)
+        finally:
+            shutil.rmtree(tempdir)
+
+        if removepatches:
+            srcuri = orig_src_uri.split()
+            removedentries, _ = _remove_patch_entries(srcuri, removepatches)
+            if removedentries:
+                patchfields['SRC_URI'] = ' '.join(srcuri)
+
+    if args.append:
+        _, destpath = oe.recipeutils.bbappend_recipe(
+                rd, args.append, None, wildcardver=args.wildcard_version,
+                extralines=patchfields)
+    else:
+        oe.recipeutils.patch_recipe(config_data, recipefile, patchfields)
+
+    if not 'git://' in orig_src_uri:
+        logger.info('You will need to update SRC_URI within the recipe to '
+                    'point to a git repository where you have pushed your '
+                    'changes')
+
+    _remove_patch_files(args, removepatches, destpath)
+
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
     if not args.recipename in workspace:
@@ -581,69 +684,16 @@ def update_recipe(args, config, basepath, workspace):
     else:
         mode = args.mode
 
-    def remove_patch_entries(srcuri, patchlist):
-        """Remove patch entries from SRC_URI"""
-        remaining = patchlist[:]
-        entries = []
-        for patch in patchlist:
-            patchfile = os.path.basename(patch)
-            for i in xrange(len(srcuri)):
-                if srcuri[i].startswith('file://') and os.path.basename(srcuri[i].split(';')[0]) == patchfile:
-                    entries.append(srcuri[i])
-                    remaining.remove(patch)
-                    srcuri.pop(i)
-                    break
-        return entries, remaining
-
     srctree = workspace[args.recipename]
 
-    # Get HEAD revision
-    try:
-        (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
-    except bb.process.ExecutionError as err:
-        print('Failed to get HEAD revision in %s: %s' % (srctree, err))
-        return 1
-    srcrev = stdout.strip()
-    if len(srcrev) != 40:
-        logger.error('Invalid hash returned by git: %s' % stdout)
-        return 1
-
     removepatches = []
     destpath = None
     if mode == 'srcrev':
-        logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipefile))
-        removevalues = None
-        patchfields = {}
-        patchfields['SRCREV'] = srcrev
-        if not args.no_remove:
-            # Find list of existing patches in recipe file
-            existing_patches = oe.recipeutils.get_recipe_patches(rd)
-
-            old_srcrev = (rd.getVar('SRCREV', False) or '')
-            tempdir = tempfile.mkdtemp(prefix='devtool')
-            try:
-                GitApplyTree.extractPatches(srctree, old_srcrev, tempdir)
-                newpatches = os.listdir(tempdir)
-                for patch in existing_patches:
-                    patchfile = os.path.basename(patch)
-                    if patchfile in newpatches:
-                        removepatches.append(patch)
-            finally:
-                shutil.rmtree(tempdir)
-            if removepatches:
-                srcuri = (rd.getVar('SRC_URI', False) or '').split()
-                removedentries, _ = remove_patch_entries(srcuri, removepatches)
-                if removedentries:
-                    patchfields['SRC_URI'] = ' '.join(srcuri)
-
-        if args.append:
-            (appendfile, destpath) = oe.recipeutils.bbappend_recipe(rd, args.append, None, wildcardver=args.wildcard_version, extralines=patchfields)
-        else:
-            oe.recipeutils.patch_recipe(tinfoil.config_data, recipefile, patchfields)
-
-        if not 'git://' in orig_src_uri:
-            logger.info('You will need to update SRC_URI within the recipe to point to a git repository where you have pushed your changes')
-
+        try:
+            _update_recipe_srcrev(args, srctree, rd, tinfoil.config_data)
+        except DevtoolError as err:
+            logger.error(err)
+            return 1
     elif mode == 'patch':
         initial_rev, update_rev = _get_patchset_revs(args, srctree, append)
         if not initial_rev:
@@ -698,7 +748,7 @@ def update_recipe(args, config, basepath, workspace):
                     removevalues = None
                     if removepatches:
                         srcuri = (rd.getVar('SRC_URI', False) or '').split()
-                        removedentries, remaining = remove_patch_entries(srcuri, removepatches)
+                        removedentries, remaining = _remove_patch_entries(srcuri, removepatches)
                         if removedentries or remaining:
                             removevalues = {'SRC_URI': removedentries + ['file://' + os.path.basename(item) for item in remaining]}
                     (appendfile, destpath) = oe.recipeutils.bbappend_recipe(rd, args.append, patchfiles, removevalues=removevalues)
@@ -737,28 +787,12 @@ def update_recipe(args, config, basepath, workspace):
         finally:
             shutil.rmtree(tempdir)
 
+        _remove_patch_files(args, removepatches, destpath)
+
     else:
         logger.error('update_recipe: invalid mode %s' % mode)
         return 1
 
-    if removepatches:
-        for patchfile in removepatches:
-            if args.append:
-                if not destpath:
-                    raise Exception('destpath should be set here')
-                patchfile = os.path.join(destpath, os.path.basename(patchfile))
-
-            if os.path.exists(patchfile):
-                logger.info('Removing patch %s' % patchfile)
-                # FIXME "git rm" here would be nice if the file in question is tracked
-                # FIXME there's a chance that this file is referred to by another recipe, in which case deleting wouldn't be the right thing to do
-                os.remove(patchfile)
-                # Remove directory if empty
-                try:
-                    os.rmdir(os.path.dirname(patchfile))
-                except OSError as ose:
-                    if ose.errno != errno.ENOTEMPTY:
-                        raise
     return 0
 
 
-- 
2.1.4


