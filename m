Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38528.1793004976717084786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=KFHrSTDT;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CCA963D818BA;
	Mon, 26 Oct 2026 04:56:15 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id nwpDPCLDg9nz; Mon, 26 Oct 2026 04:56:15 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0BF693D81833;
	Mon, 26 Oct 2026 04:56:15 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 0BF693D81833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004975; bh=JXShXhkRKPWWFRgkHDwUAbTUOqGEt4vPm3yq1BONqLU=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=KFHrSTDT2gj+Y/vALe+W7uQH9gBoU28o7c7N1x2cRHGD1emS7JWhOt5VNGl8IWuy2
	 ThKlQ+kDqx4QcZgYJQojNFQ8gH4zHyHrX3a6lxFcSok5V2IdZIPDA5y7g24uhCl2ds
	 6vs5nd6H7/q+uFRCK+lPDSNd5XQU6OI5o8su7kdrQ/iO1ZxwUmXQTkb9TnY8gZw9Oo
	 jmVAjnIJHi6ybqE96QNSDe5euyRCvApNfIAPRpcseaJgQ9lfHLYJUfiEGbhn0h/xTk
	 EkOwpo8qOn6RFF7JMjN9NtY/UP5eBPNmP3wGFrWY9k4ArhIPUEb7tGURxeNM06JAHH
	 JotcCLREc2+9Q==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id n3-D5k9Vneqp; Mon, 26 Oct 2026 04:56:14 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 68E853D81829;
	Mon, 26 Oct 2026 04:56:14 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:47 +0100
Subject: [PATCH 09/20] devtool: ide-sdk: extract install task definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-9-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248647

Extract the install/deploy task object before adding optional dependencies.
This preserves existing task output and provides a shared insertion point for
Cargo build/deploy ordering.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 53cebe71a8..b5ff344e8a 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -682,17 +682,16 @@ class IdeVSCode(IdeBase):
             deploy_args += ["--port", args.port]
         for package in args.package or []:
             deploy_args += ["--package", package]
+        install_task = {
+            "label": install_task_name,
+            "type": "shell",
+            "command": run_install_deploy,
+            "args": deploy_args,
+            "problemMatcher": []
+        }
         tasks_dict = {
             "version": "2.0.0",
-            "tasks": [
-                {
-                    "label": install_task_name,
-                    "type": "shell",
-                    "command": run_install_deploy,
-                    "args": deploy_args,
-                    "problemMatcher": []
-                }
-            ]
+            "tasks": [install_task]
         }
         for cross_debug_config in self.cross_debug_configs:
             if cross_debug_config.modified_recipe is not modified_recipe:

-- 
2.53.0

