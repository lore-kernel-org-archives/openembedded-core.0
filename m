Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC91C74A4B
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:45 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.8637.1678229324101292487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=AyApGY/p;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id n6so15830251plf.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWHmaC2Qp3Li5TzJtvDSfJNUEqpC4LslPssow/GtwRQ=;
        b=AyApGY/psmi/twLL22GyPqTKKb1ijn4tzUm5FcUawa3+Y2HQjPrv8bwNG7g5Z0vgks
         +dqt07BONcyTcNzAzLxq2x0VhnnY6R/IgDM+uyeFTht6Zg3k1llWRfl6hsDouNBKifl9
         f0mCYcoDz74UJ1qDEg7Em5GjZkV3L2Cs43Wu8yNodExaI+3JcVOLhbf7tQagyAfnnWXn
         e4CRAW6KrgoOnLYskSETPC4uqXZbCs1digaJYwSSnu/vYHlgwzBzf0/J5XV36LQuDRmk
         3fgAU9+djsQh8LmbQr8/aTekeAWEb5Qum8NrDYZhdQorkB4KL3Sb5aoG0UU2yJwTZZ81
         hZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWHmaC2Qp3Li5TzJtvDSfJNUEqpC4LslPssow/GtwRQ=;
        b=JBVeK+vms4vlQrfcQkY3SLgPzmcCcm6fxo0d8sNANp1i8oBLPR17cVb+x2YMvozZGx
         OE5bJ4gXXVoBSf77kiBj0EadosGdIviPNXhI4AYUCYmxLvba75TeCMII7ffiwCg70t+D
         4GvtjOu/iGab8hAtfLyJc+Loy7vSv8EODoh701orhKgKaIwvkGnoNwXD5ExrRk88bkHU
         x9pmZ/gXmBoErxWD5/grIqsw9WR3yogBbGVlokbwT9uobg0KF//tEsb/uLtqq0HzROwa
         5J8sDc0fIlSejqb57JNHkQSDy5KLR+jH3dMfLBkRTbLUL5hwF3lnEhq0DA9u9Z28oGyA
         TCmg==
X-Gm-Message-State: AO0yUKVi2Q3SJfVi1WwkPrUHvIC4DdeFcfd/o51lgRJSswKQVrFdD2j5
	2H/2U8LV3g1jyEmonXLN+bgUwk0lMlU9wJLvTxU=
X-Google-Smtp-Source: AK7set9qOfObQbO9yf5Yw1t75E5HYvg3P0nF0Da+SNkHHUFWkz4/11GOosRwBD5juvNlApCRunkIkA==
X-Received: by 2002:a05:6a21:7897:b0:be:a55a:8910 with SMTP id bf23-20020a056a21789700b000bea55a8910mr18094596pzc.4.1678229323056;
        Tue, 07 Mar 2023 14:48:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/23] apr: Use correct strerror_r implementation based on libc type
Date: Tue,  7 Mar 2023 12:47:48 -1000
Message-Id: <993cfeaefa73e3b82cf15db78584e5f9b9f86ddf.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178136

From: Khem Raj <raj.khem@gmail.com>

musl does not implement GNU extention of strerror_r but XSI compliant
version, therefore add it via a packageconfig to set right variables
during configure to cache the value.

configure detection logic depends on runtime test which will always be
wrong on cross compiles therefore backport a patch to make it possible
to cache the needed configure variable.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ded3d76a844dd1aef9ac610fbe506bf76285369b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...CHE_CHECK-for-strerror_r-return-type.patch | 52 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.0.bb         |  4 ++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch

diff --git a/meta/recipes-support/apr/apr/0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch b/meta/recipes-support/apr/apr/0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch
new file mode 100644
index 0000000000..d0a9bd9129
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch
@@ -0,0 +1,52 @@
+From 8ca3c3306f1a149e51a3be6a4b1e47e9aee88262 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Aug 2022 22:42:03 -0700
+Subject: [PATCH] add AC_CACHE_CHECK for strerror_r return type
+
+APR's configure script uses AC_TRY_RUN to detect whether the return type
+of strerror_r is int. When cross-compiling this defaults to no.
+
+This commit adds an AC_CACHE_CHECK so users who cross-compile APR may
+influence the outcome with a configure variable.
+
+Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&revision=1875065]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build/apr_common.m4 | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/build/apr_common.m4 b/build/apr_common.m4
+index cbf2a4c..42e75cf 100644
+--- a/build/apr_common.m4
++++ b/build/apr_common.m4
+@@ -525,8 +525,9 @@ dnl  string.
+ dnl
+ dnl
+ AC_DEFUN([APR_CHECK_STRERROR_R_RC], [
+-AC_MSG_CHECKING(for type of return code from strerror_r)
+-AC_TRY_RUN([
++AC_CACHE_CHECK([whether return code from strerror_r has type int],
++[ac_cv_strerror_r_rc_int],
++[AC_TRY_RUN([
+ #include <errno.h>
+ #include <string.h>
+ #include <stdio.h>
+@@ -542,14 +543,10 @@ main()
+ }], [
+     ac_cv_strerror_r_rc_int=yes ], [
+     ac_cv_strerror_r_rc_int=no ], [
+-    ac_cv_strerror_r_rc_int=no ] )
++    ac_cv_strerror_r_rc_int=no ] ) ] )
+ if test "x$ac_cv_strerror_r_rc_int" = xyes; then
+   AC_DEFINE(STRERROR_R_RC_INT, 1, [Define if strerror returns int])
+-  msg="int"
+-else
+-  msg="pointer"
+ fi
+-AC_MSG_RESULT([$msg])
+ ] )
+ 
+ dnl
+-- 
+2.37.2
+
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index b70edfaf42..b9d3e356da 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            file://autoconf270.patch \
+           file://0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch \
            file://CVE-2021-35940.patch \
            "
 
@@ -44,9 +45,12 @@ CACHED_CONFIGUREVARS += "ac_cv_header_netinet_sctp_h=no ac_cv_header_netinet_sct
 CACHED_CONFIGUREVARS += "ac_cv_sizeof_struct_iovec=yes"
 CACHED_CONFIGUREVARS += "ac_cv_file__dev_zero=yes"
 
+CACHED_CONFIGUREVARS:append:libc-musl = " ac_cv_strerror_r_rc_int=yes"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG:append:libc-musl = " xsi-strerror"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[timed-tests] = "--enable-timed-tests,--disable-timed-tests,"
+PACKAGECONFIG[xsi-strerror] = "ac_cv_strerror_r_rc_int=yes,ac_cv_strerror_r_rc_int=no,"
 
 do_configure_prepend() {
 	# Avoid absolute paths for grep since it causes failures
-- 
2.34.1


