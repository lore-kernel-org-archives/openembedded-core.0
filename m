Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F0D1C71B5F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:21 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885895"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:41 +1300
Message-Id: <c0177462d06d4060babbc1a00e47053abc5edeaa.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/14] devtool: fix extraction of source to work in memres mode
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:22 -0000

Extracting the source for a recipe (as used by devtool's extract, modify
and upgrade subcommands) requires us to run do_fetch, do_unpack,
do_patch and any tasks that the recipe has inserted inbetween, and do so
with a modified datastore primarily so that we can redirect WORKDIR and
STAMPS_DIR in order to have the files written out to a place of our
choosing and avoid stamping the tasks as having executed in a real build
context respectively. However, this all gets much more difficult when in
memres mode since we can't call internal functions such as
bb.build.exec_func() directly - instead we need to execute the tasks on
the server. To do this we use the buildFile command which already exists
for the purpose of supporting bitbake -b, and setVariable commands to
set up the appropriate datastore.

(I did look at passing the modified datastore to the buildFile command
instead of using setVar() on the main datastore, however its use of
databuilder makes that very difficult, and we'd also need a different
method of getting the changes in the datastore over to the worker as
well.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 122 ++++++++++++++++++----------------------
 scripts/lib/devtool/upgrade.py  |   2 +-
 2 files changed, 55 insertions(+), 69 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 06c508c..fbd8a71 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -378,7 +378,7 @@ def extract(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd)
+        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd, tinfoil)
         logger.info('Source tree extracted to %s' % srctree)
 
         if initial_rev:
@@ -402,7 +402,7 @@ def sync(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, rd)
+        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, rd, tinfoil)
         logger.info('Source tree %s synchronized' % srctree)
 
         if initial_rev:
@@ -412,35 +412,6 @@ def sync(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
 
-class BbTaskExecutor(object):
-    """Class for executing bitbake tasks for a recipe
-
-    FIXME: This is very awkward. Unfortunately it's not currently easy to
-    properly execute tasks outside of bitbake itself, until then this has to
-    suffice if we are to handle e.g. linux-yocto's extra tasks
-    """
-
-    def __init__(self, rdata):
-        self.rdata = rdata
-        self.executed = []
-
-    def exec_func(self, func, report):
-        """Run bitbake task function"""
-        if not func in self.executed:
-            deps = self.rdata.getVarFlag(func, 'deps', False)
-            if deps:
-                for taskdepfunc in deps:
-                    self.exec_func(taskdepfunc, True)
-            if report:
-                logger.info('Executing %s...' % func)
-            fn = self.rdata.getVar('FILE', True)
-            localdata = bb.build._task_data(fn, func, self.rdata)
-            try:
-                bb.build.exec_func(func, localdata)
-            except bb.build.FuncFailed as e:
-                raise DevtoolError(str(e))
-            self.executed.append(func)
-
 
 def _prep_extract_operation(config, basepath, recipename, tinfoil=None):
     """HACK: Ugly workaround for making sure that requirements are met when
@@ -464,21 +435,10 @@ def _prep_extract_operation(config, basepath, recipename, tinfoil=None):
     return tinfoil
 
 
-def _extract_source(srctree, keep_temp, devbranch, sync, d):
+def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
     """Extract sources of a recipe"""
-    import bb.event
     import oe.recipeutils
 
-    def eventfilter(name, handler, event, d):
-        """Bitbake event filter for devtool extract operation"""
-        if name == 'base_eventhandler':
-            return True
-        else:
-            return False
-
-    if hasattr(bb.event, 'set_eventfilter'):
-        bb.event.set_eventfilter(eventfilter)
-
     pn = d.getVar('PN', True)
 
     _check_compatible_recipe(pn, d)
@@ -504,19 +464,15 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
         bb.utils.mkdirhier(srctree)
         os.rmdir(srctree)
 
-    # We don't want notes to be printed, they are too verbose
-    origlevel = bb.logger.getEffectiveLevel()
-    if logger.getEffectiveLevel() > logging.DEBUG:
-        bb.logger.setLevel(logging.WARNING)
-
     initial_rev = None
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
+        tinfoil.logger.setLevel(logging.WARNING)
+
         crd = d.createCopy()
         # Make a subdir so we guard against WORKDIR==S
         workdir = os.path.join(tempdir, 'workdir')
         crd.setVar('WORKDIR', workdir)
-        crd.setVar('T', os.path.join(tempdir, 'temp'))
         if not crd.getVar('S', True).startswith(workdir):
             # Usually a shared workdir recipe (kernel, gcc)
             # Try to set a reasonable default
@@ -528,21 +484,55 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
             # We don't want to move the source to STAGING_KERNEL_DIR here
             crd.setVar('STAGING_KERNEL_DIR', '${S}')
 
-        task_executor = BbTaskExecutor(crd)
+        is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
+        if not is_kernel_yocto:
+            crd.setVar('PATCHTOOL', 'git')
+            crd.setVar('PATCH_COMMIT_FUNCTIONS', '1')
+
+        # Apply our changes to the datastore to the server's datastore
+        for key in crd.localkeys():
+            tinfoil.config_data.setVar('%s_pn-%s' % (key, pn), crd.getVar(key, False))
+
+        tinfoil.config_data.setVar('STAMPS_DIR', os.path.join(tempdir, 'stamps'))
+        tinfoil.config_data.setVar('T', os.path.join(tempdir, 'temp'))
+        tinfoil.config_data.setVar('BUILDCFG_FUNCS', '')
+        tinfoil.config_data.setVar('BUILDCFG_HEADER', '')
+
+        tinfoil.set_event_mask(['bb.event.BuildStarted',
+                                'bb.event.BuildCompleted',
+                                'bb.event.TaskStarted',
+                                'logging.LogRecord',
+                                'bb.command.CommandCompleted',
+                                'bb.command.CommandFailed',
+                                'bb.build.TaskStarted',
+                                'bb.build.TaskSucceeded',
+                                'bb.build.TaskFailedSilent'])
+
+        def runtask(target, task):
+            if tinfoil.build_file(target, task):
+                while True:
+                    event = tinfoil.wait_event(0.25)
+                    if event:
+                        if isinstance(event, bb.command.CommandCompleted):
+                            break
+                        elif isinstance(event, bb.command.CommandFailed):
+                            raise DevtoolError('Task do_%s failed: %s' % (task, event.error))
+                        elif isinstance(event, bb.build.TaskStarted):
+                            logger.info('Executing %s...' % event._task)
+                        elif isinstance(event, logging.LogRecord):
+                            if event.levelno <= logging.INFO:
+                                continue
+                            logger.handle(event)
+
+        # we need virtual:native:/path/to/recipe if it's a BBCLASSEXTEND
+        fn = tinfoil.get_recipe_file(pn)
+        runtask(fn, 'unpack')
 
-        crd.setVar('EXTERNALSRC_forcevariable', '')
-
-        logger.info('Fetching %s...' % pn)
-        task_executor.exec_func('do_fetch', False)
-        logger.info('Unpacking...')
-        task_executor.exec_func('do_unpack', False)
         if bb.data.inherits_class('kernel-yocto', d):
             # Extra step for kernel to populate the source directory
-            logger.info('Doing kernel checkout...')
-            task_executor.exec_func('do_kernel_checkout', False)
-        srcsubdir = crd.getVar('S', True)
+            runtask(fn, 'kernel_checkout')
 
-        task_executor.check_git = True
+        srcsubdir = crd.getVar('S', True)
 
         # Move local source files into separate subdir
         recipe_patches = [os.path.basename(patch) for patch in
@@ -572,7 +562,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
                          os.path.basename(fname) not in recipe_patches]
             # Force separate S so that patch files can be left out from srctree
             srcsubdir = tempfile.mkdtemp(dir=workdir)
-            crd.setVar('S', srcsubdir)
+            tinfoil.config_data.setVar('S_task-patch', srcsubdir)
             # Move source files to S
             for path in src_files:
                 _move_file(os.path.join(workdir, path),
@@ -595,10 +585,8 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
         initial_rev = stdout.rstrip()
 
-        crd.setVar('PATCHTOOL', 'git')
-
         logger.info('Patching...')
-        task_executor.exec_func('do_patch', False)
+        runtask(fn, 'patch')
 
         bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
 
@@ -606,7 +594,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
         if bb.data.inherits_class('kernel-yocto', d):
             # Store generate and store kernel config
             logger.info('Generating kernel config')
-            task_executor.exec_func('do_configure', False)
+            runtask(fn, 'configure')
             kconfig = os.path.join(crd.getVar('B', True), '.config')
 
 
@@ -667,8 +655,6 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
             shutil.copy2(kconfig, srctree)
 
     finally:
-        bb.logger.setLevel(origlevel)
-
         if keep_temp:
             logger.info('Preserving temporary directory %s' % tempdir)
         else:
@@ -773,7 +759,7 @@ def modify(args, config, basepath, workspace):
         initial_rev = None
         commits = []
         if not args.no_extract:
-            initial_rev = _extract_source(srctree, False, args.branch, False, rd)
+            initial_rev = _extract_source(srctree, False, args.branch, False, rd, tinfoil)
             if not initial_rev:
                 return 1
             logger.info('Source tree extracted to %s' % srctree)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 52f9ab1..d89e9a2 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -363,7 +363,7 @@ def upgrade(args, config, basepath, workspace):
 
         rf = None
         try:
-            rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, rd)
+            rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, rd, tinfoil)
             rev2, md5, sha256 = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.branch, args.keep_temp,
                                                     tinfoil, rd)
-- 
2.5.5


