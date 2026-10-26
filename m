Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38881.1793004974669504489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=KIrkwoN1;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C05273D818BC;
	Mon, 26 Oct 2026 04:56:13 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Ksa6OU-xk-PL; Mon, 26 Oct 2026 04:56:12 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 826BE3D81863;
	Mon, 26 Oct 2026 04:56:12 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 826BE3D81863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004972; bh=TgIZAsf68xq5NDzRMbJV0PlHF2RHw2dfudgfA0nd+Sc=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=KIrkwoN1bKTIXRiTiH3Zu5zXHqU+hPEesLAnmVC3VDhxzVIdfSEpIk5c5Ke9DNePF
	 WS+l/zd2ddcrOUkhwRZefWjmZQ6wE1s9OEWpI5orIT7MHHttd2Xif1PzPLJyZffK9T
	 7PK2geytOqifrUUCB/xhX7k9VT3TiEueiEzQ1rtp5zvmPZNfN9ppcque2TGicKc15L
	 N0vZgykH0q5bHPa/Ss5mEViLwSw4UXicH1L1aHMgiA7nQEdw0C+m60mgCMnRA4rVXm
	 q4s3STNGAb3IDtarmwt26Q9twFoMtWKGrkpDKMyCYcjRUGA0sT3Em1Kxe3ZhJXbu6N
	 4BNDvHHJkqcyg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id W28th-MR3iqB; Mon, 26 Oct 2026 04:56:12 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id EAF623D818BA;
	Mon, 26 Oct 2026 04:56:11 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:43 +0100
Subject: [PATCH 05/20] devtool: ide-sdk: configure Rust Analyzer for Cargo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-5-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248643

Point Rust Analyzer at the generated Cargo config and target, while keeping
its process environment limited to the recipe PATH. Verify the workspace
config path and target in the Cargo selftest.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 12 +++++++++++-
 scripts/lib/devtool/ide_plugins/ide_code.py | 11 +++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 941f54e36b..d1e15d0180 100644
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
index cf7f81293c..85f286335f 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -228,6 +228,16 @@ class IdeVSCode(IdeBase):
             }
         ]
 
+    def __vscode_settings_cargo(self, settings_dict, modified_recipe):
+        if modified_recipe.build_tool is not BuildTool.CARGO:
+            return
+        cargo_config = modified_recipe.update_cargo_config()
+        settings_dict["rust-analyzer.server.extraEnv"] = {
+            "PATH": modified_recipe.path
+        }
+        settings_dict["rust-analyzer.cargo.target"] = modified_recipe.cargo_target
+        settings_dict["rust-analyzer.cargo.configPath"] = cargo_config
+
     def __vscode_settings_clangd(self, settings_dict, modified_recipe):
         if not (modified_recipe.ide_sdk_intellisense == 'clangd' and modified_recipe.build_tool.is_c_cpp):
             return
@@ -294,6 +304,7 @@ class IdeVSCode(IdeBase):
         self.__vscode_settings_cmake(settings_dict, modified_recipe)
         self.__vscode_settings_meson(settings_dict, modified_recipe)
         self.__vscode_settings_kernel_module(settings_dict, modified_recipe)
+        self.__vscode_settings_cargo(settings_dict, modified_recipe)
         self.__vscode_settings_clangd(settings_dict, modified_recipe)
         self.__vscode_settings_format(settings_dict, modified_recipe)
 

-- 
2.53.0

