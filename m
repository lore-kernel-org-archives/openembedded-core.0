Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3DDC9783DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 10:18:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2017 03:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,382,1500966000"; d="scan'208";a="1194168390"
Received: from nrahulx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2017 03:18:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2017 22:18:39 +1200
Message-Id: <f04d0ec0e03b4d11ae48c462552e1e5a4b6cf051.1505211385.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1505211385.git.paul.eggleton@linux.intel.com>
References: <cover.1505211385.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] devtool: ensure recipes devtool is working on are unlocked within the eSDK
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
X-List-Received-Date: Tue, 12 Sep 2017 10:18:59 -0000

Alongside reworking the way devtool extracts source, we now need to
ensure that within the extensible SDK where task signatures are locked,
the signatures of the tasks for the recipes being worked on get unlocked
at the right time or otherwise we'll now get taskhash mismatches when
running devtool modify on a recipe that was included in the eSDK such as
the kernel (due to a separate bug). The existing mechanism for
auto-unlocking recipes was a little weak and was happening too late, so
I've reimplemented it so that:
(a) it gets triggered immediately when the recipe/append is created
(b) we avoid writing to the unlocked signatures file unnecessarily
    (since it's a global configuration file) and
(c) within the eSDK configuration we whitelist SIGGEN_UNLOCKED_RECIPES
    to avoid unnecessary reparses every time we perform one of the
    devtool operations that does need to change this list.

Fixes [YOCTO #11883] (not the underlying cause, but this manifestation
of the issue).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  3 +++
 scripts/devtool                       | 20 ------------------
 scripts/lib/devtool/__init__.py       | 40 +++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py       | 20 +++++++++++-------
 scripts/lib/devtool/upgrade.py        |  9 +++++---
 5 files changed, 61 insertions(+), 31 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 6620445..3620995 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -346,6 +346,9 @@ python copy_buildsystem () {
             # the sig computed from the metadata.
             f.write('SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n\n')
 
+            # We want to be able to set this without a full reparse
+            f.write('BB_HASHCONFIG_WHITELIST_append = " SIGGEN_UNLOCKED_RECIPES"\n\n')
+
             # Set up whitelist for run on install
             f.write('BB_SETSCENE_ENFORCE_WHITELIST = "%:* *:do_shared_workdir *:do_rm_work wic-tools:* *:do_addto_recipe_sysroot"\n\n')
 
diff --git a/scripts/devtool b/scripts/devtool
index c9ad9dd..5292f18 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -130,25 +130,6 @@ def read_workspace():
                                      'recipefile': recipefile}
                     logger.debug('Found recipe %s' % workspace[pn])
 
-def create_unlockedsigs():
-    """ This function will make unlocked-sigs.inc match the recipes in the
-    workspace. This runs on every run of devtool, but it lets us ensure
-    the unlocked items are in sync with the workspace. """
-
-    confdir = os.path.join(basepath, 'conf')
-    unlockedsigs = os.path.join(confdir, 'unlocked-sigs.inc')
-    bb.utils.mkdirhier(confdir)
-    with open(os.path.join(confdir, 'unlocked-sigs.inc'), 'w') as f:
-        f.write("# DO NOT MODIFY! YOUR CHANGES WILL BE LOST.\n" +
-                "# This layer was created by the OpenEmbedded devtool" +
-                " utility in order to\n" +
-                "# contain recipes that are unlocked.\n")
-
-        f.write('SIGGEN_UNLOCKED_RECIPES += "\\\n')
-        for pn in workspace:
-            f.write('    ' + pn)
-        f.write('"')
-
 def create_workspace(args, config, basepath, workspace):
     if args.layerpath:
         workspacedir = os.path.abspath(args.layerpath)
@@ -332,7 +313,6 @@ def main():
 
     if not getattr(args, 'no_workspace', False):
         read_workspace()
-        create_unlockedsigs()
 
     try:
         ret = args.func(args, config, basepath, workspace)
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 14170cb..94e3d7d 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -297,3 +297,43 @@ def replace_from_file(path, old, new):
         except ValueError:
             pass
     write_file(path, "\n".join(new_contents))
+
+
+def update_unlockedsigs(basepath, workspace, fixed_setup, extra=None):
+    """ This function will make unlocked-sigs.inc match the recipes in the
+    workspace plus any extras we want unlocked. """
+
+    if not fixed_setup:
+        # Only need to write this out within the eSDK
+        return
+
+    if not extra:
+        extra = []
+
+    confdir = os.path.join(basepath, 'conf')
+    unlockedsigs = os.path.join(confdir, 'unlocked-sigs.inc')
+
+    # Get current unlocked list if any
+    values = {}
+    def get_unlockedsigs_varfunc(varname, origvalue, op, newlines):
+        values[varname] = origvalue
+        return origvalue, None, 0, True
+    if os.path.exists(unlockedsigs):
+        with open(unlockedsigs, 'r') as f:
+            bb.utils.edit_metadata(f, ['SIGGEN_UNLOCKED_RECIPES'], get_unlockedsigs_varfunc)
+    unlocked = sorted(values.get('SIGGEN_UNLOCKED_RECIPES', []))
+
+    # If the new list is different to the current list, write it out
+    newunlocked = sorted(list(workspace.keys()) + extra)
+    if unlocked != newunlocked:
+        bb.utils.mkdirhier(confdir)
+        with open(unlockedsigs, 'w') as f:
+            f.write("# DO NOT MODIFY! YOUR CHANGES WILL BE LOST.\n" +
+                    "# This layer was created by the OpenEmbedded devtool" +
+                    " utility in order to\n" +
+                    "# contain recipes that are unlocked.\n")
+
+            f.write('SIGGEN_UNLOCKED_RECIPES += "\\\n')
+            for pn in newunlocked:
+                f.write('    ' + pn)
+            f.write('"')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 96c4d0f..76ddca6 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -30,7 +30,7 @@ import errno
 import glob
 import filecmp
 from collections import OrderedDict
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, update_unlockedsigs, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -387,7 +387,7 @@ def extract(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, config, rd, tinfoil)
+        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
         logger.info('Source tree extracted to %s' % srctree)
 
         if initial_rev:
@@ -411,7 +411,7 @@ def sync(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, config, rd, tinfoil)
+        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
         logger.info('Source tree %s synchronized' % srctree)
 
         if initial_rev:
@@ -422,7 +422,7 @@ def sync(args, config, basepath, workspace):
         tinfoil.shutdown()
 
 
-def _extract_source(srctree, keep_temp, devbranch, sync, config, d, tinfoil):
+def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil):
     """Extract sources of a recipe"""
     import oe.recipeutils
     import oe.patch
@@ -494,6 +494,8 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, d, tinfoil):
             f.write('inherit devtool-source\n')
             f.write('###--- _extract_source\n')
 
+        update_unlockedsigs(basepath, workspace, fixed_setup, [pn])
+
         # FIXME this results in the cache reload under control of tinfoil, which is fine
         # except we don't get the knotty progress bar
         tinfoil.run_command('invalidateParseCache')
@@ -690,7 +692,7 @@ def modify(args, config, basepath, workspace):
         initial_rev = None
         commits = []
         if not args.no_extract:
-            initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, config, rd, tinfoil)
+            initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
             if not initial_rev:
                 return 1
             logger.info('Source tree extracted to %s' % srctree)
@@ -752,6 +754,8 @@ def modify(args, config, basepath, workspace):
                 for commit in commits:
                     f.write('# commit: %s\n' % commit)
 
+        update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
+
         _add_md5(config, pn, appendfile)
 
         logger.info('Recipe %s now set up to build from %s' % (pn, srctree))
@@ -1759,7 +1763,7 @@ def register_commands(subparsers, context):
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (when not using -n/--no-extract) (default "%(default)s")')
     parser_modify.add_argument('--keep-temp', help='Keep temporary directory (for debugging)', action="store_true")
-    parser_modify.set_defaults(func=modify)
+    parser_modify.set_defaults(func=modify, fixed_setup=context.fixed_setup)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
                                        description='Extracts the source for an existing recipe',
@@ -1768,7 +1772,7 @@ def register_commands(subparsers, context):
     parser_extract.add_argument('srctree', help='Path to where to extract the source tree')
     parser_extract.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (default "%(default)s")')
     parser_extract.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
-    parser_extract.set_defaults(func=extract)
+    parser_extract.set_defaults(func=extract, fixed_setup=context.fixed_setup)
 
     parser_sync = subparsers.add_parser('sync', help='Synchronize the source tree for an existing recipe',
                                        description='Synchronize the previously extracted source tree for an existing recipe',
@@ -1778,7 +1782,7 @@ def register_commands(subparsers, context):
     parser_sync.add_argument('srctree', help='Path to the source tree')
     parser_sync.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
     parser_sync.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
-    parser_sync.set_defaults(func=sync)
+    parser_sync.set_defaults(func=sync, fixed_setup=context.fixed_setup)
 
     parser_rename = subparsers.add_parser('rename', help='Rename a recipe file in the workspace',
                                        description='Renames the recipe file for a recipe in the workspace, changing the name or version part or both, ensuring that all references within the workspace are updated at the same time. Only works when the recipe file itself is in the workspace, e.g. after devtool add. Particularly useful when devtool add did not automatically determine the correct name.',
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 39d0bd7..f1b3ff0 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -33,7 +33,7 @@ sys.path = sys.path + [devtool_path]
 
 import oe.recipeutils
 from devtool import standard
-from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_recipe, use_external_build
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_recipe, use_external_build, update_unlockedsigs
 
 logger = logging.getLogger('devtool')
 
@@ -418,7 +418,7 @@ def upgrade(args, config, basepath, workspace):
 
         rf = None
         try:
-            rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, rd, tinfoil)
+            rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
             rev2, md5, sha256, srcbranch = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
@@ -432,6 +432,9 @@ def upgrade(args, config, basepath, workspace):
         af = _write_append(rf, srctree, args.same_dir, args.no_same_dir, rev2,
                         copied, config.workspace_path, rd)
         standard._add_md5(config, pn, af)
+
+        update_unlockedsigs(basepath, workspace, [pn], args.fixed_setup)
+
         logger.info('Upgraded source extracted to %s' % srctree)
         logger.info('New recipe is %s' % rf)
     finally:
@@ -457,4 +460,4 @@ def register_commands(subparsers, context):
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_upgrade.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
-    parser_upgrade.set_defaults(func=upgrade)
+    parser_upgrade.set_defaults(func=upgrade, fixed_setup=context.fixed_setup)
-- 
2.9.5


