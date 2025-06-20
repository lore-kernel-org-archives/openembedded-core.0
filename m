Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF2AC7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 08:08:55 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.2772.1750406929173322719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 01:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=JqlzkasG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20250620080845ce2bd9ca462726ebe3-br5bbb@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250620080845ce2bd9ca462726ebe3
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Jun 2025 10:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Z+AsWPEjp0Gv6T7owRDH5KOOSiiEztANe7dTdqascfI=;
 b=JqlzkasGSzAjzyxhfHsiJ5jZWx81xcum8KOwG4aP8y7dKoiBE6VfOEJtzjXzCFgwlgHbWS
 4xNxd3N47VOaG6NGa2qWxxXv+Oa+UGX8Gh9Foj1q+YiiyHthUnmI/cVBCwoR5PGPbuoC9QsS
 iQKU/mAJVnVwVvCXnGbVtK8DBfjSW6oPCi6G0TJ3fvtoHzRj6uqEVdGbhSM6/T8MgAAA1iLd
 EEitkk1DKlnCcaXC9jfWWXAMYSBH8wgzPMn5LFKqtU2uU9uxwB23W49B7L1+AV+KVcPnxgQa
 Y2yMztA89ebx5FTUhANO//4C7kfMIOGIwoqDNep26eycZuU/1LRHjp/A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/5] oe-selftest: devtool: split tap detection into function
Date: Fri, 20 Jun 2025 10:08:21 +0200
Message-ID: <20250620080840.562802-5-adrian.freihofer@siemens.com>
In-Reply-To: <20250620080840.562802-1-adrian.freihofer@siemens.com>
References: <20250620080840.562802-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 08:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219109

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Make the check for tap devices available as a function which can be used
by other tests as well.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 14 ++------------
 meta/lib/oeqa/utils/commands.py         | 12 ++++++++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0155ee62ee0..6ba77e2f9bf 100644
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
index 2a47f90e327..8cb4a9be6d3 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -388,6 +388,18 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
         targetlogger.removeHandler(handler)
         qemu.stop()
 
+def runqemu_check_taps():
+    """Check if tap devices for runqemu are available"""
+    if not os.path.exists('/etc/runqemu-nosudo'):
+        return False
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
2.49.0


