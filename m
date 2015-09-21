Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4CE60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 11:36:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2015 04:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,567,1437462000"; d="scan'208";a="794098923"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 21 Sep 2015 04:36:44 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 14:36:42 +0300
Message-Id: <1442835402-6187-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH] devtool: second fix for running from a different directory
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
X-List-Received-Date: Mon, 21 Sep 2015 11:36:47 -0000

Do not change change current working directory permanently, but, only
for the duration of tinfoil initialization instead. The previous fix
caused very unintuitive behavior where using relative paths were solved
with respect to the builddir instead of the current working directory.
E.g. calling "devtool extract zlib ./zlib" would always create create
srctree in ${TOPDIR}/zlib, independent of the users cwd.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/devtool                    | 5 +----
 scripts/lib/devtool/__init__.py    | 6 +++++-
 scripts/lib/devtool/build-image.py | 6 +++---
 scripts/lib/devtool/deploy.py      | 2 +-
 scripts/lib/devtool/package.py     | 2 +-
 scripts/lib/devtool/standard.py    | 8 ++++----
 scripts/lib/devtool/upgrade.py     | 2 +-
 7 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 87df951..e4d9db3 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -221,9 +221,6 @@ def main():
     if not config.read():
         return -1
 
-    # We need to be in this directory or we won't be able to initialise tinfoil
-    os.chdir(basepath)
-
     bitbake_subdir = config.get('General', 'bitbake_subdir', '')
     if bitbake_subdir:
         # Normally set for use within the SDK
@@ -244,7 +241,7 @@ def main():
     scriptutils.logger_setup_color(logger, global_args.color)
 
     if global_args.bbpath is None:
-        tinfoil = setup_tinfoil(config_only=True)
+        tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
         global_args.bbpath = tinfoil.config_data.getVar('BBPATH', True)
     else:
         tinfoil = None
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 404d3e6..37745fd 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -96,9 +96,12 @@ def exec_fakeroot(d, cmd, **kwargs):
             newenv[splitval[0]] = splitval[1]
     return subprocess.call("%s %s" % (fakerootcmd, cmd), env=newenv, **kwargs)
 
-def setup_tinfoil(config_only=False):
+def setup_tinfoil(config_only=False, basepath=None):
     """Initialize tinfoil api from bitbake"""
     import scriptpath
+    orig_cwd = os.path.abspath(os.curdir)
+    if basepath:
+        os.chdir(basepath)
     bitbakepath = scriptpath.add_bitbake_lib_path()
     if not bitbakepath:
         logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
@@ -108,6 +111,7 @@ def setup_tinfoil(config_only=False):
     tinfoil = bb.tinfoil.Tinfoil()
     tinfoil.prepare(config_only)
     tinfoil.logger.setLevel(logger.getEffectiveLevel())
+    os.chdir(orig_cwd)
     return tinfoil
 
 def get_recipe_file(cooker, pn):
diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index 2c01428..f1a4017 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -25,10 +25,10 @@ from devtool import exec_build_env_command, setup_tinfoil, parse_recipe
 
 logger = logging.getLogger('devtool')
 
-def _get_recipes(workspace, config):
+def _get_recipes(workspace, config, basepath):
     """Get list of target recipes from the workspace."""
     result = []
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
     for recipe in workspace:
         data = parse_recipe(config, tinfoil, recipe, True)
         if 'class-target' in data.getVar('OVERRIDES', True).split(':'):
@@ -51,7 +51,7 @@ def build_image(args, config, basepath, workspace):
     if os.path.isfile(appendfile):
         os.unlink(appendfile)
 
-    recipes = _get_recipes(workspace, config)
+    recipes = _get_recipes(workspace, config, basepath)
     if recipes:
         with open(appendfile, 'w') as afile:
             # include selected recipes into the image
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index fa93adf..5bed72b 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -41,7 +41,7 @@ def deploy(args, config, basepath, workspace):
     deploy_dir = os.path.join(basepath, 'target_deploy', args.target)
     deploy_file = os.path.join(deploy_dir, args.recipename + '.list')
 
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
     try:
         rd = oe.recipeutils.parse_recipe_simple(tinfoil.cooker, args.recipename, tinfoil.config_data)
     except Exception as e:
diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index 3a7a36b..f3ab809 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -36,7 +36,7 @@ def package(args, config, basepath, workspace):
 
     image_pkgtype = config.get('Package', 'image_pkgtype', '')
     if not image_pkgtype:
-        tinfoil = setup_tinfoil()
+        tinfoil = setup_tinfoil(basepath=basepath)
         try:
             tinfoil.prepare(config_only=True)
             image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d5900b4..aab879e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -210,7 +210,7 @@ class BbTaskExecutor(object):
 def _prep_extract_operation(config, basepath, recipename):
     """HACK: Ugly workaround for making sure that requirements are met when
        trying to extract a package. Returns the tinfoil instance to be used."""
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
     rd = parse_recipe(config, tinfoil, recipename, True)
 
     if bb.data.inherits_class('kernel-yocto', rd):
@@ -218,7 +218,7 @@ def _prep_extract_operation(config, basepath, recipename):
         try:
             stdout, _ = exec_build_env_command(config.init_path, basepath,
                                                'bitbake kern-tools-native')
-            tinfoil = setup_tinfoil()
+            tinfoil = setup_tinfoil(basepath=basepath)
         except bb.process.ExecutionError as err:
             raise DevtoolError("Failed to build kern-tools-native:\n%s" %
                                err.stdout)
@@ -421,7 +421,7 @@ def modify(args, config, basepath, workspace):
     if args.extract:
         tinfoil = _prep_extract_operation(config, basepath, args.recipename)
     else:
-        tinfoil = setup_tinfoil()
+        tinfoil = setup_tinfoil(basepath=basepath)
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
@@ -788,7 +788,7 @@ def update_recipe(args, config, basepath, workspace):
             raise DevtoolError('conf/layer.conf not found in bbappend '
                                'destination layer "%s"' % args.append)
 
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 86443b0..e74e795 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -308,7 +308,7 @@ def upgrade(args, config, basepath, workspace):
     if reason:
         raise DevtoolError(reason)
 
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
-- 
2.1.4


