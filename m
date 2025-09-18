Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE65CCAC5AA
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:20 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.307.1758229694012141509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=JFLF5Q0d;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20250918210811dfb089dfba00020786-uzxpm9@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250918210811dfb089dfba00020786
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MCOKuvODp83b+76LeJ5NqkYcvabU1izJdajQ6T3uVBM=;
 b=JFLF5Q0dvNcV6X0FtJiMTXTX5jeyQCkGIlgYKLFD1F5Ym/uT7HPSci5hD3kPiAndl/k65t
 +nnEmO05+MM5cJmosQ7/mktxLeL0RfXHQaja14xJMzGhNT1TgKPFflF8umE/SkqPsO0KcQ2n
 pHw5jP2g+7qitGzBL4qVT8orfFN85AbkXEjKvbNfeUVFpk8mPTK4LBq74VmufxX8Tmd6NN8q
 azoWr9+z9SeMiIwiLmgxI5ObeLfui0kpwImQ/xlTly3yejTV8dupDMvmIa+Q3q8LYu9bjKAi
 IIXIYEJduiCLlT66G55Tjumufo26xN3dvbbE8Ebmu9iYNSasN+j69kxg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 05/19] devtool: ide-sdk deploy-target without bitbake
Date: Thu, 18 Sep 2025 23:07:07 +0200
Message-ID: <20250918210754.477049-6-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223669

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The main goal of devtool ide-sdk is to use bitbake for generating
SDKs and consistent IDE configurations for working on the source code of
one or more recipes in workspaces created by devtool modify.
When the IDE is configured for a build system such as CMake or Meson,
the IDE must not invoke bitbake. But bitbake can be called explicitly
whenever something on the recipes changes and the image, the sysroots
or the IDE configuration needs to be updated.

A cross development workflow usually requires the following steps with
clear separation of responsibilities between the IDE and bitbake:
- Setup the complete build environment                 (bitbake-setup)
  - Get the layers:
  - Initialize the build configuration
- Choose some recipes to work on                      (devtool modify)
- Setup the image and the SDK   (devtool ide-sdk, shared sstate-cache)
- Work on the recipe in the workspace                            (IDE)
  - (re-)configure
  - compile
  - run unit tests (on the host with Qemu)
  - remote debuggging on the target device which includes
    - do_install                                          (IDE,pseudo)
    - deploying the artifacts to the target device        (IDE,pseudo)
    - start gdbserver on the target device
    - start GDB on the host device
- Update the SDK and image                          (bitbake, devtool)

For the configure, compile and unit test tasks there is already full
IDE integration, without any call to bitbake. But for the remote
debugging or more precisely for the deployment to the target device,
bitbake gets called which has several disadvantages:

- Bitbake runs a work queue for all tasks of the recipe. There is no
  way to run only the do_install task. Bitbake always tries to find
  out if a previous task needs to be executed and automatically does
  so. Since bitbake has no information about which steps have already
  been executed by the IDE, there is a great chance that bitbake does
  much more than necessary. It could also happen that bitbake ignores
  changes done by the developer in the IDE and overrules some manual
  steps. This leads to a very bad user experience. Therefore it is
  really important to delegate all steps for the application
  development workflow to the IDE and use bitbake only for providing
  and updating the SDK and the image.
  An example of this is that bitbake recompiles everything when a file
  listed in the CONFIGURE_FILES variable is changed. This makes no
  sense in the IDE context and can be extremely tedious.
  The complexity of resolving many dependencies is simply not part of
  an application development workflow. So there is no argument for
  invoking a powerful but heavy tool. Bitbake adds complexity that
  application developers usually don't want to understand or debug.
  As soon as bitbake is needed for daily work, most application
  developers have a defensive attitude towards the overall solution.
  Parsing all recipes, creating task queues and running tasks which
  do not have to be executed makes it very slow, which is another
  major disadvantage.
- bitbake -T (mem-res server mode) could avoid re-parsing. But when
  bitbake is needed to update the SDK or build an image, reparsing
  all recipes is essential. Since inotify has been removed from
  bitbake, the -T option is by design no longer usable to run a
  bitbake server as an IDE backend.
  Starting bitbake with -T requires manually stopping bitbake
  whenever reparsing is expected. That's not intuitive at all.
- Bitbake -b is very quick but ignores bbappends. This is a bug which
  probably could be fixed. But it does not look like the solution for
  the overall problem here anyway.

Therefore a much better user experience can be achieved if all tasks
listed above are calls to a build tool such as cmake or self-contained
scripts which are under control of the IDE. This commit refactors the
code to no longer invoke bitbake for the target-deploy step. The script
which is used by the IDE for the deployment of the artifacts gets
improved to become a self-contained script which uses pseudo but does
not call bitbake anymore.

The script re-implements some bitbake internals and needs to be kept in
sync with bitbake which is not perfect. But refactoring bitbake's code
to become reusable for this script as well looks not feasible at all.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py |  6 +-
 scripts/lib/devtool/ide_sdk.py          | 82 ++++++++++++++++++++-----
 2 files changed, 72 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b92f017b811..f262e0e214c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2599,7 +2599,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         """Verify the scripts referred by the tasks.json file are fine.
 
         This function does not depend on Qemu. Therefore it verifies the scripts
-        exists and the delete step works as expected. But it does not try to
+        exists and the install step works as expected. But it does not try to
         deploy to Qemu.
         """
         recipe_id, recipe_id_pretty = self._get_recipe_ids(recipe_name)
@@ -2614,6 +2614,10 @@ class DevtoolIdeSdkTests(DevtoolBase):
         i_and_d_script_path = os.path.join(
             self._workspace_scripts_dir(recipe_name), i_and_d_script)
         self.assertExists(i_and_d_script_path)
+        i_script = "bb_run_do_install_" + recipe_id
+        install_cmd_path = i_and_d_script_path.replace(i_and_d_script, i_script)
+        self.assertExists(install_cmd_path)
+        runCmd(install_cmd_path, cwd=tempdir)
 
     def _devtool_ide_sdk_qemu(self, tempdir, qemu, recipe_name, example_exe):
         """Verify deployment and execution in Qemu system work for one recipe.
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 931408fa74e..8b347c904e1 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -306,6 +306,9 @@ class RecipeModified:
         self.topdir = None
         self.workdir = None
         self.recipe_id = None
+        # recipe variables from d.getVarFlags
+        self.f_do_install_cleandirs = None
+        self.f_do_install_dirs = None
         # replicate bitbake build environment
         self.exported_vars = None
         self.cmd_compile = None
@@ -374,6 +377,11 @@ class RecipeModified:
         self.topdir = recipe_d.getVar('TOPDIR')
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
 
+        self.f_do_install_cleandirs = recipe_d.getVarFlag(
+            'do_install', 'cleandirs').split()
+        self.f_do_install_dirs = recipe_d.getVarFlag(
+            'do_install', 'dirs').split()
+
         self.__init_exported_variables(recipe_d)
 
         if bb.data.inherits_class('cmake', recipe_d):
@@ -675,6 +683,63 @@ class RecipeModified:
                     binaries.append(abs_name[d_len:])
         return sorted(binaries)
 
+    def gen_fakeroot_install_script(self):
+        """Generate a helper script to execute make install with pseudo
+
+        For the deployment to the target device the do_install task must be
+        executed out of the IDE as well. This function generates a script which
+        runs the run.do_install script from bitbake under pseudo so that it picks
+        up the appropriate file permissions. Generating a self-contained script
+        is much quicker than calling bitbake or devtool build from an IDE.
+        This also avoids that bitbake is calling other tasks which might interfere
+        with the users goals.
+        """
+        cmd_lines = ['#!/bin/sh']
+
+        # Ensure the do compile step gets always executed without pseudo before do install
+        if self.cmd_compile:
+            cmd_compile = "( cd %s && %s)" % (
+                self.real_srctree, self.cmd_compile)
+            cmd_lines.append(cmd_compile)
+
+        # Check run.do_install script is available
+        if not os.access(self.fakerootcmd, os.X_OK):
+            raise DevtoolError(
+                "pseudo executable %s could not be found" % self.fakerootcmd)
+        run_do_install = os.path.join(self.workdir, 'temp', 'run.do_install')
+        if not os.access(run_do_install, os.X_OK):
+            raise DevtoolError(
+                "run script does not exists: %s" % run_do_install)
+
+        # Set up the appropriate environment
+        newenv = dict(os.environ)
+        for varvalue in self.fakerootenv.split():
+            if '=' in varvalue:
+                splitval = varvalue.split('=', 1)
+                newenv[splitval[0]] = splitval[1]
+
+        # Replicate the environment variables from bitbake
+        for var, val in newenv.items():
+            if not RecipeModified.is_valid_shell_variable(var):
+                continue
+            cmd_lines.append('%s="%s"' % (var, val))
+            cmd_lines.append('export %s' % var)
+
+        # Setup the task environment as bitbake would do it based on the varFlags
+        for d in self.f_do_install_cleandirs:
+            cmd_lines.append('%s rm -rf %s' % (self.fakerootcmd, d))
+        for d in self.f_do_install_dirs:
+            cmd_lines.append('%s mkdir -p %s' % (self.fakerootcmd, d))
+        if len(self.f_do_install_dirs) > 0:
+            cmd = "cd %s" % self.f_do_install_dirs[-1]
+            cmd_lines.append('%s || { "%s failed"; exit 1; }' % (cmd, cmd))
+
+        # Finally call run.do_install on pseudo
+        cmd = "%s %s" % (self.fakerootcmd, run_do_install)
+        cmd_lines.append('%s || { echo "%s failed"; exit 1; }' % (cmd, cmd))
+
+        return self.write_script(cmd_lines, 'bb_run_do_install')
+
     def gen_deploy_target_script(self, args):
         """Generate a script which does what devtool deploy-target does
 
@@ -710,22 +775,9 @@ class RecipeModified:
 
     def gen_install_deploy_script(self, args):
         """Generate a script which does install and deploy"""
-        cmd_lines = ['#!/bin/bash']
-
-        # . oe-init-build-env $BUILDDIR
-        # Note: Sourcing scripts with arguments requires bash
-        cmd_lines.append('cd "%s" || { echo "cd %s failed"; exit 1; }' % (
-            self.oe_init_dir, self.oe_init_dir))
-        cmd_lines.append('. "%s" "%s" || { echo ". %s %s failed"; exit 1; }' % (
-            self.oe_init_build_env, self.topdir, self.oe_init_build_env, self.topdir))
-
-        # bitbake -c install
-        cmd_lines.append(
-            'bitbake %s -c install --force || { echo "bitbake %s -c install --force failed"; exit 1; }' % (self.bpn, self.bpn))
-
-        # Self contained devtool deploy-target
+        cmd_lines = ['#!/bin/sh -e']
+        cmd_lines.append(self.gen_fakeroot_install_script())
         cmd_lines.append(self.gen_deploy_target_script(args))
-
         return self.write_script(cmd_lines, 'install_and_deploy')
 
     def write_script(self, cmd_lines, script_name):
-- 
2.51.0


