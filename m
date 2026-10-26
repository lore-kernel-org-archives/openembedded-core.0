Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38527.1793004976351016933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=tVZQ09yF;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 74CA63D81665;
	Mon, 26 Oct 2026 04:56:15 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id fcjzcL0Zf7ew; Mon, 26 Oct 2026 04:56:13 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CFA8D3D818C4;
	Mon, 26 Oct 2026 04:56:13 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com CFA8D3D818C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004973; bh=U54+2qcueXERKEgB6htcazjaXCWQvWBP2foyGleKW/A=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=tVZQ09yF8Dtbds0SF5mDj8ADksssPnaM8whoSTOwjEQGBNGQdUwT+GgzEfrR/mprT
	 er/2pTBZInXsIc+z3GxiZaRMT71Y4tI+mKQl11NRTMeXbTxeOcn/DvvCK8Mst/orbZ
	 i+KoTKE+TOetQfIQEAs9CvpCOIYNevsaWTNk5RCY1EkEPreZ8RvuvAxL0OrM4+SP9x
	 nXfU1khG3NRICl9TOPNIWP2cFdt90k5WCl1Nz1FhqcFoIKbJIOJdoGaCF5IeJf8F/1
	 /GNvoxwuQvav8ju+Sol5+b+5RoHa1EsjmR2eiN/PKRb71TYQhAYM0UtJsIcwi2FZL/
	 Ux8Lkz+sqIy9w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id NajTPFkiVdPg; Mon, 26 Oct 2026 04:56:13 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 31F6A3D81896;
	Mon, 26 Oct 2026 04:56:13 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:45 +0100
Subject: [PATCH 07/20] devtool: ide-sdk: configure Cargo C++ IntelliSense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-7-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248646

Recommend cpptools for Cargo's native C/C++ code and configure its cross
compiler, sysroot, and include path. Reuse the shared architecture mapping
so IntelliSense matches the recipe environment. The selftest checks the
generated compiler and sysroot settings.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 27 ++++++++++++++++++++++++++
 scripts/lib/devtool/ide_plugins/ide_code.py | 30 ++++++++++++++++++++---------
 2 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d1e15d0180..990a3060aa 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4353,15 +4353,42 @@ class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
             settings = json.load(settings_file)
         with open(os.path.join(tempdir, '.vscode', 'extensions.json')) as extensions_file:
             extensions = json.load(extensions_file)
+        with open(os.path.join(tempdir, '.vscode', 'c_cpp_properties.json')) as properties_file:
+            properties = json.load(properties_file)['configurations'][0]
+        recipe_sysroot = os.path.realpath(get_bb_var('RECIPE_SYSROOT', recipe_name))
         cargo_config = os.path.join(
             self.workspacedir, 'ide-sdk', recipe_name, 'cargo-config.toml')
         self.assertExists(cargo_config, 'Cargo config was not generated')
+        with open(cargo_config) as cargo_config_file:
+            cargo_config_text = cargo_config_file.read()
+        cargo_class_env = {
+            'LIBGIT2_NO_VENDOR': '1',
+            'LIBSSH2_SYS_USE_PKG_CONFIG': '1',
+            'LIBSQLITE3_SYS_USE_PKG_CONFIG': '1',
+            'OPENSSL_NO_VENDOR': '1',
+            'PKG_CONFIG_ALLOW_CROSS': '1',
+            'PKG_CONFIG_ALL_DYNAMIC': '1',
+            'SYSTEM_DEPS_BUILD_INTERNAL': 'never',
+            'ZSTD_SYS_USE_PKG_CONFIG': '1',
+        }
+        for name, value in cargo_class_env.items():
+            self.assertIn(
+                '%s = { value = "%s", force = true }' % (name, value),
+                cargo_config_text)
         self.assertEqual(settings['rust-analyzer.cargo.configPath'], cargo_config)
         self.assertEqual(
             settings['rust-analyzer.cargo.target'],
             get_bb_var('RUST_HOST_SYS', recipe_name))
         self.assertNotIn('rust-analyzer.cargo.extraEnv', settings)
+        self.assertEqual(
+            properties['compilerPath'],
+            shlex.split(get_bb_var('RUST_TARGET_CXX', recipe_name))[0])
+        self.assertEqual(
+            properties['compilerArgs'], ['--sysroot=' + recipe_sysroot])
+        self.assertIn(os.path.join(recipe_sysroot, 'usr', 'include'),
+                      properties['includePath'])
         self.assertIn('rust-lang.rust-analyzer', extensions['recommendations'])
+        self.assertIn('ms-vscode.cpptools', extensions['recommendations'])
 
 class DevtoolIdeSdkKernelTests(DevtoolIdeSdkTests):
 
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 95ef472ed4..fcd2e5b5fe 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -9,6 +9,7 @@ import json
 import logging
 import os
 import shutil
+import shlex
 from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, DebuggerServerModes, LldbServerConfig, get_devtool_deploy_opts, resolve_deploy_target
 
 logger = logging.getLogger('devtool')
@@ -315,7 +316,10 @@ class IdeVSCode(IdeBase):
     def vscode_extensions(self, modified_recipe):
         recommendations = []
         if modified_recipe.build_tool is BuildTool.CARGO:
-            recommendations.append("rust-lang.rust-analyzer")
+            recommendations += [
+                "rust-lang.rust-analyzer",
+                "ms-vscode.cpptools",
+            ]
         # clangd (matched to the recipe's real cross compiler via
         # compile_commands.json) replaces cpptools as the IntelliSense provider
         # when selected via IDE_SDK_INTELLISENSE (defaults to clangd for the
@@ -358,18 +362,26 @@ class IdeVSCode(IdeBase):
         }
         if modified_recipe.build_tool is BuildTool.CMAKE:
             properties_dict["configurationProvider"] = "ms-vscode.cmake-tools"
-        elif modified_recipe.build_tool is BuildTool.MESON:
-            # configurationProvider = "mesonbuild.mesonbuild" does not work because
-            # the cross-compiler is not in PATH and omits the sysroot by default.
+        elif modified_recipe.build_tool in (BuildTool.MESON, BuildTool.CARGO):
             compiler_type = 'clang' if modified_recipe.toolchain == 'clang' else 'gcc'
             intelli_arch = arch_map.get(modified_recipe.target_arch, 'x64')
-            properties_dict["compilerPath"] = os.path.join(
-                modified_recipe.staging_bindir_toolchain,
-                modified_recipe.cxx.split()[0])
+            if modified_recipe.build_tool is BuildTool.MESON:
+                # configurationProvider = "mesonbuild.mesonbuild" does not work
+                # because the cross-compiler is not in PATH and omits the sysroot.
+                properties_dict["compilerPath"] = os.path.join(
+                    modified_recipe.staging_bindir_toolchain,
+                    modified_recipe.cxx.split()[0])
+                properties_dict["compileCommands"] = os.path.join(
+                    modified_recipe.b, 'compile_commands.json')
+            else:
+                properties_dict["compilerPath"] = shlex.split(
+                    modified_recipe.cargo_env['CXX'])[0]
+                properties_dict["includePath"] = [
+                    "${workspaceFolder}/**",
+                    os.path.join(modified_recipe.recipe_sysroot, "usr", "include")
+                ]
             properties_dict["compilerArgs"] = [
                 "--sysroot=" + modified_recipe.recipe_sysroot]
-            properties_dict["compileCommands"] = os.path.join(
-                modified_recipe.b, 'compile_commands.json')
             properties_dict["intelliSenseMode"] = "linux-%s-%s" % (compiler_type, intelli_arch)
         elif modified_recipe.build_tool is BuildTool.KERNEL_MODULE:
             # Using e.g. configurationProvider = "ms-vscode.makefile-tools" was not successful

-- 
2.53.0

