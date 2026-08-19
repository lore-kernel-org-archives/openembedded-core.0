Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE91CC5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:01:52 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1132.1787176907030115728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=GwEDg/NN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260819220143a61fcf37b8000207f5-nabovq@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260819220143a61fcf37b8000207f5
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 00:01:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0LME96prFOIM/uXU+8jGo4MT5gpK2xxLXqqh7BMRT2Y=;
 b=GwEDg/NNPoWJn4zaAL+AxLXPCjWhTKP+mdmAYBGW834ZxPU2j9meBGtpru6h7VjxJXXB3P
 5TfE9dwjCnkpZos1U7OgkDaQ5HlFOzbq2lDnPLiWoGTdMwgwNjhCQc+/QiW2f7Gi5bX3Empe
 7k0ogrLd05F0tksCNos7bc4mYVueyz1srdu6/Ls7DZvIBfb7OuEn8rodqZRdNQ5Lw+TklzAN
 NPTNTyLjbKCUQMWw5875uOt+7Cw1/X5MEp8/9Y2lzdIdjVwcPL540qiPjKjD6dpjb5qLe1F4
 GIjE+PEnsTIATRAdNn5cgNCIydyUpdfRFg+srnCb4mr/IPxHDErCNJYg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 02/14] oe-selftest: devtool deploy: use QEMU target commands
Date: Thu, 20 Aug 2026 00:00:09 +0200
Message-ID: <20260819220138.4095398-3-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243790

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Use the QEMU target API for target-side verification in devtool deploy
selftests instead of invoking SSH directly. Copy the generated file list
through the target API before comparing deployed file metadata.

There are more such instances in the devtool ide-sdk selftests that
could be converted to use the QEMU target API, but this will be done by
follow-up patches with more changes than just this refactoring.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index df0910aaa6..b0c7835134 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2070,8 +2070,8 @@ class DevtoolDeployTargetTests(DevtoolBase):
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
@@ -2090,15 +2090,21 @@ class DevtoolDeployTargetTests(DevtoolBase):
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
 
-- 
2.55.0


