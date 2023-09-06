Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632AFEB8FC8
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:48:42 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.7686.1694004521539950947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=D7AOtGx8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-56b2e689968so2024454a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004520; x=1694609320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbcrS/mwo2Uc39q6vncKJQQdupiRUFyKq/ytjFifDj8=;
        b=D7AOtGx8ZsWQWU9Qbc/YLVXCDejfZ6w44/9E0eaq4ocCnJR9p8l3knhPgtx8ww7E9/
         /ugInl6su9wkq+dR+1Jgmsu3fSxaW6qZ7hTOXI84+xh3Cvogr8iK6UVr4oGUxG3IACHN
         QI+nnfHtJ4b9+0ccVWnoQ71IdPUo4Nvsn/nwjvQy3Z1Dho0JET1z5mpEcKf3AYr3C4ur
         aH9uutLkK7AbKzOCE+GznghyiHRSAGLfFwvvSEcTjSYNdtN/TUJ+pKNM/Dj3VxM1Ecue
         cH4ecybT1/J7ra1BcK6MdSemPV3fYVSCmQkZC+mCgNOm+NyZNv3qJAobJyaAkf8TtJ3T
         VRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004520; x=1694609320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbcrS/mwo2Uc39q6vncKJQQdupiRUFyKq/ytjFifDj8=;
        b=AxxHj5rITF+8/ghpA/4f3oEj00w/4dBtSOd/3wtxDjJSXonF3DocmKAev/AVwkYzOl
         aOG/TUp1uKLS2QYmJEi7VqDYMCmC7v/d7sd+wdNzdPCFdfzGPoErJH9RexkCvrcbplYQ
         ySnSsODnEQFj2N73AyZIwdV9tcziKjlh8HWJPOLhf9nYjlA2zIVfDqkBDWz5Ax76pQOZ
         AZpvG5MY93zkXNn5XJ2L30QcUZ9NZQ4F+wqgL5aGDRW3pba6A+wgTFdG9SHvWMHvq/AX
         BGpLYqeLu7W5u5jeDqJRUj8X4xxfhKNLy+vOyaZLSW49qYfRzQvopUV1Y1dt+lfzouPG
         W6oA==
X-Gm-Message-State: AOJu0YzK0+Kv7gcLaa9mOac6+SLaMkw7oxkai02g+A+EKC66/Q1UMttg
	cKnJ9uoRD7zdufEi5sKKoIX+9DIs/DhHXDJH4Is=
X-Google-Smtp-Source: AGHT+IHGCA1bqoXrDOdVGCgGMLVhqO+QnkCa6LlxjLBMRHSMxoTtdOChCnCvcSLJic7AvbvaOEO+nA==
X-Received: by 2002:a17:90a:6649:b0:259:10a8:2389 with SMTP id f9-20020a17090a664900b0025910a82389mr11488939pjm.35.1694004520542;
        Wed, 06 Sep 2023 05:48:40 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/14] busybox: fix CVE-2022-48174
Date: Wed,  6 Sep 2023 02:48:13 -1000
Message-Id: <56b90b5f2da661bfac3f2d751fc09e918429ec87.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187302

From: Meenali Gupta <meenali.gupta@windriver.com>

There is a stack overflow vulnerability in ash.c:6030 in busybox
vbefore 1.35. In the environment of Internet of Vehicles, this
vulnerability can be executed from command to arbitrary code execution.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2022-48174.patch      | 80 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-48174.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
new file mode 100644
index 0000000000..dd0ea19f02
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
@@ -0,0 +1,80 @@
+From cf5d0889262e1b04ec2aa4caff2f5da2d602c665 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 12 Jun 2023 17:48:47 +0200
+Subject: [PATCH] busybox: shell: avoid segfault on ${0::0/0~09J}. Closes 15216
+function old new delta evaluate_string 1011 1053 +42
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=d417193cf37ca1005830d7e16f5fa7e1d8a44209]
+CVE: CVE-2022-48174
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ shell/math.c | 39 +++++++++++++++++++++++++++++++++++----
+ 1 file changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/shell/math.c b/shell/math.c
+index 76d22c9..727c294 100644
+--- a/shell/math.c
++++ b/shell/math.c
+@@ -577,6 +577,28 @@ static arith_t strto_arith_t(const char *nptr, char **endptr)
+ # endif
+ #endif
+
++//TODO: much better estimation than expr_len/2? Such as:
++//static unsigned estimate_nums_and_names(const char *expr)
++//{
++//	unsigned count = 0;
++//	while (*(expr = skip_whitespace(expr)) != '\0') {
++//		const char *p;
++//		if (isdigit(*expr)) {
++//			while (isdigit(*++expr))
++//				continue;
++//			count++;
++//			continue;
++//		}
++//		p = endofname(expr);
++//		if (p != expr) {
++//			expr = p;
++//			count++;
++//			continue;
++//		}
++//	}
++//	return count;
++//}
++
+ static arith_t
+ evaluate_string(arith_state_t *math_state, const char *expr)
+ {
+@@ -584,10 +606,12 @@ evaluate_string(arith_state_t *math_state, const char *expr)
+	const char *errmsg;
+	const char *start_expr = expr = skip_whitespace(expr);
+	unsigned expr_len = strlen(expr) + 2;
+-	/* Stack of integers */
+-	/* The proof that there can be no more than strlen(startbuf)/2+1
+-	 * integers in any given correct or incorrect expression
+-	 * is left as an exercise to the reader. */
++	/* Stack of integers/names */
++	/* There can be no more than strlen(startbuf)/2+1
++	 * integers/names in any given correct or incorrect expression.
++	 * (modulo "09v09v09v09v09v" case,
++	 * but we have code to detect that early)
++	 */
+	var_or_num_t *const numstack = alloca((expr_len / 2) * sizeof(numstack[0]));
+	var_or_num_t *numstackptr = numstack;
+	/* Stack of operator tokens */
+@@ -652,6 +676,13 @@ evaluate_string(arith_state_t *math_state, const char *expr)
+			numstackptr->var = NULL;
+			errno = 0;
+			numstackptr->val = strto_arith_t(expr, (char**) &expr);
++			/* A number can't be followed by another number, or a variable name.
++			 * We'd catch this later anyway, but this would require numstack[]
++			 * to be twice as deep to handle strings where _every_ char is
++			 * a new number or name. Example: 09v09v09v09v09v09v09v09v09v
++			 */
++			if (isalnum(*expr) || *expr == '_')
++				goto err;
+ //bb_error_msg("val:%lld", numstackptr->val);
+			if (errno)
+				numstackptr->val = 0; /* bash compat */
+--
+2.40.0
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index e9ca6fdb1a..07a5137d2a 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            file://CVE-2022-30065.patch \
            file://0001-devmem-add-128-bit-width.patch \
+	   file://CVE-2022-48174.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.34.1


