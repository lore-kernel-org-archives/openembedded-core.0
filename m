Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E670CCD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:58:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1077.1778000328997643856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pNc4DiXJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d77f6092eso3426061f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000327; x=1778605127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHDXrPP788jp0Tqxcv0hHqD41ui3LlCTVjz6D30ej6Y=;
        b=pNc4DiXJzz+bnu4CSi+Z/IquwpbqRfaeaS+Jy3dwvC5D19s/C3kig0wssI7qwPqfkP
         nLZX/vms6m2cGfQtJb7jCv/tdHABLm66STbSnZy5dneIQNpyOiWY8cJPXcr1lj690Xp1
         g7mhCe/m4ajdCpGa23LFMdpSBKCENcNKEp3Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000327; x=1778605127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OHDXrPP788jp0Tqxcv0hHqD41ui3LlCTVjz6D30ej6Y=;
        b=G7d5TZ9QmeSDEyN7jqvMPu3udLthzeFDMgMS/QnmaLhF11WhFueNkwkssg/kAut6zA
         OAh1B3EVg6LyhCD0z7SkV9JX22sY0lOrNkSKlStBBzVN3YxKcUbrn9XCqF1tedo58+Qr
         Vp0iW8iixmt6K9q2Ckj+eOY0jASglTUUkpEP2WsIpQre9IOAg0wLXGKbe7kTy5jK1jmL
         yGJCuOQyc62Hdwktic5ZygESywteZD+UeCPfHMi5foxeS5tT93FVDNxnpzxQuB0eGA7x
         QZR/OyFu8Rumi7oF0jQkCvC/BE1drAq2MMrqKDH6c52mWUHOwpGPrL/YTP04ww0sQlXw
         dtfA==
X-Gm-Message-State: AOJu0YzdLHtkDl9tdpF7ktCafS72KOgVUQKJCasUplaYDlZ7K+iUQToO
	k3mCdPkPl1VLQDlulw9pgtH4qvJPVEl6FKx8P+XfegXsgoXAsyUxVwtXMUSfzSe/z3yUQO7FY+z
	WE5EjeDw=
X-Gm-Gg: AeBDieuf2J9il9zWzIr10zl7MTbV4OAcuoMzF3acsIsxgxWKKpZfG4/Nrm5mriK9wQW
	A3BqKY5eS3JwGJOX/5Y+t3jJifINLqX24L26YdBADUWpefNOMyUzIk4SsoZT0rNrofsN6tB80Gz
	w8ZdlywHCIIpDU4yr5Tc2+BNkeJcXoP/9X1937k7Zkjt4cEY6hCavGgXDpEUUhMV9fc6mJ+DJHv
	GxFG4KtRAUCQoZFdKKYeKU93QY+W/Ww7iIh8h8uSV805/FfNJMpB8P5ThF2+OFKz8F0ZniKiwTb
	wnJgnAWSHvl6xhnLHdq3fZoHRMEGZYA1PU3gwOsITTBq+UY/PGIxN15XL4tlBArZ1rTUzoG9k2+
	1uJ9zWJp226PSG0HzjPPJuhwPJu9lp0vEp/K+vEwdG8wudgbiCVTZ5I6Tavb90i13MxNYDsdX8d
	mvsaeS8JgCqhUXNnWYnWQ5LQmshELQZ19jBjoiozAFBY9ebaS6fo8uBvuXape0p75M1YBiRy4B2
	WAGo64Sg5Gr12xGOuHMauAv3w==
X-Received: by 2002:a05:600c:17d8:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48e51f46abemr459455e9.28.1778000326965;
        Tue, 05 May 2026 09:58:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:46 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/23] expat: patch CVE-2026-32776
Date: Tue,  5 May 2026 18:57:22 +0200
Message-ID: <3c4c2ee503f21f1888eeb130ac3150e489f1660e.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236496

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1158
[2] https://security-tracker.debian.org/tracker/CVE-2026-32776

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-32776.patch          | 91 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32776.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32776.patch b/meta/recipes-core/expat/expat/CVE-2026-32776.patch
new file mode 100644
index 0000000000..96a869a7c8
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32776.patch
@@ -0,0 +1,91 @@
+From 3340f971f2f92e499adf03156024105bb9bb7ed9 Mon Sep 17 00:00:00 2001
+From: Francesco Bertolaccini <francesco.bertolaccini@trailofbits.com>
+Date: Tue, 3 Mar 2026 16:41:43 +0100
+Subject: [PATCH] Fix NULL function-pointer dereference for empty external
+ parameter entities
+
+When an external parameter entity with empty text is referenced inside
+an entity declaration value, the sub-parser created to handle it receives
+0 bytes of input.  Processing enters entityValueInitProcessor which calls
+storeEntityValue() with the parser's encoding; since no bytes were ever
+processed, encoding detection has not yet occurred and the encoding is
+still the initial probing encoding set up by XmlInitEncoding().  That
+encoding only populates scanners[] (for prolog and content), not
+literalScanners[].  XmlEntityValueTok() calls through
+literalScanners[XML_ENTITY_VALUE_LITERAL] which is NULL, causing a
+SEGV.
+
+Skip the tokenization loop entirely when entityTextPtr >= entityTextEnd,
+and initialize the `next` pointer before the early exit so that callers
+(callStoreEntityValue) receive a valid value through nextPtr.
+
+CVE: CVE-2026-32776
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5be25657583ea91b09025c858b4785834c20f59c]
+
+(cherry picked from commit 5be25657583ea91b09025c858b4785834c20f59c)
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/xmlparse.c      |  9 ++++++++-
+ tests/basic_tests.c | 19 +++++++++++++++++++
+ 2 files changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index aa5e91e4..56faf2eb 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6777,7 +6777,14 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+       return XML_ERROR_NO_MEMORY;
+   }
+ 
+-  const char *next;
++  const char *next = entityTextPtr;
++
++  /* Nothing to tokenize. */
++  if (entityTextPtr >= entityTextEnd) {
++    result = XML_ERROR_NONE;
++    goto endEntityValue;
++  }
++
+   for (;;) {
+     next
+         = entityTextPtr; /* XmlEntityValueTok doesn't always set the last arg */
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 2a5e43d6..023d9ce4 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -6210,6 +6210,24 @@ START_TEST(test_varying_buffer_fills) {
+ }
+ END_TEST
+ 
++START_TEST(test_empty_ext_param_entity_in_value) {
++  const char *text = "<!DOCTYPE r SYSTEM \"ext.dtd\"><r/>";
++  ExtOption options[] = {
++      {XCS("ext.dtd"), "<!ENTITY % pe SYSTEM \"empty\">"
++                       "<!ENTITY ge \"%pe;\">"},
++      {XCS("empty"), ""},
++      {NULL, NULL},
++  };
++
++  XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
++  XML_SetExternalEntityRefHandler(g_parser, external_entity_optioner);
++  XML_SetUserData(g_parser, options);
++  if (_XML_Parse_SINGLE_BYTES(g_parser, text, (int)strlen(text), XML_TRUE)
++      == XML_STATUS_ERROR)
++    xml_failure(g_parser);
++}
++END_TEST
++
+ void
+ make_basic_test_case(Suite *s) {
+   TCase *tc_basic = tcase_create("basic tests");
+@@ -6456,6 +6474,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_empty_element_abort);
+   tcase_add_test__ifdef_xml_dtd(tc_basic,
+                                 test_pool_integrity_with_unfinished_attr);
++  tcase_add_test__ifdef_xml_dtd(tc_basic, test_empty_ext_param_entity_in_value);
+   tcase_add_test__if_xml_ge(tc_basic, test_entity_ref_no_elements);
+   tcase_add_test__if_xml_ge(tc_basic, test_deep_nested_entity);
+   tcase_add_test__if_xml_ge(tc_basic, test_deep_nested_attribute_entity);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 048093f010..631aebe6ca 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -46,6 +46,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-25210-01.patch \
            file://CVE-2026-25210-02.patch \
            file://CVE-2026-25210-03.patch \
+           file://CVE-2026-32776.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

