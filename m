Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38884.1793004979382349804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=aLkNcsru;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 79D6A3D818A9;
	Mon, 26 Oct 2026 04:56:18 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id zem5wYZu1DSD; Mon, 26 Oct 2026 04:56:16 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CDE213D81896;
	Mon, 26 Oct 2026 04:56:16 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com CDE213D81896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004976; bh=dU/+2ZEfQcF4Q8VIwQT5K45w/bHUMtvn2TB2uw6XMeA=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=aLkNcsrunm/4DsZnJeKlHeKHhxf0TqI5WK/vcA8oc1exmWt/tD46sT7SpcDf6rACl
	 N1utP8+hBSqyo5qtjqgl/nw/GCGu9ouHue4UevCZDt6QIBUZVoa+QBsssBbR4Tla2A
	 bwV71zX0/7QfIg7AL91c8jzGWCe7nZVxgCfOGlT1Bl8JF6l8wjcP0u8SuU2EtFLvN8
	 nlFY84GlzwaFgHdbs/0wxbYdyQGnO8DINQWrVzHbxMbWqfcqW5Vk5SwxrIdD44zul0
	 1TxRHD+fRfW6S/jp/2Ty95btJYrZlazK6bM0PaXat6P9RXj6ZOdP+v0UsFiCtF3Gho
	 hFfoop//WEgEA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id jQmCT0jQY21J; Mon, 26 Oct 2026 04:56:16 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 444823D81863;
	Mon, 26 Oct 2026 04:56:16 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:50 +0100
Subject: [PATCH 12/20] devtool: ide-sdk: enforce LLDB for Cargo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-12-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248651

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
 meta/lib/oeqa/selftest/cases/devtool.py     | 22 ++++++++++++++++++
 scripts/lib/devtool/ide_plugins/ide_code.py |  3 ++-
 scripts/lib/devtool/ide_sdk.py              | 35 ++++++++++++++++++-----------
 3 files changed, 46 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index bd0bfb06ec..38bd3301cf 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4390,6 +4390,28 @@ class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
         self.assertIn('rust-lang.rust-analyzer', extensions['recommendations'])
         self.assertIn('ms-vscode.cpptools', extensions['recommendations'])
 
+    def test_code_cargo_lldb_configuration(self):
+        recipe_name = "cargo-example"
+        self._check_workspace()
+        self._write_bb_config()
+        tempdir = self._devtool_ide_sdk_recipe(recipe_name, "Cargo.toml", None)
+        runCmd('devtool ide-sdk %s oe-selftest-image --ide=code '
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
+        server_task = next(
+            task for task in tasks if task['label'] == launch['preLaunchTask'])
+        self.assertIn('lldb-server platform --server', server_task['args'][-1])
+
     def test_code_cargo_build_task(self):
         recipe_name = "cargo-example"
         self._check_workspace()
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 089016c639..e18c6a703d 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -320,6 +320,7 @@ class IdeVSCode(IdeBase):
             recommendations += [
                 "rust-lang.rust-analyzer",
                 "ms-vscode.cpptools",
+                "vadimcn.vscode-lldb"
             ]
         # clangd (matched to the recipe's real cross compiler via
         # compile_commands.json) replaces cpptools as the IntelliSense provider
@@ -1023,7 +1024,7 @@ class IdeVSCode(IdeBase):
         self.vscode_extensions(modified_recipe)
         self.vscode_c_cpp_properties(modified_recipe, image_recipe)
         if args.target:
-            if modified_recipe.toolchain == 'clang':
+            if modified_recipe.uses_lldb:
                 self.initialize_cross_debug_configs(
                     image_recipe, modified_recipe, LldbServerConfigVSCode)
             else:
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 21229f5970..44429e80b0 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -433,11 +433,11 @@ class RecipeImage:
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
@@ -1150,6 +1150,14 @@ class RecipeModified:
         self.recipe_id = self.bpn + "-" + self.package_arch
         self.recipe_id_pretty = self.bpn + ": " + self.package_arch
 
+    @property
+    def uses_lldb(self):
+        # VS Code's Rust debugging guide recommends CodeLLDB:
+        # https://code.visualstudio.com/docs/languages/rust#_debugging
+        # ide-sdk supports Rust debugging only through CodeLLDB; cppdbg/GDB
+        # does not resolve Rust function breakpoints from the VS Code UI.
+        return self.toolchain == 'clang' or self.build_tool is BuildTool.CARGO
+
     @property
     def cargo_config_path(self):
         return os.path.join(self.ide_sdk_dir, 'cargo-config.toml')
@@ -2032,20 +2040,21 @@ def ide_setup(args, config, basepath, workspace):
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

