Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0954B78231
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 10:07:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 03:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,380,1496127600"; d="scan'208";a="994656323"
Received: from gsena-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.48.213])
	by orsmga003.jf.intel.com with ESMTP; 19 Jul 2017 03:07:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 12:07:15 +0200
Message-Id: <42729abf6197e994877c6e124b1f69930f7531e7.1500458777.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1500458777.git.paul.eggleton@linux.intel.com>
References: <cover.1500458777.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] recipetool: create: refactor code for ensuring npm is available
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
X-List-Received-Date: Wed, 19 Jul 2017 10:07:32 -0000

Across devtool and recipetool we had an ugly set of code for ensuring
that we can call an npm binary, and much of that ugliness was a result
of not being able to run build tasks when tinfoil was active - if
recipetool found that npm was required and we didn't know beforehand
(e.g. we're fetching from a plain git repository as opposed to an npm://
URL where it's obvious) then it had to exit and return a special result
code, so that devtool knew it needed to build nodejs-native and then
call recipetool again. Tinfoil now allows us to run build tasks
directly, so we can take advantage of that instead and throw away the
ugly code at the same time.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py      | 31 ------------------------------
 scripts/lib/devtool/standard.py      | 36 ++++++++++++-----------------------
 scripts/lib/recipetool/create.py     | 26 +++++--------------------
 scripts/lib/recipetool/create_npm.py |  7 +++++--
 scripts/lib/recipetool/utils.py      | 37 ++++++++++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+), 78 deletions(-)
 create mode 100644 scripts/lib/recipetool/utils.py

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
index 7e342e7..008cfa3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -30,8 +30,9 @@ import errno
 import glob
 import filecmp
 from collections import OrderedDict
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, ensure_npm, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, DevtoolError
 from devtool import parse_recipe
+from recipetool.utils import ensure_npm
 
 logger = logging.getLogger('devtool')
 
@@ -129,7 +130,9 @@ def add(args, config, basepath, workspace):
     extracmdopts = ''
     if args.fetchuri:
         if args.fetchuri.startswith('npm://'):
-            ensure_npm(config, basepath, args.fixed_setup)
+            with setup_tinfoil(config_only=True, basepath=basepath) as tinfoil:
+                if not ensure_npm(tinfoil, args.fixed_setup):
+                    raise DevtoolError('npm required but not available')
 
         source = args.fetchuri
         if srctree:
@@ -155,28 +158,13 @@ def add(args, config, basepath, workspace):
 
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
index 8e63580..868d18b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -25,6 +25,7 @@ import json
 import logging
 import scriptutils
 from urllib.parse import urlparse, urldefrag, urlsplit
+from recipetool.utils import ensure_npm
 import hashlib
 import bb.fetch2
 logger = logging.getLogger('recipetool')
@@ -444,7 +445,9 @@ def create_recipe(args):
         d = bb.data.createCopy(tinfoil.config_data)
         if fetchuri.startswith('npm://'):
             # Check if npm is available
-            npm_bindir = check_npm(tinfoil, args.devtool)
+            npm_bindir = ensure_npm(tinfoil)
+            if not npm_bindir:
+                sys.exit(14)
             d.prependVar('PATH', '%s:' % npm_bindir)
         logger.info('Fetching %s...' % srcuri)
         try:
@@ -1147,22 +1150,6 @@ def convert_rpm_xml(xmlfile):
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
@@ -1180,8 +1167,5 @@ def register_commands(subparsers):
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.add_argument('--fetch-dev', action="store_true", help='For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
-    # FIXME I really hate having to set parserecipes for this, but given we may need
-    # to call into npm (and we don't know in advance if we will or not) and in order
-    # to do so we need to know npm's recipe sysroot path, there's not much alternative
-    parser_create.set_defaults(func=create_recipe, parserecipes=True)
+    parser_create.set_defaults(func=create_recipe)
 
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index cb8f338..6c515e3 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -21,7 +21,8 @@ import subprocess
 import tempfile
 import shutil
 import json
-from recipetool.create import RecipeHandler, split_pkg_licenses, handle_license_vars, check_npm
+from recipetool.create import RecipeHandler, split_pkg_licenses, handle_license_vars
+from recipetool.utils import ensure_npm
 
 logger = logging.getLogger('recipetool')
 
@@ -189,7 +190,9 @@ class NpmRecipeHandler(RecipeHandler):
         files = RecipeHandler.checkfiles(srctree, ['package.json'])
         if files:
             d = bb.data.createCopy(tinfoil.config_data)
-            npm_bindir = check_npm(tinfoil, self._devtool)
+            npm_bindir = ensure_npm(tinfoil)
+            if not npm_bindir:
+                sys.exit(14)
             d.prependVar('PATH', '%s:' % npm_bindir)
 
             data = read_package_json(files[0])
diff --git a/scripts/lib/recipetool/utils.py b/scripts/lib/recipetool/utils.py
new file mode 100644
index 0000000..63f6583
--- /dev/null
+++ b/scripts/lib/recipetool/utils.py
@@ -0,0 +1,37 @@
+# Recipe creation tool - utility functions
+#
+# Copyright (C) 2016-2017 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+def ensure_npm(tinfoil, fixed_setup=False):
+    if not tinfoil.recipes_parsed:
+        tinfoil.parse_recipes()
+    try:
+        rd = tinfoil.parse_recipe('nodejs-native')
+    except bb.providers.NoProvider:
+        if fixed_setup:
+            msg = 'nodejs-native is required for npm but is not available within this SDK'
+        else:
+            msg = 'nodejs-native is required for npm but is not available - you will likely need to add a layer that provides nodejs'
+        logger.error(msg)
+        return None
+    bindir = rd.getVar('STAGING_BINDIR_NATIVE')
+    npmpath = os.path.join(bindir, 'npm')
+    if not os.path.exists(npmpath):
+        tinfoil.build_targets('nodejs-native', 'addto_recipe_sysroot')
+        if not os.path.exists(npmpath):
+            logger.error('npm required to process specified source, but nodejs-native did not seem to populate it')
+            return None
+    return bindir
-- 
2.9.4


