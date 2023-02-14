Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931CDC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:53:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12512.1676393595802970884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ByxqXsN7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 41B9EFF80F;
	Tue, 14 Feb 2023 16:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676393594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rztb2D/2vZXUDPzmD2X0J80X5XwXr5Xp+MPcecsbTas=;
	b=ByxqXsN7mTsKf2f5o7tvKyVkNLVAoVrRGdIlyG2ksUfOKEnMo6RNhu1Iu9AiYwAJJnkSD2
	/wjKTIBcKdo7s2B3IcAnPWI4GhH57sjNrNIxZroTVtf+uwt1nfxUblP3klrTztt0IEkK3k
	9ZAGsKdxkdIwq2JQ8AKiqeQGIGJ8w+i/4qyoim4fWQ/sQBZsOs3sXqBD9JW7uCQQo3mA1g
	Hn4xnEJuZ7b+1S9Ypv4P49ZgZYXVwjEGQErje6EMfKVqfQke0yBziD57r1di5zn5AdTEjM
	f1p1bFILTwGgfa9Qa1yKRmiXc0GRJgsuyISxI1bocpzhgZRXqIxAGihzSrDdTQ==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v2 4/4] oeqa/selftest/resulttool: add test for metadata filtering on regression
Date: Tue, 14 Feb 2023 17:53:09 +0100
Message-Id: <20230214165309.63527-5-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214165309.63527-1-alexis.lothore@bootlin.com>
References: <20230214165309.63527-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177165

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Introduce new tests for the metadata-based filtering added for oeselftest
results

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index efdfd98af3..e93796e145 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -98,3 +98,124 @@ class ResultToolTests(OESelftestTestCase):
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
-- 
2.39.1


