Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 46CB778572
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:57:28 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:57:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401185"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:57:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:24 +1300
Message-Id: <7cd22161ae6fe44d0471408e0ca9d3cb5e7b2878.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 23/24] devtool: finish: add dry-run option
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
X-List-Received-Date: Thu, 09 Nov 2017 01:57:28 -0000

If you're not sure what changes devtool finish is going to make, or
you're not sure you're finished with your modifications, it is useful to
be able to see what devtool finish is going to do beforehand, so add
a -N/--dry-run option to make that possible.

(It's also very useful for debugging devtool finish itself.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py      |  48 +++++--
 scripts/lib/devtool/standard.py | 270 +++++++++++++++++++++++++++++-----------
 2 files changed, 235 insertions(+), 83 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index cab94b1..a1e191a 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -251,7 +251,7 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
     return changed, tolines
 
 
-def patch_recipe_file(fn, values, patch=False, relpath=''):
+def patch_recipe_file(fn, values, patch=False, relpath='', redirect_output=None):
     """Update or insert variable values into a recipe file (assuming you
        have already identified the exact file you want to update.)
        Note that some manual inspection/intervention may be required
@@ -263,7 +263,11 @@ def patch_recipe_file(fn, values, patch=False, relpath=''):
 
     _, tolines = patch_recipe_lines(fromlines, values)
 
-    if patch:
+    if redirect_output:
+        with open(os.path.join(redirect_output, os.path.basename(fn)), 'w') as f:
+            f.writelines(tolines)
+        return None
+    elif patch:
         relfn = os.path.relpath(fn, relpath)
         diff = difflib.unified_diff(fromlines, tolines, 'a/%s' % relfn, 'b/%s' % relfn)
         return diff
@@ -313,7 +317,7 @@ def localise_file_vars(fn, varfiles, varlist):
 
     return filevars
 
-def patch_recipe(d, fn, varvalues, patch=False, relpath=''):
+def patch_recipe(d, fn, varvalues, patch=False, relpath='', redirect_output=None):
     """Modify a list of variable values in the specified recipe. Handles inc files if
     used by the recipe.
     """
@@ -323,7 +327,7 @@ def patch_recipe(d, fn, varvalues, patch=False, relpath=''):
     patches = []
     for f,v in locs.items():
         vals = {k: varvalues[k] for k in v}
-        patchdata = patch_recipe_file(f, vals, patch, relpath)
+        patchdata = patch_recipe_file(f, vals, patch, relpath, redirect_output)
         if patch:
             patches.append(patchdata)
 
@@ -584,7 +588,7 @@ def get_bbappend_path(d, destlayerdir, wildcardver=False):
     return (appendpath, pathok)
 
 
-def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False, machine=None, extralines=None, removevalues=None):
+def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False, machine=None, extralines=None, removevalues=None, redirect_output=None):
     """
     Writes a bbappend file for a recipe
     Parameters:
@@ -611,6 +615,9 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
             value pairs, or simply a list of the lines.
         removevalues:
             Variable values to remove - a dict of names/values.
+        redirect_output:
+            If specified, redirects writing the output file to the
+            specified directory (for dry-run purposes)
     """
 
     if not removevalues:
@@ -625,7 +632,8 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         bb.warn('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.' % (os.path.join(destlayerdir, 'conf', 'layer.conf'), os.path.dirname(appendpath)))
 
     appenddir = os.path.dirname(appendpath)
-    bb.utils.mkdirhier(appenddir)
+    if not redirect_output:
+        bb.utils.mkdirhier(appenddir)
 
     # FIXME check if the bbappend doesn't get overridden by a higher priority layer?
 
@@ -702,9 +710,18 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         if instfunclines:
             bbappendlines.append(('do_install_append%s()' % appendoverride, '', instfunclines))
 
-    bb.note('Writing append file %s' % appendpath)
+    if redirect_output:
+        bb.note('Writing append file %s (dry-run)' % appendpath)
+        outfile = os.path.join(redirect_output, os.path.basename(appendpath))
+        # Only take a copy if the file isn't already there (this function may be called
+        # multiple times per operation when we're handling overrides)
+        if os.path.exists(appendpath) and not os.path.exists(outfile):
+            shutil.copy2(appendpath, outfile)
+    else:
+        bb.note('Writing append file %s' % appendpath)
+        outfile = appendpath
 
-    if os.path.exists(appendpath):
+    if os.path.exists(outfile):
         # Work around lack of nonlocal in python 2
         extvars = {'destsubdir': destsubdir}
 
@@ -776,7 +793,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         if removevalues:
             varnames.extend(list(removevalues.keys()))
 
-        with open(appendpath, 'r') as f:
+        with open(outfile, 'r') as f:
             (updated, newlines) = bb.utils.edit_metadata(f, varnames, appendfile_varfunc)
 
         destsubdir = extvars['destsubdir']
@@ -793,20 +810,27 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         updated = True
 
     if updated:
-        with open(appendpath, 'w') as f:
+        with open(outfile, 'w') as f:
             f.writelines(newlines)
 
     if copyfiles:
         if machine:
             destsubdir = os.path.join(destsubdir, machine)
+        if redirect_output:
+            outdir = redirect_output
+        else:
+            outdir = appenddir
         for newfile, srcfile in copyfiles.items():
-            filedest = os.path.join(appenddir, destsubdir, os.path.basename(srcfile))
+            filedest = os.path.join(outdir, destsubdir, os.path.basename(srcfile))
             if os.path.abspath(newfile) != os.path.abspath(filedest):
                 if newfile.startswith(tempfile.gettempdir()):
                     newfiledisp = os.path.basename(newfile)
                 else:
                     newfiledisp = newfile
-                bb.note('Copying %s to %s' % (newfiledisp, filedest))
+                if redirect_output:
+                    bb.note('Copying %s to %s (dry-run)' % (newfiledisp, os.path.join(appenddir, destsubdir, os.path.basename(srcfile))))
+                else:
+                    bb.note('Copying %s to %s' % (newfiledisp, filedest))
                 bb.utils.mkdirhier(os.path.dirname(filedest))
                 shutil.copyfile(newfile, filedest)
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9d9031c..d55d504 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -341,19 +341,45 @@ def _check_compatible_recipe(pn, d):
                            "from working. You will need to disable this "
                            "first." % pn)
 
-def _move_file(src, dst):
-    """Move a file. Creates all the directory components of destination path."""
+def _dry_run_copy(src, dst, dry_run_outdir, base_outdir):
+    """Common function for copying a file to the dry run output directory"""
+    relpath = os.path.relpath(dst, base_outdir)
+    if relpath.startswith('..'):
+        raise Exception('Incorrect base path %s for path %s' % (base_outdir, dst))
+    dst = os.path.join(dry_run_outdir, relpath)
     dst_d = os.path.dirname(dst)
     if dst_d:
         bb.utils.mkdirhier(dst_d)
-    shutil.move(src, dst)
+    # Don't overwrite existing files, otherwise in the case of an upgrade
+    # the dry-run written out recipe will be overwritten with an unmodified
+    # version
+    if not os.path.exists(dst):
+        shutil.copy(src, dst)
+
+def _move_file(src, dst, dry_run_outdir=None, base_outdir=None):
+    """Move a file. Creates all the directory components of destination path."""
+    dry_run_suffix = ' (dry-run)' if dry_run_outdir else ''
+    logger.debug('Moving %s to %s%s' % (src, dst, dry_run_suffix))
+    if dry_run_outdir:
+        # We want to copy here, not move
+        _dry_run_copy(src, dst, dry_run_outdir, base_outdir)
+    else:
+        dst_d = os.path.dirname(dst)
+        if dst_d:
+            bb.utils.mkdirhier(dst_d)
+        shutil.move(src, dst)
 
-def _copy_file(src, dst):
+def _copy_file(src, dst, dry_run_outdir=None):
     """Copy a file. Creates all the directory components of destination path."""
-    dst_d = os.path.dirname(dst)
-    if dst_d:
-        bb.utils.mkdirhier(dst_d)
-    shutil.copy(src, dst)
+    dry_run_suffix = ' (dry-run)' if dry_run_outdir else ''
+    logger.debug('Copying %s to %s%s' % (src, dst, dry_run_suffix))
+    if dry_run_outdir:
+        _dry_run_copy(src, dst, dry_run_outdir, base_outdir)
+    else:
+        dst_d = os.path.dirname(dst)
+        if dst_d:
+            bb.utils.mkdirhier(dst_d)
+        shutil.copy(src, dst)
 
 def _git_ls_tree(repodir, treeish='HEAD', recursive=False):
     """List contents of a git treeish"""
@@ -1054,8 +1080,11 @@ def _replace_srcuri_entry(srcuri, filename, newentry):
             srcuri.insert(i, newentry)
             break
 
-def _remove_source_files(append, files, destpath, no_report_remove=False):
+def _remove_source_files(append, files, destpath, no_report_remove=False, dry_run=False):
     """Unlink existing patch files"""
+
+    dry_run_suffix = ' (dry-run)' if dry_run else ''
+
     for path in files:
         if append:
             if not destpath:
@@ -1064,19 +1093,20 @@ def _remove_source_files(append, files, destpath, no_report_remove=False):
 
         if os.path.exists(path):
             if not no_report_remove:
-                logger.info('Removing file %s' % path)
-            # FIXME "git rm" here would be nice if the file in question is
-            #       tracked
-            # FIXME there's a chance that this file is referred to by
-            #       another recipe, in which case deleting wouldn't be the
-            #       right thing to do
-            os.remove(path)
-            # Remove directory if empty
-            try:
-                os.rmdir(os.path.dirname(path))
-            except OSError as ose:
-                if ose.errno != errno.ENOTEMPTY:
-                    raise
+                logger.info('Removing file %s%s' % (path, dry_run_suffix))
+            if not dry_run:
+                # FIXME "git rm" here would be nice if the file in question is
+                #       tracked
+                # FIXME there's a chance that this file is referred to by
+                #       another recipe, in which case deleting wouldn't be the
+                #       right thing to do
+                os.remove(path)
+                # Remove directory if empty
+                try:
+                    os.rmdir(os.path.dirname(path))
+                except OSError as ose:
+                    if ose.errno != errno.ENOTEMPTY:
+                        raise
 
 
 def _export_patches(srctree, rd, start_rev, destdir, changed_revs=None):
@@ -1277,13 +1307,16 @@ def _determine_files_dir(rd):
     return os.path.join(recipedir, rd.getVar('BPN'))
 
 
-def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove):
+def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, dry_run_outdir=None):
     """Implement the 'srcrev' mode of update-recipe"""
     import bb
     import oe.recipeutils
 
+    dry_run_suffix = ' (dry-run)' if dry_run_outdir else ''
+
     recipefile = rd.getVar('FILE')
-    logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipefile))
+    recipedir = os.path.basename(recipefile)
+    logger.info('Updating SRCREV in recipe %s%s' % (recipedir, dry_run_suffix))
 
     # Get HEAD revision
     try:
@@ -1303,6 +1336,7 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
     srcuri = orig_src_uri.split()
     tempdir = tempfile.mkdtemp(prefix='devtool')
     update_srcuri = False
+    appendfile = None
     try:
         local_files_dir = tempfile.mkdtemp(dir=tempdir)
         srctreebase = workspace[recipename]['srctreebase']
@@ -1328,29 +1362,36 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
             if update_srcuri:
                 removevalues  = {'SRC_URI': removedentries}
                 patchfields['SRC_URI'] = '\\\n    '.join(srcuri)
-            _, destpath = oe.recipeutils.bbappend_recipe(
-                    rd, appendlayerdir, files, wildcardver=wildcard_version,
-                    extralines=patchfields, removevalues=removevalues)
+            if dry_run_outdir:
+                logger.info('Creating bbappend (dry-run)')
+            else:
+                appendfile, destpath = oe.recipeutils.bbappend_recipe(
+                        rd, appendlayerdir, files, wildcardver=wildcard_version,
+                        extralines=patchfields, removevalues=removevalues,
+                        redirect_output=dry_run_outdir)
         else:
             files_dir = _determine_files_dir(rd)
             for basepath, path in upd_f.items():
-                logger.info('Updating file %s' % basepath)
+                logger.info('Updating file %s%s' % (basepath, dry_run_suffix))
                 if os.path.isabs(basepath):
                     # Original file (probably with subdir pointing inside source tree)
                     # so we do not want to move it, just copy
-                    _copy_file(basepath, path)
+                    _copy_file(basepath, path, dry_run_outdir=dry_run_outdir, base_outdir=recipedir)
                 else:
-                    _move_file(os.path.join(local_files_dir, basepath), path)
+                    _move_file(os.path.join(local_files_dir, basepath), path,
+                               dry_run_outdir=dry_run_outdir, base_outdir=recipedir)
                 update_srcuri= True
             for basepath, path in new_f.items():
-                logger.info('Adding new file %s' % basepath)
+                logger.info('Adding new file %s%s' % (basepath, dry_run_suffix))
                 _move_file(os.path.join(local_files_dir, basepath),
-                           os.path.join(files_dir, basepath))
+                           os.path.join(files_dir, basepath),
+                           dry_run_outdir=dry_run_outdir,
+                           base_outdir=recipedir)
                 srcuri.append('file://%s' % basepath)
                 update_srcuri = True
             if update_srcuri:
                 patchfields['SRC_URI'] = ' '.join(srcuri)
-            oe.recipeutils.patch_recipe(rd, recipefile, patchfields)
+            ret = oe.recipeutils.patch_recipe(rd, recipefile, patchfields, redirect_output=dry_run_outdir)
     finally:
         shutil.rmtree(tempdir)
     if not 'git://' in orig_src_uri:
@@ -1358,15 +1399,16 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
                     'point to a git repository where you have pushed your '
                     'changes')
 
-    _remove_source_files(appendlayerdir, remove_files, destpath, no_report_remove)
-    return True
+    _remove_source_files(appendlayerdir, remove_files, destpath, no_report_remove, dry_run=dry_run_outdir)
+    return True, appendfile, remove_files
 
-def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev):
+def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir=None):
     """Implement the 'patch' mode of update-recipe"""
     import bb
     import oe.recipeutils
 
     recipefile = rd.getVar('FILE')
+    recipedir = os.path.dirname(recipefile)
     append = workspace[recipename]['bbappend']
     if not os.path.exists(append):
         raise DevtoolError('unable to find workspace bbappend for recipe %s' %
@@ -1377,10 +1419,13 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
 
+    appendfile = None
     dl_dir = rd.getVar('DL_DIR')
     if not dl_dir.endswith('/'):
         dl_dir += '/'
 
+    dry_run_suffix = ' (dry-run)' if dry_run_outdir else ''
+
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
         local_files_dir = tempfile.mkdtemp(dir=tempdir)
@@ -1418,10 +1463,11 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                         remaining = ['file://' + os.path.basename(item) for
                                      item in remaining]
                         removevalues = {'SRC_URI': removedentries + remaining}
-                _, destpath = oe.recipeutils.bbappend_recipe(
+                appendfile, destpath = oe.recipeutils.bbappend_recipe(
                                 rd, appendlayerdir, files,
                                 wildcardver=wildcard_version,
-                                removevalues=removevalues)
+                                removevalues=removevalues,
+                                redirect_output=dry_run_outdir)
             else:
                 logger.info('No patches or local source files needed updating')
         else:
@@ -1432,9 +1478,11 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                 if os.path.isabs(basepath):
                     # Original file (probably with subdir pointing inside source tree)
                     # so we do not want to move it, just copy
-                    _copy_file(basepath, path)
+                    _copy_file(basepath, path,
+                               dry_run_outdir=dry_run_outdir, base_outdir=recipedir)
                 else:
-                    _move_file(os.path.join(local_files_dir, basepath), path)
+                    _move_file(os.path.join(local_files_dir, basepath), path,
+                               dry_run_outdir=dry_run_outdir, base_outdir=recipedir)
                 updatefiles = True
             for basepath, path in upd_p.items():
                 patchfn = os.path.join(patches_dir, basepath)
@@ -1446,39 +1494,45 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                     _replace_srcuri_entry(srcuri, basepath, 'file://%s' % basepath)
                     updaterecipe = True
                 else:
-                    logger.info('Updating patch %s' % basepath)
-                logger.debug('Moving new patch %s to %s' % (patchfn, path))
-                _move_file(patchfn, path)
+                    logger.info('Updating patch %s%s' % (basepath, dry_run_suffix))
+                _move_file(patchfn, path,
+                           dry_run_outdir=dry_run_outdir, base_outdir=recipedir)
                 updatefiles = True
             # Add any new files
             for basepath, path in new_f.items():
-                logger.info('Adding new file %s' % basepath)
+                logger.info('Adding new file %s%s' % (basepath, dry_run_suffix))
                 _move_file(os.path.join(local_files_dir, basepath),
-                           os.path.join(files_dir, basepath))
+                           os.path.join(files_dir, basepath),
+                           dry_run_outdir=dry_run_outdir,
+                           base_outdir=recipedir)
                 srcuri.append('file://%s' % basepath)
                 updaterecipe = True
             for basepath, path in new_p.items():
-                logger.info('Adding new patch %s' % basepath)
+                logger.info('Adding new patch %s%s' % (basepath, dry_run_suffix))
                 _move_file(os.path.join(patches_dir, basepath),
-                           os.path.join(files_dir, basepath))
+                           os.path.join(files_dir, basepath),
+                           dry_run_outdir=dry_run_outdir,
+                           base_outdir=recipedir)
                 srcuri.append('file://%s' % basepath)
                 updaterecipe = True
             # Update recipe, if needed
             if _remove_file_entries(srcuri, remove_files)[0]:
                 updaterecipe = True
             if updaterecipe:
-                logger.info('Updating recipe %s' % os.path.basename(recipefile))
-                oe.recipeutils.patch_recipe(rd, recipefile,
-                                            {'SRC_URI': ' '.join(srcuri)})
+                if not dry_run_outdir:
+                    logger.info('Updating recipe %s' % os.path.basename(recipefile))
+                ret = oe.recipeutils.patch_recipe(rd, recipefile,
+                                                  {'SRC_URI': ' '.join(srcuri)},
+                                                  redirect_output=dry_run_outdir)
             elif not updatefiles:
                 # Neither patches nor recipe were updated
                 logger.info('No patches or files need updating')
-                return False
+                return False, None, []
     finally:
         shutil.rmtree(tempdir)
 
-    _remove_source_files(appendlayerdir, remove_files, destpath, no_report_remove)
-    return True
+    _remove_source_files(appendlayerdir, remove_files, destpath, no_report_remove, dry_run=dry_run_outdir)
+    return True, appendfile, remove_files
 
 def _guess_recipe_update_mode(srctree, rdata):
     """Guess the recipe update mode to use"""
@@ -1502,18 +1556,18 @@ def _guess_recipe_update_mode(srctree, rdata):
 
     return 'patch'
 
-def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev, no_report_remove=False):
+def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev, no_report_remove=False, dry_run_outdir=None):
     srctree = workspace[recipename]['srctree']
     if mode == 'auto':
         mode = _guess_recipe_update_mode(srctree, rd)
 
     if mode == 'srcrev':
-        updated = _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove)
+        updated, appendfile, removed = _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, dry_run_outdir)
     elif mode == 'patch':
-        updated = _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev)
+        updated, appendfile, removed = _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir)
     else:
         raise DevtoolError('update_recipe: invalid mode %s' % mode)
-    return updated
+    return updated, appendfile, removed
 
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
@@ -1534,7 +1588,12 @@ def update_recipe(args, config, basepath, workspace):
         if not rd:
             return 1
 
-        updated = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev)
+        dry_run_output = None
+        dry_run_outdir = None
+        if args.dry_run:
+            dry_run_output = tempfile.TemporaryDirectory(prefix='devtool')
+            dry_run_outdir = dry_run_output.name
+        updated, _, _ = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev, dry_run_outdir=dry_run_outdir)
 
         if updated:
             rf = rd.getVar('FILE')
@@ -1680,6 +1739,8 @@ def finish(args, config, basepath, workspace):
 
     check_workspace_recipe(workspace, args.recipename)
 
+    dry_run_suffix = ' (dry-run)' if args.dry_run else ''
+
     # Grab the equivalent of COREBASE without having to initialise tinfoil
     corebasedir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..'))
 
@@ -1700,7 +1761,9 @@ def finish(args, config, basepath, workspace):
             return 1
 
         destlayerdir = _get_layer(args.destination, tinfoil.config_data)
-        origlayerdir = oe.recipeutils.find_layerdir(rd.getVar('FILE'))
+        recipefile = rd.getVar('FILE')
+        recipedir = os.path.dirname(recipefile)
+        origlayerdir = oe.recipeutils.find_layerdir(recipefile)
 
         if not os.path.isdir(destlayerdir):
             raise DevtoolError('Unable to find layer or directory matching "%s"' % args.destination)
@@ -1748,38 +1811,101 @@ def finish(args, config, basepath, workspace):
 
         # Actually update the recipe / bbappend
         removing_original = (origpath and origfilelist and oe.recipeutils.find_layerdir(origpath) == destlayerbasedir)
-        _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, initial_rev=args.initial_rev, no_report_remove=removing_original)
+        dry_run_output = None
+        dry_run_outdir = None
+        if args.dry_run:
+            dry_run_output = tempfile.TemporaryDirectory(prefix='devtool')
+            dry_run_outdir = dry_run_output.name
+        updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir)
+        removed = [os.path.relpath(pth, recipedir) for pth in removed]
 
         # Remove any old files in the case of an upgrade
-        recipedir = os.path.dirname(rd.getVar('FILE'))
         if removing_original:
             for fn in origfilelist:
                 fnp = os.path.join(origpath, fn)
-                if not os.path.exists(os.path.join(recipedir, fn)):
-                    logger.info('Removing file %s' % fnp)
-                try:
-                    os.remove(fnp)
-                except FileNotFoundError:
-                    pass
+                if fn in removed or not os.path.exists(os.path.join(recipedir, fn)):
+                    logger.info('Removing file %s%s' % (fnp, dry_run_suffix))
+                if not args.dry_run:
+                    try:
+                        os.remove(fnp)
+                    except FileNotFoundError:
+                        pass
 
         if origlayerdir == config.workspace_path and destpath:
             # Recipe file itself is in the workspace - need to move it and any
             # associated files to the specified layer
             no_clean = True
-            logger.info('Moving recipe file to %s' % destpath)
+            logger.info('Moving recipe file to %s%s' % (destpath, dry_run_suffix))
             for root, _, files in os.walk(recipedir):
                 for fn in files:
                     srcpath = os.path.join(root, fn)
                     relpth = os.path.relpath(os.path.dirname(srcpath), recipedir)
                     destdir = os.path.abspath(os.path.join(destpath, relpth))
-                    bb.utils.mkdirhier(destdir)
-                    shutil.move(srcpath, os.path.join(destdir, fn))
+                    destfp = os.path.join(destdir, fn)
+                    _move_file(srcpath, destfp, dry_run_outdir=dry_run_outdir, base_outdir=destpath)
 
+        if dry_run_outdir:
+            import difflib
+            comparelist = []
+            for root, _, files in os.walk(dry_run_outdir):
+                for fn in files:
+                    outf = os.path.join(root, fn)
+                    relf = os.path.relpath(outf, dry_run_outdir)
+                    logger.debug('dry-run: output file %s' % relf)
+                    if fn.endswith('.bb'):
+                        if origfilelist and origpath and destpath:
+                            # Need to match this up with the pre-upgrade recipe file
+                            for origf in origfilelist:
+                                if origf.endswith('.bb'):
+                                    comparelist.append((os.path.abspath(os.path.join(origpath, origf)),
+                                                        outf,
+                                                        os.path.abspath(os.path.join(destpath, relf))))
+                                    break
+                        else:
+                            # Compare to the existing recipe
+                            comparelist.append((recipefile, outf, recipefile))
+                    elif fn.endswith('.bbappend'):
+                        if appendfile:
+                            if os.path.exists(appendfile):
+                                comparelist.append((appendfile, outf, appendfile))
+                            else:
+                                comparelist.append((None, outf, appendfile))
+                    else:
+                        if destpath:
+                            recipedest = destpath
+                        elif appendfile:
+                            recipedest = os.path.dirname(appendfile)
+                        else:
+                            recipedest = os.path.dirname(recipefile)
+                        destfp = os.path.join(recipedest, relf)
+                        if os.path.exists(destfp):
+                            comparelist.append((destfp, outf, destfp))
+            output = ''
+            for oldfile, newfile, newfileshow in comparelist:
+                if oldfile:
+                    with open(oldfile, 'r') as f:
+                        oldlines = f.readlines()
+                else:
+                    oldfile = '/dev/null'
+                    oldlines = []
+                with open(newfile, 'r') as f:
+                    newlines = f.readlines()
+                if not newfileshow:
+                    newfileshow = newfile
+                diff = difflib.unified_diff(oldlines, newlines, oldfile, newfileshow)
+                difflines = list(diff)
+                if difflines:
+                    output += ''.join(difflines)
+            if output:
+                logger.info('Diff of changed files:\n%s' % output)
     finally:
         tinfoil.shutdown()
 
     # Everything else has succeeded, we can now reset
-    _reset([args.recipename], no_clean=no_clean, config=config, basepath=basepath, workspace=workspace)
+    if args.dry_run:
+        logger.info('Resetting recipe (dry-run)')
+    else:
+        _reset([args.recipename], no_clean=no_clean, config=config, basepath=basepath, workspace=workspace)
 
     return 0
 
@@ -1873,6 +1999,7 @@ def register_commands(subparsers, context):
     parser_update_recipe.add_argument('--append', '-a', help='Write changes to a bbappend in the specified layer instead of the recipe', metavar='LAYERDIR')
     parser_update_recipe.add_argument('--wildcard-version', '-w', help='In conjunction with -a/--append, use a wildcard to make the bbappend apply to any recipe version', action='store_true')
     parser_update_recipe.add_argument('--no-remove', '-n', action="store_true", help='Don\'t remove patches, only add or update')
+    parser_update_recipe.add_argument('--dry-run', '-N', action="store_true", help='Dry-run (just report changes instead of writing them)')
     parser_update_recipe.set_defaults(func=update_recipe)
 
     parser_status = subparsers.add_parser('status', help='Show workspace status',
@@ -1896,4 +2023,5 @@ def register_commands(subparsers, context):
     parser_finish.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
     parser_finish.add_argument('--initial-rev', help='Override starting revision for patches')
     parser_finish.add_argument('--force', '-f', action="store_true", help='Force continuing even if there are uncommitted changes in the source tree repository')
+    parser_finish.add_argument('--dry-run', '-N', action="store_true", help='Dry-run (just report changes instead of writing them)')
     parser_finish.set_defaults(func=finish)
-- 
2.9.5


