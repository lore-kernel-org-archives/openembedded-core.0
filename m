Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76F367F0ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 08:43:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6C8h0U8029612
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 01:43:10 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 12 Jul 2019 01:42:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2019 16:55:27 +0800
Message-ID: <18019bd30557e8f39501481cdc1548b1c1dd7e30.1562921582.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1562921582.git.Qi.Chen@windriver.com>
References: <cover.1562921582.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] rpm.py: ensure no user process running before deleting user
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jul 2019 08:43:19 -0000
Content-Type: text/plain

In case of systemd, `su -c 'xxx' test1' via ssh will create
several processes owned by test1, e.g. /lib/system/systemd --user.

These processes are actually managed by user@UID.service
(e.g. user@1000.service). And such service is managed
automatically by systemd. In other words, it will be cleaned
up by systemd automatically.

So we need to wait for systemd to clean it up before trying to
use `userdel' to delete the user.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index d8cabd3..2b45d34 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -4,6 +4,7 @@
 
 import os
 import fnmatch
+import time
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
@@ -77,7 +78,21 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
             msg = 'status: %s. Cannot run rpm -qa: %s' % (status, output)
             self.assertEqual(status, 0, msg=msg)
 
+        def check_no_process_for_user(u):
+            _, output = self.target.run(self.tc.target_cmds['ps'])
+            if u + ' ' in output:
+                return False
+            else:
+                return True
+
         def unset_up_test_user(u):
+            # ensure no test1 process in running
+            timeout = time.time() + 30
+            while time.time() < timeout:
+                if check_no_process_for_user(u):
+                    break
+                else:
+                    time.sleep(1)
             status, output = self.target.run('userdel -r %s' % u)
             msg = 'Failed to erase user: %s' % output
             self.assertTrue(status == 0, msg=msg)
-- 
1.9.1


