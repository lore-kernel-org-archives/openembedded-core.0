Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C6EC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 07:12:31 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.10095.1668669150801153466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 23:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ovZ4W-007VEM-Ji; Thu, 17 Nov 2022 09:12:29 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ovZ4W-000S69-Ax; Thu, 17 Nov 2022 09:12:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] oeqa parselogs.py: use get_data() to fetch image specific error list
Date: Thu, 17 Nov 2022 09:12:23 +0200
Message-Id: <20221117071223.107064-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221117071223.107064-1-mikko.rapeli@linaro.org>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
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
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221117071223.107064-3-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 07:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173406

Runtime oeqa test parselogs.py checks dmesg output for errors. It has
hard coded machine specific exceptions for errors which can be ignored.
To re-use of this test on other machine targets and images, use
get_data() function to get the list of error strings to ignore
"ignore_errors" from image specific "testimage_data.json" file.
The json file stores this data as list under test method name and key
"ignore_errors. For example:

{"test_parselogs":{"ignore_errors":[
    "error strings which will be ignored",
    "another error strings which will be ignored"
]}}

If the json file does not exist, parselogs.py still falls back to using
the hardcoded defaults.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index e67d3750da..c1d92db5d6 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -12,6 +12,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.utils.data import get_data
 
 #in the future these lists could be moved outside of module
 errors = ["error", "cannot", "can\'t", "failed"]
@@ -316,10 +317,18 @@ class ParseLogsTest(OERuntimeTestCase):
         grepcmd += '" ' + str(log) + " | grep -Eiv \'"
 
         try:
-            errorlist = ignore_errors[self.getMachine()]
-        except KeyError:
-            self.msg += 'No ignore list found for this machine, using default\n'
-            errorlist = ignore_errors['default']
+            # get list of strings to ignore from image specific testimage_data.json with format:
+            # {"test_parselogs": {"ignore_errors":["string to ignore", "second string to ignore"]}}
+            errorlist = get_data(self, key = "ignore_errors")
+        except Exception as e:
+            self.logger.debug("%s: Exception e = %s" % (__file__, e))
+            try:
+                errorlist = ignore_errors[self.getMachine()]
+            except KeyError:
+                warning_string = 'No ignore list found for this machine and no valid testimage_data.json, using defaults'
+                self.msg += '%s\n' % (warning_string)
+                self.logger.warn("%s" % (warning_string))
+                errorlist = ignore_errors['default']
 
         for ignore_error in errorlist:
             ignore_error = ignore_error.replace('(', r'\(')
-- 
2.34.1


