Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A524C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 09:08:47 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.125606.1680685723075983108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 02:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pjz8B-009m99-KK; Wed, 05 Apr 2023 12:08:40 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pjz8B-00DIM6-Bo; Wed, 05 Apr 2023 12:08:39 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] oeqa ping.py: avoid busylooping failing ping command
Date: Wed,  5 Apr 2023 12:08:31 +0300
Message-Id: <20230405090831.3166534-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230405090831.3166534-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 09:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179728

Use a sleep on error path before trying again. For example
when oeqa runtime tests are executed without setting target
IP address correctly, the tests are drowning logs with messages:

2023-04-04 07:19:24,985 - runtime - INFO - test_ping (ping.PingTest.test_ping)
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
...
2023-04-04 07:19:55,002 - runtime - INFO -  ... FAIL
2023-04-04 07:19:55,002 - runtime - INFO - Traceback (most recent call
last):
  File \"/lava-62618/3/tests/3_oeqa-runtime-tests/image/lib/oeqa/runtime/cases/ping.py\", line 23, in test_ping
    output += proc.communicate()[0].decode('utf-8')
              ^^^^^^^^^^^^^^^^^^
  File \"/usr/lib/python3.11/subprocess.py\", line 1194, in communicate
    stdout = self.stdout.read()
             ^^^^^^^^^^^^^^^^^^
  File \"/lava-62618/3/tests/3_oeqa-runtime-tests/image/lib/oeqa/core/decorator/oetimeout.py\", line 18, in _timeoutHandler
    raise OEQATimeoutError(\"Timed out after %s \"
oeqa.core.exception.OEQATimeoutError: Timed out after 30 seconds of execution

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/runtime/cases/ping.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index 967b44175f..fcb72d4543 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -5,6 +5,7 @@
 #
 
 from subprocess import Popen, PIPE
+from time import sleep
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.oetimeout import OETimeout
@@ -25,6 +26,7 @@ class PingTest(OERuntimeTestCase):
                     count += 1
                 else:
                     count = 0
+                    sleep(1)
         except OEQATimeoutError:
             self.fail("Ping timeout error for address %s, count %s, output: %s" % (self.target.ip, count, output))
         msg = ('Expected 5 consecutive, got %d.\n'
-- 
2.34.1


