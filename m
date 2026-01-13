Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9041ED29DF0
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 08:55:00 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54824.1768294494964992175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 00:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bbOOW0+H;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260113085451a11abc17d800020785-qqqbtd@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260113085451a11abc17d800020785
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 Jan 2026 09:54:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZfGxlHMdhnUIhob79im9MeTDQkfSMtIWJiSud7qm8Ss=;
 b=bbOOW0+H4BW/7Q7l1BlAbayLgVNg0CWOmGtyjtrgw+RvgW7Kh0ZmzKFCMxXb0t1MprzdWm
 yWLienv8ICGAK2hmAXLbu+ybyvydr4ZJRmTqRoghynNitrwlGD+/2eCO7z5Ed//6N+8JaYhg
 NTyxgiqC5yYXIoGBp1tPXuQEe6mHHynoAS21zhPTBXMjmChcOGZyhat59MmyRW4t5yxsIylH
 VEYasvaP2oo31c0btj/yXiQQs8R+VHTBqlZXM1w2+tUby8un+glO/zlOia6Pr7v//y2bDK2+
 pY/FSlQVnxZY5qJJCJ5fMDD/5+8I1QGV3xNt3fyEKBpZbE9U7+mop+Tg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] oeqa-runtime: fix run_network_serialdebug
Date: Tue, 13 Jan 2026 09:54:43 +0100
Message-Id: <20260113085444.15243-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 08:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229233

From: Peter Marko <peter.marko@siemens.com>

This is a global function and thus does not have self object.
Executing it leads to "NameError: name 'self' is not defined".

Change it to take parent object which contains all data which is needed
to execute it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/runtime/case.py       | 14 +++++++-------
 meta/lib/oeqa/runtime/cases/ping.py |  2 +-
 meta/lib/oeqa/runtime/cases/ssh.py  |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
index 2a47771a3d..095bcf434a 100644
--- a/meta/lib/oeqa/runtime/case.py
+++ b/meta/lib/oeqa/runtime/case.py
@@ -22,15 +22,15 @@ class OERuntimeTestCase(OETestCase):
         super(OERuntimeTestCase, self).tearDown()
         uninstall_package(self)
 
-def run_network_serialdebug(runner):
-    if not runner:
+def run_network_serialdebug(target):
+    if not target.runner:
         return
-    status, output = runner.run_serial("ip addr")
+    status, output = target.runner.run_serial("ip addr")
     print("ip addr on target: %s %s" % (output, status))
-    status, output = runner.run_serial("ping -c 1 %s" % self.target.server_ip)
-    print("ping on target for %s: %s %s" % (self.target.server_ip, output, status))
-    status, output = runner.run_serial("ping -c 1 %s" % self.target.ip)
-    print("ping on target for %s: %s %s" % (self.target.ip, output, status))
+    status, output = target.runner.run_serial("ping -c 1 %s" % target.server_ip)
+    print("ping on target for %s: %s %s" % (target.server_ip, output, status))
+    status, output = target.runner.run_serial("ping -c 1 %s" % target.ip)
+    print("ping on target for %s: %s %s" % (target.ip, output, status))
     # Have to use a full path for netstat which isn't in HOSTTOOLS
     subprocess.call(["/usr/bin/netstat", "-tunape"])
     subprocess.call(["/usr/bin/netstat", "-ei"])
diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index efb91d4cc9..baea1b385b 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -36,7 +36,7 @@ class PingTest(OERuntimeTestCase):
                     count = 0
                     sleep(1)
         except OEQATimeoutError:
-            run_network_serialdebug(self.target.runner)
+            run_network_serialdebug(self.target)
             self.fail("Ping timeout error for address %s, count %s, output: %s" % (self.target.ip, count, output))
         msg = ('Expected 5 consecutive, got %d.\n'
                'ping output is:\n%s' % (count,output))
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 3e9503277e..5fa4bb98b5 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -32,7 +32,7 @@ class SSHTest(OERuntimeTestCase):
               time.sleep(5)
               continue
           else:
-              run_network_serialdebug(self.target.runner)
+              run_network_serialdebug(self.target)
               self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
         if status != 0:
             self.fail("ssh failed with \"%s\" (exit code %s)" % (output, status))

