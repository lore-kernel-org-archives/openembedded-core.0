Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1E6C83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 13:07:16 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.35881.1752325629084483394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 06:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Vj7qOw6R;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202507121307042f02dc128a3f1ba29a-vglvpd@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202507121307042f02dc128a3f1ba29a
        for <openembedded-core@lists.openembedded.org>;
        Sat, 12 Jul 2025 15:07:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=oIKexPkAAo9A/srxC6njSA/X+sZJk2FmAlp5aYPjX5Q=;
 b=Vj7qOw6ROnDk8Y27EO2XqhidWmqzD2pqfkWHqRkiO/JUsAfoaNvKMjmB3YkpLnmEI0DVx/
 VCiYXRr7C6aQEDWHK3/mGtSZPI62PRd7QAh/bFBRLhuQ4RAEkcfYHuSz4RWWStGfjsfrNEE9
 Xhu1OE6obk5VepwXJIomxIZdB6b40MBTK4X1m12/hXi7yIpLTENMPCOp4xUqO+Z929BEWoKx
 AyQqNqexCyf67VN08657IP3WYOcoojKQa+I+neOgpW9Iqv1bJpQNm8tZwRzLRMUPk9NnU8nq
 JR0ICTYsURpkxesY6A67mxnuzPX1hk53uewJowmcR9sQdrL5SxlXW6Pg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] oe-selftest: devtool deploy-target test --strip option
Date: Sat, 12 Jul 2025 15:06:36 +0200
Message-ID: <20250712130650.3406826-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250712130650.3406826-1-adrian.freihofer@siemens.com>
References: <20250712130650.3406826-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 13:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220189

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extend the devtool deploy-target test to test with and without the
--strip option. The --strip code path recently broke unnoticed because
of changes in pseudo.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 61 +++++++++++++------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 91b086fba95..32805da036e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1829,36 +1829,39 @@ class DevtoolDeployTargetTests(DevtoolBase):
         # Boot the image
         with runqemu(testimage) as qemu:
             # Now really test deploy-target
-            result = runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, qemu.ip))
-            # Run a test command to see if it was installed properly
-            sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-            result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
-            # Check if it deployed all of the files with the right ownership/perms
-            # First look on the host - need to do this under pseudo to get the correct ownership/perms
-            bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD'], testrecipe)
-            installdir = bb_vars['D']
-            fakerootenv = bb_vars['FAKEROOTENV']
-            fakerootcmd = bb_vars['FAKEROOTCMD']
-            result = runCmd('%s %s find . -type f -exec ls -l {} \\;' % (fakerootenv, fakerootcmd), cwd=installdir)
-            filelist1 = self._process_ls_output(result.output)
+            for extra_opt in ['', '--strip']:
+                deploy_cmd= 'devtool deploy-target -c %s root@%s %s' % (testrecipe, qemu.ip, extra_opt)
+                self.logger.debug(deploy_cmd)
+                result = runCmd(deploy_cmd)
+                # Run a test command to see if it was installed properly
+                sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+                result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
+                # Check if it deployed all of the files with the right ownership/perms
+                # First look on the host - need to do this under pseudo to get the correct ownership/perms
+                bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD'], testrecipe)
+                installdir = bb_vars['D']
+                fakerootenv = bb_vars['FAKEROOTENV']
+                fakerootcmd = bb_vars['FAKEROOTCMD']
+                result = runCmd('%s %s find . -type f -exec ls -l {} \\;' % (fakerootenv, fakerootcmd), cwd=installdir)
+                filelist1 = self._process_ls_output(result.output)
 
-            # Now look on the target
-            tempdir2 = tempfile.mkdtemp(prefix='devtoolqa')
-            self.track_for_cleanup(tempdir2)
-            tmpfilelist = os.path.join(tempdir2, 'files.txt')
-            with open(tmpfilelist, 'w') as f:
-                for line in filelist1:
-                    splitline = line.split()
-                    f.write(splitline[-1] + '\n')
-            result = runCmd('cat %s | ssh -q %s root@%s \'xargs ls -l\'' % (tmpfilelist, sshargs, qemu.ip))
-            filelist2 = self._process_ls_output(result.output)
-            filelist1.sort(key=lambda item: item.split()[-1])
-            filelist2.sort(key=lambda item: item.split()[-1])
-            self.assertEqual(filelist1, filelist2)
-            # Test undeploy-target
-            result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
-            result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
-            self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
+                # Now look on the target
+                tempdir2 = tempfile.mkdtemp(prefix='devtoolqa')
+                self.track_for_cleanup(tempdir2)
+                tmpfilelist = os.path.join(tempdir2, 'files.txt')
+                with open(tmpfilelist, 'w') as f:
+                    for line in filelist1:
+                        splitline = line.split()
+                        f.write(splitline[-1] + '\n')
+                result = runCmd('cat %s | ssh -q %s root@%s \'xargs ls -l\'' % (tmpfilelist, sshargs, qemu.ip))
+                filelist2 = self._process_ls_output(result.output)
+                filelist1.sort(key=lambda item: item.split()[-1])
+                filelist2.sort(key=lambda item: item.split()[-1])
+                self.assertEqual(filelist1, filelist2)
+                # Test undeploy-target
+                result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
+                result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
+                self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
 
 class DevtoolBuildImageTests(DevtoolBase):
 
-- 
2.49.0


