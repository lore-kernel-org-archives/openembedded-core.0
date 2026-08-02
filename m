Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21116C55190
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 19:53:55 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29327.1785700422013885819
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 12:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=axO7UkYF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260802195339fb59943d4f00020741-ws4qbl@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260802195339fb59943d4f00020741
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 21:53:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BsOteJ3HJweHVmGwEU7qEgWEKNRPiDxm3vaPLTAwHoI=;
 b=axO7UkYFn/9d5Bo9QDI0qkkKsydZ2oWtNHgAQjG6i0xHB2nlRMzlCc8clVw/G2Ffhzabri
 MVHQvP/VOJbfz8w9sXczppTcO8b7IwMuIE7vtxyGx2BlC9xf1WwMlcSlIG5cV9Lbc0Z+dbQF
 oYeIAF4QKJKjpv5b46pbut/Reb1Bp7HT/2b3zSIAgkfTODw98nrGCqvvHFi73feiaKc5ISuw
 Xl52D9w3NebDTsnc3E3WnpDbQOwTxOqHJYFJLDVS5KHhWDqsvV4vywCV5u94/II0TBnvDClL
 T8QlAO4qbkyWgVtxU2wtY2otl3iTDp3LPEBUppIL+evhWayrRclMS0NA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 03/14] devtool: ide-sdk: fix duplicate -p flag in _target_ssh_args
Date: Sun,  2 Aug 2026 21:52:50 +0200
Message-ID: <20260802195324.64533-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260802195324.64533-1-adrian.freihofer@siemens.com>
References: <20260802195324.64533-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 19:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242578

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


