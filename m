Return-Path: <juan.m.cruz.alcaraz@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1548D78202
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 21:59:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jun 2017 14:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,380,1493708400"; d="scan'208";a="984607347"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by orsmga003.jf.intel.com with ESMTP; 23 Jun 2017 14:59:05 -0700
From: juan.m.cruz.alcaraz@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 14:58:45 -0700
Message-Id: <20170623215845.39131-1-juan.m.cruz.alcaraz@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] devtool: Adds the kernel-menuconfig plugin to devtool
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
X-List-Received-Date: Fri, 23 Jun 2017 21:59:05 -0000

From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>

The kernel-menuconfig target allows devtool to checkout the linux kernel configured in
the extensible SDK environment, to apply the required patches and the kernel configuration
snippets.

After that it executes the menuconfig make target to allow the user to configure the
kernel as needed. The .config configuration file is stored in the eSDK workspace along
with the linux kernel source.

This commit was based in this original implementation:
https://github.com/ostroproject/meta-ostro/blob/master/meta-ostro/lib/devtool/kconfig.py

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10416

[YOCTO #10416]

Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
---
 scripts/lib/devtool/kconfig.py  | 188 ++++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py |  45 +++++-----
 2 files changed, 211 insertions(+), 22 deletions(-)
 create mode 100644 scripts/lib/devtool/kconfig.py

diff --git a/scripts/lib/devtool/kconfig.py b/scripts/lib/devtool/kconfig.py
new file mode 100644
index 0000000000..e8e0a38527
--- /dev/null
+++ b/scripts/lib/devtool/kconfig.py
@@ -0,0 +1,188 @@
+# Development tool - kernel command plugin
+#
+# Copyright (C) 2017 Intel Corporation
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
+"""Devtool plugin containing the kernel subcommands"""
+
+import os
+import logging
+import glob
+import scriptutils
+import shutil
+from devtool import standard
+from devtool import exec_build_env_command
+from devtool import setup_git_repo, recipe_to_append
+from devtool import setup_tinfoil, parse_recipe, DevtoolError
+from bb.process import ExecutionError
+
+logger = logging.getLogger('devtool')
+
+def kernel_menuconfig(args, config, basepath, workspace):
+    """Entry point for the devtool 'kernel-menuconfig' subcommand"""
+
+    tinfoil = setup_tinfoil(basepath=basepath)
+    pn = None
+    bpath = None
+
+    try:
+        rd = parse_recipe(config, tinfoil, 'virtual/kernel', appends=True, filter_workspace=False)
+        if not rd:
+            return 1
+
+        pn = rd.getVar('PN', True)
+        bpath = rd.getVar('B', True)
+        pntree = os.path.join(config.get('General', 'default_source_parent_dir',
+                                         config.workspace_path), 'sources', pn)
+
+        if pn not in workspace:
+            fn = tinfoil.get_recipe_file(pn)
+            # We need to do this carefully as the version will change as a result of do_menuconfig
+            ver = rd.expand('${EXTENDPE}${PV}-${PR}')
+            taintfn = (rd.getVar('STAMP', True) + '.do_compile.taint').replace(ver, '*')
+
+            tmptree = os.path.join(config.get('General', 'default_source_parent_dir',
+                                             config.workspace_path), '.temp')
+            srctree = os.path.join(tmptree, pn)
+
+            crd = rd.createCopy()
+            crd.setVar('WORKDIR', srctree)
+            crd.setVar('S', '${WORKDIR}/source')
+            crd.setVar('B', '${WORKDIR}/${PN}')
+            crd.setVar('STAGING_KERNEL_DIR', '${S}')
+            crd.setVar('PATCHTOOL', 'git')
+            crd.setVar('PATCH_COMMIT_FUNCTIONS', '1')
+
+            # Apply our changes to the datastore to the server's datastore
+            tinfoil.logger.setLevel(logging.WARNING)
+            for key in crd.localkeys():
+                tinfoil.config_data.setVar('%s_pn-%s' % (key, pn), crd.getVar(key, False))
+
+            tinfoil.config_data.setVar('STAMPS_DIR', os.path.join(srctree, 'stamps'))
+            tinfoil.config_data.setVar('T', os.path.join(srctree, 'temp'))
+            tinfoil.config_data.setVar('BUILDCFG_FUNCS', '')
+            tinfoil.config_data.setVar('BUILDCFG_HEADER', '')
+            tinfoil.config_data.setVar('BB_HASH_IGNORE_MISMATCH', '1')
+            tinfoil.set_event_mask(['bb.event.BuildStarted',
+                                    'bb.event.BuildCompleted',
+                                    'logging.LogRecord',
+                                    'bb.command.CommandCompleted',
+                                    'bb.command.CommandFailed',
+                                    'bb.build.TaskStarted',
+                                    'bb.build.TaskSucceeded',
+                                    'bb.build.TaskFailed',
+                                    'bb.build.TaskFailedSilent'])
+
+            recipeFile = None
+            recipefile = rd.getVar('FILE')
+            kconfigpath = crd.getVar('B')
+            appendfile = recipe_to_append(recipefile, config, False)
+
+            bb.utils.mkdirhier(srctree)
+
+            # Kernel to populate the source directory
+            standard._run_task(tinfoil, fn, 'kernel_checkout')
+
+            srcsubdir = crd.getVar('S')
+            scriptutils.git_convert_standalone_clone(srcsubdir)
+            # Make sure that srcsubdir exists
+            bb.utils.mkdirhier(srcsubdir)
+            if not os.path.exists(srcsubdir) or not os.listdir(srcsubdir):
+                logger.warning("no source unpacked to S, either the %s recipe "
+                               "doesn't use any source or the correct source "
+                               "directory could not be determined" % pn)
+
+            setup_git_repo(srcsubdir, crd.getVar('PV'), 'devtool', d=rd)
+            bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
+
+            logger.info('Patching...')
+            standard._run_task(tinfoil, fn, 'patch')
+            bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
+
+            kconfig = None
+            logger.info('Launching menuconfig')
+            standard._run_task(tinfoil, fn, 'menuconfig')
+            kconfig = os.path.join(kconfigpath, '.config')
+    except:
+        shutil.rmtree(tmptree)
+        tinfoil.shutdown()
+        return 1
+
+    finally:
+        tinfoil.shutdown()
+
+    if pn not in workspace:
+        try:
+            shutil.move(srcsubdir, pntree)
+
+            if kconfig:
+                shutil.copy2(kconfig, pntree)
+
+            # Creates the kernel append file to link the recipe with the devtool workspace
+            if os.path.exists(appendfile):
+                raise DevtoolError("Another recipe name is colliding with the kernel recipe")
+
+            bb.utils.mkdirhier(os.path.dirname(appendfile))
+            with open(appendfile, 'w') as f:
+                f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n'
+                        '\ninherit externalsrc\n'
+                        '\nEXTERNALSRC_pn-%s = "%s"\n' % (pn, pntree))
+                f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
+                        'do_fetch do_unpack do_patch do_kernel_configme do_kernel_configcheck"\n'
+                        '\ndo_configure_append() {\n'
+                        '    cp ${B}/.config ${S}/.config.baseline\n'
+                        '    ln -sfT ${B}/.config ${S}/.config.new\n'
+                        '}\n')
+
+                (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=pntree)
+                initial_rev = stdout.rstrip()
+                if initial_rev:
+                    (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=pntree)
+                    commits = stdout.split()
+                    f.write('\n# initial_rev: %s\n' % initial_rev)
+                    for commit in commits:
+                        f.write('# commit: %s\n' % commit)
+
+            standard._add_md5(config, pn, appendfile)
+            logger.info('Recipe %s now set up to build from %s' % (pn, pntree))
+
+        except:
+            os.remove(appendfile)
+            shutil.rmtree(tmptree)
+            for fn in glob.glob(taintfn):
+                os.remove(fn)
+            return 1
+
+        finally:
+            shutil.rmtree(tmptree)
+            for fn in glob.glob(taintfn):
+                os.remove(fn)
+
+    else:
+        logger.info('%s already in the workspace.' % pn)
+        exec_build_env_command(config.init_path, basepath, 'bitbake -c menuconfig %s' % pn, watch=True)
+        kconfig = os.path.join(bpath, '.config')
+        shutil.copy2(kconfig, pntree)
+
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from the kernel plugin"""
+    if context.fixed_setup:
+        parser_menuconfig = subparsers.add_parser('kernel-menuconfig',
+            help='Allows altering the kernel configuration',
+            description='Ensures that the kernel source tree is in your workspace and then launches "make menuconfig" for the kernel',
+            group='advanced', order=-5)
+        parser_menuconfig.set_defaults(func=kernel_menuconfig)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7e342e7687..d2f440c471 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -539,31 +539,13 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
                                 'bb.build.TaskFailed',
                                 'bb.build.TaskFailedSilent'])
 
-        def runtask(target, task):
-            if tinfoil.build_file(target, task):
-                while True:
-                    event = tinfoil.wait_event(0.25)
-                    if event:
-                        if isinstance(event, bb.command.CommandCompleted):
-                            break
-                        elif isinstance(event, bb.command.CommandFailed):
-                            raise DevtoolError('Task do_%s failed: %s' % (task, event.error))
-                        elif isinstance(event, bb.build.TaskFailed):
-                            raise DevtoolError('Task do_%s failed' % task)
-                        elif isinstance(event, bb.build.TaskStarted):
-                            logger.info('Executing %s...' % event._task)
-                        elif isinstance(event, logging.LogRecord):
-                            if event.levelno <= logging.INFO:
-                                continue
-                            logger.handle(event)
-
         # we need virtual:native:/path/to/recipe if it's a BBCLASSEXTEND
         fn = tinfoil.get_recipe_file(pn)
-        runtask(fn, 'unpack')
+        _run_task(tinfoil, fn, 'unpack')
 
         if bb.data.inherits_class('kernel-yocto', d):
             # Extra step for kernel to populate the source directory
-            runtask(fn, 'kernel_checkout')
+            _run_task(tinfoil, fn, 'kernel_checkout')
 
         srcsubdir = crd.getVar('S')
 
@@ -619,7 +601,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
         initial_rev = stdout.rstrip()
 
         logger.info('Patching...')
-        runtask(fn, 'patch')
+        _run_task(tinfoil, fn, 'patch')
 
         bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
 
@@ -627,7 +609,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
         if bb.data.inherits_class('kernel-yocto', d):
             # Store generate and store kernel config
             logger.info('Generating kernel config')
-            runtask(fn, 'configure')
+            _run_task(tinfoil, fn, 'configure')
             kconfig = os.path.join(crd.getVar('B'), '.config')
 
 
@@ -710,6 +692,25 @@ def _add_md5(config, recipename, filename):
     else:
         addfile(filename)
 
+def _run_task(tinfoil, target, task):
+    """Run a bitbake task from a target with a tinfoil session and manage the related tinfoil event"""
+    if tinfoil.build_file(target, task):
+        while True:
+            event = tinfoil.wait_event(0.25)
+            if event:
+                if isinstance(event, bb.command.CommandCompleted):
+                    break
+                elif isinstance(event, bb.command.CommandFailed):
+                    raise DevtoolError('Task do_%s failed: %s' % (task, event.error))
+                elif isinstance(event, bb.build.TaskFailed):
+                    raise DevtoolError('Task do_%s failed' % task)
+                elif isinstance(event, bb.build.TaskStarted):
+                    logger.info('Executing %s...' % event._task)
+                elif isinstance(event, logging.LogRecord):
+                    if event.levelno <= logging.INFO:
+                        continue
+                    logger.handle(event)
+
 def _check_preserve(config, recipename):
     """Check if a file was manually changed and needs to be saved in 'attic'
        directory"""
-- 
2.12.0


