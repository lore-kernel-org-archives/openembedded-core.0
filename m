Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6069.1794231917223012450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=m0PwVNHc;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3FA5A3D818F9;
	Mon,  9 Nov 2026 08:45:16 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 8k5z8NPfVqO5; Mon,  9 Nov 2026 08:45:15 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 262C53D81892;
	Mon,  9 Nov 2026 08:45:15 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 262C53D81892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231915; bh=B13kUIrUvQDimnqARUVsnNYd6tsy5hTK1xIxggVl5Aw=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=m0PwVNHcoMgABB9ftfKv8fmWfQHVcDncoeHPaaXxgK4oPayA82omREYymc12EQFPj
	 QN/VQNJBczSjOaS1zBssmExas/bvjOVWpULSU6kvwNuyPfPeQEbXpwKjxnlZpVYqWh
	 wW0UeCBSpjn3RoeR/yHc5k67d21SRvmYwmjBGx28R8jsAp18Eo/DB34D/yONmUKjCv
	 WV+zqJVrgJ3BoJA83udiFKQ4Qo0s13ollluA3vVBECiNVuz4JWLili5KZeEbBBT8j5
	 UxcTvOfqUk4KaZWbHVU4I+93e/DOlyNKph/mNG7kD9wRa4NB6SPIyqovt5VNakElFD
	 VUrisXsPKSdeA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 7_kHgTTgKO1k; Mon,  9 Nov 2026 08:45:14 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 880EF3D818F1;
	Mon,  9 Nov 2026 08:45:14 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:21 +0100
Subject: [PATCH v2 04/18] oeqa/selftest: verify Cargo config serialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-4-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249830

Parse the config exported by devtool and round-trip the TOML writer's
supported tables and values.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

---
Changes in v2:
- Commit added to verify the generated Cargo config.
---
 meta/lib/oeqa/selftest/cases/devtool.py | 63 +++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 265f2147a4..cab49b4c02 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -5242,3 +5242,66 @@ class DevtoolIdeSdkMiscTests(DevtoolIdeSdkTests):
         with open(modified_config_file) as modified_config:
             modified_config_new = modified_config.read()
         self.assertEqual(modified_config_str, modified_config_new)
+
+
+class DevtoolIdeSdkCargoConfigTests(DevtoolIdeSdkTests):
+
+    def test_cargo_toml_serialization(self):
+        import importlib
+        import sys
+
+        from bb._vendor import tomli
+
+        config = {
+            'paths': ['/work/crate', '/work/quoted "crate"\\dir'],
+            'source': {'bitbake': {'directory': '/downloads/cargo'}},
+            'patch': {
+                'https://example.com/repo': {
+                    'example': {'path': '/work/patched-crate'}
+                }
+            },
+            'env': {
+                'CC': {'value': '/tool/cc --flag="quoted"\\path', 'force': True}
+            },
+            'target': {
+                'x86_64-poky-linux': {
+                    'linker': '/tool/ld',
+                    'rustflags': ['--sysroot', '/sysroot path'],
+                }
+            },
+            'term': {'progress': {'when': 'always', 'width': 80}},
+        }
+
+        scripts_lib = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib')
+        sys.path.insert(0, scripts_lib)
+        oeqa_devtool = sys.modules.pop('devtool')
+        try:
+            ide_sdk = importlib.import_module('devtool.ide_sdk')
+            self.assertEqual(tomli.loads(ide_sdk._toml_dumps(config)), config)
+        finally:
+            for name in tuple(sys.modules):
+                if name == 'devtool' or name.startswith('devtool.'):
+                    del sys.modules[name]
+            sys.modules['devtool'] = oeqa_devtool
+            sys.path.remove(scripts_lib)
+
+    def test_cargo_config_is_generated_and_valid(self):
+        from bb._vendor import tomli
+
+        recipe_name = 'cargo-example'
+        self._check_workspace()
+        self._write_bb_config()
+        self._devtool_ide_sdk_recipe(recipe_name, 'Cargo.toml', None)
+        runCmd('devtool ide-sdk %s oe-selftest-image --ide=code' % recipe_name,
+               output_log=self._cmd_logger)
+
+        cargo_config = os.path.join(
+            self.workspacedir, 'ide-sdk', recipe_name, 'cargo-config.toml')
+        self.assertExists(cargo_config, 'Cargo config was not generated')
+        with open(cargo_config) as cargo_config_file:
+            config = tomli.loads(cargo_config_file.read())
+        rust_target = get_bb_var('RUST_HOST_SYS', recipe_name)
+        self.assertEqual(config['build']['target'], rust_target)
+        self.assertEqual(
+            config['target'][rust_target]['linker'],
+            get_bb_var('CARGO_RUST_TARGET_CCLD', recipe_name))

-- 
2.53.0

