Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DB5EE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 16:19:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.39128.1694362770033274548
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 09:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ehn2yqww;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso3781272f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 09:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694362768; x=1694967568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk/OdDDRABIV0HrxQ+Ir4uIVgRSXUf8pgoJihVXB03o=;
        b=ehn2yqwwf4Oz6i0w5S6GhDsGo6sK1x7jP1G4umVI2h3nQuHc2B4ECLsmUdERXmK7bd
         CeaHeF63yYlUf5qTIoeLeGUCqj4l65ih+z+J1BXT3I4z+FADncmfMYVXr3YK6bU6vGUY
         VMJfklTh6wMLPVsuyp6XkWQkzBixLib2zgd4o1qoqfHjMfIJZUSECiCDJLbVFIUh5Doc
         bNl29G1gKfEEa9cNlOrtJE2mmIt5o/7bVevklEVC4igZ6dLweGkulSjUPRnfrAchRd+0
         8KmdxY3E7BZQmmTTizp3YHOnHwSlKUizVLndCl3x9NLZLKJI5xhtlHg5ZqjyMUREX8ej
         yOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694362768; x=1694967568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wk/OdDDRABIV0HrxQ+Ir4uIVgRSXUf8pgoJihVXB03o=;
        b=hwixCp1k3MeMhrvvw0EYC1FGR0BN+JI62LJ/I/RTTd/MphBGL1dyqvjPRgqO186RnT
         NmBwLvXYtb3eKMB2/fHZloObpfxHnR0YM2b5/4SvhkFAL17ON4TpukaVMWjMV/BK65Fm
         l/5G/qm6AOQpaTVkJmMIOaV+ZKkX4xLF9p+pCD0uFzUvk+M9ycFX8GVZB5I/MzI3WeYW
         H1zaXRzL75lenvSpOOxv9u/p0/w+7vojifoRzK70zGvGUz3JxlbOW3ToNLMrZoGMQXI9
         r9rtOMxK8EaD/F/PpfkRAvaZd3svLpeDeZqW0JlQ9vgfUZZIVTXVIs5xijK8wj+bskeU
         vcVg==
X-Gm-Message-State: AOJu0YwvItEigg1Qu1bL+xsu6si4S/8kTuYP0yeb24l5WSwtCB3XH8D5
	cUE8BzNDG9OFdhR4SoTrQJZ5Vvt6oak=
X-Google-Smtp-Source: AGHT+IFMcwtK7h/bRJxusA/rXPcaBREQgjuXJ9kw7Cfw3038kMCpuxISsQ9YSqY3RS4hccDGLMbBHA==
X-Received: by 2002:adf:d082:0:b0:31d:c3d2:4300 with SMTP id y2-20020adfd082000000b0031dc3d24300mr5055806wrh.71.1694362768104;
        Sun, 10 Sep 2023 09:19:28 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d408c000000b003142ea7a661sm7605431wrp.21.2023.09.10.09.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 09:19:27 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v6 11/12] oe-selftest devtool: ide tests
Date: Sun, 10 Sep 2023 17:52:37 +0200
Message-ID: <20230910161850.4032227-12-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 16:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187469

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 179 ++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b577f6d62a1..158e016b895 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -11,6 +11,7 @@ import tempfile
 import glob
 import fnmatch
 import unittest
+import json
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
@@ -2196,3 +2197,181 @@ class DevtoolUpgradeTests(DevtoolBase):
 
         #Step 4.5
         runCmd("grep %s %s" % (modconfopt, codeconfigfile))
+
+
+
+class DevtoolIdeTests(DevtoolBase):
+    def __devtool_ide_recipe(self, recipe_name, build_file, testimage):
+        self._check_runqemu_prerequisites()
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        conf_lines = [
+            'IMAGE_CLASSES += "image-combined-dbg"',
+            'IMAGE_GEN_DEBUGFS = "1"',
+            'IMAGE_INSTALL:append = " gdbserver %s-ptest"' % recipe_name
+        ]
+        self.write_config("\n".join(conf_lines))
+
+        result = runCmd('devtool modify %s -x %s' % (recipe_name, tempdir))
+        self.assertExists(os.path.join(tempdir, build_file),
+                          'Extracted source could not be found')
+        self.assertExists(os.path.join(self.workspacedir, 'conf',
+                          'layer.conf'), 'Workspace directory not created')
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
+    def __devtool_ide_qemu(self, tempdir, qemu, recipe_name, bitbake_sdk_cmd, example_exe):
+        # Verify do_install works
+        with open(os.path.join(tempdir, '.vscode', 'tasks.json')) as tasks_j:
+            tasks_d = json.load(tasks_j)
+        tasks = tasks_d["tasks"]
+        task_install = next((task for task in tasks if task["label"] == "install && deploy-target %s"  % recipe_name), None)
+        self.assertIsNot(task_install, None)
+        install_deploy_cmd = task_install["command"]
+        # execute only the bb_run_do_install script since the deploy would require e.g. Qemu running.
+        install_cmd = install_deploy_cmd.replace("install_and_deploy", "bb_run_do_install")
+        runCmd(install_cmd, cwd=tempdir)
+
+        # Verify if re-building the SDK still works and the deploy and install script gets generated
+        runCmd(bitbake_sdk_cmd)
+        self.assertExists(install_deploy_cmd, 'install_and_deploy script not found')
+
+        MAGIC_STRING_ORIG = "Magic: 123456789"
+        MAGIC_STRING_NEW = "Magic: 987654321"
+        ptest_cmd = "ptest-runner " + recipe_name
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
+    @OETestTag("runqemu")
+    def test_devtool_ide_recipe_cmake(self):
+        recipe_name = "cmake-example"
+        example_exe = "cmake-example"
+        build_file = "CMakeLists.txt"
+        testimage = "oe-selftest-image"
+
+        tempdir = self.__devtool_ide_recipe(recipe_name, build_file, testimage)
+
+        # Verify deployment to Qemu works
+        with runqemu(testimage) as qemu:
+            bitbake_sdk_cmd = 'devtool ide %s %s -t root@%s -c --ide=code' % (recipe_name, testimage, qemu.ip)
+            runCmd(bitbake_sdk_cmd)
+
+            with open(os.path.join(tempdir, 'CMakeUserPresets.json')) as cmake_preset_j:
+                cmake_preset_d = json.load(cmake_preset_j)
+            config_presets = cmake_preset_d["configurePresets"]
+            self.assertEqual(len(config_presets), 1)
+            cmake_exe = config_presets[0]["cmakeExecutable"]
+            preset_name = config_presets[0]["name"]
+
+            # Verify the wrapper for cmake native is available
+            self.assertExists(cmake_exe)
+
+            # Verify the cmake preset generated by devtool ide is available
+            result = runCmd('%s --list-presets' % cmake_exe, cwd=tempdir)
+            self.assertIn(preset_name, result.output)
+
+            # Verify cmake re-uses the o files compiled by bitbake
+            result = runCmd('%s --build --preset %s' % (cmake_exe, preset_name), cwd=tempdir)
+            self.assertIn("ninja: no work to do.", result.output)
+
+            # Verify the unit tests work (in Qemu)
+            result = runCmd('%s --build --preset %s --target test' % (cmake_exe, preset_name), cwd=tempdir)
+            self.assertIn("100% tests passed", result.output)
+
+            # Verify re-building and testing works again
+            result = runCmd('%s --build --preset %s --target clean' % (cmake_exe, preset_name), cwd=tempdir)
+            self.assertIn("Cleaning all built files...", result.output)
+            result = runCmd('%s --build --preset %s' % (cmake_exe, preset_name), cwd=tempdir)
+            self.assertIn("Building", result.output)
+            self.assertIn("Linking", result.output)
+            result = runCmd('%s --build --preset %s --target test' % (cmake_exe, preset_name), cwd=tempdir)
+            self.assertIn("Running tests...", result.output)
+            self.assertIn("100% tests passed", result.output)
+
+            self.__devtool_ide_qemu(tempdir, qemu, recipe_name, bitbake_sdk_cmd, example_exe)
+
+    @OETestTag("runqemu")
+    def test_devtool_ide_recipe_meson(self):
+        recipe_name = "meson-example"
+        example_exe = "mesonex"
+        build_file = "meson.build"
+        testimage = "oe-selftest-image"
+
+        tempdir = self.__devtool_ide_recipe(recipe_name, build_file, testimage)
+
+        # Verify deployment to Qemu works
+        with runqemu(testimage) as qemu:
+            bitbake_sdk_cmd = 'devtool ide %s %s -t root@%s -c --ide=code' % (recipe_name, testimage, qemu.ip)
+            runCmd(bitbake_sdk_cmd)
+
+            with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_j:
+                settings_d = json.load(settings_j)
+            meson_exe = settings_d["mesonbuild.mesonPath"]
+            meson_build_folder = settings_d["mesonbuild.buildFolder"]
+
+            # Verify the wrapper for meson native is available
+            self.assertExists(meson_exe)
+
+            # Verify meson re-uses the o files compiled by bitbake
+            result = runCmd('%s compile -C  %s' % (meson_exe, meson_build_folder), cwd=tempdir)
+            self.assertIn("ninja: no work to do.", result.output)
+
+            # Verify the unit tests work (in Qemu)
+            runCmd('%s test -C  %s' % (meson_exe, meson_build_folder), cwd=tempdir)
+
+            # Verify re-building and testing works again
+            result = runCmd('%s compile -C  %s --clean' % (meson_exe, meson_build_folder), cwd=tempdir)
+            self.assertIn("Cleaning...", result.output)
+            result = runCmd('%s compile -C  %s' % (meson_exe, meson_build_folder), cwd=tempdir)
+            self.assertIn("Linking target %s" % example_exe, result.output)
+            runCmd('%s test -C  %s' % (meson_exe, meson_build_folder), cwd=tempdir)
+
+            self.__devtool_ide_qemu(tempdir, qemu, recipe_name, bitbake_sdk_cmd, example_exe)
-- 
2.41.0


