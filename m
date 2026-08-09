Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05B7C5AD55
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 09:36:49 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6564.1786268196863618279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 02:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Rr8GSOW8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202608090936340011cb2fea000207f9-vzszut@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202608090936340011cb2fea000207f9
        for <openembedded-core@lists.openembedded.org>;
        Sun, 09 Aug 2026 11:36:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=gCz80k2B7e3TlVlYvGqb3t/4a1F1SvIHNfzJV+3kYPU=;
 b=Rr8GSOW8Ivw0E0tCQ0jHCLE9GJMyYuOC3QYMSjR6uC25FqWzugBKIukXr7ILfglQ3ERlKJ
 sE+gWVOp9EcahebSU6mlktAOS5SK0LbZy4TmupBuBe5v4C0ebYWra3Q/WwsflNQzdSMbCiLG
 FziIkqwYukZ5ezZ00v7QCgw0vweJXYGtV1w5H8/ZcyCL7hQ74fjomPWvFVewqv3EqKOvsUtx
 RF0HXLe/qbjSNgQWa5/IvYHp7l7axjrC8J7/ASSnXa0iyCSyE2F2tRaIoQ2KB/QzEkAiLDsC
 lDocfk5onkUb98PXU7M/qCoHqgrwihqi950KhYY1aJoU3cH+omWDI6GA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 7/8] oe-selftest: devtool: use QEMU target commands
Date: Sun,  9 Aug 2026 11:35:58 +0200
Message-ID: <20260809093629.3457107-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
References: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 09:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243068

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Use the QEMU target API for target-side verification in devtool selftests
instead of invoking SSH directly. Copy the generated file list through
the target API before comparing deployed file metadata.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 29 ++++++++++++++-----------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index df77c628bb..06be7ef2df 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2012,8 +2012,8 @@ class DevtoolDeployTargetTests(DevtoolBase):
                 self.logger.debug(deploy_cmd)
                 result = runCmd(deploy_cmd)
                 # Run a test command to see if it was installed properly
-                sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-                result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
+                status, _ = qemu.run(testcommand)
+                self.assertEqual(status, 0)
                 # Check if it deployed all of the files with the right ownership/perms
                 # First look on the host - need to do this under pseudo to get the correct ownership/perms
                 bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD', 'PATH'], testrecipe)
@@ -2032,15 +2032,21 @@ class DevtoolDeployTargetTests(DevtoolBase):
                     for line in filelist1:
                         splitline = line.split()
                         f.write(splitline[-1] + '\n')
-                result = runCmd('cat %s | ssh -q %s root@%s \'xargs ls -l\'' % (tmpfilelist, sshargs, qemu.ip))
-                filelist2 = self._process_ls_output(result.output)
+                remotefilelist = '/tmp/%s' % os.path.basename(tmpfilelist)
+                status, _ = qemu.copy_to(tmpfilelist, remotefilelist)
+                self.assertEqual(status, 0)
+                status, output = qemu.run(
+                    'xargs ls -l < %s; status=$?; rm -f %s; exit $status' % (
+                        remotefilelist, remotefilelist))
+                self.assertEqual(status, 0)
+                filelist2 = self._process_ls_output(output)
                 filelist1.sort(key=lambda item: item.split()[-1])
                 filelist2.sort(key=lambda item: item.split()[-1])
                 self.assertEqual(filelist1, filelist2)
                 # Test undeploy-target
                 result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
-                result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
-                self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
+                status, _ = qemu.run(testcommand)
+                self.assertNotEqual(status, 0, 'undeploy-target did not remove command as it should have')
 
 class DevtoolBuildImageTests(DevtoolBase):
 
@@ -3510,13 +3516,10 @@ class DevtoolIdeSdkTests(DevtoolBase):
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


