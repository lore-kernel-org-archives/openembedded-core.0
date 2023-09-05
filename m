Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E85CA0FE2
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.27279.1693933182995975652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TAnhdykQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-401d2e11dacso337485e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933181; x=1694537981; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQGicNVlvlsWmQlA3v7P1PEqE3sAln7UuN/ygkc/1yo=;
        b=TAnhdykQhSGVFOafX6bZu5mZwyqT2afIfeIbcFUHLBnHMGTQmLFlW5SNsQPONFReA2
         q8L74aA702KUPVhL8uqiEIPmY377QSCAEAJuwO2094WTtYwYISxcGYqB+VjT85bDHjaD
         BxCdIHD0gC68sxz7ww3SKfu49rigysb7DJ9Kz3acObN7P4VgslsbIPbsNL3ATTNpqJRQ
         ldGak0H1nYbcVz2eRo6qTens/JSrF/TbexrJMyZK71gMzQD9EAk80choTaotmhiW9sD7
         VqkrqIqbPHo7X93Gh+3rkMZypFU+whkNA4JLV0mKVYfUn92k5Zq15sdkS0VFrYTQ6v+O
         n3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933181; x=1694537981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQGicNVlvlsWmQlA3v7P1PEqE3sAln7UuN/ygkc/1yo=;
        b=GOEfrHz0M20MPwcxQQKRRjI0Pzz8+H6sv6vbKCr9VH680xdBnoobYgdorOnPf2iRjF
         0F/Y+xs3Twa7KzbsNbe6BZDJROoWyuUuemz06xQomUGuGbyDyIAOy4bci1ZvrV7BRFcc
         T++Ww2+tIPDGBPuBB80uwah33FJNqJyfZDG8TCCG7wPV6LPsyXsfApdSrI6HVRq7ajlo
         T1TnpWWJ6d2qoRL+A1M/AhnI3WMxqBE+UnesL40Za8Y8nL8upFLvLnxTeA15sWlufHGx
         IKlprXEGsodNmJeYNY0uN8bYOwu4giD2UwsM5bTbcwMad4Zmoa3qnmtVKC6hjVKoo2Od
         EwXQ==
X-Gm-Message-State: AOJu0YxVTZExshuXiFpBsLpmGGzH81S/0n5jMJ1tYThDD5xVuNqXLBFc
	t3nz/u6ZMhnB4dk3BNB6wumQtcuumBc=
X-Google-Smtp-Source: AGHT+IH8pZeB2odHV2GuqOWygq/+GhzBAm8l9o5MerJdzAYrnxrR8xPl1mdnN2g2AmU2h5aYVHTdDA==
X-Received: by 2002:a5d:49c6:0:b0:317:dcdd:3fa1 with SMTP id t6-20020a5d49c6000000b00317dcdd3fa1mr358695wrs.34.1693933181077;
        Tue, 05 Sep 2023 09:59:41 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:40 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 13/14] oe-selftest devtool: ide tests
Date: Tue,  5 Sep 2023 18:51:22 +0200
Message-ID: <20230905165913.2560907-14-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187245

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 179 ++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b577f6d62a1..3bfc9510109 100644
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
+            'IMAGE_INSTALL += "gdbserver %s-ptest"' % recipe_name
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


