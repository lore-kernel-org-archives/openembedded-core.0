Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9982D72371
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 20:42:30 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4662.1769373740352514471
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 12:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fh3f9GkI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2026012520421843ed9ded9e00020797-l24fuh@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026012520421843ed9ded9e00020797
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 21:42:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=a40KgI2fD2gSKi/HSUAWW1TR2QpkUsusJc3pRhkFi1s=;
 b=fh3f9GkIACvCFuhKzZ749g4rcQeNlzaL7SGcAMbMbloeQbrcHLThxbYfPWCfg591aqqYMN
 gMLI4vlYAF3N0Vv6GZRBpQcJS04ykqo4gVb/GIjhmYZs/Rz17O5t3OM4QYcsB8B+6l+bqmFq
 cn3r5+8a9nxnNL+CrGBtdc7VvcFvBEJ4lmIUGN2VoL7jpDWj14tQYY6Rjx3vDnSZ4Y4ZrBm4
 Evc9mrps/RsMDsvPt+Vv/sEkW4EO0SW1kcRGEuBiJ9Hzm/iMGZGL19/0zs7/GEGV15T9kLib
 BsGf8uRvv9lWj8GGkstK/ve1OwEE+h+2YAgm04LfN0NXgzzAhirEwdKQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] expat: patch CVE-2026-24515
Date: Sun, 25 Jan 2026 21:35:04 +0100
Message-Id: <20260125203504.120181-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 20:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229951

From: Peter Marko <peter.marko@siemens.com>

Pick commits from PR linked in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

