Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E17FCD3442
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:58:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1047.1778000330525811636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iZEy84KB;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so53490335e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000329; x=1778605129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHZDtO9EoBesYezMHgaDfLMKjRhIO+qeZINnAi5fbN0=;
        b=iZEy84KBsTazLlZTucmPjLZULI+HULUga1cqgcA1oMQCo9Z7btCuXjUzPM1ciOj57j
         2OUuQDa5dtpZFWxZLmQVrUC1KFDdIgA2gaCBiEbM+bVvLJxFsjBGwjzgYm98xuYVvivC
         QmAqYzIGnG2St1z/i8xLkILjXd4miq0s3quV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000329; x=1778605129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IHZDtO9EoBesYezMHgaDfLMKjRhIO+qeZINnAi5fbN0=;
        b=o7SPBPpJ0ezGD2921eTIVWIU0PFGuNZDq6lFF3VxfSqMsdT7djPWdNXMQTSO3yD4xz
         QjaI0o7dNPDHO/iph29LZqXxJHrvI/9OTf4JGhYAQbJxMAqG8tw1xWaHDtX2rluF/8dl
         +86pYNP9dMU1WeDhySDbEe8x7Su0JKOz08uHMNfr3ziZT4bMLwL3VHI82/QJ+2rLQ2lx
         3U/C/vPT+ZaAqAqTo6XVryTYfAUXeAGBYWbJBU4TmLSprmLYRRW9OzoGsechhsvWkMl8
         +c+/hDul3QH+wVcr5cTqHJpIiN/8k+HArW+SyeQJTxfnhe5GabHGZGpnhgfGMwSyIIgt
         nCjw==
X-Gm-Message-State: AOJu0YzqZsn0vRISwwvHMFAY+G2S4wHl0s4+pDMLom0HK88NIcHgwiPJ
	0sGnGMMGqg/v3uTR145Vz5kxVEtxhpxEXWQhGRKIv36NhEb7ze8YMfv95PnXfaC8Gsls1hgU2Mk
	Nv0IsMTI=
X-Gm-Gg: AeBDieuTvMdDVjNmCC1m8ETgjeUf+yN0+5OTrcdA5YcIRJz6ewWUcCaLmtkcVw7vfVO
	MQubIqX+tEKEWiaMe4a+rK2wrBiELkQO0ecvHJXHOEGlJMEVShiym//Bs0fnA8Gs+vRygh1MWzQ
	Y7xJqLF0W6O9gdmRscC3hyJL8ekEvxJaYoTfg0OJpdobzqa7rKV0R6hXTh5dBqembRqDqWEYrxX
	gM6FPHYKk/aoH1q7VgGKbRTJPeCzFEstZ3v82XwCmPO/q/aAKZ0Cdnj3VwjoDxp+YI/IbBvrWs4
	ck+7yn3d2wTYjqISB5ybXoqQl5Wo7/twT90JfR56v6qMTYXDiNXtswmCIy6xRjUyQt/ZQsbxyXC
	U8KFXqmrrfje6yyn+d2GKDaTh11GChSRv/LT2CGw2fn1Z1QU+Ok3oH6VxB5dYnDN8Fwo+K51MT7
	UkQdeL6DteQaWl3npov889L51I/OaVrqSqFwMj+rq4c3/UIKa65z34tHkl25zGuUjCHidVZ9+5p
	y/r11MRWkkrk81dO99jakY1PA==
X-Received: by 2002:a05:600c:1d18:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-48e51dd689fmr2056995e9.0.1778000328450;
        Tue, 05 May 2026 09:58:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:47 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/23] expat: patch CVE-2026-32777
Date: Tue,  5 May 2026 18:57:23 +0200
Message-ID: <cbbaec4df5ce3a64d97b7f868f8f11432d808b9a.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236497

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patches from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1162
[2] https://security-tracker.debian.org/tracker/CVE-2026-32777

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-32777-01.patch       | 49 ++++++++++++++
 .../expat/expat/CVE-2026-32777-02.patch       | 66 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-02.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32777-01.patch b/meta/recipes-core/expat/expat/CVE-2026-32777-01.patch
new file mode 100644
index 0000000000..50ba27dcd4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32777-01.patch
@@ -0,0 +1,49 @@
+From a6e6cf7c30e54402b2fa3c49f9d98702e74f8c34 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 1 Mar 2026 20:16:13 +0100
+Subject: [PATCH 1/2] lib: Reject XML_TOK_INSTANCE_START infinite loop in
+ entityValueProcessor
+
+.. that OSS-Fuzz/ClusterFuzz uncovered
+
+CVE: CVE-2026-32777
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/55cda8c7125986e17d7e1825cba413bd94a35d02]
+
+(cherry picked from commit 55cda8c7125986e17d7e1825cba413bd94a35d02)
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/xmlparse.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 56faf2eb..bfb8ac58 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5077,7 +5077,7 @@ entityValueInitProcessor(XML_Parser parser, const char *s, const char *end,
+     }
+     /* If we get this token, we have the start of what might be a
+        normal tag, but not a declaration (i.e. it doesn't begin with
+-       "<!").  In a DTD context, that isn't legal.
++       "<!" or "<?").  In a DTD context, that isn't legal.
+     */
+     else if (tok == XML_TOK_INSTANCE_START) {
+       *nextPtr = next;
+@@ -5166,6 +5166,15 @@ entityValueProcessor(XML_Parser parser, const char *s, const char *end,
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
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-32777-02.patch b/meta/recipes-core/expat/expat/CVE-2026-32777-02.patch
new file mode 100644
index 0000000000..a1518c9a3e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32777-02.patch
@@ -0,0 +1,66 @@
+From 4b91fc7eb4998c49bfd3b701a679ad6eb7ce7682 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 6 Mar 2026 18:31:34 +0100
+Subject: [PATCH 2/2] misc_tests.c: Cover XML_TOK_INSTANCE_START infinite loop
+ case
+
+.. that OSS-Fuzz/ClusterFuzz uncovered
+
+CVE: CVE-2026-32777
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/a7805c1a8a48d2ce83ef289cf55bdc8b45de76a8]
+
+(cherry picked from commit a7805c1a8a48d2ce83ef289cf55bdc8b45de76a8)
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ tests/misc_tests.c | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index 07902d52..cdcdd507 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -713,6 +713,35 @@ START_TEST(test_misc_async_entity_rejected) {
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
+@@ -743,4 +772,5 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_expected_event_ptr_issue_980);
+   tcase_add_test(tc_misc, test_misc_sync_entity_tolerated);
+   tcase_add_test(tc_misc, test_misc_async_entity_rejected);
++  tcase_add_test(tc_misc, test_misc_no_infinite_loop_issue_1161);
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 631aebe6ca..f78d9a8a60 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -47,6 +47,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-25210-02.patch \
            file://CVE-2026-25210-03.patch \
            file://CVE-2026-32776.patch \
+           file://CVE-2026-32777-01.patch \
+           file://CVE-2026-32777-02.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

