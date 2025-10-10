Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253A4CCD18F
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:01 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.2322.1760064657291739031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=azs5J9VP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3352018e051so1986436a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064656; x=1760669456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eg4lXOOfLcb7WAaRoU5SViH49F69DTEcnftIEzYXmtg=;
        b=azs5J9VPvoqp1Uls+mygDTFd8N6VMIyQ6ysFFwmpLOFNh3IBBTss7rli3Qh3dwNb9D
         SbAKOR5VEEcrB8+LxwJfEoRsvgm7vASRYjbgZt/MgAW/Sj6DmxHOy/O+6dMdXRm3LhOU
         API+RmHCdLVrJL0FojxuHnVcV3nllkvebkHgK5L4veI96VVTSt6ENb+160z4HtLU7Qiv
         0e7pdrCHQqoSOZHmCaB+yIUx9L3N2UJ0qrXlyc7tJflJyTORKva7GRtrXXhIiQGGmc9A
         0oxi+5WJ064JSXmicACfdXLlgGsp/enUWZUQJYrU/gXFRhUtx4O9bDUxydNpMZX9g2Lk
         5E8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064656; x=1760669456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eg4lXOOfLcb7WAaRoU5SViH49F69DTEcnftIEzYXmtg=;
        b=hmG+jmuvur4z7sfj8k7Hd2M4nBknjJVyIJiJEDXyrER95tyCtLvyJO6eVq9HO4kJsV
         g8dKpysJGf9HfawhSRjX818uEFLG9mK/EZkVkpFL2ZZtOsOdTZ5dfp2jI88MAVoCfV0k
         vrCxtr1JUW6UWnWjRUrHHRu9Kf5uluyyd5x5dkM5HSeklhvyGGyjAQj2esM1xd3rYCK4
         X3b3UotIAGynS+als23UAIb0Ypv1JryqrzqciXuTKGgNV+MiTQsC1pNq9XSorSGHf6t5
         86IoSRdhPmUXs2gR79XXJvt418vGB8RVAZjGDnx0koB15YWfhZbmPK5hYefpg7cyRZmu
         ToQQ==
X-Gm-Message-State: AOJu0Yx4aOxKKZUu2jj3mHWiSAP6OkD58yJQPrSLoirxGRUosHvc9EPI
	AH4f3eeCcv/ZaMEFOl9uh2dbpELX0c+nF+kbkr9dhSAGqECX4Z8gudwTKbZbVyWJmn5MGKXynas
	TU/YF
X-Gm-Gg: ASbGncuP7nTB8T/pZoxnIDG2n+5YCxX1kELIk1+pdZAqzu+KjkBEtTJf3AKC3mAqNsJ
	lG++uInJy4Axbu/+H83pHFzqop4vrQr9nnm3zVtZcbxbrdgOrv6QfaU3mjQO7RCGHRGsE4LjCnI
	uzRAqT/CXmnMQMcR5tlsXOXBYocW4+uPjRmEJ4Bk+s1cIjcn5qIB9sMkX0lutvYV1NqFywjYoTw
	zRIrVtjLCcm3BbhvHkPnBo808viilayqgcP0RUz7d3uds8H/JhlvHLC68E0ExY9TvLgeaWXROsE
	B0P0lIzITCU1MBppPE6Mwu4msqH9bT5vuvYBevVqDu93wetwn9tbU/VELpARBCryQu80PcQka0H
	mFAT8ShynTRwlI/o2bvxgNkYbC1p5toNW
X-Google-Smtp-Source: AGHT+IF5nJyZbV4enCbxRqjzskFhFZLXRi1DbBE7/vzNOj9mplEonbBaVVTATSlfUM7YY68a+1EgaQ==
X-Received: by 2002:a17:90b:3a91:b0:329:f535:6e48 with SMTP id 98e67ed59e1d1-33b513a1f54mr13236993a91.36.1760064656397;
        Thu, 09 Oct 2025 19:50:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/18] expat: follow-up for CVE-2024-8176
Date: Thu,  9 Oct 2025 19:50:27 -0700
Message-ID: <5bbb9ee52674f5aa6eed5d6cf3f515704092994d.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224652

From: Peter Marko <peter.marko@siemens.com>

Expat release 2.7.3 implemented a follow-up for this CVE.
References:
* https://github.com/libexpat/libexpat/blob/R_2_7_3/expat/Changes
* https://security-tracker.debian.org/tracker/CVE-2024-8176
* https://github.com/libexpat/libexpat/pull/1059

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 0000000000..c9990d5547
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
index 0000000000..9623467698
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
index 0000000000..063a590a11
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
index ab0b1d54c1..816beaa8a3 100644
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
-- 
2.43.0


