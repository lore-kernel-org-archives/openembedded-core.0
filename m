Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013EFCD8C91
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:14:50 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.92314.1696947289515875004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UcLIMpe9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c5bf7871dcso42021995ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696947288; x=1697552088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XLHSbPg9r2cH0UpavJT+TNxIe5at0inpRbMSxxvaBQ=;
        b=UcLIMpe9mzEyqwiZdRXooHYGs/G81BhUrvYGF1UWCuYOPXXt1YpZMqFwp9QwB8laEP
         f1tknrm95DccX5uHYwz3HXOtTLsCtstZso9ZIdIad8mxhUHPG2FEshGk3N9WVc+X8/F0
         siT1+pN5UPlj38scaFe3PCs8FYnu8XLTj7OMqYKXrGn+CI1cWYe7oIF81F6DxK0jDStH
         P9ccbck6hNZbAMznKq39U8uLAnvhgqHu+8KknZkauITVDWuIlxXluqdDVA3bdnaAVjnb
         CaBRO0KVRaLpwltTGSEf/ZjPpzWP+bUptKw21OqA7g2TMfhFvZ3v8vahX2kAeMLvl/6Q
         uQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947288; x=1697552088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XLHSbPg9r2cH0UpavJT+TNxIe5at0inpRbMSxxvaBQ=;
        b=mjTWnDRIElPIT5UKOROc8r1Kc7P9in0RUht85o8zyP6hhP44k0PF9nki78VW5wYr6r
         g5LgE+C1S6eUEiRY7D64lO1ZT9jBJAQv6mkmBMoZvfj3wzd3eexDS79dzdErUGkc5Y2N
         xgHNjiS7RSM5JKFLG+8vObDo4Ww7pgHD0GJLlPR2j4/alQQCg5aDQpeFjrSvKUHJs3yv
         8hSh8HPt1Ooc7wF6GVhcbq5Pb/IlwJfvV6ScFYRXQLAlzwzJN/CYHB3GwPAhpiq67cYi
         /tsz8L0EFsKwVV1vCz13XfNnbZlvZMalRqJWZZWkil0i9Krq+rzcItjp/Qr9xErQlHiB
         +TVA==
X-Gm-Message-State: AOJu0Yyv5gdlEPgT+Giw9KeIYPyzI4lklruHaicwXe9yBhRR46nXX3Pp
	ua9H/fvMkaw053BVNVn+Ispa3qA/KcmxCf03eos=
X-Google-Smtp-Source: AGHT+IGgDvPj7FN4QDV135PN8M6sOK/s+q/z5A3ngYD8BIxnVALuAnAR82iYSreS7CuujKFKiGScfw==
X-Received: by 2002:a17:903:54d:b0:1c6:1206:c5b0 with SMTP id jo13-20020a170903054d00b001c61206c5b0mr13721120plb.67.1696947288384;
        Tue, 10 Oct 2023 07:14:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001b81a97860asm11737610plg.27.2023.10.10.07.14.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:14:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/11] busybox: Backport CVE-2022-48174 fix
Date: Tue, 10 Oct 2023 04:14:26 -1000
Message-Id: <634daf953e4bd8c6df3ee341b5e93cc81e1a620d.1696946306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696946306.git.steve@sakoman.com>
References: <cover.1696946306.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188907

From: Marek Vasut <marex@denx.de>

There is a stack overflow vulnerability in ash.c:6030 in busybox before
1.35. In the environment of Internet of Vehicles, this vulnerability can
be executed from command to arbitrary code execution.

https://nvd.nist.gov/vuln/detail/CVE-2022-48174

CVE: CVE-2022-48174
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2022-48174.patch      | 82 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-48174.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
new file mode 100644
index 0000000000..dfba2a7e0f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
@@ -0,0 +1,82 @@
+From c18ebf861528ef24958dd99a146482d2a40014c7 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 12 Jun 2023 17:48:47 +0200
+Subject: [PATCH] shell: avoid segfault on ${0::0/0~09J}. Closes 15216
+
+function                                             old     new   delta
+evaluate_string                                     1011    1053     +42
+
+CVE: CVE-2022-48174
+Upstream-Status: Backport [d417193cf37ca1005830d7e16f5fa7e1d8a44209]
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ shell/math.c | 39 +++++++++++++++++++++++++++++++++++----
+ 1 file changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/shell/math.c b/shell/math.c
+index af1ab55c0..79824e81f 100644
+--- a/shell/math.c
++++ b/shell/math.c
+@@ -578,6 +578,28 @@ static arith_t strto_arith_t(const char *nptr, char **endptr)
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
+ static arith_t FAST_FUNC
+ evaluate_string(arith_state_t *math_state, const char *expr)
+ {
+@@ -585,10 +607,12 @@ evaluate_string(arith_state_t *math_state, const char *expr)
+ 	const char *errmsg;
+ 	const char *start_expr = expr = skip_whitespace(expr);
+ 	unsigned expr_len = strlen(expr) + 2;
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
+ 	var_or_num_t *const numstack = alloca((expr_len / 2) * sizeof(numstack[0]));
+ 	var_or_num_t *numstackptr = numstack;
+ 	/* Stack of operator tokens */
+@@ -657,6 +681,13 @@ evaluate_string(arith_state_t *math_state, const char *expr)
+ 			numstackptr->var = NULL;
+ 			errno = 0;
+ 			numstackptr->val = strto_arith_t(expr, (char**) &expr);
++			/* A number can't be followed by another number, or a variable name.
++			 * We'd catch this later anyway, but this would require numstack[]
++			 * to be twice as deep to handle strings where _every_ char is
++			 * a new number or name. Example: 09v09v09v09v09v09v09v09v09v
++			 */
++			if (isalnum(*expr) || *expr == '_')
++				goto err;
+ 			if (errno)
+ 				numstackptr->val = 0; /* bash compat */
+ 			goto num;
+-- 
+2.40.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index d062f0f7dd..94aa1467df 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -55,6 +55,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2021-42374.patch \
            file://CVE-2021-42376.patch \
            file://CVE-2021-423xx-awk.patch \
+           file://CVE-2022-48174.patch \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            "
-- 
2.34.1


