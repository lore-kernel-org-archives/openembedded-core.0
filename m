Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 125A678316
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:49:07 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 07:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="129748655"
Received: from rpieper-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.39.83])
	by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2017 07:48:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:48:13 +0200
Message-Id: <cb0b757b99a3b0dc6a4c7fefb2f5681bcc687335.1500561823.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1500561823.git.paul.eggleton@linux.intel.com>
References: <cover.1500561823.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 7/7] recipetool: create: refactor code for ensuring npm is available
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
X-List-Received-Date: Thu, 20 Jul 2017 14:49:07 -0000

Across devtool and recipetool we had an ugly set of code for ensuring
that we can call an npm binary, and much of that ugliness was a result
of not being able to run build tasks when tinfoil was active - if
recipetool found that npm was required and we didn't know beforehand
(e.g. we're fetching from a plain git repository as opposed to an npm://
URL where it's obvious) then it had to exit and return a special result
code, so that devtool knew it needed to build nodejs-native and then
call recipetool again. Now that we are using real build tasks to fetch
and unpack, we can drop most of this and move the code to the one place
where it's still needed (i.e. create_npm where we potentially have to
deal with node.js code in a plain source repository).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py      | 31 -------------------------------
 scripts/lib/devtool/standard.py      | 34 ++++++++--------------------------
 scripts/lib/recipetool/create.py     | 21 +--------------------
 scripts/lib/recipetool/create_npm.py | 27 +++++++++++++++++++++++++--
 4 files changed, 34 insertions(+), 79 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 29c4c05..bba0721 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -261,34 +261,3 @@ def get_bbclassextend_targets(recipefile, pn):
                 targets.append('%s-%s' % (pn, variant))
     return targets
 
-def ensure_npm(config, basepath, fixed_setup=False, check_exists=True):
-    """
-    Ensure that npm is available and either build it or show a
-    reasonable error message
-    """
-    if check_exists:
-        tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
-        try:
-            rd = tinfoil.parse_recipe('nodejs-native')
-            nativepath = rd.getVar('STAGING_BINDIR_NATIVE')
-        finally:
-            tinfoil.shutdown()
-        npmpath = os.path.join(nativepath, 'npm')
-        build_npm = not os.path.exists(npmpath)
-    else:
-        build_npm = True
-
-    if build_npm:
-        logger.info('Building nodejs-native')
-        try:
-            exec_build_env_command(config.init_path, basepath,
-                                'bitbake -q nodejs-native -c addto_recipe_sysroot', watch=True)
-        except bb.process.ExecutionError as e:
-            if "Nothing PROVIDES 'nodejs-native'" in e.stdout:
-                if fixed_setup:
-                    msg = 'nodejs-native is required for npm but is not available within this SDK'
-                else:
-                    msg = 'nodejs-native is required for npm but is not available - you will likely need to add a layer that provides nodejs'
-                raise DevtoolError(msg)
-            else:
-                raise
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 0104e67..54558ce 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -30,7 +30,7 @@ import errno
 import glob
 import filecmp
 from collections import OrderedDict
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, ensure_npm, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -128,9 +128,6 @@ def add(args, config, basepath, workspace):
         color = args.color
     extracmdopts = ''
     if args.fetchuri:
-        if args.fetchuri.startswith('npm://'):
-            ensure_npm(config, basepath, args.fixed_setup)
-
         source = args.fetchuri
         if srctree:
             extracmdopts += ' -x %s' % srctree
@@ -155,28 +152,13 @@ def add(args, config, basepath, workspace):
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
-        builtnpm = False
-        while True:
-            try:
-                stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create --devtool -o %s \'%s\' %s' % (color, tempdir, source, extracmdopts), watch=True)
-            except bb.process.ExecutionError as e:
-                if e.exitcode == 14:
-                    if builtnpm:
-                        raise DevtoolError('Re-running recipetool still failed to find npm')
-                    # FIXME this is a horrible hack that is unfortunately
-                    # necessary due to the fact that we can't run bitbake from
-                    # inside recipetool since recipetool keeps tinfoil active
-                    # with references to it throughout the code, so we have
-                    # to exit out and come back here to do it.
-                    ensure_npm(config, basepath, args.fixed_setup, check_exists=False)
-                    logger.info('Re-running recipe creation process after building nodejs')
-                    builtnpm = True
-                    continue
-                elif e.exitcode == 15:
-                    raise DevtoolError('Could not auto-determine recipe name, please specify it on the command line')
-                else:
-                    raise DevtoolError('Command \'%s\' failed' % e.command)
-            break
+        try:
+            stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create --devtool -o %s \'%s\' %s' % (color, tempdir, source, extracmdopts), watch=True)
+        except bb.process.ExecutionError as e:
+            if e.exitcode == 15:
+                raise DevtoolError('Could not auto-determine recipe name, please specify it on the command line')
+            else:
+                raise DevtoolError('Command \'%s\' failed' % e.command)
 
         recipes = glob.glob(os.path.join(tempdir, '*.bb'))
         if recipes:
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 2a6a28b..359eb9a 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1152,22 +1152,6 @@ def convert_rpm_xml(xmlfile):
     return values
 
 
-def check_npm(tinfoil, debugonly=False):
-    try:
-        rd = tinfoil.parse_recipe('nodejs-native')
-    except bb.providers.NoProvider:
-        # We still conditionally show the message and exit with the special
-        # return code, otherwise we can't show the proper message for eSDK
-        # users
-        log_error_cond('nodejs-native is required for npm but is not available - you will likely need to add a layer that provides nodejs', debugonly)
-        sys.exit(14)
-    bindir = rd.getVar('STAGING_BINDIR_NATIVE')
-    npmpath = os.path.join(bindir, 'npm')
-    if not os.path.exists(npmpath):
-        log_error_cond('npm required to process specified source, but npm is not available - you need to run bitbake -c addto_recipe_sysroot nodejs-native first', debugonly)
-        sys.exit(14)
-    return bindir
-
 def register_commands(subparsers):
     parser_create = subparsers.add_parser('create',
                                           help='Create a new recipe',
@@ -1185,8 +1169,5 @@ def register_commands(subparsers):
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.add_argument('--fetch-dev', action="store_true", help='For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
-    # FIXME I really hate having to set parserecipes for this, but given we may need
-    # to call into npm (and we don't know in advance if we will or not) and in order
-    # to do so we need to know npm's recipe sysroot path, there's not much alternative
-    parser_create.set_defaults(func=create_recipe, parserecipes=True)
+    parser_create.set_defaults(func=create_recipe)
 
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index ba7e39a..885d543 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -21,7 +21,7 @@ import subprocess
 import tempfile
 import shutil
 import json
-from recipetool.create import RecipeHandler, split_pkg_licenses, handle_license_vars, check_npm
+from recipetool.create import RecipeHandler, split_pkg_licenses, handle_license_vars
 
 logger = logging.getLogger('recipetool')
 
@@ -36,6 +36,27 @@ def tinfoil_init(instance):
 class NpmRecipeHandler(RecipeHandler):
     lockdownpath = None
 
+    def _ensure_npm(self, fixed_setup=False):
+        if not tinfoil.recipes_parsed:
+            tinfoil.parse_recipes()
+        try:
+            rd = tinfoil.parse_recipe('nodejs-native')
+        except bb.providers.NoProvider:
+            if fixed_setup:
+                msg = 'nodejs-native is required for npm but is not available within this SDK'
+            else:
+                msg = 'nodejs-native is required for npm but is not available - you will likely need to add a layer that provides nodejs'
+            logger.error(msg)
+            return None
+        bindir = rd.getVar('STAGING_BINDIR_NATIVE')
+        npmpath = os.path.join(bindir, 'npm')
+        if not os.path.exists(npmpath):
+            tinfoil.build_targets('nodejs-native', 'addto_recipe_sysroot')
+            if not os.path.exists(npmpath):
+                logger.error('npm required to process specified source, but nodejs-native did not seem to populate it')
+                return None
+        return bindir
+
     def _handle_license(self, data):
         '''
         Handle the license value from an npm package.json file
@@ -189,7 +210,9 @@ class NpmRecipeHandler(RecipeHandler):
         files = RecipeHandler.checkfiles(srctree, ['package.json'])
         if files:
             d = bb.data.createCopy(tinfoil.config_data)
-            npm_bindir = check_npm(tinfoil, self._devtool)
+            npm_bindir = self._ensure_npm()
+            if not npm_bindir:
+                sys.exit(14)
             d.prependVar('PATH', '%s:' % npm_bindir)
 
             data = read_package_json(files[0])
-- 
2.9.4


