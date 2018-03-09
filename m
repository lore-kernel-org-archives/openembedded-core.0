Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4FD78928
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 12:34:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 04:34:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,445,1515484800"; d="scan'208";a="181306769"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 09 Mar 2018 04:34:29 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 14:27:47 +0200
Message-Id: <20180309122747.39407-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309122747.39407-1-alexander.kanavin@linux.intel.com>
References: <20180309122747.39407-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] devtool: add --force-patch-refresh to 'modify' and 'finish' commands
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
X-List-Received-Date: Fri, 09 Mar 2018 12:34:29 -0000

This is very useful for updating patch context so that any fuzz is eliminated.
Simply issue:

devtool modify <recipe>
devtool finish --force-patch-refresh <recipe> <layer_path>

Without this flag, devtool will not deem the commits in the workspace
different to patches in the layer, even if the commits have different,
up-to-date context line in them.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a962ebe09b4..a1e8e1d3227 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1061,7 +1061,7 @@ def rename(args, config, basepath, workspace):
     return 0
 
 
-def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
+def _get_patchset_revs(srctree, recipe_path, initial_rev=None, force_patch_refresh=False):
     """Get initial and update rev of a recipe. These are the start point of the
     whole patchset and start point for the patches to be re-generated/updated.
     """
@@ -1080,7 +1080,7 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
             if line.startswith('# initial_rev:'):
                 if not initial_rev:
                     initial_rev = line.split(':')[-1].strip()
-            elif line.startswith('# commit:'):
+            elif line.startswith('# commit:') and not force_patch_refresh:
                 commits.append(line.split(':')[-1].strip())
             elif line.startswith('# patches_%s:' % branchname):
                 patches = line.split(':')[-1].strip().split(',')
@@ -1102,7 +1102,7 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
         except bb.process.ExecutionError as err:
             stdout = None
 
-        if stdout is not None:
+        if stdout is not None and not force_patch_refresh:
             changed_revs = []
             for line in stdout.splitlines():
                 if line.startswith('+ '):
@@ -1459,7 +1459,7 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
     _remove_source_files(appendlayerdir, remove_files, destpath, no_report_remove, dry_run=dry_run_outdir)
     return True, appendfile, remove_files
 
-def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir=None):
+def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir=None, force_patch_refresh=False):
     """Implement the 'patch' mode of update-recipe"""
     import bb
     import oe.recipeutils
@@ -1471,7 +1471,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         raise DevtoolError('unable to find workspace bbappend for recipe %s' %
                            recipename)
 
-    initial_rev, update_rev, changed_revs, filter_patches = _get_patchset_revs(srctree, append, initial_rev)
+    initial_rev, update_rev, changed_revs, filter_patches = _get_patchset_revs(srctree, append, initial_rev, force_patch_refresh)
     if not initial_rev:
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
@@ -1623,7 +1623,7 @@ def _guess_recipe_update_mode(srctree, rdata):
 
     return 'patch'
 
-def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev, no_report_remove=False, dry_run_outdir=None, no_overrides=False):
+def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev, no_report_remove=False, dry_run_outdir=None, no_overrides=False, force_patch_refresh=False):
     srctree = workspace[recipename]['srctree']
     if mode == 'auto':
         mode = _guess_recipe_update_mode(srctree, rd)
@@ -1677,7 +1677,7 @@ def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_ver
             if mode == 'srcrev':
                 updated, appendf, removed = _update_recipe_srcrev(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, dry_run_outdir)
             elif mode == 'patch':
-                updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir)
+                updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
             else:
                 raise DevtoolError('update_recipe: invalid mode %s' % mode)
             if updated:
@@ -1715,7 +1715,7 @@ def update_recipe(args, config, basepath, workspace):
         if args.dry_run:
             dry_run_output = tempfile.TemporaryDirectory(prefix='devtool')
             dry_run_outdir = dry_run_output.name
-        updated, _, _ = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides)
+        updated, _, _ = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
 
         if updated:
             rf = rd.getVar('FILE')
@@ -1947,7 +1947,7 @@ def finish(args, config, basepath, workspace):
         if args.dry_run:
             dry_run_output = tempfile.TemporaryDirectory(prefix='devtool')
             dry_run_outdir = dry_run_output.name
-        updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides)
+        updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
         removed = [os.path.relpath(pth, recipedir) for pth in removed]
 
         # Remove any old files in the case of an upgrade
@@ -2134,6 +2134,7 @@ def register_commands(subparsers, context):
     parser_update_recipe.add_argument('--no-remove', '-n', action="store_true", help='Don\'t remove patches, only add or update')
     parser_update_recipe.add_argument('--no-overrides', '-O', action="store_true", help='Do not handle other override branches (if they exist)')
     parser_update_recipe.add_argument('--dry-run', '-N', action="store_true", help='Dry-run (just report changes instead of writing them)')
+    parser_update_recipe.add_argument('--force-patch-refresh', action="store_true", help='Update patches in the layer even if they have not been modified (useful for refreshing patch context)')
     parser_update_recipe.set_defaults(func=update_recipe)
 
     parser_status = subparsers.add_parser('status', help='Show workspace status',
@@ -2159,4 +2160,5 @@ def register_commands(subparsers, context):
     parser_finish.add_argument('--force', '-f', action="store_true", help='Force continuing even if there are uncommitted changes in the source tree repository')
     parser_finish.add_argument('--no-overrides', '-O', action="store_true", help='Do not handle other override branches (if they exist)')
     parser_finish.add_argument('--dry-run', '-N', action="store_true", help='Dry-run (just report changes instead of writing them)')
+    parser_finish.add_argument('--force-patch-refresh', action="store_true", help='Update patches in the layer even if they have not been modified (useful for refreshing patch context)')
     parser_finish.set_defaults(func=finish)
-- 
2.16.1


