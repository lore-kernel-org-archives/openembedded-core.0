Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25F2C5DF8F
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 06:31:44 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3327.1787034699017815985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 23:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=iCRFqYfY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2026081806314222fed1677f000207db-tnc3u6@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026081806314222fed1677f000207db
        for <openembedded-core@lists.openembedded.org>;
        Tue, 18 Aug 2026 08:31:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=u9wQBP+OXdbtkXle/jhnAZocO808uBTHSDuTBbEAOqA=;
 b=iCRFqYfYT9To0DYfJ9Dy7AGHEslcrZDrqvJiLPzY4Fw+tuqsE63tuhVzXK8DMK5Indfezv
 1/6bkv17TLZ3XCQ90SSjgLxYlMVJxYiudUqsXkQLMeaiMDTUWR3MYXARFChat7RAorAyfJpq
 ZW3rQoHWH4Wb2UyPfjH4gJC7oHu+wtCUurBmMD2qCv7JWOpTPKI0jD6AjYd6wiSSi/LZrpjx
 hAYvqCN0S2h8/dfmuchsRGvuqRzqFtiJjpAS0ZJCMDsxjtyULoCQ7zL71EOsZBBm56qLWtyn
 pN4kflKng9ayiCLCKb6D1ECADE9oaYZ6aZ3iBaNDPfaD5zYM3M2RPjCQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 13/14] oe-selftest: devtool ide-sdk: use qemu.run for target checks
Date: Tue, 18 Aug 2026 08:30:52 +0200
Message-ID: <20260818063120.73042-14-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243665

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Use QEMU target commands instead of spawning a separate ssh process for
simple target-side executable checks in the ide=code selftest helper.
This keeps the test consistent with the rest of the qemu-based cleanup
and avoids duplicating SSH option handling in the test itself.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3a99a493b5..ab846b8dc3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3593,13 +3593,10 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self.assertEqual(task_command, "ssh", f"Task '{prelaunch_task_name}' should use ssh command")
         self.assertTrue(len(task_args) >= 2, f"Task '{prelaunch_task_name}' should have at least 2 args (ssh options and remote command)")
 
-        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-        result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'test -x /usr/bin/gdbserver'),
-                        output_log=self._cmd_logger)
-        self.assertEqual(result.status, 0, "gdbserver should be installed on target")
-        result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'test -x ' + os.path.join('/usr/bin', example_exe)),
-                        output_log=self._cmd_logger)
-        self.assertEqual(result.status, 0, "Example binary should be installed on target")
+        status, _ = qemu.run('test -x /usr/bin/gdbserver')
+        self.assertEqual(status, 0, "gdbserver should be installed on target")
+        status, _ = qemu.run('test -x ' + os.path.join('/usr/bin', example_exe))
+        self.assertEqual(status, 0, "Example binary should be installed on target")
 
         # Start gdbserver on target using the task command (keep the ssh connection open while debugging)
         ssh_gdbserver_cmd = [task_command] + task_args
-- 
2.55.0


