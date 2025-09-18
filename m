Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60658CAC5B9
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:21 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.278.1758229694014882754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=uDkMSnSS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20250918210812bfe585d0da000207db-kzn0qn@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250918210812bfe585d0da000207db
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HBelkkWMbUBi7zqOClOQ9ZDDZItSMuOFlFfKEMWNOLs=;
 b=uDkMSnSSVnQWs8RISo/Do0pSJcNG35AUa69Zl3P9kQYm3kBwC/XV/PdAkxR8M5m2JFOFeE
 8cLVqPEd7eFr7jWigZEcP7coIw9pabLhy9PgdfPxKXV0hFQhIDVpE1uQN3z2j860usZlIt8G
 Fk8Zhls8V1MNKMhuWsYl+j4tC9M5YDmhq6g5JsQov16pLDNgGnSXTo8/KhfwHABvqOmVh7Au
 L0hXX5DIKbWvFzGKQ2htwMdLnU4nItTH9ON2VH54ch0iPWA3oGKI+1dM6dtyoHNcF5YnnQD8
 w16Rdp+HKv7APSc1E0H8iVi3JevzeAbPdZHfbxrOVyjgGtkKkHsuHHzA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 11/19] devtool: ide-sdk: vscode remove scripts
Date: Thu, 18 Sep 2025 23:07:13 +0200
Message-ID: <20250918210754.477049-12-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223667

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Write the ssh command to start gdbserver on target directly into the
tasks.json. This avoids the need to create one more script file on the
host. It also simplifies manual modifications of VSCode's standard
tasks.json which is much more handy than modifying multiple proprietary
scripts used to launch gdbserver.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 8306b7318bd..ef49ac71dc8 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -20,9 +20,20 @@ class GdbCrossConfigVSCode(GdbCrossConfig):
         super().__init__(image_recipe, modified_recipe, binary,
                          gdbserver_default_mode)
 
-    def initialize(self):
-        self._gen_gdbserver_start_script()
+    def target_ssh_gdbserver_start_args(self, gdbserver_mode=None):
+        """Get the ssh command arguments to start gdbserver on the target device
 
+        returns something like:
+          ['-p', '2222', 'root@target', '"/bin/sh -c \'/usr/bin/gdbserver --once :1234 /usr/bin/cmake-example\'"']
+        """
+        if gdbserver_mode is None:
+            gdbserver_mode = self.gdbserver_default_mode
+        return self._target_ssh_gdbserver_args() + [
+            self._target_gdbserver_start_cmd(gdbserver_mode)
+        ]
+
+    def initialize(self):
+        pass
 
 class IdeVSCode(IdeBase):
     """Manage IDE configurations for VSCode
@@ -306,7 +317,8 @@ class IdeVSCode(IdeBase):
                     "label": gdb_cross_config.id_pretty_mode(gdbserver_mode),
                     "type": "shell",
                     "isBackground": True,
-                    "command": gdb_cross_config.gdbserver_script(gdbserver_mode),
+                    "command": gdb_cross_config.gdb_cross.target_device.ssh_sshexec,
+                    "args": gdb_cross_config.target_ssh_gdbserver_start_args(gdbserver_mode),
                     "problemMatcher": [
                         {
                             "pattern": [
@@ -425,7 +437,8 @@ class IdeVSCode(IdeBase):
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
2.51.0


