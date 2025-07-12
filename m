Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB3EC83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 12:51:55 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.35633.1752324707269036300
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 05:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=cJ0lGCBq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20250712125145785536092602830a3d-x2jbb3@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250712125145785536092602830a3d
        for <openembedded-core@lists.openembedded.org>;
        Sat, 12 Jul 2025 14:51:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2dLKRk9QF+MexFM/is0WtweII/LC3CuGANDyjcPrQto=;
 b=cJ0lGCBqxmNjFDv6ZVR9Qkxf8AvXQDDKwGpyLiPHlg4HczJNb29rc/Fr0YkO0oLoDu3+gL
 AJydQjCNQAUORd/Lgb2wpVufI/OvP8Jziku9osOTJoMkmhFm+MDQuC++b731CwVpq+W/2vOR
 /JXddFjd0xnIV0CKdckJhI2TDpd7Au9Th1h55kguI6fN3mygo9e0srVNgaeBSXwq+GtHQ9lk
 TYMXzwvNNJ7BU4klihl4mlux7rI/3fUQP5vpSQBcdhFW11szqkSBq8LKRxWF7TWcJB0EyCQ5
 TfyYnaiC8Vnyka6P5qyeorppBzjtJ2SA86vNTywAQIAukPwXWN2jm6Yg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/2] oe-selftest: devtool: split tap detection into function
Date: Sat, 12 Jul 2025 14:50:42 +0200
Message-ID: <20250712125103.3404739-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250712125103.3404739-1-adrian.freihofer@siemens.com>
References: <20250712125103.3404739-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 12:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220177

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Make the check for tap devices available as a function which can be used
by other tests as well.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 14 ++------------
 meta/lib/oeqa/utils/commands.py         | 16 ++++++++++++++++
 2 files changed, 18 insertions(+), 12 deletions(-)

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
index b60a6e6c389..e049e1ee682 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -401,6 +401,22 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
         targetlogger.removeHandler(handler)
         qemu.stop()
 
+def runqemu_check_taps():
+    """Check if tap devices for runqemu are available"""
+    if not os.path.exists('/etc/runqemu-nosudo'):
+        return False
+    result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
+    if result.status != 0:
+        result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=True)
+        if result.status != 0:
+            return False
+    for line in result.output.splitlines():
+        if line.startswith('tap'):
+            break
+    else:
+        return False
+    return True
+
 def updateEnv(env_file):
     """
     Source a file and update environment.
-- 
2.49.0


