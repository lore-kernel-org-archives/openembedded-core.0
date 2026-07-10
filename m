Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F811C4450F
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1852.1783701425337274502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TeWbaWby;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493ba701891so9982555e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701423; x=1784306223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pFJydgOp+PkWbjJ8RdqdGto70lXvxKY/GwS6+G0ENP8=;
        b=TeWbaWbyhRlENBeAtEssE5VHsQNAuHG5g4Rj/x16ihnI2i5bt0sSy4/cHkKs3piM3L
         eSOZLtZmuY0A8GBtfdxDat7PKByCs9bZRHpMDFZUjDKlbr8HlqWeUbQ2DYyqVU9adQQ3
         vjorGA7xCWobBE/u45JsBqCeSiR2wr8E07mPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701423; x=1784306223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pFJydgOp+PkWbjJ8RdqdGto70lXvxKY/GwS6+G0ENP8=;
        b=hmnIHkGBxcQZXfQPvm0AwfiH7pdOlCBfptuOw9Q9tT5s5icdtYODQB0uef8zeB3dr5
         m7xMlVfCbVCGZyNxNeiKlypHYbBOyeUgfxO8Q5Pwc607ijoQjLqMbWCtBmSsj77prlZp
         4Ly1EF1Ofp5QDy4MeuNt+a47JsFAOBpXXVkgZzDY2JK4+Khc+baxZnNU57QIfWHASfU8
         uqjE99Bpq917naYBuy7f9JWJOOoRnE8FCrt2jKFrrt6Sgq1uys/H/xbowd+xsFsgGTSn
         w65q4na8zjNIgAJ+kGkdlW56W19o9H5iK7oLqf8+6R2Lv+IL9J/zP476/6EBjf/6ywnT
         2VSA==
X-Gm-Message-State: AOJu0YydHd66ctE/oi2NczctPrINCfWzKsXFSvX7UhU/nom11O4iT5VO
	7jb+UMiX2EzBopQhhaH5okAeCmM9+Q32dNTkGl1bqQpeGDWQq/aTpJxp2VpLFd3HwjRTcSv2JOL
	G7YaPCFI=
X-Gm-Gg: AfdE7cmsKmOctLNrLz7vkVv1gNU+inS/U5ZVk4/psZiaKMz2GrkepsGBHZPJ9LAQX+t
	sDSLPFp1aMTslCOnitmJFXOdt/x1WaAVN0B0bv/oZI62oQscwmd09ZibAYWR9UYjl7mox4X+SQ3
	QHhgYM3EOc/SZLh5Gcu/O13YpEZ/8zQ7hWCADkKqj1CwRtF24P/ogZyd7NeDXbPvrgSQzbwRvP2
	69+Q/8yLFOfipJQAgODzYKajNvhD5AQompkiifTYug1NyF94Ai6JfC7Vmffvz9czYNwXH4lwC1G
	aXF0+aCznSW7dTOY5ndnGkasHa8zhMluKOqijp3veCm323WZSjxhb0zEG6Du5C1QLdrjBMmQZGl
	B7Q6ad9y3VwXF9Ph04hC3arBUpFI87qWW7GByUzSJztwhOAgqCT2l5GhHPRWZixo+GyejmlHi08
	nnwHHbENTVTKne7zpwXyO77wPFlvlfzGtR08fRznDhCr5swKCkD1/Bc5ilA64xvVYAVHorOMCTK
	BZ0YKAWfBRYzITU5fE=
X-Received: by 2002:a05:600c:6289:b0:493:b647:1acd with SMTP id 5b1f17b1804b1-493e68dbd98mr121707075e9.36.1783701422995;
        Fri, 10 Jul 2026 09:37:02 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/18] expat: patch CVE-2026-45186
Date: Fri, 10 Jul 2026 18:36:18 +0200
Message-ID: <fa8ad49818da9faf2428a62f9d127dc22f0db252.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240664

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patches from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1216

[2] https://security-tracker.debian.org/tracker/CVE-2026-45186

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-45186-01.patch       |  70 ++++
 .../expat/expat/CVE-2026-45186-02.patch       | 318 ++++++++++++++++++
 .../expat/expat/CVE-2026-45186-03.patch       |  46 +++
 .../expat/expat/CVE-2026-45186-04.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-05.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-06.patch       |  87 +++++
 .../expat/expat/CVE-2026-45186-07.patch       |  52 +++
 meta/recipes-core/expat/expat_2.7.5.bb        |   7 +
 8 files changed, 644 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
new file mode 100644
index 00000000000..478978f4ca2
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
@@ -0,0 +1,70 @@
+From b659bf974f29b991870ba1f66af687c73e07fbf8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@siemens.com>
+Date: Fri, 13 Mar 2026 13:26:45 +0100
+Subject: [PATCH 1/7] Make "counting_start_element_handler" count default attrs
+
+(cherry picked from commit 0802a5892030610144b736dec6e2f63e8600fe85)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/0802a5892030610144b736dec6e2f63e8600fe85]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 8 ++++----
+ tests/handlers.c    | 2 +-
+ tests/handlers.h    | 1 +
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 02d1d5f..8c025a2 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2466,9 +2466,9 @@ START_TEST(test_attributes) {
+                          {XCS("id"), XCS("one")},
+                          {NULL, NULL}};
+   AttrInfo tag_info[] = {{XCS("c"), XCS("3")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("doc"), 3, XCS("id"), NULL},
+-                        {XCS("tag"), 1, NULL, NULL},
+-                        {NULL, 0, NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), NULL},
++                        {XCS("tag"), 1, 0, NULL, NULL},
++                        {NULL, 0, 0, NULL, NULL}};
+   info[0].attributes = doc_info;
+   info[1].attributes = tag_info;
+ 
+@@ -5543,7 +5543,7 @@ START_TEST(test_deep_nested_attribute_entity) {
+            (long unsigned)(N_LINES - 1));
+ 
+   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("foo"), 1, NULL, NULL}, {NULL, 0, NULL, NULL}};
++  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
+   info[0].attributes = doc_info;
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+diff --git a/tests/handlers.c b/tests/handlers.c
+index e456df2..bd1b54e 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -137,7 +137,7 @@ counting_start_element_handler(void *userData, const XML_Char *name,
+     fail("ID does not have the correct name");
+     return;
+   }
+-  for (i = 0; i < info->attr_count; i++) {
++  for (i = 0; i < info->attr_count + info->default_attr_count; i++) {
+     attr = info->attributes;
+     while (attr->name != NULL) {
+       if (! xcstrcmp(atts[0], attr->name))
+diff --git a/tests/handlers.h b/tests/handlers.h
+index fcde27a..27a53f2 100644
+--- a/tests/handlers.h
++++ b/tests/handlers.h
+@@ -88,6 +88,7 @@ typedef struct attrInfo {
+ typedef struct elementInfo {
+   const XML_Char *name;
+   int attr_count;
++  int default_attr_count;
+   const XML_Char *id_name;
+   AttrInfo *attributes;
+ } ElementInfo;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
new file mode 100644
index 00000000000..6c90e15b47d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
@@ -0,0 +1,318 @@
+From 32848241057dfaa4c68fae475f51fbe1a182c004 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@siemens.com>
+Date: Fri, 13 Mar 2026 13:27:31 +0100
+Subject: [PATCH 2/7] test(attlist): Cover duplicate attribute names
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+(cherry picked from commit e569f47181c43dca5d262089e541ddf9a9c09927)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/e569f47181c43dca5d262089e541ddf9a9c09927]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 282 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 282 insertions(+)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 8c025a2..83c453c 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2489,6 +2489,279 @@ START_TEST(test_attributes) {
+ }
+ END_TEST
+ 
++START_TEST(test_duplicate_cdata_attribute) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc attribute CDATA 'expected' attribute CDATA 'ignored'>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_1) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc identifier CDATA 'expected' identifier ID #REQUIRED>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("identifier"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_2) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc identifier ID #REQUIRED identifier CDATA 'unexpected'>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{NULL, NULL}};
++
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc attribute CDATA 'expected'>\n"
++                     "  <!ATTLIST doc attribute CDATA 'ignored'>\n"
++                     "]>\n"
++                     "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_2) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
++                     "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
++                     "  <!ATTLIST doc attribute CDATA 'ignored_doc'>\n"
++                     "]>\n"
++                     "<doc><tag></tag></doc>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected_doc")}, {NULL, NULL}};
++  AttrInfo tag_info[] = {{XCS("attribute"), XCS("expected_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 0, 1, NULL, doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_3) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
++        "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
++        "  <!ATTLIST doc second_attribute CDATA 'second_expected_doc' attribute CDATA 'ignored_doc'>\n"
++        "]>\n"
++        "<doc><tag></tag></doc>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected_doc")},
++                         {XCS("second_attribute"), XCS("second_expected_doc")},
++                         {NULL, NULL}};
++  AttrInfo tag_info[] = {{XCS("attribute"), XCS("expected_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 0, 2, NULL, doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_multiple_attlistdecl) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc identifier ID #REQUIRED>\n"
++                     "  <!ATTLIST tag identifier CDATA 'identifier_tag'>\n"
++                     "  <!ATTLIST doc identifier CDATA 'ignored'>\n"
++                     "]>\n"
++                     "<doc identifier='doc_identity'><tag></tag></doc>\n";
++  AttrInfo doc_info[]
++      = {{XCS("identifier"), XCS("doc_identity")}, {NULL, NULL}};
++  AttrInfo tag_info[]
++      = {{XCS("identifier"), XCS("identifier_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 1, 0, XCS("identifier"), doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ /* Test reset works correctly in the middle of processing an internal
+  * entity.  Exercises some obscure code in XML_ParserReset().
+  */
+@@ -6374,6 +6647,15 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test__ifdef_xml_dtd(tc_basic, test_empty_foreign_dtd);
+   tcase_add_test(tc_basic, test_set_base);
+   tcase_add_test(tc_basic, test_attributes);
++  tcase_add_test(tc_basic, test_duplicate_cdata_attribute);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_1);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_2);
++  tcase_add_test(tc_basic, test_duplicate_cdata_attribute_multiple_attlistdecl);
++  tcase_add_test(tc_basic,
++                 test_duplicate_cdata_attribute_multiple_attlistdecl_2);
++  tcase_add_test(tc_basic,
++                 test_duplicate_cdata_attribute_multiple_attlistdecl_3);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_multiple_attlistdecl);
+   tcase_add_test__if_xml_ge(tc_basic, test_reset_in_entity);
+   tcase_add_test(tc_basic, test_resume_invalid_parse);
+   tcase_add_test(tc_basic, test_resume_resuspended);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
new file mode 100644
index 00000000000..f3b0614b8df
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
@@ -0,0 +1,46 @@
+From 468d6f44264e7ad73f3045f6487baccc846014e6 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 20 Apr 2026 13:44:43 +0200
+Subject: [PATCH 3/7] tests: Define .attributes the first time around
+
+(cherry picked from commit 05307d352a5aa858cdda57ec53a53b597b3a4a82)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/05307d352a5aa858cdda57ec53a53b597b3a4a82]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 83c453c..810ff5e 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2466,11 +2466,9 @@ START_TEST(test_attributes) {
+                          {XCS("id"), XCS("one")},
+                          {NULL, NULL}};
+   AttrInfo tag_info[] = {{XCS("c"), XCS("3")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), NULL},
+-                        {XCS("tag"), 1, 0, NULL, NULL},
++  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), doc_info},
++                        {XCS("tag"), 1, 0, NULL, tag_info},
+                         {NULL, 0, 0, NULL, NULL}};
+-  info[0].attributes = doc_info;
+-  info[1].attributes = tag_info;
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+   assert_true(parser != NULL);
+@@ -5816,8 +5814,8 @@ START_TEST(test_deep_nested_attribute_entity) {
+            (long unsigned)(N_LINES - 1));
+ 
+   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
+-  info[0].attributes = doc_info;
++  ElementInfo info[]
++      = {{XCS("foo"), 1, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+   ParserAndElementInfo parserPlusElemenInfo = {parser, info};
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
new file mode 100644
index 00000000000..d30ffa3f512
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
@@ -0,0 +1,32 @@
+From 0582bcabb773d4600d7c85516132b016f0163deb Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 13 Apr 2026 01:34:03 +0200
+Subject: [PATCH 4/7] tests: Make counting_start_element_handler enforce
+ complete attribute lists
+
+(cherry picked from commit 4176aff73840711060913e0ac6aa1168d8ba5c8d)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/4176aff73840711060913e0ac6aa1168d8ba5c8d]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/handlers.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/handlers.c b/tests/handlers.c
+index bd1b54e..8cda3a8 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -155,6 +155,9 @@ counting_start_element_handler(void *userData, const XML_Char *name,
+     /* Remember, two entries in atts per attribute (see above) */
+     atts += 2;
+   }
++
++  // Self-test that the test case's list of expected attributes is complete
++  assert_true(atts[0] == NULL);
+ }
+ 
+ void XMLCALL
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
new file mode 100644
index 00000000000..6d98a3cd091
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
@@ -0,0 +1,32 @@
+From ebe5486739006105629b0bca6022f664566e56de Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 22:14:41 +0100
+Subject: [PATCH 5/7] lib: Extract a constant for upcoming reuse
+
+(cherry picked from commit fb35f2d2040d114f355bae8a7450942533237530)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/fb35f2d2040d114f355bae8a7450942533237530]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 0248b66..e833520 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7719,8 +7719,9 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+       newE->prefix = (PREFIX *)lookup(oldParser, &(newDtd->prefixes),
+                                       oldE->prefix->name, 0);
+     for (i = 0; i < newE->nDefaultAtts; i++) {
++      const XML_Char *const attributeName = oldE->defaultAtts[i].id->name;
+       newE->defaultAtts[i].id = (ATTRIBUTE_ID *)lookup(
+-          oldParser, &(newDtd->attributeIds), oldE->defaultAtts[i].id->name, 0);
++          oldParser, &(newDtd->attributeIds), attributeName, 0);
+       newE->defaultAtts[i].isCdata = oldE->defaultAtts[i].isCdata;
+       if (oldE->defaultAtts[i].value) {
+         newE->defaultAtts[i].value
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
new file mode 100644
index 00000000000..1b47776a172
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
@@ -0,0 +1,87 @@
+From 41f9f3c8479e8f8547d5bce6355b0484c2744d1e Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 23:05:49 +0100
+Subject: [PATCH 6/7] lib: Introduce ELEMENT_TYPE.defaultAttsNames
+
+(cherry picked from commit 7f0f1b9e70d937072d2e9e37ae9edf27784cc080)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/7f0f1b9e70d937072d2e9e37ae9edf27784cc080]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e833520..b7e2d72 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -388,6 +388,7 @@ typedef struct {
+   int nDefaultAtts;
+   int allocDefaultAtts;
+   DEFAULT_ATTRIBUTE *defaultAtts;
++  HASH_TABLE defaultAttsNames;
+ } ELEMENT_TYPE;
+ 
+ typedef struct {
+@@ -3853,6 +3854,8 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+                                          sizeof(ELEMENT_TYPE));
+     if (! elementType)
+       return XML_ERROR_NO_MEMORY;
++    if (! elementType->defaultAttsNames.parser)
++      hashTableInit(&(elementType->defaultAttsNames), parser);
+     if (parser->m_ns && ! setElementTypePrefix(parser, elementType))
+       return XML_ERROR_NO_MEMORY;
+   }
+@@ -7561,6 +7564,7 @@ dtdReset(DTD *p, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
++    hashTableDestroy(&(e->defaultAttsNames));
+     if (e->allocDefaultAtts != 0)
+       FREE(parser, e->defaultAtts);
+   }
+@@ -7602,6 +7606,7 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
++    hashTableDestroy(&(e->defaultAttsNames));
+     if (e->allocDefaultAtts != 0)
+       FREE(parser, e->defaultAtts);
+   }
+@@ -7695,6 +7700,10 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+                                   sizeof(ELEMENT_TYPE));
+     if (! newE)
+       return 0;
++
++    if (! newE->defaultAttsNames.parser)
++      hashTableInit(&(newE->defaultAttsNames), parser);
++
+     if (oldE->nDefaultAtts) {
+       /* Detect and prevent integer overflow.
+        * The preprocessor guard addresses the "always false" warning
+@@ -7730,6 +7739,12 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+           return 0;
+       } else
+         newE->defaultAtts[i].value = NULL;
++
++      NAMED *const nameAddedOrFound = (NAMED *)lookup(
++          parser, &(newE->defaultAttsNames), attributeName, sizeof(NAMED));
++      if (! nameAddedOrFound) {
++        return 0;
++      }
+     }
+   }
+ 
+@@ -8474,6 +8489,8 @@ getElementType(XML_Parser parser, const ENCODING *enc, const char *ptr,
+                                sizeof(ELEMENT_TYPE));
+   if (! ret)
+     return NULL;
++  if (! ret->defaultAttsNames.parser)
++    hashTableInit(&(ret->defaultAttsNames), getRootParserOf(parser, NULL));
+   if (ret->name != name)
+     poolDiscard(&dtd->pool);
+   else {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
new file mode 100644
index 00000000000..5551d10243c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
@@ -0,0 +1,52 @@
+From 141a3c12639f9a4066293e81dbedde4c15b0881f Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 23:06:29 +0100
+Subject: [PATCH 7/7] lib: Leverage ELEMENT_TYPE.defaultAttsNames for attribute
+ collision detection
+
+.. to resolve quadratic runtime behavior
+
+(cherry picked from commit 4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index b7e2d72..04195cb 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7189,10 +7189,10 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+   if (value || isId) {
+     /* The handling of default attributes gets messed up if we have
+        a default which duplicates a non-default. */
+-    int i;
+-    for (i = 0; i < type->nDefaultAtts; i++)
+-      if (attId == type->defaultAtts[i].id)
+-        return 1;
++    NAMED *const nameFound
++        = (NAMED *)lookup(parser, &(type->defaultAttsNames), attId->name, 0);
++    if (nameFound)
++      return 1;
+     if (isId && ! type->idAtt && ! attId->xmlns)
+       type->idAtt = attId;
+   }
+@@ -7239,6 +7239,12 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+   att->isCdata = isCdata;
+   if (! isCdata)
+     attId->maybeTokenized = XML_TRUE;
++
++  NAMED *const nameAddedOrFound = (NAMED *)lookup(
++      parser, &(type->defaultAttsNames), attId->name, sizeof(NAMED));
++  if (! nameAddedOrFound)
++    return 0;
++
+   type->nDefaultAtts += 1;
+   return 1;
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 4f2578292d9..210398fb505 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -10,6 +10,13 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2026-45186-01.patch \
+           file://CVE-2026-45186-02.patch \
+           file://CVE-2026-45186-03.patch \
+           file://CVE-2026-45186-04.patch \
+           file://CVE-2026-45186-05.patch \
+           file://CVE-2026-45186-06.patch \
+           file://CVE-2026-45186-07.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

