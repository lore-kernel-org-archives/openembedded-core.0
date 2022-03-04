Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0361AC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:04:58 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.7844.1646406297422058949
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QuOMS/ny;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id t5so7841763pfg.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6UzuQVzHSo6u1OUUhuEu9mHXq8+iiAvipINSz4JPtLA=;
        b=QuOMS/ny2aABWjsa8RYIUfBYVqJXI1g2PyAgwitMbg8a7UQzhH37KiGYAtgev2cYAN
         yzRu+pVtYW/ale5iRkFWF5sz+54WmJ3jqI6UlYNpc5W48znpOSF0R7gYzIDYSl+hXgRa
         k7alAdj6f07cSJPbcmL8h9cC1Ai7JA77dSGSYhJ7f4fT7TskxomATcix+xie93pLLAqV
         R51XrZwThobpFtZKEEQABoHLeP98AK9yCmmxbavR1m+GVzAfnxZ8os1AQx8sRx/YiMSX
         9iveMKe0Db84VJLK2xU6lJx64swoPA6cltsn+kWIQkSbqp6UL0QkGe3/KnITdGjJcyEp
         L2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6UzuQVzHSo6u1OUUhuEu9mHXq8+iiAvipINSz4JPtLA=;
        b=HgumpnYpFC7OX9ME3QNsS7iy/+/2rKdhhOQeVIM43y4MqyvK1YOmh1r35GFruPOprm
         J38vM7XNGFMZWWj3tnziA7F1ZJZjFc+CjFhm0fiT1BAtGdB6ywf7+2w7hqbHG1xrgRle
         wU+aDsgNs1cGFcL7nQu2XnG/LVJayxliaY0f+9wI+STZluwITM3xn/huExxEmXWD2/bT
         BSKZdSTg2VCqsUspl2cmtEuPjXvLAF2BJTKsInvzoaai50LICIv/UlNIufmWP3s8xLDD
         svSWQKhFmNnUaFryLx4XeY/CEOIEkjQ2xNrYsZpTxWwWydYgXn0vmElOc1mNjr92Ck4E
         RxYw==
X-Gm-Message-State: AOAM530RtIvv6ldKwkVd3xBA/1+5kP9k3sna2FJIjEV8OQRUU2McYagM
	5Yo0ms57z08agD/LmcmMHqY/BS5J4jkJE1ifjG4=
X-Google-Smtp-Source: 
 ABdhPJxRfdjgLvotcYw/Umkd3/XrJ2NI/kZjLZd4DGBSVyjVSXwSrNNaXh8J2YWX29LrSJa2YrKQgA==
X-Received: by 2002:a63:1c21:0:b0:374:104c:e4eb with SMTP id
 c33-20020a631c21000000b00374104ce4ebmr34622121pgc.556.1646406296350;
        Fri, 04 Mar 2022 07:04:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.04.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:04:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/18] expat: fix CVE-2022-25236
Date: Fri,  4 Mar 2022 05:04:13 -1000
Message-Id: 
 <72ab213c128ef75669447eadcae8219a9f87f941.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:04:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162724

xmlparse.c in Expat (aka libexpat) before 2.4.5 allows
attackers to insert namespace-separator characters into
namespace URIs.

Backport patches from:
https://github.com/libexpat/libexpat/pull/561/commits

CVE: CVE-2022-25236

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2022-25236.patch          | 129 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-25236.patch b/meta/recipes-core/expat/expat/CVE-2022-25236.patch
new file mode 100644
index 0000000000..ba6443fc6a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25236.patch
@@ -0,0 +1,129 @@
+From 6881a4fc8596307ab9ff2e85e605afa2e413ab71 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 12 Feb 2022 00:19:13 +0100
+Subject: [PATCH] lib: Fix (harmless) use of uninitialized memory
+
+Upstream-Status: Backport
+https://github.com/libexpat/libexpat/pull/561/commits
+
+CVE: CVE-2022-25236
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ expat/lib/xmlparse.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 902895d5..c768f856 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -718,8 +718,7 @@ XML_ParserCreate(const XML_Char *encodingName) {
+ 
+ XML_Parser XMLCALL
+ XML_ParserCreateNS(const XML_Char *encodingName, XML_Char nsSep) {
+-  XML_Char tmp[2];
+-  *tmp = nsSep;
++  XML_Char tmp[2] = {nsSep, 0};
+   return XML_ParserCreate_MM(encodingName, NULL, tmp);
+ }
+ 
+@@ -1344,8 +1343,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+      would be otherwise.
+   */
+   if (parser->m_ns) {
+-    XML_Char tmp[2];
+-    *tmp = parser->m_namespaceSeparator;
++    XML_Char tmp[2] = {parser->m_namespaceSeparator, 0};
+     parser = parserCreate(encodingName, &parser->m_mem, tmp, newDtd);
+   } else {
+     parser = parserCreate(encodingName, &parser->m_mem, NULL, newDtd);
+From a2fe525e660badd64b6c557c2b1ec26ddc07f6e4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 12 Feb 2022 01:09:29 +0100
+Subject: [PATCH] lib: Protect against malicious namespace declarations
+ (CVE-2022-25236)
+
+---
+ expat/lib/xmlparse.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index c768f856..a3aef88c 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3754,6 +3754,17 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+     if (! mustBeXML && isXMLNS
+         && (len > xmlnsLen || uri[len] != xmlnsNamespace[len]))
+       isXMLNS = XML_FALSE;
++
++    // NOTE: While Expat does not validate namespace URIs against RFC 3986,
++    //       we have to at least make sure that the XML processor on top of
++    //       Expat (that is splitting tag names by namespace separator into
++    //       2- or 3-tuples (uri-local or uri-local-prefix)) cannot be confused
++    //       by an attacker putting additional namespace separator characters
++    //       into namespace declarations.  That would be ambiguous and not to
++    //       be expected.
++    if (parser->m_ns && (uri[len] == parser->m_namespaceSeparator)) {
++      return XML_ERROR_SYNTAX;
++    }
+   }
+   isXML = isXML && len == xmlLen;
+   isXMLNS = isXMLNS && len == xmlnsLen;
+From 2de077423fb22750ebea599677d523b53cb93b1d Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 12 Feb 2022 00:51:43 +0100
+Subject: [PATCH] tests: Cover CVE-2022-25236
+
+---
+ expat/tests/runtests.c | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/tests/runtests.c b/tests/runtests.c
+index d07203f2..bc5344b1 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -7220,6 +7220,35 @@ START_TEST(test_ns_double_colon_doctype) {
+ }
+ END_TEST
+ 
++START_TEST(test_ns_separator_in_uri) {
++  struct test_case {
++    enum XML_Status expectedStatus;
++    const char *doc;
++  };
++  struct test_case cases[] = {
++      {XML_STATUS_OK, "<doc xmlns='one_two' />"},
++      {XML_STATUS_ERROR, "<doc xmlns='one&#x0A;two' />"},
++  };
++
++  size_t i = 0;
++  size_t failCount = 0;
++  for (; i < sizeof(cases) / sizeof(cases[0]); i++) {
++    XML_Parser parser = XML_ParserCreateNS(NULL, '\n');
++    XML_SetElementHandler(parser, dummy_start_element, dummy_end_element);
++    if (XML_Parse(parser, cases[i].doc, (int)strlen(cases[i].doc),
++                  /*isFinal*/ XML_TRUE)
++        != cases[i].expectedStatus) {
++      failCount++;
++    }
++    XML_ParserFree(parser);
++  }
++
++  if (failCount) {
++    fail("Namespace separator handling is broken");
++  }
++}
++END_TEST
++
+ /* Control variable; the number of times duff_allocator() will successfully
+  * allocate */
+ #define ALLOC_ALWAYS_SUCCEED (-1)
+@@ -11905,6 +11934,7 @@ make_suite(void) {
+   tcase_add_test(tc_namespace, test_ns_utf16_doctype);
+   tcase_add_test(tc_namespace, test_ns_invalid_doctype);
+   tcase_add_test(tc_namespace, test_ns_double_colon_doctype);
++  tcase_add_test(tc_namespace, test_ns_separator_in_uri);
+ 
+   suite_add_tcase(s, tc_misc);
+   tcase_add_checked_fixture(tc_misc, NULL, basic_teardown);
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index e59ff93df0..c0103767b1 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2022-23852.patch \
            file://CVE-2022-23990.patch \
            file://CVE-2022-25235.patch \
+           file://CVE-2022-25236.patch \
            file://libtool-tag.patch \
          "
 
-- 
2.25.1


