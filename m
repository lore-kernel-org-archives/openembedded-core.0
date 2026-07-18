Return-Path: <pascal.eberhard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD93C4451B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 07:16:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1852.1784358982051437695
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 00:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BcLE4kyq;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+pascal.eberhard.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1691A40AB7;
	Sat, 18 Jul 2026 07:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8759C2BCB7;
	Sat, 18 Jul 2026 07:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784358980;
	bh=VyNwJej/WT5h8lHoZGvoCVBzeG5h+9r+m8FebFrRVzc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BcLE4kyq0yvJlnya6y7yVdbLHxqXb3RSW/9PWDiOX2Mx/a/z6HB8jZXO4EDc8k2Xh
	 Ji38QIkG96MIiBzyJo5O4c5OnnuvZPUhc+R51qq+Z0ZXusrgd72YsclTF+0I5hCtnH
	 Eu/+qdx70s2/ROZ9mr1LLB3JD5QowpkOpfhdQwmZAfn0XTZxz2f5F6ktoLPCc2zKAp
	 54jO3kjUx7W3+yPNO2ZnSlNQZMaa5lEZC7ftnN1Lxvyyp0vxUL7eCf2A1lxoxJ25J6
	 YHwEXlwBowQ2JPvqdhPnYpXGzNt5uBwJe8kuzytHEYO4h9mx/AimF1TO+iRF5ToJeF
	 pjEwdeX0bJ1nQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F27C4451B;
	Sat, 18 Jul 2026 07:16:20 +0000 (UTC)
From: Pascal Eberhard via B4 Relay <devnull+pascal.eberhard.se.com@kernel.org>
Date: Sat, 18 Jul 2026 09:15:45 +0200
Subject: [PATCH] spdx30_tasks: fix missing SPDX runtime dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-fix_spdx_packages_dependson-v1-1-f950be4cd006@se.com>
X-B4-Tracking: v=1; b=H4sIACAoW2oC/x3MQQqAIBBA0avErBNKsKyrRIg5Uw2BiQMRRHdPW
 j74/AeEMpPAWD2Q6WLhMxa0dQVh93EjxVgMutFd07dWrXw7SXi75MPhNxKHlCiinFFpi8Oy9NY
 bE6AcUqaS//dpft8P17N4FG0AAAA=
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>, 
 Pascal Eberhard <pascal.eberhard@se.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784358979; l=3044;
 i=pascal.eberhard@se.com; s=20260304; h=from:subject:message-id;
 bh=0rl+z4WWZI5MQHX957jxWE3vUs4yb7YnDYG8tlbp9dA=;
 b=PqK8mNJGbdeK8dKHqjiaBPyr0GpHLEYM3fgY3KnoPfaapPPZM+VjwJLYKPL8IaELaJa4oK3ao
 4/PGr1npFmaClkUCY+/jvG4FBHXy61KjQOo9O3z6EON4VTu27HYNno6
X-Developer-Key: i=pascal.eberhard@se.com; a=ed25519;
 pk=J7TbFctjt1RVuN5K0juhf/w1E9bAfSeoQ/JG1vV9mWg=
X-Endpoint-Received: by B4 Relay for pascal.eberhard@se.com/20260304 with
 auth_id=661
X-Original-From: Pascal Eberhard <pascal.eberhard@se.com>
Reply-To: pascal.eberhard@se.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 07:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241236

From: Pascal Eberhard <pascal.eberhard@se.com>

The runtime dependsOn relationship entries between software_Package
is missing from the generated SPDX files.

Remove the subpkgdata lookup as the final pkg_name is already resolved
by collect_package_providers().

Rename variables to avoid shadowing the 'dep' variable and to make it
explicit which package/pkg name is being used.

Signed-off-by: Pascal Eberhard <pascal.eberhard@se.com>
---
 meta/lib/oe/spdx30_tasks.py | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 79e18db11d..652fe269e2 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1141,9 +1141,13 @@ def create_spdx(d):
 
 def create_package_spdx(d):
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
+    pkgdatadir = Path(d.getVar('PKGDATA_DIR'))
 
     direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
 
+    # providers[package_name] = pkg_name, where:
+    # - package_name is the name in the recipe in PACKAGES/RDEPENDS, and
+    # - pkg_name is the final name given by the package manager.
     providers = oe.spdx_common.collect_package_providers(d, direct_deps)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
@@ -1197,26 +1201,24 @@ def create_package_spdx(d):
             if dep not in providers:
                 continue
 
-            dep, _ = providers[dep]
+            dep_pkg_name, _ = providers[dep]
 
-            if not oe.packagedata.packaged(dep, localdata):
+            if not os.path.exists(pkgdatadir / "runtime-reverse" / dep_pkg_name):
+                bb.debug(1, f"pkg_name {dep_pkg_name}, package {dep} missing for {package}")
                 continue
 
-            dep_pkg_data = oe.packagedata.read_subpkgdata_dict(dep, d)
-            dep_pkg = dep_pkg_data["PKG"]
-
-            if dep in dep_package_cache:
-                dep_spdx_package = dep_package_cache[dep]
+            if dep_pkg_name in dep_package_cache:
+                dep_spdx_package = dep_package_cache[dep_pkg_name]
             else:
-                bb.debug(1, "Searching for %s" % dep_pkg)
+                bb.debug(1, "Searching for %s" % dep_pkg_name)
                 dep_spdx_package, _ = oe.sbom30.find_root_obj_in_jsonld(
                     d,
                     "packages-staging",
-                    "package-" + dep_pkg,
+                    "package-" + dep_pkg_name,
                     oe.spdx30.software_Package,
                     software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.install,
                 )
-                dep_package_cache[dep] = dep_spdx_package
+                dep_package_cache[dep_pkg_name] = dep_spdx_package
 
             runtime_spdx_deps.add(dep_spdx_package)
             seen_deps.add(dep)

---
base-commit: 171af3b2915dd076c8d1b205ff75eac1ebd5a586
change-id: 20260718-fix_spdx_packages_dependson-28d9bb78a55c

Best regards,
-- 
Pascal Eberhard <pascal.eberhard@se.com>



