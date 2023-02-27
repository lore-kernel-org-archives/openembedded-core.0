Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D146C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 19:42:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.4632.1677526961175008217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 11:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XtWUu+Ll;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 637006000B;
	Mon, 27 Feb 2023 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677526959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehf/OFCxCMFhNRKu/JR7AcBnhdXY6kBcpDr/0IZajnk=;
	b=XtWUu+LlacL4dZXlO9EAPxiY+lWmHjL8nfHyyRBHp5aPkshI0VWd0UXWSO0O0fCcJMUSSI
	+IwhsU+TwzAeBwcBlOoh5Op0jKdkWaY4g65Zl9WJXTyrN99KZwtNTrUZOIXNq/S5EAVuDh
	G0XnKOQKUtn9Lga+ZFfOvpwwW43ui4AGYITyq9iU+I7qSEc2+62UlolHhKSR47e0FXPXoN
	F8nWKIYnayAZSC0x7KNwaXyjp58ROx7Lu6IsYes/DDtDXFfnOVWfq2SWQDMFZ4fUaEyFBy
	yTvNvtkr0qrsCYP0Iq5rhxO7xkTwjUydcx3iejwlDliAjX+wscCElYDaJ0Nz1g==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 2/2] oeqa/selftest/resulttool: add test for metadata filtering on regression
Date: Mon, 27 Feb 2023 20:42:23 +0100
Message-Id: <20230227194223.24304-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227194223.24304-1-alexis.lothore@bootlin.com>
References: <20230227194223.24304-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 19:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177807

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Multiple filters have been added to resulttool to ensure that test
results are compared only to relevant older tests results

Add some unit tests about added filters:
- tests should only be compared when machine matches
- tests run as oeselftest should only be compared when
  OESELFTEST_METADATA matches
- many ptests should match despite non-static names
- runtime tests should match with matching tests regarding ltp tests
  content

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 243 ++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index efdfd98af3..f059991c19 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -98,3 +98,246 @@ class ResultToolTests(OESelftestTestCase):
         resultutils.append_resultsdata(results, ResultToolTests.target_results_data, configmap=resultutils.flatten_map)
         self.assertEqual(len(results[''].keys()), 5, msg="Flattened results not correct %s" % str(results))
 
+    def test_results_without_metadata_can_be_compared(self):
+        base_configuration = {"configuration": {
+            "TEST_TYPE": "oeselftest",
+            "TESTSERIES": "series1",
+            "IMAGE_BASENAME": "image",
+            "IMAGE_PKGTYPE": "ipk",
+            "DISTRO": "mydistro",
+            "MACHINE": "qemux86",
+            "STARTTIME": 1672527600
+        }, "result": {}}
+        target_configuration = {"configuration": {
+                                "TEST_TYPE": "oeselftest",
+                                "TESTSERIES": "series1",
+                                "IMAGE_BASENAME": "image",
+                                "IMAGE_PKGTYPE": "ipk",
+                                "DISTRO": "mydistro",
+                                "MACHINE": "qemux86",
+                                "STARTTIME": 1672527600
+                                }, "result": {}}
+        self.assertTrue(regression.can_be_compared(self.logger, base_configuration, target_configuration),
+                        msg="incorrect metadata filtering, tests without metadata should be compared")
+
+    def test_target_result_with_missing_metadata_can_not_be_compared(self):
+        base_configuration = {"configuration": {
+            "TEST_TYPE": "oeselftest",
+            "TESTSERIES": "series1",
+            "IMAGE_BASENAME": "image",
+            "IMAGE_PKGTYPE": "ipk",
+            "DISTRO": "mydistro",
+            "MACHINE": "qemux86",
+            "OESELFTEST_METADATA": {
+                "run_all_tests": True,
+                "run_tests": None,
+                "skips": None,
+                "machine": None,
+                "select_tags": ["toolchain-user", "toolchain-system"],
+                "exclude_tags": None
+            }}, "result": {}}
+        target_configuration = {"configuration": {"TEST_TYPE": "oeselftest",
+                                "TESTSERIES": "series1",
+                                                  "IMAGE_BASENAME": "image",
+                                                  "IMAGE_PKGTYPE": "ipk",
+                                                  "DISTRO": "mydistro",
+                                                  "MACHINE": "qemux86",
+                                                  "STARTTIME": 1672527600
+                                                  }, "result": {}}
+        self.assertFalse(regression.can_be_compared(self.logger, base_configuration, target_configuration),
+                         msg="incorrect metadata filtering, tests should not be compared")
+
+    def test_results_with_matching_metadata_can_be_compared(self):
+        base_configuration = {"configuration": {
+            "TEST_TYPE": "oeselftest",
+            "TESTSERIES": "series1",
+            "IMAGE_BASENAME": "image",
+            "IMAGE_PKGTYPE": "ipk",
+                             "DISTRO": "mydistro",
+                             "MACHINE": "qemux86",
+            "STARTTIME": 1672527600,
+                             "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                     "run_tests": None,
+                                                     "skips": None,
+                                                     "machine": None,
+                                                     "select_tags": ["toolchain-user", "toolchain-system"],
+                                                     "exclude_tags": None}
+        }, "result": {}}
+        target_configuration = {"configuration": {
+            "TEST_TYPE": "oeselftest",
+            "TESTSERIES": "series1",
+            "IMAGE_BASENAME": "image",
+            "IMAGE_PKGTYPE": "ipk",
+            "DISTRO": "mydistro",
+            "MACHINE": "qemux86",
+                                "STARTTIME": 1672527600,
+                                "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                        "run_tests": None,
+                                                        "skips": None,
+                                                        "machine": None,
+                                                        "select_tags": ["toolchain-user", "toolchain-system"],
+                                                        "exclude_tags": None}
+                                }, "result": {}}
+        self.assertTrue(regression.can_be_compared(self.logger, base_configuration, target_configuration),
+                        msg="incorrect metadata filtering, tests with matching metadata should be compared")
+
+    def test_results_with_mismatching_metadata_can_not_be_compared(self):
+        base_configuration = {"configuration": {
+            "TEST_TYPE": "oeselftest",
+            "TESTSERIES": "series1",
+            "IMAGE_BASENAME": "image",
+            "IMAGE_PKGTYPE": "ipk",
+            "DISTRO": "mydistro",
+            "MACHINE": "qemux86",
+            "STARTTIME": 1672527600,
+            "OESELFTEST_METADATA": {"run_all_tests": True,
+                                    "run_tests": None,
+                                    "skips": None,
+                                    "machine": None,
+                                    "select_tags": ["toolchain-user", "toolchain-system"],
+                                    "exclude_tags": None}
+        }, "result": {}}
+        target_configuration = {"configuration": {
+            "TEST_TYPE": "oeselftest",
+            "TESTSERIES": "series1",
+            "IMAGE_BASENAME": "image",
+            "IMAGE_PKGTYPE": "ipk",
+            "DISTRO": "mydistro",
+            "MACHINE": "qemux86",
+                                "STARTTIME": 1672527600,
+                                "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                        "run_tests": None,
+                                                        "skips": None,
+                                                        "machine": None,
+                                                        "select_tags": ["machine"],
+                                                        "exclude_tags": None}
+                                }, "result": {}}
+        self.assertFalse(regression.can_be_compared(self.logger, base_configuration, target_configuration),
+                         msg="incorrect metadata filtering, tests with mismatching metadata should not be compared")
+
+    def test_metadata_matching_is_only_checked_for_relevant_test_type(self):
+        base_configuration = {"configuration": {"TEST_TYPE": "runtime",
+                              "TESTSERIES": "series1",
+                                                "IMAGE_BASENAME": "image",
+                                                "IMAGE_PKGTYPE": "ipk",
+                                                "DISTRO": "mydistro",
+                                                "MACHINE": "qemux86",
+                                                "STARTTIME": 1672527600,
+                                                "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                                        "run_tests": None,
+                                                                        "skips": None,
+                                                                        "machine": None,
+                                                                        "select_tags": ["toolchain-user", "toolchain-system"],
+                                                                        "exclude_tags": None}}, "result": {}}
+        target_configuration = {"configuration": {"TEST_TYPE": "runtime",
+                                "TESTSERIES": "series1",
+                                                  "IMAGE_BASENAME": "image",
+                                                  "IMAGE_PKGTYPE": "ipk",
+                                                  "DISTRO": "mydistro",
+                                                  "MACHINE": "qemux86",
+                                                  "STARTTIME": 1672527600,
+                                                  "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                                          "run_tests": None,
+                                                                          "skips": None,
+                                                                          "machine": None,
+                                                                          "select_tags": ["machine"],
+                                                                          "exclude_tags": None}}, "result": {}}
+        self.assertTrue(regression.can_be_compared(self.logger, base_configuration, target_configuration),
+                        msg="incorrect metadata filtering, %s tests should be compared" % base_configuration['configuration']['TEST_TYPE'])
+
+    def test_machine_matches(self):
+        base_configuration = {"configuration": {
+            "TEST_TYPE": "runtime",
+            "MACHINE": "qemux86"}, "result": {}}
+        target_configuration = {"configuration": {
+            "TEST_TYPE": "runtime",
+            "MACHINE": "qemux86"
+        }, "result": {}}
+        self.assertTrue(regression.can_be_compared(self.logger, base_configuration, target_configuration),
+                        msg="incorrect machine filtering, identical machine tests should be compared")
+
+    def test_machine_mismatches(self):
+        base_configuration = {"configuration": {
+            "TEST_TYPE": "runtime",
+            "MACHINE": "qemux86"
+        }, "result": {}}
+        target_configuration = {"configuration": {
+            "TEST_TYPE": "runtime",
+            "MACHINE": "qemux86_64"
+        }, "result": {}}
+        self.assertFalse(regression.can_be_compared(self.logger, base_configuration, target_configuration),
+                         msg="incorrect machine filtering, mismatching machine tests should not be compared")
+
+    def test_can_not_compare_non_ltp_tests(self):
+        base_configuration = {"configuration": {
+            "TEST_TYPE": "runtime",
+            "MACHINE": "qemux86"
+        }, "result": {
+            "ltpresult_foo": {
+                "STATUS": "PASSED"
+            }}}
+        target_configuration = {"configuration": {
+            "TEST_TYPE": "runtime",
+            "MACHINE": "qemux86_64"
+        }, "result": {
+            "bar": {
+                "STATUS": "PASSED"
+            }}}
+        self.assertFalse(regression.can_be_compared(self.logger, base_configuration, target_configuration),
+                         msg="incorrect ltpresult filtering, mismatching ltpresult content should not be compared")
+
+    def test_can_compare_ltp_tests(self):
+        base_configuration = {"configuration": {
+            "TEST_TYPE": "runtime",
+            "MACHINE": "qemux86"
+        }, "result": {
+            "ltpresult_foo": {
+                "STATUS": "PASSED"
+            }}}
+        target_configuration = {"configuration": {
+            "TEST_TYPE": "runtime",
+            "MACHINE": "qemux86"
+        }, "result": {
+            "ltpresult_foo": {
+                "STATUS": "PASSED"
+            }}}
+        self.assertTrue(regression.can_be_compared(self.logger, base_configuration, target_configuration),
+                        msg="incorrect ltpresult filtering, matching ltpresult content should be compared")
+
+    def test_can_match_non_static_ptest_names(self):
+        base_configuration = {"configuration": {
+            "TEST_TYPE": "runtime",
+            "MACHINE": "qemux86"
+        }, "result": {
+            "ptestresult.lttng-tools.foo_-_bar_-_moo": {
+                "STATUS": "PASSED"
+            },
+            "ptestresult.babeltrace.bar_-_moo_-_foo": {
+                "STATUS": "PASSED"
+            },
+            "ptestresult.babletrace2.moo_-_foo_-_bar": {
+                "STATUS": "PASSED"
+            },
+            "ptestresult.curl.test_0000__foo_out_of_bar": {
+                "STATUS": "PASSED"
+            }
+        }}
+        target_configuration = {"configuration": {
+            "TEST_TYPE": "runtime",
+            "MACHINE": "qemux86"
+        }, "result": {
+            "ptestresult.lttng-tools.xxx_-_yyy_-_zzz": {
+                "STATUS": "PASSED"
+            },
+            "ptestresult.babeltrace.yyy_-_zzz_-_xxx": {
+                "STATUS": "PASSED"
+            },
+            "ptestresult.babletrace2.zzz_-_xxx_-_yyy": {
+                "STATUS": "PASSED"
+            },
+            "ptestresult.curl.test_0000__xxx_out_of_yyy": {
+                "STATUS": "PASSED"
+            }
+            }}
+        self.assertTrue(regression.can_be_compared(self.logger, base_configuration, target_configuration),
+                        msg="incorrect ptests filtering, tests shoould be compared if prefixes match")
-- 
2.39.2


