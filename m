Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBE1EE642E
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 11:47:51 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83931.1767181666334053972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 03:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=VetvnWZu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20251231114743afc2315d1200020790-3608tq@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251231114743afc2315d1200020790
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Dec 2025 12:47:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ytwbJK7YaFWEJvh6YC3Ry2SuqU/EV8WpuRR1qpAFcPA=;
 b=VetvnWZuTzzPSt20GtT+Ijrv02Jhx1HnIWnYyS8A/mRE/Yn7EkfTUsOrf9uGoN2C2MThS+
 DoAGldgU4Zu1sYhiBRHlW/h4rBF6U1MtowhsKP0NYFZXK9wq98sIOebJvhtRl4wNiphz9jh7
 84yzWTwYeQUg6fgugWPho1oNsPZuDUEThCvchMFMkGmY6VeQIFGEO3lBUpfoMow5Km+cUnkb
 XpZGBc3OkEKfovLPppWnMCAGc67A29IErxceqHl/C+H29ZxTn5yp/qe+MtMivrepWQO25BIB
 E2Y9VWWcYIoIvOAIzecx44lCKeS1tWUrfSr7dp4rgph6NNO1bFFJd5lw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 08/14] devtool: ide-sdk: vscode replace scripts
Date: Wed, 31 Dec 2025 12:46:38 +0100
Message-ID: <20251231114718.4031606-9-adrian.freihofer@siemens.com>
In-Reply-To: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
References: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228745

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


