Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D40EC88E69
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:06:45 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5784.1789329997495218199
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=nwXxMZlq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260913200634efcabe5a8100020790-acaps7@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260913200634efcabe5a8100020790
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 22:06:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9jJQMNmagzGNM+wgZN1HAbHgXELxxZ9axRy6vxbJanA=;
 b=nwXxMZlqutlT0aGJBrUtQPy53JDHOkJQSsA5oW+35iehRPuxdEJj6yvebrU3jZWw6Ow95J
 qLY6QEa1tiMWzHVLiEEROCvWryrgJMIPvDr2Bn1m5RrTSlbchOhoKH3ru42aq8VbwFeJ+bsb
 tbvhdYj4XB3HJR0b3/upzBYIhvoU7qKKrZNb/hcK6AIrs+plVd4oSpjWCBP1OM6ID0t5lQFx
 pmwS15e9NryaVtE35uKFkJUR4hCVLqVlQ+AzRCh0NCZysltlNAygGLF7ABlFbuDH6xe2n7G8
 IOiU/Sf/51DDdZ2EG4BiXYu0cq1XnPSpyAF6AXVUxpZutyoPKo1Nfewg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/6] oe-selftest: devtool ide-sdk: consolidate GCC/Clang ide-sdk tests
Date: Sun, 13 Sep 2026 22:05:54 +0200
Message-ID: <20260913200624.331753-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260913200624.331753-1-adrian.freihofer@siemens.com>
References: <20260913200624.331753-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245724

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Clang support was mostly added as separate commits from GCC's, leaving
DevtoolIdeSdkGccTests and DevtoolIdeSdkClangTests with their own, mostly
duplicated tests: ide=code and ide=none were each verified with a
separate image build/qemu boot, and the NFS/slirp variants ran their own
thin, single-recipe flows on top of that. That added qemu boots and
image builds for little extra coverage.

Now that a single devtool ide-sdk call can generate configs for multiple
IDEs at once, and Clang/LLDB support is on parity with GCC, consolidate
this into one framework function,
DevtoolIdeSdkTests._test_devtool_ide_sdk_code_and_none_qemu(nfs, slirp).
It covers cmake+meson with --ide=code,none in a single image build/qemu
boot per test (cutting the previous per-toolchain builds/boots from 3 to
1 for GCC and 4 to 1 for Clang for the same coverage), and takes nfs/slirp
flags to cover the NFS-root and slirp-networking variants without
duplicating the whole flow per variant. Per-toolchain differences stay
behind hooks (_ide_sdk_package_opts, _verify_cross_debugger,
_verify_recipe_ide_sdk, _verify_nfs_launch_json) overridden by each
subclass; test cases become thin wrappers calling the shared function
with different parameters.

This cuts autobuilder qemu boots/image builds while keeping equivalent
coverage, and brings Clang up to the same NFS/slirp coverage as GCC.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 988 ++++++++++--------------
 1 file changed, 412 insertions(+), 576 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 59d9de26a9..84e020cd3d 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3112,11 +3112,19 @@ class DevtoolIdeSdkTests(DevtoolBase):
     def _sources_workdir_dir(self, src_dir):
         return os.path.realpath(os.path.join(src_dir, 'oe-workdir'))
 
-    def _workspace_gdbinit_dir(self, recipe_name):
-        return os.path.realpath(os.path.join(self.builddir, 'workspace', 'ide-sdk', recipe_name, 'scripts', 'gdbinit'))
-
-    def _sources_gdbinit_dir(self, src_dir):
-        return os.path.realpath(os.path.join(src_dir, 'oe-gdbinit'))
+    def _find_multi_script_port(self, recipe_name, script_prefix, example_exe):
+        """Discover the port assigned to a generated 'multi' mode debug-server
+        script (gdbserver_*/lldb_server_*), since each --ide plugin allocates
+        its own port and it is not necessarily 1234.
+        """
+        binary_pretty = 'usr-bin-' + example_exe
+        pattern = os.path.join(self._workspace_scripts_dir(recipe_name),
+                               '%s_*_%s_multi' % (script_prefix, binary_pretty))
+        matches = glob.glob(pattern)
+        self.assertEqual(len(matches), 1,
+                         'Expected exactly one script matching %s, got: %s' % (pattern, matches))
+        port_str = os.path.basename(matches[0])[len(script_prefix) + 1:-len('_%s_multi' % binary_pretty)]
+        return int(port_str)
 
     def _devtool_ide_sdk_recipe(self, recipe_name, build_file, testimage):
         """Setup a recipe for working with devtool ide-sdk
@@ -3475,10 +3483,210 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
         run_task(task_label, run_main_task)
 
+    def _ide_sdk_package_opts(self):
+        """Extra `devtool ide-sdk --package` options. Override to scope packages."""
+        return ''
+
+    def _verify_cross_debugger(self):
+        """Verify the target toolchain's cross debugger is usable."""
+        raise NotImplementedError
+
+    def _verify_recipe_ide_sdk(self, tempdir, qemu, recipe_name, example_exe, compile_cmd):
+        """Verify one recipe's ide=code/ide=none configs and remote debugging.
+
+        Must be overridden by the toolchain-specific subclass (GDB/GCC vs
+        LLDB/Clang): the generated configs and the debugging protocol differ
+        completely between toolchains but the procedure for verification is equal.
+        """
+        raise NotImplementedError
+
+    def _verify_nfs_launch_json(self, tempdir, nfs_rootfs):
+        """Verify launch.json's debug configurations reference the NFS debug rootfs.
+
+        Must be overridden by the toolchain-specific subclass (GDB/GCC vs
+        LLDB/Clang): the launch.json keys used to point the debugger at the
+        NFS debug rootfs's shared libraries/sources differ between them.
+        """
+        raise NotImplementedError
+
+    def _verify_slirp_bbappend(self, testimage):
+        """Verify update_qb_slirp_opt() wrote the SSH port-forward to the image bbappend."""
+        bbappend = os.path.join(self.workspacedir, 'appends', testimage + '.bbappend')
+        self.assertExists(bbappend, 'Image bbappend not created at %s' % bbappend)
+        with open(bbappend) as f:
+            bbappend_content = f.read()
+        self.assertIn('QB_SLIRP_OPT', bbappend_content,
+                      'QB_SLIRP_OPT not written to image bbappend')
+        self.assertIn('hostfwd=tcp:127.0.0.1:2222-:22', bbappend_content,
+                      'SSH slirp port forward missing from QB_SLIRP_OPT')
+
+    def _verify_nfs_debug_rootfs(self, testimage, nfs):
+        """Verify the NFS debug rootfs was extracted and its runqemu launch helper generated."""
+        nfs_rootfs = os.path.join(self.workspacedir, 'nfs-exports', testimage, nfs)
+        self.assertExists(nfs_rootfs)
+        self.assertExists(nfs_rootfs + '.pseudo_state')
+
+        runqemu_helper = os.path.join(
+            self.workspacedir, 'nfs-exports', testimage, 'runqemu-' + nfs)
+        self.assertExists(runqemu_helper)
+        self.assertTrue(os.access(runqemu_helper, os.X_OK))
+        with open(runqemu_helper) as helper_file:
+            helper = helper_file.read()
+        self.assertIn('exec runqemu ', helper)
+        self.assertIn(nfs_rootfs, helper)
+
+        bbappend = os.path.join(self.workspacedir, 'appends', testimage + '.bbappend')
+        with open(bbappend) as append_file:
+            self.assertRegex(
+                append_file.read(),
+                r'IMAGE_FSTYPES_DEBUGFS(?::append)? = " ?tar"')
+
+        return nfs_rootfs, runqemu_helper
+
+    def _verify_nfs_binary_deployed(self, nfs_rootfs, example_exe):
+        """Verify a recipe's binary was extracted into the NFS debug rootfs."""
+        self.assertExists(os.path.join(nfs_rootfs, 'usr', 'bin', example_exe))
+
+    def _test_devtool_ide_sdk_code_nfs_debug_rootfs(self):
+        """Verify ide-sdk extracts an NFS debug rootfs for VS Code debugging."""
+        recipe_name = self._cmake_recipe_name
+        build_file = "CMakeLists.txt"
+        testimage = "oe-selftest-image"
+
+        self._check_workspace()
+        self._write_bb_config()
+        tempdir = self._devtool_ide_sdk_recipe(
+            recipe_name, build_file, testimage)
+        runCmd('devtool ide-sdk %s %s -c --ide=code --nfs=rootfs-dbg' %
+               (recipe_name, testimage), output_log=self._cmd_logger)
+
+        nfs_rootfs, _ = self._verify_nfs_debug_rootfs(testimage, 'rootfs-dbg')
+        self._verify_nfs_binary_deployed(nfs_rootfs, recipe_name)
+        self._verify_nfs_launch_json(tempdir, nfs_rootfs)
+
+    def _test_devtool_ide_sdk_code_and_none_qemu(self, nfs=False, slirp=False):
+        """Verify devtool ide-sdk --ide=code,none for cmake, meson and the target toolchain.
+
+        Generating the VS Code (ide=code) and generic (ide=none) IDE
+        configurations from a SINGLE devtool ide-sdk invocation and check
+        these configurations support the full development workflow with
+        the supported IDEs (VS Code and generic) and the target toolchain.
+
+        For each recipe (a cmake and a meson variant, see _cmake_recipe_name /
+        _meson_recipe_name / _meson_example_exe) this:
+        - devtool modifies the recipe, builds/boots the image and runs
+          devtool ide-sdk with both --ide=code and --ide=none together
+          (see _ide_sdk_package_opts() for toolchain-specific --package
+          scoping). Passing only the image (not the recipe) to confirm
+          modified recipes are discovered from workspace appends rather
+          than mistaking the image bbappend for one.
+        - Verifies each recipe's ide=code and ide=none configurations,
+          can recompile and run the unit tests on Qemu user mode on the
+          host.
+        - Verifies that the full remote development cycle works with a
+          Qemu system target. Remote debugging, changing the sources and
+          recompiling, deploying again and debugging should be verified.
+
+        nfs: extract and boot an NFS debug rootfs (--nfs=rootfs-dbg) instead
+             of the image's normal rootfs, and verify the debug rootfs
+             (bbappend, runqemu launch helper, launch.json paths).
+        slirp: boot Qemu with runqemu's slirp (user-mode) networking and an
+               SSH port-forward instead of the default tap networking.
+        """
+        testimage = "oe-selftest-image"
+        nfs_export = 'rootfs-dbg'
+
+        self._check_workspace()
+        self._write_bb_config()
+        if not slirp:
+            self._check_runqemu_prerequisites()
+
+        tempdir_cmake = self._devtool_ide_sdk_recipe(
+            self._cmake_recipe_name, "CMakeLists.txt", None)
+        tempdir_meson = self._devtool_ide_sdk_recipe(
+            self._meson_recipe_name, "meson.build", testimage)
+        package_opts = self._ide_sdk_package_opts()
+        nfs_opts = ' --nfs=%s' % nfs_export if nfs else ''
+        runCmd('devtool ide-sdk %s -c --ide=code,none %s%s' % (testimage, package_opts, nfs_opts),
+               output_log=self._cmd_logger)
+
+        if slirp:
+            self._verify_slirp_bbappend(testimage)
+
+        if nfs:
+            nfs_rootfs, runqemu_helper = self._verify_nfs_debug_rootfs(testimage, nfs_export)
+            self._verify_nfs_binary_deployed(nfs_rootfs, self._cmake_recipe_name)
+            self._verify_nfs_binary_deployed(nfs_rootfs, self._meson_example_exe)
+            self._verify_nfs_launch_json(tempdir_cmake, nfs_rootfs)
+            self._verify_nfs_launch_json(tempdir_meson, nfs_rootfs)
+
+            launch_cmd = '%s nographic' % shlex.quote(runqemu_helper)
+            runqemuparams = ''
+            if slirp:
+                launch_cmd += ' slirp'
+                # QemuTarget uses this only to select its localhost SSH endpoint;
+                # launch_cmd supplies the actual runqemu option.
+                runqemuparams = 'slirp'
+            qemu_cm = runqemu(testimage, runqemuparams=runqemuparams, launch_cmd=launch_cmd)
+        else:
+            runqemuparams = "nographic slirp" if slirp else "nographic"
+            qemu_cm = runqemu(testimage, runqemuparams=runqemuparams)
+
+        with qemu_cm as qemu:
+            if nfs:
+                status, output = qemu.run(
+                    "awk '$2 == \"/\" {print $3}' /proc/mounts")
+                self.assertEqual(status, 0)
+                self.assertEqual(output.strip(), 'nfs')
+
+            if slirp:
+                self.assertIsNotNone(qemu.port, 'No SSH port for the slirp target')
+                target_options = '-t root@%s -P %s' % (qemu.ip, qemu.port)
+            else:
+                target_options = '-t root@%s -c' % qemu.ip
+
+            # Re-run ide-sdk --skip-bitbake against the live Qemu IP which was
+            # not known at the time of the initial ide-sdk invocation.
+            # --skip-bitbake also skips the NFS rootfs (re-)extraction, which
+            # would otherwise wipe the directory the target has mounted.
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s --skip-bitbake --ide=code,none %s%s' % (
+                testimage, target_options, package_opts, nfs_opts)
+            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
+
+            # Verify the debugger is available and functional on host
+            self._verify_cross_debugger()
+
+            # CMake: Verify compiliation and unit test execution via Qemu user mode works
+            compile_cmd = self._verify_cmake_preset(tempdir_cmake)
+
+            # CMake: Perform a full remote development cycle with the IDE configurations on Qemu system
+            self._verify_recipe_ide_sdk(
+                tempdir_cmake, qemu, self._cmake_recipe_name, self._cmake_recipe_name, compile_cmd)
+
+            # Meson: Verify compilation and unit test execution via Qemu user mode works with meson
+            compile_cmd = self._verify_meson_build(tempdir_meson, self._meson_recipe_name)
+
+            # Meson: Perform a full remote development cycle with the IDE configurations on Qemu system
+            self._verify_recipe_ide_sdk(
+                tempdir_meson, qemu, self._meson_recipe_name, self._meson_example_exe, compile_cmd)
+
 
 class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
-    def _gdb_cross(self):
+    _cmake_recipe_name = "cmake-example"
+    _meson_recipe_name = "meson-example"
+    _meson_example_exe = "mesonex"
+
+    def _ide_sdk_package_opts(self):
+        package_filters = [
+            # Exercise multi-recipe package scoping via repeated --package:
+            # RECIPE:,-ptest expands to RECIPE and RECIPE-ptest.
+            "cmake-example:,-ptest",
+            "meson-example:,-ptest",
+        ]
+        return ' '.join('--package %s' % p for p in package_filters)
+
+    def _verify_cross_debugger(self):
         """Verify gdb-cross is provided by devtool ide-sdk"""
         target_arch = self.td["TARGET_ARCH"]
         target_sys = self.td["TARGET_SYS"]
@@ -3491,6 +3699,56 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self.assertEqual(r.status, 0)
         self.assertIn("GNU gdb", r.output)
 
+    def _verify_recipe_ide_sdk(self, tempdir, qemu, recipe_name, example_exe, compile_cmd):
+        """Verify one recipe's service, ide=code launch.json/tasks.json and ide=none scripts.
+
+        Confirms the recipe's service is running on the target and that its
+        config file/binary ownership matches the recipe's static user/group,
+        then exercises ide=code (attach + once debugging) and ide=none
+        (before/after a source change/recompile/redeploy cycle) against the
+        same build.
+        """
+        example_user_group = recipe_name
+        conf_file = "/etc/%s.conf" % recipe_name
+
+        # Verify the service is running on the target and its config file
+        # is owned by the recipe's static user/group
+        self._verify_service_running(qemu, example_exe)
+        self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
+
+        if recipe_name == self._meson_recipe_name:
+            # ide=code: settings.json should point at the same meson wrapper
+            # ide=none's _verify_meson_build just exercised, proving both IDE
+            # configs reference the identical, already-working build
+            # integration rather than a separate/duplicated one.
+            with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_j:
+                settings_d = json.load(settings_j)
+            self.assertEqual(
+                settings_d["mesonbuild.mesonPath"],
+                os.path.join(self._workspace_scripts_dir(recipe_name), "meson"),
+                "ide=code settings.json should reference the same meson wrapper as ide=none")
+
+        # ide=code: verify tasks.json/launch.json and run one remote debugging pass
+        # (attach + once) through them, against the unmodified example.
+        self._verify_install_script_code(
+            tempdir, recipe_name, ['%s:,-ptest' % recipe_name])
+        self._verify_launch_json(tempdir)
+        self._verify_launch_json_debugging(tempdir, qemu, example_exe)
+
+        # ide=none: verify the generated scripts also work, before and
+        # after a code change/recompile/redeploy cycle. Proves both IDE
+        # configs generated from the same invocation debug the identical
+        # build correctly.
+        self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe, compile_cmd)
+
+        # Verify the oe-scripts sym-link is valid
+        self.assertEqual(self._workspace_scripts_dir(
+            recipe_name), self._sources_scripts_dir(tempdir))
+
+        # Verify the config file is still owned by the recipe's user
+        # after the install and deploy scripts updated the file
+        self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
+
     def _gdb_debug_cpp_example(self, magic_string, gdb_start_cmd="run",
                               exe_break_line=136, exe_list_line=129, hpp_break_line=24,
                               lib_break_line=31):
@@ -3578,10 +3836,11 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         numbers after recompiling, to prove the breakpoints resolve via the
         freshly rebuilt debug info.
         """
+        port = self._find_multi_script_port(recipe_name, 'gdbserver', example_exe)
         gdbserver_script = os.path.join(self._workspace_scripts_dir(
-            recipe_name), 'gdbserver_1234_usr-bin-' + example_exe + '_multi')
+            recipe_name), 'gdbserver_%d_usr-bin-%s_multi' % (port, example_exe))
         gdb_script = os.path.join(self._workspace_scripts_dir(
-            recipe_name), 'gdb_1234_usr-bin-' + example_exe)
+            recipe_name), 'gdb_%d_usr-bin-%s' % (port, example_exe))
 
         # Start a gdbserver
         r = runCmd(gdbserver_script, output_log=self._cmd_logger)
@@ -3591,7 +3850,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         # an NFS-root target (--nfs=rootfs-dbg) the pid file it wrote has been
         # observed to become readable over the next SSH connection only a
         # moment later, so poll for it.
-        pid_file = '/tmp/gdbserver_1234_usr-bin-%s_multi/gdbserver.pid' % example_exe
+        pid_file = '/tmp/gdbserver_%d_usr-bin-%s_multi/gdbserver.pid' % (port, example_exe)
         status, output = qemu.run('cat %s' % pid_file)
         for _ in range(10):
             if status == 0:
@@ -3607,7 +3866,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self.assertEqual(status, 0)
         self.assertIn("gdbserver", output)
         self.assertIn("--multi", output)
-        self.assertIn("1234", output)
+        self.assertIn(str(port), output)
 
         # Test remote debugging works
         gdb_batch_cmd = " --batch " + self._gdb_debug_cpp_example(
@@ -3629,88 +3888,6 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
             gdbserver_pid, pid_file))
         self.assertEqual(status, 0)
 
-    @OETestTag("runqemu")
-    def test_devtool_ide_sdk_none_qemu(self):
-        """Start qemu-system and run tests for multiple recipes. ide=none is used."""
-        recipe_names = ["cmake-example", "meson-example"]
-        package_filters = [
-            # Exercise multi-recipe package scoping via repeated --package:
-            # RECIPE:,-ptest expands to RECIPE and RECIPE-ptest.
-            "cmake-example:,-ptest",
-            "meson-example:,-ptest",
-        ]
-        testimage = "oe-selftest-image"
-
-        self._check_workspace()
-        self._write_bb_config()
-        self._check_runqemu_prerequisites()
-
-        # Verify deployment to Qemu (system mode) works
-        tempdir_cmake = self._devtool_ide_sdk_recipe("cmake-example", "CMakeLists.txt", None)
-        tempdir_meson = self._devtool_ide_sdk_recipe("meson-example", "meson.build", testimage)
-        package_opts = ' '.join('--package %s' % p for p in package_filters)
-        runCmd('devtool ide-sdk cmake-example meson-example %s -c --ide=none %s' % (testimage, package_opts),
-               output_log=self._cmd_logger)
-
-        with runqemu(testimage, runqemuparams="nographic") as qemu:
-            # cmake-example recipe
-            recipe_name = "cmake-example"
-            example_exe = "cmake-example"
-            example_user_group = "cmake-example"
-            conf_file = "/etc/cmake-example.conf"
-
-            # Verify the cmake-example service is running on the target
-            self._verify_service_running(qemu, example_exe)
-            # Verify /etc/cmake-example.conf is owned by the cmake-example user
-            self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
-
-            # Re-run ide-sdk with only the image name. Modified recipes must
-            # be discovered from workspace appends; the image bbappend itself
-            # must not be mistaken for a modified recipe.
-            bitbake_sdk_cmd = 'devtool ide-sdk %s -t root@%s -c --skip-bitbake --ide=none %s' % (
-                testimage, qemu.ip, package_opts)
-            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
-
-            self._gdb_cross()
-            compile_cmd = self._verify_cmake_preset(tempdir_cmake)
-            self._devtool_ide_sdk_qemu(tempdir_cmake, qemu, recipe_name, example_exe, compile_cmd)
-
-            # Verify the oe-scripts sym-link is valid
-            self.assertEqual(self._workspace_scripts_dir(
-                recipe_name), self._sources_scripts_dir(tempdir_cmake))
-
-            # Verify /etc/cmake-example.conf is still owned by the cmake-example user
-            # after the install and deploy scripts updated the file
-            self._verify_conf_file(qemu, conf_file, example_exe, example_exe)
-
-            # meson-example recipe
-            recipe_name = "meson-example"
-            example_exe = "mesonex"
-            example_user_group = "meson-example"
-            conf_file = "/etc/meson-example.conf"
-
-            # Verify the meson-example service is running on the target
-            self._verify_service_running(qemu, example_exe)
-            # Verify /etc/meson-example.conf is owned by the meson-example user
-            self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
-
-            # Re-run ide-sdk with the actual QEMU IP for this recipe
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=none %s' % (
-                recipe_name, testimage, qemu.ip, package_opts)
-            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
-
-            self._gdb_cross()
-            compile_cmd = self._verify_meson_build(tempdir_meson, recipe_name)
-            self._devtool_ide_sdk_qemu(tempdir_meson, qemu, recipe_name, example_exe, compile_cmd)
-
-            # Verify the oe-scripts sym-link is valid
-            self.assertEqual(self._workspace_scripts_dir(
-                recipe_name), self._sources_scripts_dir(tempdir_meson))
-
-            # Verify /etc/meson-example.conf is still owned by the meson-example user
-            # after the install and deploy scripts updated the file
-            self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
-
     def _verify_launch_json(self, tempdir):
         """Verify the launch.json file created is valid and contains proper debug configurations"""
         launch_json_path = os.path.join(tempdir, '.vscode', 'launch.json')
@@ -4037,41 +4214,8 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
                 self.assertEqual(r.status, 0)
                 debug_check_func(r.output, DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
 
-    def test_devtool_ide_sdk_code_nfs_debug_rootfs(self):
-        """Verify ide-sdk extracts an NFS debug rootfs for VS Code debugging."""
-        recipe_name = "cmake-example"
-        build_file = "CMakeLists.txt"
-        testimage = "oe-selftest-image"
-
-        self._check_workspace()
-        self._write_bb_config()
-        tempdir = self._devtool_ide_sdk_recipe(
-            recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=code --nfs=rootfs-dbg' %
-               (recipe_name, testimage), output_log=self._cmd_logger)
-
-        nfs_rootfs = os.path.join(
-            self.workspacedir, 'nfs-exports', testimage, 'rootfs-dbg')
-        self.assertExists(nfs_rootfs)
-        self.assertExists(nfs_rootfs + '.pseudo_state')
-        self.assertExists(os.path.join(nfs_rootfs, 'usr', 'bin', recipe_name))
-        runqemu_helper = os.path.join(
-            self.workspacedir, 'nfs-exports', testimage,
-            'runqemu-rootfs-dbg')
-        self.assertExists(runqemu_helper)
-        self.assertTrue(os.access(runqemu_helper, os.X_OK))
-        with open(runqemu_helper) as helper_file:
-            helper = helper_file.read()
-        self.assertIn('exec runqemu ', helper)
-        self.assertIn(nfs_rootfs, helper)
-
-        bbappend = os.path.join(
-            self.workspacedir, 'appends', testimage + '.bbappend')
-        with open(bbappend) as append_file:
-            self.assertRegex(
-                append_file.read(),
-                r'IMAGE_FSTYPES_DEBUGFS(?::append)? = " ?tar"')
-
+    def _verify_nfs_launch_json(self, tempdir, nfs_rootfs):
+        """Verify launch.json's cppdbg configurations reference the NFS debug rootfs."""
         with open(os.path.join(tempdir, '.vscode', 'launch.json')) as launch_file:
             launch_configurations = json.load(launch_file)['configurations']
         for configuration in launch_configurations:
@@ -4081,169 +4225,24 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
                 os.path.join(nfs_rootfs, 'usr', 'src', 'debug'),
                 configuration['sourceFileMap']['/usr/src/debug'])
 
-    def _test_devtool_ide_sdk_nfs_debug_rootfs_qemu(self, slirp=False):
-        """Boot the extracted NFS debug rootfs and exercise remote GDB."""
-        recipe_name = "cmake-example"
-        build_file = "CMakeLists.txt"
-        testimage = "oe-selftest-image"
+    def test_devtool_ide_sdk_code_nfs_debug_rootfs(self):
+        """Verify ide-sdk extracts an NFS debug rootfs for VS Code debugging."""
+        self._test_devtool_ide_sdk_code_nfs_debug_rootfs()
 
-        self._check_workspace()
-        self._write_bb_config()
-        if not slirp:
-            self._check_runqemu_prerequisites()
-
-        tempdir = self._devtool_ide_sdk_recipe(
-            recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=none --nfs=rootfs-dbg' %
-               (recipe_name, testimage),
-               output_log=self._cmd_logger)
-
-        nfs_rootfs = os.path.join(
-            self.workspacedir, 'nfs-exports', testimage, 'rootfs-dbg')
-        runqemu_helper = os.path.join(
-            self.workspacedir, 'nfs-exports', testimage,
-            'runqemu-rootfs-dbg')
-        self.assertExists(nfs_rootfs)
-        self.assertExists(runqemu_helper)
-
-        launch_cmd = '%s nographic' % shlex.quote(runqemu_helper)
-        runqemuparams = ''
-        if slirp:
-            launch_cmd += ' slirp'
-            # QemuTarget uses this only to select its localhost SSH endpoint;
-            # launch_cmd supplies the actual runqemu option.
-            runqemuparams = 'slirp'
-
-        with runqemu(testimage, runqemuparams=runqemuparams,
-                     launch_cmd=launch_cmd) as qemu:
-            status, output = qemu.run(
-                "awk '$2 == \"/\" {print $3}' /proc/mounts")
-            self.assertEqual(status, 0)
-            self.assertEqual(output.strip(), 'nfs')
-
-            # Re-run with the real QEMU target address, instead of 192.168.7.2 IP.
-            # --skip-bitbake also skips the rootfs extraction, which would
-            # otherwise wipe the directory the target has mounted right now.
-            if slirp:
-                self.assertIsNotNone(qemu.port, 'No SSH port for the slirp target')
-                target_options = '-t root@%s -P %s ' % (qemu.ip, qemu.port)
-            else:
-                target_options = '-t root@%s -c ' % qemu.ip
-            runCmd('devtool ide-sdk %s %s %s--skip-bitbake --ide=none --nfs=rootfs-dbg' %
-                   (recipe_name, testimage, target_options),
-                   output_log=self._cmd_logger)
-
-            self._gdb_cross()
-            compile_cmd = self._verify_cmake_preset(tempdir)
-            self._devtool_ide_sdk_qemu(
-                tempdir, qemu, recipe_name, recipe_name, compile_cmd)
+    @OETestTag("runqemu")
+    def test_devtool_ide_sdk_code_and_none_qemu(self):
+        """Verify devtool ide-sdk --ide=code,none for cmake-example/meson-example with GCC and GDB."""
+        self._test_devtool_ide_sdk_code_and_none_qemu()
 
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_none_nfs_qemu(self):
-        """Verify remote GDB debugging through an NFS-root QEMU target."""
-        self._test_devtool_ide_sdk_nfs_debug_rootfs_qemu()
+        """Verify the full ide=code,none workflow through an NFS-root QEMU target."""
+        self._test_devtool_ide_sdk_code_and_none_qemu(nfs=True)
 
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_none_nfs_qemu_slirp(self):
-        """Verify remote GDB debugging through an NFS-root slirp target."""
-        self._test_devtool_ide_sdk_nfs_debug_rootfs_qemu(slirp=True)
-
-    @OETestTag("runqemu")
-    def test_devtool_ide_sdk_code_cmake(self):
-        """Verify a cmake recipe works with ide=code mode"""
-        recipe_name = "cmake-example"
-        example_exe = "cmake-example"
-        package_opt = '--package %s:,-ptest' % recipe_name
-        build_file = "CMakeLists.txt"
-        testimage = "oe-selftest-image"
-        build_file = "CMakeLists.txt"
-
-        self._check_workspace()
-        self._write_bb_config()
-
-        # Build image with debug settings before starting QEMU
-        self._check_runqemu_prerequisites()
-        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=code %s' % (recipe_name, testimage, package_opt),
-               output_log=self._cmd_logger)
-
-        with runqemu(testimage, runqemuparams="nographic") as qemu:
-            # Re-run with actual QEMU IP; image is already built
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code %s' % (
-                recipe_name, testimage, qemu.ip, package_opt)
-            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
-            self._verify_cmake_preset(tempdir)
-            self._verify_install_script_code(
-                tempdir, recipe_name, ['%s:,-ptest' % recipe_name])
-            self._gdb_cross()
-
-            # Verify the launch.json file created is valid
-            self._verify_launch_json(tempdir)
-
-            # Verify deployment and remote debugging works
-            self._verify_launch_json_debugging(tempdir, qemu, example_exe)
-
-    @OETestTag("runqemu")
-    def test_devtool_ide_sdk_code_meson(self):
-        """Verify a meson recipe works with ide=code mode"""
-        recipe_name = "meson-example"
-        example_exe = "mesonex"
-        package_opt = '--package %s:,-ptest' % recipe_name
-        build_file = "meson.build"
-        testimage = "oe-selftest-image"
-
-        self._check_workspace()
-        self._write_bb_config()
-
-        # Build image with debug settings before starting QEMU
-        self._check_runqemu_prerequisites()
-        tempdir = self._devtool_ide_sdk_recipe(
-            recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=code %s' % (recipe_name, testimage, package_opt),
-               output_log=self._cmd_logger)
-
-        with runqemu(testimage, runqemuparams="nographic") as qemu:
-            # Re-run with actual QEMU IP; image is already built
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code %s' % (
-                recipe_name, testimage, qemu.ip, package_opt)
-            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
-
-            with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_j:
-                settings_d = json.load(settings_j)
-            meson_exe = settings_d["mesonbuild.mesonPath"]
-            meson_build_folder = settings_d["mesonbuild.buildFolder"]
-
-            # Verify the wrapper for meson native is available
-            self.assertExists(meson_exe)
-
-            # Verify meson re-uses the o files compiled by bitbake
-            result = runCmd('%s compile -C  %s' %
-                            (meson_exe, meson_build_folder), cwd=tempdir, output_log=self._cmd_logger)
-            self.assertIn("ninja: no work to do.", result.output)
-
-            # Verify the unit tests work (in Qemu user mode)
-            runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir,
-                   output_log=self._cmd_logger)
-
-            # Verify re-building and testing works again
-            result = runCmd('%s compile -C  %s --clean' %
-                            (meson_exe, meson_build_folder), cwd=tempdir, output_log=self._cmd_logger)
-            self.assertIn("Cleaning...", result.output)
-            result = runCmd('%s compile -C  %s' %
-                            (meson_exe, meson_build_folder), cwd=tempdir, output_log=self._cmd_logger)
-            self.assertIn("Linking target", result.output)
-            runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir,
-                   output_log=self._cmd_logger)
-
-            self._verify_install_script_code(
-                tempdir, recipe_name, ['%s:,-ptest' % recipe_name])
-            self._gdb_cross()
-
-            # Verify the launch.json file created is valid
-            self._verify_launch_json(tempdir)
-
-            # Verify deployment and remote debugging works
-            self._verify_launch_json_debugging(tempdir, qemu, example_exe)
+        """Verify the full ide=code,none workflow through an NFS-root slirp target."""
+        self._test_devtool_ide_sdk_code_and_none_qemu(nfs=True, slirp=True)
 
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_none_qemu_slirp(self):
@@ -4256,44 +4255,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
           - runqemu boots the image in slirp mode.
           - devtool deploy-target reaches the target via localhost:2222.
         """
-        recipe_name = "cmake-example"
-        build_file = "CMakeLists.txt"
-        testimage = "oe-selftest-image"
-
-        self._check_workspace()
-        self._write_bb_config()
-
-        # devtool modify and build image; QB_SLIRP_OPT is written to the bbappend.
-        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, None)
-        runCmd('devtool ide-sdk %s %s -c --ide=none' % (recipe_name, testimage),
-               output_log=self._cmd_logger)
-
-        # Verify QB_SLIRP_OPT was written to the workspace bbappend.
-        appends_dir = os.path.join(self.workspacedir, 'appends')
-        bbappend = os.path.join(appends_dir, testimage + '.bbappend')
-        self.assertExists(bbappend, 'Image bbappend not created at %s' % bbappend)
-        with open(bbappend) as f:
-            bbappend_content = f.read()
-        self.assertIn('QB_SLIRP_OPT', bbappend_content,
-                      'QB_SLIRP_OPT not written to image bbappend')
-        self.assertIn('hostfwd=tcp:127.0.0.1:2222-:22', bbappend_content,
-                      'SSH slirp port forward missing from QB_SLIRP_OPT')
-
-        with runqemu(testimage, runqemuparams="nographic slirp") as qemu:
-            slirp_host = qemu.ip
-            self.assertIsNotNone(qemu.port, 'No SSH port for the slirp target')
-            slirp_port = qemu.port
-
-            # Re-run ide-sdk with the actual slirp address; image is already built.
-            bitbake_sdk_cmd = (
-                'devtool ide-sdk %s %s -t root@%s -P %s --skip-bitbake --ide=none'
-                % (recipe_name, testimage, slirp_host, slirp_port))
-            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
-
-            self._gdb_cross()
-            compile_cmd = self._verify_cmake_preset(tempdir)
-            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name,
-                                        recipe_name, compile_cmd)
+        self._test_devtool_ide_sdk_code_and_none_qemu(slirp=True)
 
 
 class DevtoolIdeSdkKernelTests(DevtoolIdeSdkTests):
@@ -4578,6 +4540,83 @@ class DevtoolIdeSdkSharedTests(DevtoolIdeSdkTests):
 
 class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
 
+    _cmake_recipe_name = "cmake-example-clang"
+    _meson_recipe_name = "meson-example-clang"
+    _meson_example_exe = "mesonex-clang"
+
+    def _verify_cross_debugger(self):
+        """Verify lldb-native is provided by devtool ide-sdk"""
+        lldb_binary = self._lldb_native_binary()
+        r = runCmd("%s --version" % lldb_binary, output_log=self._cmd_logger)
+        self.assertEqual(r.status, 0)
+        self.assertIn("lldb", r.output.lower())
+
+    def _lldb_native_binary(self):
+        """Locate the lldb binary in the lldb-native sysroot"""
+        lldb_native_sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'lldb-native')
+        lldb_binary = os.path.join(lldb_native_sysroot, 'usr', 'bin', 'lldb')
+        self.assertExists(lldb_binary, "lldb binary should exist in lldb-native sysroot")
+        return lldb_binary
+
+    def _verify_recipe_ide_sdk(self, tempdir, qemu, recipe_name, example_exe, compile_cmd):
+        """Verify one recipe's ide=code/ide=none LLDB configs and remote debugging.
+
+        Confirms the generated configs select lldb-native/lldb-server instead
+        of gdb-cross/gdbserver: extensions.json recommends vadimcn.vscode-lldb,
+        launch.json uses "type": "lldb" instead of "cppdbg", and ide=none
+        generates lldb_server_*/lldbinit/lldb_* scripts with no GDB scripts
+        alongside them. Then exercises ide=code (one lldb --batch debugging
+        pass) and ide=none (before/after a source change/recompile/redeploy
+        cycle) against the same build.
+        """
+        # Verify the install && deploy-target task script exists
+        self._verify_install_script_code(tempdir, recipe_name)
+
+        # Verify extensions.json recommends CodeLLDB instead of / alongside cpptools
+        with open(os.path.join(tempdir, '.vscode', 'extensions.json')) as ext_j:
+            ext_d = json.load(ext_j)
+        recommendations = ext_d.get('recommendations', [])
+        self.assertIn('vadimcn.vscode-lldb', recommendations,
+                      'vadimcn.vscode-lldb should be recommended for clang recipes')
+
+        # Verify launch.json uses CodeLLDB format
+        self._verify_launch_json_lldb(tempdir)
+
+        # Verify ide=none scripts were also generated alongside ide=code.
+        # The port is not necessarily 1234: ide=code's own config for the
+        # same binary is created first and consumes a port too.
+        scripts_dir = self._workspace_scripts_dir(recipe_name)
+        binary_pretty = 'usr-bin-' + example_exe
+        port = self._find_multi_script_port(recipe_name, 'lldb_server', example_exe)
+        self.assertExists(os.path.join(
+            scripts_dir, 'lldb_server_%d_%s_multi' % (port, binary_pretty)))
+        self.assertExists(os.path.join(
+            scripts_dir, 'lldbinit', 'lldbinit_%d_%s' % (port, binary_pretty)))
+        self.assertExists(os.path.join(
+            scripts_dir, 'lldb_%d_%s' % (port, binary_pretty)))
+        # No GDB scripts should have been generated for a clang recipe
+        self.assertFalse(glob.glob(os.path.join(
+            scripts_dir, 'gdbserver_*_%s_multi' % binary_pretty)),
+            'gdbserver script should not be generated for clang recipe')
+
+        # Verify the oe-scripts sym-link is valid
+        self.assertEqual(self._workspace_scripts_dir(recipe_name),
+                         self._sources_scripts_dir(tempdir))
+
+        # ide=code: one lldb debugging pass through launch.json/tasks.json,
+        # against the unmodified example.
+        self._lldb_server_debugging_once(
+            tempdir, qemu, DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
+
+        # ide=none: full debugging cycle through the generated scripts,
+        # before and after a code change/recompile/redeploy cycle (see
+        # _lldb_cross_debugging_multi). Proves both IDE configs generated
+        # from the same invocation debug the identical build correctly.
+        self._lldb_cross_debugging_multi(
+            tempdir, recipe_name, compile_cmd,
+            lambda magic_string: self._lldb_none_debugging_multi(
+                tempdir, qemu, recipe_name, example_exe, magic_string))
+
     def _verify_launch_json_lldb(self, tempdir):
         """Verify the launch.json file contains valid CodeLLDB (type: lldb) configurations."""
         launch_json_path = os.path.join(tempdir, '.vscode', 'launch.json')
@@ -4896,10 +4935,7 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         connect_cmd = next((c for c in init_commands if "platform connect" in c), None)
         self.assertIsNotNone(connect_cmd, "initCommands should contain a platform connect command")
 
-        # Find lldb binary from lldb-native sysroot
-        lldb_native_sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'lldb-native')
-        lldb_binary = os.path.join(lldb_native_sysroot, 'usr', 'bin', 'lldb')
-        self.assertExists(lldb_binary, "lldb binary should exist in lldb-native sysroot")
+        lldb_binary = self._lldb_native_binary()
 
         self.logger.debug("Starting lldb-server via SSH: %s", " ".join(ssh_cmd))
         runCmd(ssh_cmd, output_log=self._cmd_logger)
@@ -4937,127 +4973,18 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         self.assertEqual(r.status, 0, "lldb batch session failed: %s" % r.output)
         self._lldb_debug_cpp_example_check(r.output, magic_string)
 
-    @OETestTag("runqemu")
-    def test_devtool_ide_sdk_code_cmake(self):
-        """Verify a cmake recipe built with clang works with ide=code (CodeLLDB debugging).
-
-        This test uses the cmake-example-clang recipe which is a cmake-example variant
-        built with clang. It installs a separate binary (cmake-example-clang) so all four
-        recipe variants (cmake/meson x gcc/clang) can be installed in the same image
-        without conflicts. It is configured to use lldb-server for debugging instead of
-        gdbserver. The test flow is similar to test_devtool_ide_sdk_code_cmake but with
-        additional checks related to lldb:
-        - devtool ide-sdk selects lldb-native / lldb-server instead of gdb-cross
-        - launch.json uses "type": "lldb" (CodeLLDB) instead of "type": "cppdbg"
-        - extensions.json recommends vadimcn.vscode-lldb
-        - A basic lldb --batch remote debugging session succeeds against the
-          lldb-server platform running on the Qemu target
-        """
-        recipe_name = "cmake-example-clang"
-        build_file = "CMakeLists.txt"
-        testimage = "oe-selftest-image"
-
-        self._check_workspace()
-        self._write_bb_config()
-
-        # Build image with debug settings (lldb-server for clang) before starting QEMU
-        self._check_runqemu_prerequisites()
-        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=code' % (recipe_name, testimage),
-               output_log=self._cmd_logger)
-
-        with runqemu(testimage, runqemuparams="nographic") as qemu:
-            # Re-run with actual QEMU IP; image is already built
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code' % (
-                recipe_name, testimage, qemu.ip)
-            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
-
-            # Verify the cmake preset still works (build system unchanged)
-            compile_cmd = self._verify_cmake_preset(tempdir)
-
-            # Verify the install && deploy-target task script exists
-            self._verify_install_script_code(tempdir, recipe_name)
-
-            # Verify extensions.json recommends CodeLLDB instead of / alongside cpptools
-            with open(os.path.join(tempdir, '.vscode', 'extensions.json')) as ext_j:
-                ext_d = json.load(ext_j)
-            recommendations = ext_d.get('recommendations', [])
-            self.assertIn('vadimcn.vscode-lldb', recommendations,
-                          'vadimcn.vscode-lldb should be recommended for clang recipes')
-
-            # Verify launch.json uses CodeLLDB format
-            self._verify_launch_json_lldb(tempdir)
-
-            # Verify deployment and lldb batch remote debugging work end-to-end,
-            # before and after a code change/recompile/redeploy cycle (see
-            # _lldb_cross_debugging_multi)
-            self._lldb_cross_debugging_multi(
-                tempdir, recipe_name, compile_cmd,
-                lambda magic_string: self._lldb_server_debugging_once(
-                    tempdir, qemu, magic_string))
-
-    @OETestTag("runqemu")
-    def test_devtool_ide_sdk_code_meson(self):
-        """Verify a meson recipe built with clang works with ide=code (CodeLLDB debugging).
-
-        This is the meson/ninja counterpart of test_devtool_ide_sdk_code_cmake_clang.
-        It matters as its own test (rather than being covered by the cmake/clang
-        test alone) because meson/ninja invoke the compiler with source paths
-        relative to the build directory, unlike cmake (with the Ninja or
-        Makefiles generators used here), which normally passes absolute source
-        paths. That relative-path compilation is what previously caused
-        -fdebug-prefix-map/-ffile-prefix-map underflow (DW_AT_name climbing
-        above DW_AT_comp_dir with excess dot-dot components) for devtool
-        workspaces, breaking source-level breakpoint resolution in CodeLLDB.
-        The cmake/clang test alone would not catch that regression.
-
-        This test uses the meson-example-clang recipe which is a meson-example
-        variant built with clang. It installs a separate binary
-        (mesonex-clang) so all four recipe variants (cmake/meson x gcc/clang)
-        can be installed in the same image without conflicts.
-        """
-        recipe_name = "meson-example-clang"
-        build_file = "meson.build"
-        testimage = "oe-selftest-image"
-
-        self._check_workspace()
-        self._write_bb_config()
-
-        # Build image with debug settings (lldb-server for clang) before starting QEMU
-        self._check_runqemu_prerequisites()
-        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=code' % (recipe_name, testimage),
-               output_log=self._cmd_logger)
-
-        with runqemu(testimage, runqemuparams="nographic") as qemu:
-            # Re-run with actual QEMU IP; image is already built
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code' % (
-                recipe_name, testimage, qemu.ip)
-            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
-
-            # Verify the meson build system still works (unchanged by clang/lldb support)
-            compile_cmd = self._verify_meson_build(tempdir, recipe_name)
-
-            # Verify the install && deploy-target task script exists
-            self._verify_install_script_code(tempdir, recipe_name)
-
-            # Verify extensions.json recommends CodeLLDB instead of / alongside cpptools
-            with open(os.path.join(tempdir, '.vscode', 'extensions.json')) as ext_j:
-                ext_d = json.load(ext_j)
-            recommendations = ext_d.get('recommendations', [])
-            self.assertIn('vadimcn.vscode-lldb', recommendations,
-                          'vadimcn.vscode-lldb should be recommended for clang recipes')
-
-            # Verify launch.json uses CodeLLDB format
-            self._verify_launch_json_lldb(tempdir)
-
-            # Verify deployment and lldb batch remote debugging work end-to-end,
-            # before and after a code change/recompile/redeploy cycle (see
-            # _lldb_cross_debugging_multi)
-            self._lldb_cross_debugging_multi(
-                tempdir, recipe_name, compile_cmd,
-                lambda magic_string: self._lldb_server_debugging_once(
-                    tempdir, qemu, magic_string))
+    def _verify_nfs_launch_json(self, tempdir, nfs_rootfs):
+        """Verify launch.json's CodeLLDB configurations reference the NFS debug rootfs."""
+        with open(os.path.join(tempdir, '.vscode', 'launch.json')) as launch_file:
+            launch_configurations = json.load(launch_file)['configurations']
+        for configuration in launch_configurations:
+            self.assertEqual(
+                os.path.join(nfs_rootfs, 'usr', 'src', 'debug'),
+                configuration['sourceMap']['/usr/src/debug'])
+            init_commands = configuration.get('initCommands', [])
+            self.assertTrue(
+                any(nfs_rootfs in cmd for cmd in init_commands),
+                "initCommands should point debug-file-search-paths at the NFS debug rootfs")
 
     def _lldb_none_debugging_multi(self, tempdir, qemu, recipe_name, example_exe, magic_string):
         """Verify lldb-server scripts generated by ide=none work end-to-end.
@@ -5072,11 +4999,15 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         lldbinit source map / debug-file-search-paths setup for the library's
         own debug info specifically.
         """
+        # The port is not necessarily 1234: when combined with --ide=code the
+        # ONCE/MULTI-mode server ide=code uses gets ports allocated first,
+        # pushing this MULTI-mode server to the next one allocated.
+        port = self._find_multi_script_port(recipe_name, 'lldb_server', example_exe)
         scripts_dir = self._workspace_scripts_dir(recipe_name)
         binary_pretty = 'usr-bin-' + example_exe
         lldb_server_script = os.path.join(
-            scripts_dir, 'lldb_server_1234_%s_multi' % binary_pretty)
-        lldb_script = os.path.join(scripts_dir, 'lldb_1234_%s' % binary_pretty)
+            scripts_dir, 'lldb_server_%d_%s_multi' % (port, binary_pretty))
+        lldb_script = os.path.join(scripts_dir, 'lldb_%d_%s' % (port, binary_pretty))
 
         self.assertExists(lldb_server_script)
         self.assertExists(lldb_script)
@@ -5085,7 +5016,7 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         r = runCmd(lldb_server_script, output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
 
-        pid_file = '/tmp/lldb_server_1234_%s_multi/lldb_server.pid' % binary_pretty
+        pid_file = '/tmp/lldb_server_%d_%s_multi/lldb_server.pid' % (port, binary_pretty)
         status, output = qemu.run('cat %s' % pid_file)
         self.assertEqual(status, 0)
         lldb_server_pid = output.strip()
@@ -5114,142 +5045,47 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
             lldb_server_pid, pid_file))
         self.assertEqual(status, 0)
 
-    @OETestTag("runqemu")
-    def test_devtool_ide_sdk_none_cmake(self):
-        """Verify ide=none generates correct LLDB scripts for a clang cmake recipe.
-
-        Uses cmake-example-clang (TOOLCHAIN = "clang") which is built with the
-        clang toolchain.  devtool ide-sdk with --ide=none should produce:
-          - lldb_server_<port>_<binary>_multi  (start/stop script)
-          - lldbinit/lldbinit_<port>_<binary>  (platform connect + source maps)
-          - lldb_<port>_<binary>               (lldb wrapper)
-
-        The test verifies that lldb-server can be started via the generated
-        script, and that a basic lldb --batch debugging session reaches main.
-        """
-        recipe_name = 'cmake-example-clang'
-        example_exe = 'cmake-example-clang'
-        build_file = 'CMakeLists.txt'
-        testimage = 'oe-selftest-image'
-
-        self._check_workspace()
-        self._write_bb_config()
-        self._check_runqemu_prerequisites()
-
-        # Build image with debug settings (lldb-server for clang) before starting QEMU
-        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=none' % (recipe_name, testimage),
-               output_log=self._cmd_logger)
-
-        with runqemu(testimage, runqemuparams='nographic') as qemu:
-            # Re-run with actual QEMU IP; image is already built
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=none' % (
-                recipe_name, testimage, qemu.ip)
-            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
-
-            # Verify cmake preset still works (build system unchanged)
-            compile_cmd = self._verify_cmake_preset(tempdir)
-
-            # Verify install && deploy script exists
-            # (_verify_install_script_code opens .vscode/tasks.json which is not
-            # generated for ide=none; check the script path directly instead)
-            recipe_id, _ = self._get_recipe_ids(recipe_name)
-            scripts_dir = self._workspace_scripts_dir(recipe_name)
-            self.assertExists(os.path.join(
-                scripts_dir, 'install_and_deploy_' + recipe_id))
-
-            # Verify LLDB scripts were generated (not GDB scripts)
-            binary_pretty = 'usr-bin-' + example_exe
-            self.assertExists(os.path.join(
-                scripts_dir, 'lldb_server_1234_%s_multi' % binary_pretty))
-            self.assertExists(os.path.join(
-                scripts_dir, 'lldbinit', 'lldbinit_1234_%s' % binary_pretty))
-            self.assertExists(os.path.join(
-                scripts_dir, 'lldb_1234_%s' % binary_pretty))
-            # No GDB scripts should have been generated for a clang recipe
-            self.assertFalse(os.path.exists(os.path.join(
-                scripts_dir, 'gdbserver_1234_%s_multi' % binary_pretty)),
-                'gdbserver script should not be generated for clang recipe')
-
-            # Verify the oe-scripts sym-link is valid
-            self.assertEqual(self._workspace_scripts_dir(recipe_name),
-                             self._sources_scripts_dir(tempdir))
-
-            # Verify end-to-end lldb debugging, before and after a code
-            # change/recompile/redeploy cycle (see _lldb_cross_debugging_multi)
-            self._lldb_cross_debugging_multi(
-                tempdir, recipe_name, compile_cmd,
-                lambda magic_string: self._lldb_none_debugging_multi(
-                    tempdir, qemu, recipe_name, example_exe, magic_string))
+    def test_devtool_ide_sdk_code_nfs_debug_rootfs(self):
+        """Verify ide-sdk extracts an NFS debug rootfs for VS Code (CodeLLDB) debugging."""
+        self._test_devtool_ide_sdk_code_nfs_debug_rootfs()
 
     @OETestTag("runqemu")
-    def test_devtool_ide_sdk_none_meson(self):
-        """Verify ide=none generates correct LLDB scripts for a clang meson recipe.
+    def test_devtool_ide_sdk_code_and_none_qemu(self):
+        """Verify devtool ide-sdk --ide=code,none for cmake/meson-example-clang with Clang and LLDB.
 
-        This is the meson/ninja counterpart of test_devtool_ide_sdk_none_cmake_clang.
-        It is required in addition to the cmake/clang test because meson/ninja
-        (unlike cmake here) invoke the compiler with source paths relative to
-        the build directory, which is what previously caused source-level
-        breakpoints to be left unresolved (pending) for devtool workspaces due
-        to -fdebug-prefix-map/-ffile-prefix-map underflow; see
-        _lldb_none_debugging_multi.
-
-        Uses meson-example-clang (TOOLCHAIN = "clang").
+        See DevtoolIdeSdkTests._test_devtool_ide_sdk_code_and_none_qemu for
+        the shared workflow. Clang-specific here: the generated configs
+        select lldb-native/lldb-server instead of gdb-cross/gdbserver
+        (extensions.json recommends vadimcn.vscode-lldb, launch.json uses
+        "type": "lldb", and ide=none generates lldb_server_*/lldbinit/lldb_*
+        scripts with no GDB scripts alongside them), and debugging goes
+        through one lldb --batch pass (ide=code) plus the
+        lldb-server/lldb scripts (ide=none). The meson recipe matters as
+        its own coverage since meson/ninja compile with source paths
+        relative to the build directory, which requires a workaround for
+        -fdebug-prefix-map/-ffile-prefix-map underflow breaking
+        source-level breakpoint resolution in CodeLLDB.
         """
-        recipe_name = 'meson-example-clang'
-        example_exe = 'mesonex-clang'
-        build_file = 'meson.build'
-        testimage = 'oe-selftest-image'
+        self._test_devtool_ide_sdk_code_and_none_qemu()
 
-        self._check_workspace()
-        self._write_bb_config()
-        self._check_runqemu_prerequisites()
+    @OETestTag("runqemu")
+    def test_devtool_ide_sdk_none_nfs_qemu(self):
+        """Verify the full ide=code,none workflow through an NFS-root QEMU target."""
+        self._test_devtool_ide_sdk_code_and_none_qemu(nfs=True)
 
-        # Build image with debug settings (lldb-server for clang) before starting QEMU
-        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=none' % (recipe_name, testimage),
-               output_log=self._cmd_logger)
+    @OETestTag("runqemu")
+    def test_devtool_ide_sdk_none_nfs_qemu_slirp(self):
+        """Verify the full ide=code,none workflow through an NFS-root slirp target."""
+        self._test_devtool_ide_sdk_code_and_none_qemu(nfs=True, slirp=True)
 
-        with runqemu(testimage, runqemuparams='nographic') as qemu:
-            # Re-run with actual QEMU IP; image is already built
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=none' % (
-                recipe_name, testimage, qemu.ip)
-            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
+    @OETestTag("runqemu")
+    def test_devtool_ide_sdk_none_qemu_slirp(self):
+        """Verify devtool ide-sdk works with runqemu slirp networking.
 
-            # Verify the meson build system still works (unchanged by clang/lldb support)
-            compile_cmd = self._verify_meson_build(tempdir, recipe_name)
+        Slirp mode uses SSH port forwarding (default: localhost:2222 -> guest:22).
+        """
+        self._test_devtool_ide_sdk_code_and_none_qemu(slirp=True)
 
-            # Verify install && deploy script exists
-            # (_verify_install_script_code opens .vscode/tasks.json which is not
-            # generated for ide=none; check the script path directly instead)
-            recipe_id, _ = self._get_recipe_ids(recipe_name)
-            scripts_dir = self._workspace_scripts_dir(recipe_name)
-            self.assertExists(os.path.join(
-                scripts_dir, 'install_and_deploy_' + recipe_id))
-
-            # Verify LLDB scripts were generated (not GDB scripts)
-            binary_pretty = 'usr-bin-' + example_exe
-            self.assertExists(os.path.join(
-                scripts_dir, 'lldb_server_1234_%s_multi' % binary_pretty))
-            self.assertExists(os.path.join(
-                scripts_dir, 'lldbinit', 'lldbinit_1234_%s' % binary_pretty))
-            self.assertExists(os.path.join(
-                scripts_dir, 'lldb_1234_%s' % binary_pretty))
-            # No GDB scripts should have been generated for a clang recipe
-            self.assertFalse(os.path.exists(os.path.join(
-                scripts_dir, 'gdbserver_1234_%s_multi' % binary_pretty)),
-                'gdbserver script should not be generated for clang recipe')
-
-            # Verify the oe-scripts sym-link is valid
-            self.assertEqual(self._workspace_scripts_dir(recipe_name),
-                             self._sources_scripts_dir(tempdir))
-
-            # Verify end-to-end lldb debugging, before and after a code
-            # change/recompile/redeploy cycle (see _lldb_cross_debugging_multi)
-            self._lldb_cross_debugging_multi(
-                tempdir, recipe_name, compile_cmd,
-                lambda magic_string: self._lldb_none_debugging_multi(
-                    tempdir, qemu, recipe_name, example_exe, magic_string))
 
 class DevtoolIdeSdkMiscTests(DevtoolIdeSdkTests):
 
-- 
2.55.0


