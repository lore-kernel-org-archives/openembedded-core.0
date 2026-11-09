Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6195.1794231922105908864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=PB3EDCqX;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 39A493D818F1;
	Mon,  9 Nov 2026 08:45:21 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id JpsBJqaZXm2e; Mon,  9 Nov 2026 08:45:19 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 29B5B3D8176B;
	Mon,  9 Nov 2026 08:45:19 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 29B5B3D8176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231919; bh=YMNWfkvU6mN8rFoxBgDxgdJ5jCwjbaLv6flmzW0CHL8=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=PB3EDCqXYGcwA5Uyo0BZQAj8vMvVINSlU4zFgzwF6ONGo+wpLzt1HxwTnziHwqwkn
	 JGqcLVQbhERwPref0d5Hu+Y8KDRY2BSyNlKkEVTXHO1vc2YAHRlqgmBRACLojtHQcI
	 dukOoj3cBVY/0iN94SY5sRqTDL8WN/xovnNWU+q+0x3Wneb9fLNxfcowWG+HzIw1D6
	 OWmBJCF8Qr0S3vZGoip3wKg4E8cpvcKkaK0WVluLGT8erNnTERWAiCCYo7W3iMYHTb
	 1QxO5XvPUe5YpQrUwNk0ShWgB6+uhlFrE21G0GZ3ONkbYiTWONA2JEZVORHDLd3Xwu
	 UMxdjl2qlOIcw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 5_GFrKgIri4P; Mon,  9 Nov 2026 08:45:19 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 9C93C3D81892;
	Mon,  9 Nov 2026 08:45:18 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:28 +0100
Subject: [PATCH v2 11/18] devtool: ide-sdk: enforce LLDB for Cargo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-11-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249838

Route Cargo debugging through CodeLLDB and lldb-server because GDB/cppdbg
does not resolve Rust function breakpoints in the VS Code Rust workflow.

Cargo debugging always uses LLDB, regardless of the recipe C/C++ toolchain.
Key shared debugger instances by backend rather than TOOLCHAIN so Rust
recipes use the correct server while ordinary GCC recipes retain GDB. Cargo
C++ IntelliSense still uses the recipe compiler.

This follows VS Code's recommended Rust workflow:
https://code.visualstudio.com/docs/languages/rust#_debugging

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

---
Changes in v2:
- Cover LLDB configuration when using --ide=none.
- Explain GDB's Rust function breakpoint limitations.
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 35 +++++++++++++++++++++++++++
 scripts/lib/devtool/ide_plugins/ide_code.py |  7 ++++--
 scripts/lib/devtool/ide_plugins/ide_none.py |  4 ++--
 scripts/lib/devtool/ide_sdk.py              | 37 +++++++++++++++++++----------
 4 files changed, 66 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ef13eaa09a..3b80d6a4a8 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4363,6 +4363,41 @@ class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
         self.assertNotIn('rust-analyzer.cargo.extraEnv', settings)
         self.assertIn('rust-lang.rust-analyzer', extensions['recommendations'])
 
+    def test_cargo_lldb_configuration(self):
+        recipe_name = "cargo-example"
+        self._check_workspace()
+        self._write_bb_config()
+        tempdir = self._devtool_ide_sdk_recipe(recipe_name, "Cargo.toml", None)
+        runCmd('devtool ide-sdk %s oe-selftest-image --ide=code --ide=none '
+               '--target root@localhost --no-host-check' % recipe_name,
+               output_log=self._cmd_logger)
+
+        with open(os.path.join(tempdir, '.vscode', 'extensions.json')) as extensions_file:
+            extensions = json.load(extensions_file)
+        with open(os.path.join(tempdir, '.vscode', 'launch.json')) as launch_file:
+            launch = json.load(launch_file)['configurations'][0]
+        with open(os.path.join(tempdir, '.vscode', 'tasks.json')) as tasks_file:
+            tasks = json.load(tasks_file)['tasks']
+
+        self.assertIn('vadimcn.vscode-lldb', extensions['recommendations'])
+        self.assertEqual(launch['type'], 'lldb')
+
+        scripts_dir = self._workspace_scripts_dir(recipe_name)
+        scripts = os.listdir(scripts_dir)
+        self.assertTrue(any(name.startswith('lldb_server_') for name in scripts))
+        self.assertFalse(any(name.startswith('gdbserver_') for name in scripts))
+        self._verify_install_script_code(tempdir, recipe_name)
+        cargo_config = os.path.join(
+            self.workspacedir, 'ide-sdk', recipe_name, 'cargo-config.toml')
+        self.assertExists(
+            cargo_config, 'Cargo config was not generated for --ide=none')
+        target_dbgsrc_dir = get_bb_var('TARGET_DBGSRC_DIR', recipe_name)
+        self.assertEqual(
+            launch['sourceMap'][target_dbgsrc_dir], os.path.realpath(tempdir))
+        server_task = next(
+            task for task in tasks if task['label'] == launch['preLaunchTask'])
+        self.assertIn('lldb-server platform --server', server_task['args'][-1])
+
     def test_code_cargo_build_task(self):
         recipe_name = "cargo-example"
         self._check_workspace()
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index cb54948ce1..a7bb3221e0 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -315,7 +315,10 @@ class IdeVSCode(IdeBase):
     def vscode_extensions(self, modified_recipe):
         recommendations = []
         if modified_recipe.build_tool is BuildTool.CARGO:
-            recommendations.append("rust-lang.rust-analyzer")
+            recommendations += [
+                "rust-lang.rust-analyzer",
+                "vadimcn.vscode-lldb"
+            ]
         # clangd (matched to the recipe's real cross compiler via
         # compile_commands.json) replaces cpptools as the IntelliSense provider
         # when selected via IDE_SDK_INTELLISENSE (defaults to clangd for the
@@ -1003,7 +1006,7 @@ class IdeVSCode(IdeBase):
         self.vscode_extensions(modified_recipe)
         self.vscode_c_cpp_properties(modified_recipe, image_recipe)
         if args.target:
-            if modified_recipe.toolchain == 'clang':
+            if modified_recipe.uses_lldb:
                 self.initialize_cross_debug_configs(
                     image_recipe, modified_recipe, LldbServerConfigVSCode)
             else:
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index eba576bfdb..d2f66ade8d 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -306,13 +306,13 @@ class IdeNone(IdeBase):
 
         - Execute the do_install task
         - Execute devtool deploy-target
-        - Generate a gdbinit file per executable
+        - Generate debugger configuration for each executable
         - Generate the oe-scripts sym-link
         """
         script_path = modified_recipe.gen_install_deploy_script(args, image_recipe.nfs_deploy_dir)
         logger.info("Created: %s" % script_path)
 
-        if modified_recipe.toolchain == 'clang':
+        if modified_recipe.uses_lldb:
             self.initialize_cross_debug_configs(
                 image_recipe, modified_recipe, LldbServerConfigNone)
         else:
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 98e39703e7..0ce2a7780e 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -406,11 +406,11 @@ class RecipeImage:
         resulting bbappend content actually differs from what was on disk
         when initialize() ran, False if it is left exactly as it was.
         """
-        wants_gdbserver = any(
-            r.wants_gdbserver and r.toolchain != 'clang'
-            for r in recipes_modified)
         wants_lldb_server = any(
-            r.wants_gdbserver and r.toolchain == 'clang'
+            r.wants_gdbserver and r.uses_lldb
+            for r in recipes_modified)
+        wants_gdbserver = any(
+            r.wants_gdbserver and not r.uses_lldb
             for r in recipes_modified)
 
         # Only add what the base configuration (e.g. local.conf) does not
@@ -1158,6 +1158,16 @@ class RecipeModified:
         self.recipe_id = self.bpn + "-" + self.package_arch
         self.recipe_id_pretty = self.bpn + ": " + self.package_arch
 
+    @property
+    def uses_lldb(self):
+        # VS Code's Rust debugging guide recommends CodeLLDB:
+        # https://code.visualstudio.com/docs/languages/rust#_debugging
+        # ide-sdk supports Rust debugging only through CodeLLDB; cppdbg/GDB
+        # does not resolve Rust function breakpoints from the VS Code UI because
+        # GDB does not fully understand Rust's LLVM-generated function layout
+        # and name mangling.
+        return self.toolchain == 'clang' or self.build_tool is BuildTool.CARGO
+
     @property
     def cargo_config_path(self):
         return os.path.join(self.ide_sdk_dir, 'cargo-config.toml')
@@ -2048,20 +2058,21 @@ def ide_setup(args, config, basepath, workspace):
                 bootstrap_tasks += recipe_modified.bootstrap_tasks
                 recipes_modified.append(recipe_modified)
 
-                # Key by (arch, toolchain) so recipes with different toolchains
-                # targeting the same arch each get the right debugger.
+                # Key by (arch, debugger) so recipes sharing an architecture
+                # but using different debugger backends each get the right one.
+                debugger = 'lldb' if recipe_modified.uses_lldb else 'gdb'
                 debugger_key = (recipe_modified.target_arch,
-                                recipe_modified.toolchain or '')
+                                debugger)
                 if debugger_key not in debuggers:
                     target_device = TargetDevice(args)
-                    if recipe_modified.toolchain == 'clang':
-                        debugger = RecipeLldbNative(args, target_device)
+                    if recipe_modified.uses_lldb:
+                        debugger_config = RecipeLldbNative(args, target_device)
                     else:
-                        debugger = RecipeGdbCross(
+                        debugger_config = RecipeGdbCross(
                             args, recipe_modified.target_arch, target_device)
-                    debugger.initialize(config, workspace, tinfoil)
-                    bootstrap_tasks += debugger.bootstrap_tasks
-                    debuggers[debugger_key] = debugger
+                    debugger_config.initialize(config, workspace, tinfoil)
+                    bootstrap_tasks += debugger_config.bootstrap_tasks
+                    debuggers[debugger_key] = debugger_config
                 recipe_modified.debugger_cross = debuggers[debugger_key]
 
     finally:

-- 
2.53.0

