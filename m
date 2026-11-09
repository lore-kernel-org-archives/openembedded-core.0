Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6190.1794231916180754002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=GEnxRg5q;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 37B1D3D818F4;
	Mon,  9 Nov 2026 08:45:15 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id bytq-E14sF1s; Mon,  9 Nov 2026 08:45:14 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DF8733D8176B;
	Mon,  9 Nov 2026 08:45:13 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com DF8733D8176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231913; bh=wI78uxHd1pMbYbJcXjonsVp2w/BTllkH4Wqbys6og3c=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=GEnxRg5qzIcslKhzyKWfc/YadHvudXt8Cqkc5x5jQYbJxIJarIuKZhwzpkCE65SXF
	 2SXdkkBQAU68BE0gSCjMBMiPia1SupdE2mmel4JvFTXqbiaF/mhAmc+fOv331xsDnK
	 7f0FKD+RQGBmT43BzVwEpeu8JaTjyLInoaP/NJBX9wLMh7R3b1N7MiCoEAyCw3N6cg
	 EA8yDY69EulHD94gCrR6OXoHrrlVCCbM5ns7WoEexOECIRkpSDnLkyAY2GEuc9yIVC
	 4F46zhLvXUa33BNDovJkOQTGt10+xGJ8WtD/m0L7w3QLjD1Hrwhu+RNHAPHHj+UyZy
	 ZwfRS5Ahep7Ww==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 8ZcRlXxUi7bi; Mon,  9 Nov 2026 08:45:13 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 60B643D81838;
	Mon,  9 Nov 2026 08:45:13 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:19 +0100
Subject: [PATCH v2 02/18] devtool: ide-sdk: capture Cargo cross environment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-2-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249827

Capture Cargo target and host compiler settings, recipe Cargo state, and
package configuration to generate IDE settings. Rust source paths use Cargo
RUSTFLAGS and TARGET_DBGSRC_DIR because Rust does not use compiler
DEBUG_PREFIX_MAP.

Mirror the -sys and pkg-config exports from cargo_common.bbclass so
Cargo config matches OE's system-library behavior.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  1 +
 scripts/lib/devtool/ide_sdk.py              | 57 +++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 7841bc37b9..10fcde471f 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -33,6 +33,7 @@ class BuildTool(Enum):
     UNDEFINED = auto()
     CMAKE = auto()
     MESON = auto()
+    CARGO = auto()
     KERNEL_MODULE = auto()
 
     @property
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 9faf041957..e686dbcff8 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -877,6 +877,15 @@ class RecipeModified:
         self.extra_oemake = None
         self.kernel_cc = None
         self.staging_kernel_dir = None
+        # Cargo application
+        self.cargo = None
+        self.cargo_target = None
+        self.cargo_linker = None
+        self.cargo_home = None
+        self.cargo_build_flags = None
+        self.cargo_packageconfig_confargs = None
+        self.cargo_rustflags = None
+        self.cargo_env = None
 
         # Populated after bitbake built all the recipes
         self._installed_binaries = None
@@ -1032,6 +1041,54 @@ class RecipeModified:
             self.extra_oemeson = recipe_d.getVar('EXTRA_OEMESON')
             self.meson_cross_file = recipe_d.getVar('MESON_CROSS_FILE')
             self.build_tool = BuildTool.MESON
+        elif bb.data.inherits_class('cargo', recipe_d):
+            self.cargo = recipe_d.getVar('CARGO') or 'cargo'
+            self.cargo_target = recipe_d.getVar('RUST_HOST_SYS')
+            self.cargo_linker = recipe_d.getVar('CARGO_RUST_TARGET_CCLD')
+            self.cargo_home = recipe_d.getVar('CARGO_HOME')
+            self.cargo_build_flags = recipe_d.getVar('CARGO_BUILD_FLAGS') or ''
+            self.cargo_packageconfig_confargs = recipe_d.getVar(
+                'PACKAGECONFIG_CONFARGS') or ''
+            self.cargo_rustflags = recipe_d.getVar('RUSTFLAGS') or ''
+            # Rust DWARF paths need remapping to the target debug-source path
+            # so LLDB can resolve files after the source tree is relocated.
+            target_dbgsrc_dir = recipe_d.getVar('TARGET_DBGSRC_DIR')
+            if target_dbgsrc_dir:
+                source_map = '--remap-path-prefix=%s=%s' % (
+                    self.real_srctree, target_dbgsrc_dir)
+                self.cargo_rustflags = '%s %s' % (
+                    self.cargo_rustflags, shlex.quote(source_map))
+            # This environment feeds the generated Cargo config and the C/C++
+            # IntelliSense settings; build tasks themselves only need PATH.
+            self.cargo_env = self.exported_vars.copy()
+            self.cargo_env.update({
+                'CC': recipe_d.getVar('RUST_TARGET_CC'),
+                'CXX': recipe_d.getVar('RUST_TARGET_CXX'),
+                'CFLAGS': recipe_d.getVar('CFLAGS'),
+                'CXXFLAGS': recipe_d.getVar('CXXFLAGS'),
+                'AR': recipe_d.getVar('AR'),
+                'TARGET_CC': recipe_d.getVar('RUST_TARGET_CC'),
+                'TARGET_CXX': recipe_d.getVar('RUST_TARGET_CXX'),
+                'TARGET_CFLAGS': recipe_d.getVar('CFLAGS'),
+                'TARGET_CXXFLAGS': recipe_d.getVar('CXXFLAGS'),
+                'TARGET_AR': recipe_d.getVar('AR'),
+                'HOST_CC': recipe_d.getVar('RUST_BUILD_CC'),
+                'HOST_CXX': recipe_d.getVar('RUST_BUILD_CXX'),
+                'HOST_CFLAGS': recipe_d.getVar('BUILD_CFLAGS'),
+                'HOST_CXXFLAGS': recipe_d.getVar('BUILD_CXXFLAGS'),
+                'HOST_AR': recipe_d.getVar('BUILD_AR'),
+                # Match cargo_common.bbclass so Cargo -sys crates use OE's
+                # staged libraries through pkg-config instead of vendoring.
+                'LIBGIT2_NO_VENDOR': '1',
+                'LIBSSH2_SYS_USE_PKG_CONFIG': '1',
+                'LIBSQLITE3_SYS_USE_PKG_CONFIG': '1',
+                'OPENSSL_NO_VENDOR': '1',
+                'PKG_CONFIG_ALLOW_CROSS': '1',
+                'PKG_CONFIG_ALL_DYNAMIC': '1',
+                'SYSTEM_DEPS_BUILD_INTERNAL': 'never',
+                'ZSTD_SYS_USE_PKG_CONFIG': '1',
+            })
+            self.build_tool = BuildTool.CARGO
         elif bb.data.inherits_class('module', recipe_d):
             self.build_tool = BuildTool.KERNEL_MODULE
             self.wants_gdbserver = False

-- 
2.53.0

