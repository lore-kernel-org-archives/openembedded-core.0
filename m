Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73D1EEC282
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:08:14 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5271.1771880890345474373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=DqvRXwpN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202602232108081e72966ef000020792-nu2_kw@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202602232108081e72966ef000020792
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Feb 2026 22:08:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xjsDxSVfdkUJ6ZYmsUOeQjyVwNGDZIGBmJWXJgi55gM=;
 b=DqvRXwpNxNhFeuOmlpLHyOexmgEfcgBdTJS6Wndn2qgeL7r1tkxu97Pe5oQD9g5La3DNV7
 VkWDyKs2o99nYzuckkafoz33jR6Et84vEVnA3HEObn/nQPhYxNSQpESYI1QzEmhsjHgKiz05
 R40y9a2jaJhHCehzFbj/ix+qTK0C1cR21GTf6Z+SmkOXB5fH3R6OOR8x0WEsBxMJK1AK1J/5
 SZ5H6HuHiKg6rDIJ0HYwUJ/XWDRJQzoRfjRa+wUCsgSTJf5w/9Cbza5MSq+fG86yXBdnbCQC
 AOC+2DZhCtCbN2kZI0vLkqGorW14NV2QbX95gyzvD9VYTPXccRcOQ6tg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 7/7] oe-selftest: devtool: add ide-sdk test for kernel modules
Date: Mon, 23 Feb 2026 22:06:40 +0100
Message-ID: <20260223210748.1905502-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
References: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231698

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a new selftest that validates `devtool ide-sdk --ide=code` output for
a kernel module recipe.

The test verifies:
- generated makefile build/clean configurations
- read-only kernel source mapping
- exported cross-build terminal environment variables
- kernel-specific file exclude patterns
- extension recommendations for makefile/cpptools
- `gnu11` and kernel include paths in c_cpp_properties.json

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 215 ++++++++++++++++++++
 scripts/lib/devtool/ide_plugins/ide_code.py |  13 +-
 2 files changed, 223 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 6e6bada147..8f5180d997 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3305,6 +3305,221 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self._verify_install_script_code(tempdir,  recipe_name)
         self._gdb_cross()
 
+    @OETestTag("runqemu")
+    def test_devtool_ide_sdk_code_kernel_module(self):
+        """Verify a kernel module recipe works with ide=code mode
+
+        Test flow:
+        1. devtool modify  — extract sources into a temporary directory
+        2. devtool ide-sdk (no -t) — generate VSCode config files with the
+           default target; verify settings.json, extensions.json,
+           c_cpp_properties.json, and the install && deploy-target task
+        3. Boot Qemu, then re-run devtool ide-sdk with -t and --skip-bitbake
+           to update the deploy scripts with the real target address
+        4. Deploy the .ko and load it with insmod; read the initial magic
+           string from the sysfs attribute exposed by the module
+        5. Modify the magic string in the source tree, rebuild with the make
+           command and environment taken from settings.json (mirroring what
+           VSCode's Makefile Tools extension would invoke), and redeploy
+        6. Reload the module and verify the updated string appears in sysfs
+        """
+        recipe_name = "selftest-kmodule"
+        build_file = "Makefile"
+        testimage = "oe-selftest-image"
+
+        self._check_workspace()
+        self._check_runqemu_prerequisites()
+
+        # Setup source tree with devtool modify
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
+        result = runCmd('devtool modify %s -x %s' % (recipe_name, tempdir),
+                        output_log=self._cmd_logger)
+        self.assertExists(os.path.join(tempdir, build_file),
+                          'Extracted source could not be found')
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'),
+                          'Workspace directory not created')
+        matches = glob.glob(os.path.join(
+            self.workspacedir, 'appends', recipe_name + '.bbappend'))
+        self.assertTrue(matches, 'bbappend not created %s' % result.output)
+
+        # Test devtool status
+        result = runCmd('devtool status', output_log=self._cmd_logger)
+        self.assertIn(recipe_name, result.output)
+        self.assertIn(tempdir, result.output)
+
+        # Generate VSCode configuration with the default target address; this step
+        # does not require Qemu to be running and produces the settings/tasks files
+        # that we verify first before booting the image.
+        bitbake_sdk_cmd = 'devtool ide-sdk %s %s -c --ide=code' % (recipe_name, testimage)
+        runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
+
+        # Verify the install && deploy-target script and tasks.json entry exist
+        self._verify_install_script_code(tempdir, recipe_name)
+
+        # --- Verify settings.json ---
+        with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_j:
+            settings_d = json.load(settings_j)
+
+        # Verify make configurations are generated (build + clean)
+        make_configs = settings_d.get('makefile.configurations', [])
+        self.assertTrue(len(make_configs) >= 2,
+                        'makefile.configurations should have at least two entries (build + clean)')
+        build_config = next((c for c in make_configs if c.get('name') != 'clean'), None)
+        self.assertIsNotNone(build_config,
+                             'A build configuration should be present in makefile.configurations')
+        clean_config = next((c for c in make_configs if c.get('name') == 'clean'), None)
+        self.assertIsNotNone(clean_config,
+                             'A clean configuration should be present in makefile.configurations')
+
+        # Verify make executable is set and exists
+        make_exe = build_config.get('makePath', '')
+        self.assertTrue(make_exe.endswith('/make'),
+                        'makePath should point to a make binary: %s' % make_exe)
+        self.assertExists(make_exe)
+
+        # Verify that the Makefile path points inside the source tree
+        self.assertEqual(build_config.get('makeDirectory'), tempdir,
+                         'makeDirectory should be the source tree')
+        self.assertEqual(build_config.get('makefilePath'),
+                         os.path.join(tempdir, 'Makefile'),
+                         'makefilePath should point to the Makefile in the source tree')
+
+        # Verify kernel sources are set read-only
+        readonly_includes = settings_d.get('files.readonlyInclude', {})
+        self.assertTrue(
+            any(k for k in readonly_includes if 'staging_kernel' in k.lower() or 'linux' in k.lower()),
+            'Kernel staging dir should be set read-only in files.readonlyInclude: %s' % readonly_includes)
+
+        # Verify the cross-build environment is exported for the terminal
+        self.assertIn('terminal.integrated.env.linux', settings_d,
+                      'terminal.integrated.env.linux should be set for kernel modules')
+        terminal_env = settings_d['terminal.integrated.env.linux']
+        self.assertIn('KERNEL_SRC', terminal_env,
+                      'KERNEL_SRC should be in the exported terminal environment')
+        self.assertIn('KERNEL_VERSION', terminal_env,
+                      'KERNEL_VERSION should be in the exported terminal environment')
+        self.assertIn('CC', terminal_env,
+                      'CC (kernel compiler) should be in the exported terminal environment')
+
+        # Verify kernel-specific file exclude patterns are present
+        files_exclude = settings_d.get('files.exclude', {})
+        self.assertIn('**/.*.cmd', files_exclude,
+                      'Kernel build artifacts (.*.cmd) should be excluded from view')
+        self.assertIn('**/*.o', files_exclude,
+                      'Kernel build artifacts (*.o) should be excluded from view')
+
+        # --- Verify extensions.json ---
+        with open(os.path.join(tempdir, '.vscode', 'extensions.json')) as ext_j:
+            ext_d = json.load(ext_j)
+        recommendations = ext_d.get('recommendations', [])
+        self.assertIn('ms-vscode.makefile-tools', recommendations,
+                      'ms-vscode.makefile-tools should be recommended for kernel modules')
+        self.assertIn('ms-vscode.cpptools', recommendations,
+                      'ms-vscode.cpptools should be recommended for kernel modules')
+        # cmake-tools and mesonbuild should not be recommended for kernel modules
+        self.assertNotIn('ms-vscode.cmake-tools', recommendations,
+                         'ms-vscode.cmake-tools should not be recommended for kernel modules')
+        self.assertNotIn('mesonbuild.mesonbuild', recommendations,
+                         'mesonbuild.mesonbuild should not be recommended for kernel modules')
+
+        # --- Verify c_cpp_properties.json ---
+        with open(os.path.join(tempdir, '.vscode', 'c_cpp_properties.json')) as props_j:
+            props_d = json.load(props_j)
+        configurations = props_d.get('configurations', [])
+        self.assertTrue(len(configurations) > 0,
+                        'c_cpp_properties.json should have at least one configuration')
+        # Kernel modules use gnu11 as the C standard
+        self.assertEqual(configurations[0].get('cStandard'), 'gnu11',
+                         'Kernel modules should use gnu11 C standard in c_cpp_properties.json')
+        # Kernel include paths should be present
+        include_path = configurations[0].get('includePath', [])
+        self.assertTrue(
+            any('kernel' in p.lower() for p in include_path),
+            'Kernel include path should be present in c_cpp_properties.json: %s' % include_path)
+
+        # Build the make environment and command from settings.json so the
+        # rebuild step below uses the exact same invocation that VSCode would
+        # use via the Makefile Tools extension.
+        make_args = build_config.get('makeArgs', [])
+        make_dir = build_config.get('makeDirectory', tempdir)
+        make_env = dict(os.environ)
+        make_env.update(terminal_env)
+
+        recipe_id, _ = self._get_recipe_ids(recipe_name)
+        install_deploy_cmd = os.path.join(
+            self._workspace_scripts_dir(recipe_name), 'install_and_deploy_' + recipe_id)
+
+        SYSFS_MAGIC = '/sys/kernel/selftest_kmodule/magic'
+        MODULE_NAME = 'selftest_kmodule'
+        MAGIC_STRING_ORIG = 'Hello from selftest-kmodule'
+        MAGIC_STRING_NEW  = 'Goodbye from selftest-kmodule'
+
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        self.add_command_to_tearDown('bitbake -c clean %s' % testimage)
+        self.add_command_to_tearDown('rm -f %s/%s*' % (deploy_dir_image, testimage))
+        with runqemu(testimage, runqemuparams="nographic") as qemu:
+            # Re-run ide-sdk with the Qemu target address to update the
+            # install && deploy scripts; --skip-bitbake avoids a rebuild.
+            bitbake_sdk_cmd = (
+                'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code' % (
+                    recipe_name, testimage, qemu.ip))
+            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
+
+            # Deploy the initial .ko to the target
+            runCmd(install_deploy_cmd, output_log=self._cmd_logger)
+
+            # Out-of-tree modules land in updates/ after modules_install;
+            # use insmod with the full path to avoid needing depmod -a.
+            status, output = qemu.run(
+                'find /lib/modules -name "selftest-kmodule.ko" 2>/dev/null')
+            self.assertEqual(status, 0)
+            ko_path = output.strip()
+            self.assertTrue(ko_path.endswith('selftest-kmodule.ko'),
+                            'selftest-kmodule.ko not found on target: %s' % output)
+
+            status, output = qemu.run('insmod %s' % ko_path)
+            self.assertEqual(status, 0, msg='insmod failed: %s' % output)
+
+            # Verify the sysfs interface exposes the expected magic string
+            status, output = qemu.run('cat %s' % SYSFS_MAGIC)
+            self.assertEqual(status, 0, msg='reading sysfs magic failed: %s' % output)
+            self.assertIn(MAGIC_STRING_ORIG, output,
+                          'Initial magic string not found in sysfs: %s' % output)
+
+            # Modify the magic string in the source tree
+            kmodule_c = os.path.join(tempdir, 'selftest-kmodule.c')
+            with open(kmodule_c) as f:
+                src = f.read()
+            self.assertIn(MAGIC_STRING_ORIG, src,
+                          'SELFTEST_MAGIC_STRING not found in source; cannot modify it')
+            with open(kmodule_c, 'w') as f:
+                f.write(src.replace(MAGIC_STRING_ORIG, MAGIC_STRING_NEW))
+
+            # Rebuild using the make command and environment from settings.json,
+            # mirroring what VSCode would invoke via the Makefile Tools extension.
+            runCmd([make_exe] + make_args, cwd=make_dir, env=make_env,
+                   output_log=self._cmd_logger)
+            runCmd(install_deploy_cmd, output_log=self._cmd_logger)
+
+            # Reload the updated module and verify the sysfs string changed
+            status, output = qemu.run('rmmod %s' % MODULE_NAME)
+            self.assertEqual(status, 0, msg='rmmod failed: %s' % output)
+            status, output = qemu.run(
+                'find /lib/modules -name "selftest-kmodule.ko" 2>/dev/null')
+            self.assertEqual(status, 0)
+            ko_path = output.strip()
+            status, output = qemu.run('insmod %s' % ko_path)
+            self.assertEqual(status, 0, msg='insmod of modified module failed: %s' % output)
+
+            status, output = qemu.run('cat %s' % SYSFS_MAGIC)
+            self.assertEqual(status, 0, msg='reading sysfs magic (modified) failed: %s' % output)
+            self.assertNotIn(MAGIC_STRING_ORIG, output,
+                             'Old magic string still present in sysfs after rebuild')
+            self.assertIn(MAGIC_STRING_NEW, output,
+                          'New magic string not found in sysfs after rebuild: %s' % output)
+
     def test_devtool_ide_sdk_shared_sysroots(self):
         """Verify the shared sysroot SDK"""
 
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 84cf35b50f..603d3cecf3 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -155,20 +155,23 @@ class IdeVSCode(IdeBase):
 
         # Define kernel exclude patterns once
         kernel_exclude_patterns = [
+            "*.cache/**",
+            "*.ko",
+            "*.mod.c",
+            "*.mod",
             "**/.*.cmd",
             "**/.*.d",
             "**/.*.S",
             "**/.tmp*",
-            "**/*.tmp",
-            "**/*.o",
             "**/*.a",
             "**/*.builtin",
+            "**/*.map",
+            "**/*.modinfo",
+            "**/*.o",
             "**/*.order",
             "**/*.orig",
             "**/*.symvers",
-            "**/*.modinfo",
-            "**/*.map",
-            "*.cache/**"
+            "**/*.tmp"
         ]
         files_excludes_kernel = {pattern: True for pattern in kernel_exclude_patterns}
 
-- 
2.53.0


