Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AA6C44503
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93236.1782742828856643690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wJGVtwje;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b68b4643so3023405e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742827; x=1783347627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZdurTAp8abezk+0dADuhG4qtzdfP51zr9UJ2hL8LYE=;
        b=wJGVtwjedcZbSImYeajH4Gp4jP8jP2EQkTz0o2nFMPbDV3D6Y9x7p530C74v5KyzxY
         QdZE1Pm9j8e7ErCbnPSrO7qOfy2/gF0w0SkhNkKh2cc0UeDdym6+dFrRnjv2S5zLF9A1
         YlHDiVU6PckGWEHsU6N6YmPyq4wESJgj6e8b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742827; x=1783347627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZdurTAp8abezk+0dADuhG4qtzdfP51zr9UJ2hL8LYE=;
        b=Y0i/FZV7YdFHslhqaxiMYAvk1ityB/BNuMdHijR3oS6qZFufk0+VpfceZjGTB0N2Pg
         viCURBT1nIFX1js5rygTM0upcd4IsAqMCgAkbdAVZ2+YzjxSWfRUU4CGEe6gx0QX3mNS
         xf0HtVQ31n/6tw/XMYigpI5NCoFa1G2G944wP9OkRlMGxUdPBaAIGq3EjuX/hGrtdwed
         6TZ1u6UCPh0nDeQYUoCcu1sDj2O4usf1eiJN3guIVAT3guH0inocMw5uQMpg8E23bAQS
         G3QTyvvxM5JQ8RMr1EXtEVEPPv5XmJPEv1C3mei761x6zBLkY9QwYFsVA4kDEobBlcPj
         jYsg==
X-Gm-Message-State: AOJu0YzPY8qJXvGLvsu0e43ZKA0uqR54TSIWr9Qq12bteCjn0GV/OYGl
	Dd1iyjDlkkZgtMHoAQIy/sNPkIOHUMOu3qJPusUgurJUNk7dubLrB3bz59QItLM59nObFVGwj3w
	bHrkGCLo=
X-Gm-Gg: AfdE7ckRUnR7T2KM/+XOn8fpbwa2rnc8bNw6XETZycIEzMkB4pMimsPEJT7Wz8pKHS1
	8ZhtVDwokj4C1q1eIX738KjecV+8sLy1J3lMkPBdvrd3aBK1lxEay7LYhpxMdY4dfqJ4AFQMqMy
	xwt+Zxzi+dLyPovSsYz1mwfo6Bd4f34Rk1YBHzjnhJKRAipiM+4SJUVKyux5Cj2hqsbo5+Kkye9
	dqDj5XyQpxjynNmjn2+jJ/e6dPxZcp6QD+SvOTOZZdaZjcCjmbD/c2Edveo53+2MSAuXbUKVCH2
	WT+svI4OAbjwe/XAWIW7QRni+GyIJAmAP1KSr/NUmZJ28GJwJaO2ksiQ0QFRGYjTZOeXNoMGmQ6
	2g/LrDQlBBGzuAg781T6UGsKvTTlmDV7wC8xwvwcpX/pOcantQ0EeQPvBmkS1PMrLOZO6Slzvx0
	1UO0HP5sHfXWUWX5Yf8JMjEPdxVKUMSUOuxGrebCfSUuLCZnEaWPU1lld/qE66mu4PDXGrDqjXP
	lNYPcEYwAZxRjGUqo5ia4U=
X-Received: by 2002:a05:600c:1908:b0:492:465c:56f6 with SMTP id 5b1f17b1804b1-49266873d4emr254955825e9.10.1782742826702;
        Mon, 29 Jun 2026 07:20:26 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/19] gawk-native: fix gcc-15/C23 compilation issues
Date: Mon, 29 Jun 2026 16:19:49 +0200
Message-ID: <790bccfd8b82809e87311b24f71cf9f8e6a02b5e.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239792

From: Yoann Congal <yoann.congal@smile.fr>

On Ubuntu 26.04, GCC 15 defaults to std=c23 and that results in build
failure:
| ../gawk-5.3.0/io.c: In function ‘iop_alloc’:
| ../gawk-5.3.0/io.c:3389:31: error: assignment to ‘ssize_t (*)(int,  void *, size_t)’ {aka ‘long int (*)(int,  void *, long unsigned int)’} from incompatible pointer type ‘ssize_t (*)(void)’ {aka ‘long int (*)(void)’} [-Wincompatible-pointer-types]
|  3389 |         iop->public.read_func = ( ssize_t(*)() ) read;
|       |                               ^

Fix this by (partially) backporting an upstream patch.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-Fix-some-C23-compilatio-issues.patch | 35 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-Fix-some-C23-compilatio-issues.patch

diff --git a/meta/recipes-extended/gawk/gawk/0001-Fix-some-C23-compilatio-issues.patch b/meta/recipes-extended/gawk/gawk/0001-Fix-some-C23-compilatio-issues.patch
new file mode 100644
index 00000000000..7082e62beb6
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0001-Fix-some-C23-compilatio-issues.patch
@@ -0,0 +1,35 @@
+From e4015d209ddc31bd1256fa568612372407e0b9c5 Mon Sep 17 00:00:00 2001
+From: Arnold D. Robbins <arnold@skeeve.com>
+Date: Mon, 12 Aug 2024 06:33:28 +0300
+Subject: [PATCH] Fix some C23 compilatio issues.
+
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=7a521fe4b37f8554ca53ef3236f0352e391aaa1d (in v5.3.1)]
+Backport: Only kept the code change, dropped comment changes
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ io.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/io.c b/io.c
+index c595c009e..44671ebd1 100644
+--- a/io.c
++++ b/io.c
+@@ -3386,7 +3386,7 @@ iop_alloc(int fd, const char *name, int errno_val)
+ 
+ 	iop->public.fd = fd;
+ 	iop->public.name = name;
+-	iop->public.read_func = ( ssize_t(*)() ) read;
++	iop->public.read_func = ( ssize_t(*)(int, void *, size_t) ) read;
+ 	iop->valid = false;
+ 	iop->errcode = errno_val;
+ 
+@@ -4446,7 +4446,7 @@ get_read_timeout(IOBUF *iop)
+ 		tmout = read_default_timeout;	/* initialized from env. variable in init_io() */
+ 
+ 	/* overwrite read routine only if an extension has not done so */
+-	if ((iop->public.read_func == ( ssize_t(*)() ) read) && tmout > 0)
++	if ((iop->public.read_func == ( ssize_t(*)(int, void *, size_t) ) read) && tmout > 0)
+ 		iop->public.read_func = read_with_timeout;
+ 
+ 	return tmout;
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index e38c1f84366..b1d1fe7ae47 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -21,6 +21,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
+           file://0001-Fix-some-C23-compilatio-issues.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"

