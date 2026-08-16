Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB72C5DF82
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:41:44 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15971.1786909295039375783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=fVwU6fPj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2026081619413266a8a89c810002072d-n2_urm@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026081619413266a8a89c810002072d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 21:41:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=K565r/Jj7jbdfJ2FdeX9dSw/QECl1W/nkcvI4ZuS40s=;
 b=fVwU6fPjqiESlsWq73vEl4Rv74Rz7ythAXL5g1rYlQ9uXwjR3B+bczmiMFkjyHSBdIOCQ8
 QRqJ0YheFtF16VjwTfTlEce+G6z5ojndNwW6uPdsW/InalJqj7LKSjKMvOIgXvk0aBwXJfbs
 sJEVFV4vjx5UDXnw1gWKjYC0Up/BwSIuBPriGZfUBuCEhC0a8BdN9Pe4fQF0ycYxkHkNvSy2
 GU0AIf8eXdT/0xvafNNcHIHbM2L1iBNeZkpVp2UlZGsLxHMErVgJsEq/8XXu2yaSSxcYvPvh
 cd7v0whpjNe3a6mKgu9KEmnNoB7iyy4duP4DtNN/nm0u6njrFtHvJKFQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 02/14] oe-selftest: devtool deploy: use QEMU target commands
Date: Sun, 16 Aug 2026 21:40:45 +0200
Message-ID: <20260816194127.86607-3-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243547

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
index d84a18e8b6..77965e480c 100644
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
 
-- 
2.55.0


