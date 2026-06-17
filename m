Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34624CD98F6
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:48:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10441.1781682488805867694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xh2gVqRb;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4629051c946so222610f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682487; x=1782287287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A71wNK+X40bMh1SpR6Xf0A23hvLl/NHbPtvyQMhVzw4=;
        b=xh2gVqRbOfQwgdD88Sk/5AusH3QLOlsh2m+LSUtdACgdbrQPtuu6Mz20N/q5L50XkC
         TTbUG3FE0Ol2EMf4n1bYg1j/C3MjjYrdyawLvyKwoTAhCcekyTkWdgzRIfZ7nZNBLryc
         OMc8pmJDGu1Kbf2kuTkhVTQoqlvi0qk1lGVrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682487; x=1782287287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A71wNK+X40bMh1SpR6Xf0A23hvLl/NHbPtvyQMhVzw4=;
        b=V1ETY0tabQA1IAF5NCyizhWNKOi/fCYzlcSEG1zTIX5Id7jyrb4ZnJz4ZcF2bH64lR
         Iiv+B4BgFvwe6TnQenhg7fTiM8uD+7zGyTbF+b/JnIbW5/xKcIRRsRLjzTQ5ecjJ8cF1
         ftGI62aQzsH4IBdcIP5ld8QGK6UwKctCvO6teOqqdSj/8RhQ/qg1RBNulTAaZpeuiOC5
         CzBbvWnAc7g7iqeg/zHaIPUBJ6G/HiUZJabbYQIsE/BeAEQSO3x+LV4k5M/Rgsd0mNDT
         yx32aMMKhR1fMy5tYworALFQ4lp2RrYMlmAN6zyDLu2NhVhTUVa70edFiPhK1P6Z20C3
         TTYQ==
X-Gm-Message-State: AOJu0YzSDRDa6shWqPWIWN9avY9OP0D47h/oLuvZkXqK4h151S0JmiGf
	r4blxPnbWqJf9rZ7BOZQ1plpNNgE6vQMzo4sK5tkH4SCynwk0W156jl2LjOYu4w+8pl+TlO4sYP
	5c4Q9
X-Gm-Gg: AfdE7cliNa+MZAQZCwouygUh+IWl2CmN0qFcIk8wGE3Rov3ax9Ynv/rJ9koP+2fi2PU
	8aOKYVoOMtyYS+6cdIcLk6h9Rr9zeyUashRXwQ2L6K768iO1msZKxgBZ0OoVGTdps79eR1YKFRB
	GpMpt+SJRT84oLzDc9ZBbqlwSMjdlGFatQLGieK5EjSGjB+0WnYNvNIU7PSBw7YBtq6eqJ/KROR
	cfvIh2oOXSmZ6UpVEsQJ5BgGdmj9UYdPVLrmum7aKfHkS/mBsG8ipzU/3fjl3D0+gk0Svt1Oqra
	RkubWrvcuKLw8XJLICMJ6di2Uit78a3359sEeLfqvEP+Z+9Sge3OYHCRyGc/Evt+1Z6hrytNRte
	bRNZOCrvV4cjo3+XEF/zxrclmxfGUoGSZjPEg+G5zUYN+inPiQqVXTeFc1TjAV5irdWBbmqHuy2
	Zin1eRHsvoq0k6H0gn8aesNIHwnaUAN/j/BF+laNqNaltiXQZy71P7BubIMHTttzO1ln77tJLt7
	j00YTkjQOOpTd/nVQ==
X-Received: by 2002:a5d:6f08:0:b0:460:21e7:330e with SMTP id ffacd0b85a97d-462692f8afemr3034479f8f.10.1781682486975;
        Wed, 17 Jun 2026 00:48:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm54721732f8f.35.2026.06.17.00.48.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:48:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 3/8] curl: fix mbedtls detection
Date: Wed, 17 Jun 2026 09:47:54 +0200
Message-ID: <903cae3bd478565c11fe913034fc5e3d7eef9286.1781682367.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682367.git.yoann.congal@smile.fr>
References: <cover.1781682367.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239018

From: Ross Burton <ross.burton@arm.com>

The mbedtls detection logic in curl is broken and resulted in build
paths leaking into curl-config and libcurl.pc.  Backport a patch to fix
the detection by looking for a symbol that wasn't removed in mbedtls 3.0
five years ago, and remove the explicit sysroot reference as it is no
longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6ba523565325571bf7e21d39a6839b7f42c7083)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl/mbedtls.patch | 41 ++++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb     |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/mbedtls.patch

diff --git a/meta/recipes-support/curl/curl/mbedtls.patch b/meta/recipes-support/curl/curl/mbedtls.patch
new file mode 100644
index 00000000000..f2f2c457aa5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/mbedtls.patch
@@ -0,0 +1,41 @@
+From 50b1408f97d9e8fc585c5351cbf86bf60a30eb59 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sat, 23 May 2026 01:05:10 +0200
+Subject: [PATCH] autotools: mbedtls detection fixes
+
+- fix symbol used for first-round detection.
+- skip detecting mbedtls on custom path if custom path was not supplied.
+
+Reported-by: Ross Burton
+Fixes #21727
+
+Closes #21729
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/50b1408f97d9e8fc585c5351cbf86bf60a30eb59]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ m4/curl-mbedtls.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/curl-mbedtls.m4 b/m4/curl-mbedtls.m4
+index 7c5bccd22983..6887302592d6 100644
+--- a/m4/curl-mbedtls.m4
++++ b/m4/curl-mbedtls.m4
+@@ -42,7 +42,7 @@ if test "x$OPT_MBEDTLS" != "xno"; then
+     if test -z "$OPT_MBEDTLS"; then
+       dnl check for lib first without setting any new path
+ 
+-      AC_CHECK_LIB(mbedtls, mbedtls_havege_init,
++      AC_CHECK_LIB(mbedtls, mbedtls_ssl_init,
+       dnl libmbedtls found, set the variable
+       [
+         AC_DEFINE(USE_MBEDTLS, 1, [if mbedTLS is enabled])
+@@ -58,7 +58,7 @@ if test "x$OPT_MBEDTLS" != "xno"; then
+     addcflags=""
+     mbedtlslib=""
+ 
+-    if test "$USE_MBEDTLS" != "yes"; then
++    if test "$USE_MBEDTLS" != "yes" && test -n "$OPT_MBEDTLS"; then
+       dnl add the path and test again
+       addld=-L$OPT_MBEDTLS/lib$libsuff
+       addcflags=-I$OPT_MBEDTLS/include
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 9aa2ccb7870..d58b7740112 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2026-6276.patch \
+    file://mbedtls.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
@@ -57,7 +58,7 @@ PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,openldap"
 PACKAGECONFIG[libgsasl] = "--with-libgsasl,--without-libgsasl,libgsasl"
 PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
-PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
+PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls"
 PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt,"
 PACKAGECONFIG[negotiate-auth] = "--enable-negotiate-auth,--disable-negotiate-auth"
 PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"

