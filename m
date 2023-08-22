Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF90EE49B1
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:55 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.5241.1692732229721154450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dWLuHk06;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4ff933f9ca8so7467026e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692732228; x=1693337028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4lyq43eF+4jjlYBVgBi6SbESThlcXAZT+y0qQ1cgyE=;
        b=dWLuHk06qV3CcMDWf8aH3zBvZWdx0LTotrETKgiIyFHWMxiDl/C9HpO9HiblEt8aUP
         m54Ni+h/iGy9LKGDv8j9OuDkZwPgS2A8wWtMz8ZcEm7beqWBPyxHT8/r0+AxDX3roYWk
         KwDytBRwsDbCJS1+5CGMpaaEOrbVch4dSsuCL9WaPwiX/jsliivMDJP5fcIAiqWqhHpY
         aHBfOhLYXPqDp4yATsVXxcNxg1q+ae4VZgrklFkKLHfFV9GHnxtssVH4qbVKWG4NGTlj
         5povlj1wUERkoEuYf8tmUHGKnMJLpLqRfJvswgWHXwZfsqTfQsBOUggT96jbCVfovPoK
         aLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732228; x=1693337028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4lyq43eF+4jjlYBVgBi6SbESThlcXAZT+y0qQ1cgyE=;
        b=S65h32uNmeb9WW2Mnvi/18d64u/NoV6j6mlvwS4zJkD2gzKPWhQw5bFb2ehZgyY9or
         HGhDvlrhe2W/3DENOELENIWjTHSsfwwsJKz+AXLbqCvA1RufUPvsljxifHa9lPgfYQAE
         W+kdfIaNj30PKGjqk0ekX4UEuiD4efENr6XbIMb30LYzOInuzX0keJogI1uwVzQvBJks
         GbOYepYDqi+qGAUrKud+PCSjMzO0Q5oKBLg+zF90l3IuUpVPSqokHKw1xqwxWWIRYald
         KNg2ov4JhDWKMnbOfqjCY0UPUq/PfK8PBVZsCAvGzISkqPmgRuVIHpqUZdY+mbusRX3U
         BjXw==
X-Gm-Message-State: AOJu0YxY0mWbcNeLY93OloublhGyy7tCrstgDbGr2cXrQyzAp9Bapqqz
	DmZYOeOaJLdnzI2f1ef5whOByH/jKJ0=
X-Google-Smtp-Source: AGHT+IGsWR1UajW8AqPWOLpw3NKhe+8lwAT+EOJ9FnNj1TaAxOiyMiNRiVxtO6ZvEIHvceiUMxnRMw==
X-Received: by 2002:a05:6512:12cb:b0:500:8443:744a with SMTP id p11-20020a05651212cb00b005008443744amr5768606lfg.7.1692732227613;
        Tue, 22 Aug 2023 12:23:47 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b0098f99048053sm8744041ejf.148.2023.08.22.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:23:47 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 12/13] oe-selftest devtool: ide tests
Date: Tue, 22 Aug 2023 21:20:18 +0200
Message-ID: <20230822192300.3235896-13-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186535

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 133 ++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 14a80d5ff4c..083ecd4acfb 100644
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
+            'IMAGE_FEATURES += "ssh-server-openssh"',
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
+        result = runCmd('devtool ide %s core-image-minimal -c' % self.recipe_name)
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
+        runCmd('devtool ide %s core-image-minimal -c' % self.recipe_name)
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


