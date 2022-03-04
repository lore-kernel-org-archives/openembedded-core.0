Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C506C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:04:56 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.7942.1646406295589241111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=E0DetpGQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 195so7747111pgc.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+VIPxverKIPH7mpG29z537Q0uQUlDTlGNDEycqZnj24=;
        b=E0DetpGQjIRC8OmMTD84tyGWSDVRDBmUYyaH6w0Ymp33xe6ymbtZux3bCZIxn3qD6T
         k218f4DpoGAVOax2LurAhlrY67zy4U6pa7N5nMAN2fO988klIhK+62Eik5ofjxnA2UbK
         edO0nj1gdTOdxDyH9MbF1QgOeH1mfjASiBtHjoGatkXuSBcejgtdei02DwxvlW854oej
         jNyPoRYqBLk1aD70FkpSaYEY8Kb6Z+T69CKU3BAD2L9mtwWsyEYbyUoyK7gk3+XK6Nsm
         K+FIFnn9Y3PQgWR4T6VnH/82qkvQ1cAtV09yadXG8iXRrxGk1QmiRzE3aquu28omtfWX
         Q63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+VIPxverKIPH7mpG29z537Q0uQUlDTlGNDEycqZnj24=;
        b=N/NM3rE69sKskWFg2Y4LdsjnviQJPf4rjKH+uZ9ANccRzNqNwwq0EiAmehV7ZrTG24
         FHBhhDZnCaXAqywQ/dGldr6QSdmVxqo36YxUSX69GXp5haQX1NPn+qyAfmgma9Jx/kfP
         wg3SDMwNlFWIcPYiLXN62r1/8tDsLAyRJzkUENsPWtadq8gVQE8rQJlM3q9ezGClNSJj
         GeCzBJCzHgGONSJUzv/HZVw/F9IHpDWM3sKot4jRpr28SN7QNBzTv5jNgyuZ0B9It+cF
         dXf0a9cG1UMwsMQr+is6wlBzBL5iAzmhMeP+7DCYOjn3wugqB4UERHs8xfDceTCAaOn0
         ZitQ==
X-Gm-Message-State: AOAM532AfNOECso6LLObua2XXKFXTnVWVkaGSO4d+f1Btg0jk4q6z3wP
	EyA7NXCtrRR9RSvQ7Ej/DjxIqRfEJlpaCGwZYmU=
X-Google-Smtp-Source: 
 ABdhPJzMQhXSpBateW424KPBVe0+975KrG8iWQ8skXj1CEIWLKwhKsxGsmQudXHepCwX5d97btiswg==
X-Received: by 2002:a63:3d0b:0:b0:37f:ef34:1431 with SMTP id
 k11-20020a633d0b000000b0037fef341431mr87078pga.547.1646406294105;
        Fri, 04 Mar 2022 07:04:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.04.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:04:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/18] expat: fix CVE-2022-25235
Date: Fri,  4 Mar 2022 05:04:12 -1000
Message-Id: 
 <27ab07b1e8caa5c85526eee4a7a3ad0d73326866.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:04:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162723

xmltok_impl.c in Expat (aka libexpat) before 2.4.5 lacks certain
validation of encoding, such as checks for whether a UTF-8 character
is valid in a certain context.

Backport patches from:
https://github.com/libexpat/libexpat/pull/562/commits

CVE: CVE-2022-25235

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2022-25235.patch          | 283 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
 2 files changed, 284 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25235.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-25235.patch b/meta/recipes-core/expat/expat/CVE-2022-25235.patch
new file mode 100644
index 0000000000..be9182a5c1
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25235.patch
@@ -0,0 +1,283 @@
+From ee2a5b50e7d1940ba8745715b62ceb9efd3a96da Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 8 Feb 2022 17:37:14 +0100
+Subject: [PATCH] lib: Drop unused macro UTF8_GET_NAMING
+
+Upstream-Status: Backport
+https://github.com/libexpat/libexpat/pull/562/commits
+
+CVE: CVE-2022-25235
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ expat/lib/xmltok.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/lib/xmltok.c b/lib/xmltok.c
+index a72200e8..3bddf125 100644
+--- a/lib/xmltok.c
++++ b/lib/xmltok.c
+@@ -95,11 +95,6 @@
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
+From 3f0a0cb644438d4d8e3294cd0b1245d0edb0c6c6 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 8 Feb 2022 04:32:20 +0100
+Subject: [PATCH] lib: Add missing validation of encoding (CVE-2022-25235)
+
+---
+ expat/lib/xmltok_impl.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmltok_impl.c b/lib/xmltok_impl.c
+index 0430591b4..64a3b2c15 100644
+--- a/lib/xmltok_impl.c
++++ b/lib/xmltok_impl.c
+@@ -61,7 +61,7 @@
+   case BT_LEAD##n:                                                             \
+     if (end - ptr < n)                                                         \
+       return XML_TOK_PARTIAL_CHAR;                                             \
+-    if (! IS_NAME_CHAR(enc, ptr, n)) {                                         \
++    if (IS_INVALID_CHAR(enc, ptr, n) || ! IS_NAME_CHAR(enc, ptr, n)) {         \
+       *nextTokPtr = ptr;                                                       \
+       return XML_TOK_INVALID;                                                  \
+     }                                                                          \
+@@ -90,7 +90,7 @@
+   case BT_LEAD##n:                                                             \
+     if (end - ptr < n)                                                         \
+       return XML_TOK_PARTIAL_CHAR;                                             \
+-    if (! IS_NMSTRT_CHAR(enc, ptr, n)) {                                       \
++    if (IS_INVALID_CHAR(enc, ptr, n) || ! IS_NMSTRT_CHAR(enc, ptr, n)) {       \
+       *nextTokPtr = ptr;                                                       \
+       return XML_TOK_INVALID;                                                  \
+     }                                                                          \
+@@ -1134,6 +1134,10 @@ PREFIX(prologTok)(const ENCODING *enc, const char *ptr, const char *end,
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
+From c85a3025e7a1be086dc34e7559fbc543914d047f Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 9 Feb 2022 01:00:38 +0100
+Subject: [PATCH] lib: Add comments to BT_LEAD* cases where encoding has
+ already been validated
+
+---
+ expat/lib/xmltok_impl.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/xmltok_impl.c b/lib/xmltok_impl.c
+index 64a3b2c1..84ff35f9 100644
+--- a/lib/xmltok_impl.c
++++ b/lib/xmltok_impl.c
+@@ -1266,7 +1266,7 @@ PREFIX(attributeValueTok)(const ENCODING *enc, const char *ptr, const char *end,
+     switch (BYTE_TYPE(enc, ptr)) {
+ #  define LEAD_CASE(n)                                                         \
+   case BT_LEAD##n:                                                             \
+-    ptr += n;                                                                  \
++    ptr += n; /* NOTE: The encoding has already been validated. */             \
+     break;
+       LEAD_CASE(2)
+       LEAD_CASE(3)
+@@ -1335,7 +1335,7 @@ PREFIX(entityValueTok)(const ENCODING *enc, const char *ptr, const char *end,
+     switch (BYTE_TYPE(enc, ptr)) {
+ #  define LEAD_CASE(n)                                                         \
+   case BT_LEAD##n:                                                             \
+-    ptr += n;                                                                  \
++    ptr += n; /* NOTE: The encoding has already been validated. */             \
+     break;
+       LEAD_CASE(2)
+       LEAD_CASE(3)
+@@ -1514,7 +1514,7 @@ PREFIX(getAtts)(const ENCODING *enc, const char *ptr, int attsMax,
+       state = inName;                                                          \
+     }
+ #  define LEAD_CASE(n)                                                         \
+-  case BT_LEAD##n:                                                             \
++  case BT_LEAD##n: /* NOTE: The encoding has already been validated. */        \
+     START_NAME ptr += (n - MINBPC(enc));                                       \
+     break;
+       LEAD_CASE(2)
+@@ -1726,7 +1726,7 @@ PREFIX(nameLength)(const ENCODING *enc, const char *ptr) {
+     switch (BYTE_TYPE(enc, ptr)) {
+ #  define LEAD_CASE(n)                                                         \
+   case BT_LEAD##n:                                                             \
+-    ptr += n;                                                                  \
++    ptr += n; /* NOTE: The encoding has already been validated. */             \
+     break;
+       LEAD_CASE(2)
+       LEAD_CASE(3)
+@@ -1771,7 +1771,7 @@ PREFIX(updatePosition)(const ENCODING *enc, const char *ptr, const char *end,
+     switch (BYTE_TYPE(enc, ptr)) {
+ #  define LEAD_CASE(n)                                                         \
+   case BT_LEAD##n:                                                             \
+-    ptr += n;                                                                  \
++    ptr += n; /* NOTE: The encoding has already been validated. */             \
+     break;
+       LEAD_CASE(2)
+       LEAD_CASE(3)
+From 6a5510bc6b7efe743356296724e0b38300f05379 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 8 Feb 2022 04:06:21 +0100
+Subject: [PATCH] tests: Cover missing validation of encoding (CVE-2022-25235)
+
+---
+ expat/tests/runtests.c | 109 +++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 109 insertions(+)
+
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
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 4c86f90ef1..e59ff93df0 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2022-22822-27.patch \
            file://CVE-2022-23852.patch \
            file://CVE-2022-23990.patch \
+           file://CVE-2022-25235.patch \
            file://libtool-tag.patch \
          "
 
-- 
2.25.1


