Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A3EA177E96
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 13:59:16 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v67DxErS002877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Jul 2017 14:59:16 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dTTms-0007SS-V2; Fri, 07 Jul 2017 14:59:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jul 2017 14:59:13 +0100
Message-Id: <1499435953-28630-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 07 Jul 2017 14:59:16 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] oeqa/tinfoil: Improve test_wait_event for race issues
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
X-List-Received-Date: Fri, 07 Jul 2017 13:59:17 -0000

The test could break in a variety of ways:

a) If BB_HEARTBEAT_EVENT was less than ~0.25 it would hang indefinitely
b) The mask is set after draining the event queue meaning a heartbeat event
   could have happened
c) The test exits once it sees the events it wants, it doesn't check for
   spurious events such as heartbeats which shouldn't have occured.
d) The hardcoded delay of 0.25 is nasty and shouldn't be needed.

I found a bitbake bug and fixed that meaning we don't need the delay any
more which fixes d). That means a) is no longer an issue either.

We now set the mask, then drain the queue meaning no spurious events should
be able to sneak in. The test is also tweaked to wait for 5s in total to
ensure spurious events don't occur such as heartbeat events we shouldn't see.

[YOCTO #11045]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 3a58761..aa1af7e 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -1,5 +1,6 @@
 import os
 import re
+import time
 import bb.tinfoil
 
 from oeqa.selftest.case import OESelftestTestCase
@@ -102,21 +103,26 @@ class TinfoilTests(OESelftestTestCase):
     def test_wait_event(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=True)
-            # Need to drain events otherwise events that will be masked will still be in the queue
-            while tinfoil.wait_event(0.25):
-                pass
+
             tinfoil.set_event_mask(['bb.event.FilesMatchingFound', 'bb.command.CommandCompleted'])
+
+            # Need to drain events otherwise events that were masked may still be in the queue
+            while tinfoil.wait_event():
+                pass
+
             pattern = 'conf'
             res = tinfoil.run_command('findFilesMatchingInDir', pattern, 'conf/machine')
             self.assertTrue(res)
 
             eventreceived = False
-            waitcount = 5
-            while waitcount > 0:
+            commandcomplete = False
+            start = time.time()
+            # Wait for 5s in total so we'd detect spurious heartbeat events for example
+            while time.time() - start < 5:
                 event = tinfoil.wait_event(1)
                 if event:
                     if isinstance(event, bb.command.CommandCompleted):
-                        break
+                        commandcomplete = True
                     elif isinstance(event, bb.event.FilesMatchingFound):
                         self.assertEqual(pattern, event._pattern)
                         self.assertIn('qemuarm.conf', event._matches)
@@ -124,9 +130,7 @@ class TinfoilTests(OESelftestTestCase):
                     else:
                         self.fail('Unexpected event: %s' % event)
 
-                waitcount = waitcount - 1
-
-            self.assertNotEqual(waitcount, 0, 'Timed out waiting for CommandCompleted event from bitbake server')
+            self.assertTrue(commandcomplete, 'Timed out waiting for CommandCompleted event from bitbake server')
             self.assertTrue(eventreceived, 'Did not receive FilesMatchingFound event from bitbake server')
 
     @OETestID(1576)
-- 
2.7.4


