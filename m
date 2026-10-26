Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38529.1793004977600449847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=NxLDYTtj;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B206D3D81886;
	Mon, 26 Oct 2026 04:56:16 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id i7wFoIf5Co6f; Mon, 26 Oct 2026 04:56:15 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A85813D81896;
	Mon, 26 Oct 2026 04:56:15 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A85813D81896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004975; bh=0x47750gnldgQigHO0SFXxgHiO5NanX28aV3lhDPWVw=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=NxLDYTtji9IBjIwHW3s0eiXTSzEMp16G5n81JxzQPFH2bkKwb1koRoaoLYHBhazoT
	 cgORBF0FrZqf/9hN2J/kXrEO/dlgTO8iUpE8TjpsJWWYoMhPnOPPvP/SFpBkr3E16M
	 LdZpSP1YRPXKN8VIjyJFn1mqH4TWJrgvNmONtVCv9Z71/J2Y3SHPee4wr6Z4W8uTbw
	 Cd84gFUVyMYpNPd8+X7SCxX5AOjIlhqKDV7F02mIhX5pWACQI6efhHVsy1O6pUFXF3
	 nOKYkBbR85h2959ZKxUWOF5hGdUvDMOsPjWXCPDDAenUsOz5ngKcl1JqC7jUqLiAtR
	 wU9fHJI2Ij7vA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id mwUP95d7ghib; Mon, 26 Oct 2026 04:56:15 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 0D1BE3D81863;
	Mon, 26 Oct 2026 04:56:14 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:48 +0100
Subject: [PATCH 10/20] devtool: ide-sdk: order install after optional build
 task
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-10-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248648

Let binary task generation optionally insert a build task and make
install/deploy depend on it. Cargo builds outside BitBake, so this ordering
ensures its artifacts exist before do_install and deploy-target run.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index b5ff344e8a..80314bfb89 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -674,7 +674,7 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), launch_file, launch_dict)
 
-    def vscode_tasks_binary(self, args, image_recipe, modified_recipe):
+    def vscode_tasks_binary(self, args, image_recipe, modified_recipe, build_task=None):
         run_install_deploy = modified_recipe.gen_install_deploy_script(args, image_recipe.nfs_deploy_dir)
         install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
         deploy_args = ["--target", resolve_deploy_target(args, image_recipe.nfs_deploy_dir)]
@@ -689,9 +689,21 @@ class IdeVSCode(IdeBase):
             "args": deploy_args,
             "problemMatcher": []
         }
+        tasks = [build_task] if build_task else []
+        install_task = {
+            "label": install_task_name,
+            "type": "shell",
+            "command": run_install_deploy,
+            "args": deploy_args,
+            "problemMatcher": []
+        }
+        if build_task:
+            install_task["dependsOn"] = [build_task["label"]]
+            install_task["dependsOrder"] = "sequence"
+        tasks.append(install_task)
         tasks_dict = {
             "version": "2.0.0",
-            "tasks": [install_task]
+            "tasks": tasks
         }
         for cross_debug_config in self.cross_debug_configs:
             if cross_debug_config.modified_recipe is not modified_recipe:

-- 
2.53.0

