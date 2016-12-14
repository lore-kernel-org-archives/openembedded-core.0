Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 923C57320F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 21:13:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 14 Dec 2016 13:13:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,348,1477983600"; d="scan'208";a="18188734"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.22.2])
	by orsmga002.jf.intel.com with ESMTP; 14 Dec 2016 13:13:47 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 21:13:05 +0000
Message-Id: <7363f30280a6f3cff6579a630fe29f986c471e4d.1481749746.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1481749746.git.joshua.g.lock@intel.com>
References: <cover.1481749746.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/4] scripts: remove True option to getVar calls
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
X-List-Received-Date: Wed, 14 Dec 2016 21:13:47 -0000

getVar() now defaults to expanding by default, thus remove the True
option from getVar() calls with a regex search and replace.

Search made with the following regex: getVar ?\(( ?[^,()]*), True\)

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/contrib/list-packageconfig-flags.py      |  6 +--
 scripts/contrib/verify-homepage.py               |  2 +-
 scripts/devtool                                  |  2 +-
 scripts/lib/devtool/__init__.py                  |  8 ++--
 scripts/lib/devtool/build_image.py               | 10 ++--
 scripts/lib/devtool/deploy.py                    |  2 +-
 scripts/lib/devtool/package.py                   |  2 +-
 scripts/lib/devtool/runqemu.py                   |  4 +-
 scripts/lib/devtool/sdk.py                       |  8 ++--
 scripts/lib/devtool/search.py                    |  4 +-
 scripts/lib/devtool/standard.py                  | 58 ++++++++++++------------
 scripts/lib/devtool/upgrade.py                   | 20 ++++----
 scripts/lib/devtool/utilcmds.py                  | 18 ++++----
 scripts/lib/recipetool/append.py                 | 22 ++++-----
 scripts/lib/recipetool/create.py                 | 24 +++++-----
 scripts/lib/recipetool/create_buildsys_python.py |  4 +-
 scripts/lib/recipetool/create_kernel.py          |  4 +-
 scripts/lib/recipetool/create_npm.py             |  6 +--
 scripts/lib/recipetool/newappend.py              |  2 +-
 scripts/lib/scriptutils.py                       |  2 +-
 scripts/oe-pkgdata-util                          |  2 +-
 scripts/recipetool                               |  2 +-
 22 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 389fb97..7ce7186 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -76,7 +76,7 @@ def collect_pkgs(data_dict):
     for fn in data_dict:
         pkgconfigflags = data_dict[fn].getVarFlags("PACKAGECONFIG")
         pkgconfigflags.pop('doc', None)
-        pkgname = data_dict[fn].getVar("P", True)
+        pkgname = data_dict[fn].getVar("P")
         pkg_dict[pkgname] = sorted(pkgconfigflags.keys())
 
     return pkg_dict
@@ -124,9 +124,9 @@ def display_all(data_dict):
     ''' Display all pkgs and PACKAGECONFIG information '''
     print(str("").ljust(50, '='))
     for fn in data_dict:
-        print('%s' % data_dict[fn].getVar("P", True))
+        print('%s' % data_dict[fn].getVar("P"))
         print(fn)
-        packageconfig = data_dict[fn].getVar("PACKAGECONFIG", True) or ''
+        packageconfig = data_dict[fn].getVar("PACKAGECONFIG") or ''
         if packageconfig.strip() == '':
             packageconfig = 'None'
         print('PACKAGECONFIG %s' % packageconfig)
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index d39dd1d..76f1749 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -44,7 +44,7 @@ def verifyHomepage(bbhandler):
             if realfn in checked:
                 continue
             data = bbhandler.parse_recipe_file(realfn)
-            homepage = data.getVar("HOMEPAGE", True)
+            homepage = data.getVar("HOMEPAGE")
             if homepage:
                 try:
                     urllib.request.urlopen(homepage, timeout=5)
diff --git a/scripts/devtool b/scripts/devtool
index 578db5a..0866be9 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -291,7 +291,7 @@ def main():
         try:
             tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
             try:
-                global_args.bbpath = tinfoil.config_data.getVar('BBPATH', True)
+                global_args.bbpath = tinfoil.config_data.getVar('BBPATH')
             finally:
                 tinfoil.shutdown()
         except bb.BBHandledException:
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 99c5534..fd2f042 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -87,13 +87,13 @@ def exec_watch(cmd, **options):
 def exec_fakeroot(d, cmd, **kwargs):
     """Run a command under fakeroot (pseudo, in fact) so that it picks up the appropriate file permissions"""
     # Grab the command and check it actually exists
-    fakerootcmd = d.getVar('FAKEROOTCMD', True)
+    fakerootcmd = d.getVar('FAKEROOTCMD')
     if not os.path.exists(fakerootcmd):
         logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
         return 2
     # Set up the appropriate environment
     newenv = dict(os.environ)
-    fakerootenv = d.getVar('FAKEROOTENV', True)
+    fakerootenv = d.getVar('FAKEROOTENV')
     for varvalue in fakerootenv.split():
         if '=' in varvalue:
             splitval = varvalue.split('=', 1)
@@ -179,7 +179,7 @@ def use_external_build(same_dir, no_same_dir, d):
         logger.info('Using source tree as build directory since --same-dir specified')
     elif bb.data.inherits_class('autotools-brokensep', d):
         logger.info('Using source tree as build directory since recipe inherits autotools-brokensep')
-    elif d.getVar('B', True) == os.path.abspath(d.getVar('S', True)):
+    elif d.getVar('B') == os.path.abspath(d.getVar('S')):
         logger.info('Using source tree as build directory since that would be the default for this recipe')
     else:
         b_is_s = False
@@ -256,7 +256,7 @@ def ensure_npm(config, basepath, fixed_setup=False):
     """
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     try:
-        nativepath = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE', True)
+        nativepath = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE')
     finally:
         tinfoil.shutdown()
 
diff --git a/scripts/lib/devtool/build_image.py b/scripts/lib/devtool/build_image.py
index ae75511..e581038 100644
--- a/scripts/lib/devtool/build_image.py
+++ b/scripts/lib/devtool/build_image.py
@@ -34,8 +34,8 @@ def _get_packages(tinfoil, workspace, config):
     result = []
     for recipe in workspace:
         data = parse_recipe(config, tinfoil, recipe, True)
-        if 'class-target' in data.getVar('OVERRIDES', True).split(':'):
-            if recipe in data.getVar('PACKAGES', True).split():
+        if 'class-target' in data.getVar('OVERRIDES').split(':'):
+            if recipe in data.getVar('PACKAGES').split():
                 result.append(recipe)
             else:
                 logger.warning("Skipping recipe %s as it doesn't produce a "
@@ -95,7 +95,7 @@ def build_image_task(config, basepath, workspace, image, add_packages=None, task
             raise TargetNotImageError()
 
         # Get the actual filename used and strip the .bb and full path
-        target_basename = rd.getVar('FILE', True)
+        target_basename = rd.getVar('FILE')
         target_basename = os.path.splitext(os.path.basename(target_basename))[0]
         config.set('SDK', 'target_basename', target_basename)
         config.write()
@@ -132,9 +132,9 @@ def build_image_task(config, basepath, workspace, image, add_packages=None, task
                             afile.write('%s\n' % line)
 
             if task in ['populate_sdk', 'populate_sdk_ext']:
-                outputdir = rd.getVar('SDK_DEPLOY', True)
+                outputdir = rd.getVar('SDK_DEPLOY')
             else:
-                outputdir = rd.getVar('DEPLOY_DIR_IMAGE', True)
+                outputdir = rd.getVar('DEPLOY_DIR_IMAGE')
 
             tmp_tinfoil = tinfoil
             tinfoil = None
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index db7dffa..9ec04e3 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -160,7 +160,7 @@ def deploy(args, config, basepath, workspace):
         except Exception as e:
             raise DevtoolError('Exception parsing recipe %s: %s' %
                             (args.recipename, e))
-        recipe_outdir = rd.getVar('D', True)
+        recipe_outdir = rd.getVar('D')
         if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
             raise DevtoolError('No files to deploy - have you built the %s '
                             'recipe? If so, the install step has not installed '
diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index 4764064..b4f4720 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -32,7 +32,7 @@ def package(args, config, basepath, workspace):
     try:
         image_pkgtype = config.get('Package', 'image_pkgtype', '')
         if not image_pkgtype:
-            image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
+            image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE')
 
         deploy_dir_pkg = tinfoil.config_data.getVar('DEPLOY_DIR_%s' % image_pkgtype.upper(), True)
     finally:
diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
index ae25cee..641664e 100644
--- a/scripts/lib/devtool/runqemu.py
+++ b/scripts/lib/devtool/runqemu.py
@@ -31,8 +31,8 @@ def runqemu(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     try:
-        machine = tinfoil.config_data.getVar('MACHINE', True)
-        bindir_native = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE', True)
+        machine = tinfoil.config_data.getVar('MACHINE')
+        bindir_native = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE')
     finally:
         tinfoil.shutdown()
 
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 922277b..f629db1 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -132,9 +132,9 @@ def sdk_update(args, config, basepath, workspace):
     # Grab variable values
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     try:
-        stamps_dir = tinfoil.config_data.getVar('STAMPS_DIR', True)
-        sstate_mirrors = tinfoil.config_data.getVar('SSTATE_MIRRORS', True)
-        site_conf_version = tinfoil.config_data.getVar('SITE_CONF_VERSION', True)
+        stamps_dir = tinfoil.config_data.getVar('STAMPS_DIR')
+        sstate_mirrors = tinfoil.config_data.getVar('SSTATE_MIRRORS')
+        site_conf_version = tinfoil.config_data.getVar('SITE_CONF_VERSION')
     finally:
         tinfoil.shutdown()
 
@@ -273,7 +273,7 @@ def sdk_install(args, config, basepath, workspace):
             rd = parse_recipe(config, tinfoil, recipe, True)
             if not rd:
                 return 1
-            stampprefixes[recipe] = '%s.%s' % (rd.getVar('STAMP', True), tasks[0])
+            stampprefixes[recipe] = '%s.%s' % (rd.getVar('STAMP'), tasks[0])
             if checkstamp(recipe):
                 logger.info('%s is already installed' % recipe)
             else:
diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index b44bed7..054985b 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -31,7 +31,7 @@ def search(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
     try:
-        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
         defsummary = tinfoil.config_data.getVar('SUMMARY', False) or ''
 
         keyword_rc = re.compile(args.keyword)
@@ -70,7 +70,7 @@ def search(args, config, basepath, workspace):
 
             if match:
                 rd = parse_recipe(config, tinfoil, fn, True)
-                summary = rd.getVar('SUMMARY', True)
+                summary = rd.getVar('SUMMARY')
                 if summary == rd.expand(defsummary):
                     summary = ''
                 print("%s  %s" % (fn.ljust(20), summary))
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c52b006..e662e3b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -303,7 +303,7 @@ def _check_compatible_recipe(pn, d):
         raise DevtoolError("The %s recipe is a meta-recipe, and therefore is "
                            "not supported by this tool" % pn, 4)
 
-    if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC', True):
+    if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC'):
         # Not an incompatibility error per se, so we don't pass the error code
         raise DevtoolError("externalsrc is currently enabled for the %s "
                            "recipe. This prevents the normal do_patch task "
@@ -439,7 +439,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
     """Extract sources of a recipe"""
     import oe.recipeutils
 
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
 
     _check_compatible_recipe(pn, d)
 
@@ -473,13 +473,13 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
         # Make a subdir so we guard against WORKDIR==S
         workdir = os.path.join(tempdir, 'workdir')
         crd.setVar('WORKDIR', workdir)
-        if not crd.getVar('S', True).startswith(workdir):
+        if not crd.getVar('S').startswith(workdir):
             # Usually a shared workdir recipe (kernel, gcc)
             # Try to set a reasonable default
             if bb.data.inherits_class('kernel', d):
                 crd.setVar('S', '${WORKDIR}/source')
             else:
-                crd.setVar('S', '${WORKDIR}/%s' % os.path.basename(d.getVar('S', True)))
+                crd.setVar('S', '${WORKDIR}/%s' % os.path.basename(d.getVar('S')))
         if bb.data.inherits_class('kernel', d):
             # We don't want to move the source to STAGING_KERNEL_DIR here
             crd.setVar('STAGING_KERNEL_DIR', '${S}')
@@ -533,7 +533,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
             # Extra step for kernel to populate the source directory
             runtask(fn, 'kernel_checkout')
 
-        srcsubdir = crd.getVar('S', True)
+        srcsubdir = crd.getVar('S')
 
         # Move local source files into separate subdir
         recipe_patches = [os.path.basename(patch) for patch in
@@ -581,7 +581,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
                            "doesn't use any source or the correct source "
                            "directory could not be determined" % pn)
 
-        setup_git_repo(srcsubdir, crd.getVar('PV', True), devbranch, d=d)
+        setup_git_repo(srcsubdir, crd.getVar('PV'), devbranch, d=d)
 
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
         initial_rev = stdout.rstrip()
@@ -596,7 +596,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
             # Store generate and store kernel config
             logger.info('Generating kernel config')
             runtask(fn, 'configure')
-            kconfig = os.path.join(crd.getVar('B', True), '.config')
+            kconfig = os.path.join(crd.getVar('B'), '.config')
 
 
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
@@ -628,7 +628,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
 
             shutil.move(srcsubdir, srctree)
 
-            if os.path.abspath(d.getVar('S', True)) == os.path.abspath(d.getVar('WORKDIR', True)):
+            if os.path.abspath(d.getVar('S')) == os.path.abspath(d.getVar('WORKDIR')):
                 # If recipe extracts to ${WORKDIR}, symlink the files into the srctree
                 # (otherwise the recipe won't build as expected)
                 local_files_dir = os.path.join(srctree, 'oe-local-files')
@@ -725,7 +725,7 @@ def modify(args, config, basepath, workspace):
         if not rd:
             return 1
 
-        pn = rd.getVar('PN', True)
+        pn = rd.getVar('PN')
         if pn != args.recipename:
             logger.info('Mapping %s to %s' % (args.recipename, pn))
         if pn in workspace:
@@ -747,7 +747,7 @@ def modify(args, config, basepath, workspace):
                 # Error already shown
                 return 1
 
-        recipefile = rd.getVar('FILE', True)
+        recipefile = rd.getVar('FILE')
         appendfile = recipe_to_append(recipefile, config, args.wildcard)
         if os.path.exists(appendfile):
             raise DevtoolError("Another variant of recipe %s is already in your "
@@ -784,8 +784,8 @@ def modify(args, config, basepath, workspace):
                     initial_rev = stdout.rstrip()
 
         # Check that recipe isn't using a shared workdir
-        s = os.path.abspath(rd.getVar('S', True))
-        workdir = os.path.abspath(rd.getVar('WORKDIR', True))
+        s = os.path.abspath(rd.getVar('S'))
+        workdir = os.path.abspath(rd.getVar('WORKDIR'))
         if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
             # Handle if S is set to a subdirectory of the source
             srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
@@ -866,17 +866,17 @@ def rename(args, config, basepath, workspace):
         if not rd:
             return 1
 
-        bp = rd.getVar('BP', True)
-        bpn = rd.getVar('BPN', True)
+        bp = rd.getVar('BP')
+        bpn = rd.getVar('BPN')
         if newname != args.recipename:
             localdata = rd.createCopy()
             localdata.setVar('PN', newname)
-            newbpn = localdata.getVar('BPN', True)
+            newbpn = localdata.getVar('BPN')
         else:
             newbpn = bpn
         s = rd.getVar('S', False)
         src_uri = rd.getVar('SRC_URI', False)
-        pv = rd.getVar('PV', True)
+        pv = rd.getVar('PV')
 
         # Correct variable values that refer to the upstream source - these
         # values must stay the same, so if the name/version are changing then
@@ -1277,8 +1277,8 @@ def _export_local_files(srctree, rd, destdir):
             elif fname != '.gitignore':
                 added[fname] = None
 
-        workdir = rd.getVar('WORKDIR', True)
-        s = rd.getVar('S', True)
+        workdir = rd.getVar('WORKDIR')
+        s = rd.getVar('S')
         if not s.endswith(os.sep):
             s += os.sep
 
@@ -1300,14 +1300,14 @@ def _export_local_files(srctree, rd, destdir):
 
 def _determine_files_dir(rd):
     """Determine the appropriate files directory for a recipe"""
-    recipedir = rd.getVar('FILE_DIRNAME', True)
-    for entry in rd.getVar('FILESPATH', True).split(':'):
+    recipedir = rd.getVar('FILE_DIRNAME')
+    for entry in rd.getVar('FILESPATH').split(':'):
         relpth = os.path.relpath(entry, recipedir)
         if not os.sep in relpth:
             # One (or zero) levels below only, so we don't put anything in machine-specific directories
             if os.path.isdir(entry):
                 return entry
-    return os.path.join(recipedir, rd.getVar('BPN', True))
+    return os.path.join(recipedir, rd.getVar('BPN'))
 
 
 def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remove):
@@ -1315,7 +1315,7 @@ def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remo
     import bb
     import oe.recipeutils
 
-    recipefile = rd.getVar('FILE', True)
+    recipefile = rd.getVar('FILE')
     logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipefile))
 
     # Get HEAD revision
@@ -1397,7 +1397,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     import bb
     import oe.recipeutils
 
-    recipefile = rd.getVar('FILE', True)
+    recipefile = rd.getVar('FILE')
     append = workspace[recipename]['bbappend']
     if not os.path.exists(append):
         raise DevtoolError('unable to find workspace bbappend for recipe %s' %
@@ -1408,7 +1408,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
 
-    dl_dir = rd.getVar('DL_DIR', True)
+    dl_dir = rd.getVar('DL_DIR')
     if not dl_dir.endswith('/'):
         dl_dir += '/'
 
@@ -1567,7 +1567,7 @@ def update_recipe(args, config, basepath, workspace):
         updated = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev)
 
         if updated:
-            rf = rd.getVar('FILE', True)
+            rf = rd.getVar('FILE')
             if rf.startswith(config.workspace_path):
                 logger.warn('Recipe file %s has been updated but is inside the workspace - you will need to move it (and any associated files next to it) out to the desired layer before using "devtool reset" in order to keep any changes' % rf)
     finally:
@@ -1671,7 +1671,7 @@ def reset(args, config, basepath, workspace):
 
 def _get_layer(layername, d):
     """Determine the base layer path for the specified layer name/path"""
-    layerdirs = d.getVar('BBLAYERS', True).split()
+    layerdirs = d.getVar('BBLAYERS').split()
     layers = {os.path.basename(p): p for p in layerdirs}
     # Provide some shortcuts
     if layername.lower() in ['oe-core', 'openembedded-core']:
@@ -1697,7 +1697,7 @@ def finish(args, config, basepath, workspace):
             return 1
 
         destlayerdir = _get_layer(args.destination, tinfoil.config_data)
-        origlayerdir = oe.recipeutils.find_layerdir(rd.getVar('FILE', True))
+        origlayerdir = oe.recipeutils.find_layerdir(rd.getVar('FILE'))
 
         if not os.path.isdir(destlayerdir):
             raise DevtoolError('Unable to find layer or directory matching "%s"' % args.destination)
@@ -1728,7 +1728,7 @@ def finish(args, config, basepath, workspace):
             if not destpath:
                 raise DevtoolError("Unable to determine destination layer path - check that %s specifies an actual layer and %s/conf/layer.conf specifies BBFILES. You may also need to specify a more complete path." % (args.destination, destlayerdir))
             # Warn if the layer isn't in bblayers.conf (the code to create a bbappend will do this in other cases)
-            layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS', True).split()]
+            layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS').split()]
             if not os.path.abspath(destlayerdir) in layerdirs:
                 bb.warn('Specified destination layer is not currently enabled in bblayers.conf, so the %s recipe will now be unavailable in your current configuration until you add the layer there' % args.recipename)
 
@@ -1758,7 +1758,7 @@ def finish(args, config, basepath, workspace):
             # associated files to the specified layer
             no_clean = True
             logger.info('Moving recipe file to %s' % destpath)
-            recipedir = os.path.dirname(rd.getVar('FILE', True))
+            recipedir = os.path.dirname(rd.getVar('FILE'))
             for root, _, files in os.walk(recipedir):
                 for fn in files:
                     srcpath = os.path.join(root, fn)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index d89e9a2..9595f3e 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -68,7 +68,7 @@ def _remove_patch_dirs(recipefolder):
             shutil.rmtree(os.path.join(root,d))
 
 def _recipe_contains(rd, var):
-    rf = rd.getVar('FILE', True)
+    rf = rd.getVar('FILE')
     varfiles = oe.recipeutils.get_var_files(rf, [var], rd)
     for var, fn in varfiles.items():
         if fn and fn.startswith(os.path.dirname(rf) + os.sep):
@@ -132,7 +132,7 @@ def _write_append(rc, srctree, same_dir, no_same_dir, rev, copied, workspace, d)
         if rev:
             f.write('# initial_rev: %s\n' % rev)
         if copied:
-            f.write('# original_path: %s\n' % os.path.dirname(d.getVar('FILE', True)))
+            f.write('# original_path: %s\n' % os.path.dirname(d.getVar('FILE')))
             f.write('# original_files: %s\n' % ' '.join(copied))
     return af
 
@@ -154,7 +154,7 @@ def _upgrade_error(e, rf, srctree):
     raise DevtoolError(e)
 
 def _get_uri(rd):
-    srcuris = rd.getVar('SRC_URI', True).split()
+    srcuris = rd.getVar('SRC_URI').split()
     if not len(srcuris):
         raise DevtoolError('SRC_URI not found on recipe')
     # Get first non-local entry in SRC_URI - usually by convention it's
@@ -185,7 +185,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
 
     crd = rd.createCopy()
 
-    pv = crd.getVar('PV', True)
+    pv = crd.getVar('PV')
     crd.setVar('PV', newpv)
 
     tmpsrctree = None
@@ -270,15 +270,15 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
 def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil, rd):
     """Creates the new recipe under workspace"""
 
-    bpn = rd.getVar('BPN', True)
+    bpn = rd.getVar('BPN')
     path = os.path.join(workspace, 'recipes', bpn)
     bb.utils.mkdirhier(path)
     copied, _ = oe.recipeutils.copy_recipe_files(rd, path)
 
-    oldpv = rd.getVar('PV', True)
+    oldpv = rd.getVar('PV')
     if not newpv:
         newpv = oldpv
-    origpath = rd.getVar('FILE', True)
+    origpath = rd.getVar('FILE')
     fullpath = _rename_recipe_files(origpath, bpn, oldpv, newpv, path)
     logger.debug('Upgraded %s => %s' % (origpath, fullpath))
 
@@ -341,7 +341,7 @@ def upgrade(args, config, basepath, workspace):
         if not rd:
             return 1
 
-        pn = rd.getVar('PN', True)
+        pn = rd.getVar('PN')
         if pn != args.recipename:
             logger.info('Mapping %s to %s' % (args.recipename, pn))
         if pn in workspace:
@@ -353,12 +353,12 @@ def upgrade(args, config, basepath, workspace):
             srctree = standard.get_default_srctree(config, pn)
 
         standard._check_compatible_recipe(pn, rd)
-        old_srcrev = rd.getVar('SRCREV', True)
+        old_srcrev = rd.getVar('SRCREV')
         if old_srcrev == 'INVALID':
             old_srcrev = None
         if old_srcrev and not args.srcrev:
             raise DevtoolError("Recipe specifies a SRCREV value; you must specify a new one when upgrading")
-        if rd.getVar('PV', True) == args.version and old_srcrev == args.srcrev:
+        if rd.getVar('PV') == args.version and old_srcrev == args.srcrev:
             raise DevtoolError("Current and upgrade versions are the same version")
 
         rf = None
diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index b761a80..0437e64 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -39,7 +39,7 @@ def edit_recipe(args, config, basepath, workspace):
             rd = parse_recipe(config, tinfoil, args.recipename, True)
             if not rd:
                 return 1
-            recipefile = rd.getVar('FILE', True)
+            recipefile = rd.getVar('FILE')
         finally:
             tinfoil.shutdown()
     else:
@@ -62,20 +62,20 @@ def configure_help(args, config, basepath, workspace):
         rd = parse_recipe(config, tinfoil, args.recipename, appends=True, filter_workspace=False)
         if not rd:
             return 1
-        b = rd.getVar('B', True)
-        s = rd.getVar('S', True)
+        b = rd.getVar('B')
+        s = rd.getVar('S')
         configurescript = os.path.join(s, 'configure')
         confdisabled = 'noexec' in rd.getVarFlags('do_configure') or 'do_configure' not in (rd.getVar('__BBTASKS', False) or [])
-        configureopts = oe.utils.squashspaces(rd.getVar('CONFIGUREOPTS', True) or '')
-        extra_oeconf = oe.utils.squashspaces(rd.getVar('EXTRA_OECONF', True) or '')
-        extra_oecmake = oe.utils.squashspaces(rd.getVar('EXTRA_OECMAKE', True) or '')
-        do_configure = rd.getVar('do_configure', True) or ''
+        configureopts = oe.utils.squashspaces(rd.getVar('CONFIGUREOPTS') or '')
+        extra_oeconf = oe.utils.squashspaces(rd.getVar('EXTRA_OECONF') or '')
+        extra_oecmake = oe.utils.squashspaces(rd.getVar('EXTRA_OECMAKE') or '')
+        do_configure = rd.getVar('do_configure') or ''
         do_configure_noexpand = rd.getVar('do_configure', False) or ''
         packageconfig = rd.getVarFlags('PACKAGECONFIG') or []
         autotools = bb.data.inherits_class('autotools', rd) and ('oe_runconf' in do_configure or 'autotools_do_configure' in do_configure)
         cmake = bb.data.inherits_class('cmake', rd) and ('cmake_do_configure' in do_configure)
-        cmake_do_configure = rd.getVar('cmake_do_configure', True)
-        pn = rd.getVar('PN', True)
+        cmake_do_configure = rd.getVar('cmake_do_configure')
+        pn = rd.getVar('PN')
     finally:
         tinfoil.shutdown()
 
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 3e85a0c..def4f90 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -48,7 +48,7 @@ def find_target_file(targetpath, d, pkglist=None):
     """Find the recipe installing the specified target path, optionally limited to a select list of packages"""
     import json
 
-    pkgdata_dir = d.getVar('PKGDATA_DIR', True)
+    pkgdata_dir = d.getVar('PKGDATA_DIR')
 
     # The mix between /etc and ${sysconfdir} here may look odd, but it is just
     # being consistent with usage elsewhere
@@ -110,8 +110,8 @@ def determine_file_source(targetpath, rd):
     import oe.recipeutils
 
     # See if it's in do_install for the recipe
-    workdir = rd.getVar('WORKDIR', True)
-    src_uri = rd.getVar('SRC_URI', True)
+    workdir = rd.getVar('WORKDIR')
+    src_uri = rd.getVar('SRC_URI')
     srcfile = ''
     modpatches = []
     elements = check_do_install(rd, targetpath)
@@ -190,7 +190,7 @@ def get_source_path(cmdelements):
 
 def get_func_deps(func, d):
     """Find the function dependencies of a shell function"""
-    deps = bb.codeparser.ShellParser(func, logger).parse_shell(d.getVar(func, True))
+    deps = bb.codeparser.ShellParser(func, logger).parse_shell(d.getVar(func))
     deps |= set((d.getVarFlag(func, "vardeps", True) or "").split())
     funcdeps = []
     for dep in deps:
@@ -200,12 +200,12 @@ def get_func_deps(func, d):
 
 def check_do_install(rd, targetpath):
     """Look at do_install for a command that installs/copies the specified target path"""
-    instpath = os.path.abspath(os.path.join(rd.getVar('D', True), targetpath.lstrip('/')))
-    do_install = rd.getVar('do_install', True)
+    instpath = os.path.abspath(os.path.join(rd.getVar('D'), targetpath.lstrip('/')))
+    do_install = rd.getVar('do_install')
     # Handle where do_install calls other functions (somewhat crudely, but good enough for this purpose)
     deps = get_func_deps('do_install', rd)
     for dep in deps:
-        do_install = do_install.replace(dep, rd.getVar(dep, True))
+        do_install = do_install.replace(dep, rd.getVar(dep))
 
     # Look backwards through do_install as we want to catch where a later line (perhaps
     # from a bbappend) is writing over the top
@@ -322,12 +322,12 @@ def appendfile(args):
 def appendsrc(args, files, rd, extralines=None):
     import oe.recipeutils
 
-    srcdir = rd.getVar('S', True)
-    workdir = rd.getVar('WORKDIR', True)
+    srcdir = rd.getVar('S')
+    workdir = rd.getVar('WORKDIR')
 
     import bb.fetch
     simplified = {}
-    src_uri = rd.getVar('SRC_URI', True).split()
+    src_uri = rd.getVar('SRC_URI').split()
     for uri in src_uri:
         if uri.endswith(';'):
             uri = uri[:-1]
@@ -340,7 +340,7 @@ def appendsrc(args, files, rd, extralines=None):
     for newfile, srcfile in files.items():
         src_destdir = os.path.dirname(srcfile)
         if not args.use_workdir:
-            if rd.getVar('S', True) == rd.getVar('STAGING_KERNEL_DIR', True):
+            if rd.getVar('S') == rd.getVar('STAGING_KERNEL_DIR'):
                 srcdir = os.path.join(workdir, 'git')
                 if not bb.data.inherits_class('kernel-yocto', rd):
                     logger.warn('S == STAGING_KERNEL_DIR and non-kernel-yocto, unable to determine path to srcdir, defaulting to ${WORKDIR}/git')
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index ab26531..0801223 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -68,8 +68,8 @@ class RecipeHandler(object):
             return
         # First build up library->package mapping
         shlib_providers = oe.package.read_shlib_providers(d)
-        libdir = d.getVar('libdir', True)
-        base_libdir = d.getVar('base_libdir', True)
+        libdir = d.getVar('libdir')
+        base_libdir = d.getVar('base_libdir')
         libpaths = list(set([base_libdir, libdir]))
         libname_re = re.compile('^lib(.+)\.so.*$')
         pkglibmap = {}
@@ -85,7 +85,7 @@ class RecipeHandler(object):
                         logger.debug('unable to extract library name from %s' % lib)
 
         # Now turn it into a library->recipe mapping
-        pkgdata_dir = d.getVar('PKGDATA_DIR', True)
+        pkgdata_dir = d.getVar('PKGDATA_DIR')
         for libname, pkg in pkglibmap.items():
             try:
                 with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
@@ -109,9 +109,9 @@ class RecipeHandler(object):
         '''Build up development file->recipe mapping'''
         if RecipeHandler.recipeheadermap:
             return
-        pkgdata_dir = d.getVar('PKGDATA_DIR', True)
-        includedir = d.getVar('includedir', True)
-        cmakedir = os.path.join(d.getVar('libdir', True), 'cmake')
+        pkgdata_dir = d.getVar('PKGDATA_DIR')
+        includedir = d.getVar('includedir')
+        cmakedir = os.path.join(d.getVar('libdir'), 'cmake')
         for pkg in glob.glob(os.path.join(pkgdata_dir, 'runtime', '*-dev')):
             with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
                 pn = None
@@ -140,9 +140,9 @@ class RecipeHandler(object):
         '''Build up native binary->recipe mapping'''
         if RecipeHandler.recipebinmap:
             return
-        sstate_manifests = d.getVar('SSTATE_MANIFESTS', True)
-        staging_bindir_native = d.getVar('STAGING_BINDIR_NATIVE', True)
-        build_arch = d.getVar('BUILD_ARCH', True)
+        sstate_manifests = d.getVar('SSTATE_MANIFESTS')
+        staging_bindir_native = d.getVar('STAGING_BINDIR_NATIVE')
+        build_arch = d.getVar('BUILD_ARCH')
         fileprefix = 'manifest-%s-' % build_arch
         for fn in glob.glob(os.path.join(sstate_manifests, '%s*-native.populate_sysroot' % fileprefix)):
             with open(fn, 'r') as f:
@@ -837,7 +837,7 @@ def get_license_md5sums(d, static_only=False):
     md5sums = {}
     if not static_only:
         # Gather md5sums of license files in common license dir
-        commonlicdir = d.getVar('COMMON_LICENSE_DIR', True)
+        commonlicdir = d.getVar('COMMON_LICENSE_DIR')
         for fn in os.listdir(commonlicdir):
             md5value = bb.utils.md5_file(os.path.join(commonlicdir, fn))
             md5sums[md5value] = fn
@@ -1007,7 +1007,7 @@ def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=None, pn
     return outlicenses
 
 def read_pkgconfig_provides(d):
-    pkgdatadir = d.getVar('PKGDATA_DIR', True)
+    pkgdatadir = d.getVar('PKGDATA_DIR')
     pkgmap = {}
     for fn in glob.glob(os.path.join(pkgdatadir, 'shlibs2', '*.pclist')):
         with open(fn, 'r') as f:
@@ -1117,7 +1117,7 @@ def convert_rpm_xml(xmlfile):
 
 
 def check_npm(d, debugonly=False):
-    if not os.path.exists(os.path.join(d.getVar('STAGING_BINDIR_NATIVE', True), 'npm')):
+    if not os.path.exists(os.path.join(d.getVar('STAGING_BINDIR_NATIVE'), 'npm')):
         log_error_cond('npm required to process specified source, but npm is not available - you need to build nodejs-native first', debugonly)
         sys.exit(14)
 
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 82a2be1..ec5449b 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -532,11 +532,11 @@ class PythonRecipeHandler(RecipeHandler):
 
     def parse_pkgdata_for_python_packages(self):
         suffixes = [t[0] for t in imp.get_suffixes()]
-        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
 
         ldata = tinfoil.config_data.createCopy()
         bb.parse.handle('classes/python-dir.bbclass', ldata, True)
-        python_sitedir = ldata.getVar('PYTHON_SITEPACKAGES_DIR', True)
+        python_sitedir = ldata.getVar('PYTHON_SITEPACKAGES_DIR')
 
         dynload_dir = os.path.join(os.path.dirname(python_sitedir), 'lib-dynload')
         python_dirs = [python_sitedir + os.sep,
diff --git a/scripts/lib/recipetool/create_kernel.py b/scripts/lib/recipetool/create_kernel.py
index 7dac59f..ca4996c 100644
--- a/scripts/lib/recipetool/create_kernel.py
+++ b/scripts/lib/recipetool/create_kernel.py
@@ -41,7 +41,7 @@ class KernelRecipeHandler(RecipeHandler):
         handled.append('buildsystem')
         del lines_after[:]
         del classes[:]
-        template = os.path.join(tinfoil.config_data.getVar('COREBASE', True), 'meta-skeleton', 'recipes-kernel', 'linux', 'linux-yocto-custom.bb')
+        template = os.path.join(tinfoil.config_data.getVar('COREBASE'), 'meta-skeleton', 'recipes-kernel', 'linux', 'linux-yocto-custom.bb')
         def handle_var(varname, origvalue, op, newlines):
             if varname in ['SRCREV', 'SRCREV_machine']:
                 while newlines[-1].startswith('#'):
@@ -85,7 +85,7 @@ class KernelRecipeHandler(RecipeHandler):
             elif varname == 'COMPATIBLE_MACHINE':
                 while newlines[-1].startswith('#'):
                     del newlines[-1]
-                machine = tinfoil.config_data.getVar('MACHINE', True)
+                machine = tinfoil.config_data.getVar('MACHINE')
                 return machine, op, 0, True
             return origvalue, op, 0, True
         with open(template, 'r') as f:
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 7bb844c..888aa2b 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -49,7 +49,7 @@ class NpmRecipeHandler(RecipeHandler):
 
     def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_before):
         try:
-            runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH', True))
+            runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH'))
             bb.process.run('npm shrinkwrap', cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
         except bb.process.ExecutionError as e:
             logger.warn('npm shrinkwrap failed:\n%s' % e.stdout)
@@ -62,7 +62,7 @@ class NpmRecipeHandler(RecipeHandler):
         lines_before.append('NPM_SHRINKWRAP := "${THISDIR}/${PN}/npm-shrinkwrap.json"')
 
     def _lockdown(self, srctree, localfilesdir, extravalues, lines_before):
-        runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH', True))
+        runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH'))
         if not NpmRecipeHandler.lockdownpath:
             NpmRecipeHandler.lockdownpath = tempfile.mkdtemp('recipetool-npm-lockdown')
             bb.process.run('npm install lockdown --prefix %s' % NpmRecipeHandler.lockdownpath,
@@ -257,7 +257,7 @@ class NpmRecipeHandler(RecipeHandler):
         if version != '*' and not '/' in version:
             pkgfullname += "@'%s'" % version
         logger.debug(2, "Calling getdeps on %s" % pkg)
-        runenv = dict(os.environ, PATH=d.getVar('PATH', True))
+        runenv = dict(os.environ, PATH=d.getVar('PATH'))
         fetchcmd = "npm view %s --json" % pkgfullname
         output, _ = bb.process.run(fetchcmd, stderr=subprocess.STDOUT, env=runenv, shell=True)
         data = self._parse_view(output)
diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index 3760840..0b63759 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -60,7 +60,7 @@ def newappend(args):
     if not path_ok:
         logger.warn('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.', os.path.join(args.destlayer, 'conf', 'layer.conf'), os.path.dirname(append_path))
 
-    layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS', True).split()]
+    layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS').split()]
     if not os.path.abspath(args.destlayer) in layerdirs:
         logger.warn('Specified layer is not currently enabled in bblayers.conf, you will need to add it before this bbappend will be active')
 
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 27d82b6..4233783 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -93,7 +93,7 @@ def fetch_uri(d, uri, destdir, srcrev=None):
         fetcher.download()
         for u in fetcher.ud:
             ud = fetcher.ud[u]
-            if ud.localpath.rstrip(os.sep) == localdata.getVar('DL_DIR', True).rstrip(os.sep):
+            if ud.localpath.rstrip(os.sep) == localdata.getVar('DL_DIR').rstrip(os.sep):
                 raise Exception('Local path is download directory - please check that the URI "%s" is correct' % uri)
         fetcher.unpack(destdir)
         for u in fetcher.ud:
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index fe41f41..6255662 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -570,7 +570,7 @@ def main():
         logger.debug('Found bitbake path: %s' % bitbakepath)
         tinfoil = tinfoil_init()
         try:
-            args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+            args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
         finally:
             tinfoil.shutdown()
         logger.debug('Value of PKGDATA_DIR is "%s"' % args.pkgdata_dir)
diff --git a/scripts/recipetool b/scripts/recipetool
index 54cbc85..3765ec7 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -79,7 +79,7 @@ def main():
 
     tinfoil = tinfoil_init(False)
     try:
-        for path in (tinfoil.config_data.getVar('BBPATH', True).split(':')
+        for path in (tinfoil.config_data.getVar('BBPATH').split(':')
                      + [scripts_path]):
             pluginpath = os.path.join(path, 'lib', 'recipetool')
             scriptutils.load_plugins(logger, plugins, pluginpath)
-- 
2.9.3


