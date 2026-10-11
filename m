Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B453ECA9EDB
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23452.1791708090548997397
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tUGm29Q0;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b03f23305so846379f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708089; x=1792312889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Bkyt2khnodyEBG7zKiI+Jz44B9lsc08qb0A16lEuSo=;
        b=tUGm29Q0oOTexriuPJz+txxMcPndh6tJXbArtpVWgbKEz9svxTwEMQYCuKapXoC6UN
         MdLpSK203DAs4OVqvxfM0vN/yYx6+WtuZikI2DfUMLNurZCnpajo82TAl+A5smO242s+
         iRwCMJoaj3W9KMJ5tgRZAzrl4dA4TyeGxGooE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708089; x=1792312889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9Bkyt2khnodyEBG7zKiI+Jz44B9lsc08qb0A16lEuSo=;
        b=z9jnMbh4z3mDW8mMfWTtjq5f9P3Y+W50/pOiWVQSsGkSQ/08rifJpFyWmFzVOO0mYF
         u6GuaqVCaWhtnXnlJeaO926dbEbQJ+u4b4096EienRqIxHv9HUvFQGEddaHU1GH7alfu
         G0iA9hqOzqeEVbOBzO/ChkgBdTepuAdnZbvfCCX1YkA7NEXE8lFxuy1lZ9uZr+uL+L77
         Ce+6wsuMETOZQPUo8UexKCxfqFx+x13XgHSZ+mIbH94m368nrNN0/moXaJr7uoirGNJ4
         glQsRE3FlwvNE8Kufu/dor7aTQYS/ySGUmLOB+srWZv2utl7gPfeQnmfvpkjrYACbxM5
         BBTQ==
X-Gm-Message-State: AFq9FYLB9p59E4aLvgWaMmAu/0DgbOFzREWuUlEDqHGcAGz3d9H+OHTp
	cWc9d2rKBuogXPBnXqbEuO+I1BWi9jEWhuwVqv39s9/+z/8JUEx7VycsmbWiInmGcDvxhI6MbEZ
	ISiDuw5g=
X-Gm-Gg: AYBFou2ApENL7IWfsQptZcYCjTb0KjD5GkIH18Qu+kf0FF6sCvwrTbQXdv4xJjGQo2a
	/s2zN4joUC3maC1W8GslAbuIPTDwFkL9wpU18fAP9SHsxYC2HMs9Ki3AAg9Y0QhZIJblDBOZEGG
	w7NY8M7mtModq0SRLLaZggd6JaUtABm4ZHxEnvneFeWRePpaK9/MO9n9q/BWjD2qKuIkNZzYvAI
	ByvG69A51iJGUPRpdb/Ij/C7Bfg8ELGH1iJC5A+2Psyzf/BFg7nIjPCHjnrUufAbbYRbXTcPwh/
	gGQCEl5b7DgjeDBe3ZT+Gc7n+C2P+2RMVeesHMnTxz01EvuYzd201sf22oHlOx+5o7YPnHDjLQJ
	kJqaPoE1YxejxgnIS0q8Ktp6ul4d8k+R+EqMw7HYCW2NXQU6UvBEZtXIVfL9tXtr1JJJ0DU+fM4
	/QGjPCjsPoiM9iXgQTtwmzYaY+93Kvmbf8jLZENQdPyhMuly3IGp3gHg7d41LqKvhHNGDGq+lrg
	tm0GRiI9amF88Vn+JMimqMTng8ww7l67ZGqgoTSQfHi3rmeXr1Jtz0vuc2T16ooRcCKGIdmIQEY
	8jBueUiG
X-Received: by 2002:a05:6000:e8e:b0:48b:11d7:f3d4 with SMTP id ffacd0b85a97d-48dbaaeb05amr8111044f8f.28.1791708088458;
        Sun, 11 Oct 2026 01:41:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 42/60] expat: patch CVE-2026-76957
Date: Sun, 11 Oct 2026 10:40:15 +0200
Message-ID: <4ee814e91e8693265fc4e3c72768f5353284aba3.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247551

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

