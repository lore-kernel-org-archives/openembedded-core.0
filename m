Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027FEC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 23:27:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.34110.1705447624584287041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 15:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nkFeuuWM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DD0020004;
	Tue, 16 Jan 2024 23:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705447622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SNl3Dbeyt+syiRLC1gkVwn38d+lhbS+IqFXOdHoyqKU=;
	b=nkFeuuWMN7qq7vuxPuSwMUxnqktdkcZ0Q7+5M7N1NhHxgqsPmLpTECbOE1b38smye6IoKN
	kLJNWrndTVhIfksKb5NMLmTpEtj5qYj3buUNBTbHHk5ZLp8CDbG1te06GplsAZd6aX9J4A
	YXejMRxd3vJGHzRAwhWyhpt817XbL81+Mrj6a79mPonWt8Q9XEGUSC/ZYQrQl1EK2QfHJ+
	4frrfHqocoP3BSS6d9/29zKctTECpFPTbzuORkVkkoJ6uop1Syi4gsQ4R47wq+qTXmgrI6
	3iW6pdi2twDgWWr3QOr4Ffblb4G1bQuzqLTZImAgd0HGR4xmWZpACp4AS389WQ==
Date: Wed, 17 Jan 2024 00:27:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH v9 4/9] oe-selftest devtool: ide-sdk tests
Message-ID: <2024011623270192fe36cc@mail.local>
References: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
 <20240114221437.1255866-5-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240114221437.1255866-5-adrian.freihofer@siemens.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 23:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193878

I got these failures on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6257/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2751/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6317/steps/14/logs/stdio


and this one:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6318/steps/14/logs/stdio


On 14/01/2024 23:14:16+0100, Adrian Freihofer wrote:
> Add some oe-selftests for the new devtool ide-sdk plugin. Most of the
> workflows are covered.
> 
> Many thanks to Enguerrand de Ribaucourt for testing and bug fixing.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 492 ++++++++++++++++++++++++
>  1 file changed, 492 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> index a8777207694..006c846438d 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -12,6 +12,7 @@ import tempfile
>  import glob
>  import fnmatch
>  import unittest
> +import json
>  
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
> @@ -2314,3 +2315,494 @@ class DevtoolUpgradeTests(DevtoolBase):
>  
>          #Step 4.5
>          runCmd("grep %s %s" % (modconfopt, codeconfigfile))
> +
> +
> +class DevtoolIdeSdkTests(DevtoolBase):
> +    def _write_bb_config(self, recipe_names):
> +        """Helper to write the bitbake local.conf file"""
> +        conf_lines = [
> +            'IMAGE_CLASSES += "image-combined-dbg"',
> +            'IMAGE_GEN_DEBUGFS = "1"',
> +            'IMAGE_INSTALL:append = " gdbserver %s"' % ' '.join(
> +                [r + '-ptest' for r in recipe_names])
> +        ]
> +        self.write_config("\n".join(conf_lines))
> +
> +    def _check_workspace(self):
> +        """Check if a workspace directory is available and setup the cleanup"""
> +        self.assertTrue(not os.path.exists(self.workspacedir),
> +                        'This test cannot be run with a workspace directory under the build directory')
> +        self.track_for_cleanup(self.workspacedir)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
> +
> +    def _workspace_scripts_dir(self, recipe_name):
> +        return os.path.realpath(os.path.join(self.builddir, 'workspace', 'ide-sdk', recipe_name, 'scripts'))
> +
> +    def _sources_scripts_dir(self, src_dir):
> +        return os.path.realpath(os.path.join(src_dir, 'oe-scripts'))
> +
> +    def _workspace_gdbinit_dir(self, recipe_name):
> +        return os.path.realpath(os.path.join(self.builddir, 'workspace', 'ide-sdk', recipe_name, 'scripts', 'gdbinit'))
> +
> +    def _sources_gdbinit_dir(self, src_dir):
> +        return os.path.realpath(os.path.join(src_dir, 'oe-gdbinit'))
> +
> +    def _devtool_ide_sdk_recipe(self, recipe_name, build_file, testimage):
> +        """Setup a recipe for working with devtool ide-sdk
> +
> +        Basically devtool modify -x followed by some tests
> +        """
> +        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
> +        self.track_for_cleanup(tempdir)
> +        self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
> +
> +        result = runCmd('devtool modify %s -x %s' % (recipe_name, tempdir))
> +        self.assertExists(os.path.join(tempdir, build_file),
> +                          'Extracted source could not be found')
> +        self.assertExists(os.path.join(self.workspacedir, 'conf',
> +                                       'layer.conf'), 'Workspace directory not created')
> +        matches = glob.glob(os.path.join(self.workspacedir,
> +                            'appends', recipe_name + '.bbappend'))
> +        self.assertTrue(matches, 'bbappend not created %s' % result.output)
> +
> +        # Test devtool status
> +        result = runCmd('devtool status')
> +        self.assertIn(recipe_name, result.output)
> +        self.assertIn(tempdir, result.output)
> +        self._check_src_repo(tempdir)
> +
> +        # Usually devtool ide-sdk would initiate the build of the SDK.
> +        # But there is a circular dependency with starting Qemu and passing the IP of runqemu to devtool ide-sdk.
> +        if testimage:
> +            bitbake("%s qemu-native qemu-helper-native" % testimage)
> +            deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
> +            self.add_command_to_tearDown('bitbake -c clean %s' % testimage)
> +            self.add_command_to_tearDown(
> +                'rm -f %s/%s*' % (deploy_dir_image, testimage))
> +
> +        return tempdir
> +
> +    def _get_recipe_ids(self, recipe_name):
> +        """IDs needed to write recipe specific config entries into IDE config files"""
> +        package_arch = get_bb_var('PACKAGE_ARCH', recipe_name)
> +        recipe_id = recipe_name + "-" + package_arch
> +        recipe_id_pretty = recipe_name + ": " + package_arch
> +        return (recipe_id, recipe_id_pretty)
> +
> +    def _verify_install_script_code(self, tempdir, recipe_name):
> +        """Verify the scripts referred by the tasks.json file are fine.
> +
> +        This function does not depend on Qemu. Therefore it verifies the scripts
> +        exists and the delete step works as expected. But it does not try to
> +        deploy to Qemu.
> +        """
> +        recipe_id, recipe_id_pretty = self._get_recipe_ids(recipe_name)
> +        with open(os.path.join(tempdir, '.vscode', 'tasks.json')) as tasks_j:
> +            tasks_d = json.load(tasks_j)
> +        tasks = tasks_d["tasks"]
> +        task_install = next(
> +            (task for task in tasks if task["label"] == "install && deploy-target %s" % recipe_id_pretty), None)
> +        self.assertIsNot(task_install, None)
> +        # execute only the bb_run_do_install script since the deploy would require e.g. Qemu running.
> +        i_and_d_script = "install_and_deploy_" + recipe_id
> +        i_and_d_script_path = os.path.join(
> +            self._workspace_scripts_dir(recipe_name), i_and_d_script)
> +        self.assertExists(i_and_d_script_path)
> +        del_script = "delete_package_dirs_" + recipe_id
> +        del_script_path = os.path.join(
> +            self._workspace_scripts_dir(recipe_name), del_script)
> +        self.assertExists(del_script_path)
> +        runCmd(del_script_path, cwd=tempdir)
> +
> +    def _devtool_ide_sdk_qemu(self, tempdir, qemu, recipe_name, example_exe):
> +        """Verify deployment and execution in Qemu system work for one recipe.
> +
> +        This function checks the entire SDK workflow: changing the code, recompiling
> +        it and deploying it back to Qemu, and checking that the changes have been
> +        incorporated into the provided binaries. It also runs the tests of the recipe.
> +        """
> +        recipe_id, _ = self._get_recipe_ids(recipe_name)
> +        i_and_d_script = "install_and_deploy_" + recipe_id
> +        install_deploy_cmd = os.path.join(
> +            self._workspace_scripts_dir(recipe_name), i_and_d_script)
> +        self.assertExists(install_deploy_cmd,
> +                          '%s script not found' % install_deploy_cmd)
> +        runCmd(install_deploy_cmd)
> +
> +        MAGIC_STRING_ORIG = "Magic: 123456789"
> +        MAGIC_STRING_NEW = "Magic: 987654321"
> +        ptest_cmd = "ptest-runner " + recipe_name
> +
> +        # validate that SSH is working
> +        status, _ = qemu.run("uname")
> +        self.assertEqual(
> +            status, 0, msg="Failed to connect to the SSH server on Qemu")
> +
> +        # Verify the unmodified example prints the magic string
> +        status, output = qemu.run(example_exe)
> +        self.assertEqual(status, 0, msg="%s failed: %s" %
> +                         (example_exe, output))
> +        self.assertIn(MAGIC_STRING_ORIG, output)
> +
> +        # Verify the unmodified ptests work
> +        status, output = qemu.run(ptest_cmd)
> +        self.assertEqual(status, 0, msg="%s failed: %s" % (ptest_cmd, output))
> +        self.assertIn("PASS: cpp-example-lib", output)
> +
> +        # Replace the Magic String in the code, compile and deploy to Qemu
> +        cpp_example_lib_hpp = os.path.join(tempdir, 'cpp-example-lib.hpp')
> +        with open(cpp_example_lib_hpp, 'r') as file:
> +            cpp_code = file.read()
> +            cpp_code = cpp_code.replace(MAGIC_STRING_ORIG, MAGIC_STRING_NEW)
> +        with open(cpp_example_lib_hpp, 'w') as file:
> +            file.write(cpp_code)
> +        runCmd(install_deploy_cmd, cwd=tempdir)
> +
> +        # Verify the modified example prints the modified magic string
> +        status, output = qemu.run(example_exe)
> +        self.assertEqual(status, 0, msg="%s failed: %s" %
> +                         (example_exe, output))
> +        self.assertNotIn(MAGIC_STRING_ORIG, output)
> +        self.assertIn(MAGIC_STRING_NEW, output)
> +
> +        # Verify the modified example ptests work
> +        status, output = qemu.run(ptest_cmd)
> +        self.assertEqual(status, 0, msg="%s failed: %s" % (ptest_cmd, output))
> +        self.assertIn("PASS: cpp-example-lib", output)
> +
> +    def _gdb_cross(self):
> +        """Verify gdb-cross is provided by devtool ide-sdk"""
> +        target_arch = self.td["TARGET_ARCH"]
> +        target_sys = self.td["TARGET_SYS"]
> +        gdb_recipe = "gdb-cross-" + target_arch
> +        gdb_binary = target_sys + "-gdb"
> +
> +        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", gdb_recipe)
> +        r = runCmd("%s --version" % gdb_binary,
> +                   native_sysroot=native_sysroot, target_sys=target_sys)
> +        self.assertEqual(r.status, 0)
> +        self.assertIn("GNU gdb", r.output)
> +
> +    def _gdb_cross_debugging(self, qemu, recipe_name, example_exe):
> +        """Verify gdb-cross is working
> +
> +        Test remote debugging:
> +        break main
> +        run
> +        continue
> +        """
> +        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
> +        gdbserver_script = os.path.join(self._workspace_scripts_dir(
> +            recipe_name), 'gdbserver_1234_usr-bin-' + example_exe + '_m')
> +        gdb_script = os.path.join(self._workspace_scripts_dir(
> +            recipe_name), 'gdb_1234_usr-bin-' + example_exe)
> +
> +        # Start a gdbserver
> +        r = runCmd(gdbserver_script)
> +        self.assertEqual(r.status, 0)
> +
> +        # Check there is a gdbserver running
> +        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'ps'))
> +        self.assertEqual(r.status, 0)
> +        self.assertIn("gdbserver ", r.output)
> +
> +        # Check the pid file is correct
> +        test_cmd = "cat /proc/$(cat /tmp/gdbserver_1234_usr-bin-" + \
> +            example_exe + "/pid)/cmdline"
> +        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, test_cmd))
> +        self.assertEqual(r.status, 0)
> +        self.assertIn("gdbserver", r.output)
> +
> +        # Test remote debugging works
> +        r = runCmd(
> +            gdb_script + " --batch -ex 'break main' --ex 'run' -ex 'continue'")
> +        self.assertEqual(r.status, 0)
> +        self.assertIn("Breakpoint 1, main", r.output)
> +        self.assertIn("exited normally", r.output)
> +
> +        # Stop the gdbserver
> +        r = runCmd(gdbserver_script + ' stop')
> +        self.assertEqual(r.status, 0)
> +
> +        # Check there is no gdbserver running
> +        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'ps'))
> +        self.assertEqual(r.status, 0)
> +        self.assertNotIn("gdbserver ", r.output)
> +
> +    def _verify_cmake_preset(self, tempdir):
> +        """Verify the generated cmake preset works as expected
> +
> +        Check if compiling works
> +        Check if unit tests can be executed in qemu (not qemu-system)
> +        """
> +        with open(os.path.join(tempdir, 'CMakeUserPresets.json')) as cmake_preset_j:
> +            cmake_preset_d = json.load(cmake_preset_j)
> +        config_presets = cmake_preset_d["configurePresets"]
> +        self.assertEqual(len(config_presets), 1)
> +        cmake_exe = config_presets[0]["cmakeExecutable"]
> +        preset_name = config_presets[0]["name"]
> +
> +        # Verify the wrapper for cmake native is available
> +        self.assertExists(cmake_exe)
> +
> +        # Verify the cmake preset generated by devtool ide-sdk is available
> +        result = runCmd('%s --list-presets' % cmake_exe, cwd=tempdir)
> +        self.assertIn(preset_name, result.output)
> +
> +        # Verify cmake re-uses the o files compiled by bitbake
> +        result = runCmd('%s --build --preset %s' %
> +                        (cmake_exe, preset_name), cwd=tempdir)
> +        self.assertIn("ninja: no work to do.", result.output)
> +
> +        # Verify the unit tests work (in Qemu user mode)
> +        result = runCmd('%s --build --preset %s --target test' %
> +                        (cmake_exe, preset_name), cwd=tempdir)
> +        self.assertIn("100% tests passed", result.output)
> +
> +        # Verify re-building and testing works again
> +        result = runCmd('%s --build --preset %s --target clean' %
> +                        (cmake_exe, preset_name), cwd=tempdir)
> +        self.assertIn("Cleaning", result.output)
> +        result = runCmd('%s --build --preset %s' %
> +                        (cmake_exe, preset_name), cwd=tempdir)
> +        self.assertIn("Building", result.output)
> +        self.assertIn("Linking", result.output)
> +        result = runCmd('%s --build --preset %s --target test' %
> +                        (cmake_exe, preset_name), cwd=tempdir)
> +        self.assertIn("Running tests...", result.output)
> +        self.assertIn("100% tests passed", result.output)
> +
> +    @OETestTag("runqemu")
> +    def test_devtool_ide_sdk_none_qemu(self):
> +        """Start qemu-system and run tests for multiple recipes. ide=none is used."""
> +        recipe_names = ["cmake-example", "meson-example"]
> +        testimage = "oe-selftest-image"
> +
> +        self._check_workspace()
> +        self._write_bb_config(recipe_names)
> +        self._check_runqemu_prerequisites()
> +
> +        # Verify deployment to Qemu (system mode) works
> +        bitbake(testimage)
> +        with runqemu(testimage, runqemuparams="nographic") as qemu:
> +            # cmake-example recipe
> +            recipe_name = "cmake-example"
> +            example_exe = "cmake-example"
> +            build_file = "CMakeLists.txt"
> +            tempdir = self._devtool_ide_sdk_recipe(
> +                recipe_name, build_file, testimage)
> +            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
> +                recipe_name, testimage, qemu.ip)
> +            runCmd(bitbake_sdk_cmd)
> +            self._verify_cmake_preset(tempdir)
> +            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
> +            # Verify the oe-scripts sym-link is valid
> +            self.assertEqual(self._workspace_scripts_dir(
> +                recipe_name), self._sources_scripts_dir(tempdir))
> +            # Verify GDB is working after devtool ide-sdk
> +            self._gdb_cross()
> +            self._gdb_cross_debugging(qemu, recipe_name, example_exe)
> +
> +            # meson-example recipe
> +            recipe_name = "meson-example"
> +            example_exe = "mesonex"
> +            build_file = "meson.build"
> +            tempdir = self._devtool_ide_sdk_recipe(
> +                recipe_name, build_file, testimage)
> +            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
> +                recipe_name, testimage, qemu.ip)
> +            runCmd(bitbake_sdk_cmd)
> +            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
> +            # Verify the oe-scripts sym-link is valid
> +            self.assertEqual(self._workspace_scripts_dir(
> +                recipe_name), self._sources_scripts_dir(tempdir))
> +            # Verify GDB is working after devtool ide-sdk
> +            self._gdb_cross()
> +            self._gdb_cross_debugging(qemu, recipe_name, example_exe)
> +
> +    def test_devtool_ide_sdk_code_cmake(self):
> +        """Verify a cmake recipe works with ide=code mode"""
> +        recipe_name = "cmake-example"
> +        build_file = "CMakeLists.txt"
> +        testimage = "oe-selftest-image"
> +
> +        self._check_workspace()
> +        self._write_bb_config([recipe_name])
> +        tempdir = self._devtool_ide_sdk_recipe(
> +            recipe_name, build_file, testimage)
> +        bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@192.168.17.17 -c --ide=code' % (
> +            recipe_name, testimage)
> +        runCmd(bitbake_sdk_cmd)
> +        self._verify_cmake_preset(tempdir)
> +        self._verify_install_script_code(tempdir,  recipe_name)
> +        self._gdb_cross()
> +
> +    def test_devtool_ide_sdk_code_meson(self):
> +        """Verify a meson recipe works with ide=code mode"""
> +        recipe_name = "meson-example"
> +        build_file = "meson.build"
> +        testimage = "oe-selftest-image"
> +
> +        self._check_workspace()
> +        self._write_bb_config([recipe_name])
> +        tempdir = self._devtool_ide_sdk_recipe(
> +            recipe_name, build_file, testimage)
> +        bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@192.168.17.17 -c --ide=code' % (
> +            recipe_name, testimage)
> +        runCmd(bitbake_sdk_cmd)
> +
> +        with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_j:
> +            settings_d = json.load(settings_j)
> +        meson_exe = settings_d["mesonbuild.mesonPath"]
> +        meson_build_folder = settings_d["mesonbuild.buildFolder"]
> +
> +        # Verify the wrapper for meson native is available
> +        self.assertExists(meson_exe)
> +
> +        # Verify meson re-uses the o files compiled by bitbake
> +        result = runCmd('%s compile -C  %s' %
> +                        (meson_exe, meson_build_folder), cwd=tempdir)
> +        self.assertIn("ninja: no work to do.", result.output)
> +
> +        # Verify the unit tests work (in Qemu)
> +        runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir)
> +
> +        # Verify re-building and testing works again
> +        result = runCmd('%s compile -C  %s --clean' %
> +                        (meson_exe, meson_build_folder), cwd=tempdir)
> +        self.assertIn("Cleaning...", result.output)
> +        result = runCmd('%s compile -C  %s' %
> +                        (meson_exe, meson_build_folder), cwd=tempdir)
> +        self.assertIn("Linking target", result.output)
> +        runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir)
> +
> +        self._verify_install_script_code(tempdir,  recipe_name)
> +        self._gdb_cross()
> +
> +    def test_devtool_ide_sdk_shared_sysroots(self):
> +        """Verify the shared sysroot SDK"""
> +
> +        # Handle the workspace (which is not needed by this test case)
> +        self._check_workspace()
> +
> +        result_init = runCmd(
> +            'devtool ide-sdk -m shared oe-selftest-image cmake-example meson-example --ide=code')
> +        bb_vars = get_bb_vars(
> +            ['REAL_MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_IMAGE', 'COREBASE'], "meta-ide-support")
> +        environment_script = 'environment-setup-%s' % bb_vars['REAL_MULTIMACH_TARGET_SYS']
> +        deploydir = bb_vars['DEPLOY_DIR_IMAGE']
> +        environment_script_path = os.path.join(deploydir, environment_script)
> +        cpp_example_src = os.path.join(
> +            bb_vars['COREBASE'], 'meta-selftest', 'recipes-test', 'cpp', 'files')
> +
> +        # Verify the cross environment script is available
> +        self.assertExists(environment_script_path)
> +
> +        def runCmdEnv(cmd, cwd):
> +            cmd = '/bin/sh -c ". %s > /dev/null && %s"' % (
> +                environment_script_path, cmd)
> +            return runCmd(cmd, cwd)
> +
> +        # Verify building the C++ example works with CMake
> +        tempdir_cmake = tempfile.mkdtemp(prefix='devtoolqa')
> +        self.track_for_cleanup(tempdir_cmake)
> +
> +        result_cmake = runCmdEnv("which cmake", cwd=tempdir_cmake)
> +        cmake_native = os.path.normpath(result_cmake.output.strip())
> +        self.assertExists(cmake_native)
> +
> +        runCmdEnv('cmake %s' % cpp_example_src, cwd=tempdir_cmake)
> +        runCmdEnv('cmake --build %s' % tempdir_cmake, cwd=tempdir_cmake)
> +
> +        # Verify the printed note really referres to a cmake executable
> +        cmake_native_code = ""
> +        for line in result_init.output.splitlines():
> +            m = re.search(r'"cmake.cmakePath": "(.*)"', line)
> +            if m:
> +                cmake_native_code = m.group(1)
> +                break
> +        self.assertExists(cmake_native_code)
> +        self.assertEqual(cmake_native, cmake_native_code)
> +
> +        # Verify building the C++ example works with Meson
> +        tempdir_meson = tempfile.mkdtemp(prefix='devtoolqa')
> +        self.track_for_cleanup(tempdir_meson)
> +
> +        result_cmake = runCmdEnv("which meson", cwd=tempdir_meson)
> +        meson_native = os.path.normpath(result_cmake.output.strip())
> +        self.assertExists(meson_native)
> +
> +        runCmdEnv('meson setup %s' % tempdir_meson, cwd=cpp_example_src)
> +        runCmdEnv('meson compile', cwd=tempdir_meson)
> +
> +    def test_devtool_ide_sdk_plugins(self):
> +        """Test that devtool ide-sdk can use plugins from other layers."""
> +
> +        # We need a workspace layer and a modified recipe (but no image)
> +        modified_recipe_name = "meson-example"
> +        modified_build_file = "meson.build"
> +        testimage = "oe-selftest-image"
> +        shared_recipe_name = "cmake-example"
> +
> +        self._check_workspace()
> +        self._write_bb_config([modified_recipe_name])
> +        tempdir = self._devtool_ide_sdk_recipe(
> +            modified_recipe_name, modified_build_file, None)
> +
> +        IDE_RE = re.compile(r'.*--ide \{(.*)\}.*')
> +
> +        def get_ides_from_help(help_str):
> +            m = IDE_RE.search(help_str)
> +            return m.group(1).split(',')
> +
> +        # verify the default plugins are available but the foo plugin is not
> +        result = runCmd('devtool ide-sdk -h')
> +        found_ides = get_ides_from_help(result.output)
> +        self.assertIn('code', found_ides)
> +        self.assertIn('none', found_ides)
> +        self.assertNotIn('foo', found_ides)
> +
> +        shared_config_file = os.path.join(tempdir, 'shared-config.txt')
> +        shared_config_str = 'Dummy shared IDE config'
> +        modified_config_file = os.path.join(tempdir, 'modified-config.txt')
> +        modified_config_str = 'Dummy modified IDE config'
> +
> +        # Generate a foo plugin in the workspace layer
> +        plugin_dir = os.path.join(
> +            self.workspacedir, 'lib', 'devtool', 'ide_plugins')
> +        os.makedirs(plugin_dir)
> +        plugin_code = 'from devtool.ide_plugins import IdeBase\n\n'
> +        plugin_code += 'class IdeFoo(IdeBase):\n'
> +        plugin_code += '    def setup_shared_sysroots(self, shared_env):\n'
> +        plugin_code += '        with open("%s", "w") as config_file:\n' % shared_config_file
> +        plugin_code += '            config_file.write("%s")\n\n' % shared_config_str
> +        plugin_code += '    def setup_modified_recipe(self, args, image_recipe, modified_recipe):\n'
> +        plugin_code += '        with open("%s", "w") as config_file:\n' % modified_config_file
> +        plugin_code += '            config_file.write("%s")\n\n' % modified_config_str
> +        plugin_code += 'def register_ide_plugin(ide_plugins):\n'
> +        plugin_code += '    ide_plugins["foo"] = IdeFoo\n'
> +
> +        plugin_py = os.path.join(plugin_dir, 'ide_foo.py')
> +        with open(plugin_py, 'w') as plugin_file:
> +            plugin_file.write(plugin_code)
> +
> +        # Verify the foo plugin is available as well
> +        result = runCmd('devtool ide-sdk -h')
> +        found_ides = get_ides_from_help(result.output)
> +        self.assertIn('code', found_ides)
> +        self.assertIn('none', found_ides)
> +        self.assertIn('foo', found_ides)
> +
> +        # Verify the foo plugin generates a shared config
> +        result = runCmd(
> +            'devtool ide-sdk -m shared --skip-bitbake --ide foo %s' % shared_recipe_name)
> +        with open(shared_config_file) as shared_config:
> +            shared_config_new = shared_config.read()
> +        self.assertEqual(shared_config_str, shared_config_new)
> +
> +        # Verify the foo plugin generates a modified config
> +        result = runCmd('devtool ide-sdk --skip-bitbake --ide foo %s %s' %
> +                        (modified_recipe_name, testimage))
> +        with open(modified_config_file) as modified_config:
> +            modified_config_new = modified_config.read()
> +        self.assertEqual(modified_config_str, modified_config_new)
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193622): https://lists.openembedded.org/g/openembedded-core/message/193622
> Mute This Topic: https://lists.openembedded.org/mt/103727322/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

