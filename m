Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38530.1793004980561876048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=h1uieEr0;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A15023D8187E;
	Mon, 26 Oct 2026 04:56:19 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id S9VcAReJFI1G; Mon, 26 Oct 2026 04:56:18 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A67883D81833;
	Mon, 26 Oct 2026 04:56:18 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A67883D81833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004978; bh=lo+EJ4FjLmxljLHkeCjg/yWW+b9HqJmiHKXz6DinSPs=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=h1uieEr0Kw1nHoS4KCItIBOfsvR5D0PkAZhCv38blV2EQefO01qC863pY905QOrJ3
	 llX5zRRx0OKGUyHOjQu//th6U4dSB5LZZvx31mMp1LmnxGXLJiHIeG077MdeQKjYLU
	 xsKPRnchaBRTn23TFk/Q1gwLU45Xa2pjKT6RSZpl1gz4RYSpYutKMarFjNFGKG6+0M
	 Lr0XWO3nQEiaPZuDp77TVFrskshYn3qoTeLwTJCrWlALM/Vw6FylnPVdUyxppiq5Ld
	 eTinxgGE1IuPdhQZGjGgq96ZAQX7QISUJnKWrfmMeYWKuQMwZATKGFtZt52OJapsEU
	 R+CVBHBUtoidw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id rZSzB4fCJOGb; Mon, 26 Oct 2026 04:56:18 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 1D3C03D81829;
	Mon, 26 Oct 2026 04:56:18 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:53 +0100
Subject: [PATCH 15/20] devtool: ide-sdk: map Cargo workspace sources for
 LLDB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-15-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248653

Cargo debug info remaps the modified source tree to TARGET_DBGSRC_DIR.
Include this reverse map in CodeLLDB launch configs even when rootfs-dbg
is disabled. Use the Cargo workspace as its source root while preserving
the existing rootfs-debug mappings for other recipes.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     |  3 +++
 scripts/lib/devtool/ide_plugins/ide_code.py | 13 ++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 38bd3301cf..ca76597bbe 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4408,6 +4408,9 @@ class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
 
         self.assertIn('vadimcn.vscode-lldb', extensions['recommendations'])
         self.assertEqual(launch['type'], 'lldb')
+        target_dbgsrc_dir = get_bb_var('TARGET_DBGSRC_DIR', recipe_name)
+        self.assertEqual(
+            launch['sourceMap'][target_dbgsrc_dir], os.path.realpath(tempdir))
         server_task = next(
             task for task in tasks if task['label'] == launch['preLaunchTask'])
         self.assertIn('lldb-server platform --server', server_task['args'][-1])
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index e18c6a703d..596586ee9e 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -566,15 +566,22 @@ class IdeVSCode(IdeBase):
         source_map = {
             "/usr/include": os.path.join(modified_recipe.recipe_sysroot, "usr", "include")
         }
-        if lldb_config.image_recipe.rootfs_dbg:
+        rootfs_dbg = lldb_config.image_recipe.rootfs_dbg
+        is_cargo = modified_recipe.build_tool is BuildTool.CARGO
+        if is_cargo or rootfs_dbg:
+            source_root = (
+                modified_recipe.real_srctree
+                if is_cargo else "${workspaceFolder}")
             # Map build-time paths back to the workspace source tree.
             for target_path, host_path in modified_recipe.reverse_debug_prefix_map.items():
                 if host_path.startswith(modified_recipe.real_srctree):
                     source_map[target_path] = (
-                        "${workspaceFolder}"
+                        source_root
                         + host_path[len(modified_recipe.real_srctree):])
-                else:
+                elif rootfs_dbg:
                     source_map[target_path] = host_path
+
+        if rootfs_dbg:
             if "/usr/src/debug" in source_map:
                 logger.error(
                     'Key "/usr/src/debug" already exists in source_map. '

-- 
2.53.0

