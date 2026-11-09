Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6192.1794231918384421816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=HhFHpWC2;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 77C093D818F4;
	Mon,  9 Nov 2026 08:45:17 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id wUUc2urG3NLT; Mon,  9 Nov 2026 08:45:16 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3BAF53D80F35;
	Mon,  9 Nov 2026 08:45:16 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3BAF53D80F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231916; bh=L0/j2Xl+/2j7NR9SG0qTBmIgwztozTRm23pNrpfa1GA=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=HhFHpWC2DK5dN68aTOw8UhMtOimwu+8GZUkw9Akl4EVYXano0yY167UbdYlXBViT6
	 Q0I4m6Od017E63WWzeG6XnYKs0jYZHG/30EKOTJZW5pfejY8Q0MumS7q2B6ZuTGcu/
	 qZEwmx6SUDlke7xhuviDfaa9Pf5mkj5Iak3Xl8btG5FMrPqj4MOxE7EcJhbQ5RtT5+
	 Frsol2a2snp6sJ1zE0K7XCnE4x6MK1VQQJnHI8xzDENHEM78lHC93CaZUs95fEd2LY
	 ElSGMSW1276jYz3I5TIlPLhTA7NiWR0FDKbcvAxSSqgauNBDMEAXAEgq4I9LP6rMJ/
	 R/SjilZ85vy1A==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id wmJMJG0matPb; Mon,  9 Nov 2026 08:45:16 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B0E913D818F1;
	Mon,  9 Nov 2026 08:45:15 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:23 +0100
Subject: [PATCH v2 06/18] devtool: ide-sdk: configure Rust Analyzer for
 Cargo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-6-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249833

Point Rust Analyzer at the generated Cargo config and target, while keeping
its process environment limited to the recipe PATH. Verify the workspace
config path and target in the Cargo selftest.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

---
Changes in v2:
- Use the Cargo config path generated during common recipe setup.
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 12 +++++++++++-
 scripts/lib/devtool/ide_plugins/ide_code.py | 10 ++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8e90dba7d0..ee055c218a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4341,7 +4341,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
 class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
 
-    def test_code_cargo_rust_analyzer_recommendation(self):
+    def test_code_cargo_rust_analyzer_configuration(self):
         recipe_name = "cargo-example"
         self._check_workspace()
         self._write_bb_config()
@@ -4349,8 +4349,18 @@ class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
         runCmd('devtool ide-sdk %s oe-selftest-image --ide=code' % recipe_name,
                output_log=self._cmd_logger)
 
+        with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_file:
+            settings = json.load(settings_file)
         with open(os.path.join(tempdir, '.vscode', 'extensions.json')) as extensions_file:
             extensions = json.load(extensions_file)
+        cargo_config = os.path.join(
+            self.workspacedir, 'ide-sdk', recipe_name, 'cargo-config.toml')
+        self.assertExists(cargo_config, 'Cargo config was not generated')
+        self.assertEqual(settings['rust-analyzer.cargo.configPath'], cargo_config)
+        self.assertEqual(
+            settings['rust-analyzer.cargo.target'],
+            get_bb_var('RUST_HOST_SYS', recipe_name))
+        self.assertNotIn('rust-analyzer.cargo.extraEnv', settings)
         self.assertIn('rust-lang.rust-analyzer', extensions['recommendations'])
 
 class DevtoolIdeSdkKernelTests(DevtoolIdeSdkTests):
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index cf7f81293c..3cb3a486a2 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -228,6 +228,15 @@ class IdeVSCode(IdeBase):
             }
         ]
 
+    def __vscode_settings_cargo(self, settings_dict, modified_recipe):
+        if modified_recipe.build_tool is not BuildTool.CARGO:
+            return
+        settings_dict["rust-analyzer.server.extraEnv"] = {
+            "PATH": modified_recipe.path
+        }
+        settings_dict["rust-analyzer.cargo.target"] = modified_recipe.cargo_target
+        settings_dict["rust-analyzer.cargo.configPath"] = modified_recipe.cargo_config_path
+
     def __vscode_settings_clangd(self, settings_dict, modified_recipe):
         if not (modified_recipe.ide_sdk_intellisense == 'clangd' and modified_recipe.build_tool.is_c_cpp):
             return
@@ -294,6 +303,7 @@ class IdeVSCode(IdeBase):
         self.__vscode_settings_cmake(settings_dict, modified_recipe)
         self.__vscode_settings_meson(settings_dict, modified_recipe)
         self.__vscode_settings_kernel_module(settings_dict, modified_recipe)
+        self.__vscode_settings_cargo(settings_dict, modified_recipe)
         self.__vscode_settings_clangd(settings_dict, modified_recipe)
         self.__vscode_settings_format(settings_dict, modified_recipe)
 

-- 
2.53.0

