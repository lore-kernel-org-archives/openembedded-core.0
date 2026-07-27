Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CA1C53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43739.1785192968518108512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pu5J/E1N;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49548e01d02so16344315e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192967; x=1785797767; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VIQUGKxLmB7Uxm+JH34x2NuEl4e1M+/5i8rRp6mlbo=;
        b=pu5J/E1NKUC3XL9GZi/VmM+9Esy4pFa9cQ2lb3jOlUxWkCANSN/7WVvMY8GfGSKXyf
         JatEY8QZkA5iXhluumKNLuu/UMgfh7cUkb2+dWJQzf6It4++H32nltoEEWmHM2Ir8ZxF
         k3MsNDLmLGTkmiimkO+y0fOhyKx3g8rn7ljco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192967; x=1785797767;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VIQUGKxLmB7Uxm+JH34x2NuEl4e1M+/5i8rRp6mlbo=;
        b=Yyp8I40A276Cc5RrZAIqYiKQGorBgKzpzzvG2ZkUaDnwFqRb3JEjwU1ZNIep7MmzXw
         w5YYLaupTq0tZPbuaaA7rBO6PQBzxYXgupqP401qzwWC8WQhUf3hGLg2nVL63PkDJ/9I
         u8fq9W7TH91TUMhaR9yWkLuOqKbaM51jsHSnRbKOu7Y18Yg0VNJy/ubsha/fkbAgIukh
         TbICMyLRd7r2suy8R5X8ceEqkaYXL/nUyPKX6dnJpbbDSyw+JLbsSZvOKkeMfuN7rXys
         ++jFx5QEi3qkwp/txJDXdF8+IJ4YCHVzTMbhyApgW2m6fs4qfg2XCVZBlUlxa+jyyPIM
         SF+Q==
X-Gm-Message-State: AOJu0YwqsF+VXuKkV1GW7mBXhy7ahGd8a3CnahkJy/s2BndkZOOGQqBa
	xiUL5g3DvU1OT/jGiCL/f8ckVOw3pcW0uEsNblL20Ho+L8OQkLgVeri0zOq3KQOjOrhQi83o8o+
	Ma29z5MQ=
X-Gm-Gg: AR+sD122GzIPLBIVXzwkL0iX9viQ2nKOu46rPZL+2l6y9U9M0KhK79k1Yuv/Ohf41kE
	OmLfBLg0GFOPXDAl57luLoX6/Ak4d3hJZRFXF9ES7fRMVVEoIlLhEdJW5zA0A9Vdb61xvqn6N/C
	6KP98AkHJ1D8OnpZU1y0WJibxxJOiWHbOKoF3uDwciJVreYNBXrY7DahIcSQ2DnyhC+5C7PhLSy
	RcaXFE81ZLoEQ0Lcm0o4c8+dIhRe+kbKQgfMl66GAg70JJemt+4KrkhowA0asUIPe/DsQqmR4nr
	Br0CocXxT2Ky5+JKnFlyEouTqouurmWb3dbp2mKN6yUF/uARkiFie5iFugnwriJdD4sDvQ+dDeC
	5J9SgBWR17xiEBe10o8Aqp74DvItLw9hUQsgPN67igh+0ZlB5UqJC+8Q6gp5em0u6YuR0+kqY/C
	wrVrbMYV7e3SBA+Mo2fmd30TWoye6Fv0xfhXexQIwawHhqIUzG6jkgsyY46sVssNZw6xuVnsO4T
	GmbiA==
X-Received: by 2002:a05:600c:c4a3:b0:495:51b6:174f with SMTP id 5b1f17b1804b1-496b5747d82mr130846155e9.20.1785192966677;
        Mon, 27 Jul 2026 15:56:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/36] gawk: Fix CVE-2026-40468
Date: Tue, 28 Jul 2026 00:55:17 +0200
Message-ID: <ccfdb16bb69e16f4c81d4b0f751a3a815d3ea882.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242111

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=062f2f2581b991362c046f7f2e238ffa34e6f8c7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40468

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gawk/gawk/CVE-2026-40468.patch            | 61 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
new file mode 100644
index 00000000000..6b767c3bead
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
@@ -0,0 +1,61 @@
+From 1e0b3ebeb4a39680dcd9c8eeadd8e3bf1c7c6200 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Sat, 4 Apr 2026 21:45:58 +0300
+Subject: [PATCH] Minor integer overflow fixes.
+
+CVE: CVE-2026-40468
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=062f2f2581b991362c046f7f2e238ffa34e6f8c7]
+
+(cherry picked from commit 062f2f2581b991362c046f7f2e238ffa34e6f8c7)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ChangeLog | 8 ++++++++
+ builtin.c | 2 +-
+ node.c    | 2 +-
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 517aba91..8cdf90f6 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2026-04-04         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* builtin.c (do_sub): Make `sofar' be size_t to avoid
++	integer overflows.  Thanks to Michał Majchrowicz
++	<mmajchrowicz@afine.com> for the report.
++	* node.c (parse_escape): Change `i' to int64_t to avoid
++	overflows. Thanks to ASan with gcc -m32.
++
+ 2026-04-03         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* io.c (do_getline_redir): Don't DEREF redir_exp too early.
+diff --git a/builtin.c b/builtin.c
+index 6305b541..d0e083da 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -1806,7 +1806,7 @@ do_sub(int nargs, unsigned int flags)
+ 	char *repl;
+ 	char *replend;
+ 	size_t repllen;
+-	int sofar;
++	size_t sofar;
+ 	int ampersands;
+ 	int matches = 0;
+ 	Regexp *rp;
+diff --git a/node.c b/node.c
+index 0e2bfb0f..f1e14dff 100644
+--- a/node.c
++++ b/node.c
+@@ -584,7 +584,7 @@ parse_escape(const char **string_ptr, const char **result, size_t *nbytes)
+ 	static char buf[MB_LEN_MAX];
+ 	enum escape_results retval = ESCAPE_OK;
+ 	int c = *(*string_ptr)++;
+-	long i;
++	int64_t i;
+ 	int count;
+ 	int j;
+ 	const char *start;
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index 59c4cb2536f..345103a7f0a 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
            file://CVE-2026-40467.patch \
+           file://CVE-2026-40468.patch \
            "
 
 SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"

