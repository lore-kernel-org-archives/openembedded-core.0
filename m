Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664EAC3DA70
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 00:23:10 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.45787.1722212581327720985
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 17:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Pi3Y9Mh4;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 7B0F220B7177; Sun, 28 Jul 2024 17:23:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7B0F220B7177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1722212580;
	bh=ebWI/vwy02M/ZqWEA0/CZrXI4mXtrCTD46dR98TSHws=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Pi3Y9Mh4Ty8Dw9USsEQk/QVdLDwrhXNNaQK7S8SU+oLoPoitK2V+jb76TH4S/gjDD
	 7lGf/9AQN9Is/T6JuMyVMjVmAMuSUehJuQd2I4FsxYjWFBya/+u4n7IeTXgOHyj9fW
	 jmaNueDrTnlIdzOr46mHtyjCcXoMt7RzrKj/mxk4=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] classes: add new retain class for retaining build results
Date: Sun, 28 Jul 2024 17:22:43 -0700
Message-Id: <91375a039483ece87de8835f50cf4b4b0ed474ca.1722211934.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1722211934.git.paul.eggleton@linux.microsoft.com>
References: <cover.1722211934.git.paul.eggleton@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 00:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202574

From: Paul Eggleton <paul.eggleton@microsoft.com>

If you are running your builds inside an environment where you don't
have access to the build tree (e.g. an autobuilder where you can only
download final artifacts such as images), then debugging build failures
can be difficult - you can't examine log files, the source tree or
output files. When enabled, by default this class will retain the work
directory for any recipe that has a task failure in the form of a
tarball, and can also be configured to save other directories on failure
or always.

It puts these tarballs in a configurable location (${TMPDIR}/retained by
default), where they can be picked up by a separate process and made
available as downloadable artifacts.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes-global/retain.bbclass     | 162 ++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/retain.py | 219 +++++++++++++++++++++++++++++++++
 2 files changed, 381 insertions(+)
 create mode 100644 meta/classes-global/retain.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/retain.py

diff --git a/meta/classes-global/retain.bbclass b/meta/classes-global/retain.bbclass
new file mode 100644
index 0000000..f71c6a2
--- /dev/null
+++ b/meta/classes-global/retain.bbclass
@@ -0,0 +1,162 @@
+# Creates a tarball of the work directory for a recipe when one of its
+# tasks fails, or any other nominated directories.
+# Useful in cases where the environment in which builds are run is
+# ephemeral or otherwise inaccessible for examination during
+# debugging.
+#
+# To enable, simply add the following to your configuration:
+#
+# INHERIT += "retain"
+#
+# You can specify the recipe-specific directories to save upon failure
+# or always (space-separated) e.g.:
+#
+# RETAIN_DIRS_FAILURE = "${WORKDIR}"    # default
+# RETAIN_DIRS_ALWAYS = "${T}"
+#
+# Naturally you can use overrides to limit it to a specific recipe:
+# RETAIN_DIRS_ALWAYS:pn-somerecipe = "${T}"
+#
+# You can also specify global (non-recipe-specific) directories to save:
+#
+# RETAIN_DIRS_GLOBAL_FAILURE = "${LOG_DIR}"
+# RETAIN_DIRS_GLOBAL_ALWAYS = "${BUILDSTATS_BASE}"
+#
+# If you wish to use a different tarball name prefix you can do so by
+# adding a : followed by the desired prefix (no spaces) in any of the
+# RETAIN_DIRS variables. e.g. to use "buildlogs" as the prefix for the
+# tarball of ${T} you would do this:
+#
+# RETAIN_DIRS_FAILURE = "${T}:buildlogs"
+#
+# Notes:
+# * For this to be useful you also need corresponding logic in your build
+#   orchestration tool to pick up any files written out to RETAIN_OUTDIR
+#   (with the other assumption being that no files are present there at
+#   the start of the build, since there is no logic to purge old files).
+# * Work directories can be quite large, so saving them can take some time
+#   and of course space.
+# * Tarball creation is deferred to the end of the build, thus you will
+#   get the state at the end, not immediately upon failure.
+# * Extra directories must naturally be populated at the time the retain
+#   class goes to save them (build completion); to try ensure this for
+#   things that are also saved on build completion (e.g. buildstats), put
+#   the INHERIT += "retain" after the INHERIT += lines for the class that
+#   is writing out the data that you wish to save.
+# * The tarballs have the tarball name as a top-level directory so that
+#   multiple tarballs can be extracted side-by-side easily.
+#
+# Copyright (c) 2020, 2024 Microsoft Corporation
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+RETAIN_OUTDIR ?= "${TMPDIR}/retained"
+RETAIN_DIRS_FAILURE ?= "${WORKDIR}"
+RETAIN_DIRS_ALWAYS ?= ""
+RETAIN_DIRS_GLOBAL_FAILURE ?= ""
+RETAIN_DIRS_GLOBAL_ALWAYS ?= ""
+RETAIN_TARBALL_SUFFIX ?= "${DATETIME}.tar.gz"
+RETAIN_ENABLED ?= "1"
+
+
+def retain_retain_dir(desc, tarprefix, path, tarbasepath, d):
+    import datetime
+
+    outdir = d.getVar('RETAIN_OUTDIR')
+    bb.utils.mkdirhier(outdir)
+    suffix = d.getVar('RETAIN_TARBALL_SUFFIX')
+    tarname = '%s_%s' % (tarprefix, suffix)
+    tarfp = os.path.join(outdir, '%s' % tarname)
+    tardir = os.path.relpath(path, tarbasepath)
+    cmdargs = ['tar', 'cfa', tarfp]
+    # Prefix paths within the tarball with the tarball name so that
+    # multiple tarballs can be extracted side-by-side
+    cmdargs += ['--transform', 's:^:%s/:' % tarname]
+    cmdargs += [tardir]
+    try:
+        bb.process.run(cmdargs, cwd=tarbasepath)
+    except bb.process.ExecutionError as e:
+        # It is possible for other tasks to be writing to the workdir
+        # while we are tarring it up, in which case tar will return 1,
+        # but we don't care in this situation (tar returns 2 for other
+        # errors so we we will see those)
+        if e.exitcode != 1:
+            bb.warn('retain: error saving %s: %s' % (desc, str(e)))
+
+
+addhandler retain_task_handler
+retain_task_handler[eventmask] = "bb.build.TaskFailed bb.build.TaskSucceeded"
+
+addhandler retain_build_handler
+retain_build_handler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted"
+
+python retain_task_handler() {
+    if d.getVar('RETAIN_ENABLED') != '1':
+        return
+
+    dirs = d.getVar('RETAIN_DIRS_ALWAYS')
+    if isinstance(e, bb.build.TaskFailed):
+        dirs += ' ' + d.getVar('RETAIN_DIRS_FAILURE')
+
+    dirs = dirs.strip().split()
+    if dirs:
+        outdir = d.getVar('RETAIN_OUTDIR')
+        bb.utils.mkdirhier(outdir)
+        dirlist_file = os.path.join(outdir, 'retain_dirs.list')
+        pn = d.getVar('PN')
+        taskname = d.getVar('BB_CURRENTTASK')
+        with open(dirlist_file, 'a') as f:
+            for entry in dirs:
+                f.write('%s %s %s\n' % (pn, taskname, entry))
+}
+
+python retain_build_handler() {
+    outdir = d.getVar('RETAIN_OUTDIR')
+    dirlist_file = os.path.join(outdir, 'retain_dirs.list')
+
+    if isinstance(e, bb.event.BuildStarted):
+        if os.path.exists(dirlist_file):
+            os.remove(dirlist_file)
+        return
+
+    if d.getVar('RETAIN_ENABLED') != '1':
+        return
+
+    savedirs = {}
+    try:
+        with open(dirlist_file, 'r') as f:
+            for line in f:
+                pn, _, path = line.rstrip().split()
+                if not path in savedirs:
+                    savedirs[path] = pn
+        os.remove(dirlist_file)
+    except FileNotFoundError:
+        pass
+
+    if e.getFailures():
+        for path in (d.getVar('RETAIN_DIRS_GLOBAL_FAILURE') or '').strip().split():
+            savedirs[path] = ''
+
+    for path in (d.getVar('RETAIN_DIRS_GLOBAL_ALWAYS') or '').strip().split():
+        savedirs[path] = ''
+
+    if savedirs:
+        bb.plain('NOTE: retain: retaining build output...')
+        count = 0
+        for path, pn in savedirs.items():
+            if ':' in path:
+                path, itemname = path.rsplit(':', 1)
+            else:
+                itemname = os.path.basename(path)
+            if pn:
+                itemname = pn + '_' + itemname
+            if os.path.exists(path):
+                retain_retain_dir(itemname, itemname, path, os.path.dirname(path), d)
+                count += 1
+            else:
+                bb.warn('retain: path %s does not currently exist' % path)
+        if count:
+            item = 'archive' if count == 1 else 'archives'
+            bb.plain('NOTE: retain: saved %d %s to %s' % (count, item, outdir))
+}
diff --git a/meta/lib/oeqa/selftest/cases/retain.py b/meta/lib/oeqa/selftest/cases/retain.py
new file mode 100644
index 0000000..fb8e144
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/retain.py
@@ -0,0 +1,219 @@
+# Tests for retain.bbclass
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import glob
+import fnmatch
+import oe.path
+import shutil
+import tarfile
+from oeqa.utils.commands import bitbake, get_bb_vars
+from oeqa.selftest.case import OESelftestTestCase
+
+class Retain(OESelftestTestCase):
+
+    def test_retain_always(self):
+        """
+        Summary:     Test retain class with RETAIN_DIRS_ALWAYS
+        Expected:    Archive written to RETAIN_OUTDIR when build of test recipe completes
+        Product:     oe-core
+        Author:      Paul Eggleton <paul.eggleton@microsoft.com>
+        """
+
+        test_recipe = 'quilt-native'
+
+        features = 'INHERIT += "retain"\n'
+        features += 'RETAIN_DIRS_ALWAYS = "${T}"\n'
+        self.write_config(features)
+
+        bitbake('-c clean %s' % test_recipe)
+
+        bb_vars = get_bb_vars(['RETAIN_OUTDIR', 'TMPDIR'])
+        retain_outdir = bb_vars['RETAIN_OUTDIR'] or ''
+        tmpdir = bb_vars['TMPDIR']
+        if len(retain_outdir) < 5:
+            self.fail('RETAIN_OUTDIR value "%s" is invalid' % retain_outdir)
+        if not oe.path.is_path_parent(tmpdir, retain_outdir):
+            self.fail('RETAIN_OUTDIR (%s) is not underneath TMPDIR (%s)' % (retain_outdir, tmpdir))
+        try:
+            shutil.rmtree(retain_outdir)
+        except FileNotFoundError:
+            pass
+
+        bitbake(test_recipe)
+        if not glob.glob(os.path.join(retain_outdir, '%s_temp_*.tar.gz' % test_recipe)):
+            self.fail('No output archive for %s created' % test_recipe)
+
+
+    def test_retain_failure(self):
+        """
+        Summary:     Test retain class default behaviour
+        Expected:    Archive written to RETAIN_OUTDIR only when build of test
+                     recipe fails, and archive contents are as expected
+        Product:     oe-core
+        Author:      Paul Eggleton <paul.eggleton@microsoft.com>
+        """
+
+        test_recipe_fail = 'error'
+        test_recipe_fail_version = '1.0'
+
+        features = 'INHERIT += "retain"\n'
+        self.write_config(features)
+
+        bb_vars = get_bb_vars(['RETAIN_OUTDIR', 'TMPDIR'])
+        retain_outdir = bb_vars['RETAIN_OUTDIR'] or ''
+        tmpdir = bb_vars['TMPDIR']
+        if len(retain_outdir) < 5:
+            self.fail('RETAIN_OUTDIR value "%s" is invalid' % retain_outdir)
+        if not oe.path.is_path_parent(tmpdir, retain_outdir):
+            self.fail('RETAIN_OUTDIR (%s) is not underneath TMPDIR (%s)' % (retain_outdir, tmpdir))
+
+        try:
+            shutil.rmtree(retain_outdir)
+        except FileNotFoundError:
+            pass
+
+        bitbake('-c clean %s' % test_recipe_fail)
+
+        if os.path.exists(retain_outdir) and os.listdir(retain_outdir):
+            self.fail('RETAIN_OUTDIR should be empty without failure')
+
+        result = bitbake('-c compile %s' % test_recipe_fail, ignore_status=True)
+        if result.status == 0:
+            self.fail('Build of %s did not fail as expected' % test_recipe_fail)
+
+        archive = glob.glob(os.path.join(retain_outdir, '%s_*.tar.gz' % test_recipe_fail))
+        if not archive:
+            self.fail('No output archive for %s created' % test_recipe_fail)
+        if len(archive) > 1:
+            self.fail('More than one archive for %s created' % test_recipe_fail)
+        found = False
+        with tarfile.open(archive[0]) as tf:
+            for ti in tf:
+                if not fnmatch.fnmatch(ti.name, '%s_%s_*/*' % (test_recipe_fail, test_recipe_fail_version)):
+                    self.fail('File without recipe-named subdirectory in tarball')
+                if ti.name.endswith('/temp/log.do_compile'):
+                    found = True
+        if not found:
+            self.fail('Did not find log.do_compile in output archive')
+
+
+    def test_retain_global(self):
+        """
+        Summary:     Test retain class RETAIN_DIRS_GLOBAL_* behaviour
+        Expected:    Ensure RETAIN_DIRS_GLOBAL_ALWAYS always causes an
+                     archive to be created, and RETAIN_DIRS_GLOBAL_FAILURE
+                     only causes an archive to be created on failure.
+                     Also test archive naming (with : character) as an
+                     added bonus.
+        Product:     oe-core
+        Author:      Paul Eggleton <paul.eggleton@microsoft.com>
+        """
+
+        test_recipe = 'quilt-native'
+        test_recipe_fail = 'error'
+
+        features = 'INHERIT += "retain"\n'
+        features += 'RETAIN_DIRS_GLOBAL_ALWAYS = "${LOG_DIR}:buildlogs"\n'
+        features += 'RETAIN_DIRS_GLOBAL_FAILURE = "${STAMPS_DIR}"\n'
+        self.write_config(features)
+
+        bitbake('-c clean %s' % test_recipe)
+
+        bb_vars = get_bb_vars(['RETAIN_OUTDIR', 'TMPDIR', 'STAMPS_DIR'])
+        retain_outdir = bb_vars['RETAIN_OUTDIR'] or ''
+        tmpdir = bb_vars['TMPDIR']
+        if len(retain_outdir) < 5:
+            self.fail('RETAIN_OUTDIR value "%s" is invalid' % retain_outdir)
+        if not oe.path.is_path_parent(tmpdir, retain_outdir):
+            self.fail('RETAIN_OUTDIR (%s) is not underneath TMPDIR (%s)' % (retain_outdir, tmpdir))
+        try:
+            shutil.rmtree(retain_outdir)
+        except FileNotFoundError:
+            pass
+
+        # Test success case
+        bitbake(test_recipe)
+        if not glob.glob(os.path.join(retain_outdir, 'buildlogs_*.tar.gz')):
+            self.fail('No output archive for LOG_DIR created')
+        stamps_dir = bb_vars['STAMPS_DIR']
+        if glob.glob(os.path.join(retain_outdir, '%s_*.tar.gz' % os.path.basename(stamps_dir))):
+            self.fail('Output archive for STAMPS_DIR created when it should not have been')
+
+        # Test failure case
+        result = bitbake('-c compile %s' % test_recipe_fail, ignore_status=True)
+        if result.status == 0:
+            self.fail('Build of %s did not fail as expected' % test_recipe_fail)
+        if not glob.glob(os.path.join(retain_outdir, '%s_*.tar.gz' % os.path.basename(stamps_dir))):
+            self.fail('Output archive for STAMPS_DIR not created')
+        if len(glob.glob(os.path.join(retain_outdir, 'buildlogs_*.tar.gz'))) != 2:
+            self.fail('Should be exactly two buildlogs archives in output dir')
+
+
+    def test_retain_misc(self):
+        """
+        Summary:     Test retain class with RETAIN_ENABLED and RETAIN_TARBALL_SUFFIX
+        Expected:    Archive written to RETAIN_OUTDIR only when RETAIN_ENABLED is set
+                     and archive contents are as expected. Also test archive naming
+                     (with : character) as an added bonus.
+        Product:     oe-core
+        Author:      Paul Eggleton <paul.eggleton@microsoft.com>
+        """
+
+        test_recipe_fail = 'error'
+        test_recipe_fail_version = '1.0'
+
+        features = 'INHERIT += "retain"\n'
+        features += 'RETAIN_DIRS_ALWAYS = "${T}"\n'
+        features += 'RETAIN_ENABLED = "0"\n'
+        self.write_config(features)
+
+        bb_vars = get_bb_vars(['RETAIN_OUTDIR', 'TMPDIR'])
+        retain_outdir = bb_vars['RETAIN_OUTDIR'] or ''
+        tmpdir = bb_vars['TMPDIR']
+        if len(retain_outdir) < 5:
+            self.fail('RETAIN_OUTDIR value "%s" is invalid' % retain_outdir)
+        if not oe.path.is_path_parent(tmpdir, retain_outdir):
+            self.fail('RETAIN_OUTDIR (%s) is not underneath TMPDIR (%s)' % (retain_outdir, tmpdir))
+
+        try:
+            shutil.rmtree(retain_outdir)
+        except FileNotFoundError:
+            pass
+
+        bitbake('-c clean %s' % test_recipe_fail)
+        result = bitbake('-c compile %s' % test_recipe_fail, ignore_status=True)
+        if result.status == 0:
+            self.fail('Build of %s did not fail as expected' % test_recipe_fail)
+
+        if os.path.exists(retain_outdir) and os.listdir(retain_outdir):
+            self.fail('RETAIN_OUTDIR should be empty with RETAIN_ENABLED = "0"')
+
+        features = 'INHERIT += "retain"\n'
+        features += 'RETAIN_DIRS_ALWAYS = "${T}:recipelogs"\n'
+        features += 'RETAIN_TARBALL_SUFFIX = "${DATETIME}-testsuffix.tar.bz2"\n'
+        features += 'RETAIN_ENABLED = "1"\n'
+        self.write_config(features)
+
+        result = bitbake('-c compile %s' % test_recipe_fail, ignore_status=True)
+        if result.status == 0:
+            self.fail('Build of %s did not fail as expected' % test_recipe_fail)
+
+        archive = glob.glob(os.path.join(retain_outdir, '%s_*-testsuffix.tar.bz2' % test_recipe_fail))
+        if not archive:
+            self.fail('No output archive for %s created' % test_recipe_fail)
+        if len(archive) != 2:
+            self.fail('Two archives for %s expected, but %d exist' % (test_recipe_fail, len(archive)))
+        found = False
+        with tarfile.open(archive[0], 'r:bz2') as tf:
+            for ti in tf:
+                if not fnmatch.fnmatch(ti.name, '%s_%s_*/*' % (test_recipe_fail, test_recipe_fail_version)):
+                    self.fail('File without recipe-named subdirectory in tarball')
+                if ti.name.endswith('/log.do_compile'):
+                    found = True
+        if not found:
+            self.fail('Did not find log.do_compile in output archive')
-- 
1.8.3.1


