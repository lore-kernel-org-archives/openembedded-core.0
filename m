Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38531.1793004981397862996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=lYTdC22e;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7A8233D818BA;
	Mon, 26 Oct 2026 04:56:20 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id wAYrNtp_60f0; Mon, 26 Oct 2026 04:56:19 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 603753D81844;
	Mon, 26 Oct 2026 04:56:19 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 603753D81844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004979; bh=AM4UfZsPn56bPCuiMgoyv2TEPIvnnERiTwMR1bycunY=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=lYTdC22eYJsO3Dz6lrHDfJhbBsyniKAVt5BaGPS+mLHgzz27c+FKabWtrt6Cn8u7a
	 fm+z5234sIEsMul0bUWaBxeY2kH3wHLmFReHO/U8+yx969xHaVxcPkYKJVXybFWbP5
	 86747QR6O7a+NO+UGPNeAJb2YkfNeyuLD81nUSLiHWw3BoPRC9DRQsj7hgFOouyN/J
	 KlvDa8rtdocFiXgW3x7sQY3MCH1QrAyo5ByI95mkCK7ZaR/5+3Cl3JBO+xw0nRJLCD
	 +3TSUi4tIIongZOyMyeme5EVB3MP2T6S7QxE+PCqP6sNbjojjGdxJMUfrSD6QVV+/r
	 S1VBtGvS6sexQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 7LgriVmN9S-P; Mon, 26 Oct 2026 04:56:19 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B458F3D81896;
	Mon, 26 Oct 2026 04:56:18 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:54 +0100
Subject: [PATCH 16/20] devtool: ide-sdk: map libstd-rs sources to Rust SDK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-16-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248654

libstd-rs DWARF paths use a source prefix under work-shared, while
rust-native stages the standard-library sources in the recipe native sysroot.
Derive the target prefix from BitBake metadata and map it to the SDK source
tree so LLDB runtime frames resolve without host Rust sources.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py |  2 ++
 scripts/lib/devtool/ide_sdk.py              | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 596586ee9e..623a54ddc6 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -568,6 +568,8 @@ class IdeVSCode(IdeBase):
         }
         rootfs_dbg = lldb_config.image_recipe.rootfs_dbg
         is_cargo = modified_recipe.build_tool is BuildTool.CARGO
+        if is_cargo:
+            source_map.update(modified_recipe.cargo_std_source_map)
         if is_cargo or rootfs_dbg:
             source_root = (
                 modified_recipe.real_srctree
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 9fd95f0a63..b6ac02e367 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -915,6 +915,7 @@ class RecipeModified:
         self.cargo_packageconfig_confargs = None
         self.cargo_rustflags = None
         self.cargo_env = None
+        self.cargo_std_source_map = {}
 
         # Populated after bitbake built all the recipes
         self._installed_binaries = None
@@ -1134,6 +1135,24 @@ class RecipeModified:
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
+                        self.recipe_sysroot_native, self.libdir.lstrip('/'),
+                        'rustlib', 'src', 'rust', 'library')
+                    self.cargo_std_source_map[target_source_root] = sdk_source_root
             self.build_tool = BuildTool.CARGO
         elif bb.data.inherits_class('module', recipe_d):
             self.build_tool = BuildTool.KERNEL_MODULE

-- 
2.53.0

