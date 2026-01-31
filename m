Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274BDD79750
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5107.1769846223191708592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DvhbyuHP;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-480706554beso30111975e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846221; x=1770451021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bz44zv+pt6Hea2jqAr65Uw/S1kseLGyTuZXhTPDdp10=;
        b=DvhbyuHPikJ7EDxmy2e2SctInRd9lRoWHYr2ctnvTeIULciLQI1JeSsSY57mfE8iLu
         jVl51d3AtfXGNIs3X2twTjULK6k7IcYWJp+H+pAd8dFXBkdHmNBTzLJd+MdB7Fj6bTwc
         IM++3NQ2e8k7f7numxQXZqeHLmxu/dX0wrUAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846221; x=1770451021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bz44zv+pt6Hea2jqAr65Uw/S1kseLGyTuZXhTPDdp10=;
        b=MSpNjejb+WulHUng//UncyofZuxlfIzi2HQ1B8FOwTvkcXgF/ko+A4fLRFdpFhKLBe
         i+p77M2yLi+AjQPezHCdGXlNbHaoGgVk0BY0EF/sfofVMoXlCNtvcBa0B3vJRaDNNagI
         1RRVi99fY9v72dKV2isN4p3vTdav4ZKOnHrs95pdfmliDvpawicUoFZ1ovhb+rPGtLsi
         y2/4h8M/KIFnAmppgie8tD1rHfF55rexOkNnlBWqE0J+jVWhxQPJS4y+H85cC3Ie2s+9
         0ve6MEpwGZhaVPL5rPSJXkXELnlOEUpv3krgVBVX235xTXFloQYU2k2W1KZi1963OtrC
         1o0w==
X-Gm-Message-State: AOJu0YwlaMrJ2ojL6mL0cQJkQ8uRw8ghXVItqKh1FG9p6QVvF0xZpuKy
	bFiO37W/2ciqzspZ3U8mPOxkF42R5SX7ou9QlsK06Y/8wH3rL7Wbfq3Y8Tc1f8azcSBXosxm7k+
	Yp3AFWaQ=
X-Gm-Gg: AZuq6aI+KMzzaEykDHb0EGwAt0vvX15gImgtb49L2l2WObMrItLqGmdZYjzAbAVrqrz
	TencyDt/cfcHADlVtwg7xBOAUjgVF4/j0QGrKbLMH+Ja8dWweNpjFlP3hVA1q13cFvDth2kzCxu
	HKwPJaL4+h6PHHMYQOKDjl5YEclQwIwlEsOsZ6IzmFBLO9sKDNQ+ZBg1KZpH7RbPCLl90LBMGow
	KZWZ7MXiDhPGaTsAIiAcL0hLPAU5QWNQmxBfPLDr31kHmDUe64w0ZsSC1AV5l9OkfWVNlTQdual
	iBbrCohHBdCttHa6fwWPuPomyxfjRx5xCZEqhfbU1B2ZJXnYCRs9hMPpFGteS1EpRnVX+RMzfvy
	couMd/dJrMqH8WbbB6D46wV0X/Yo03l6/BznUfAccZCy9lZat0GFNVpkwCoKMDk4b+lTsLn1NfG
	5L//BJp+ZGa/HNSiZCTIGagkOKs54L1ReXleynL0ZQqm+fLU/pN24r6CUffr3CFN8V22uehoIIV
	pSrv8UesbARCM35
X-Received: by 2002:a05:600c:64c6:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-482db4593a1mr66099415e9.3.1769846221294;
        Fri, 30 Jan 2026 23:57:01 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 11/22] expat: patch CVE-2026-24515
Date: Sat, 31 Jan 2026 08:56:22 +0100
Message-ID: <d23dc023e91c3ed1819abf1282cc301c3b05800c.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230216

From: Peter Marko <peter.marko@siemens.com>

Pick commits from PR linked in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-24515-01.patch       |  43 +++++++
 .../expat/expat/CVE-2026-24515-02.patch       | 117 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.3.bb        |   2 +
 3 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-02.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-24515-01.patch b/meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
new file mode 100644
index 00000000000..c61e49aefdd
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
@@ -0,0 +1,43 @@
+From 86fc914a7acc49246d5fde0ab6ed97eb8a0f15f9 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 18 Jan 2026 17:53:37 +0100
+Subject: [PATCH] lib: Make XML_ExternalEntityParserCreate copy unknown
+ encoding handler user data
+
+Patch suggested by Artiphishell Inc.
+
+CVE: CVE-2026-24515
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/86fc914a7acc49246d5fde0ab6ed97eb8a0f15f9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ expat/lib/xmlparse.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 593cd90d..18577ee3 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1754,6 +1754,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   XML_ExternalEntityRefHandler oldExternalEntityRefHandler;
+   XML_SkippedEntityHandler oldSkippedEntityHandler;
+   XML_UnknownEncodingHandler oldUnknownEncodingHandler;
++  void *oldUnknownEncodingHandlerData;
+   XML_ElementDeclHandler oldElementDeclHandler;
+   XML_AttlistDeclHandler oldAttlistDeclHandler;
+   XML_EntityDeclHandler oldEntityDeclHandler;
+@@ -1799,6 +1800,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   oldExternalEntityRefHandler = parser->m_externalEntityRefHandler;
+   oldSkippedEntityHandler = parser->m_skippedEntityHandler;
+   oldUnknownEncodingHandler = parser->m_unknownEncodingHandler;
++  oldUnknownEncodingHandlerData = parser->m_unknownEncodingHandlerData;
+   oldElementDeclHandler = parser->m_elementDeclHandler;
+   oldAttlistDeclHandler = parser->m_attlistDeclHandler;
+   oldEntityDeclHandler = parser->m_entityDeclHandler;
+@@ -1859,6 +1861,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   parser->m_externalEntityRefHandler = oldExternalEntityRefHandler;
+   parser->m_skippedEntityHandler = oldSkippedEntityHandler;
+   parser->m_unknownEncodingHandler = oldUnknownEncodingHandler;
++  parser->m_unknownEncodingHandlerData = oldUnknownEncodingHandlerData;
+   parser->m_elementDeclHandler = oldElementDeclHandler;
+   parser->m_attlistDeclHandler = oldAttlistDeclHandler;
+   parser->m_entityDeclHandler = oldEntityDeclHandler;
diff --git a/meta/recipes-core/expat/expat/CVE-2026-24515-02.patch b/meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
new file mode 100644
index 00000000000..b160f4f343e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
@@ -0,0 +1,117 @@
+From 8efea3e255d55c7e0a5b70b226f4652ab00e1a27 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 18 Jan 2026 17:26:31 +0100
+Subject: [PATCH] tests: Cover effect of XML_SetUnknownEncodingHandler user
+ data
+
+CVE: CVE-2026-24515
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/8efea3e255d55c7e0a5b70b226f4652ab00e1a27]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/basic_tests.c | 42 +++++++++++++++++++++++++++++++++++++++
+ tests/handlers.c    | 10 ++++++++++
+ tests/handlers.h    |  3 +++
+ 3 files changed, 55 insertions(+)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 0231e094..0ed98d86 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -4570,6 +4570,46 @@ START_TEST(test_unknown_encoding_invalid_attr_value) {
+ }
+ END_TEST
+ 
++START_TEST(test_unknown_encoding_user_data_primary) {
++  // This test is based on ideas contributed by Artiphishell Inc.
++  const char *const text = "<?xml version='1.0' encoding='x-unk'?>\n"
++                           "<root />\n";
++  XML_Parser parser = XML_ParserCreate(NULL);
++  XML_SetUnknownEncodingHandler(parser,
++                                user_data_checking_unknown_encoding_handler,
++                                (void *)(intptr_t)0xC0FFEE);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++              == XML_STATUS_OK);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_unknown_encoding_user_data_secondary) {
++  // This test is based on ideas contributed by Artiphishell Inc.
++  const char *const text_main = "<!DOCTYPE r [\n"
++                                "  <!ENTITY ext SYSTEM 'ext.ent'>\n"
++                                "]>\n"
++                                "<r>&ext;</r>\n";
++  const char *const text_external = "<?xml version='1.0' encoding='x-unk'?>\n"
++                                    "<e>data</e>";
++  ExtTest2 test_data = {text_external, (int)strlen(text_external), NULL, NULL};
++  XML_Parser parser = XML_ParserCreate(NULL);
++  XML_SetExternalEntityRefHandler(parser, external_entity_loader2);
++  XML_SetUnknownEncodingHandler(parser,
++                                user_data_checking_unknown_encoding_handler,
++                                (void *)(intptr_t)0xC0FFEE);
++  XML_SetUserData(parser, &test_data);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, text_main, (int)strlen(text_main),
++                                      XML_TRUE)
++              == XML_STATUS_OK);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ /* Test an external entity parser set to use latin-1 detects UTF-16
+  * BOMs correctly.
+  */
+@@ -6416,6 +6456,8 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_unknown_encoding_invalid_surrogate);
+   tcase_add_test(tc_basic, test_unknown_encoding_invalid_high);
+   tcase_add_test(tc_basic, test_unknown_encoding_invalid_attr_value);
++  tcase_add_test(tc_basic, test_unknown_encoding_user_data_primary);
++  tcase_add_test(tc_basic, test_unknown_encoding_user_data_secondary);
+   tcase_add_test__if_xml_ge(tc_basic, test_ext_entity_latin1_utf16le_bom);
+   tcase_add_test__if_xml_ge(tc_basic, test_ext_entity_latin1_utf16be_bom);
+   tcase_add_test__if_xml_ge(tc_basic, test_ext_entity_latin1_utf16le_bom2);
+diff --git a/tests/handlers.c b/tests/handlers.c
+index 5bca2b1f..d077f688 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -45,6 +45,7 @@
+ #  undef NDEBUG /* because test suite relies on assert(...) at the moment */
+ #endif
+ 
++#include <stdint.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <assert.h>
+@@ -407,6 +408,15 @@ long_encoding_handler(void *userData, const XML_Char *encoding,
+   return XML_STATUS_OK;
+ }
+ 
++int XMLCALL
++user_data_checking_unknown_encoding_handler(void *userData,
++                                            const XML_Char *encoding,
++                                            XML_Encoding *info) {
++  const intptr_t number = (intptr_t)userData;
++  assert_true(number == 0xC0FFEE);
++  return long_encoding_handler(userData, encoding, info);
++}
++
+ /* External Entity Handlers */
+ 
+ int XMLCALL
+diff --git a/tests/handlers.h b/tests/handlers.h
+index fa6267fb..915040e5 100644
+--- a/tests/handlers.h
++++ b/tests/handlers.h
+@@ -159,6 +159,9 @@ extern int XMLCALL long_encoding_handler(void *userData,
+                                          const XML_Char *encoding,
+                                          XML_Encoding *info);
+ 
++extern int XMLCALL user_data_checking_unknown_encoding_handler(
++    void *userData, const XML_Char *encoding, XML_Encoding *info);
++
+ /* External Entity Handlers */
+ 
+ typedef struct ExtOption {
diff --git a/meta/recipes-core/expat/expat_2.7.3.bb b/meta/recipes-core/expat/expat_2.7.3.bb
index 069254e13c3..12ca9b004d2 100644
--- a/meta/recipes-core/expat/expat_2.7.3.bb
+++ b/meta/recipes-core/expat/expat_2.7.3.bb
@@ -10,6 +10,8 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2026-24515-01.patch \
+           file://CVE-2026-24515-02.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

