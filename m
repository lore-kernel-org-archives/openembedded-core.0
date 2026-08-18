Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DB4C5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 06:31:44 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3145.1787034701837570118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 23:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Bfry60wG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202608180631398770fc4169000207df-tdiezw@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202608180631398770fc4169000207df
        for <openembedded-core@lists.openembedded.org>;
        Tue, 18 Aug 2026 08:31:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QW3KRaFj9rp9zsOiIYwZFBHMfJ+1Fz1xy7506IUrunI=;
 b=Bfry60wGxIAwb/i6P/5FlIUtITTVJ3kyW2+DwuCBaWeceHFfHEZQ5LXw8/t22TUI2tWNUP
 3pSUqEXLL1JEvja9Xk9cA4M072vBqUVQ1j6Zz4MlFeouJoY3H/Hv13+vn3f/bE4o3Rr83YDX
 nrphgbLhSNqcNknawPZ4Kc/ixLoFmJGKcMzD/gd7qwhE8xpuOjxLLWMbY8sp2a1ZGTOhfO4/
 f1I8HbEz3cib786xVihDrPaess1XqNSwHmJK0kaibRIyUt4m+2kgUcOuIIB/cA3Meiznyfpv
 6Lmwma3tJ16WmefzFP4aJ7mjqBTrqNGsG/NumtMLV2UJPk6CMw+Zmaxw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 09/14] oe-selftest: devtool ide-sdk: support $ in gdbserver task command
Date: Tue, 18 Aug 2026 08:30:48 +0200
Message-ID: <20260818063120.73042-10-adrian.freihofer@siemens.com>
In-Reply-To: <20260818063120.73042-1-adrian.freihofer@siemens.com>
References: <20260818063120.73042-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 06:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243663

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a preparation commit for the next commit that will add a new a
variable to the tasks.json file to support gdbserver commands.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 051be713b0..0791422461 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3576,10 +3576,11 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
         # Start gdbserver on target using the task command (keep the ssh connection open while debugging)
         ssh_gdbserver_cmd = [task_command] + task_args
-        # Fix shell command escaping - remove extra quotes from the last argument
-        # The task_args likely contains a quoted shell command that needs to be unquoted
+        # The tasks.json argument is formatted for an intermediate shell. Strip
+        # its quotes and restore dollar expansions before passing it directly to
+        # SSH via subprocess.
         if len(ssh_gdbserver_cmd) > 0 and ssh_gdbserver_cmd[-1].startswith('"') and ssh_gdbserver_cmd[-1].endswith('"'):
-            ssh_gdbserver_cmd[-1] = ssh_gdbserver_cmd[-1][1:-1]  # Remove surrounding quotes
+            ssh_gdbserver_cmd[-1] = ssh_gdbserver_cmd[-1][1:-1].replace('\\$', '$')  # Remove surrounding quotes
         self.logger.debug(f"Starting gdbserver with command: {' '.join(ssh_gdbserver_cmd)}")
         with RunCmdBackground(ssh_gdbserver_cmd, output_log=self._cmd_logger):
             # Give gdbserver a moment to start
-- 
2.55.0


