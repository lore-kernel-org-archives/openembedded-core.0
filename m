Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B42C83F04
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:25:35 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.25254.1751466334138047704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1d8qVpBc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so6699982a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751466333; x=1752071133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGldChNBtiB6rK18keyE9RSA7MfzrB4poFcO2i7FUFA=;
        b=1d8qVpBcFaICgxyOSNZJrN/g5VK02Eu02RmbELvddPfbPliHxjWzyyiUMd6D5N+TYd
         9vK+ubIzRI/7P/212huldVNe+nzy/YT08MTZ8bdMtX6mTg1CzS2oa3kiUdmAi481SeAI
         M9ptOCK0A3rZHxGauumIWRK1rEpKBj3HzE2oIyMBNexBfUcopkImHgmWvD0dUFylwgiE
         ZLsTnJ7mt7h73qdaZHqmy22kS07C4FAIM6TqoOfOpxBpRDEk8KrVeBEsECfTeeiGXenp
         irUFTFHawmib4tksYhG+SIeB2f4cE4h0WPAyiGDvpyyiimTmJUXv4BvCBBfudDdp6krl
         AqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466333; x=1752071133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGldChNBtiB6rK18keyE9RSA7MfzrB4poFcO2i7FUFA=;
        b=AHZayJCdGQbTbCThLmrxtStBKj9CLwG6Zcmxt6JKsC2/FxPM2kzxKRL3wBTwJZFovK
         ZUgEoRKxvHETj/fv5SaPnaa+EyuNrY//D5fbQzDNUy8h6OHfnkxkhQibmxc1kWZXfFJp
         E2CMK+eCshxntflm6RINeTLa1suwHqg8WWcLtkJ8YxpdB5BgcVmY9UCl/y47uz8VJ53J
         WDN0kZtDmgVqnDjnTwGCEGMJUD4a7AZX35ZwEhXVFeUnNgih9b3aWS9rxi7vcbJvMWuU
         iA2baIAEI3fNkmGP2iRbmDxRuJ3+6Yy0XXkYEfA7ZYQ4NkvgYY3EfUYksB6q/hEhZua7
         wGfA==
X-Gm-Message-State: AOJu0YwqTp/er3WPPF2PGNGxL49mch6RGbL7i4qKaVzMiBbKF8/XCS0B
	u1Adnp8S93cJUOpKX6qk6i3QnYWsoJ9kZ0ZJbTTzvJtwnEDM8S7HsqrEXGoMFq3x948a32/Ofqi
	hmN5PUlc=
X-Gm-Gg: ASbGncvWe92ZdRnjWFTvb1yePoexP6Xyo+e9M065j7LqVvj+4hseZ0uC++Hdd8wnfax
	J03HAWHQZtYWYmZOgnqHNx5kvb2kVxzMaqdxUyA/StY5j6hSrXsgQcmOfjNfk4UkhvVdYSpj5rO
	GgfoGFArURYZCydM+yq6g2KsYPMYON+Yoe+kw2oFn8tJ+FArkmB6pJPDcTas20tOgzqASr305XF
	k7/kIsaM/gO5hzYCAn7759cwSpFWGNFpd5skjltETYpAMY7I6YkEbpgwzbiM1bD+c4zk90s/MD8
	UUW/JZAcSBwsZYk6qCQH5RAANq+N+AoqJ63rZGZBhtj0kQqv0CStpQ==
X-Google-Smtp-Source: AGHT+IHZhjtk9wCHop0jUt9eFb4zSwjBKj8LC5afXTLPngf6rhs4BXBykAEMy9iq39RXIjMjbRDTvg==
X-Received: by 2002:a17:90b:4cd1:b0:312:959:dc3f with SMTP id 98e67ed59e1d1-31a90afc696mr4721359a91.3.1751466333117;
        Wed, 02 Jul 2025 07:25:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:acee:7642:9516:37b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c15232c9sm14871637a91.45.2025.07.02.07.25.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/9] busybox: fix CVE-2022-48174
Date: Wed,  2 Jul 2025 07:25:17 -0700
Message-ID: <f362d1b53cdb19e31193dcceb3025ef60b2bda95.1751466215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751466215.git.steve@sakoman.com>
References: <cover.1751466215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 14:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219836

From: Victor Giraud <vgiraud.opensource@witekio.com>

shell: avoid segfault on ${0::0/0~09J}. Closes 15216
CVE: CVE-2022-48174

Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/busybox/commit/?id=ca2afcbf42017d998ce3d6726f5ff5072a3fa853]

Signed-off-by: Victor Giraud <vgiraud.opensource@witekio.com>
Signed-off-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2022-48174.patch      | 80 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-48174.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
new file mode 100644
index 0000000000..8d53f2ef90
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
@@ -0,0 +1,80 @@
+From ca2afcbf42017d998ce3d6726f5ff5072a3fa853 Mon Sep 17 00:00:00 2001
+From: Octavio Galland <octavio.galland@canonical.com>
+Date: Tue, 13 Aug 2024 10:42:58 -0300
+Subject: shell: avoid segfault on ${0::0/0~09J}. Closes 15216
+
+CVE: CVE-2022-48174
+Upstream-Status: Backport
+Signed-off-by: Victor Giraud <vgiraud.opensource@witekio.com>
+
+---
+ shell/math.c | 39 +++++++++++++++++++++++++++++++++++----
+ 1 file changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/shell/math.c b/shell/math.c
+index 76d22c9b..727c2946 100644
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
+@@ -652,6 +676,13 @@ evaluate_string(arith_state_t *math_state, const char *expr)
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
+ //bb_error_msg("val:%lld", numstackptr->val);
+ 			if (errno)
+ 				numstackptr->val = 0; /* bash compat */
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 42dd5f71eb..69e9555766 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -57,6 +57,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0002-awk-fix-ternary-operator-and-precedence-of.patch \
            file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
            file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
+           file://CVE-2022-48174.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.43.0


