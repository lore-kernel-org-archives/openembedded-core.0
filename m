Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6072.1794231919766389743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=WD/ul8ql;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D6FDA3D818FB;
	Mon,  9 Nov 2026 08:45:18 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Ga2AW1jOg9MW; Mon,  9 Nov 2026 08:45:18 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id F2DCB3D8176B;
	Mon,  9 Nov 2026 08:45:17 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com F2DCB3D8176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231918; bh=ggrICKcqJpwvEvdCEqbIQ188VgfvuF93H5tzfpK++ZI=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=WD/ul8qlsV0KhPmYYsOvl/nITY+v5rMMSw8WEuD5ANvJEJ4kRfFpUpBM2cPsOCVBi
	 AWnDjxKuhpXNKLO9QcWRWLJsvAcl+T4aw9tmCMbdbEEWTHW1jsA5O8faURpe9kvBT3
	 GVt5QjBv1aP5DlmQdBgk0FYSR0vnk5UJ13qsD8yrtpXgc6O4iznikX8TxLid49saHH
	 5SN/z10I44FJajI0TOoN1W/r3WLspXkKYz49ea+mRUrT0DHMV+HfQDSd+VBwv5zH2+
	 jkRYupBD+0U4uI40EkvChYYmVtuwO5IM5dMLEVVaMiuzELF475bLpV0oQH2gIS5IYk
	 5V0BpP0dVE7Xg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id VUg4GAK3UqY6; Mon,  9 Nov 2026 08:45:17 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 750223D818F3;
	Mon,  9 Nov 2026 08:45:17 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:26 +0100
Subject: [PATCH v2 09/18] devtool: ide-sdk: order install after optional
 build task
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-9-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249836

Let binary task generation optionally insert a build task and make
install/deploy depend on it. Cargo builds outside BitBake, so this ordering
ensures its artifacts exist before do_install and deploy-target run.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

---
Changes in v2:
- Fix install-task duplication while adding build-before-install ordering.
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 491e74f764..5d35be4f52 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -661,7 +661,7 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), launch_file, launch_dict)
 
-    def vscode_tasks_binary(self, args, image_recipe, modified_recipe):
+    def vscode_tasks_binary(self, args, image_recipe, modified_recipe, build_task=None):
         run_install_deploy = modified_recipe.gen_install_deploy_script(args, image_recipe.nfs_deploy_dir)
         install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
         deploy_args = ["--target", resolve_deploy_target(args, image_recipe.nfs_deploy_dir)]
@@ -669,6 +669,7 @@ class IdeVSCode(IdeBase):
             deploy_args += ["--port", args.port]
         for package in args.package or []:
             deploy_args += ["--package", package]
+        tasks = [build_task] if build_task else []
         install_task = {
             "label": install_task_name,
             "type": "shell",
@@ -676,9 +677,13 @@ class IdeVSCode(IdeBase):
             "args": deploy_args,
             "problemMatcher": []
         }
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

