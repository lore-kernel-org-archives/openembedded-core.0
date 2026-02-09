Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD52AEE6B6F
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:26 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44195.1770629361922066942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EqhPZ+/3;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4376acce52eso628402f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629360; x=1771234160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BYxvOXdbU7E+ni8TwXzoDwwFG0g1UcS4YuGV08PV/uo=;
        b=EqhPZ+/3wwGFQxgIqP0qSI5Agh1d8gUOuFb6P8U9r0a3ID1qzauKQdq4+rox4phnuA
         jxhIIZ3eG3sikl2MdW0Mu5RrgeO2zoab835MKAaEDyE9+yPXMwyc+cTVxl0Gv/SeoHFT
         PraGYKfv36cPfPQZVX8Ub2oQF9fsuJeRfBAx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629360; x=1771234160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BYxvOXdbU7E+ni8TwXzoDwwFG0g1UcS4YuGV08PV/uo=;
        b=DBRA7GbORZFRxCNpmNtPuoPEw9y9E+ZwgOO+edHnDhcqj4e/OZ/zWkpeBmyoEO/jkW
         Y4CerGzx4gn1wB1tuQTuoaACslZgBUOqjLQc0AdA5F+PDjF6bGUZL6AxkZF82fW2l3yt
         mvQLlTASaUoahQdDlwABOjm+P5/9S8zZShsMiVdLyrwbeO2yZIuC1LODId1CsG468lWD
         +EB2nPBwTAQInGDqKAVYiQQDPBqiw47Ddd93X1y5HiS7dk3ju+THoGvWd56tZp2L3vdJ
         x4NAVMzcRPT0VIweiCW/B9PWFUolNiVgBbISJRCHUD43/TBgPv9opgyxxZwyoUYBGfkG
         fPdw==
X-Gm-Message-State: AOJu0YyuOG4ZUQK3y7OrTaondjErQ/VnET0MDTybwzJW61KnBKPe+J3z
	IQHUe9v7kfwIX887HlX+TZMQaevvzQ2RP8vclsczvoih6fhORQACSJGI9GpAv2f26ZBqpqzhd32
	zYxiWO/w=
X-Gm-Gg: AZuq6aI1Pb6hdMS0/fWsT4S1QHtgdlYjwceLywa/N0ghoZqEfN4kFdfYxJiM6PryAKz
	0AH6c31nXkDMm8R9TFRLS9++LOHb0ChmJON7e/EX+ISsXjv9jjoiWKbIDudNMkmJJVD0PQcOeE0
	Kpduy4KivX7zQA3iAGh/v42sZJBYAZpfAhgPxIkjAYtVVLnmXFwnIa/bxUvoS1qm1cZaW4/i3oV
	dMARe5MQABiLfA5n3kcu++omZIg2gvxVcJT7d9sxy2bU+qoB0D55XoyYkAFDceyAYXcU5Bxuj/o
	CNHbflC4vJESkTYNESr2WVYNLWvSua/BOGZq81hudXUz5HrsnK2kgMHa+E8G2Pb7XM3o5cJgXqM
	kedqjMvWtXI6EZ4Rzd7osnt34MAfwIdDG6Ckzy8l4keIuE1jMrzuAO2u/4RhCNxUJ5B9aAmVuFH
	otBydK2Zxmj+RsSDwtfomTmcb4j++ZSEykMh+jQRx2+1GQLkxKcd0V9mgPwWYfJQEiJUZ1BLWBp
	+aPxTKonCaURwgtxr7JF6S9Hw==
X-Received: by 2002:a05:6000:4284:b0:435:a2f8:150d with SMTP id ffacd0b85a97d-43629385b15mr14019476f8f.59.1770629359843;
        Mon, 09 Feb 2026 01:29:19 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/25] expat: patch CVE-2026-24515
Date: Mon,  9 Feb 2026 10:28:46 +0100
Message-ID: <45b5a511c828835c023e7888874877c0ebfd7b13.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230754

From: Peter Marko <peter.marko@siemens.com>

Pick commits from PR linked in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-24515-01.patch       |  43 +++++++
 .../expat/expat/CVE-2026-24515-02.patch       | 117 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |   2 +
 3 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-02.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-24515-01.patch b/meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
new file mode 100644
index 00000000000..0250374c76b
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
+ lib/xmlparse.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 593cd90d..18577ee3 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1749,6 +1749,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   XML_ExternalEntityRefHandler oldExternalEntityRefHandler;
+   XML_SkippedEntityHandler oldSkippedEntityHandler;
+   XML_UnknownEncodingHandler oldUnknownEncodingHandler;
++  void *oldUnknownEncodingHandlerData;
+   XML_ElementDeclHandler oldElementDeclHandler;
+   XML_AttlistDeclHandler oldAttlistDeclHandler;
+   XML_EntityDeclHandler oldEntityDeclHandler;
+@@ -1794,6 +1795,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   oldExternalEntityRefHandler = parser->m_externalEntityRefHandler;
+   oldSkippedEntityHandler = parser->m_skippedEntityHandler;
+   oldUnknownEncodingHandler = parser->m_unknownEncodingHandler;
++  oldUnknownEncodingHandlerData = parser->m_unknownEncodingHandlerData;
+   oldElementDeclHandler = parser->m_elementDeclHandler;
+   oldAttlistDeclHandler = parser->m_attlistDeclHandler;
+   oldEntityDeclHandler = parser->m_entityDeclHandler;
+@@ -1854,6 +1856,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   parser->m_externalEntityRefHandler = oldExternalEntityRefHandler;
+   parser->m_skippedEntityHandler = oldSkippedEntityHandler;
+   parser->m_unknownEncodingHandler = oldUnknownEncodingHandler;
++  parser->m_unknownEncodingHandlerData = oldUnknownEncodingHandlerData;
+   parser->m_elementDeclHandler = oldElementDeclHandler;
+   parser->m_attlistDeclHandler = oldAttlistDeclHandler;
+   parser->m_entityDeclHandler = oldEntityDeclHandler;
diff --git a/meta/recipes-core/expat/expat/CVE-2026-24515-02.patch b/meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
new file mode 100644
index 00000000000..7d6758fe095
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
+@@ -4527,6 +4527,46 @@ START_TEST(test_unknown_encoding_invalid_attr_value) {
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
+@@ -6372,6 +6412,8 @@ make_basic_test_case(Suite *s) {
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
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 1d2d818ecf7..a61357e6c14 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -41,6 +41,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2025-59375-22.patch \
            file://CVE-2025-59375-23.patch \
            file://CVE-2025-59375-24.patch \
+           file://CVE-2026-24515-01.patch \
+           file://CVE-2026-24515-02.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

