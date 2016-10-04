Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CDE1E60770
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 09:31:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 04 Oct 2016 02:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,442,1473145200"; d="scan'208";a="768675564"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.185.151])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2016 02:31:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 22:31:16 +1300
Message-Id: <7ac94d04d8619f880fb2b4654594637ae6685dc0.1475573453.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1475573453.git.paul.eggleton@linux.intel.com>
References: <cover.1475573453.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1475573453.git.paul.eggleton@linux.intel.com>
References: <cover.1475573453.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] devtool: add: build nodejs-native if npm is needed and not available
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
X-List-Received-Date: Tue, 04 Oct 2016 09:31:49 -0000

If the user runs devtool add on an npm:// URL (or source tree that uses
node.js), and npm is not available, just build nodejs-native instead of
telling the user they need to do it; if that fails because there isn't
any such recipe (which would be the default, since it's not in OE-Core)
then produce a slightly more readable error message hinting at what the
user needs to do.

Note that this forces the use of nodejs-native rather than npm on the
host - this makes sense for two reasons: (1) we need it to be compatible
with nodejs for the target, and (2) we have to have a recipe for that
anyway, so allowing you to avoid having a recipe for the native version
isn't really beneficial.

There's a bit of a hack in here in order to allow this - for node.js
sources that aren't fetched via npm we don't know that they are that
until we've fetched and unpacked them, by which time we're inside
recipetool and have an active tinfoil instance that will prevent bitbake
being run. To avoid this being an issue, we allow recipetool to get to
the point where we know we need npm and then exit with a specific exit
code, at which point devtool can try to build it and then if that
succeeds, it will re-execute recipetool. This is definitely not ideal,
but it can't really be refactored and done properly until we do the
tinfoil2 refactoring; in the mean time though we still want to be
helpful to the user.

Fixes [YOCTO #10337].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py      | 29 +++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py      | 31 ++++++++++++++++++++++---------
 scripts/lib/recipetool/create.py     | 10 ++++++----
 scripts/lib/recipetool/create_npm.py |  4 +++-
 4 files changed, 60 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index b432e3d..e675133 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -259,3 +259,32 @@ def get_bbclassextend_targets(recipefile, pn):
             elif variant in ['native', 'cross', 'crosssdk']:
                 targets.append('%s-%s' % (pn, variant))
     return targets
+
+def ensure_npm(config, basepath, fixed_setup=False):
+    """
+    Ensure that npm is available and either build it or show a
+    reasonable error message
+    """
+    tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+    try:
+        nativepath = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE', True)
+    finally:
+        tinfoil.shutdown()
+
+    npmpath = os.path.join(nativepath, 'npm')
+    if not os.path.exists(npmpath):
+        logger.info('Building nodejs-native')
+        try:
+            exec_build_env_command(config.init_path, basepath,
+                                'bitbake -q nodejs-native', watch=True)
+        except bb.process.ExecutionError as e:
+            if "Nothing PROVIDES 'nodejs-native'" in e.stdout:
+                if fixed_setup:
+                    msg = 'nodejs-native is required for npm but is not available within this SDK'
+                else:
+                    msg = 'nodejs-native is required for npm but is not available - you will likely need to add a layer that provides nodejs'
+                raise DevtoolError(msg)
+            else:
+                raise
+        if not os.path.exists(npmpath):
+            raise DevtoolError('Built nodejs-native but npm binary still could not be found at %s' % npmpath)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 02ed235..4b9b173 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -30,7 +30,7 @@ import errno
 import glob
 import filecmp
 from collections import OrderedDict
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, ensure_npm, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -128,6 +128,9 @@ def add(args, config, basepath, workspace):
         color = args.color
     extracmdopts = ''
     if args.fetchuri:
+        if args.fetchuri.startswith('npm://'):
+            ensure_npm(config, basepath, args.fixed_setup)
+
         source = args.fetchuri
         if srctree:
             extracmdopts += ' -x %s' % srctree
@@ -150,13 +153,23 @@ def add(args, config, basepath, workspace):
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
-        try:
-            stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, tempdir, source, extracmdopts))
-        except bb.process.ExecutionError as e:
-            if e.exitcode == 15:
-                raise DevtoolError('Could not auto-determine recipe name, please specify it on the command line')
-            else:
-                raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+        while True:
+            try:
+                stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, tempdir, source, extracmdopts))
+            except bb.process.ExecutionError as e:
+                if e.exitcode == 14:
+                    # FIXME this is a horrible hack that is unfortunately
+                    # necessary due to the fact that we can't run bitbake from
+                    # inside recipetool since recipetool keeps tinfoil active
+                    # with references to it throughout the code, so we have
+                    # to exit out and come back here to do it.
+                    ensure_npm(config, basepath, args.fixed_setup)
+                    continue
+                elif e.exitcode == 15:
+                    raise DevtoolError('Could not auto-determine recipe name, please specify it on the command line')
+                else:
+                    raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+            break
 
         recipes = glob.glob(os.path.join(tempdir, '*.bb'))
         if recipes:
@@ -1567,7 +1580,7 @@ def register_commands(subparsers, context):
     parser_add.add_argument('--binary', '-b', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure). Useful with binary packages e.g. RPMs.', action='store_true')
     parser_add.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_add.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
-    parser_add.set_defaults(func=add)
+    parser_add.set_defaults(func=add, fixed_setup=context.fixed_setup)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
                                        description='Sets up the build environment to modify the source for an existing recipe. The default behaviour is to extract the source being fetched by the recipe into a git tree so you can work on it; alternatively if you already have your own pre-prepared source tree you can specify -n/--no-extract.',
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 9b31fe9..d427d32 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -406,10 +406,7 @@ def create_recipe(args):
         srctree = tempsrc
         if fetchuri.startswith('npm://'):
             # Check if npm is available
-            npm = bb.utils.which(tinfoil.config_data.getVar('PATH', True), 'npm')
-            if not npm:
-                logger.error('npm:// URL requested but npm is not available - you need to either build nodejs-native or install npm using your package manager')
-                sys.exit(1)
+            check_npm(tinfoil.config_data)
         logger.info('Fetching %s...' % srcuri)
         try:
             checksums = scriptutils.fetch_uri(tinfoil.config_data, fetchuri, srctree, srcrev)
@@ -1076,6 +1073,11 @@ def convert_rpm_xml(xmlfile):
     return values
 
 
+def check_npm(d):
+    if not os.path.exists(os.path.join(d.getVar('STAGING_BINDIR_NATIVE', True), 'npm')):
+        logger.error('npm required to process specified source, but npm is not available - you need to build nodejs-native first')
+        sys.exit(14)
+
 def register_commands(subparsers):
     parser_create = subparsers.add_parser('create',
                                           help='Create a new recipe',
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index e794614..7bb844c 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -21,7 +21,7 @@ import subprocess
 import tempfile
 import shutil
 import json
-from recipetool.create import RecipeHandler, split_pkg_licenses, handle_license_vars
+from recipetool.create import RecipeHandler, split_pkg_licenses, handle_license_vars, check_npm
 
 logger = logging.getLogger('recipetool')
 
@@ -157,6 +157,8 @@ class NpmRecipeHandler(RecipeHandler):
 
         files = RecipeHandler.checkfiles(srctree, ['package.json'])
         if files:
+            check_npm(tinfoil.config_data)
+
             data = read_package_json(files[0])
             if 'name' in data and 'version' in data:
                 extravalues['PN'] = data['name']
-- 
2.5.5


