Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D22C83F11
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:32:39 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.4418.1693164754169781659
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IGLx+NEi;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9a21b6d105cso315960966b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164752; x=1693769552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNj2Q1HHMofUmdP14Pt0bGwkJq4JbQn1VSVa5zwBp4o=;
        b=IGLx+NEiMhrzYWgCHFQH3IrLzOp2bjzS/IVwBsptnUS5HZ6CdC9Ghh12/KETDsXrIp
         RT0AblRu0LB+R4eRzYJAAKrDWUrUBohen8IRgvvDsg54X+/pxlRTiAkf3gY99VHvhOCj
         66yoqiWfpTX3qKpPVOYLTLTEEbmWM0YjMLeP7LbrS0bFR01ya9m12Hm6DupzVTgaA3jE
         iVF8lPNOPc6Y5bOi8HGqCLyHTnBwioN5Yra1ap/VUHz+pL7RfcQ9MQ+naDDr+coEB94o
         +A/LL/A/zIUz3dic6bp8bIHpf+AZxdwJ6TF4EmFQqiqCxvKrXxorOtEjEEDERxaFQrVx
         l8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164752; x=1693769552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNj2Q1HHMofUmdP14Pt0bGwkJq4JbQn1VSVa5zwBp4o=;
        b=Pn1lz2lM+4a0fZM8qXgEa8UsTvStZiw2xmVRG2WNwMbPk2BlmCasut2lboVfaixNb+
         vlJwLUoRfsjhBOOQId/xQD1oKOPM58j+jeWqC7LdCSNK92NN69AfEYB9lrZUmtVNVm0/
         UBF6Xi6khsChGsSvxmwIMfUxrzagXT69IR7K5tc+mbKo4ef6M9EHzwZFSSWTlzC3DTpC
         /sCWU2RWT4B2nwhKsFqwbzQs3Oqv8qu8IuFjNClX1UsPq/H6m8NAKE33BQIeE4f7az7q
         D3SFLk92+fymqTOOOOOA3oYTnBqPB1+GyT8hHRWXIrKQjMAt1mZZ+VhFhneDIPKF+vcx
         S7Ug==
X-Gm-Message-State: AOJu0YxVzUh9KN4P+YoqUyomnZT8YbKHtMoCu66bRmhEBDpNtznfMT7i
	kH80Su400EO9YhwNHCXoBacnWfsPS+8=
X-Google-Smtp-Source: AGHT+IH7loW2fFiOky3iGnQ8iqbYszonKKOG1mLEcVcOJRXvEj+7+e6X9ys1U/23ov+yGziCMjym8w==
X-Received: by 2002:a17:906:10c:b0:9a2:40e:2cb7 with SMTP id 12-20020a170906010c00b009a2040e2cb7mr6977341eje.43.1693164752255;
        Sun, 27 Aug 2023 12:32:32 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm3740261ejb.96.2023.08.27.12.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:32:31 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 12/13] oe-selftest devtool: ide tests
Date: Sun, 27 Aug 2023 21:29:54 +0200
Message-ID: <20230827193200.4083340-13-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
References: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186792

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 133 ++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a2b77e528de..21644ef7bc2 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -11,6 +11,7 @@ import tempfile
 import glob
 import fnmatch
 import unittest
+import json
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
@@ -2192,3 +2193,135 @@ class DevtoolUpgradeTests(DevtoolBase):
 
         #Step 4.5
         runCmd("grep %s %s" % (modconfopt, codeconfigfile))
+
+
+class DevtoolIdeTests(DevtoolBase):
+
+    def __devtool_ide_recipe(self):
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % self.recipe_name)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        conf_lines = [
+            'IMAGE_FEATURES += "ssh-server-openssh debug-tweaks"',
+            'IMAGE_CLASSES += "image-combined-dbg"',
+            'IMAGE_GEN_DEBUGFS = "1"',
+            'IMAGE_INSTALL += "gdbserver %s-ptest"' % self.recipe_name
+        ]
+        self.write_config("\n".join(conf_lines))
+
+        result = runCmd('devtool modify %s -x %s' % (self.recipe_name, tempdir))
+        self.assertExists(os.path.join(tempdir, self.build_file),
+                          'Extracted source could not be found')
+        self.assertExists(os.path.join(self.workspacedir, 'conf',
+                          'layer.conf'), 'Workspace directory not created')
+        matches = glob.glob(os.path.join(self.workspacedir,
+                            'appends', self.recipe_name + '.bbappend'))
+        self.assertTrue(matches, 'bbappend not created %s' % result.output)
+
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(self.recipe_name, result.output)
+        self.assertIn(tempdir, result.output)
+        self._check_src_repo(tempdir)
+
+        result = runCmd('devtool ide %s core-image-minimal -c --ide=code' % self.recipe_name)
+        return tempdir
+
+    def __devtool_ide_qemu(self):
+        # Verify do_install works
+        with open(os.path.join(self.tempdir, '.vscode', 'tasks.json')) as tasks_j:
+            tasks_d = json.load(tasks_j)
+        tasks = tasks_d["tasks"]
+        task_install = next((task for task in tasks if task["label"] == "install && deploy-target %s"  % self.recipe_name), None)
+        self.assertIsNot(task_install, None)
+        install_deploy_cmd = task_install["command"]
+        # execute only the bb_run_do_install script since the deploy would require e.g. Qemu running.
+        install_cmd = install_deploy_cmd.replace("install_and_deploy", "bb_run_do_install")
+        runCmd(install_cmd, cwd=self.tempdir)
+
+        # Verify if re-building the SDK still works and the deploy and install script gets generated
+        runCmd('devtool ide %s core-image-minimal -c --ide=code' % self.recipe_name)
+        self.assertExists(install_deploy_cmd, 'install_and_deploy script not found')
+
+        # Verify deployment to Qemu works
+        with runqemu("core-image-minimal", runqemuparams = "nographic") as qemu:
+            MAGIC_STRING_ORIG = "Magic: 123456789"
+            MAGIC_STRING_NEW = "Magic: 987654321"
+
+            # Verify the unmodified example prints the magic string
+            status, output = qemu.run(self.example_exe)
+            self.assertEqual(status, 0)
+            self.assertIn(MAGIC_STRING_ORIG, output)
+
+            # Verify the unmodified ptests work
+            status, output = qemu.run("ptest-runner " + self.recipe_name)
+            self.assertEqual(status, 0, msg=output)
+            self.assertIn("PASS: cpp-example-lib", output)
+
+            # Replace the Magic String in the code, compile and deploy to Qemu
+            cpp_example_lib_hpp = os.path.join(self.tempdir, 'cpp-example-lib.hpp')
+            with open(cpp_example_lib_hpp, 'r') as file:
+                cpp_code = file.read()
+                cpp_code = cpp_code.replace(MAGIC_STRING_ORIG, MAGIC_STRING_NEW)
+            with open(cpp_example_lib_hpp, 'w') as file:
+                file.write(cpp_code)
+            runCmd(install_deploy_cmd, cwd=self.tempdir)
+
+            # Verify the modified example prints the modified magic string
+            status, output = qemu.run(self.example_exe)
+            self.assertEqual(status, 0)
+            self.assertNotIn(MAGIC_STRING_ORIG, output)
+            self.assertIn(MAGIC_STRING_NEW, output)
+
+            # Verify the modified example ptests work
+            status, output = qemu.run("ptest-runner " + self.recipe_name)
+            self.assertEqual(status, 0, msg=output)
+            self.assertIn("PASS: cpp-example-lib", output)
+
+    def test_devtool_ide_recipe_cmake(self):
+        self.recipe_name = "cmake-example"
+        self.example_exe = "cmake-example"
+        self.build_file = "CMakeLists.txt"
+        self.tempdir = self.__devtool_ide_recipe()
+
+        with open(os.path.join(self.tempdir, 'CMakeUserPresets.json')) as cmake_preset_j:
+            cmake_preset_d = json.load(cmake_preset_j)
+        config_presets = cmake_preset_d["configurePresets"]
+        self.assertEqual(len(config_presets), 1)
+        cmake_exe = config_presets[0]["cmakeExecutable"]
+        preset_name = config_presets[0]["name"]
+
+        # Verify the cmake preset generated by devtool ide is available
+        result = runCmd('%s --list-presets' % cmake_exe, cwd=self.tempdir)
+        self.assertIn(preset_name, result.output)
+
+        # Verify cmake re-uses the o files compiled by bitbake
+        result = runCmd('%s --build --preset %s' % (cmake_exe, preset_name), cwd=self.tempdir)
+        self.assertIn("ninja: no work to do.", result.output)
+
+        # Verify the unit tests work (in Qemu)
+        result = runCmd('%s --build --preset %s --target test' % (cmake_exe, preset_name), cwd=self.tempdir)
+        self.assertIn("100% tests passed", result.output)
+
+        # Verify re-building and testing works again
+        result = runCmd('%s --build --preset %s --target clean' % (cmake_exe, preset_name), cwd=self.tempdir)
+        self.assertIn("Cleaning all built files...", result.output)
+        result = runCmd('%s --build --preset %s' % (cmake_exe, preset_name), cwd=self.tempdir)
+        self.assertIn("Building", result.output)
+        self.assertIn("Linking", result.output)
+        result = runCmd('%s --build --preset %s --target test' % (cmake_exe, preset_name), cwd=self.tempdir)
+        self.assertIn("Running tests...", result.output)
+        self.assertIn("100% tests passed", result.output)
+
+        self.__devtool_ide_qemu()
+
+    def test_devtool_ide_recipe_meson(self):
+        self.recipe_name = "meson-example"
+        self.example_exe = "mesonex"
+        self.build_file = "meson.build"
+        self.tempdir = self.__devtool_ide_recipe()
+
+        self.__devtool_ide_qemu()
-- 
2.41.0


