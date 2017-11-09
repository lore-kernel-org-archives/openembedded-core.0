Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 25D7578522
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:33 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401030"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:09 +1300
Message-Id: <87e0929250afc775ece74ea29c347bc94d014899.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/24] devtool: fix handling of oe-local-files when source is in a subdirectory
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:33 -0000

If S points to a subdirectory of the source rather than the "base" of
the source tree then we weren't handling the oe-local-files directory
properly - it got extracted to the base of the tree but devtool
update-recipe and devtool finish assumed it would be under S which would
be the subdirectory, thus it would be missing and devtool would assume
the files had been deleted and remove them from the recipe. Record the
base of the source tree in the bbappend and read it into the in-memory
workspace so we can use that to find out where oe-local-files should be
found.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                 | 15 +++++++++++----
 scripts/lib/devtool/standard.py | 24 +++++++++++++++---------
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 5292f18..87bb5c8 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -113,6 +113,7 @@ def read_workspace():
     externalsrc_re = re.compile(r'^EXTERNALSRC(_pn-([^ =]+))? *= *"([^"]*)"$')
     for fn in glob.glob(os.path.join(config.workspace_path, 'appends', '*.bbappend')):
         with open(fn, 'r') as f:
+            pnvalues = {}
             for line in f:
                 res = externalsrc_re.match(line.rstrip())
                 if res:
@@ -125,10 +126,16 @@ def read_workspace():
                                                         bbfile))
                     if recipefile:
                         recipefile = recipefile[0]
-                    workspace[pn] = {'srctree': res.group(3),
-                                     'bbappend': fn,
-                                     'recipefile': recipefile}
-                    logger.debug('Found recipe %s' % workspace[pn])
+                    pnvalues['srctree'] = res.group(3)
+                    pnvalues['bbappend'] = fn
+                    pnvalues['recipefile'] = recipefile
+                elif line.startswith('# srctreebase: '):
+                    pnvalues['srctreebase'] = line.split(':', 1)[1].strip()
+            if pnvalues:
+                if not pnvalues.get('srctreebase', None):
+                    pnvalues['srctreebase'] = pnvalues['srctree']
+                logger.debug('Found recipe %s' % pnvalues)
+                workspace[pn] = pnvalues
 
 def create_workspace(args, config, basepath, workspace):
     if args.layerpath:
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index beea0d4c2..8e4c7f7 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -734,6 +734,9 @@ def modify(args, config, basepath, workspace):
                     (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
                     initial_rev = stdout.rstrip()
 
+        # Need to grab this here in case the source is within a subdirectory
+        srctreebase = srctree
+
         # Check that recipe isn't using a shared workdir
         s = os.path.abspath(rd.getVar('S'))
         workdir = os.path.abspath(rd.getVar('WORKDIR'))
@@ -748,7 +751,8 @@ def modify(args, config, basepath, workspace):
             # Local files can be modified/tracked in separate subdir under srctree
             # Mostly useful for packages with S != WORKDIR
             f.write('FILESPATH_prepend := "%s:"\n' %
-                    os.path.join(srctree, 'oe-local-files'))
+                    os.path.join(srctreebase, 'oe-local-files'))
+            f.write('# srctreebase: %s\n' % srctreebase)
 
             f.write('\ninherit externalsrc\n')
             f.write('# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
@@ -1166,7 +1170,7 @@ def _create_kconfig_diff(srctree, rd, outfile):
     return False
 
 
-def _export_local_files(srctree, rd, destdir):
+def _export_local_files(srctree, rd, destdir, srctreebase):
     """Copy local files from srctree to given location.
        Returns three-tuple of dicts:
          1. updated - files that already exist in SRCURI
@@ -1186,7 +1190,7 @@ def _export_local_files(srctree, rd, destdir):
     updated = OrderedDict()
     added = OrderedDict()
     removed = OrderedDict()
-    local_files_dir = os.path.join(srctree, 'oe-local-files')
+    local_files_dir = os.path.join(srctreebase, 'oe-local-files')
     git_files = _git_ls_tree(srctree)
     if 'oe-local-files' in git_files:
         # If tracked by Git, take the files from srctree HEAD. First get
@@ -1199,9 +1203,9 @@ def _export_local_files(srctree, rd, destdir):
         new_set = list(_git_ls_tree(srctree, tree, True).keys())
     elif os.path.isdir(local_files_dir):
         # If not tracked by Git, just copy from working copy
-        new_set = _ls_tree(os.path.join(srctree, 'oe-local-files'))
+        new_set = _ls_tree(local_files_dir)
         bb.process.run(['cp', '-ax',
-                        os.path.join(srctree, 'oe-local-files', '.'), destdir])
+                        os.path.join(local_files_dir, '.'), destdir])
     else:
         new_set = []
 
@@ -1266,7 +1270,7 @@ def _determine_files_dir(rd):
     return os.path.join(recipedir, rd.getVar('BPN'))
 
 
-def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remove):
+def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove):
     """Implement the 'srcrev' mode of update-recipe"""
     import bb
     import oe.recipeutils
@@ -1294,7 +1298,8 @@ def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remo
     update_srcuri = False
     try:
         local_files_dir = tempfile.mkdtemp(dir=tempdir)
-        upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir)
+        srctreebase = workspace[recipename]['srctreebase']
+        upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir, srctreebase)
         if not no_remove:
             # Find list of existing patches in recipe file
             patches_dir = tempfile.mkdtemp(dir=tempdir)
@@ -1372,7 +1377,8 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
         local_files_dir = tempfile.mkdtemp(dir=tempdir)
-        upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir)
+        srctreebase = workspace[recipename]['srctreebase']
+        upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir, srctreebase)
 
         remove_files = []
         if not no_remove:
@@ -1495,7 +1501,7 @@ def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_ver
         mode = _guess_recipe_update_mode(srctree, rd)
 
     if mode == 'srcrev':
-        updated = _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remove)
+        updated = _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove)
     elif mode == 'patch':
         updated = _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, initial_rev)
     else:
-- 
2.9.5


