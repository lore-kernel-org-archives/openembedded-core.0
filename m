Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38523.1793004973620930012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=Iks9K5J7;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9F76A3D818BD;
	Mon, 26 Oct 2026 04:56:12 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id PpGGN_SvsoVm; Mon, 26 Oct 2026 04:56:11 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 490283D81886;
	Mon, 26 Oct 2026 04:56:11 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 490283D81886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004971; bh=u78LAm3kCalwn/I6m7UYFSB57F27UMB0d29XkBWW4eg=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=Iks9K5J7uGbAonFxGAhAScYgq/39lKb4CuEaUMW/lHH87dXnlKveCdrU8PkHmMSOA
	 DnEKi5Bch6vHD+4kTpQLQBDZyfIB17SWRrSqL9Htww7pq/jy66J8NznVD6y+g230lP
	 ZqCh2XI4KKdUGRmPW+fhpN0z7gO5FEWPsQmLUdv5wQM3tpn3YqAuFu5YTZZGzFdxB0
	 gpMjasQSX1nnshK14QpqUpPkszCVRi3d9s156SjeMhkffbxTScd5zbKpUMKTT4V3Z4
	 u/IRXHdbq8iNtzoXMvJfIi5q6LfIRSMZqyjFYb31kM0c+0IQX46+ZCNgnoo+i5DiUT
	 zPj6+BwwvR2ww==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id BzaVtBpgYiOm; Mon, 26 Oct 2026 04:56:11 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B19A63D81896;
	Mon, 26 Oct 2026 04:56:10 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:41 +0100
Subject: [PATCH 03/20] devtool: ide-sdk: export recipe Cargo configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-3-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248641

Export recipe Cargo config to the devtool workspace so Cargo and
rust-analyzer reuse target, linker, rustflags, and dependency settings
instead of duplicating them in settings.json and tasks.json. Other IDE
integrations can reuse the generated config too.

Update managed TOML table entries in place to preserve unrelated content.
tomllib and tomli only parse TOML; using a writer would add a dependency.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_sdk.py | 84 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index e686dbcff8..21229f5970 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -36,6 +36,34 @@ logger = logging.getLogger('devtool')
 ide_plugins = {}
 
 
+def set_toml_table_values(content, table, values):
+    """Update one TOML table while preserving unrelated configuration text."""
+    lines = content.splitlines()
+    header = '[%s]' % table
+    try:
+        start = next(i for i, line in enumerate(lines)
+                     if line.strip() == header)
+    except StopIteration:
+        if lines and lines[-1].strip():
+            lines.append('')
+        lines.append(header)
+        start = len(lines) - 1
+
+    end = next((i for i in range(start + 1, len(lines))
+                if lines[i].lstrip().startswith('[')
+                and lines[i].rstrip().endswith(']')), len(lines))
+    for key, value in values.items():
+        entry = '%s = %s' % (key, value)
+        for i in range(start + 1, end):
+            if '=' in lines[i] and lines[i].split('=', 1)[0].strip() == key:
+                lines[i] = entry
+                break
+        else:
+            lines.insert(end, entry)
+            end += 1
+    return '\n'.join(lines).rstrip() + '\n'
+
+
 class DevtoolIdeMode(Enum):
     """Different modes are supported by the ide-sdk plugin.
 
@@ -1122,6 +1150,62 @@ class RecipeModified:
         self.recipe_id = self.bpn + "-" + self.package_arch
         self.recipe_id_pretty = self.bpn + ": " + self.package_arch
 
+    @property
+    def cargo_config_path(self):
+        return os.path.join(self.ide_sdk_dir, 'cargo-config.toml')
+
+    def update_cargo_config(self):
+        """Export the recipe Cargo config to the devtool workspace."""
+        source_config = os.path.join(self.cargo_home, 'config.toml')
+        try:
+            with open(source_config, 'r') as config_file:
+                original = config_file.read()
+        except FileNotFoundError as exc:
+            raise DevtoolError(
+                'Cargo config not found at %s; build the recipe first' % source_config) from exc
+
+        content = (
+            '# Generated by devtool ide-sdk for the active build environment.\n'
+            '\n'
+            + original)
+        content = set_toml_table_values(content, 'build', {
+            'target': json.dumps(self.cargo_target),
+        })
+        content = set_toml_table_values(content, 'target.%s' % self.cargo_target, {
+            'linker': json.dumps(self.cargo_linker),
+            'rustflags': json.dumps(shlex.split(self.cargo_rustflags)),
+        })
+        env_names = (
+            'CC', 'CXX', 'CFLAGS', 'CXXFLAGS', 'AR',
+            'TARGET_CC', 'TARGET_CXX', 'TARGET_CFLAGS', 'TARGET_CXXFLAGS', 'TARGET_AR',
+            'HOST_CC', 'HOST_CXX', 'HOST_CFLAGS', 'HOST_CXXFLAGS', 'HOST_AR',
+            'RUST_TARGET_PATH', 'RUST_BACKTRACE', 'SOURCE_DATE_EPOCH',
+            'PKG_CONFIG', 'PKG_CONFIG_FOR_BUILD', 'PKG_CONFIG_FOR_TARGET',
+            'PKG_CONFIG_SYSROOT_DIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_LIBDIR',
+            'LIBGIT2_NO_VENDOR', 'LIBSSH2_SYS_USE_PKG_CONFIG',
+            'LIBSQLITE3_SYS_USE_PKG_CONFIG', 'OPENSSL_NO_VENDOR',
+            'PKG_CONFIG_ALLOW_CROSS', 'PKG_CONFIG_ALL_DYNAMIC',
+            'SYSTEM_DEPS_BUILD_INTERNAL', 'ZSTD_SYS_USE_PKG_CONFIG',
+        )
+        env_values = {}
+        for name in env_names:
+            value = self.cargo_env.get(name)
+            if value is not None:
+                env_values[name] = '{ value = %s, force = true }' % json.dumps(str(value))
+        content = set_toml_table_values(content, 'env', env_values)
+
+        config_path = self.cargo_config_path
+        os.makedirs(os.path.dirname(config_path), exist_ok=True)
+        try:
+            with open(config_path, 'r') as config_file:
+                current = config_file.read()
+        except FileNotFoundError:
+            current = None
+        if current != content:
+            with open(config_path, 'w') as config_file:
+                config_file.write(content)
+        return config_path
+
     @staticmethod
     def is_valid_shell_variable(var):
         """Skip strange shell variables like systemd

-- 
2.53.0

