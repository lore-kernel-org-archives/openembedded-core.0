Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92524C5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:01:53 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1135.1787176907030647504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=G30CVyxo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260819220144190cce97710002077a-yfn2qk@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260819220144190cce97710002077a
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 00:01:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QW3KRaFj9rp9zsOiIYwZFBHMfJ+1Fz1xy7506IUrunI=;
 b=G30CVyxoFRfXUWn0k96Frs86ZjyhMui2oAdUIHsxNR1Fm+PZs8FFp4y6I859ZHdpMtXc0/
 TKbYfgc11LYOEpTiH4ut079NVtHvygFgg+tK+x6W5YUrLtbpUXhTXVabrP/zQVfDazapMztw
 UGmEfNTmMFh0Jea273QNscYiwRuxizbR7pf3hch5K9Z0zZgwsFUAZc+JPnt0l3Kab9XKaipl
 zvNCzCyij8ReuXnT3u7s+DIn1dM77pFQgutrRvtXxPTenQI4sCp3Sye4xnTO+2ZBX8f8qQN+
 gBN8G4RR+2WByXF4XGaHiWKyB18RyhG5g0F84DCaaZX7pR4QaU1sW6Mw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 08/14] oe-selftest: devtool ide-sdk: support $ in gdbserver task command
Date: Thu, 20 Aug 2026 00:00:15 +0200
Message-ID: <20260819220138.4095398-9-adrian.freihofer@siemens.com>
In-Reply-To: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
References: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 22:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243791

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


