Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D81CCD184
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 18:49:13 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.1819.1759949348174909144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 11:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Vwe0lHh1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20251008184903f27cc4c5a30002079b-pttphd@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251008184903f27cc4c5a30002079b
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 20:49:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BZo74EwogPs7KEooSr5KThJQ5r6NymwVUXGGzHjeDdw=;
 b=Vwe0lHh1kArvQ4UB1n5j3Otshw0HspO3G+1ZzwcsRBH6kd/OAX2EwlBKAa/AjtkNPZR65j
 ZirXDJ34qGF7CSYmXWXisH8rnTgFVLL7EgBIX4uz5V5KsF9UHuN5aqyeQ0jmSGD50G1zzyr5
 PfCVdCCdpUSTBarB0AecXmYg43hwDrL6HdOXH9SEAWMmm/OFY5dX0KAH2y3P3u4gMpCBnnVx
 iFEQwQJZQjgj8fg19hYtLWVxqyYqc3Q6W/L6oBnUvbG2p1OnwMa1gcvEkAYHzmc/O5Jvo8C0
 UeLM+9WknmznMb/aPIOqIjxsU4zVQK9Rp1TQC0860PA1335ldCH/5ZsA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] expat: follow-up for CVE-2024-8176
Date: Wed,  8 Oct 2025 20:49:01 +0200
Message-Id: <20251008184901.1682495-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 18:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224591

From: Peter Marko <peter.marko@siemens.com>

Expat release 2.7.3 implemented a follow-up for this CVE.
References:
* https://github.com/libexpat/libexpat/blob/R_2_7_3/expat/Changes
* https://security-tracker.debian.org/tracker/CVE-2024-8176
* https://github.com/libexpat/libexpat/pull/1059

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../expat/expat/CVE-2024-8176-03.patch        |  35 ++++++
 .../expat/expat/CVE-2024-8176-04.patch        | 115 ++++++++++++++++++
 .../expat/expat/CVE-2024-8176-05.patch        |  78 ++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |   3 +
 4 files changed, 231 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-05.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-8176-03.patch b/meta/recipes-core/expat/expat/CVE-2024-8176-03.patch
new file mode 100644
index 00000000000..c9990d5547e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-8176-03.patch
@@ -0,0 +1,35 @@
+From ba80428c2207259103b73871d447dee34755340c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@tum.de>
+Date: Tue, 23 Sep 2025 11:22:14 +0200
+Subject: [PATCH] lib: Fix detection of asynchronous tags in entities
+
+According to the XML standard, tags must be closed within the same
+element in which they are opened. Since the change of the entity
+processing method in version 2.7.0, violations of this rule have not
+been handled correctly for entities.
+
+This commit adds the required checks to detect any violations and
+restores the correct behaviour.
+
+CVE: CVE-2024-8176
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1059]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index ce29ab6f..ba4e3c48 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6087,6 +6087,10 @@ internalEntityProcessor(XML_Parser parser, const char *s, const char *end,
+     // process its possible inner entities (which are added to the
+     // m_openInternalEntities during doProlog or doContent calls above)
+     entity->hasMore = XML_FALSE;
++    if (! entity->is_param
++        && (openEntity->startTagLevel != parser->m_tagLevel)) {
++      return XML_ERROR_ASYNC_ENTITY;
++    }
+     triggerReenter(parser);
+     return result;
+   } // End of entity processing, "if" block will return here
diff --git a/meta/recipes-core/expat/expat/CVE-2024-8176-04.patch b/meta/recipes-core/expat/expat/CVE-2024-8176-04.patch
new file mode 100644
index 00000000000..9623467698f
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-8176-04.patch
@@ -0,0 +1,115 @@
+From 81a114f7eebcd41a6993337128cda337986a26f4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 15 Sep 2025 21:57:07 +0200
+Subject: [PATCH] tests: Cover XML_ERROR_ASYNC_ENTITY cases
+
+CVE: CVE-2024-8176
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1059]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/misc_tests.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 87 insertions(+)
+
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index 3346bce6..19f41df7 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -621,6 +621,91 @@ START_TEST(test_misc_expected_event_ptr_issue_980) {
+ }
+ END_TEST
+ 
++START_TEST(test_misc_sync_entity_tolerated) {
++  const char *const doc = "<!DOCTYPE t0 [\n"
++                          "   <!ENTITY a '<t1></t1>'>\n"
++                          "   <!ENTITY b '<t2>two</t2>'>\n"
++                          "   <!ENTITY c '<t3>three<t4>four</t4>three</t3>'>\n"
++                          "   <!ENTITY d '<t5>&b;</t5>'>\n"
++                          "]>\n"
++                          "<t0>&a;&b;&c;&d;</t0>\n";
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, doc, (int)strlen(doc),
++                                      /*isFinal=*/XML_TRUE)
++              == XML_STATUS_OK);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_misc_async_entity_rejected) {
++  struct test_case {
++    const char *doc;
++    enum XML_Status expectedStatusNoGE;
++    enum XML_Error expectedErrorNoGE;
++  };
++  const struct test_case cases[] = {
++      // Opened by one entity, closed by another
++      {"<!DOCTYPE t0 [\n"
++       "   <!ENTITY open '<t1>'>\n"
++       "   <!ENTITY close '</t1>'>\n"
++       "]>\n"
++       "<t0>&open;&close;</t0>\n",
++       XML_STATUS_OK, XML_ERROR_NONE},
++      // Opened by tag, closed by entity (non-root case)
++      {"<!DOCTYPE t0 [\n"
++       "  <!ENTITY g0 ''>\n"
++       "  <!ENTITY g1 '&g0;</t1>'>\n"
++       "]>\n"
++       "<t0><t1>&g1;</t0>\n",
++       XML_STATUS_ERROR, XML_ERROR_TAG_MISMATCH},
++      // Opened by tag, closed by entity (root case)
++      {"<!DOCTYPE t0 [\n"
++       "  <!ENTITY g0 ''>\n"
++       "  <!ENTITY g1 '&g0;</t0>'>\n"
++       "]>\n"
++       "<t0>&g1;\n",
++       XML_STATUS_ERROR, XML_ERROR_NO_ELEMENTS},
++      // Opened by entity, closed by tag <-- regression from 2.7.0
++      {"<!DOCTYPE t0 [\n"
++       "  <!ENTITY g0 ''>\n"
++       "  <!ENTITY g1 '<t1>&g0;'>\n"
++       "]>\n"
++       "<t0>&g1;</t1></t0>\n",
++       XML_STATUS_ERROR, XML_ERROR_TAG_MISMATCH},
++      // Opened by tag, closed by entity; then the other way around
++      {"<!DOCTYPE t0 [\n"
++       "  <!ENTITY open '<t1>'>\n"
++       "  <!ENTITY close '</t1>'>\n"
++       "]>\n"
++       "<t0><t1>&close;&open;</t1></t0>\n",
++       XML_STATUS_OK, XML_ERROR_NONE},
++  };
++
++  for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
++    const struct test_case testCase = cases[i];
++    set_subtest("cases[%d]", (int)i);
++
++    const char *const doc = testCase.doc;
++#if XML_GE == 1
++    const enum XML_Status expectedStatus = XML_STATUS_ERROR;
++    const enum XML_Error expectedError = XML_ERROR_ASYNC_ENTITY;
++#else
++    const enum XML_Status expectedStatus = testCase.expectedStatusNoGE;
++    const enum XML_Error expectedError = testCase.expectedErrorNoGE;
++#endif
++
++    XML_Parser parser = XML_ParserCreate(NULL);
++    assert_true(_XML_Parse_SINGLE_BYTES(parser, doc, (int)strlen(doc),
++                                        /*isFinal=*/XML_TRUE)
++                == expectedStatus);
++    assert_true(XML_GetErrorCode(parser) == expectedError);
++    XML_ParserFree(parser);
++  }
++}
++END_TEST
++
+ void
+ make_miscellaneous_test_case(Suite *s) {
+   TCase *tc_misc = tcase_create("miscellaneous tests");
+@@ -649,4 +734,6 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_stopparser_rejects_unstarted_parser);
+   tcase_add_test__if_xml_ge(tc_misc, test_renter_loop_finite_content);
+   tcase_add_test(tc_misc, test_misc_expected_event_ptr_issue_980);
++  tcase_add_test(tc_misc, test_misc_sync_entity_tolerated);
++  tcase_add_test(tc_misc, test_misc_async_entity_rejected);
+ }
diff --git a/meta/recipes-core/expat/expat/CVE-2024-8176-05.patch b/meta/recipes-core/expat/expat/CVE-2024-8176-05.patch
new file mode 100644
index 00000000000..063a590a118
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-8176-05.patch
@@ -0,0 +1,78 @@
+From a9aaf85cfc3025b7013b5adc4bef2ce32ecc7fb1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@tum.de>
+Date: Tue, 23 Sep 2025 12:12:50 +0200
+Subject: [PATCH] tests: Add line/column checks to async entity tests
+
+CVE: CVE-2024-8176
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1059]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/misc_tests.c | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index 19f41df7..7a4d2455 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -644,6 +644,8 @@ START_TEST(test_misc_async_entity_rejected) {
+     const char *doc;
+     enum XML_Status expectedStatusNoGE;
+     enum XML_Error expectedErrorNoGE;
++    XML_Size expectedErrorLine;
++    XML_Size expectedErrorColumn;
+   };
+   const struct test_case cases[] = {
+       // Opened by one entity, closed by another
+@@ -652,35 +654,35 @@ START_TEST(test_misc_async_entity_rejected) {
+        "   <!ENTITY close '</t1>'>\n"
+        "]>\n"
+        "<t0>&open;&close;</t0>\n",
+-       XML_STATUS_OK, XML_ERROR_NONE},
++       XML_STATUS_OK, XML_ERROR_NONE, 5, 4},
+       // Opened by tag, closed by entity (non-root case)
+       {"<!DOCTYPE t0 [\n"
+        "  <!ENTITY g0 ''>\n"
+        "  <!ENTITY g1 '&g0;</t1>'>\n"
+        "]>\n"
+        "<t0><t1>&g1;</t0>\n",
+-       XML_STATUS_ERROR, XML_ERROR_TAG_MISMATCH},
++       XML_STATUS_ERROR, XML_ERROR_TAG_MISMATCH, 5, 8},
+       // Opened by tag, closed by entity (root case)
+       {"<!DOCTYPE t0 [\n"
+        "  <!ENTITY g0 ''>\n"
+        "  <!ENTITY g1 '&g0;</t0>'>\n"
+        "]>\n"
+        "<t0>&g1;\n",
+-       XML_STATUS_ERROR, XML_ERROR_NO_ELEMENTS},
++       XML_STATUS_ERROR, XML_ERROR_NO_ELEMENTS, 5, 4},
+       // Opened by entity, closed by tag <-- regression from 2.7.0
+       {"<!DOCTYPE t0 [\n"
+        "  <!ENTITY g0 ''>\n"
+        "  <!ENTITY g1 '<t1>&g0;'>\n"
+        "]>\n"
+        "<t0>&g1;</t1></t0>\n",
+-       XML_STATUS_ERROR, XML_ERROR_TAG_MISMATCH},
++       XML_STATUS_ERROR, XML_ERROR_TAG_MISMATCH, 5, 4},
+       // Opened by tag, closed by entity; then the other way around
+       {"<!DOCTYPE t0 [\n"
+        "  <!ENTITY open '<t1>'>\n"
+        "  <!ENTITY close '</t1>'>\n"
+        "]>\n"
+        "<t0><t1>&close;&open;</t1></t0>\n",
+-       XML_STATUS_OK, XML_ERROR_NONE},
++       XML_STATUS_OK, XML_ERROR_NONE, 5, 8},
+   };
+ 
+   for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
+@@ -701,6 +703,11 @@ START_TEST(test_misc_async_entity_rejected) {
+                                         /*isFinal=*/XML_TRUE)
+                 == expectedStatus);
+     assert_true(XML_GetErrorCode(parser) == expectedError);
++#if XML_GE == 1
++    assert_true(XML_GetCurrentLineNumber(parser) == testCase.expectedErrorLine);
++    assert_true(XML_GetCurrentColumnNumber(parser)
++                == testCase.expectedErrorColumn);
++#endif
+     XML_ParserFree(parser);
+   }
+ }
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index ab0b1d54c13..816beaa8a3d 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -13,6 +13,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://0001-tests-Cover-indirect-entity-recursion.patch;striplevel=2 \
            file://CVE-2024-8176-01.patch;striplevel=2 \
            file://CVE-2024-8176-02.patch;striplevel=2 \
+           file://CVE-2024-8176-03.patch \
+           file://CVE-2024-8176-04.patch \
+           file://CVE-2024-8176-05.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

