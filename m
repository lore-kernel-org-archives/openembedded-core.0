Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CD80777C3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 10:41:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 03:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,190,1488873600"; d="scan'208";a="247654577"
Received: from lheah-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.133.64])
	by fmsmga004.fm.intel.com with ESMTP; 12 Apr 2017 03:41:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 22:41:27 +1200
Message-Id: <bd0a34066dc5009024ed3c37bc7c5e3407c0babc.1491993601.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491993601.git.paul.eggleton@linux.intel.com>
References: <cover.1491993601.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] devtool: add: fix node.js/npm handling with recipe specific sysroots
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
X-List-Received-Date: Wed, 12 Apr 2017 10:41:38 -0000

The change over to recipe specific sysroots means that we can no longer
get a known location simply from configuration for the npm binary - we
need to get the recipe sysroot for nodejs-native, look there for npm if
we need to check it's present, and add that to PATH when calling out to
npm. Unfortunately this means anywhere we need to get that path we have
to have parsed all recipes, otherwise we have no reliable way of
resolving nodejs-native. Thus we have to change recipetool create to
always parse all recipes (the structure of the code does not allow us to
do this conditionally).

In the worst case, if npm hasn't already been added to its own sysroot
and we are fetching from a source repository rather than an npm
registry, this gets a bit ugly because we end up parsing recipes three
times:
1) recipetool startup, which then fetches the code and determines it's
   a node.js module, finds that npm isn't available and then exits with
   a specific error to tell devtool it needs to build npm
2) when we invoke bitbake -c addto_recipe_sysroot nodejs-native
3) when we re-invoke recipetool

This code is badly in need of refactoring, but now is unfortunately not
the time to do that, so we're going to have to live with this ugliness
for now.

Fixes [YOCTO #10992].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py      | 25 ++++++++++++++-----------
 scripts/lib/devtool/standard.py      |  2 +-
 scripts/lib/recipetool/create.py     | 28 ++++++++++++++++++++++------
 scripts/lib/recipetool/create_npm.py | 20 +++++++++++---------
 4 files changed, 48 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 8c385be..d646b0c 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -261,23 +261,28 @@ def get_bbclassextend_targets(recipefile, pn):
                 targets.append('%s-%s' % (pn, variant))
     return targets
 
-def ensure_npm(config, basepath, fixed_setup=False):
+def ensure_npm(config, basepath, fixed_setup=False, check_exists=True):
     """
     Ensure that npm is available and either build it or show a
     reasonable error message
     """
-    tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
-    try:
-        nativepath = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE')
-    finally:
-        tinfoil.shutdown()
+    if check_exists:
+        tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+        try:
+            rd = tinfoil.parse_recipe('nodejs-native')
+            nativepath = rd.getVar('STAGING_BINDIR_NATIVE')
+        finally:
+            tinfoil.shutdown()
+        npmpath = os.path.join(nativepath, 'npm')
+        build_npm = not os.path.exists(npmpath)
+    else:
+        build_npm = True
 
-    npmpath = os.path.join(nativepath, 'npm')
-    if not os.path.exists(npmpath):
+    if build_npm:
         logger.info('Building nodejs-native')
         try:
             exec_build_env_command(config.init_path, basepath,
-                                'bitbake -q nodejs-native', watch=True)
+                                'bitbake -q nodejs-native -c addto_recipe_sysroot', watch=True)
         except bb.process.ExecutionError as e:
             if "Nothing PROVIDES 'nodejs-native'" in e.stdout:
                 if fixed_setup:
@@ -287,5 +292,3 @@ def ensure_npm(config, basepath, fixed_setup=False):
                 raise DevtoolError(msg)
             else:
                 raise
-        if not os.path.exists(npmpath):
-            raise DevtoolError('Built nodejs-native but npm binary still could not be found at %s' % npmpath)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ffca2c9..73e629c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -165,7 +165,7 @@ def add(args, config, basepath, workspace):
                     # inside recipetool since recipetool keeps tinfoil active
                     # with references to it throughout the code, so we have
                     # to exit out and come back here to do it.
-                    ensure_npm(config, basepath, args.fixed_setup)
+                    ensure_npm(config, basepath, args.fixed_setup, check_exists=False)
                     logger.info('Re-running recipe creation process after building nodejs')
                     continue
                 elif e.exitcode == 15:
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 648f2d6..439dca0 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -416,12 +416,14 @@ def create_recipe(args):
             srcuri = rev_re.sub('', srcuri)
         tempsrc = tempfile.mkdtemp(prefix='recipetool-')
         srctree = tempsrc
+        d = bb.data.createCopy(tinfoil.config_data)
         if fetchuri.startswith('npm://'):
             # Check if npm is available
-            check_npm(tinfoil.config_data, args.devtool)
+            npm_bindir = check_npm(tinfoil, args.devtool)
+            d.prependVar('PATH', '%s:' % npm_bindir)
         logger.info('Fetching %s...' % srcuri)
         try:
-            checksums = scriptutils.fetch_uri(tinfoil.config_data, fetchuri, srctree, srcrev)
+            checksums = scriptutils.fetch_uri(d, fetchuri, srctree, srcrev)
         except bb.fetch2.BBFetchException as e:
             logger.error(str(e).rstrip())
             sys.exit(1)
@@ -1119,10 +1121,21 @@ def convert_rpm_xml(xmlfile):
     return values
 
 
-def check_npm(d, debugonly=False):
-    if not os.path.exists(os.path.join(d.getVar('STAGING_BINDIR_NATIVE'), 'npm')):
-        log_error_cond('npm required to process specified source, but npm is not available - you need to build nodejs-native first', debugonly)
+def check_npm(tinfoil, debugonly=False):
+    try:
+        rd = tinfoil.parse_recipe('nodejs-native')
+    except bb.providers.NoProvider:
+        # We still conditionally show the message and exit with the special
+        # return code, otherwise we can't show the proper message for eSDK
+        # users
+        log_error_cond('nodejs-native is required for npm but is not available - you will likely need to add a layer that provides nodejs', debugonly)
+        sys.exit(14)
+    bindir = rd.getVar('STAGING_BINDIR_NATIVE')
+    npmpath = os.path.join(bindir, 'npm')
+    if not os.path.exists(npmpath):
+        log_error_cond('npm required to process specified source, but npm is not available - you need to run bitbake -c addto_recipe_sysroot nodejs-native first', debugonly)
         sys.exit(14)
+    return bindir
 
 def register_commands(subparsers):
     parser_create = subparsers.add_parser('create',
@@ -1141,5 +1154,8 @@ def register_commands(subparsers):
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.add_argument('--fetch-dev', action="store_true", help='For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
-    parser_create.set_defaults(func=create_recipe)
+    # FIXME I really hate having to set parserecipes for this, but given we may need
+    # to call into npm (and we don't know in advance if we will or not) and in order
+    # to do so we need to know npm's recipe sysroot path, there's not much alternative
+    parser_create.set_defaults(func=create_recipe, parserecipes=True)
 
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index eb19555..a79a9afb 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -65,9 +65,9 @@ class NpmRecipeHandler(RecipeHandler):
                                           'SEE-LICENSE-IN-EULA')
         return license
 
-    def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_before):
+    def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_before, d):
         try:
-            runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH'))
+            runenv = dict(os.environ, PATH=d.getVar('PATH'))
             bb.process.run('npm shrinkwrap', cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
         except bb.process.ExecutionError as e:
             logger.warn('npm shrinkwrap failed:\n%s' % e.stdout)
@@ -79,8 +79,8 @@ class NpmRecipeHandler(RecipeHandler):
         extravalues['extrafiles']['npm-shrinkwrap.json'] = tmpfile
         lines_before.append('NPM_SHRINKWRAP := "${THISDIR}/${PN}/npm-shrinkwrap.json"')
 
-    def _lockdown(self, srctree, localfilesdir, extravalues, lines_before):
-        runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH'))
+    def _lockdown(self, srctree, localfilesdir, extravalues, lines_before, d):
+        runenv = dict(os.environ, PATH=d.getVar('PATH'))
         if not NpmRecipeHandler.lockdownpath:
             NpmRecipeHandler.lockdownpath = tempfile.mkdtemp('recipetool-npm-lockdown')
             bb.process.run('npm install lockdown --prefix %s' % NpmRecipeHandler.lockdownpath,
@@ -188,7 +188,9 @@ class NpmRecipeHandler(RecipeHandler):
 
         files = RecipeHandler.checkfiles(srctree, ['package.json'])
         if files:
-            check_npm(tinfoil.config_data)
+            d = bb.data.createCopy(tinfoil.config_data)
+            npm_bindir = check_npm(tinfoil)
+            d.prependVar('PATH', '%s:' % npm_bindir)
 
             data = read_package_json(files[0])
             if 'name' in data and 'version' in data:
@@ -203,17 +205,17 @@ class NpmRecipeHandler(RecipeHandler):
 
                 fetchdev = extravalues['fetchdev'] or None
                 deps, optdeps, devdeps = self.get_npm_package_dependencies(data, fetchdev)
-                updated = self._handle_dependencies(tinfoil.config_data, deps, optdeps, devdeps, lines_before, srctree)
+                updated = self._handle_dependencies(d, deps, optdeps, devdeps, lines_before, srctree)
                 if updated:
                     # We need to redo the license stuff
-                    self._replace_license_vars(srctree, lines_before, handled, extravalues, tinfoil.config_data)
+                    self._replace_license_vars(srctree, lines_before, handled, extravalues, d)
 
                 # Shrinkwrap
                 localfilesdir = tempfile.mkdtemp(prefix='recipetool-npm')
-                self._shrinkwrap(srctree, localfilesdir, extravalues, lines_before)
+                self._shrinkwrap(srctree, localfilesdir, extravalues, lines_before, d)
 
                 # Lockdown
-                self._lockdown(srctree, localfilesdir, extravalues, lines_before)
+                self._lockdown(srctree, localfilesdir, extravalues, lines_before, d)
 
                 # Split each npm module out to is own package
                 npmpackages = oe.package.npm_split_package_dirs(srctree)
-- 
2.9.3


