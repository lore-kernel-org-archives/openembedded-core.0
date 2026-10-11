Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0257CA9EBD
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 10:45:34 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24911.1791715530565661229
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 03:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=uJvgWb6Y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202610111045275a84008a1000020795-vmzenp@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202610111045275a84008a1000020795
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 12:45:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QjPvcwqUK/ysQRSi7CaegdTa4yJWbeNgR+8cQZ/5e9g=;
 b=uJvgWb6YDBFikH//esxMFBVYMZ5nZ40BjmgO2knJ0qsdtlEk7kEOD/yAvChVQb1D/0TE7M
 vNjDCwj9AkvflSoaR1rac+Hr8fdgIEdgvh5JD+rNjSc5WE4BWoc9FZYEeBo58Seie7fRYxwA
 kDrRMlqUjaQ1cSiSr5KyviS2poY7N+jsDYqWWuwCLof0sh/61c4Qu9jfKduAxI6Jmr+uH0Kn
 tte84G+p6GfaMwXt+okixBQArM1P3JBlnUQ5LdZ/MqzgfAaxMyvcz6GTqIrmSk+e1grELdNH
 sox0XGytiTzstcWlfwNGt1ao8B7uqPGSS/0NEJC1hBubd3mRlqAmQuDA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 2/2] expat: patch CVE-2026-77214
Date: Sun, 11 Oct 2026 12:45:06 +0200
Message-ID: <20261011104506.1994371-2-peter.marko@siemens.com>
In-Reply-To: <20261011104506.1994371-1-peter.marko@siemens.com>
References: <20261011104506.1994371-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 10:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247573

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-77214

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../expat/expat/CVE-2026-77214.patch          | 106 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-77214.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-77214.patch b/meta/recipes-core/expat/expat/CVE-2026-77214.patch
new file mode 100644
index 0000000000..b4105255f7
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-77214.patch
@@ -0,0 +1,106 @@
+From 4d9b1c499ecb66323260a7274edcf86c5eab0517 Mon Sep 17 00:00:00 2001
+From: Filippo Tedeschi <filippotedeschi98@gmail.com>
+Date: Fri, 25 Sep 2026 19:51:10 +0200
+Subject: [PATCH] lib|tests: Validate len against buffer capacity in
+ XML_ParseBuffer
+
+In XML_ParseBuffer(), if len exceeds the unoccupied capacity of the
+internal buffer (EXPAT_SAFE_PTR_DIFF(m_bufferLim, m_bufferEnd)),
+parser->m_bufferEnd was previously advanced past parser->m_bufferLim.
+This violated the parser's internal pointer invariant (m_bufferEnd <=
+m_bufferLim) and caused callProcessor() to read unallocated or
+uninitialized heap memory beyond the buffer bounds.
+
+Validate that len <= EXPAT_SAFE_PTR_DIFF(m_bufferLim, m_bufferEnd) for
+both XML_INITIALIZED and XML_PARSING states. If len exceeds the
+available buffer capacity, return XML_STATUS_ERROR with
+XML_ERROR_INVALID_ARGUMENT.
+
+Also add test_parse_buffer_exceeds_buffer in tests/basic_tests.c.
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+Signed-off-by: Filippo Tedeschi <filippotedeschi98@gmail.com>
+
+CVE: CVE-2026-77214
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/4d9b1c499ecb66323260a7274edcf86c5eab0517]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c      |  5 +++
+ tests/basic_tests.c | 41 +++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 08ef9f72..6e3af97b 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2447,6 +2447,11 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
+     parser->m_parsingStatus.parsing = XML_PARSING;
+   }
+ 
++  if (len > EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_bufferEnd)) {
++    parser->m_errorCode = XML_ERROR_INVALID_ARGUMENT;
++    return XML_STATUS_ERROR;
++  }
++
+   // Detect and avoid integer overflow
+   if ((uint64_t)len > UINT64_MAX - parser->m_parseEndByteIndex) {
+     parser->m_errorCode = XML_ERROR_NO_MEMORY;
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 06268469..35e17d31 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -3725,6 +3725,46 @@ START_TEST(test_negative_len_parse_buffer) {
+ }
+ END_TEST
+ 
++/* Test XML_ParseBuffer rejects calls where len exceeds available buffer */
++START_TEST(test_parse_buffer_exceeds_buffer) {
++  for (int isFinal = 0; isFinal < 2; isFinal++) {
++    set_subtest("isFinal=%d", isFinal);
++
++    XML_Parser parser = XML_ParserCreate(NULL);
++
++    /* Calling XML_ParseBuffer without any prior XML_GetBuffer call */
++    if (XML_ParseBuffer(parser, 10, isFinal) != XML_STATUS_ERROR)
++      fail("XML_ParseBuffer without XML_GetBuffer was expected to fail.");
++    if (XML_GetErrorCode(parser) != XML_ERROR_NO_BUFFER)
++      fail("Expected XML_ERROR_NO_BUFFER.");
++
++    /* Acquire a small buffer */
++    void *const buffer = XML_GetBuffer(parser, 10);
++    if (buffer == NULL)
++      fail("XML_GetBuffer failed.");
++
++    /* Calling XML_ParseBuffer with len exceeding available buffer capacity */
++    if (XML_ParseBuffer(parser, 10000, isFinal) != XML_STATUS_ERROR)
++      fail("XML_ParseBuffer with len > capacity was expected to fail.");
++    if (XML_GetErrorCode(parser) != XML_ERROR_INVALID_ARGUMENT)
++      fail("Expected XML_ERROR_INVALID_ARGUMENT.");
++
++    /* Valid parse */
++    memcpy(buffer, "<r></r>", 7);
++    if (XML_ParseBuffer(parser, 7, XML_FALSE) != XML_STATUS_OK)
++      xml_failure(parser);
++
++    /* Subsequent XML_ParseBuffer where len exceeds remaining capacity */
++    if (XML_ParseBuffer(parser, 10000, isFinal) != XML_STATUS_ERROR)
++      fail("XML_ParseBuffer on subsequent chunk was expected to fail.");
++    if (XML_GetErrorCode(parser) != XML_ERROR_INVALID_ARGUMENT)
++      fail("Expected XML_ERROR_INVALID_ARGUMENT.");
++
++    XML_ParserFree(parser);
++  }
++}
++END_TEST
++
+ /* Test odd corners of the XML_GetBuffer interface */
+ static enum XML_Status
+ get_feature(enum XML_FeatureEnum feature_id, long *presult) {
+@@ -7181,6 +7221,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_empty_parse);
+   tcase_add_test(tc_basic, test_negative_len_parse);
+   tcase_add_test(tc_basic, test_negative_len_parse_buffer);
++  tcase_add_test(tc_basic, test_parse_buffer_exceeds_buffer);
+   tcase_add_test(tc_basic, test_get_buffer_1);
+   tcase_add_test(tc_basic, test_get_buffer_2);
+ #if XML_CONTEXT_BYTES > 0
diff --git a/meta/recipes-core/expat/expat_2.8.5.bb b/meta/recipes-core/expat/expat_2.8.5.bb
index dfb07d249a..125d0e1f82 100644
--- a/meta/recipes-core/expat/expat_2.8.5.bb
+++ b/meta/recipes-core/expat/expat_2.8.5.bb
@@ -11,6 +11,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
            file://CVE-2026-102633.patch \
+           file://CVE-2026-77214.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

