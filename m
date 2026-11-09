Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6075.1794231923125722542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=dD+5ja1V;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3CA2D3D818FC;
	Mon,  9 Nov 2026 08:45:22 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id jZ2XAnm9SgNq; Mon,  9 Nov 2026 08:45:21 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 00BAE3D81892;
	Mon,  9 Nov 2026 08:45:21 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 00BAE3D81892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231921; bh=Pwz251FBEtuAAPOlH9+UQFsLFFLpRWsYu/cZHm0cxRM=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=dD+5ja1VFZXJPJ9INFAXkgwDHK1RExbhETBYKXucN3uwkk9tsBOViP/5TLVhb39n+
	 JPRkmMHal70frwodd6H/rd28wT/Iro/eaEU+Mn4E8kvLgry4havhc3yMcGm5BjunaA
	 jgUbzymmBDTFEm5Qayd9c+D/LaUMeSkztOKAU6wXZgR/9mIssOIJRC0QrNNs709LyJ
	 /TiaxfgAdR1bHtVMbleB3c/vF8kwPiyjstRpY7AvXYgRHoHzl6ZKLTsy9gT3WN6aJo
	 xnbdfx990I+eNC2xw9jj2uS+xVrv63O2OAp8UK7yQPtN+TOphwq+k/dExcAz/1QhMp
	 bYv/EDHlWwV8A==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id g8OrO_nI2Vge; Mon,  9 Nov 2026 08:45:20 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 5F18A3D818F1;
	Mon,  9 Nov 2026 08:45:20 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:31 +0100
Subject: [PATCH v2 14/18] devtool: ide-sdk: map libstd-rs sources to Rust
 SDK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-14-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249841

libstd-rs DWARF paths use a source prefix under work-shared, while
rust-native stages the standard-library sources in the recipe native
sysroot. Derive the target prefix from BitBake metadata and map it to the
SDK source tree so LLDB runtime frames resolve without host Rust sources.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

---
Changes in v2:
- Use STAGING_LIBDIR_NATIVE for multilib-correct Rust source
  paths.
---
 scripts/lib/devtool/ide_plugins/ide_code.py |  2 ++
 scripts/lib/devtool/ide_sdk.py              | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 6312988db1..8d5a0710fa 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -557,6 +557,8 @@ class IdeVSCode(IdeBase):
         }
         rootfs_dbg = lldb_config.image_recipe.rootfs_dbg
         is_cargo = modified_recipe.build_tool is BuildTool.CARGO
+        if is_cargo:
+            source_map.update(modified_recipe.cargo_std_source_map)
         if is_cargo or rootfs_dbg:
             source_root = (
                 modified_recipe.real_srctree
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 5096297b32..17209a8bde 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -923,6 +923,7 @@ class RecipeModified:
         self.cargo_packageconfig_confargs = None
         self.cargo_rustflags = None
         self.cargo_env = None
+        self.cargo_std_source_map = {}
 
         # Populated after bitbake built all the recipes
         self._installed_binaries = None
@@ -1140,6 +1141,24 @@ class RecipeModified:
                 'SYSTEM_DEPS_BUILD_INTERNAL': 'never',
                 'ZSTD_SYS_USE_PKG_CONFIG': '1',
             })
+            # libstd-rs DWARF paths map to sources staged by rust-native.
+            libstd_recipe_d = parse_recipe(
+                config, tinfoil, 'libstd-rs', appends=True,
+                filter_workspace=False)
+            if libstd_recipe_d:
+                libstd_rustsrc = libstd_recipe_d.getVar('RUSTSRC')
+                target_dbgsrc_dir = libstd_recipe_d.getVar('TARGET_DBGSRC_DIR')
+                libstd_tmpdir = libstd_recipe_d.getVar('TMPDIR')
+                if libstd_rustsrc and target_dbgsrc_dir and libstd_tmpdir:
+                    shared_source_dir = os.path.join(libstd_tmpdir, 'work-shared')
+                    target_source_root = os.path.join(
+                        target_dbgsrc_dir,
+                        os.path.relpath(libstd_rustsrc, shared_source_dir),
+                        'library')
+                    sdk_source_root = os.path.join(
+                        recipe_d.getVar('STAGING_LIBDIR_NATIVE'),
+                        'rustlib', 'src', 'rust', 'library')
+                    self.cargo_std_source_map[target_source_root] = sdk_source_root
             self.build_tool = BuildTool.CARGO
         elif bb.data.inherits_class('module', recipe_d):
             self.build_tool = BuildTool.KERNEL_MODULE

-- 
2.53.0

