Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C68C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:47 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.643.1789670320666797561
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 11:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=uPXY5LiC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2026091718383833499c2651000207c1-qw3ab3@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026091718383833499c2651000207c1
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Sep 2026 20:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=VP4NgDBWALOEON4xvldUfJqEPsCexCSkAAc58hB85Vk=;
 b=uPXY5LiCOnNdlQq/Uu/ljGrsG53nrgeqhS5lXxpHvpPWbFOlXA8DJA0719MmMs7TCkzjKd
 2Vo+2F9jyarEbguzPidsarDfBdqbprMkWRdUy5xAGOgZXDmuz2MTGZ2c69GdsxodF3jQDvqC
 ynXHXbqr244dCc29ywHogtFPeW4nFb126ZDDkvYeX4Z6PgskN/BU+dwXYGvdjs0F6Qz6bOxl
 LNADEOyA/1YuG5uclF2dGST7NF/Gcf9s+cNVZfp+ZdK1Jsx9Q2ISHaP/+KT5FA0jkJoXnIuV
 CQxhFrt8gm+Aiu2ODVM1VhOgqTvwSnAov9tKNV9fy1jwH4jaUu2IeqFQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 6/7] devtool: ide-sdk: honour --gdbserver-port-start for all debug servers
Date: Thu, 17 Sep 2026 20:37:58 +0200
Message-ID: <20260917183832.998361-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260917183832.998361-1-adrian.freihofer@siemens.com>
References: <20260917183832.998361-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 18:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246084

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The value was stored in RecipeGdbCross.gdbserver_port_next, which nothing
ever read. The ports actually handed out come from the class wide counter
DebuggerCrossConfig._port_next, which is shared by the gdbserver and
lldb-server configurations and always started at its hardcoded 1234, so
-G had no effect at all.

Seed that counter instead, which also makes the option a way to move all
debug servers of one invocation out of the way of another one running
concurrently on the same host.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index a987c37f06..e1a9d1774e 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -123,7 +123,6 @@ class RecipeGdbCross(RecipeNative):
         super().__init__('gdb-cross-' + target_arch, target_arch)
         self.target_device = target_device
         self.gdb = None
-        self.gdbserver_port_next = int(args.gdbserver_port_start)
         self.config_db = {}
 
     def __find_gdbserver(self, config, tinfoil):
@@ -1856,6 +1855,7 @@ def ide_setup(args, config, basepath, workspace):
         if args.mode == DevtoolIdeMode.modified:
             logger.info("Setting up workspaces for modified recipe: %s" %
                         str(recipes_modified_names))
+            DebuggerCrossConfig._port_next = int(args.gdbserver_port_start)
             debuggers = {}
             for recipe_name in recipes_modified_names:
                 recipe_modified = RecipeModified(
@@ -2049,7 +2049,9 @@ def register_commands(subparsers, context):
         '-t', '--target', default='root@192.168.7.2',
         help='Live target machine running an ssh server: user@hostname.')
     parser_ide_sdk.add_argument(
-        '-G', '--gdbserver-port-start', default="1234", help='port where gdbserver is listening.')
+        '-G', '--gdbserver-port-start', default="1234",
+        help='First port used by the debug servers on the target. Each debug '
+             'configuration consumes one port, counting up from here.')
     parser_ide_sdk.add_argument(
         '-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
     parser_ide_sdk.add_argument(
-- 
2.55.0


