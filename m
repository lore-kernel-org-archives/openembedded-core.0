Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63AAC0502C
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:41 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.26509.1661956831646622775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=A6Lbnsid;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id fa2so6642244pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=S1Me8GfQmp72ZdZJSHKCzRxls05eA7ost0LoQzeQ6zM=;
        b=A6LbnsidgCvCEQp6ox2Y2WClWhB4O0Ahk4u6vGFBWFvqS10kr4EL1AWpLVeil4nlUw
         5J4Up4fRbIbaOGiJ3ZTTcpOddcYgnCmQ9+X3TCjGddrOzzA0T1l7kGIGlGNgVo+mdmlf
         Y61qGPSebEzdvK8tzkTNhnG/5PX7yTd+NAGyPkns7yp8NA/IjJ2bMzpc4ehUdP9wxv3m
         krwZA+ON3C8kzeBpI91f/+htMdgFKd0CcKkIdzWm/gIyh0VbHqxWKWgVyZjwhMgwOCB3
         E3JpuMB3dvC7edzrvYG+xEqfplTOl9J39a6y8hv95bvgSq4s4HQ3KTmDriXmK0TUHJGS
         +o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=S1Me8GfQmp72ZdZJSHKCzRxls05eA7ost0LoQzeQ6zM=;
        b=hx545xA8GdZ513i8DKiudauJrmMtn8wZAV90XGer/CobgcES8lD3rAVHsKdMyomhXq
         wV3yzuV+47+AO6MGGF0vTlNLPl1+nak3hikE4pM4tEhSqbWQodGuuw2j0t74FDgTEX/H
         4J9vvAcN4AduY5Mvgn9M4y0wlrksLumCPru7BTnjJgIolx4Wu6JbjCLnCCp3YuNWO0J/
         2SkikboX7XoFExIIaL7CQjjbrnbHUFCIW4LTNvyUtQJN7StE4Rov/dCmTRrKzGnjrM6j
         1C+xUYdtCgai5bkxzxUdRNoJanIYd3Si1/v/ygHL2LNSM4Gz/wWzmTP2zOIHSZfyL1ei
         KdqA==
X-Gm-Message-State: ACgBeo1XmJKrG5Jkr65GABOoLUkY9PPwgM6HppGRanQ4ziY/m4EwQ1v8
	txiVzX8mP5ZTzKwHUxr/kvP/PVQu9dAeJ/T9
X-Google-Smtp-Source: 
 AA6agR5UUPuas2TIpt61WM5piJs8touIsNq3gxhK/VMbfPJuHiEDAB6tAa83tuKFIphaSaGRDUjMsg==
X-Received: by 2002:a17:90b:17d0:b0:1fe:3256:d10a with SMTP id
 me16-20020a17090b17d000b001fe3256d10amr2730467pjb.125.1661956830644;
        Wed, 31 Aug 2022 07:40:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/19] apr: Use correct strerror_r implementation
 based on libc type
Date: Wed, 31 Aug 2022 04:39:38 -1000
Message-Id: 
 <c209e38cf89c8fae3c6735e74203294c2c3810f4.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170129

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
index 9c826d4380..07bf61545e 100644
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
 
 do_configure:prepend() {
 	# Avoid absolute paths for grep since it causes failures
-- 
2.25.1


