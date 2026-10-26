Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38882.1793004976132852958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=osgDdpjf;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 40A213D81829;
	Mon, 26 Oct 2026 04:56:15 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id S35FiSj-SjTh; Mon, 26 Oct 2026 04:56:14 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6D7CD3D81665;
	Mon, 26 Oct 2026 04:56:14 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 6D7CD3D81665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004974; bh=3y1o/WKyuWmpg/1EDAAY/KSoY2hRrsLR02St6cSh92Q=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=osgDdpjfVi0KcjXkRr5LQ9khUFT5VzTtLOYoXcFJxHbSArQKBCo9Z8Gngi9priwNf
	 M21r0S+0c+6SzXy7OJVwVSvpM5qcnujSctJ8+ZOI8HFKExDBKMo2UOKtkUbQlCrtY7
	 qLw1DyUHgMhgHdV/DfVoFOk+6HlL1iNYjI5X2M7P1nl6IyT2Ng28M5w916Xhh/3ofW
	 IHXdd8cu6Vc2HR0jhEvaN5JKAl9lydIHEdRDu8qnTpEpGIMre2bwGvtfxnVkgdF9aM
	 PzihvVqrXno+ru46XdFaITDIdOnQ7he/QLKtrmU/C+VzDCnq8Laf9zdTlF8sdexMnK
	 CgOVM5m+J3gXA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id OZtNKuOyf4wJ; Mon, 26 Oct 2026 04:56:14 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C89723D81863;
	Mon, 26 Oct 2026 04:56:13 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:46 +0100
Subject: [PATCH 08/20] devtool: ide-sdk: generalize binary install task
 name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-8-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248645

Rename the C++-specific generator to describe its install/deploy behavior.
The upcoming Cargo task builds outside BitBake and will reuse this helper to
install and deploy the resulting recipe artifacts.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index fcd2e5b5fe..53cebe71a8 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -674,7 +674,7 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), launch_file, launch_dict)
 
-    def vscode_tasks_cpp(self, args, image_recipe, modified_recipe):
+    def vscode_tasks_binary(self, args, image_recipe, modified_recipe):
         run_install_deploy = modified_recipe.gen_install_deploy_script(args, image_recipe.nfs_deploy_dir)
         install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
         deploy_args = ["--target", resolve_deploy_target(args, image_recipe.nfs_deploy_dir)]
@@ -976,7 +976,7 @@ class IdeVSCode(IdeBase):
 
     def vscode_tasks(self, args, image_recipe, modified_recipe):
         if modified_recipe.build_tool.is_c_cpp:
-            self.vscode_tasks_cpp(args, image_recipe, modified_recipe)
+            self.vscode_tasks_binary(args, image_recipe, modified_recipe)
         elif modified_recipe.build_tool == BuildTool.KERNEL_MODULE:
             self.vscode_tasks_kernel_module(args, image_recipe, modified_recipe)
         else:

-- 
2.53.0

