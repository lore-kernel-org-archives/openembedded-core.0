Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6193.1794231919162663062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=hgx4EWtG;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 43B9C3D818F1;
	Mon,  9 Nov 2026 08:45:18 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 6Wc3DC6aD--G; Mon,  9 Nov 2026 08:45:17 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 63DF03D81892;
	Mon,  9 Nov 2026 08:45:17 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 63DF03D81892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231917; bh=ve+tP6XfxLxAdZawjPv73T8g7p0gCjUNATn/XNsuNU0=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=hgx4EWtGJYXE8uHR2H0s1CQdfLlpvej2DBpVkiF9KytYfVCWl7gplqrsmSWjCsv9o
	 3MiR7iu27fKEYlGff4LTZICJP6PoF7+9nnFHW8jvqbIYjmaD3vICLdfctV7PY30U6Q
	 voB3lgGjRsEYTwWdy6xs3lvxnOTnmkYGPrUMd0VFX6KSAAtgLYtB3I7MEtEo5SQlmA
	 xPX1oaMAtIqBSkJEI405wBsVj7kXvfwDwbsjqr352hqOehwh39odcOlvtj0udPmeBd
	 xlxHzFoJDi9Llp5vZXkeBBuxsrmrhGjCeKFtI67V0jwug6JbeW6orHV3QvkwxWm8tD
	 aK+DOBG+E0t4g==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id vthtN0GgLXIF; Mon,  9 Nov 2026 08:45:17 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id DC3E53D818FC;
	Mon,  9 Nov 2026 08:45:16 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:25 +0100
Subject: [PATCH v2 08/18] devtool: ide-sdk: extract install task definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-8-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249835

Extract the install/deploy task object before adding optional dependencies.
This preserves existing task output and provides a shared insertion
point for Cargo build/deploy ordering.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 9ee403f506..491e74f764 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -669,17 +669,16 @@ class IdeVSCode(IdeBase):
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

