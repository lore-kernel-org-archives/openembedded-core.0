Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A16C5DF80
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:41:44 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15978.1786909295040249752
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=VIyB+lTj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260816194133ca9ac35e2500020713-itmpmf@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260816194133ca9ac35e2500020713
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 21:41:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vLI9dq9b/VIpzoEP676wI0SilGyRypv7Zi6uiOOs9ns=;
 b=VIyB+lTjMb5LF59et8C17R1JqosH/XnlC40qPzhflRANxNa1bEehXE1M6Fp+bQr0aF5Pa/
 ZTb2cyKFYc9krCi54owPpxW30PMnFRe8968JeNApQWshl4HaZ5bZ8k2mnik6U9W8/OUpSth9
 XlSnzgAu/JWMU2TV6NPYhgfhMaovTBvhqh84Dz9GuPywCiJc1nEHT0wBR89tctLH4rM8ebZ0
 xwbpNKgkoPTwWtuOBVJuqVzYbKq3cJu+nYjONIzWvL3QW4n6l8JPGOsn2KfJbqUzRi5iLEMt
 Kikvr8kKuOa0LpzX5Y1L3F7sgh1nh7UV1Agw4Nq2n4jsbgBnR7Yc6IbA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 13/14] oe-selftest: devtool ide-sdk: use qemu.run for target checks
Date: Sun, 16 Aug 2026 21:40:56 +0200
Message-ID: <20260816194127.86607-14-adrian.freihofer@siemens.com>
In-Reply-To: <20260816194127.86607-1-adrian.freihofer@siemens.com>
References: <20260816194127.86607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 19:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243550

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
index a16c7a93f6..5301b6013e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3529,13 +3529,10 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
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


