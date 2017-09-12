Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 08C37783DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 10:18:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2017 03:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,382,1500966000"; d="scan'208";a="1194168347"
Received: from nrahulx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2017 03:18:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2017 22:18:38 +1200
Message-Id: <60de8119fc92e3c61f7c616e560f1637e15f98ac.1505211385.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1505211385.git.paul.eggleton@linux.intel.com>
References: <cover.1505211385.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] devtool: rework source extraction so that dependencies are handled
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
X-List-Received-Date: Tue, 12 Sep 2017 10:18:55 -0000

Since it was first implemented, devtool's source extraction (as used by
the devtool modify, extract and upgrade subcommands) ignored other recipe
dependencies - so for example if you ran devtool modify on a recipe that
fetches from svn or is compressed using xz then it would fail if those
dependencies hadn't been built first. Now that we can execute tasks in
the normal way (i.e. tinfoil.build_targets()) then we can rework it to
use that. This is slightly tricky in that the source extraction needs to
insert some logic in between tasks; luckily we can use a helper class
that conditionally adds prefuncs to make that possible.

Some side-effects / aspects of this change worth noting:
* Operations are a little slower because we have to go through the task
  dependency graph generation and other startup processing. There's not
  really any way to avoid this though.
* devtool extract didn't used to require a workspace, now it does
  because it needs to create a temporary bbappend for the recipe. (As
  with other commands the workspace be created on the fly if it doesn't
  already exist.)
* Since we are creating (or modifying) a bbappend on the fly after the
  initial cache load has taken place, we need to ensure that this gets
  noticed otherwise it won't have any effect. In order to do this
  properly with the way cooker currently works, we have to be able to
  set its parsecache_valid flag to False. A new invalidateParseCache
  command on the bitbake side makes this possible.
* I want any existing sysroot files and stamps to be left alone during
  extraction since we are running the tasks off to the side, and
  especially devtool extract should be able to be used without touching
  these. However, this was hampered by the automatic removal process in
  sstate.bbclass triggered by bb.event.ReachableStamps when the task
  signatures change, thus I had to introduce a way to disable this
  removal on a per-recipe basis (we still want it to function for any
  dependencies that we aren't working on). To implement this I elected
  to use a file written to tmp/sstate-control which gets deleted
  automatically after reading so that there's less chance of stale files
  affecting future sessions. I could have used a variable but this would
  have needed to be whitelisted and I'd have to have poked its value in
  using the setVariable command.

Fixes [YOCTO #11198].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/devtool-source.bbclass     | 165 +++++++++++++++++++++++++
 meta/classes/sstate.bbclass             |   9 +-
 meta/lib/oeqa/selftest/cases/devtool.py |  10 +-
 scripts/lib/devtool/standard.py         | 208 ++++++++++----------------------
 scripts/lib/devtool/upgrade.py          |   2 +-
 5 files changed, 241 insertions(+), 153 deletions(-)
 create mode 100644 meta/classes/devtool-source.bbclass

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
new file mode 100644
index 0000000..8f5bc86
--- /dev/null
+++ b/meta/classes/devtool-source.bbclass
@@ -0,0 +1,165 @@
+# Development tool - source extraction helper class
+#
+# NOTE: this class is intended for use by devtool and should not be
+# inherited manually.
+#
+# Copyright (C) 2014-2017 Intel Corporation
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
+
+DEVTOOL_TEMPDIR ?= ""
+DEVTOOL_PATCH_SRCDIR = "${DEVTOOL_TEMPDIR}/patchworkdir"
+
+
+python() {
+    tempdir = d.getVar('DEVTOOL_TEMPDIR')
+
+    if not tempdir:
+        bb.fatal('devtool-source class is for internal use by devtool only')
+
+    # Make a subdir so we guard against WORKDIR==S
+    workdir = os.path.join(tempdir, 'workdir')
+    d.setVar('WORKDIR', workdir)
+    if not d.getVar('S').startswith(workdir):
+        # Usually a shared workdir recipe (kernel, gcc)
+        # Try to set a reasonable default
+        if bb.data.inherits_class('kernel', d):
+            d.setVar('S', '${WORKDIR}/source')
+        else:
+            d.setVar('S', '${WORKDIR}/%s' % os.path.basename(d.getVar('S')))
+    if bb.data.inherits_class('kernel', d):
+        # We don't want to move the source to STAGING_KERNEL_DIR here
+        d.setVar('STAGING_KERNEL_DIR', '${S}')
+
+    d.setVar('STAMPS_DIR', os.path.join(tempdir, 'stamps'))
+    d.setVar('T', os.path.join(tempdir, 'temp'))
+
+    # Hook in pre/postfuncs
+    is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
+    if is_kernel_yocto:
+        unpacktask = 'do_kernel_checkout'
+        d.appendVarFlag('do_configure', 'postfuncs', ' devtool_post_configure')
+    else:
+        unpacktask = 'do_unpack'
+    d.appendVarFlag(unpacktask, 'postfuncs', ' devtool_post_unpack')
+    d.prependVarFlag('do_patch', 'prefuncs', ' devtool_pre_patch')
+    d.appendVarFlag('do_patch', 'postfuncs', ' devtool_post_patch')
+
+    # NOTE: in order for the patch stuff to be fully functional,
+    # PATCHTOOL and PATCH_COMMIT_FUNCTIONS need to be set; we can't
+    # do that here because we can't guarantee the order of the anonymous
+    # functions, so it gets done in the bbappend we create.
+}
+
+
+python devtool_post_unpack() {
+    import oe.recipeutils
+    import shutil
+    sys.path.insert(0, os.path.join(d.getVar('COREBASE'), 'scripts', 'lib'))
+    import scriptutils
+    from devtool import setup_git_repo
+
+    tempdir = d.getVar('DEVTOOL_TEMPDIR')
+    workdir = d.getVar('WORKDIR')
+    srcsubdir = d.getVar('S')
+
+    def _move_file(src, dst):
+        """Move a file. Creates all the directory components of destination path."""
+        dst_d = os.path.dirname(dst)
+        if dst_d:
+            bb.utils.mkdirhier(dst_d)
+        shutil.move(src, dst)
+
+    def _ls_tree(directory):
+        """Recursive listing of files in a directory"""
+        ret = []
+        for root, dirs, files in os.walk(directory):
+            ret.extend([os.path.relpath(os.path.join(root, fname), directory) for
+                        fname in files])
+        return ret
+
+    # Move local source files into separate subdir
+    recipe_patches = [os.path.basename(patch) for patch in
+                        oe.recipeutils.get_recipe_patches(d)]
+    local_files = oe.recipeutils.get_recipe_local_files(d)
+
+    # Ignore local files with subdir={BP}
+    srcabspath = os.path.abspath(srcsubdir)
+    local_files = [fname for fname in local_files if
+                    os.path.exists(os.path.join(workdir, fname)) and
+                    (srcabspath == workdir or not
+                    os.path.join(workdir, fname).startswith(srcabspath +
+                        os.sep))]
+    if local_files:
+        for fname in local_files:
+            _move_file(os.path.join(workdir, fname),
+                        os.path.join(tempdir, 'oe-local-files', fname))
+        with open(os.path.join(tempdir, 'oe-local-files', '.gitignore'),
+                    'w') as f:
+            f.write('# Ignore local files, by default. Remove this file '
+                    'if you want to commit the directory to Git\n*\n')
+
+    if srcsubdir == workdir:
+        # Find non-patch non-local sources that were "unpacked" to srctree
+        # directory
+        src_files = [fname for fname in _ls_tree(workdir) if
+                        os.path.basename(fname) not in recipe_patches]
+        srcsubdir = d.getVar('DEVTOOL_PATCH_SRCDIR')
+        # Move source files to S
+        for path in src_files:
+            _move_file(os.path.join(workdir, path),
+                        os.path.join(srcsubdir, path))
+    elif os.path.dirname(srcsubdir) != workdir:
+        # Handle if S is set to a subdirectory of the source
+        srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir, workdir).split(os.sep)[0])
+
+    scriptutils.git_convert_standalone_clone(srcsubdir)
+
+    # Make sure that srcsubdir exists
+    bb.utils.mkdirhier(srcsubdir)
+    if not os.listdir(srcsubdir):
+        bb.warn("No source unpacked to S - either the %s recipe "
+                "doesn't use any source or the correct source "
+                "directory could not be determined" % d.getVar('PN'))
+
+    devbranch = d.getVar('DEVTOOL_DEVBRANCH')
+    setup_git_repo(srcsubdir, d.getVar('PV'), devbranch, d=d)
+
+    (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
+    initial_rev = stdout.rstrip()
+    with open(os.path.join(tempdir, 'initial_rev'), 'w') as f:
+        f.write(initial_rev)
+
+    with open(os.path.join(tempdir, 'srcsubdir'), 'w') as f:
+        f.write(srcsubdir)
+}
+
+python devtool_pre_patch() {
+    if d.getVar('S') == d.getVar('WORKDIR'):
+        d.setVar('S', '${DEVTOOL_PATCH_SRCDIR}')
+}
+
+python devtool_post_patch() {
+    tempdir = d.getVar('DEVTOOL_TEMPDIR')
+    with open(os.path.join(tempdir, 'srcsubdir'), 'r') as f:
+        srcsubdir = f.read()
+    bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
+}
+
+python devtool_post_configure() {
+    import shutil
+    tempdir = d.getVar('DEVTOOL_TEMPDIR')
+    shutil.copy2(os.path.join(d.getVar('B'), '.config'), tempdir)
+}
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6af0d38..2a54993 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1015,6 +1015,11 @@ python sstate_eventhandler2() {
     d = e.data
     stamps = e.stamps.values()
     removeworkdir = (d.getVar("SSTATE_PRUNE_OBSOLETEWORKDIR", False) == "1")
+    preservestampfile = d.expand('${SSTATE_MANIFESTS}/preserve-stamps')
+    preservestamps = []
+    if os.path.exists(preservestampfile):
+        with open(preservestampfile, 'r') as f:
+            preservestamps = f.readlines()
     seen = []
     for a in d.getVar("SSTATE_ARCHS").split():
         toremove = []
@@ -1025,7 +1030,7 @@ python sstate_eventhandler2() {
             lines = f.readlines()
             for l in lines:
                 (stamp, manifest, workdir) = l.split()
-                if stamp not in stamps:
+                if stamp not in stamps and stamp not in preservestamps:
                     toremove.append(l)
                     if stamp not in seen:
                         bb.debug(2, "Stamp %s is not reachable, removing related manifests" % stamp)
@@ -1047,4 +1052,6 @@ python sstate_eventhandler2() {
         with open(i, "w") as f:
             for l in lines:
                 f.write(l)
+    if preservestamps:
+        os.remove(preservestampfile)
 }
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c17131a..165dcba 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1073,7 +1073,7 @@ class DevtoolTests(DevtoolBase):
 
     @OETestID(1628)
     def test_devtool_update_recipe_local_files_subdir(self):
-        # Try devtool extract on a recipe that has a file with subdir= set in
+        # Try devtool update-recipe on a recipe that has a file with subdir= set in
         # SRC_URI such that it overwrites a file that was in an archive that
         # was also in SRC_URI
         # First, modify the recipe
@@ -1103,10 +1103,10 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool extract matchbox-terminal %s' % tempdir)
         self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
-        # devtool extract shouldn't create the workspace
-        self.assertNotExists(self.workspacedir)
         self._check_src_repo(tempdir)
 
     @OETestID(1379)
@@ -1114,10 +1114,10 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool extract virtual/make %s' % tempdir)
         self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
-        # devtool extract shouldn't create the workspace
-        self.assertNotExists(self.workspacedir)
         self._check_src_repo(tempdir)
 
     @OETestID(1168)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 0998fa7..96c4d0f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -387,7 +387,7 @@ def extract(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd, tinfoil)
+        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, config, rd, tinfoil)
         logger.info('Source tree extracted to %s' % srctree)
 
         if initial_rev:
@@ -411,7 +411,7 @@ def sync(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, rd, tinfoil)
+        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, config, rd, tinfoil)
         logger.info('Source tree %s synchronized' % srctree)
 
         if initial_rev:
@@ -422,9 +422,10 @@ def sync(args, config, basepath, workspace):
         tinfoil.shutdown()
 
 
-def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
+def _extract_source(srctree, keep_temp, devbranch, sync, config, d, tinfoil):
     """Extract sources of a recipe"""
     import oe.recipeutils
+    import oe.patch
 
     pn = d.getVar('PN')
 
@@ -446,15 +447,18 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
             raise DevtoolError("The %s recipe has do_unpack disabled, unable to "
                                "extract source" % pn, 4)
 
-    if bb.data.inherits_class('kernel-yocto', d):
-        tinfoil.build_targets('kern-tools-native')
-
     if not sync:
         # Prepare for shutil.move later on
         bb.utils.mkdirhier(srctree)
         os.rmdir(srctree)
 
     initial_rev = None
+
+    appendexisted = False
+    recipefile = d.getVar('FILE')
+    appendfile = recipe_to_append(recipefile, config)
+    is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
+
     # We need to redirect WORKDIR, STAMPS_DIR etc. under a temporary
     # directory so that:
     # (a) we pick up all files that get unpacked to the WORKDIR, and
@@ -473,147 +477,55 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
     try:
         tinfoil.logger.setLevel(logging.WARNING)
 
-        crd = d.createCopy()
-        # Make a subdir so we guard against WORKDIR==S
-        workdir = os.path.join(tempdir, 'workdir')
-        crd.setVar('WORKDIR', workdir)
-        if not crd.getVar('S').startswith(workdir):
-            # Usually a shared workdir recipe (kernel, gcc)
-            # Try to set a reasonable default
-            if bb.data.inherits_class('kernel', d):
-                crd.setVar('S', '${WORKDIR}/source')
+        if os.path.exists(appendfile):
+            appendbackup = os.path.join(tempdir, os.path.basename(appendfile) + '.bak')
+            shutil.copyfile(appendfile, appendbackup)
+        else:
+            appendbackup = None
+            bb.utils.mkdirhier(os.path.dirname(appendfile))
+        logger.debug('writing append file %s' % appendfile)
+        with open(appendfile, 'a') as f:
+            f.write('###--- _extract_source\n')
+            f.write('DEVTOOL_TEMPDIR = "%s"\n' % tempdir)
+            f.write('DEVTOOL_DEVBRANCH = "%s"\n' % devbranch)
+            if not is_kernel_yocto:
+                f.write('PATCHTOOL = "git"\n')
+                f.write('PATCH_COMMIT_FUNCTIONS = "1"\n')
+            f.write('inherit devtool-source\n')
+            f.write('###--- _extract_source\n')
+
+        # FIXME this results in the cache reload under control of tinfoil, which is fine
+        # except we don't get the knotty progress bar
+        tinfoil.run_command('invalidateParseCache')
+
+        sstate_manifests = d.getVar('SSTATE_MANIFESTS')
+        bb.utils.mkdirhier(sstate_manifests)
+        preservestampfile = os.path.join(sstate_manifests, 'preserve-stamps')
+        with open(preservestampfile, 'w') as f:
+            f.write(d.getVar('STAMP'))
+        try:
+            if bb.data.inherits_class('kernel-yocto', d):
+                # We need to generate the kernel config
+                task = 'do_configure'
             else:
-                crd.setVar('S', '${WORKDIR}/%s' % os.path.basename(d.getVar('S')))
-        if bb.data.inherits_class('kernel', d):
-            # We don't want to move the source to STAGING_KERNEL_DIR here
-            crd.setVar('STAGING_KERNEL_DIR', '${S}')
-
-        is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
-        if not is_kernel_yocto:
-            crd.setVar('PATCHTOOL', 'git')
-            crd.setVar('PATCH_COMMIT_FUNCTIONS', '1')
-
-        # Apply our changes to the datastore to the server's datastore
-        for key in crd.localkeys():
-            tinfoil.config_data.setVar('%s_pn-%s' % (key, pn), crd.getVar(key, False))
-
-        tinfoil.config_data.setVar('STAMPS_DIR', os.path.join(tempdir, 'stamps'))
-        tinfoil.config_data.setVar('T', os.path.join(tempdir, 'temp'))
-        tinfoil.config_data.setVar('BUILDCFG_FUNCS', '')
-        tinfoil.config_data.setVar('BUILDCFG_HEADER', '')
-        tinfoil.config_data.setVar('BB_HASH_IGNORE_MISMATCH', '1')
-
-        tinfoil.set_event_mask(['bb.event.BuildStarted',
-                                'bb.event.BuildCompleted',
-                                'logging.LogRecord',
-                                'bb.command.CommandCompleted',
-                                'bb.command.CommandFailed',
-                                'bb.cooker.CookerExit',
-                                'bb.build.TaskStarted',
-                                'bb.build.TaskSucceeded',
-                                'bb.build.TaskFailed',
-                                'bb.build.TaskFailedSilent'])
-
-        def runtask(target, task):
-            error = False
-            if tinfoil.build_file(target, task):
-                while True:
-                    event = tinfoil.wait_event(0.25)
-                    if event:
-                        if isinstance(event, bb.command.CommandCompleted):
-                            break
-                        elif isinstance(event, bb.cooker.CookerExit):
-                            # The server is going away, so drop the connection
-                            tinfoil.server_connection = None
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
-                            if event.levelno >= logging.ERROR:
-                                error = True
-                            logger.handle(event)
-                if error:
-                    raise DevtoolError('An error occurred during do_%s, exiting' % task)
-
-        # we need virtual:native:/path/to/recipe if it's a BBCLASSEXTEND
-        fn = tinfoil.get_recipe_file(pn)
-        runtask(fn, 'unpack')
-
-        if bb.data.inherits_class('kernel-yocto', d):
-            # Extra step for kernel to populate the source directory
-            runtask(fn, 'kernel_checkout')
-
-        srcsubdir = crd.getVar('S')
-
-        # Move local source files into separate subdir
-        recipe_patches = [os.path.basename(patch) for patch in
-                          oe.recipeutils.get_recipe_patches(crd)]
-        local_files = oe.recipeutils.get_recipe_local_files(crd)
-
-        # Ignore local files with subdir={BP}
-        srcabspath = os.path.abspath(srcsubdir)
-        local_files = [fname for fname in local_files if
-                       os.path.exists(os.path.join(workdir, fname)) and
-                       (srcabspath == workdir or not
-                       os.path.join(workdir, fname).startswith(srcabspath +
-                           os.sep))]
-        if local_files:
-            for fname in local_files:
-                _move_file(os.path.join(workdir, fname),
-                           os.path.join(tempdir, 'oe-local-files', fname))
-            with open(os.path.join(tempdir, 'oe-local-files', '.gitignore'),
-                      'w') as f:
-                f.write('# Ignore local files, by default. Remove this file '
-                        'if you want to commit the directory to Git\n*\n')
-
-        if srcsubdir == workdir:
-            # Find non-patch non-local sources that were "unpacked" to srctree
-            # directory
-            src_files = [fname for fname in _ls_tree(workdir) if
-                         os.path.basename(fname) not in recipe_patches]
-            # Force separate S so that patch files can be left out from srctree
-            srcsubdir = tempfile.mkdtemp(dir=workdir)
-            tinfoil.config_data.setVar('S_task-patch', srcsubdir)
-            # Move source files to S
-            for path in src_files:
-                _move_file(os.path.join(workdir, path),
-                           os.path.join(srcsubdir, path))
-        elif os.path.dirname(srcsubdir) != workdir:
-            # Handle if S is set to a subdirectory of the source
-            srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir, workdir).split(os.sep)[0])
-
-        scriptutils.git_convert_standalone_clone(srcsubdir)
-
-        # Make sure that srcsubdir exists
-        bb.utils.mkdirhier(srcsubdir)
-        if not os.path.exists(srcsubdir) or not os.listdir(srcsubdir):
-            logger.warning("no source unpacked to S, either the %s recipe "
-                           "doesn't use any source or the correct source "
-                           "directory could not be determined" % pn)
-
-        setup_git_repo(srcsubdir, crd.getVar('PV'), devbranch, d=d)
-
-        (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
-        initial_rev = stdout.rstrip()
+                task = 'do_patch'
 
-        logger.info('Patching...')
-        runtask(fn, 'patch')
+            # Run the fetch + unpack tasks
+            res = tinfoil.build_targets(pn,
+                                        task,
+                                        handle_events=True)
+        finally:
+            if os.path.exists(preservestampfile):
+                os.remove(preservestampfile)
 
-        bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
+        if not res:
+            raise DevtoolError('Extracting source for %s failed' % pn)
 
-        kconfig = None
-        if bb.data.inherits_class('kernel-yocto', d):
-            # Store generate and store kernel config
-            logger.info('Generating kernel config')
-            runtask(fn, 'configure')
-            kconfig = os.path.join(crd.getVar('B'), '.config')
+        with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:
+            initial_rev = f.read()
 
+        with open(os.path.join(tempdir, 'srcsubdir'), 'r') as f:
+            srcsubdir = f.read()
 
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
         srctree_localdir = os.path.join(srctree, 'oe-local-files')
@@ -667,11 +579,15 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
                 oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
                 bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
 
-        if kconfig:
+        if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
-            shutil.copy2(kconfig, srctree)
+            shutil.copy2(os.path.join(tempdir, '.config'), srctree)
 
     finally:
+        if appendbackup:
+            shutil.copyfile(appendbackup, appendfile)
+        elif os.path.exists(appendfile):
+            os.remove(appendfile)
         if keep_temp:
             logger.info('Preserving temporary directory %s' % tempdir)
         else:
@@ -774,7 +690,7 @@ def modify(args, config, basepath, workspace):
         initial_rev = None
         commits = []
         if not args.no_extract:
-            initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd, tinfoil)
+            initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, config, rd, tinfoil)
             if not initial_rev:
                 return 1
             logger.info('Source tree extracted to %s' % srctree)
@@ -1852,7 +1768,7 @@ def register_commands(subparsers, context):
     parser_extract.add_argument('srctree', help='Path to where to extract the source tree')
     parser_extract.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (default "%(default)s")')
     parser_extract.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
-    parser_extract.set_defaults(func=extract, no_workspace=True)
+    parser_extract.set_defaults(func=extract)
 
     parser_sync = subparsers.add_parser('sync', help='Synchronize the source tree for an existing recipe',
                                        description='Synchronize the previously extracted source tree for an existing recipe',
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 41bd34e..39d0bd7 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -418,7 +418,7 @@ def upgrade(args, config, basepath, workspace):
 
         rf = None
         try:
-            rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, rd, tinfoil)
+            rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, rd, tinfoil)
             rev2, md5, sha256, srcbranch = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
-- 
2.9.5


