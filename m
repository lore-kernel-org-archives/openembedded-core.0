Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D148C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 13:58:43 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.5386.1647007122121288437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 05:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22BDwe0v020193
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 05:58:41 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 22BDweew008583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 05:58:40 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 11 Mar 2022 05:58:40 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 11 Mar 2022 05:58:39 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 1/2] expat: fix CVE-2022-25235
Date: Fri, 11 Mar 2022 21:58:34 +0800
Message-ID: <20220311135835.4954-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 13:58:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163054

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2022-25235 for expat.

CVE: CVE-2022-25235

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../expat/expat/CVE-2022-25235.patch          | 261 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |   1 +
 2 files changed, 262 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25235.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-25235.patch b/meta/recipes-core/expat/expat/CVE-2022-25235.patch
new file mode 100644
index 0000000000..9febeae609
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25235.patch
@@ -0,0 +1,261 @@
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/306b721]
+CVE: CVE-2022-25235
+
+The commit is a merge commit, and this patch is created by:
+
+$ git show -m -p --stat 306b72134f157bbfd1637b20a22cabf4acfa136a
+
+Remove modification for expat/Changes which fails to be applied.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+commit 306b72134f157bbfd1637b20a22cabf4acfa136a (from 2cc97e875ef84da4bcf55156c83599116f7523b4)
+Merge: 2cc97e87 c16300f0
+Author: Sebastian Pipping <sebastian@pipping.org>
+Date:   Fri Feb 18 20:12:32 2022 +0100
+
+    Merge pull request #562 from libexpat/utf8-security
+    
+    [CVE-2022-25235] lib: Protect against malformed encoding (e.g. malformed UTF-8)
+---
+ expat/Changes           |   7 ++++
+ expat/lib/xmltok.c      |   5 ---
+ expat/lib/xmltok_impl.c |  18 ++++----
+ expat/tests/runtests.c  | 109 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 127 insertions(+), 12 deletions(-)
+
+diff --git a/lib/xmltok.c b/lib/xmltok.c
+index a72200e8..3bddf125 100644
+--- a/lib/xmltok.c
++++ b/lib/xmltok.c
+@@ -98,11 +98,6 @@
+         + ((((byte)[1]) & 3) << 1) + ((((byte)[2]) >> 5) & 1)]                 \
+    & (1u << (((byte)[2]) & 0x1F)))
+ 
+-#define UTF8_GET_NAMING(pages, p, n)                                           \
+-  ((n) == 2                                                                    \
+-       ? UTF8_GET_NAMING2(pages, (const unsigned char *)(p))                   \
+-       : ((n) == 3 ? UTF8_GET_NAMING3(pages, (const unsigned char *)(p)) : 0))
+-
+ /* Detection of invalid UTF-8 sequences is based on Table 3.1B
+    of Unicode 3.2: http://www.unicode.org/unicode/reports/tr28/
+    with the additional restriction of not allowing the Unicode
+diff --git a/lib/xmltok_impl.c b/lib/xmltok_impl.c
+index 0430591b..84ff35f9 100644
+--- a/lib/xmltok_impl.c
++++ b/lib/xmltok_impl.c
+@@ -69,7 +69,7 @@
+   case BT_LEAD##n:                                                             \
+     if (end - ptr < n)                                                         \
+       return XML_TOK_PARTIAL_CHAR;                                             \
+-    if (! IS_NAME_CHAR(enc, ptr, n)) {                                         \
++    if (IS_INVALID_CHAR(enc, ptr, n) || ! IS_NAME_CHAR(enc, ptr, n)) {         \
+       *nextTokPtr = ptr;                                                       \
+       return XML_TOK_INVALID;                                                  \
+     }                                                                          \
+@@ -98,7 +98,7 @@
+   case BT_LEAD##n:                                                             \
+     if (end - ptr < n)                                                         \
+       return XML_TOK_PARTIAL_CHAR;                                             \
+-    if (! IS_NMSTRT_CHAR(enc, ptr, n)) {                                       \
++    if (IS_INVALID_CHAR(enc, ptr, n) || ! IS_NMSTRT_CHAR(enc, ptr, n)) {       \
+       *nextTokPtr = ptr;                                                       \
+       return XML_TOK_INVALID;                                                  \
+     }                                                                          \
+@@ -1142,6 +1142,10 @@ PREFIX(prologTok)(const ENCODING *enc, const char *ptr, const char *end,
+   case BT_LEAD##n:                                                             \
+     if (end - ptr < n)                                                         \
+       return XML_TOK_PARTIAL_CHAR;                                             \
++    if (IS_INVALID_CHAR(enc, ptr, n)) {                                        \
++      *nextTokPtr = ptr;                                                       \
++      return XML_TOK_INVALID;                                                  \
++    }                                                                          \
+     if (IS_NMSTRT_CHAR(enc, ptr, n)) {                                         \
+       ptr += n;                                                                \
+       tok = XML_TOK_NAME;                                                      \
+@@ -1270,7 +1274,7 @@ PREFIX(attributeValueTok)(const ENCODING *enc, const char *ptr, const char *end,
+     switch (BYTE_TYPE(enc, ptr)) {
+ #  define LEAD_CASE(n)                                                         \
+   case BT_LEAD##n:                                                             \
+-    ptr += n;                                                                  \
++    ptr += n; /* NOTE: The encoding has already been validated. */             \
+     break;
+       LEAD_CASE(2)
+       LEAD_CASE(3)
+@@ -1339,7 +1343,7 @@ PREFIX(entityValueTok)(const ENCODING *enc, const char *ptr, const char *end,
+     switch (BYTE_TYPE(enc, ptr)) {
+ #  define LEAD_CASE(n)                                                         \
+   case BT_LEAD##n:                                                             \
+-    ptr += n;                                                                  \
++    ptr += n; /* NOTE: The encoding has already been validated. */             \
+     break;
+       LEAD_CASE(2)
+       LEAD_CASE(3)
+@@ -1518,7 +1522,7 @@ PREFIX(getAtts)(const ENCODING *enc, const char *ptr, int attsMax,
+       state = inName;                                                          \
+     }
+ #  define LEAD_CASE(n)                                                         \
+-  case BT_LEAD##n:                                                             \
++  case BT_LEAD##n: /* NOTE: The encoding has already been validated. */        \
+     START_NAME ptr += (n - MINBPC(enc));                                       \
+     break;
+       LEAD_CASE(2)
+@@ -1730,7 +1734,7 @@ PREFIX(nameLength)(const ENCODING *enc, const char *ptr) {
+     switch (BYTE_TYPE(enc, ptr)) {
+ #  define LEAD_CASE(n)                                                         \
+   case BT_LEAD##n:                                                             \
+-    ptr += n;                                                                  \
++    ptr += n; /* NOTE: The encoding has already been validated. */             \
+     break;
+       LEAD_CASE(2)
+       LEAD_CASE(3)
+@@ -1775,7 +1779,7 @@ PREFIX(updatePosition)(const ENCODING *enc, const char *ptr, const char *end,
+     switch (BYTE_TYPE(enc, ptr)) {
+ #  define LEAD_CASE(n)                                                         \
+   case BT_LEAD##n:                                                             \
+-    ptr += n;                                                                  \
++    ptr += n; /* NOTE: The encoding has already been validated. */             \
+     pos->columnNumber++;                                                       \
+     break;
+       LEAD_CASE(2)
+diff --git a/tests/runtests.c b/tests/runtests.c
+index bc5344b1..9b155b82 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -5998,6 +5998,105 @@ START_TEST(test_utf8_in_cdata_section_2) {
+ }
+ END_TEST
+ 
++START_TEST(test_utf8_in_start_tags) {
++  struct test_case {
++    bool goodName;
++    bool goodNameStart;
++    const char *tagName;
++  };
++
++  // The idea with the tests below is this:
++  // We want to cover 1-, 2- and 3-byte sequences, 4-byte sequences
++  // go to isNever and are hence not a concern.
++  //
++  // We start with a character that is a valid name character
++  // (or even name-start character, see XML 1.0r4 spec) and then we flip
++  // single bits at places where (1) the result leaves the UTF-8 encoding space
++  // and (2) we stay in the same n-byte sequence family.
++  //
++  // The flipped bits are highlighted in angle brackets in comments,
++  // e.g. "[<1>011 1001]" means we had [0011 1001] but we now flipped
++  // the most significant bit to 1 to leave UTF-8 encoding space.
++  struct test_case cases[] = {
++      // 1-byte UTF-8: [0xxx xxxx]
++      {true, true, "\x3A"},   // [0011 1010] = ASCII colon ':'
++      {false, false, "\xBA"}, // [<1>011 1010]
++      {true, false, "\x39"},  // [0011 1001] = ASCII nine '9'
++      {false, false, "\xB9"}, // [<1>011 1001]
++
++      // 2-byte UTF-8: [110x xxxx] [10xx xxxx]
++      {true, true, "\xDB\xA5"},   // [1101 1011] [1010 0101] =
++                                  // Arabic small waw U+06E5
++      {false, false, "\x9B\xA5"}, // [1<0>01 1011] [1010 0101]
++      {false, false, "\xDB\x25"}, // [1101 1011] [<0>010 0101]
++      {false, false, "\xDB\xE5"}, // [1101 1011] [1<1>10 0101]
++      {true, false, "\xCC\x81"},  // [1100 1100] [1000 0001] =
++                                  // combining char U+0301
++      {false, false, "\x8C\x81"}, // [1<0>00 1100] [1000 0001]
++      {false, false, "\xCC\x01"}, // [1100 1100] [<0>000 0001]
++      {false, false, "\xCC\xC1"}, // [1100 1100] [1<1>00 0001]
++
++      // 3-byte UTF-8: [1110 xxxx] [10xx xxxx] [10xxxxxx]
++      {true, true, "\xE0\xA4\x85"},   // [1110 0000] [1010 0100] [1000 0101] =
++                                      // Devanagari Letter A U+0905
++      {false, false, "\xA0\xA4\x85"}, // [1<0>10 0000] [1010 0100] [1000 0101]
++      {false, false, "\xE0\x24\x85"}, // [1110 0000] [<0>010 0100] [1000 0101]
++      {false, false, "\xE0\xE4\x85"}, // [1110 0000] [1<1>10 0100] [1000 0101]
++      {false, false, "\xE0\xA4\x05"}, // [1110 0000] [1010 0100] [<0>000 0101]
++      {false, false, "\xE0\xA4\xC5"}, // [1110 0000] [1010 0100] [1<1>00 0101]
++      {true, false, "\xE0\xA4\x81"},  // [1110 0000] [1010 0100] [1000 0001] =
++                                      // combining char U+0901
++      {false, false, "\xA0\xA4\x81"}, // [1<0>10 0000] [1010 0100] [1000 0001]
++      {false, false, "\xE0\x24\x81"}, // [1110 0000] [<0>010 0100] [1000 0001]
++      {false, false, "\xE0\xE4\x81"}, // [1110 0000] [1<1>10 0100] [1000 0001]
++      {false, false, "\xE0\xA4\x01"}, // [1110 0000] [1010 0100] [<0>000 0001]
++      {false, false, "\xE0\xA4\xC1"}, // [1110 0000] [1010 0100] [1<1>00 0001]
++  };
++  const bool atNameStart[] = {true, false};
++
++  size_t i = 0;
++  char doc[1024];
++  size_t failCount = 0;
++
++  for (; i < sizeof(cases) / sizeof(cases[0]); i++) {
++    size_t j = 0;
++    for (; j < sizeof(atNameStart) / sizeof(atNameStart[0]); j++) {
++      const bool expectedSuccess
++          = atNameStart[j] ? cases[i].goodNameStart : cases[i].goodName;
++      sprintf(doc, "<%s%s><!--", atNameStart[j] ? "" : "a", cases[i].tagName);
++      XML_Parser parser = XML_ParserCreate(NULL);
++
++      const enum XML_Status status
++          = XML_Parse(parser, doc, (int)strlen(doc), /*isFinal=*/XML_FALSE);
++
++      bool success = true;
++      if ((status == XML_STATUS_OK) != expectedSuccess) {
++        success = false;
++      }
++      if ((status == XML_STATUS_ERROR)
++          && (XML_GetErrorCode(parser) != XML_ERROR_INVALID_TOKEN)) {
++        success = false;
++      }
++
++      if (! success) {
++        fprintf(
++            stderr,
++            "FAIL case %2u (%sat name start, %u-byte sequence, error code %d)\n",
++            (unsigned)i + 1u, atNameStart[j] ? "    " : "not ",
++            (unsigned)strlen(cases[i].tagName), XML_GetErrorCode(parser));
++        failCount++;
++      }
++
++      XML_ParserFree(parser);
++    }
++  }
++
++  if (failCount > 0) {
++    fail("UTF-8 regression detected");
++  }
++}
++END_TEST
++
+ /* Test trailing spaces in elements are accepted */
+ static void XMLCALL
+ record_element_end_handler(void *userData, const XML_Char *name) {
+@@ -6175,6 +6274,14 @@ START_TEST(test_bad_doctype) {
+ }
+ END_TEST
+ 
++START_TEST(test_bad_doctype_utf8) {
++  const char *text = "<!DOCTYPE \xDB\x25"
++                     "doc><doc/>"; // [1101 1011] [<0>010 0101]
++  expect_failure(text, XML_ERROR_INVALID_TOKEN,
++                 "Invalid UTF-8 in DOCTYPE not faulted");
++}
++END_TEST
++
+ START_TEST(test_bad_doctype_utf16) {
+   const char text[] =
+       /* <!DOCTYPE doc [ \x06f2 ]><doc/>
+@@ -11870,6 +11977,7 @@ make_suite(void) {
+   tcase_add_test(tc_basic, test_ext_entity_utf8_non_bom);
+   tcase_add_test(tc_basic, test_utf8_in_cdata_section);
+   tcase_add_test(tc_basic, test_utf8_in_cdata_section_2);
++  tcase_add_test(tc_basic, test_utf8_in_start_tags);
+   tcase_add_test(tc_basic, test_trailing_spaces_in_elements);
+   tcase_add_test(tc_basic, test_utf16_attribute);
+   tcase_add_test(tc_basic, test_utf16_second_attr);
+@@ -11878,6 +11986,7 @@ make_suite(void) {
+   tcase_add_test(tc_basic, test_bad_attr_desc_keyword);
+   tcase_add_test(tc_basic, test_bad_attr_desc_keyword_utf16);
+   tcase_add_test(tc_basic, test_bad_doctype);
++  tcase_add_test(tc_basic, test_bad_doctype_utf8);
+   tcase_add_test(tc_basic, test_bad_doctype_utf16);
+   tcase_add_test(tc_basic, test_bad_doctype_plus);
+   tcase_add_test(tc_basic, test_bad_doctype_star);
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index a851e54b2a..0b3331981c 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
            file://CVE-2021-46143.patch \
            file://CVE-2022-23852.patch \
            file://CVE-2022-23990.patch \
+           file://CVE-2022-25235.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.17.1


