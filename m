Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E98ACC6B08
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9316.1775107337385532251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nM/awpwO;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fb14227cso5606635e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107335; x=1775712135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yf0XsnomTWi9rqR3Oa+H9KLfMee9jJl+5wyST/aPf1I=;
        b=nM/awpwOhVJuBpaW5el+QEwagGIRJncZhsZuQs37llac9WjbWjm4+69FE2iRC9S+J9
         PPI0YYQWvJg87pc4sDxz65AKbrBDHNTePTZH7uAWadQMCjdoR/MJy18K3aYZemAxXz2G
         vo0sx8UbXDwSzdjhwClhNwdLtk34gVvzog9xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107335; x=1775712135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yf0XsnomTWi9rqR3Oa+H9KLfMee9jJl+5wyST/aPf1I=;
        b=R8UR5R9bBSzx4J67aGH/i4SsjmJ2ttkJ8IN135aWJ2nUOong3PXlTXGyNYlEK1Y9Hd
         LRWtWdhnx1joYFF4fY99+yHKirI/Hz8Z+ncF2urfMvyMb5zmb7WxSjp6zKAg1HErcAmQ
         39XEMJWDZSxO46fy96g6i+Kflf1tCG+XB+vyxPgYNpBGfqquJbrTpVuVSRZIMky6HGF3
         Sn18LbpWPkea7Z6AuOgG1BjGIHUtIzTnzBmRu/g0RL0/8vw7ohdFUyObVRJB4VNayL9N
         XpoyqDvkUxOxpcRaaURAqHZnVQL0gZGPp3QEwB8l2SOUK/RcRtiyIt6PmaWcz3X+mjR5
         V8Wg==
X-Gm-Message-State: AOJu0YwIDwcWdELRmClTrPpBXHHvlChORGWsqZXEWLrSmJ377sjeOzWs
	pPtt4p50cNTEFEC3AOcdcy5xsbPieQpFr5fK3uz4ryoVcrpUxOVs3Qg1O/3btJPJjFxEPp9oZfK
	rl325s3w=
X-Gm-Gg: ATEYQzywLyP87/zv0wqxUcymeiT0rtMMI6Qfm4pjER7lWUfX9iPvFb5/Pp0Jn2Y5VIb
	XrPcF50y17UnlyTuHbrWV30Sq5yztHA1v7gIyUAcwv+lBHgbZat0kQc8M5ugGxd5zM+9oi3ilIq
	bkDFkvebzTdbvYsE8qCXyZquohwRTURzFuQhg1jE/QABAZ624xYG1YDwXhrFqL9YE8/BMxfScPw
	1JgDdmY/WgzazAW/GjsbUeCggmpUV341vSq/ZQLVBM26g9Ovuy3DbjXxVRjy/UvGRd5N8SVdbyp
	SOdlSnZH5rCQZJ/Y4ZxDfte5NJR/1fooDMTUuM149AwcT71xcoejMO3SALOOBmIHnr7hnUzMkR0
	nSTEXhzUbXfBGfzygyXizx6/jsCUC6zTM4C1Af319DiB6uHs/ISbSzg0j7AHVzTYUPpvH5OcfGJ
	z/TVELWMkOfSkvdzL1g9ypueY1fYMIqKPbvu6z3145hXiEPDmjbqkx2jDkfXBDWw4eg0wgJ6GXu
	A3bocuTCZfHS5H8TmhIeS+y4rY=
X-Received: by 2002:a05:600c:8184:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-48883575d52mr105571265e9.7.1775107335539;
        Wed, 01 Apr 2026 22:22:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 09/15] expat: Fix CVE-2026-32776
Date: Thu,  2 Apr 2026 07:21:26 +0200
Message-ID: <d8c57b92e99f534853d2ebc442379593b9567400.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234481

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2].

[1] https://github.com/libexpat/libexpat/commit/5be25657583ea91b09025c858b4785834c20f59c
[2] https://security-tracker.debian.org/tracker/CVE-2026-32776

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-32776.patch          | 90 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.4.bb        |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32776.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32776.patch b/meta/recipes-core/expat/expat/CVE-2026-32776.patch
new file mode 100644
index 00000000000..357c41a763b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32776.patch
@@ -0,0 +1,90 @@
+From dfc050e8c22c40a709a824573efd8691194c1469 Mon Sep 17 00:00:00 2001
+From: Francesco Bertolaccini <francesco.bertolaccini@trailofbits.com>
+Date: Tue, 3 Mar 2026 16:41:43 +0100
+Subject: [PATCH] Fix NULL function-pointer dereference for empty external
+ parameter entities
+
+When an external parameter entity with empty text is referenced inside
+an entity declaration value, the sub-parser created to handle it receives
+0 bytes of input.  Processing enters entityValueInitProcessor which calls
+storeEntityValue() with the parser's encoding; since no bytes were ever
+processed, encoding detection has not yet occurred and the encoding is
+still the initial probing encoding set up by XmlInitEncoding().  That
+encoding only populates scanners[] (for prolog and content), not
+literalScanners[].  XmlEntityValueTok() calls through
+literalScanners[XML_ENTITY_VALUE_LITERAL] which is NULL, causing a
+SEGV.
+
+Skip the tokenization loop entirely when entityTextPtr >= entityTextEnd,
+and initialize the `next` pointer before the early exit so that callers
+(callStoreEntityValue) receive a valid value through nextPtr.
+
+CVE: CVE-2026-32776
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5be25657583ea91b09025c858b4785834c20f59c]
+
+(cherry picked from commit 5be25657583ea91b09025c858b4785834c20f59c)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/xmlparse.c      |  9 ++++++++-
+ tests/basic_tests.c | 19 +++++++++++++++++++
+ 2 files changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index a187a3a1..10297c9a 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6780,7 +6780,14 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+       return XML_ERROR_NO_MEMORY;
+   }
+
+-  const char *next;
++  const char *next = entityTextPtr;
++
++  /* Nothing to tokenize. */
++  if (entityTextPtr >= entityTextEnd) {
++    result = XML_ERROR_NONE;
++    goto endEntityValue;
++  }
++
+   for (;;) {
+     next
+         = entityTextPtr; /* XmlEntityValueTok doesn't always set the last arg */
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 0231e094..8be3492d 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -6213,6 +6213,24 @@ START_TEST(test_varying_buffer_fills) {
+ }
+ END_TEST
+
++START_TEST(test_empty_ext_param_entity_in_value) {
++  const char *text = "<!DOCTYPE r SYSTEM \"ext.dtd\"><r/>";
++  ExtOption options[] = {
++      {XCS("ext.dtd"), "<!ENTITY % pe SYSTEM \"empty\">"
++                       "<!ENTITY ge \"%pe;\">"},
++      {XCS("empty"), ""},
++      {NULL, NULL},
++  };
++
++  XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
++  XML_SetExternalEntityRefHandler(g_parser, external_entity_optioner);
++  XML_SetUserData(g_parser, options);
++  if (_XML_Parse_SINGLE_BYTES(g_parser, text, (int)strlen(text), XML_TRUE)
++      == XML_STATUS_ERROR)
++    xml_failure(g_parser);
++}
++END_TEST
++
+ void
+ make_basic_test_case(Suite *s) {
+   TCase *tc_basic = tcase_create("basic tests");
+@@ -6458,6 +6476,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_empty_element_abort);
+   tcase_add_test__ifdef_xml_dtd(tc_basic,
+                                 test_pool_integrity_with_unfinished_attr);
++  tcase_add_test__ifdef_xml_dtd(tc_basic, test_empty_ext_param_entity_in_value);
+   tcase_add_test__if_xml_ge(tc_basic, test_entity_ref_no_elements);
+   tcase_add_test__if_xml_ge(tc_basic, test_deep_nested_entity);
+   tcase_add_test__if_xml_ge(tc_basic, test_deep_nested_attribute_entity);
+--
+2.51.0
diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/expat/expat_2.7.4.bb
index 95a1ed52c41..a1cbf77ae10 100644
--- a/meta/recipes-core/expat/expat_2.7.4.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -10,6 +10,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2026-32776.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

