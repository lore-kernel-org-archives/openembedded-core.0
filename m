Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1669C43219
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 07:12:31 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.10094.1668669150524070202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 23:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ovZ4V-007VE8-JU; Thu, 17 Nov 2022 09:12:27 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ovZ4V-000S3T-AX; Thu, 17 Nov 2022 09:12:27 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] oeqa: add utils/data.py with get_data() function
Date: Thu, 17 Nov 2022 09:12:22 +0200
Message-Id: <20221117071223.107064-2-mikko.rapeli@linaro.org>
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
 Message-ID: 20221117071223.107064-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 07:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173405

get_data() uses oeqa test method name and an optional
key to get data from image specific "testimage_data.json"
file located in image deploy directory. Image recipes can
provide custom versions of this file which configures
generic tests for a specific image when testing with
testimage.bbclass

For example, the parselogs.py runtime test needs image
specific configuration when the image has new errors from
the kernel which acceptable and can be ignored.

Same machine can be used to generate multiple images with different
runtime behavior so using image as the key and not machine.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/data.py | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/data.py

diff --git a/meta/lib/oeqa/utils/data.py b/meta/lib/oeqa/utils/data.py
new file mode 100644
index 0000000000..4b8c10c1d0
--- /dev/null
+++ b/meta/lib/oeqa/utils/data.py
@@ -0,0 +1,41 @@
+# Copyright (C) 2022 Linaro Limited
+#
+# SPDX-License-Identifier: MIT
+
+import os
+import json
+
+from oeqa.core.utils.test import getCaseID, getCaseFile, getCaseMethod
+
+
+def get_data(self, key = None):
+    """get_data() returns test case specific data to the test case implementation.
+    Data is stored in image specific json file called "testimage_data.json" in
+    image deploy directory. Image recipes can provide custom versions of this file.
+    Data matching test method name and an optional key is returned to the test case.
+    This data can then be used by generic test cases to match image specific functionality
+    and expected behavior. For example list of expected kernel error strings, list
+    of active systemd services etc. can be image specific while the test case
+    implementation to check them is generic. Example json file for runtime
+    test parselogs.py to ignore image specific kernel error strings in dmesg:
+
+    {"test_parselogs":{"ignore_errors":[
+        "Error to be ignored in dmesg"
+    ]}}
+    """
+    test_method = getCaseMethod(self)
+    self.logger.info("%s: get_data() called by test_method =  %s, key = %s" % (__file__, test_method, key))
+
+    json_file_name = os.path.join(self.td['DEPLOY_DIR_IMAGE'], "testimage_data.json")
+    self.logger.debug("%s: json_file_name = %s" % (__file__, json_file_name))
+
+    with open(json_file_name) as json_file:
+        self.logger.debug("%s: json_file = %s" % (__file__, json_file))
+        json_data = json.load(json_file)
+        self.logger.debug("%s: json_data = %s" % (__file__, json_data))
+        if key:
+            data = json_data[test_method][key]
+        else:
+            data = json_data[test_method]
+        self.logger.debug("%s: data = %s" % (__file__, data))
+        return data
-- 
2.34.1


