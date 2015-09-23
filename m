Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB4C757AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 10:05:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 23 Sep 2015 03:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; d="scan'208";a="795471349"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.4.127])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2015 03:05:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 11:05:23 +0100
Message-Id: <4f3ba0dba496671c2d229be52debce6ab01a6b71.1443002672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443002672.git.paul.eggleton@linux.intel.com>
References: <cover.1443002672.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1443002672.git.paul.eggleton@linux.intel.com>
References: <cover.1443002672.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/3] devtool: second fix for running from a different directory
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
X-List-Received-Date: Wed, 23 Sep 2015 10:05:49 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Do not change change current working directory permanently, but, only
for the duration of tinfoil initialization instead. The previous fix
caused very unintuitive behavior where using relative paths were solved
with respect to the builddir instead of the current working directory.
E.g. calling "devtool extract zlib ./zlib" would always create create
srctree in ${TOPDIR}/zlib, independent of the users cwd.

(From OE-Core rev: 4c7f159b0e17a0475a4a4e9dc4dd012e3d2e6a1f)

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                    |  5 +----
 scripts/lib/devtool/__init__.py    |  6 +++++-
 scripts/lib/devtool/build-image.py |  2 +-
 scripts/lib/devtool/deploy.py      |  2 +-
 scripts/lib/devtool/package.py     |  2 +-
 scripts/lib/devtool/runqemu.py     |  2 +-
 scripts/lib/devtool/search.py      |  2 +-
 scripts/lib/devtool/standard.py    | 10 +++++-----
 scripts/lib/devtool/upgrade.py     |  2 +-
 9 files changed, 17 insertions(+), 16 deletions(-)

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
index f815ef2..7b1ab11 100644
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
index 05c1d75..e53239d 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -59,7 +59,7 @@ def build_image(args, config, basepath, workspace):
     if os.path.isfile(appendfile):
         os.unlink(appendfile)
 
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
     rd = parse_recipe(config, tinfoil, image, True)
     if not rd:
         # Error already shown
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 41b666f..c90c6b1 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -40,7 +40,7 @@ def deploy(args, config, basepath, workspace):
     deploy_dir = os.path.join(basepath, 'target_deploy', args.target)
     deploy_file = os.path.join(deploy_dir, args.recipename + '.list')
 
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
     try:
         rd = oe.recipeutils.parse_recipe_simple(tinfoil.cooker, args.recipename, tinfoil.config_data)
     except Exception as e:
diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index 28ecfed..b8d8423 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -34,7 +34,7 @@ def package(args, config, basepath, workspace):
 
     image_pkgtype = config.get('Package', 'image_pkgtype', '')
     if not image_pkgtype:
-        tinfoil = setup_tinfoil()
+        tinfoil = setup_tinfoil(basepath=basepath)
         try:
             tinfoil.prepare(config_only=True)
             image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
index e7f26ab..4d08d8c 100644
--- a/scripts/lib/devtool/runqemu.py
+++ b/scripts/lib/devtool/runqemu.py
@@ -29,7 +29,7 @@ logger = logging.getLogger('devtool')
 def runqemu(args, config, basepath, workspace):
     """Entry point for the devtool 'runqemu' subcommand"""
 
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
     machine = tinfoil.config_data.getVar('MACHINE', True)
     bindir_native = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE', True)
     tinfoil.shutdown()
diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index e6ae922..c2f420c 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -29,7 +29,7 @@ logger = logging.getLogger('devtool')
 def search(args, config, basepath, workspace):
     """Entry point for the devtool 'search' subcommand"""
 
-    tinfoil = setup_tinfoil(config_only=True)
+    tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
     tinfoil.shutdown()
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 96b271c..1dcf7cd 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -111,7 +111,7 @@ def add(args, config, basepath, workspace):
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
         initial_rev = stdout.rstrip()
 
-    tinfoil = setup_tinfoil(config_only=True)
+    tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     rd = oe.recipeutils.parse_recipe(recipefile, None, tinfoil.config_data)
     if not rd:
         return 1
@@ -231,7 +231,7 @@ class BbTaskExecutor(object):
 def _prep_extract_operation(config, basepath, recipename):
     """HACK: Ugly workaround for making sure that requirements are met when
        trying to extract a package. Returns the tinfoil instance to be used."""
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
     rd = parse_recipe(config, tinfoil, recipename, True)
 
     if bb.data.inherits_class('kernel-yocto', rd):
@@ -239,7 +239,7 @@ def _prep_extract_operation(config, basepath, recipename):
         try:
             stdout, _ = exec_build_env_command(config.init_path, basepath,
                                                'bitbake kern-tools-native')
-            tinfoil = setup_tinfoil()
+            tinfoil = setup_tinfoil(basepath=basepath)
         except bb.process.ExecutionError as err:
             raise DevtoolError("Failed to build kern-tools-native:\n%s" %
                                err.stdout)
@@ -443,7 +443,7 @@ def modify(args, config, basepath, workspace):
     if args.extract:
         tinfoil = _prep_extract_operation(config, basepath, args.recipename)
     else:
-        tinfoil = setup_tinfoil()
+        tinfoil = setup_tinfoil(basepath=basepath)
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
@@ -797,7 +797,7 @@ def update_recipe(args, config, basepath, workspace):
             raise DevtoolError('conf/layer.conf not found in bbappend '
                                'destination layer "%s"' % args.append)
 
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 6c1dfee..aa53c8e 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -294,7 +294,7 @@ def upgrade(args, config, basepath, workspace):
     if reason:
         raise DevtoolError(reason)
 
-    tinfoil = setup_tinfoil()
+    tinfoil = setup_tinfoil(basepath=basepath)
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
-- 
2.1.0


