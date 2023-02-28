Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E01C6FA8E
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 18:10:40 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.31356.1677607837801557556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 10:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N4P9fc7m;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 19448100002;
	Tue, 28 Feb 2023 18:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677607836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Unk9yl6gWTtxlaAQ7t1O99MjRSqZ/vYRLkLlE4rgY2Y=;
	b=N4P9fc7mYNKBsj2urmPaKWoQI8y/XKNhBET+pEz7gqPJzFd4r4X2uUs+f4YSFmr+YTbvsc
	KbKQZrzVrJIL2tfocb+k2PiHE16mLQ5+N+SuJfE3fy3Q+kJDKmNB9C/zl/Nn/qd+hEmOwI
	vOGWL5UbLJqrDqfef5C75pTd0sH0d/rzHCoKGcZSXaKYstAalDPV7bccC1ldsrPRmGZs4u
	4qzUY+bVaNv9yQjJnSH8svpUUbQZyhveNqhMlBUmwvgxEi2cTC7+hUIUYs9cwr3+dHNf/E
	0BL9wn/hvJFZaUEPzFuMBuvyFwA8r17Cfu6MzQmQ9lirLY6sIZIMxNhv1lwyRw==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 2/6] oeqa/selftest/resulttool: fix ptest filtering tests
Date: Tue, 28 Feb 2023 19:10:46 +0100
Message-Id: <20230228181052.4191521-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
References: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 18:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177848

From: Alexis Lothoré <alexis.lothore@bootlin.com>

There are multiple issues with the tests for the ptest fixup mechanism
introduced in c45d58f003e8d8b323169ca9d479dc49c43a9974:
- the feature does not impact regression.can_be_compared but directly the
  comparison step in regression.regression_common
- the "status" field was wrong ("STATUS"), which prevents tests comparison
- there is a typo babeltrace2 ptest result name

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 80 ++++++++++---------
 1 file changed, 44 insertions(+), 36 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index f059991c19c..8489ae8eb52 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -305,39 +305,47 @@ class ResultToolTests(OESelftestTestCase):
                         msg="incorrect ltpresult filtering, matching ltpresult content should be compared")
 
     def test_can_match_non_static_ptest_names(self):
-        base_configuration = {"configuration": {
-            "TEST_TYPE": "runtime",
-            "MACHINE": "qemux86"
-        }, "result": {
-            "ptestresult.lttng-tools.foo_-_bar_-_moo": {
-                "STATUS": "PASSED"
-            },
-            "ptestresult.babeltrace.bar_-_moo_-_foo": {
-                "STATUS": "PASSED"
-            },
-            "ptestresult.babletrace2.moo_-_foo_-_bar": {
-                "STATUS": "PASSED"
-            },
-            "ptestresult.curl.test_0000__foo_out_of_bar": {
-                "STATUS": "PASSED"
-            }
-        }}
-        target_configuration = {"configuration": {
-            "TEST_TYPE": "runtime",
-            "MACHINE": "qemux86"
-        }, "result": {
-            "ptestresult.lttng-tools.xxx_-_yyy_-_zzz": {
-                "STATUS": "PASSED"
-            },
-            "ptestresult.babeltrace.yyy_-_zzz_-_xxx": {
-                "STATUS": "PASSED"
-            },
-            "ptestresult.babletrace2.zzz_-_xxx_-_yyy": {
-                "STATUS": "PASSED"
-            },
-            "ptestresult.curl.test_0000__xxx_out_of_yyy": {
-                "STATUS": "PASSED"
-            }
-            }}
-        self.assertTrue(regression.can_be_compared(self.logger, base_configuration, target_configuration),
-                        msg="incorrect ptests filtering, tests shoould be compared if prefixes match")
+        base_configuration = {"a": {
+            "conf_X": {
+                "configuration": {
+                    "TEST_TYPE": "runtime",
+                    "MACHINE": "qemux86"
+                }, "result": {
+                    "ptestresult.lttng-tools.foo_-_bar_-_moo": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.babeltrace.bar_-_moo_-_foo": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.babeltrace2.moo_-_foo_-_bar": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.curl.test_0000__foo_out_of_bar": {
+                        "status": "PASSED"
+                    }
+                }}}}
+        target_configuration = {"a": {
+            "conf_Y": {
+                "configuration": {
+                    "TEST_TYPE": "runtime",
+                    "MACHINE": "qemux86"
+                }, "result": {
+                    "ptestresult.lttng-tools.foo_-_yyy_-_zzz": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.babeltrace.bar_-_zzz_-_xxx": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.babeltrace2.moo_-_xxx_-_yyy": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.curl.test_0000__xxx_out_of_yyy": {
+                        "status": "PASSED"
+                    }
+                }}}}
+        regression.fixup_ptest_names(base_configuration, self.logger)
+        regression.fixup_ptest_names(target_configuration, self.logger)
+        result, resultstring = regression.compare_result(
+            self.logger, "A", "B", base_configuration["a"]["conf_X"], target_configuration["a"]["conf_Y"])
+        self.assertDictEqual(
+            result, {}, msg=f"ptests should be compared: {resultstring}")
-- 
2.39.1


