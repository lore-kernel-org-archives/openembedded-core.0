Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB38783B9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 10:27:20 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7EARJFg025634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 Aug 2017 11:27:20 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dhCad-0001Pb-Tt; Mon, 14 Aug 2017 11:27:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 11:27:17 +0100
Message-Id: <1502706437-5377-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502706437-5377-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1502706437-5377-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 14 Aug 2017 11:27:21 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/3] selftest/tinfoil: Filter LogRecords in test_event_wait
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
X-List-Received-Date: Mon, 14 Aug 2017 10:27:21 -0000

As the code stands today, an event mask does not mask LogRecord events
since the log levels are controlled separately. We therefore need to
accept (and ignore) LogRecord events in this test to avoid errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index aa1af7e..471517f 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -1,6 +1,7 @@
 import os
 import re
 import time
+import logging
 import bb.tinfoil
 
 from oeqa.selftest.case import OESelftestTestCase
@@ -127,6 +128,8 @@ class TinfoilTests(OESelftestTestCase):
                         self.assertEqual(pattern, event._pattern)
                         self.assertIn('qemuarm.conf', event._matches)
                         eventreceived = True
+                    elif isinstance(event, logging.LogRecord):
+                        continue
                     else:
                         self.fail('Unexpected event: %s' % event)
 
-- 
2.7.4


