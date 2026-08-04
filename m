Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C84C55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:00:51 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14711.1785844847606000387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=BojhhNmm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260804120038bd31baeef900020759-dkwzrb@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260804120038bd31baeef900020759
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BsOteJ3HJweHVmGwEU7qEgWEKNRPiDxm3vaPLTAwHoI=;
 b=BojhhNmmkg5s64KpmlCSMa0LfxSH4QeraPRzp4T7IfMpdllAvrMPiDW5dYGnm9oNECPiCU
 LyYnsx1pc1++QOp+EJYFm1LvXNB4VA9SoyYw0SbToVMbDc5Vw5LvT8XLMvT0ukTWmGaUwdTu
 KFZLY3xHsyMIiELkVGB4XX/3BzFtAnU+Tds9H5UOedYTQuKn9HCF+5mkqPxkX1iXhLvs9O2p
 M8AhJIJfl49tFRZ/msOfI2jr6VZrUK0HTyxLbQvRSdvfTE3EZ/vds7295xRKLuyufCWPhCms
 Tr7MJg6/KwTkYwcSJ0hz0vibHqEbO98NsmZXH71OtJHAlbfryIIbvXpQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 02/14] devtool: ide-sdk: fix duplicate -p flag in _target_ssh_args
Date: Tue,  4 Aug 2026 13:59:26 +0200
Message-ID: <20260804120034.378787-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260804120034.378787-1-adrian.freihofer@siemens.com>
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242728

From: Adrian Freihofer <adrian.freihofer@siemens.com>

ssh_port is stored as ['-p', '<port>'] (already includes the flag).
_target_ssh_args was wrapping it in another list with a leading "-p",
producing invalid ssh args like ["-p", ["-p", "2222"]].

Extend ssh_args directly with ssh_port instead of nesting it.

Also pass --port to the install-and-deploy task in the generated VS Code
configuration so the task reaches the target on non-default SSH ports.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  2 +-
 scripts/lib/devtool/ide_plugins/ide_code.py | 10 ++--------
 scripts/lib/devtool/ide_sdk.py              |  2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index eaf88e78cd..94ed7c9e6d 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -142,7 +142,7 @@ class GdbCrossConfig:
     def _target_ssh_gdbserver_args(self):
         ssh_args = []
         if self.gdb_cross.target_device.ssh_port:
-            ssh_args += ["-p", self.gdb_cross.target_device.ssh_port]
+            ssh_args += self.gdb_cross.target_device.ssh_port
         if self.gdb_cross.target_device.extraoptions:
             ssh_args.extend(self.gdb_cross.target_device.extraoptions)
         if self.gdb_cross.target_device.target:
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 603d3cecf3..96f007ca91 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -404,10 +404,7 @@ class IdeVSCode(IdeBase):
                     "label": install_task_name,
                     "type": "shell",
                     "command": run_install_deploy,
-                    "args": [
-                        "--target",
-                        args.target
-                    ],
+                    "args": ["--target", args.target] + (["--port", args.port] if args.port else []),
                     "problemMatcher": []
                 }
             ]
@@ -515,10 +512,7 @@ class IdeVSCode(IdeBase):
                     "label": install_task_name,
                     "type": "shell",
                     "command": run_install_deploy,
-                    "args": [
-                        "--target",
-                        args.target
-                    ],
+                    "args": ["--target", args.target] + (["--port", args.port] if args.port else []),
                     "problemMatcher": []
                 },
                 {
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 07f5552758..fea44740f3 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -55,7 +55,7 @@ class TargetDevice:
         self.ssh_sshexec = 'ssh'
         if args.ssh_exec:
             self.ssh_sshexec = args.ssh_exec
-        self.ssh_port = ''
+        self.ssh_port = []
         if args.port:
             self.ssh_port = ['-p', args.port]
         if args.key:
-- 
2.55.0


