Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6071.1794231918530308727
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=mmdzeA9Y;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9F1623D80F35;
	Mon,  9 Nov 2026 08:45:17 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id u2hjCopsoTvP; Mon,  9 Nov 2026 08:45:16 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CBD113D8176B;
	Mon,  9 Nov 2026 08:45:16 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com CBD113D8176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231916; bh=ybs4iB9sbv0CPzwELY2XDtqVUj4Mdz2hX/fmxtsJ3mA=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=mmdzeA9YeZTzg4ZrwM94vh1GfJgKOkGjcigAUJ4iAglTe+4wa3F/PNXekVI1850GB
	 Z1Oo6wgzFQXcN1yI6tML0I51+2ICdl/juKYnV0l2p2r/Apf8XtuNTUKq8CEDUe1824
	 HTIqo7Dr/naUw6D54M0lM9FMJnM0/hjTTMaAxcGiONmd0T88UFOhC552/d+W5B/IAh
	 vL2D6wjboFdDfy/Wv0K8FozPrLJuOMZHLLAXTkIa2nWCqpkeF8y0P/tgbYgzx4SQQ9
	 /zc0d0gg7878QNfnAlDO72e24R6MQvJupfRgw0fnR1gyfSmpDWRtSVcICo8sgDtR7s
	 yOZ7tTrnvK16w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id eMQADSEoFd3L; Mon,  9 Nov 2026 08:45:16 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 4AC463D81892;
	Mon,  9 Nov 2026 08:45:16 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:24 +0100
Subject: [PATCH v2 07/18] devtool: ide-sdk: generalize binary install task
 name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-7-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249834

Rename the C++-specific generator to describe its install/deploy behavior.
The upcoming Cargo task builds outside BitBake and will reuse this
helper to install and deploy the resulting recipe artifacts.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 3cb3a486a2..9ee403f506 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -661,7 +661,7 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), launch_file, launch_dict)
 
-    def vscode_tasks_cpp(self, args, image_recipe, modified_recipe):
+    def vscode_tasks_binary(self, args, image_recipe, modified_recipe):
         run_install_deploy = modified_recipe.gen_install_deploy_script(args, image_recipe.nfs_deploy_dir)
         install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
         deploy_args = ["--target", resolve_deploy_target(args, image_recipe.nfs_deploy_dir)]
@@ -963,7 +963,7 @@ class IdeVSCode(IdeBase):
 
     def vscode_tasks(self, args, image_recipe, modified_recipe):
         if modified_recipe.build_tool.is_c_cpp:
-            self.vscode_tasks_cpp(args, image_recipe, modified_recipe)
+            self.vscode_tasks_binary(args, image_recipe, modified_recipe)
         elif modified_recipe.build_tool == BuildTool.KERNEL_MODULE:
             self.vscode_tasks_kernel_module(args, image_recipe, modified_recipe)
         else:

-- 
2.53.0

