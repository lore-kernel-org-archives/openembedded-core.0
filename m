Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D24AC5DF7B
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:41:43 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15977.1786909295040164791
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Ly/sRf3H;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260816194132b64e017e93000207b7-a_fxt5@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260816194132b64e017e93000207b7
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 21:41:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=iDONU+fNaAd4nStove8yOZy6wS8SM8EMAO0zfmeDkCs=;
 b=Ly/sRf3H+hKydq0lJNab8ygpcRDhRQjxDxqaot8uSKAhe9BNpxBgpVbUmQ0IyvZ0Wb5CBW
 A32BEmsdI3XLp2JW+UkWy6NXGiewP/FSXRwnN2NwMPY8//xfAap70tx3Kd+snHWbQIcg2lQg
 SNuhp5yxaPt4QShSOaBfnPVXiYZsiDUNvtkltGf1juvL/MmBw9q9k44hugOf/F218XKUyswk
 /aZwsnK008gnw17jr65wNF06I0pkJWFbscby4AIrFGGKXM4dWw5P9eMGOySlTTyPvkF96Hge
 TXpWES2VCCLq0fsmrbiZ7q5b8J/BRNbxz0lpTFZOn8N78njwP4CLKtxw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 09/14] oe-selftest: devtool ide-sdk: support $ in gdbserver task command
Date: Sun, 16 Aug 2026 21:40:52 +0200
Message-ID: <20260816194127.86607-10-adrian.freihofer@siemens.com>
In-Reply-To: <20260816194127.86607-1-adrian.freihofer@siemens.com>
References: <20260816194127.86607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 19:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243554

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a preparation commit for the next commit that will add a new a
variable to the tasks.json file to support gdbserver commands.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 1be727d96f..b38011eac1 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3518,10 +3518,11 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
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


