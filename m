Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90548C54F5F
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2698.1785277326988080613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cPIhzXjj;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso1535055e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277325; x=1785882125; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87eIEN+8RqPPk5Qy+6VFck85eYscwVcE+eicST6hko4=;
        b=cPIhzXjjG1eNk2GSXr/5/6Khw48zbwbtpBiFQi5jiF7f4reJ9e5pxk7lYIiNAMZXtX
         F4PDSBIudsCsucEkJMWMFVlK6gFrcmXINIZVUg7hoyp6+4Ol1/GzFJa6sN1yx5eWeFVh
         ohhvXKiVExoNooxtxxvYoPrDFiCqog2JRkxKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277325; x=1785882125;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87eIEN+8RqPPk5Qy+6VFck85eYscwVcE+eicST6hko4=;
        b=domdv9JZA9uQ898FoZeJqZF5Q/NKIfyPE49Pbj8q3b2/VGUxRuM7RhylfZn+5x48jb
         tlKZ+v1dPleSLJJ8mYhug41+ETlGsYrfC5O6Ab3e3ZLjue6A+YqOpW2g0/Zinui/0xRo
         ripdF+IcJRG5j3Ls4x4PI9oy27nVW9s1ihHxJfEeRjrMEAAen7ZIC2tUXQky4Pt5ljKp
         tzeYIHSx8e3ML5Z/cGo+Zz4KbSMgf/Y/VWnHxf4Z+LKA0qzjEccwWmDQDNNXYehx8Nmy
         ajhuk2seqxYJ9J20D+W/xsPpbeOKZ/LVphHSSQFo8k77YMOl9jzZI2H4RX+/6CQIX15p
         yAkA==
X-Gm-Message-State: AOJu0YxIePNzNDL5coUMyBfgSFlfds5iWIrfq7hrdU2TagpJjQkGWsQk
	OEA+ua1WJG7GfY5l+OakuMYKy39vDNsqVe1QLe7aK8eEPNTwBrDtYuhwlA+F/UAzi0dMtSgHSyY
	8CGflQEg=
X-Gm-Gg: AR+sD12Ee5Hf8V+2B3KIq5NIGB1vI9gZi5PQr2rdQCRSPM/WMhQomSdi3L/K4wUvO1K
	NYQVk3KwP9XsDeYZogUYurC1C8SqnWzVxK/VCu6ONGNAg/tZZ38u/K4IwhwaRYHKexP6iokT7ti
	PoKqIt6r2LTJGiTLYTA1Rriws2bWFopza9lzIHntft7omu2/4tsCcGGu+pMvgzhq0fMkH/+2gPn
	EHbUL9U1zoiC6AkWrYy8VbPUa7OjZuQZHvOQ7Men+KCNiVbO+S6UOVg0ARgwLZ9epb37BMCynrn
	F2hs6JScg5ENNU8gPNwsF4SJIo5B8H8PgEthtjtW7LQw1JGoR1sUO8fcPGiMHYFp5ZEqboi4bch
	tWXk0prz274TL9lAou5Ypu6m65ZqT3bGG4I8idxlBlfXZhiIwIZm3n8sfsNB+9AeyOg5tBCHX60
	Tl2X1fg8ngcLIFlclAo+ZhAE5u1J8MA4Ho6iiaWDkvTr+jHQ1qbJMQJoV/mKe5y+lTkvwesfWvK
	mB1pXGv10GgVExiU92LEqe58q+WSoGLbw1YG1slREs0KYWt1Fr5NMfRfgK6Xhah
X-Received: by 2002:a05:600c:c8d:b0:493:c8f7:3631 with SMTP id 5b1f17b1804b1-496c6575e33mr40445465e9.22.1785277325237;
        Tue, 28 Jul 2026 15:22:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/19] gawk: Fix CVE-2026-40468
Date: Wed, 29 Jul 2026 00:21:39 +0200
Message-ID: <a149dbcad38f6f838db303b76fffbfe68052e74e.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242207

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=062f2f2581b991362c046f7f2e238ffa34e6f8c7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40468

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gawk/gawk/CVE-2026-40468.patch            | 65 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
new file mode 100644
index 00000000000..607f641615b
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
@@ -0,0 +1,65 @@
+From e281dfa04afc4660419ad69c9f24bc6b4067f8d8 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Sat, 4 Apr 2026 21:45:58 +0300
+Subject: [PATCH] Minor integer overflow fixes.
+
+CVE: CVE-2026-40468
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=062f2f2581b991362c046f7f2e238ffa34e6f8c7]
+
+Backport Changes:
+- Adapt the parse_escape() type change for gawk 5.3.0, where i is
+  declared int instead of long.
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
+index 6bc88ebb..e691b241 100644
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
+index ba3459db..80ab6069 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -2985,7 +2985,7 @@ do_sub(int nargs, unsigned int flags)
+ 	char *repl;
+ 	char *replend;
+ 	size_t repllen;
+-	int sofar;
++	size_t sofar;
+ 	int ampersands;
+ 	int matches = 0;
+ 	Regexp *rp;
+diff --git a/node.c b/node.c
+index f08a57d7..12a8fab4 100644
+--- a/node.c
++++ b/node.c
+@@ -571,7 +571,7 @@ parse_escape(const char **string_ptr, const char **result, size_t *nbytes)
+ 	static char buf[MB_LEN_MAX];
+ 	enum escape_results retval = ESCAPE_OK;
+ 	int c = *(*string_ptr)++;
+-	int i;
++	int64_t i;
+ 	int count;
+ 	int j;
+ 	const char *start;
+-- 
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index 56d7d7f76af..d79b0222a67 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            file://0001-Fix-some-C23-compilatio-issues.patch \
            file://CVE-2026-40467.patch \
+           file://CVE-2026-40468.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"

