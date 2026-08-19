Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED08C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:01:52 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1130.1787176907559735133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=EQxdLxFw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260819220145af624df637000207a3-7eiooa@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260819220145af624df637000207a3
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 00:01:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=s7NA2PUceXl6nZkiPCFLJ+u+avZZRqT/F0XDf8cpH6g=;
 b=EQxdLxFw/J+xSoZfrn93wEsOx79+v/D4mPaEWsTBAR5+3Q9+yxwakpzzXdgoeHyhe0mz/1
 s0Lxc0PGk2osq1e5cUW3nprdm3LYRKOFj7ndyw8NRoLDyCeKrTwV9/V/SdC1ZIUOX9Ckwf0H
 qg1su3aVfoYvQnM6pMCmIvpivUUo3ZeAbjoXoy7S2tKIcganb44n2JkbU8ZLpQ+1/Dnn0WVE
 +wEYtUXLqL+xZWvYUX99/KIcFdiYTZ5Oa5+d35XS+qz9GlFYL7XGEXjiRHbSTvs/2+eQZ7TQ
 6R0D5YkMuBm+o12tV+iWk+ZpgV5KhkdvM55u9swdT+uzLJt2IoiWGGmg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 12/14] oe-selftest: devtool ide-sdk: use qemu.run for target checks
Date: Thu, 20 Aug 2026 00:00:19 +0200
Message-ID: <20260819220138.4095398-13-adrian.freihofer@siemens.com>
In-Reply-To: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
References: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 22:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243785

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
index 0f9ee471b3..53ddf28e57 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3640,13 +3640,10 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
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


