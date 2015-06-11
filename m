Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F215D75678
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 11:34:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2015 04:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="709156489"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2015 04:34:30 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 14:34:16 +0300
Message-Id: <1434022456-26266-11-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 10/10] devtool: use DevtoolError for error handling
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
X-List-Received-Date: Thu, 11 Jun 2015 11:34:30 -0000

Use DevtoolError exception more widely for handling error cases. This
exception is now caught in the main script and raising it can be used to
exit with an error. This hopefully simplifies error handling. The
change also makes exit codes more consistent, always returning '1' when
an error occurs.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/devtool                 |   8 ++-
 scripts/lib/devtool/__init__.py |   6 ++
 scripts/lib/devtool/deploy.py   |  31 ++++----
 scripts/lib/devtool/standard.py | 154 ++++++++++++++++++----------------------
 4 files changed, 99 insertions(+), 100 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 307846a..7fd4da3 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -35,6 +35,7 @@ context = None
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
+from devtool import DevtoolError
 import scriptutils
 logger = scriptutils.logger_create('devtool')
 
@@ -249,7 +250,12 @@ def main():
     if args.subparser_name != 'create-workspace':
         read_workspace()
 
-    ret = args.func(args, config, basepath, workspace)
+    try:
+        ret = args.func(args, config, basepath, workspace)
+    except DevtoolError as err:
+        if str(err):
+            logger.error(str(err))
+        ret = 1
 
     return ret
 
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 9ec1ef6..ea0b63e 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -25,6 +25,12 @@ import logging
 
 logger = logging.getLogger('devtool')
 
+
+class DevtoolError(Exception):
+    """Exception for handling devtool errors"""
+    pass
+
+
 def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
     """Run a program in bitbake build context"""
     import bb
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 92a3cb4..ca74a8e 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -19,7 +19,7 @@
 import os
 import subprocess
 import logging
-from devtool import exec_build_env_command, setup_tinfoil
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -34,8 +34,8 @@ def deploy(args, config, basepath, workspace):
     import oe.recipeutils
 
     if not args.recipename in workspace:
-        logger.error("no recipe named %s in your workspace" % args.recipename)
-        return -1
+        raise DevtoolError("no recipe named %s in your workspace" %
+                           args.recipename)
     try:
         host, destdir = args.target.split(':')
     except ValueError:
@@ -50,12 +50,13 @@ def deploy(args, config, basepath, workspace):
     try:
         rd = oe.recipeutils.parse_recipe_simple(tinfoil.cooker, args.recipename, tinfoil.config_data)
     except Exception as e:
-        logger.error('Exception parsing recipe %s: %s' % (args.recipename, e))
-        return 2
+        raise DevtoolError('Exception parsing recipe %s: %s' %
+                           (args.recipename, e))
     recipe_outdir = rd.getVar('D', True)
     if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
-        logger.error('No files to deploy - have you built the %s recipe? If so, the install step has not installed any files.' % args.recipename)
-        return -1
+        raise DevtoolError('No files to deploy - have you built the %s '
+                           'recipe? If so, the install step has not installed '
+                           'any files.' % args.recipename)
 
     if args.dry_run:
         print('Files to be deployed for %s on target %s:' % (args.recipename, args.target))
@@ -67,7 +68,7 @@ def deploy(args, config, basepath, workspace):
     if os.path.exists(deploy_file):
         if undeploy(args, config, basepath, workspace):
             # Error already shown
-            return -1
+            return 1
 
     extraoptions = ''
     if args.no_host_check:
@@ -76,8 +77,8 @@ def deploy(args, config, basepath, workspace):
         extraoptions += ' -q'
     ret = subprocess.call('scp -r %s %s/* %s:%s' % (extraoptions, recipe_outdir, args.target, destdir), shell=True)
     if ret != 0:
-        logger.error('Deploy failed - rerun with -s to get a complete error message')
-        return ret
+        raise DevtoolError('Deploy failed - rerun with -s to get a complete '
+                           'error message')
 
     logger.info('Successfully deployed %s' % recipe_outdir)
 
@@ -99,8 +100,7 @@ def undeploy(args, config, basepath, workspace):
     """Entry point for the devtool 'undeploy' subcommand"""
     deploy_file = os.path.join(basepath, 'target_deploy', args.target, args.recipename + '.list')
     if not os.path.exists(deploy_file):
-        logger.error('%s has not been deployed' % args.recipename)
-        return -1
+        raise DevtoolError('%s has not been deployed' % args.recipename)
 
     if args.dry_run:
         print('Previously deployed files to be un-deployed for %s on target %s:' % (args.recipename, args.target))
@@ -117,15 +117,16 @@ def undeploy(args, config, basepath, workspace):
 
     ret = subprocess.call("scp %s %s %s:/tmp" % (extraoptions, deploy_file, args.target), shell=True)
     if ret != 0:
-        logger.error('Failed to copy file list to %s - rerun with -s to get a complete error message' % args.target)
-        return -1
+        raise DevtoolError('Failed to copy file list to %s - rerun with -s to '
+                           'get a complete error message' % args.target)
 
     ret = subprocess.call("ssh %s %s 'xargs -n1 rm -f </tmp/%s'" % (extraoptions, args.target, os.path.basename(deploy_file)), shell=True)
     if ret == 0:
         logger.info('Successfully undeployed %s' % args.recipename)
         os.remove(deploy_file)
     else:
-        logger.error('Undeploy failed - rerun with -s to get a complete error message')
+        raise DevtoolError('Undeploy failed - rerun with -s to get a complete '
+                           'error message')
 
     return ret
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 14912a9..4d3ff02 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -25,16 +25,11 @@ import logging
 import argparse
 import scriptutils
 import errno
-from devtool import exec_build_env_command, setup_tinfoil
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
 
 logger = logging.getLogger('devtool')
 
 
-class DevtoolError(Exception):
-    """Exception for handling devtool errors"""
-    pass
-
-
 def plugin_init(pluginlist):
     """Plugin initialization"""
     pass
@@ -46,26 +41,27 @@ def add(args, config, basepath, workspace):
     import oe.recipeutils
 
     if args.recipename in workspace:
-        logger.error("recipe %s is already in your workspace" % args.recipename)
-        return -1
+        raise DevtoolError("recipe %s is already in your workspace" %
+                            args.recipename)
 
     reason = oe.recipeutils.validate_pn(args.recipename)
     if reason:
-        logger.error(reason)
-        return -1
+        raise DevtoolError(reason)
 
     srctree = os.path.abspath(args.srctree)
     if os.path.exists(srctree):
         if args.fetch:
             if not os.path.isdir(srctree):
-                logger.error("Cannot fetch into source tree path %s as it exists and is not a directory" % srctree)
-                return 1
+                raise DevtoolError("Cannot fetch into source tree path %s as "
+                                   "it exists and is not a directory" %
+                                   srctree)
             elif os.listdir(srctree):
-                logger.error("Cannot fetch into source tree path %s as it already exists and is non-empty" % srctree)
-                return 1
+                raise DevtoolError("Cannot fetch into source tree path %s as "
+                                   "it already exists and is non-empty" %
+                                   srctree)
     elif not args.fetch:
-        logger.error("Specified source tree %s could not be found" % srctree)
-        return 1
+        raise DevtoolError("Specified source tree %s could not be found" %
+                           srctree)
 
     appendpath = os.path.join(config.workspace_path, 'appends')
     if not os.path.exists(appendpath):
@@ -76,8 +72,7 @@ def add(args, config, basepath, workspace):
     rfv = None
     if args.version:
         if '_' in args.version or ' ' in args.version:
-            logger.error('Invalid version string "%s"' % args.version)
-            return -1
+            raise DevtoolError('Invalid version string "%s"' % args.version)
         rfv = args.version
     if args.fetch:
         if args.fetch.startswith('git://'):
@@ -107,8 +102,7 @@ def add(args, config, basepath, workspace):
         stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, recipefile, source, extracmdopts))
         logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
     except bb.process.ExecutionError as e:
-        logger.error('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
-        return 1
+        raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
 
     _add_md5(config, args.recipename, recipefile)
 
@@ -134,35 +128,33 @@ def add(args, config, basepath, workspace):
 def _check_compatible_recipe(pn, d):
     """Check if the recipe is supported by devtool"""
     if pn == 'perf':
-        logger.error("The perf recipe does not actually check out source and thus cannot be supported by this tool")
-        return False
+        raise DevtoolError("The perf recipe does not actually check out "
+                           "source and thus cannot be supported by this tool")
 
     if pn in ['kernel-devsrc', 'package-index'] or pn.startswith('gcc-source'):
-        logger.error("The %s recipe is not supported by this tool" % pn)
-        return False
+        raise DevtoolError("The %s recipe is not supported by this tool" % pn)
 
     if bb.data.inherits_class('image', d):
-        logger.error("The %s recipe is an image, and therefore is not supported by this tool" % pn)
-        return False
+        raise DevtoolError("The %s recipe is an image, and therefore is not "
+                           "supported by this tool" % pn)
 
     if bb.data.inherits_class('populate_sdk', d):
-        logger.error("The %s recipe is an SDK, and therefore is not supported by this tool" % pn)
-        return False
+        raise DevtoolError("The %s recipe is an SDK, and therefore is not "
+                           "supported by this tool" % pn)
 
     if bb.data.inherits_class('packagegroup', d):
-        logger.error("The %s recipe is a packagegroup, and therefore is not supported by this tool" % pn)
-        return False
+        raise DevtoolError("The %s recipe is a packagegroup, and therefore is "
+                           "not supported by this tool" % pn)
 
     if bb.data.inherits_class('meta', d):
-        logger.error("The %s recipe is a meta-recipe, and therefore is not supported by this tool" % pn)
-        return False
+        raise DevtoolError("The %s recipe is a meta-recipe, and therefore is "
+                           "not supported by this tool" % pn)
 
     if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC', True):
-        logger.error("externalsrc is currently enabled for the %s recipe. This prevents the normal do_patch task from working. You will need to disable this first." % pn)
-        return False
-
-    return True
-
+        raise DevtoolError("externalsrc is currently enabled for the %s "
+                           "recipe. This prevents the normal do_patch task "
+                           "from working. You will need to disable this "
+                           "first." % pn)
 
 def _get_recipe_file(cooker, pn):
     """Find recipe file corresponding a package name"""
@@ -209,14 +201,14 @@ def extract(args, config, basepath, workspace):
 
     rd = _parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
-        return -1
+        return 1
 
     srctree = os.path.abspath(args.srctree)
     initial_rev = _extract_source(srctree, args.keep_temp, args.branch, rd)
     if initial_rev:
         return 0
     else:
-        return -1
+        return 1
 
 class BbTaskExecutor(object):
     """Class for executing bitbake tasks for a recipe
@@ -262,16 +254,15 @@ def _extract_source(srctree, keep_temp, devbranch, d):
 
     pn = d.getVar('PN', True)
 
-    if not _check_compatible_recipe(pn, d):
-        return None
+    _check_compatible_recipe(pn, d)
 
     if os.path.exists(srctree):
         if not os.path.isdir(srctree):
-            logger.error("output path %s exists and is not a directory" % srctree)
-            return None
+            raise DevtoolError("output path %s exists and is not a directory" %
+                               srctree)
         elif os.listdir(srctree):
-            logger.error("output path %s already exists and is non-empty" % srctree)
-            return None
+            raise DevtoolError("output path %s already exists and is "
+                               "non-empty" % srctree)
 
     # Prepare for shutil.move later on
     bb.utils.mkdirhier(srctree)
@@ -341,8 +332,8 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             initial_rev = stdout.rstrip()
         else:
             if not os.listdir(srcsubdir):
-                logger.error("no source unpacked to S, perhaps the %s recipe doesn't use any source?" % pn)
-                return None
+                raise DevtoolError("no source unpacked to S, perhaps the %s "
+                                   "recipe doesn't use any source?" % pn)
 
             if not os.path.exists(os.path.join(srcsubdir, '.git')):
                 bb.process.run('git init', cwd=srcsubdir)
@@ -423,22 +414,22 @@ def modify(args, config, basepath, workspace):
     import oe.recipeutils
 
     if args.recipename in workspace:
-        logger.error("recipe %s is already in your workspace" % args.recipename)
-        return -1
+        raise DevtoolError("recipe %s is already in your workspace" %
+                           args.recipename)
 
     if not args.extract and not os.path.isdir(args.srctree):
-        logger.error("directory %s does not exist or not a directory (specify -x to extract source from recipe)" % args.srctree)
-        return -1
+        raise DevtoolError("directory %s does not exist or not a directory "
+                           "(specify -x to extract source from recipe)" %
+                           args.srctree)
 
     tinfoil = setup_tinfoil()
 
     rd = _parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
-        return -1
+        return 1
     recipefile = rd.getVar('FILE', True)
 
-    if not _check_compatible_recipe(args.recipename, rd):
-        return -1
+    _check_compatible_recipe(args.recipename, rd)
 
     initial_rev = None
     commits = []
@@ -446,7 +437,7 @@ def modify(args, config, basepath, workspace):
     if args.extract:
         initial_rev = _extract_source(args.srctree, False, args.branch, rd)
         if not initial_rev:
-            return -1
+            return 1
         # Get list of commits since this revision
         (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=args.srctree)
         commits = stdout.split()
@@ -758,22 +749,22 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
     if not args.recipename in workspace:
-        logger.error("no recipe named %s in your workspace" % args.recipename)
-        return -1
+        raise DevtoolError("no recipe named %s in your workspace" %
+                           args.recipename)
 
     if args.append:
         if not os.path.exists(args.append):
-            logger.error('bbappend destination layer directory "%s" does not exist' % args.append)
-            return 2
+            raise DevtoolError('bbappend destination layer directory "%s" '
+                               'does not exist' % args.append)
         if not os.path.exists(os.path.join(args.append, 'conf', 'layer.conf')):
-            logger.error('conf/layer.conf not found in bbappend destination layer "%s"' % args.append)
-            return 2
+            raise DevtoolError('conf/layer.conf not found in bbappend '
+                               'destination layer "%s"' % args.append)
 
     tinfoil = setup_tinfoil()
 
     rd = _parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
-        return -1
+        return 1
 
     orig_src_uri = rd.getVar('SRC_URI', False) or ''
     if args.mode == 'auto':
@@ -786,17 +777,12 @@ def update_recipe(args, config, basepath, workspace):
 
     srctree = workspace[args.recipename]
 
-    try:
-        if mode == 'srcrev':
-            _update_recipe_srcrev(args, srctree, rd, tinfoil.config_data)
-        elif mode == 'patch':
-            _update_recipe_patch(args, config, srctree, rd,
-                                 tinfoil.config_data)
-        else:
-            raise DevtoolError('update_recipe: invalid mode %s' % mode)
-    except DevtoolError as err:
-        logger.error(err)
-        return 1
+    if mode == 'srcrev':
+        _update_recipe_srcrev(args, srctree, rd, tinfoil.config_data)
+    elif mode == 'patch':
+        _update_recipe_patch(args, config, srctree, rd, tinfoil.config_data)
+    else:
+        raise DevtoolError('update_recipe: invalid mode %s' % mode)
 
     return 0
 
@@ -816,15 +802,13 @@ def reset(args, config, basepath, workspace):
     import bb
     if args.recipename:
         if args.all:
-            logger.error("Recipe cannot be specified if -a/--all is used")
-            return -1
+            raise DevtoolError("Recipe cannot be specified if -a/--all is used")
         elif not args.recipename in workspace:
-            logger.error("no recipe named %s in your workspace" % args.recipename)
-            return -1
+            raise DevtoolError("no recipe named %s in your workspace" %
+                               args.recipename)
     elif not args.all:
-        logger.error("Recipe must be specified, or specify -a/--all to reset all recipes")
-        return -1
-
+        raise DevtoolError("Recipe must be specified, or specify -a/--all to "
+                           "reset all recipes")
     if args.all:
         recipes = workspace
     else:
@@ -836,8 +820,10 @@ def reset(args, config, basepath, workspace):
             try:
                 exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % pn)
             except bb.process.ExecutionError as e:
-                logger.error('Command \'%s\' failed, output:\n%s\nIf you wish, you may specify -n/--no-clean to skip running this command when resetting' % (e.command, e.stdout))
-                return 1
+                raise DevtoolError('Command \'%s\' failed, output:\n%s\nIf you '
+                                   'wish, you may specify -n/--no-clean to '
+                                   'skip running this command when resetting' %
+                                   (e.command, e.stdout))
 
         _check_preserve(config, pn)
 
@@ -861,8 +847,8 @@ def build(args, config, basepath, workspace):
     """Entry point for the devtool 'build' subcommand"""
     import bb
     if not args.recipename in workspace:
-        logger.error("no recipe named %s in your workspace" % args.recipename)
-        return -1
+        raise DevtoolError("no recipe named %s in your workspace" %
+                           args.recipename)
     build_task = config.get('Build', 'build_task', 'populate_sysroot')
     try:
         exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (build_task, args.recipename), watch=True)
-- 
2.1.4


