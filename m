Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6196.1794231922310880885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=Wv+IyXPr;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6AA543D818F3;
	Mon,  9 Nov 2026 08:45:21 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 71eu6rzYzGez; Mon,  9 Nov 2026 08:45:20 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 55B0B3D81838;
	Mon,  9 Nov 2026 08:45:20 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 55B0B3D81838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231920; bh=KIS9f9X68D0vi+H/3CLUb4m4fLV1kbGpgWsJYgmrFoQ=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=Wv+IyXPrvMGZUTZViL/EcJhrkjDm6csl33DqwyOfFF9W/aRFRejIzKRl0MxjxuUKu
	 OxpEREKlaudtoB47fmOPcrEt4wTF9tB678bg20o/PBRXeuaKcOSwQISzu23ZyXI6Ia
	 j4p7Bmcjo+k2Ql/Vcd8YFGtH6oLSsoI4w9THnUBhtpGJgZddrgoJl1guyInQNfmYbd
	 rLduPa4pZ1830MxZ3/e9UbZo+BjvNu+YdqZVj5LTZ0rGCJrR8LP9GqhnbM2nkYUUHT
	 BOkxEF3aHKUDlH6AFdT/wtxwR2MMeK9t0SwiFjgVltXX5B1wS+7yGSHO7s5Ii13mdL
	 037U9XnT2+46Q==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id RCWLNJzQ8sno; Mon,  9 Nov 2026 08:45:20 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C4AEA3D81892;
	Mon,  9 Nov 2026 08:45:19 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:30 +0100
Subject: [PATCH v2 13/18] devtool: ide-sdk: map Cargo workspace sources for
 LLDB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-13-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249840

Cargo debug info remaps the modified source tree to TARGET_DBGSRC_DIR.
Include this reverse map in CodeLLDB launch configs even when rootfs-dbg
is disabled. Use the Cargo workspace as its source root while preserving
the existing rootfs-debug mappings for other recipes.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

---
Changes in v2:
- Move source-map verification to the LLDB configuration test.
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index a7bb3221e0..6312988db1 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -555,15 +555,22 @@ class IdeVSCode(IdeBase):
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

