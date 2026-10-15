Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1C2CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32827.1792040636725313565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JsbIdl9X;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ff680331aso17741665e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040635; x=1792645435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Bkyt2khnodyEBG7zKiI+Jz44B9lsc08qb0A16lEuSo=;
        b=JsbIdl9X0PhBSfLvKQF9o09nDiOBdzsa6aklu4G2LMvMJdmnVqX2txEMUQyZp/yDn2
         4S8D0oSQP+s9Ub3KjWcGRGN22hCjb3hJP3KomID84P18urUmRcJVfceMxayTuoeo47yD
         O5q8H+6QsW6WxTyaVyFaaMv58DXGiT2tf2CGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040635; x=1792645435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9Bkyt2khnodyEBG7zKiI+Jz44B9lsc08qb0A16lEuSo=;
        b=GhrQOZOMht4DWC+2yOkQZfTxy7Q2dbhxrwqVQJvi0qa5pmD4kX2vjf7FU7wpLWeBib
         gs3Ge5905y/7NTFlKAX4fgfNOGYTjaEsq6Z68HQRmkQrfUwXk3tlMAlkOaAQs6s7U8mT
         A7iOT8MkgKvd8M9P0p+LDuyCBjgY/mZNW5D2D5HkYa/jsSYw4HSxic5Z317G2iyPKTbo
         EK7h4nogrl1M83jeu5VL3135En1XIXITIodxHZbK481Or1MXGdH3OcVscSczREscnSMz
         jpmOagD6JThI+ugRd+e7OsKC5M1ISlYMgXMTInYrE/KSZjDBynQxQ/o9B8J7ryn1VlLJ
         K7xg==
X-Gm-Message-State: AFq9FYJCDdtyLvw7/ZcOGiPJw+yhwj1nnG2sIeJcnjUpOYpug5Z+CHQz
	b6TrRUpxbjhWQh4ihFknsey8U4D3v2FAxnjS2ST8bF/twJc5jOLqsMbPuSfFDG7FICPbMFnKr+2
	tWP+YLa8=
X-Gm-Gg: AYBFou0+FpERuiN+ihqXZfldORAzhHzceCg4Kh3N93m9rwFcpgeMfenzxCubzVCRxbm
	nFLp6DvJEqZH4LgkW0O/xlmpI+2MJB9Gd5NW23/euZ0lOY5kvjHNJVPYTeYVVNdNW4og69R6mgP
	9IwXdLg5oQECswcbZDAaNAmghEvtBYcKIbvqo0OH+RUP7yrqkGffOO3tRZYoQM9DUs+BHskLI0e
	I8zCIjG1ihCOnkxn/ANB5D0T7dJOybci3r9avVP1akvh7TobApYKDtTNboMELSJd3fQB4wbg4eo
	BJ4n+MCIWCrU7BXqlpDYCrmjSJSxmzt4xDuzJdhBNWkxZmHJgJJjM+IQfoNxM4Wu6dr/poGBDHy
	UBQb1uVQbIfPhqAaTpeow9b70qxSBrE7z8Ft6wuuh8lZ1B7uzQkQP1PSiOobL1zSsCTRru0ruaf
	+CuUcs/dBMSLqN5kSSAL5+Lgyh2wonieXG//HG0VuxEpWmwtfAhlMnFdGqf/EAQIVaUqOqlUUIk
	xNMokGp/ecEPhlKiZN1FaR8d0VYSy1wXkIfUR3dqAg4V93DnWs/G/XBma/pniiA6pJnMj6dBA==
X-Received: by 2002:a05:600c:871b:b0:4a1:a2f3:e6f7 with SMTP id 5b1f17b1804b1-4a1a2f3e8a9mr213782175e9.29.1792040634795;
        Wed, 14 Oct 2026 22:03:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/55] expat: patch CVE-2026-76957
Date: Thu, 15 Oct 2026 07:02:48 +0200
Message-ID: <51aa92d8ab453295bc6c6d9c92af12c2baa56c69.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247823

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-76957

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-76957-01.patch       | 121 ++++++++++++++++++
 .../expat/expat/CVE-2026-76957-02.patch       |  85 ++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |   2 +
 3 files changed, 208 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76957-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76957-02.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-76957-01.patch b/meta/recipes-core/expat/expat/CVE-2026-76957-01.patch
new file mode 100644
index 00000000000..fb7a8e0b022
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-76957-01.patch
@@ -0,0 +1,121 @@
+From 127b7d4beb8fe7e5ce5cb021c2e56379c95863d0 Mon Sep 17 00:00:00 2001
+From: Darren Carreras <carrerasdarren@gmail.com>
+Date: Mon, 17 Aug 2026 21:16:00 -0400
+Subject: [PATCH] Protect custom encoding callbacks from parser reentry
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2026-76957
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/127b7d4beb8fe7e5ce5cb021c2e56379c95863d0]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 49 ++++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 40 insertions(+), 9 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e5242480..4f9dcbb6 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -771,6 +771,8 @@ struct XML_ParserStruct {
+   void *m_unknownEncodingMem;
+   void *m_unknownEncodingData;
+   void *m_unknownEncodingHandlerData;
++  // Application callback invoked by callUnknownEncodingConvert.
++  int(XMLCALL *m_unknownEncodingConvert)(void *, const char *);
+   void(XMLCALL *m_unknownEncodingRelease)(void *);
+   PROLOG_STATE m_prologState;
+   Processor *m_processor;
+@@ -1193,6 +1195,25 @@ isCalledFromInsideHandler(XML_Parser parser) {
+   return parser->m_handlerCallDepth > 0;
+ }
+ 
++static void
++callUnknownEncodingRelease(XML_Parser parser) {
++  beforeHandler(parser);
++  parser->m_unknownEncodingRelease(parser->m_unknownEncodingData);
++  afterHandler(parser);
++  parser->m_unknownEncodingRelease = NULL;
++  parser->m_unknownEncodingData = NULL;
++}
++
++static int XMLCALL
++callUnknownEncodingConvert(void *data, const char *p) {
++  XML_Parser parser = data;
++  beforeHandler(parser);
++  const int result
++      = parser->m_unknownEncodingConvert(parser->m_unknownEncodingData, p);
++  afterHandler(parser);
++  return result;
++}
++
+ static enum XML_Error
+ callProcessor(XML_Parser parser, const char *start, const char *end,
+               const char **endPtr) {
+@@ -1540,6 +1561,7 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
+   parser->m_inheritedBindings = NULL;
+   parser->m_nSpecifiedAtts = 0;
+   parser->m_unknownEncodingMem = NULL;
++  parser->m_unknownEncodingConvert = NULL;
+   parser->m_unknownEncodingRelease = NULL;
+   parser->m_unknownEncodingData = NULL;
+   parser->m_parsingStatus.parsing = XML_INITIALIZED;
+@@ -1620,7 +1642,7 @@ XML_ParserReset(XML_Parser parser, const XML_Char *encodingName) {
+   moveToFreeBindingList(parser, parser->m_inheritedBindings);
+   FREE(parser, parser->m_unknownEncodingMem);
+   if (parser->m_unknownEncodingRelease)
+-    parser->m_unknownEncodingRelease(parser->m_unknownEncodingData);
++    callUnknownEncodingRelease(parser);
+   poolClear(&parser->m_tempPool);
+   poolClear(&parser->m_temp2Pool);
+   FREE(parser, (void *)parser->m_protocolEncodingName);
+@@ -1931,7 +1953,7 @@ XML_ParserFree(XML_Parser parser) {
+   FREE(parser, parser->m_nsAtts);
+   FREE(parser, parser->m_unknownEncodingMem);
+   if (parser->m_unknownEncodingRelease)
+-    parser->m_unknownEncodingRelease(parser->m_unknownEncodingData);
++    callUnknownEncodingRelease(parser);
+   FREE(parser, parser);
+ }
+ 
+@@ -4965,25 +4987,34 @@ handleUnknownEncoding(XML_Parser parser, const XML_Char *encodingName) {
+     const int status = parser->m_unknownEncodingHandler(
+         parser->m_unknownEncodingHandlerData, encodingName, &info);
+     afterHandler(parser);
++
++    parser->m_unknownEncodingRelease = info.release;
++    parser->m_unknownEncodingData = info.data;
++
+     if (status) {
+       ENCODING *enc;
+       parser->m_unknownEncodingMem = MALLOC(parser, XmlSizeOfUnknownEncoding());
+       if (! parser->m_unknownEncodingMem) {
+-        if (info.release)
+-          info.release(info.data);
++        if (parser->m_unknownEncodingRelease)
++          callUnknownEncodingRelease(parser);
++        else
++          parser->m_unknownEncodingData = NULL;
+         return XML_ERROR_NO_MEMORY;
+       }
++      parser->m_unknownEncodingConvert = info.convert;
+       enc = (parser->m_ns ? XmlInitUnknownEncodingNS : XmlInitUnknownEncoding)(
+-          parser->m_unknownEncodingMem, info.map, info.convert, info.data);
++          parser->m_unknownEncodingMem, info.map,
++          info.convert ? callUnknownEncodingConvert : NULL, parser);
+       if (enc) {
+-        parser->m_unknownEncodingData = info.data;
+-        parser->m_unknownEncodingRelease = info.release;
+         parser->m_encoding = enc;
+         return XML_ERROR_NONE;
+       }
++      parser->m_unknownEncodingConvert = NULL;
+     }
+-    if (info.release != NULL)
+-      info.release(info.data);
++    if (parser->m_unknownEncodingRelease != NULL)
++      callUnknownEncodingRelease(parser);
++    else
++      parser->m_unknownEncodingData = NULL;
+   }
+   return XML_ERROR_UNKNOWN_ENCODING;
+ }
diff --git a/meta/recipes-core/expat/expat/CVE-2026-76957-02.patch b/meta/recipes-core/expat/expat/CVE-2026-76957-02.patch
new file mode 100644
index 00000000000..827499958ac
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-76957-02.patch
@@ -0,0 +1,85 @@
+From acbd2e1179c04fe9a8c3f3837701904d05de71fc Mon Sep 17 00:00:00 2001
+From: Darren Carreras <carrerasdarren@gmail.com>
+Date: Mon, 17 Aug 2026 21:19:12 -0400
+Subject: [PATCH] Test custom encoding callback reentry protection
+
+CVE: CVE-2026-76957
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/acbd2e1179c04fe9a8c3f3837701904d05de71fc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/misc_tests.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 55 insertions(+)
+
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index 82b4b54b..04538c25 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -839,6 +839,60 @@ START_TEST(test_misc_resume_parser_forbidden_from_handler) {
+ }
+ END_TEST
+ 
++typedef struct {
++  XML_Parser parser;
++  int converterCallCount;
++  int releaseCallCount;
++} EncodingCallbackData;
++
++static int XMLCALL
++reentrant_encoding_converter(void *userData, const char *s) {
++  EncodingCallbackData *const data = userData;
++  UNUSED_P(s);
++  data->converterCallCount++;
++  forbidden_calls_character_handler(data->parser, NULL, 0);
++  return 'A';
++}
++
++static void XMLCALL
++reentrant_encoding_release(void *userData) {
++  EncodingCallbackData *const data = userData;
++  data->releaseCallCount++;
++  forbidden_calls_character_handler(data->parser, NULL, 0);
++}
++
++static int XMLCALL
++reentrant_encoding_handler(void *userData, const XML_Char *name,
++                           XML_Encoding *info) {
++  EncodingCallbackData *const data = userData;
++  UNUSED_P(name);
++
++  for (int i = 0; i < 256; i++)
++    info->map[i] = i;
++  info->map[0x80] = -2; // Route byte 0x80 through the custom converter.
++  info->data = data;
++  info->convert = reentrant_encoding_converter;
++  info->release = reentrant_encoding_release;
++  return XML_STATUS_OK;
++}
++
++START_TEST(test_misc_unknown_encoding_callbacks_protected) {
++  const char *const doc
++      = "<?xml version='1.0' encoding='reentrant-conv'?><doc>\x80\x80</doc>";
++  XML_Parser parser = XML_ParserCreate(NULL);
++  EncodingCallbackData data = {parser, 0, 0};
++  XML_SetUnknownEncodingHandler(parser, reentrant_encoding_handler, &data);
++
++  assert_true(XML_Parse(parser, doc, (int)strlen(doc), /*isFinal=*/XML_TRUE)
++              == XML_STATUS_OK);
++  assert_true(data.converterCallCount > 0);
++  assert_true(data.releaseCallCount == 0); // Released by XML_ParserFree below.
++
++  XML_ParserFree(parser);
++  assert_true(data.releaseCallCount == 1);
++}
++END_TEST
++
+ // General attack payload idea by Jason Kratzer of Mozilla
+ START_TEST(test_misc_low_surrogate_mozilla_bug_2053153) {
+   const char doc_before[] = "<\0!\0D\0O\0C\0T\0Y\0P\0E\0 \0d\0 \0[\0\n\0"
+@@ -936,6 +990,7 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_no_infinite_loop_issue_1161);
+   tcase_add_test(tc_misc, test_misc_calls_forbidden_from_handlers);
+   tcase_add_test(tc_misc, test_misc_resume_parser_forbidden_from_handler);
++  tcase_add_test(tc_misc, test_misc_unknown_encoding_callbacks_protected);
+   tcase_add_test(tc_misc, test_misc_input_2gb);
+   tcase_add_test(tc_misc, test_misc_low_surrogate_mozilla_bug_2053153);
+ }
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index c3c9f738453..c9a1c9b18e3 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -14,6 +14,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-66046-02.patch \
            file://CVE-2026-76641.patch \
            file://CVE-2026-76956.patch \
+           file://CVE-2026-76957-01.patch \
+           file://CVE-2026-76957-02.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

