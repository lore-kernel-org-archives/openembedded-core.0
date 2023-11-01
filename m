Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85459C4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 11:01:49 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.4304.1698836505302384103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 04:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QqxXD6E8;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so11321826a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698836503; x=1699441303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBUu5PrjJ5aVY/XWUuGdsMK7/6v7E2hRt8IXODN8Xwk=;
        b=QqxXD6E8iuWegaRNhJmj7BOEcfAFJhOB2ZE+oCe7DxspvptTf8bpyIpKl7n1R6KyOa
         qLnPqrNADZ4IpbZxp5HXgHw2kz01xHJtyfeVneoZKIHpXQn1KQ33ZsM9NjSwLfPHUjQ/
         0LPxpAhhfr0pJ6eewnLt9TrdacojTNf5hjnnyF1RucYn7Q1FSKO6R1SfNfByL6UvyTEt
         0i2ksrE1Mpu3uLF/VKsJPV/Hh3sIz9copiwgA0NzTbQdKxuthy3teLefVUsu/0TzRGaH
         bRaBJ+IqP3gJDWBIUzv57HnHILuvQkYJoN8varV2oUXMheFEfCQorLL3cD0IzE6E2CBX
         H17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836503; x=1699441303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBUu5PrjJ5aVY/XWUuGdsMK7/6v7E2hRt8IXODN8Xwk=;
        b=S6CLexms2qzMmfpUQi2Ol+iYdzEb0JnRaxixdYHAo+rIIFpTabWgl0VWScYb23/n/I
         py5Pkgvdek8zjYdqEsgtoo3IAocZV+e3jN3UjdcSH4+bLCLQ65k+/UTEqhvSjPcMmycb
         pQ4ITwGzBWwlw4c9FaIbsfcmZQP9DmMRWJzof34IPRHgqtF/Qyb8ckkvHSYnvKIpUAkk
         Cy270wmXslJ7mHQfjMWCTj4kV/oUoA9uXxIWUe8zKPgJPUNJaHPrDauSAsWEYU5Y2cdG
         11jXVU9RHYcfUz8j2FGq/mdpzUh/7ju6nDZJbqSjTfUbH8LPGAXIq3dbzJhGZdX3IUuZ
         LsFQ==
X-Gm-Message-State: AOJu0YwiLdSJUq+KfGW1OE2cqJzQPMpakrXXDjynt8TZ7/mscMBmHazu
	yH1AZQWQH7N4dyxgG4u5QdPNwMvzHN0=
X-Google-Smtp-Source: AGHT+IHgGwtGOrcAVjQ1Dfizec+ktULHpQ8ghY/v1n7Q1jfuzChhJ3AdufFXHMdbs3WMAtMlxHKzWg==
X-Received: by 2002:a17:906:d90:b0:9ba:a38:531e with SMTP id m16-20020a1709060d9000b009ba0a38531emr1368491eji.52.1698836503496;
        Wed, 01 Nov 2023 04:01:43 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090607cc00b009c7608eb499sm2262426ejc.94.2023.11.01.04.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:01:43 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v8 7/8] oe-selftest devtool: ide tests
Date: Wed,  1 Nov 2023 12:01:28 +0100
Message-ID: <20231101110129.647878-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101110129.647878-1-adrian.freihofer@siemens.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 11:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189905

Add some oe-selftests for the new devtool ide plugin. Most of the
workflows are covered.

Many thanks to Enguerrand de Ribaucourt for testing and bug fixing.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 274 ++++++++++++++++++++++++
 1 file changed, 274 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b5c488be8e8..8407465efaa 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -11,6 +11,7 @@ import tempfile
 import glob
 import fnmatch
 import unittest
+import json
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
@@ -2199,3 +2200,276 @@ class DevtoolUpgradeTests(DevtoolBase):
 
         #Step 4.5
         runCmd("grep %s %s" % (modconfopt, codeconfigfile))
+
+
+
+class DevtoolIdeTests(DevtoolBase):
+    def __write_bb_config(self, recipe_names):
+        """Helper to write the bitbake local.conf file"""
+        conf_lines = [
+            'IMAGE_GEN_DEBUGFS = "1"',
+            'IMAGE_INSTALL:append = " gdbserver %s"' % ' '.join([r + '-ptest' for r in recipe_names])
+        ]
+        self.write_config("\n".join(conf_lines))
+
+    def __devtool_ide_recipe(self, recipe_name, build_file, testimage):
+        """Setup a recipe for working with devtool ide
+
+        Basically devtool modify -x followed by some tests
+        """
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        result = runCmd('devtool modify %s -x %s' % (recipe_name, tempdir))
+        self.assertExists(os.path.join(tempdir, build_file),
+                        'Extracted source could not be found')
+        self.assertExists(os.path.join(self.workspacedir, 'conf',
+                        'layer.conf'), 'Workspace directory not created')
+        matches = glob.glob(os.path.join(self.workspacedir,
+                            'appends', recipe_name + '.bbappend'))
+        self.assertTrue(matches, 'bbappend not created %s' % result.output)
+
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(recipe_name, result.output)
+        self.assertIn(tempdir, result.output)
+        self._check_src_repo(tempdir)
+
+        # Usually devtool ide would initiate the build of the SDK.
+        # But there is a circular dependency with starting Qemu and passing the IP of runqemu to devtool ide.
+        bitbake("%s qemu-native qemu-helper-native" % testimage)
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        self.add_command_to_tearDown('bitbake -c clean %s' % testimage)
+        self.add_command_to_tearDown('rm -f %s/%s*' % (deploy_dir_image, testimage))
+
+        return tempdir
+
+    def __get_recipe_ids(self, recipe_name):
+        bb_vars = get_bb_vars(['PACKAGE_ARCH'])
+        package_arch = bb_vars['PACKAGE_ARCH']
+        recipe_id = recipe_name + "-" + package_arch
+        recipe_id_pretty = recipe_name + ": " + package_arch
+        return (recipe_id, recipe_id_pretty)
+
+    def __verify_install_script_code(self, tempdir, recipe_name):
+        """Verify the scripts referred by the tasks.json file are fine.
+
+        This function does not depend on Qemu. Therefore it verifies the scripts
+        exists and the install step works as expected. But it does not try to
+        deploy to Qemu.
+        """
+        recipe_id, recipe_id_pretty = self.__get_recipe_ids(recipe_name)
+        with open(os.path.join(tempdir, '.vscode', 'tasks.json')) as tasks_j:
+            tasks_d = json.load(tasks_j)
+        tasks = tasks_d["tasks"]
+        task_install = next((task for task in tasks if task["label"] == "install && deploy-target %s"  % recipe_id_pretty), None)
+        self.assertIsNot(task_install, None)
+        install_deploy_cmd = task_install["command"]
+        # execute only the bb_run_do_install script since the deploy would require e.g. Qemu running.
+        workspace_temp = os.path.join(self.builddir, 'workspace', 'temp', recipe_name)
+        i_and_d_script = "install_and_deploy_" + recipe_id
+        i_and_d_script_path = os.path.join(workspace_temp, i_and_d_script)
+        self.assertExists(i_and_d_script_path)
+        i_script = "bb_run_do_install_" + recipe_id
+        install_cmd = install_deploy_cmd.replace(i_and_d_script, i_script)
+        install_cmd_path = os.path.join(workspace_temp, install_cmd)
+        self.assertExists(install_cmd_path)
+        runCmd(install_cmd, cwd=tempdir)
+
+    def __devtool_ide_qemu(self, tempdir, qemu, recipe_name, example_exe):
+        """Verify deployment and execution in Qemu system work for one recipe.
+
+        This function checks the entire SDK workflow: changing the code, recompiling
+        it and deploying it back to Qemu, and checking that the changes have been
+        incorporated into the provided binaries. It also runs the tests of the recipe.
+        """
+        recipe_id, _ = self.__get_recipe_ids(recipe_name)
+        i_and_d_script = "install_and_deploy_" + recipe_id
+        install_deploy_cmd = os.path.join(self.builddir, 'workspace', 'temp', recipe_name, i_and_d_script)
+        self.assertExists(install_deploy_cmd, '%s script not found' % install_deploy_cmd)
+        runCmd(install_deploy_cmd)
+
+        MAGIC_STRING_ORIG = "Magic: 123456789"
+        MAGIC_STRING_NEW = "Magic: 987654321"
+        ptest_cmd = "ptest-runner " + recipe_name
+
+        # validate that SSH is working
+        status, _ = qemu.run("uname")
+        self.assertEqual(status, 0, msg="Failed to connect to the SSH server on Qemu")
+
+        # Verify the unmodified example prints the magic string
+        status, output = qemu.run(example_exe)
+        self.assertEqual(status, 0, msg="%s failed: %s" % (example_exe, output))
+        self.assertIn(MAGIC_STRING_ORIG, output)
+
+        # Verify the unmodified ptests work
+        status, output = qemu.run(ptest_cmd)
+        self.assertEqual(status, 0, msg="%s failed: %s" % (ptest_cmd, output))
+        self.assertIn("PASS: cpp-example-lib", output)
+
+        # Replace the Magic String in the code, compile and deploy to Qemu
+        cpp_example_lib_hpp = os.path.join(tempdir, 'cpp-example-lib.hpp')
+        with open(cpp_example_lib_hpp, 'r') as file:
+            cpp_code = file.read()
+            cpp_code = cpp_code.replace(MAGIC_STRING_ORIG, MAGIC_STRING_NEW)
+        with open(cpp_example_lib_hpp, 'w') as file:
+            file.write(cpp_code)
+        runCmd(install_deploy_cmd, cwd=tempdir)
+
+        # Verify the modified example prints the modified magic string
+        status, output = qemu.run(example_exe)
+        self.assertEqual(status, 0, msg="%s failed: %s" % (example_exe, output))
+        self.assertNotIn(MAGIC_STRING_ORIG, output)
+        self.assertIn(MAGIC_STRING_NEW, output)
+
+        # Verify the modified example ptests work
+        status, output = qemu.run(ptest_cmd)
+        self.assertEqual(status, 0, msg="%s failed: %s" % (ptest_cmd, output))
+        self.assertIn("PASS: cpp-example-lib", output)
+
+    def __verify_cmake_preset(self, tempdir):
+        """Verify the generated cmake preset works as expected
+
+        Check if compiling works
+        Check if unit tests can be executed in qemu (not qemu-system)
+        """
+        with open(os.path.join(tempdir, 'CMakeUserPresets.json')) as cmake_preset_j:
+            cmake_preset_d = json.load(cmake_preset_j)
+        config_presets = cmake_preset_d["configurePresets"]
+        self.assertEqual(len(config_presets), 1)
+        cmake_exe = config_presets[0]["cmakeExecutable"]
+        preset_name = config_presets[0]["name"]
+
+        # Verify the wrapper for cmake native is available
+        self.assertExists(cmake_exe)
+
+        # Verify the cmake preset generated by devtool ide is available
+        result = runCmd('%s --list-presets' % cmake_exe, cwd=tempdir)
+        self.assertIn(preset_name, result.output)
+
+        # Verify cmake re-uses the o files compiled by bitbake
+        result = runCmd('%s --build --preset %s' % (cmake_exe, preset_name), cwd=tempdir)
+        self.assertIn("ninja: no work to do.", result.output)
+
+        # Verify the unit tests work (in Qemu user mode)
+        result = runCmd('%s --build --preset %s --target test' % (cmake_exe, preset_name), cwd=tempdir)
+        self.assertIn("100% tests passed", result.output)
+
+        # Verify re-building and testing works again
+        result = runCmd('%s --build --preset %s --target clean' % (cmake_exe, preset_name), cwd=tempdir)
+        self.assertIn("Cleaning", result.output)
+        result = runCmd('%s --build --preset %s' % (cmake_exe, preset_name), cwd=tempdir)
+        self.assertIn("Building", result.output)
+        self.assertIn("Linking", result.output)
+        result = runCmd('%s --build --preset %s --target test' % (cmake_exe, preset_name), cwd=tempdir)
+        self.assertIn("Running tests...", result.output)
+        self.assertIn("100% tests passed", result.output)
+
+    @OETestTag("runqemu")
+    def test_devtool_ide_none_qemu(self):
+        """Start qemu-system and run tests for multiple recipes. ide=none is used."""
+        recipe_names = ["cmake-example", "meson-example"]
+        testimage = "oe-selftest-image"
+
+        self.__write_bb_config(recipe_names)
+        self._check_runqemu_prerequisites()
+
+        # Verify deployment to Qemu (system mode) works
+        bitbake(testimage)
+        with runqemu(testimage, runqemuparams="nographic") as qemu:
+            # cmake-example recipe
+            recipe_name = "cmake-example"
+            example_exe = "cmake-example"
+            build_file = "CMakeLists.txt"
+            tempdir = self.__devtool_ide_recipe(recipe_name, build_file, testimage)
+            bitbake_sdk_cmd = 'devtool ide %s %s -t root@%s -c --ide=none' % (recipe_name, testimage, qemu.ip)
+            runCmd(bitbake_sdk_cmd)
+            self.__verify_cmake_preset(tempdir)
+            self.__devtool_ide_qemu(tempdir, qemu, recipe_name, example_exe)
+
+            # meson-example recipe
+            recipe_name = "meson-example"
+            example_exe = "mesonex"
+            build_file = "meson.build"
+            tempdir = self.__devtool_ide_recipe(recipe_name, build_file, testimage)
+            bitbake_sdk_cmd = 'devtool ide %s %s -t root@%s -c --ide=none' % (recipe_name, testimage, qemu.ip)
+            runCmd(bitbake_sdk_cmd)
+            self.__devtool_ide_qemu(tempdir, qemu, recipe_name, example_exe)
+
+
+    def test_devtool_ide_code_cmake(self):
+        """Verify a cmake recipe works with ide=code mode"""
+        recipe_name = "cmake-example"
+        build_file = "CMakeLists.txt"
+        testimage = "oe-selftest-image"
+
+        self.__write_bb_config([recipe_name])
+        tempdir = self.__devtool_ide_recipe(recipe_name, build_file, testimage)
+        bitbake_sdk_cmd = 'devtool ide %s %s -t root@192.168.17.17 -c --ide=code' % (recipe_name, testimage)
+        runCmd(bitbake_sdk_cmd)
+        self.__verify_cmake_preset(tempdir)
+        self.__verify_install_script_code(tempdir,  recipe_name)
+
+    def test_devtool_ide_code_meson(self):
+        """Verify a meson recipe works with ide=code mode"""
+        recipe_name = "meson-example"
+        build_file = "meson.build"
+        testimage = "oe-selftest-image"
+
+        self.__write_bb_config([recipe_name])
+        tempdir = self.__devtool_ide_recipe(recipe_name, build_file, testimage)
+        bitbake_sdk_cmd = 'devtool ide %s %s -t root@192.168.17.17 -c --ide=code' % (recipe_name, testimage)
+        runCmd(bitbake_sdk_cmd)
+
+        with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_j:
+            settings_d = json.load(settings_j)
+        meson_exe = settings_d["mesonbuild.mesonPath"]
+        meson_build_folder = settings_d["mesonbuild.buildFolder"]
+
+        # Verify the wrapper for meson native is available
+        self.assertExists(meson_exe)
+
+        # Verify meson re-uses the o files compiled by bitbake
+        result = runCmd('%s compile -C  %s' % (meson_exe, meson_build_folder), cwd=tempdir)
+        self.assertIn("ninja: no work to do.", result.output)
+
+        # Verify the unit tests work (in Qemu)
+        runCmd('%s test -C  %s' % (meson_exe, meson_build_folder), cwd=tempdir)
+
+        # Verify re-building and testing works again
+        result = runCmd('%s compile -C  %s --clean' % (meson_exe, meson_build_folder), cwd=tempdir)
+        self.assertIn("Cleaning...", result.output)
+        result = runCmd('%s compile -C  %s' % (meson_exe, meson_build_folder), cwd=tempdir)
+        self.assertIn("Linking target", result.output)
+        runCmd('%s test -C  %s' % (meson_exe, meson_build_folder), cwd=tempdir)
+
+        self.__verify_install_script_code(tempdir,  recipe_name)
+
+    def test_devtool_ide_shared_sysroots(self):
+        """Verify the shared sysroot SDK without a recipe works fine."""
+        result = runCmd('devtool ide none oe-selftest-image --ide=code')
+        bb_vars = get_bb_vars(['MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_IMAGE', 'COREBASE'])
+        environment_script = 'environment-setup-%s' % bb_vars['MULTIMACH_TARGET_SYS']
+        deploydir = bb_vars['DEPLOY_DIR_IMAGE']
+        environment_script_path = os.path.join(deploydir, environment_script)
+
+        # Verify the printed note really referres to a cmake executable
+        cmake_native = ""
+        for line in result.output.splitlines():
+            m = re.search(r'"cmake.cmakePath": "(.*)"', line)
+            if m:
+                cmake_native = m.group(1)
+                break
+
+        self.assertExists(cmake_native)
+        self.assertExists(environment_script_path)
+
+        # Verify building the cmake-example works
+        cmake_example_src = os.path.join(bb_vars['COREBASE'], 'meta-selftest', 'recipes-test', 'cpp', 'files')
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        result = runCmd('%s %s' % (cmake_native, cmake_example_src), cwd=tempdir)
+        result = runCmd('%s --build %s' % (cmake_native, tempdir), cwd=tempdir)
-- 
2.41.0


