Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FB3CC6B09
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9231.1775107337976824462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IUxNlwlP;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso3685205e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107336; x=1775712136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NT98RqoNBg1Js1ko9uJ0xWVbf5uUW+ZKrs3JDdESzUk=;
        b=IUxNlwlPVzBKELFp4yiVRW13mem7qRGwIsknb1INhN6M5Bh5VU+jh6D36+dsl7FiJg
         A45BiZunstqi3qc9+m0rHAAypZVdd+QUgHO2RmSVpk8IvpHoL5VklGxHeh/VN7natra9
         Ha9YzwUuX5zFKGrbudWN5ImsBzKNork7v0yEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107336; x=1775712136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NT98RqoNBg1Js1ko9uJ0xWVbf5uUW+ZKrs3JDdESzUk=;
        b=BV+dkb66RPk+yNmi5+ELh+0tIHohYEZJgB9TfRmysBZCSNvBjR7pfSfCZ9LJDDbJXD
         A8a0YjOcdGpJ5bejZH6s2KMTpY2Lz56O4ZP6yIyoUbHpmfAnrx2t63HN/9lAVRAsc8gW
         1VkpBGT74Spl1BOksfzomIzy/GbPH6+pq7DtGF3NvW4Uv1c9pE9xMxWuo5UnAUed+RJB
         QqJUoFtQxKG7uftiAq5/CbqDD6qYYMBcbebTpl1D/jfQQB5QE3N+e98//8tkoyHMOURw
         6pCPlgLPlcC83g1gWJ9swcnWnkA7BMwuTUvWNzEmDKJIx1ZgEynKc7kTbmAFSyVSkhSw
         a9qQ==
X-Gm-Message-State: AOJu0YwuiszRGZLUXySRypY7/QRv+X3eNVj5X6OK/7w83+gW+lluIycM
	h4JoHoGvF65X2JQ6+uziKgacIzB/5zPt2ggtwNHmbaWtUvu4QxJSGzLiJv3kmJOiZX8Wvcp34fD
	pLxR4//A=
X-Gm-Gg: ATEYQzx10TKyXHXdmjipObiqqhK5MFhvKxPcbg26AdYtzfiW6y3TptMqQ/YUznr6ku+
	s3qBjFXqDtch7Dc5ln7F04v0C73+qZIzg4xopAlCKcrgC73IUZ0tLU/oQIdxW/g7eG5Xlw/7O6h
	YuuFOYvboN8egeYHoRdwRoMkLVXphQLTQtvYzEJK9EvN3BGn8gyFAYvi53LHidKr1c7XB8z1bcx
	JgL2xEUWBW9tmZ/X3lraiSYUQHCtlRXJOHbe0bUN2XQvgXEp3cYQospV+MqeuFNLqBfWh7x54Wu
	XnltEv3+MxPFoBTwskqIuSiwUqH+nOy8+FoM5JtZw+FbT3Io8Sk5TjTffaZkZBkY2rkUl8Vj7QW
	8Vle2O3FglcPYt616P6UrAGv7iYrM4VWydXzgemSt5VA04puKOyyIpypnIR/uygqNTuJfY5oyy8
	9G8NdY8y+Es19vvnsfSzHzeRxyuc7Lp+Qqaszoue+tRXsG/GajXXKK2S54Rjvc72UYD18R1qcRL
	QMumaSzlsYs1Tqacx3RMikkkv8=
X-Received: by 2002:a05:600c:19d0:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-4888356d90cmr98695275e9.9.1775107336053;
        Wed, 01 Apr 2026 22:22:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 10/15] expat: Fix CVE-2026-32777
Date: Thu,  2 Apr 2026 07:21:27 +0200
Message-ID: <4e8ac83e9988871adec21f8f35f18272d3b576ae.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234482

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] and [2] as mentioned in [3].

[1] https://github.com/libexpat/libexpat/commit/55cda8c7125986e17d7e1825cba413bd94a35d02
[2] https://github.com/libexpat/libexpat/commit/a7805c1a8a48d2ce83ef289cf55bdc8b45de76a8
[3] https://security-tracker.debian.org/tracker/CVE-2026-32777

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-32777_p1.patch       | 48 ++++++++++++++
 .../expat/expat/CVE-2026-32777_p2.patch       | 65 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.4.bb        |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32777_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-32777_p1.patch
new file mode 100644
index 00000000000..4b30b406ede
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32777_p1.patch
@@ -0,0 +1,48 @@
+From db449df6a700b677cedf723d7be578457e0bc9c7 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 1 Mar 2026 20:16:13 +0100
+Subject: [PATCH] lib: Reject XML_TOK_INSTANCE_START infinite loop in
+ entityValueProcessor
+
+.. that OSS-Fuzz/ClusterFuzz uncovered
+
+CVE: CVE-2026-32777
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/55cda8c7125986e17d7e1825cba413bd94a35d02]
+
+(cherry picked from commit 55cda8c7125986e17d7e1825cba413bd94a35d02)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/xmlparse.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 10297c9a..c5bd7059 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5080,7 +5080,7 @@ entityValueInitProcessor(XML_Parser parser, const char *s, const char *end,
+     }
+     /* If we get this token, we have the start of what might be a
+        normal tag, but not a declaration (i.e. it doesn't begin with
+-       "<!").  In a DTD context, that isn't legal.
++       "<!" or "<?").  In a DTD context, that isn't legal.
+     */
+     else if (tok == XML_TOK_INSTANCE_START) {
+       *nextPtr = next;
+@@ -5169,6 +5169,15 @@ entityValueProcessor(XML_Parser parser, const char *s, const char *end,
+       /* found end of entity value - can store it now */
+       return storeEntityValue(parser, enc, s, end, XML_ACCOUNT_DIRECT, NULL);
+     }
++    /* If we get this token, we have the start of what might be a
++       normal tag, but not a declaration (i.e. it doesn't begin with
++       "<!" or "<?").  In a DTD context, that isn't legal.
++    */
++    else if (tok == XML_TOK_INSTANCE_START) {
++      *nextPtr = next;
++      return XML_ERROR_SYNTAX;
++    }
++
+     start = next;
+   }
+ }
+--
+2.51.0
diff --git a/meta/recipes-core/expat/expat/CVE-2026-32777_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-32777_p2.patch
new file mode 100644
index 00000000000..d6ba0fe10ac
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32777_p2.patch
@@ -0,0 +1,65 @@
+From 14d31645bd58fceb6b3390b8ae6b0de68948bdc3 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 6 Mar 2026 18:31:34 +0100
+Subject: [PATCH] misc_tests.c: Cover XML_TOK_INSTANCE_START infinite loop
+ case
+
+.. that OSS-Fuzz/ClusterFuzz uncovered
+
+CVE: CVE-2026-32777
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/a7805c1a8a48d2ce83ef289cf55bdc8b45de76a8]
+
+(cherry picked from commit a7805c1a8a48d2ce83ef289cf55bdc8b45de76a8)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ tests/misc_tests.c | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index 2a805454..bdec886d 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -771,6 +771,35 @@ START_TEST(test_misc_async_entity_rejected) {
+ }
+ END_TEST
+
++START_TEST(test_misc_no_infinite_loop_issue_1161) {
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++  const char *text = "<!DOCTYPE d SYSTEM 'secondary.txt'>";
++
++  struct ExtOption options[] = {
++      {XCS("secondary.txt"),
++       "<!ENTITY % p SYSTEM 'tertiary.txt'><!ENTITY g '%p;'>"},
++      {XCS("tertiary.txt"), "<?xml version='1.0'?><a"},
++      {NULL, NULL},
++  };
++
++  XML_SetUserData(parser, options);
++  XML_SetParamEntityParsing(parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
++  XML_SetExternalEntityRefHandler(parser, external_entity_optioner);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++              == XML_STATUS_ERROR);
++
++#if defined(XML_DTD)
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_EXTERNAL_ENTITY_HANDLING);
++#else
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_NO_ELEMENTS);
++#endif
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ void
+ make_miscellaneous_test_case(Suite *s) {
+   TCase *tc_misc = tcase_create("miscellaneous tests");
+@@ -801,4 +830,5 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_expected_event_ptr_issue_980);
+   tcase_add_test(tc_misc, test_misc_sync_entity_tolerated);
+   tcase_add_test(tc_misc, test_misc_async_entity_rejected);
++  tcase_add_test(tc_misc, test_misc_no_infinite_loop_issue_1161);
+ }
+--
+2.51.0
diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/expat/expat_2.7.4.bb
index a1cbf77ae10..da6e4bb657c 100644
--- a/meta/recipes-core/expat/expat_2.7.4.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -11,6 +11,8 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
            file://CVE-2026-32776.patch \
+           file://CVE-2026-32777_p1.patch \
+           file://CVE-2026-32777_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

