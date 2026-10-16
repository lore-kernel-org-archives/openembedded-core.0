Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3807CCF2CA
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6029.1792189485946664125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NqY/lXzq;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1d912a5a2so889475e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189484; x=1792794284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lze+0S1Yz2ok2g3TdK0OAjNoXt7XPwpH3ZqIU69G5fw=;
        b=NqY/lXzqkUbpDGp9+NdV10j0F4ao0V0/JUa2Ypqr7klvvzly/wtYq58bEV81NJ9/vt
         OJFB5vrKKzLbTFqg8DKv+VknJ/VuCCne6ZCeYuW6Qr67fQjHLP7RtZZfv5y9A0aYTaHp
         p/+Z8UDyBZY+qfv1juCIJyzKXaQ4iSsO/vmIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189484; x=1792794284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Lze+0S1Yz2ok2g3TdK0OAjNoXt7XPwpH3ZqIU69G5fw=;
        b=EycSBox5iMY8j46tAwl+UI0kd7s8XdXrEH9IsIt4gsMkCbf9XVibV4BcCW372lAYwR
         SJi1ABbXbG9hamOpKXiI/7DPhWtTmUiGck5urUBwJAPYU6CWYXXkH27pZf+lUpgTuxH7
         ZLFnxz9h3piSz9Dk4+dutuCDfJUWGHc6PcDfqr2bpIvDYtnIOKwLpvxV1QSPr9yZIFrV
         FUdG86jBtnEcFDYisa1PBhUr4p1pfb/MpnUMTBvsXjjDG8ehsio3QcqvJ9GSMMf9ES7T
         bGP6CYSGI2Yb3GSsMsJGSBbN9dFdU1vOuIjutBBr9kxLJNGXAKFlLbPJDKBEGWTGBTEr
         3Mvw==
X-Gm-Message-State: AFq9FYJWnJFiNjua2LQ3jVuXNRbm8Tadv7pB+Fe/nDyN8V7R3ZT6iQyJ
	hStD6JZlsUQ6eDhLryv3oxY0IU1jGKtCp7waCZ7skzmMMJpaCYdGFzERuOqQckjuC4dGKLYoRLq
	p/3TKUgg=
X-Gm-Gg: AYBFou3xs+tdlwsQfiHKE8cfIXhS2fHLhtmF8tNN+dmYiTVaTKglyRhdu5jAeEn21XO
	HquqU9aGhu+lOnBCanDsJFjsdJdgbyCE8if0ynFsRjNzirtAkOsZ1IyDdlCqmKPc63Zwn6gYgPj
	JNq1LE6ienj0Wn1+BAipjxQXhQFmBh+Mvpj71ReLnLBbuANPKhJD4CzL/+gtL+mWVlHE0O4STZc
	QTTYB2Lg1gEl1T65FjfA/wLjIP7lJKFyqSktgCfot3SPiZNEjVPLJS9B+YpFfhqfxIu6hyJebcr
	2m8L1Iiyr4dRdFvSO0P2nUg1qzP0JbwBdlRfqSVBIygs85z1pn746GapdaKJegeki3O8dGzR0LJ
	ryxVGPpu+yx82aS0u9imKDCyqKy6q5ssNVumUCPSaaSkcgTWbwcMCLp3zLoCp7HoCgnKCkkFELA
	xYpdzWyKrFpyVXi+36ZFwWRRIxJas2KRXA0KebauZLBarJMilvGVRMMrX42evOxq7/QAZakt0ff
	4VonmSHSSR2JtaUxSitbjwHiN/I0nSr4B1h+XjwtDewt3YGyXbsxSo0km6k11jJcas+gIHhhFlc
	nFKbLWCB
X-Received: by 2002:a05:600c:3551:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a1d75a4653mr28795435e9.2.1792189484089;
        Fri, 16 Oct 2026 15:24:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 07/17] expat: patch CVE-2026-77214
Date: Sat, 17 Oct 2026 00:24:09 +0200
Message-ID: <baf5d39b0076180b759229575ce8f36f08cee66d.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248057

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-77214

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-77214.patch          | 106 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-77214.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-77214.patch b/meta/recipes-core/expat/expat/CVE-2026-77214.patch
new file mode 100644
index 00000000000..b4105255f70
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
index dfb07d249ae..125d0e1f82e 100644
--- a/meta/recipes-core/expat/expat_2.8.5.bb
+++ b/meta/recipes-core/expat/expat_2.8.5.bb
@@ -11,6 +11,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
            file://CVE-2026-102633.patch \
+           file://CVE-2026-77214.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

