Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3E992784EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:57:12 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401148"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:57:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:20 +1300
Message-Id: <2f0182931531272447e9a044847b2d585ed547b5.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 19/24] devtool: upgrade: automatically handle changes to source subdirectory
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
X-List-Received-Date: Thu, 09 Nov 2017 01:57:12 -0000

If the directory where the source code extracts to changes (for
example, when upgrading iucode-tool from 1.5 to 2.1.1, the subdirectory
in the tarball changed from "iucode_tool-${PV}" to "iucode-tool-${PV}")
then handle this automatically. Also handle when it changes to match the
default S value (i.e. "${WORKDIR}/${BP}") in which case we just drop
setting S in the recipe.

Fixes [YOCTO #10939].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py |  9 +++++----
 scripts/lib/devtool/upgrade.py  | 28 +++++++++++++++++++++++-----
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 166862f..5ac678b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -409,7 +409,7 @@ def extract(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
+        initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
         logger.info('Source tree extracted to %s' % srctree)
 
         if initial_rev:
@@ -433,7 +433,7 @@ def sync(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
+        initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, True, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
         logger.info('Source tree %s synchronized' % srctree)
 
         if initial_rev:
@@ -549,6 +549,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
 
         with open(os.path.join(tempdir, 'srcsubdir'), 'r') as f:
             srcsubdir = f.read()
+        srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir'))
 
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
         srctree_localdir = os.path.join(srctree, 'oe-local-files')
@@ -615,7 +616,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             logger.info('Preserving temporary directory %s' % tempdir)
         else:
             shutil.rmtree(tempdir)
-    return initial_rev
+    return initial_rev, srcsubdir_rel
 
 def _add_md5(config, recipename, filename):
     """Record checksum of a file (or recursively for a directory) to the md5-file of the workspace"""
@@ -713,7 +714,7 @@ def modify(args, config, basepath, workspace):
         initial_rev = None
         commits = []
         if not args.no_extract:
-            initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
+            initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
             if not initial_rev:
                 return 1
             logger.info('Source tree extracted to %s' % srctree)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index e7d47b9..0db2a50 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -191,6 +191,8 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
         __run('git tag -f devtool-base-new')
         md5 = None
         sha256 = None
+        _, _, _, _, _, params = bb.fetch2.decodeurl(uri)
+        srcsubdir_rel = params.get('destsuffix', 'git')
         if not srcbranch:
             check_branch, check_branch_err = __run('git branch -r --contains %s' % srcrev)
             get_branch = [x.strip() for x in check_branch.splitlines()]
@@ -225,6 +227,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
 
         tmpsrctree = _get_srctree(tmpdir)
         srctree = os.path.abspath(srctree)
+        srcsubdir_rel = os.path.relpath(tmpsrctree, tmpdir)
 
         # Delete all sources so we ensure no stray files are left over
         for item in os.listdir(srctree):
@@ -288,9 +291,9 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
         else:
             shutil.rmtree(tmpsrctree)
 
-    return (rev, md5, sha256, srcbranch)
+    return (rev, md5, sha256, srcbranch, srcsubdir_rel)
 
-def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil, rd):
+def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, srcsubdir_new, workspace, tinfoil, rd):
     """Creates the new recipe under workspace"""
 
     bpn = rd.getVar('BPN')
@@ -384,6 +387,21 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
         newvalues['SRC_URI[%smd5sum]' % nameprefix] = md5
         newvalues['SRC_URI[%ssha256sum]' % nameprefix] = sha256
 
+    if srcsubdir_new != srcsubdir_old:
+        s_subdir_old = os.path.relpath(os.path.abspath(rd.getVar('S')), rd.getVar('WORKDIR'))
+        s_subdir_new = os.path.relpath(os.path.abspath(crd.getVar('S')), crd.getVar('WORKDIR'))
+        if srcsubdir_old == s_subdir_old and srcsubdir_new != s_subdir_new:
+            # Subdir for old extracted source matches what S points to (it should!)
+            # but subdir for new extracted source doesn't match what S will be
+            newvalues['S'] = '${WORKDIR}/%s' % srcsubdir_new.replace(newpv, '${PV}')
+            if crd.expand(newvalues['S']) == crd.expand('${WORKDIR}/${BP}'):
+                # It's the default, drop it
+                # FIXME what if S is being set in a .inc?
+                newvalues['S'] = None
+                logger.info('Source subdirectory has changed, dropping S value since it now matches the default ("${WORKDIR}/${BP}")')
+            else:
+                logger.info('Source subdirectory has changed, updating S value')
+
     rd = tinfoil.parse_recipe_file(fullpath, False)
     oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
 
@@ -458,12 +476,12 @@ def upgrade(args, config, basepath, workspace):
         rf = None
         try:
             logger.info('Extracting current version source...')
-            rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
+            rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
             logger.info('Extracting upgraded version source...')
-            rev2, md5, sha256, srcbranch = _extract_new_source(args.version, srctree, args.no_patch,
+            rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
-            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, config.workspace_path, tinfoil, rd)
+            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd)
         except bb.process.CmdError as e:
             _upgrade_error(e, rf, srctree)
         except DevtoolError as e:
-- 
2.9.5


