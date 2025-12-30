Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D378E94120
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 08:47:39 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60942.1767084455913685628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 00:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=X9WFGKUr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-202512300847339f1a4fb438000207cf-_wwxqf@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202512300847339f1a4fb438000207cf
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 09:47:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ytwbJK7YaFWEJvh6YC3Ry2SuqU/EV8WpuRR1qpAFcPA=;
 b=X9WFGKUrwQF6p/qPzapmpSCub4jhuJ0d4U7Chkd8/+gD4zJcQ2DEri8WS0Ys/5vkmav5qG
 /PWxKUVLUJ8yTO8t9kWbr57OQYfQwokHjHjCqL5+o1ZI/wMM5FGDWT6d7qvZa9zMTLEUl+nr
 eBi9NHgU+3Gcm0QI/lXRlbE3c9nDUNlJZih2ZbfVi8It4rePx7F3a2cG1Ec1RAFZnBxW3yur
 5t+znaLNgVovfaqYbHAvFDd9HAPlYCMSKiRde+NBC6MJy1sSp986kduxTnvtPt4rHBSOg08E
 Q87P+8+MbE9MzbeI/YXU3o1X2PXCKT57ZIlrRDGjYcohWUu0AjPE1a1g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 08/14] devtool: ide-sdk: vscode replace scripts
Date: Tue, 30 Dec 2025 09:46:48 +0100
Message-ID: <20251230084720.2371227-9-adrian.freihofer@siemens.com>
In-Reply-To: <20251230084720.2371227-1-adrian.freihofer@siemens.com>
References: <20251230084720.2371227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 08:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228641

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Write the ssh command to start gdbserver on target directly into the
tasks.json. This avoids the need to create one more script file on the
host. It also simplifies manual modifications of VSCode's standard
tasks.json which is much more handy than modifying multiple proprietary
scripts used to launch gdbserver.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 3f8c1a44a3..05d513f160 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -20,6 +20,18 @@ class GdbCrossConfigVSCode(GdbCrossConfig):
         super().__init__(image_recipe, modified_recipe, binary,
                          gdbserver_default_mode)
 
+    def target_ssh_gdbserver_start_args(self, gdbserver_mode=None):
+        """Get the ssh command arguments to start gdbserver on the target device
+
+        returns something like:
+          ['-p', '2222', 'root@target', '"/bin/sh -c \'/usr/bin/gdbserver --once :1234 /usr/bin/cmake-example\'"']
+        """
+        if gdbserver_mode is None:
+            gdbserver_mode = self.gdbserver_default_mode
+        return self._target_ssh_gdbserver_args() + [
+            self._target_gdbserver_start_cmd(gdbserver_mode)
+        ]
+
     def target_ssh_gdbserver_kill_args(self):
         """Get the ssh command arguments to kill gdbserver on the target device
 
@@ -31,7 +43,7 @@ class GdbCrossConfigVSCode(GdbCrossConfig):
         ]
 
     def initialize(self):
-        self._gen_gdbserver_start_script()
+        pass
 
 
 class IdeVSCode(IdeBase):
@@ -322,7 +334,8 @@ class IdeVSCode(IdeBase):
                     "label": gdb_cross_config.id_pretty_mode(gdbserver_mode),
                     "type": "shell",
                     "isBackground": True,
-                    "command": gdb_cross_config.gdbserver_script(gdbserver_mode),
+                    "command": gdb_cross_config.gdb_cross.target_device.ssh_sshexec,
+                    "args": gdb_cross_config.target_ssh_gdbserver_start_args(gdbserver_mode),
                     "problemMatcher": [
                         {
                             "pattern": [
@@ -466,7 +479,8 @@ class IdeVSCode(IdeBase):
                         "label": gdb_cross_config.id_pretty(gdbserver_mode),
                         "type": "shell",
                         "isBackground": True,
-                        "command": gdb_cross_config.gdbserver_script(gdbserver_mode),
+                        "command": gdb_cross_config.gdb_cross.target_device.ssh_sshexec,
+                        "args": gdb_cross_config.target_ssh_gdbserver_start_args(gdbserver_mode),
                         "problemMatcher": [
                             {
                                 "pattern": [
-- 
2.52.0


