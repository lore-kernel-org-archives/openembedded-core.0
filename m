Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40940C44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2882.1784568225643521369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i/ZxYqhL;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so45663405e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568224; x=1785173024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yppjQ2ELVU4HEeeerX5zvNm7F5Dpu2rH6ipJQGxJfDM=;
        b=i/ZxYqhLJVK1JC8WblT2ByftJKpC22CT0cz7ryCNSDRP2cJBKcExKgHXCOyaot8AVs
         amGwZETWAwC+cqcMM5Zn1th8QLhjN+GohTqH4PfzHo1cux90c+3hHZIrFTlYC3g4qJub
         hZzMm8jIfTDj7TaFelQez1n4NfBt7VCWuPaFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568224; x=1785173024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yppjQ2ELVU4HEeeerX5zvNm7F5Dpu2rH6ipJQGxJfDM=;
        b=HOLCtZ/IdjsiuYQPbZvhy2xyxtbLHmn/0ItPqENc5Mkxo1ycfVxZnwkPeaoRaRQ+IJ
         c1jtGuuHH1CDtamNzSDFAixt4T5SPjuwdVhekORnfu5y6+tMYjSf9gO1YauccvdJdhYb
         ylbM9hKSMx3ZdVFqEQlBvdE6VkL+0hXxUrebTpUGWN1/Q/3APmO+NXt7S84ePzBmumO1
         nO+9LxTYS76ZYjIYnegTgDv9/fUcdt/4lUlDa1BZHatLVaYyQRXRZnntiPWhYYjhdNZN
         pxIZ8kK776POLyc9OlMWLu0QXT6vN31nK5tHHRdU0uWjqrHZ6zmCHWUnk0JV9a4nDbue
         NWMw==
X-Gm-Message-State: AOJu0Yzj2kqrOacl6Uxf5OTXN24uMCrj0SukWWMgNHMn4QfMoXMJUqa1
	K71yzBpsP7k8jrW5YeulZL7/rPlf2r083ath1u7yrcFBSx3hxLF1QYD1qx3Fozh0ukywYHHd00e
	WfWzhguo=
X-Gm-Gg: AfdE7cmwtlQhrkkTO/yY0H3stciegIA4+xdxa1XhWC4kBT9sH68OgS1WQaTyQhIqsrk
	p4bMZkQuZoysujkCc7mryIrkaYGPU/WID5m8yfO0Rpx9Zt0uJKMKgdvcpPUHiF+FflcZ+AZl9+6
	X69BWcZ3nOX3ZQ0hwB5pQlA5jWT5IKYpTRFeNg2b6FY23LrQv0YSvmFDUKBxMtj2IzyEytG17dk
	NuWcqL56QMx+28OvfpuueQyNCdw5sq8ko78l+eYSJ6yIYc3EyRV3qg3Bw9YET2PtBUrj7SFNZHO
	BqnRLfFGW1KL8nhW0IfQOMDOLPYOdOmTu6btYpmg9aBKFqev7O5dno466ZWFB+c03/iVT0512w/
	UW82aDTGATs2npKhyuFTD44XSZ7kmRlofrfPS8qnfrAKsJit0DjkAlUsDw0tHuyePeZspZW7Xny
	3H8Ig71IbXOddGdIXeJCcUK0MAK2xUn2OEdaXZbGqmtTSs1SUPBbd8WIpcwM8WvnH59/DYwX3nY
	qryU0BS
X-Received: by 2002:a05:600c:4f44:b0:495:5b02:23a5 with SMTP id 5b1f17b1804b1-4955b02253amr78129025e9.30.1784568223058;
        Mon, 20 Jul 2026 10:23:43 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/33] expat: patch CVE-2026-45186
Date: Mon, 20 Jul 2026 19:22:54 +0200
Message-ID: <7a9e4a90bd7b1768bb07f9752d2c4847fe799f91.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241455

From: Theo Gaige <tgaige.opensource@witekio.com>

Backport patches from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1216
[2] https://security-tracker.debian.org/tracker/CVE-2026-45186

Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-45186-01.patch       |  70 ++++
 .../expat/expat/CVE-2026-45186-02.patch       | 318 ++++++++++++++++++
 .../expat/expat/CVE-2026-45186-03.patch       |  46 +++
 .../expat/expat/CVE-2026-45186-04.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-05.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-06.patch       |  87 +++++
 .../expat/expat/CVE-2026-45186-07.patch       |  52 +++
 meta/recipes-core/expat/expat_2.6.4.bb        |   7 +
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
index 00000000000..787006c0fdb
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
@@ -0,0 +1,70 @@
+From 3020144133b2d860c44f4eeacf72e5f2843235a3 Mon Sep 17 00:00:00 2001
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
+index 023d9ce..d6edb16 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2439,9 +2439,9 @@ START_TEST(test_attributes) {
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
+@@ -5496,7 +5496,7 @@ START_TEST(test_deep_nested_attribute_entity) {
+            (long unsigned)(N_LINES - 1));
+ 
+   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("foo"), 1, NULL, NULL}, {NULL, 0, NULL, NULL}};
++  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
+   info[0].attributes = doc_info;
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+diff --git a/tests/handlers.c b/tests/handlers.c
+index e658223..9ff7b35 100644
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
+index ac4ca94..11d45eb 100644
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
index 00000000000..fef531a4392
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
@@ -0,0 +1,318 @@
+From ba12af3b3ffd98b9e31c3a01a20d392c89aa974e Mon Sep 17 00:00:00 2001
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
+index d6edb16..907a458 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2462,6 +2462,279 @@ START_TEST(test_attributes) {
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
+@@ -6325,6 +6598,15 @@ make_basic_test_case(Suite *s) {
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
index 00000000000..2afe6dbebc4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
@@ -0,0 +1,46 @@
+From 852ab610685b45c62017556c38096d941c154963 Mon Sep 17 00:00:00 2001
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
+index 907a458..b0178fc 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2439,11 +2439,9 @@ START_TEST(test_attributes) {
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
+@@ -5769,8 +5767,8 @@ START_TEST(test_deep_nested_attribute_entity) {
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
index 00000000000..f4c7733c70d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
@@ -0,0 +1,32 @@
+From 89c6acdcd919b64014b180fadec46b0d25760832 Mon Sep 17 00:00:00 2001
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
+index 9ff7b35..5e72e8b 100644
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
index 00000000000..480f941cb6f
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
@@ -0,0 +1,32 @@
+From d352c83afaa3945c964aba74cb60a00822af96d3 Mon Sep 17 00:00:00 2001
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
+index 9bc67f3..8d3e8db 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7708,8 +7708,9 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
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
index 00000000000..d39eb91f2f1
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
@@ -0,0 +1,87 @@
+From a2c8ddb3d6f4df7af64e05bed4b3a4edeae33fd0 Mon Sep 17 00:00:00 2001
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
+index 8d3e8db..4a29c18 100644
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
+@@ -3844,6 +3845,8 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+                                          sizeof(ELEMENT_TYPE));
+     if (! elementType)
+       return XML_ERROR_NO_MEMORY;
++    if (! elementType->defaultAttsNames.parser)
++      hashTableInit(&(elementType->defaultAttsNames), parser);
+     if (parser->m_ns && ! setElementTypePrefix(parser, elementType))
+       return XML_ERROR_NO_MEMORY;
+   }
+@@ -7549,6 +7552,7 @@ dtdReset(DTD *p, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
++    hashTableDestroy(&(e->defaultAttsNames));
+     if (e->allocDefaultAtts != 0)
+       FREE(parser, e->defaultAtts);
+   }
+@@ -7590,6 +7594,7 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
++    hashTableDestroy(&(e->defaultAttsNames));
+     if (e->allocDefaultAtts != 0)
+       FREE(parser, e->defaultAtts);
+   }
+@@ -7683,6 +7688,10 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
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
+@@ -7719,6 +7728,12 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
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
+@@ -8458,6 +8473,8 @@ getElementType(XML_Parser parser, const ENCODING *enc, const char *ptr,
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
index 00000000000..26c829b5220
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
@@ -0,0 +1,52 @@
+From 0e4829f4be500ce687b37ec82f9650b86c8419c7 Mon Sep 17 00:00:00 2001
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
+index 4a29c18..b3f0b73 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7177,10 +7177,10 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
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
+@@ -7227,6 +7227,12 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
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
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index f5c3e3fdd2f..3581d94fac4 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -54,6 +54,13 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-41080-01.patch \
            file://CVE-2026-41080-02.patch \
            file://CVE-2026-41080-03.patch \
+           file://CVE-2026-45186-01.patch \
+           file://CVE-2026-45186-02.patch \
+           file://CVE-2026-45186-03.patch \
+           file://CVE-2026-45186-04.patch \
+           file://CVE-2026-45186-05.patch \
+           file://CVE-2026-45186-06.patch \
+           file://CVE-2026-45186-07.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

