Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFE5C48BE4
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 06:34:50 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.8066.1661322890239191409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=isHrqvPo;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 x14-20020a17090a8a8e00b001fb61a71d99so596760pjn.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=m0m4BoNGCgEl/I9DQ3OpR8zfsrjfaqg6G6rlcBFEUjg=;
        b=isHrqvPoEQgkm5GpdlfTYM9srfhWbeUVsoH01NbHv9BGZCjEWomy9JzNdpC2WwDB0U
         p50axF22qVN4fWclsJe6IlYEJuew+sO1vbcMmRyURYnGSQjCFVZ0JoTxkdm01aQBBG6L
         gFQ2IQ8sLjWA7+eWSgyGIMloVVgudTiZfo2CvL4UZKxh93fWPWHa8WPGj8d//Z/lOWDP
         NFgAUPJmRPtrR1MfdoE/ucz2pbSwnbhNb0EUbocewpsSAO95BGC/bq2lQJ8sPT3ULqM4
         SKaNjuUnLJKJn6n3aFsFJYVKgs0VR0nkqnnmwhHFVRD0oOdzYoUr/hcJlq/+cKw9rUxD
         pUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=m0m4BoNGCgEl/I9DQ3OpR8zfsrjfaqg6G6rlcBFEUjg=;
        b=TdWs5KIld/S8Ch/zpELxZJGM2V727jUOMgHGrC0GCZETCsxnB4Ui6iSLW/n+wwtN5T
         z/5wzZ7LPmgKeEtxBvjLuhxgW6kLnaZBAxu0IlUo+MZpKbALerd1HSOLI+CzL1KHCCkN
         bitSViWaatz0l2uvhbmTQtDfcjqfL3IdjkPKN0vOxsWfsExVGMx8iVuGcMfKYfBQ88cV
         oXi80OpkEJ17+w8OsdXjPBzLFybh4IVgsIXUTewtiJbTyY7z49uy/SHTJfnHCkAZKyrT
         b9QvUo/OSGyT0b9WwMcSksliG/Lx9X8815dpBBQHV95sZBHP5Pzljt94nX7lnOLmUjlJ
         q5tQ==
X-Gm-Message-State: ACgBeo2Ncq7i5xjrSqVmXeqWXReO7J280G3MqwLHbdJyUpd0CrFz1p6B
	uplen2HSz0eqL6wy6LICLRbLgheUnAx+7A==
X-Google-Smtp-Source: 
 AA6agR4uoQxKero4/KMj0N4yus/waaOPiXGJEVbFuTXW8CszUvebxiEialvgMGgZ1GqRxRU0iXX+cA==
X-Received: by 2002:a17:902:a60f:b0:172:e476:fde with SMTP id
 u15-20020a170902a60f00b00172e4760fdemr13712346plq.104.1661322889334;
        Tue, 23 Aug 2022 23:34:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a639258000000b0042a3d9a1275sm8384957pgn.16.2022.08.23.23.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:34:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/7] apr: Use correct strerror_r implementation based on libc
 type
Date: Tue, 23 Aug 2022 23:34:41 -0700
Message-Id: <20220824063443.1774094-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824063443.1774094-1-raj.khem@gmail.com>
References: <20220824063443.1774094-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 06:34:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169779

musl does not implement GNU extention of strerror_r but XSI compliant
version, therefore add it via a packageconfig to set right variables
during configure to cache the value.

configure detection logic depends on runtime test which will always be
wrong on cross compiles therefore backport a patch to make it possible
to cache the needed configure variable.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.37.2


