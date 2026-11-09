Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6073.1794231920870953585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=YAFMWRfG;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id F1C9C3D818F4;
	Mon,  9 Nov 2026 08:45:19 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id PVQWd0n2fZyG; Mon,  9 Nov 2026 08:45:18 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8F9213D8182D;
	Mon,  9 Nov 2026 08:45:18 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 8F9213D8182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231918; bh=95lPpieJfcewwPvyTS3MuZ7vdKV/OxxKwNkzLHT/rNI=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=YAFMWRfGeHrx65Ezkt7lt5O/DKgs5Yyg5Q0Z1oeXGcXf4j0jyWkLieziWALckQP00
	 Mj4/CbaDf+nWrF0OVUuNege14DZ2yPTv0C4bnlW1/CBBT2aHbO0TDleXBubeRqpSQ+
	 U216biQF6O5yQfJ/M6OPBOPVPUbK8GEo7SkvBdbOMb0xFVge/dc2svFWutD3GyOMKP
	 ujqlG6U+1C1FUMdo3citaawMO94FIXA/CZTEawFM+ri4t8xdZTduMolTXtRtVDn4Vm
	 I/eaQjRi+QvfTO5iyTogRogpwSIlsz+mhEcVfu45Q87A+lfDhT9D+Ld7WqIOM69WMl
	 rV6VE7B279HsQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id hm_ujEmM6D7H; Mon,  9 Nov 2026 08:45:18 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 0E7613D818FB;
	Mon,  9 Nov 2026 08:45:17 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:27 +0100
Subject: [PATCH v2 10/18] devtool: ide-sdk: add Cargo build task
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-10-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249837

Generate a Cargo build task that uses the exported recipe config and build
flags. Run it in the recipe source tree with only the SDK PATH so Cargo
uses the cross environment captured for the recipe.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

---
Changes in v2:
- Use the rustc problem matcher for Cargo build diagnostics.
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 38 +++++++++++++++++++++++++++++
 scripts/lib/devtool/ide_plugins/ide_code.py | 25 +++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ee055c218a..ef13eaa09a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4363,6 +4363,44 @@ class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
         self.assertNotIn('rust-analyzer.cargo.extraEnv', settings)
         self.assertIn('rust-lang.rust-analyzer', extensions['recommendations'])
 
+    def test_code_cargo_build_task(self):
+        recipe_name = "cargo-example"
+        self._check_workspace()
+        self._write_bb_config()
+        tempdir = self._devtool_ide_sdk_recipe(recipe_name, "Cargo.toml", None)
+        runCmd('devtool ide-sdk %s oe-selftest-image --ide=code '
+               '--target root@localhost --no-host-check' % recipe_name,
+               output_log=self._cmd_logger)
+
+        with open(os.path.join(tempdir, '.vscode', 'tasks.json')) as tasks_file:
+            tasks = json.load(tasks_file)['tasks']
+        build_task = next(task for task in tasks
+                          if task['label'].startswith('cargo build '))
+        cargo_config = os.path.join(
+            self.workspacedir, 'ide-sdk', recipe_name, 'cargo-config.toml')
+        self.assertEqual(build_task['command'], get_bb_var('CARGO', recipe_name))
+        self.assertEqual(
+            build_task['args'][:3], ['--config', cargo_config, 'build'])
+        self.assertIn('--features', build_task['args'])
+        self.assertIn('ide-sdk-selftest', build_task['args'])
+        self.assertEqual(set(build_task['options']['env']), {'PATH'})
+        self.assertEqual(build_task['problemMatcher'], '$rustc')
+
+        build_env = os.environ.copy()
+        build_env.update(build_task['options']['env'])
+        result = subprocess.run(
+            [build_task['command']] + build_task['args'],
+            cwd=build_task['options']['cwd'], env=build_env,
+            stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
+            universal_newlines=True)
+        self.assertEqual(result.returncode, 0, result.stdout)
+
+        install_task = next(
+            task for task in tasks
+            if task['label'].startswith('install && deploy-target '))
+        self.assertEqual(install_task['dependsOn'], [build_task['label']])
+
+
 class DevtoolIdeSdkKernelTests(DevtoolIdeSdkTests):
 
     @OETestTag("runqemu")
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 5d35be4f52..cb54948ce1 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -8,6 +8,7 @@
 import json
 import logging
 import os
+import shlex
 import shutil
 from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, DebuggerServerModes, LldbServerConfig, get_devtool_deploy_opts, resolve_deploy_target
 
@@ -832,6 +833,28 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
 
+    def vscode_tasks_cargo(self, args, image_recipe, modified_recipe):
+        build_task_name = "cargo build %s" % modified_recipe.recipe_id_pretty
+        cargo_config = modified_recipe.cargo_config_path
+        build_task = {
+            "label": build_task_name,
+            "type": "shell",
+            "command": modified_recipe.cargo,
+            "args": ["--config", cargo_config, "build"] +
+                     shlex.split(modified_recipe.cargo_build_flags) +
+                     shlex.split(modified_recipe.cargo_packageconfig_confargs),
+            "options": {
+                "cwd": modified_recipe.real_srctree,
+                "env": {"PATH": modified_recipe.path},
+            },
+            "group": {
+                "kind": "build",
+                "isDefault": True
+            },
+            "problemMatcher": "$rustc"
+        }
+        self.vscode_tasks_binary(args, image_recipe, modified_recipe, build_task)
+
     def vscode_tasks_fallback(self, args, image_recipe, modified_recipe):
         oe_init_dir = modified_recipe.oe_init_dir
         oe_init = ". %s %s > /dev/null && " % (modified_recipe.oe_init_build_env, modified_recipe.topdir)
@@ -970,6 +993,8 @@ class IdeVSCode(IdeBase):
             self.vscode_tasks_binary(args, image_recipe, modified_recipe)
         elif modified_recipe.build_tool == BuildTool.KERNEL_MODULE:
             self.vscode_tasks_kernel_module(args, image_recipe, modified_recipe)
+        elif modified_recipe.build_tool == BuildTool.CARGO:
+            self.vscode_tasks_cargo(args, image_recipe, modified_recipe)
         else:
             self.vscode_tasks_fallback(args, image_recipe, modified_recipe)
 

-- 
2.53.0

