Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0041BC71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 20:34:28 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.2705.1751920465548613608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 13:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=eaU91Qbo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2025070720342159d5f93cacd8ad04aa-nguec7@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025070720342159d5f93cacd8ad04aa
        for <openembedded-core@lists.openembedded.org>;
        Mon, 07 Jul 2025 22:34:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=facrFjWHvfjgp2elwsDRlOhYMPZy/Pp0cDYIC4USSeE=;
 b=eaU91Qboei9eA4/4GpaKjz160ZHsgSC7xk0xm5K0RRgheLOJCLb4QShmHqKanBRO0TWkrq
 RCRR1WkQPXdgB6aDIENOHkSHgOxtmtH0/sxDH0HH2gAKweO+XA1N7HpL7QipObIK32kCm7zB
 ZHMvmE8JWzt8trqU7hooMt1Lz7/y8KaD4dDR4iNytbI04O3GeYdkJO5SSDKHxBx3XxY0ZEs6
 2o4QVSHbQEr99BqC8Sg0BI42GwkR73zIw5AkN5YNI3RzNLl4EJxDV/oXQDe8rjsZPZGFzPO6
 YUP9ZFkBxWQb8gWYCmO9FAuPT0ztgPCUUKEs7xCZrb7GToZKR8sui5tA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] oe-selftest: devtool: split tap detection into function
Date: Mon,  7 Jul 2025 22:34:18 +0200
Message-ID: <20250707203418.2553168-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 20:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219998

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Make the check for tap devices available as a function which can be used
by other tests as well.

Remove /etc/runqemu-nosudo check for tap device detection.
The /etc/runqemu-nosudo file is a state file created by the
runqemu-gen-tapdevs script. Tap device detection now relies only on the
presence of tap interfaces, making the check more robust and not
dependent on the runqemu-gen-tapdevs script, which is just one way of
creating the tap interfaces.

Simplify the code by removing the fallback to ifconfig if the ip command
is not available. ip commands are nowadays available on all host
machines. The transition from ifconfig to ip has taken place long time
ago e.g. for the runqemu-gen-tapdevs script.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 14 ++------------
 meta/lib/oeqa/utils/commands.py         | 10 ++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 05f228f03e7..91b086fba95 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -16,7 +16,7 @@ import json
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
-from oeqa.utils.commands import get_bb_vars, runqemu, get_test_layer
+from oeqa.utils.commands import get_bb_vars, runqemu, runqemu_check_taps, get_test_layer
 from oeqa.core.decorator import OETestTag
 
 oldmetapath = None
@@ -277,18 +277,8 @@ class DevtoolTestCase(OESelftestTestCase):
         machine = get_bb_var('MACHINE')
         if not machine.startswith('qemu'):
             self.skipTest('This test only works with qemu machines')
-        if not os.path.exists('/etc/runqemu-nosudo'):
+        if not runqemu_check_taps():
             self.skipTest('You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
-        result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
-        if result.status != 0:
-            result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=True)
-            if result.status != 0:
-                self.skipTest('Failed to determine if tap devices exist with ifconfig or ip: %s' % result.output)
-        for line in result.output.splitlines():
-            if line.startswith('tap'):
-                break
-        else:
-            self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
 
     def _test_devtool_add_git_url(self, git_url, version, pn, resulting_src_uri, srcrev=None):
         self.track_for_cleanup(self.workspacedir)
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index b60a6e6c389..5eaedd2fd96 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -401,6 +401,16 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
         targetlogger.removeHandler(handler)
         qemu.stop()
 
+def runqemu_check_taps():
+    """Check if tap devices for runqemu are available"""
+    result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
+    if result.status != 0:
+        return False
+    for line in result.output.splitlines():
+        if line.startswith('tap'):
+            return True
+    return False
+
 def updateEnv(env_file):
     """
     Source a file and update environment.
-- 
2.50.0


