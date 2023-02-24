Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883A9C7EE2E
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:46:01 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.22897.1677257156704770231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RZ0n1+vt;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 034CE10000B;
	Fri, 24 Feb 2023 16:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677257155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1WghUF7crZbHE9wA60204eEHLs7uZX5P4MhxYWnPHU=;
	b=RZ0n1+vt4fGSOBlI3m3OHQLWqS8H4h6Rna/hREjlYweiWdb5eaMDAxwmVdc/1dKa0BIT0Q
	RFMq2yBoUkqRQXCW5ekjJcMXS8VaKcELCwjSL2g6jTEmk87ZG6RsIGkgp7ED/8+kMXZZ6X
	rXsWwZvHGfDiwfVT/tL2QIe6vszD9js5Kuk+c77V9U1piDieJigfI4KVdlZzQKFUvEKcgo
	Kk6A9AlnyNlBLT293I/oj3aT7pG5MfziZl/YJT4Vz+344Njv/1ZRoqvFJbVKh4Xx+8qi5C
	7Jk/GZvwZqqLfVjtfwlrr258rf42LS7/lcvbpHCjOMyUcK3VJAFCh3zPzWz5pw==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v3 4/6] oeqa/selftest/resulttool: add test for metadata filtering on regression
Date: Fri, 24 Feb 2023 17:45:53 +0100
Message-Id: <20230224164555.67634-5-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224164555.67634-1-alexis.lothore@bootlin.com>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177702

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Introduce new tests for the metadata-based filtering added for oeselftest
results

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index efdfd98af3c..75d406c122d 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -98,3 +98,140 @@ class ResultToolTests(OESelftestTestCase):
         resultutils.append_resultsdata(results, ResultToolTests.target_results_data, configmap=resultutils.flatten_map)
         self.assertEqual(len(results[''].keys()), 5, msg="Flattened results not correct %s" % str(results))
 
+    def test_results_without_metadata_can_be_compared(self):
+        base_configuration = {"TEST_TYPE": "oeselftest",
+                              "TESTSERIES": "series1",
+                              "IMAGE_BASENAME": "image",
+                              "IMAGE_PKGTYPE": "ipk",
+                              "DISTRO": "mydistro",
+                              "MACHINE": "qemux86"}
+        target_configuration = {"TEST_TYPE": "oeselftest",
+                                "TESTSERIES": "series1",
+                                "IMAGE_BASENAME": "image",
+                                "IMAGE_PKGTYPE": "ipk",
+                                "DISTRO": "mydistro",
+                                "MACHINE": "qemux86"}
+        self.assertTrue(regression.can_be_compared(base_configuration, target_configuration),
+                        msg="incorrect metadata filtering, tests without metadata should be compared")
+
+    def test_target_result_with_missing_metadata_can_not_be_compared(self):
+        base_configuration = {"TEST_TYPE": "oeselftest",
+                              "TESTSERIES": "series1",
+                              "IMAGE_BASENAME": "image",
+                              "IMAGE_PKGTYPE": "ipk",
+                              "DISTRO": "mydistro",
+                              "MACHINE": "qemux86",
+                              "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                      "run_tests": None,
+                                                      "skips": None,
+                                                      "machine": None,
+                                                      "select_tags": ["toolchain-user", "toolchain-system"],
+                                                      "exclude_tags": None}}
+        target_configuration = {"TEST_TYPE": "oeselftest",
+                                "TESTSERIES": "series1",
+                                "IMAGE_BASENAME": "image",
+                                "IMAGE_PKGTYPE": "ipk",
+                                "DISTRO": "mydistro",
+                                "MACHINE": "qemux86"}
+        self.assertFalse(regression.can_be_compared(base_configuration, target_configuration),
+                         msg="incorrect metadata filtering, tests should not be compared")
+
+    def test_results_with_matching_metadata_can_be_compared(self):
+        base_configuration = {"TEST_TYPE": "oeselftest",
+                              "TESTSERIES": "series1",
+                              "IMAGE_BASENAME": "image",
+                              "IMAGE_PKGTYPE": "ipk",
+                              "DISTRO": "mydistro",
+                              "MACHINE": "qemux86",
+                              "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                      "run_tests": None,
+                                                      "skips": None,
+                                                      "machine": None,
+                                                      "select_tags": ["toolchain-user", "toolchain-system"],
+                                                      "exclude_tags": None}}
+        target_configuration = {"TEST_TYPE": "oeselftest",
+                                "TESTSERIES": "series1",
+                                "IMAGE_BASENAME": "image",
+                                "IMAGE_PKGTYPE": "ipk",
+                                "DISTRO": "mydistro",
+                                "MACHINE": "qemux86",
+                                "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                        "run_tests": None,
+                                                        "skips": None,
+                                                        "machine": None,
+                                                        "select_tags": ["toolchain-user", "toolchain-system"],
+                                                        "exclude_tags": None}}
+        self.assertTrue(regression.can_be_compared(base_configuration, target_configuration),
+                        msg="incorrect metadata filtering, tests with matching metadata should be compared")
+
+    def test_results_with_mismatching_metadata_can_not_be_compared(self):
+        base_configuration = {"TEST_TYPE": "oeselftest",
+                              "TESTSERIES": "series1",
+                              "IMAGE_BASENAME": "image",
+                              "IMAGE_PKGTYPE": "ipk",
+                              "DISTRO": "mydistro",
+                              "MACHINE": "qemux86",
+                              "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                      "run_tests": None,
+                                                      "skips": None,
+                                                      "machine": None,
+                                                      "select_tags": ["toolchain-user", "toolchain-system"],
+                                                      "exclude_tags": None}}
+        target_configuration = {"TEST_TYPE": "oeselftest",
+                                "TESTSERIES": "series1",
+                                "IMAGE_BASENAME": "image",
+                                "IMAGE_PKGTYPE": "ipk",
+                                "DISTRO": "mydistro",
+                                "MACHINE": "qemux86",
+                                "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                        "run_tests": None,
+                                                        "skips": None,
+                                                        "machine": None,
+                                                        "select_tags": ["machine"],
+                                                        "exclude_tags": None}}
+        self.assertFalse(regression.can_be_compared(base_configuration, target_configuration),
+                         msg="incorrect metadata filtering, tests with mismatching metadata should not be compared")
+
+    def test_metadata_matching_is_only_checked_for_relevant_test_type(self):
+        base_configuration = {"TEST_TYPE": "runtime",
+                              "TESTSERIES": "series1",
+                              "IMAGE_BASENAME": "image",
+                              "IMAGE_PKGTYPE": "ipk",
+                              "DISTRO": "mydistro",
+                              "MACHINE": "qemux86",
+                              "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                      "run_tests": None,
+                                                      "skips": None,
+                                                      "machine": None,
+                                                      "select_tags": ["toolchain-user", "toolchain-system"],
+                                                      "exclude_tags": None}}
+        target_configuration = {"TEST_TYPE": "runtime",
+                                "TESTSERIES": "series1",
+                                "IMAGE_BASENAME": "image",
+                                "IMAGE_PKGTYPE": "ipk",
+                                "DISTRO": "mydistro",
+                                "MACHINE": "qemux86",
+                                "OESELFTEST_METADATA": {"run_all_tests": True,
+                                                        "run_tests": None,
+                                                        "skips": None,
+                                                        "machine": None,
+                                                        "select_tags": ["machine"],
+                                                        "exclude_tags": None}}
+        self.assertTrue(regression.can_be_compared(base_configuration, target_configuration),
+                         msg="incorrect metadata filtering, %s tests should be compared" % base_configuration['TEST_TYPE'])
+
+    def test_machine_matches(self):
+        base_configuration = {"TEST_TYPE": "runtime",
+                              "MACHINE": "qemux86"}
+        target_configuration = {"TEST_TYPE": "runtime",
+                              "MACHINE": "qemux86"}
+        self.assertTrue(regression.can_be_compared(base_configuration, target_configuration),
+                        msg="incorrect machine filtering, identical machine tests should be compared")
+
+    def test_machine_mismatches(self):
+        base_configuration = {"TEST_TYPE": "runtime",
+                              "MACHINE": "qemux86"}
+        target_configuration = {"TEST_TYPE": "runtime",
+                              "MACHINE": "qemux86_64"}
+        self.assertFalse(regression.can_be_compared(base_configuration, target_configuration),
+                        msg="incorrect machine filtering, mismatching machine tests should not be compared")
-- 
2.39.1


