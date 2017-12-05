Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2D65B7871C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:41:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181355786"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:41:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:10 +1300
Message-Id: <23d6dd1f733e57783cb129e598d99fbe76d758fd.1512438000.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/12] devtool: refactor return for _extract_source()
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
X-List-Received-Date: Tue, 05 Dec 2017 01:41:31 -0000

Use a namedtuple to return information to the caller, since I've been
expanding that information we should avoid having to change all of the
calling code each time.

Additionally, it turned out that a bunch of the callers were checking
for None being returned in the initial_rev value, but that's no longer
possible, so tidy up the calling code.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 29 ++++++++++-------------------
 scripts/lib/devtool/upgrade.py  |  4 ++--
 2 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 26187a0..b1669b5 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -29,7 +29,7 @@ import scriptutils
 import errno
 import glob
 import filecmp
-from collections import OrderedDict
+from collections import OrderedDict, namedtuple
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, update_unlockedsigs, check_prerelease_version, check_git_repo_dirty, check_git_repo_op, DevtoolError
 from devtool import parse_recipe
 
@@ -437,15 +437,11 @@ def extract(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
+        _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
         logger.info('Source tree extracted to %s' % srctree)
-
-        if initial_rev:
-            return 0
-        else:
-            return 1
     finally:
         tinfoil.shutdown()
+    return 0
 
 def sync(args, config, basepath, workspace):
     """Entry point for the devtool 'sync' subcommand"""
@@ -461,17 +457,15 @@ def sync(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, True, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=True)
+        _extract_source(srctree, args.keep_temp, args.branch, True, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=True)
         logger.info('Source tree %s synchronized' % srctree)
-
-        if initial_rev:
-            return 0
-        else:
-            return 1
     finally:
         tinfoil.shutdown()
+    return 0
 
 
+ExtractSourceResult = namedtuple('ExtractSourceResult', ['initial_rev', 'srcsubdir'])
+
 def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False):
     """Extract sources of a recipe"""
     import oe.recipeutils
@@ -512,8 +506,6 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         if extra_overrides:
             logger.info('SRC_URI contains some conditional appends/prepends - will create branches to represent these')
 
-    initial_rev = None
-
     appendexisted = False
     recipefile = d.getVar('FILE')
     appendfile = recipe_to_append(recipefile, config)
@@ -659,7 +651,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             logger.info('Preserving temporary directory %s' % tempdir)
         else:
             shutil.rmtree(tempdir)
-    return initial_rev, srcsubdir_rel
+    return ExtractSourceResult(initial_rev, srcsubdir_rel)
 
 def _add_md5(config, recipename, filename):
     """Record checksum of a file (or recursively for a directory) to the md5-file of the workspace"""
@@ -759,9 +751,8 @@ def modify(args, config, basepath, workspace):
         commits = []
         check_commits = False
         if not args.no_extract:
-            initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
-            if not initial_rev:
-                return 1
+            ret = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
+            initial_rev = ret.initial_rev
             logger.info('Source tree extracted to %s' % srctree)
             # Get list of commits since this revision
             (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index f6141bf..7afdd80 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -474,12 +474,12 @@ def upgrade(args, config, basepath, workspace):
         rf = None
         try:
             logger.info('Extracting current version source...')
-            rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
+            current_ret = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
             logger.info('Extracting upgraded version source...')
             rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
-            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd)
+            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, current_ret.srcsubdir, srcsubdir2, config.workspace_path, tinfoil, rd)
         except bb.process.CmdError as e:
             _upgrade_error(e, rf, srctree)
         except DevtoolError as e:
-- 
2.9.5


