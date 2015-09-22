Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7FEF677020
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520289"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:27 +0100
Message-Id: <a2e427fc992ad84e22b859a12afa782f83834a09.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/27] devtool: add: properly handle separate build directory
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:13 -0000

When we were adding a recipe for software that would typically be built
in the same directory as the source, we were always using a separate
build directory unless the user explicitly specified not to, leading to
errors for software that doesn't expect to be built that way (such as
Python modules using distutils). Split out the code that makes this
determination automatically from the "devtool modify" and "devtool
upgrade" code and re-use that here so the behaviour is consistent.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 18 ++++++++++++++++++
 scripts/lib/devtool/standard.py | 30 +++++++++++++++---------------
 scripts/lib/devtool/upgrade.py  | 20 +++-----------------
 3 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 3ea3802..07a3636 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -152,3 +152,21 @@ def check_workspace_recipe(workspace, pn, checksrc=True):
             raise DevtoolError("Source tree %s for recipe %s does not exist" % (srctree, pn))
         if not os.listdir(srctree):
             raise DevtoolError("Source tree %s for recipe %s is empty" % (srctree, pn))
+
+def use_external_build(same_dir, no_same_dir, d):
+    """
+    Determine if we should use B!=S (separate build and source directories) or not
+    """
+    b_is_s = True
+    if no_same_dir:
+        logger.info('Using separate build directory since --no-same-dir specified')
+        b_is_s = False
+    elif same_dir:
+        logger.info('Using source tree as build directory since --same-dir specified')
+    elif bb.data.inherits_class('autotools-brokensep', d):
+        logger.info('Using source tree as build directory since recipe inherits autotools-brokensep')
+    elif d.getVar('B', True) == os.path.abspath(d.getVar('S', True)):
+        logger.info('Using source tree as build directory since that would be the default for this recipe')
+    else:
+        b_is_s = False
+    return b_is_s
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ec21b3c..700a56b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -25,7 +25,7 @@ import logging
 import argparse
 import scriptutils
 import errno
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -107,17 +107,26 @@ def add(args, config, basepath, workspace):
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
         initial_rev = stdout.rstrip()
 
+    tinfoil = setup_tinfoil(config_only=True)
+    rd = oe.recipeutils.parse_recipe(recipefile, None, tinfoil.config_data)
+    if not rd:
+        return 1
+
     appendfile = os.path.join(appendpath, '%s.bbappend' % bp)
     with open(appendfile, 'w') as f:
         f.write('inherit externalsrc\n')
         f.write('EXTERNALSRC = "%s"\n' % srctree)
-        if args.same_dir:
+
+        b_is_s = use_external_build(args.same_dir, args.no_same_dir, rd)
+        if b_is_s:
             f.write('EXTERNALSRC_BUILD = "%s"\n' % srctree)
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
 
     _add_md5(config, args.recipename, appendfile)
 
+    tinfoil.shutdown()
+
     return 0
 
 
@@ -483,18 +492,7 @@ def modify(args, config, basepath, workspace):
         f.write('# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
         f.write('EXTERNALSRC_pn-%s = "%s"\n' % (args.recipename, srctree))
 
-        b_is_s = True
-        if args.no_same_dir:
-            logger.info('using separate build directory since --no-same-dir specified')
-            b_is_s = False
-        elif args.same_dir:
-            logger.info('using source tree as build directory since --same-dir specified')
-        elif bb.data.inherits_class('autotools-brokensep', rd):
-            logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
-        elif rd.getVar('B', True) == s:
-            logger.info('using source tree as build directory since that is the default for this recipe')
-        else:
-            b_is_s = False
+        b_is_s = use_external_build(args.same_dir, args.no_same_dir, rd)
         if b_is_s:
             f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (args.recipename, srctree))
 
@@ -876,7 +874,9 @@ def register_commands(subparsers, context):
                                        description='Adds a new recipe')
     parser_add.add_argument('recipename', help='Name for new recipe to add')
     parser_add.add_argument('srctree', help='Path to external source tree')
-    parser_add.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
+    group = parser_add.add_mutually_exclusive_group()
+    group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
+    group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_add.add_argument('--fetch', '-f', help='Fetch the specified URI and extract it to create the source tree', metavar='URI')
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
     parser_add.set_defaults(func=add)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 86443b0..6c1dfee 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -29,7 +29,7 @@ import errno
 import bb
 import oe.recipeutils
 from devtool import standard
-from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_recipe
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_recipe, use_external_build
 
 logger = logging.getLogger('devtool')
 
@@ -126,21 +126,6 @@ def _rename_recipe_files(bpn, oldpv, newpv, path):
     _rename_recipe_dirs(oldpv, newpv, path)
     return _rename_recipe_file(bpn, oldpv, newpv, path)
 
-def _use_external_build(same_dir, no_same_dir, d):
-    b_is_s = True
-    if no_same_dir:
-        logger.info('using separate build directory since --no-same-dir specified')
-        b_is_s = False
-    elif same_dir:
-        logger.info('using source tree as build directory since --same-dir specified')
-    elif bb.data.inherits_class('autotools-brokensep', d):
-        logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
-    elif d.getVar('B', True) == os.path.abspath(d.getVar('S', True)):
-        logger.info('using source tree as build directory since that is the default for this recipe')
-    else:
-        b_is_s = False
-    return b_is_s
-
 def _write_append(rc, srctree, same_dir, no_same_dir, rev, workspace, d):
     """Writes an append file"""
     if not os.path.exists(rc):
@@ -161,7 +146,8 @@ def _write_append(rc, srctree, same_dir, no_same_dir, rev, workspace, d):
         f.write(('# NOTE: We use pn- overrides here to avoid affecting'
                  'multiple variants in the case where the recipe uses BBCLASSEXTEND\n'))
         f.write('EXTERNALSRC_pn-%s = "%s"\n' % (pn, srctree))
-        if _use_external_build(same_dir, no_same_dir, d):
+        b_is_s = use_external_build(same_dir, no_same_dir, d)
+        if b_is_s:
             f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (pn, srctree))
         if rev:
             f.write('\n# initial_rev: %s\n' % rev)
-- 
2.1.0


