Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F80C64ED6
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 08:10:00 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.9263.1675930193276590446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 00:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pQ207-00B9tx-Er; Thu, 09 Feb 2023 10:09:51 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pQ207-000cnI-5W; Thu, 09 Feb 2023 10:09:51 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 5/8] oeqa qemurunner: read more data at a time from serial
Date: Thu,  9 Feb 2023 10:09:33 +0200
Message-Id: <20230209080936.148489-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230209080936.148489-1-mikko.rapeli@linaro.org>
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230209080936.148489-6-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 08:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176924

Use a short sleep to bundle serial console reads so that
we are not reading one character at a time which reduces busy
looping.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 8b893601d4..2e054447fc 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -202,7 +202,7 @@ class QemuRunner:
         qmp_file = "." + next(tempfile._get_candidate_names())
         qmp_param = ' -S -qmp unix:./%s,server,wait' % (qmp_file)
         qmp_port = self.tmpdir + "/" + qmp_file
-        # Create a second socket connection for debugging use, 
+        # Create a second socket connection for debugging use,
         # note this will NOT cause qemu to block waiting for the connection
         qmp_file2 = "." + next(tempfile._get_candidate_names())
         qmp_param += ' -qmp unix:./%s,server,nowait' % (qmp_file2)
@@ -468,6 +468,8 @@ class QemuRunner:
                     socklist.remove(self.server_socket)
                     self.logger.debug("Connection from %s:%s" % addr)
                 else:
+                    # try to avoid reading only a single character at a time
+                    time.sleep(0.1)
                     data = data + sock.recv(1024)
                     if data:
                         bootlog += data
-- 
2.34.1


