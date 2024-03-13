Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1BBC54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.2043.1710351229008002428
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SDQIoRim;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-413e93b0f54so702335e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351227; x=1710956027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsRNSsodXYZoTZGBP4ozl6YbYAD5XK10ytyW97LUACw=;
        b=SDQIoRimM78VKDTjDMafedxbUGssaAEoXqKnTZ7/0XWpm3vI4AzKzZYKuulstHGE+3
         qEaePhYtYl5oCuozj+1hzEP4MXV+wGR1+XLHUGYUD0XTkDgMXAZKkBTqNSGxJHf1AIt9
         kf2eKMvEIo4+ofZjBwPWhIUPWvUvEZLXnxE9eb0VGMkMOprTsXoDiFsSFY4YONuPCDDj
         iB7+tym4O9CccLQGi5lbVRjlr5QlVx5aViQ9KGD3xkX3EqrhBQiDMXD+B5fl8bkrGyio
         HFNgQzipS3/L3CFQuDfSPGxLKYkKb7Ui9Oa4vUaRMJ3m01dxIFl48iwB1+N4rJM44Ud5
         A5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351227; x=1710956027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsRNSsodXYZoTZGBP4ozl6YbYAD5XK10ytyW97LUACw=;
        b=iVOKR23V1xQ+Z3camMn5JhC8NEyYIWQ7uzps2vodlgkt7RmQGRk0/r9iE2gKzT1bKJ
         bcC46rm8mLKxmDzuXUW/XMRVTmjtPf8d1iVerG3KmuTQaYvbvfbgxfx88G2JExSQ3KtR
         p1qxhexKCHMco6jWNhrwJEMD9k42AddkHTtQiC6HPUqWt7k5ADk7pMXzJDclqWAsXLoU
         ll7DmJ1P8F0IShRpLTu2sgacpVM+JNKGsYKTJk0GfdD1FIpi7R6LjXKNKPEuUxuW/C+9
         Zl0Qq8gyx3qw1zXGcR74pv7QRl+wB9PCD0y4g74jWtuP45IXQ3dtpdUWwXuVHsbFKXsD
         gu5w==
X-Gm-Message-State: AOJu0YyZZrKhxoZJFKk35VbUV5nanbQORpkNKCsCwko/+f6tXkhNH0PP
	4R9n87AxHbn8JzBLj3F1NxctMSGGYAwgm9vRP+OH47c7YmJHG1E5SflDsJGk
X-Google-Smtp-Source: AGHT+IESjUK2NU69BLLPRcmq1KMPgtwUdj8LdTS/r4POaZuTopdwYqsKvtorpPHFJ/HyWP4gcO1oew==
X-Received: by 2002:a05:600c:154d:b0:413:ee9e:fca6 with SMTP id f13-20020a05600c154d00b00413ee9efca6mr511960wmg.41.1710351227300;
        Wed, 13 Mar 2024 10:33:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/21] npth: update 1.6 -> 1.7
Date: Wed, 13 Mar 2024 18:33:27 +0100
Message-Id: <20240313173336.3900178-12-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197064

Drop 0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch
(upstream resolved the issue)

npth-config is no longer installed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...em-with-regression-tests-on-recent-g.patch | 43 -----------
 meta/recipes-support/npth/npth/musl-fix.patch | 37 ++++++++++
 .../recipes-support/npth/npth/pkgconfig.patch | 74 +++++++++++--------
 .../npth/{npth_1.6.bb => npth_1.7.bb}         | 10 +--
 4 files changed, 82 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-support/npth/npth/0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch
 create mode 100644 meta/recipes-support/npth/npth/musl-fix.patch
 rename meta/recipes-support/npth/{npth_1.6.bb => npth_1.7.bb} (68%)

diff --git a/meta/recipes-support/npth/npth/0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch b/meta/recipes-support/npth/npth/0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch
deleted file mode 100644
index 47c426b4a5c..00000000000
--- a/meta/recipes-support/npth/npth/0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e43524868bb4901703d63876f9d49f73ca75b3ab Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 May 2021 20:27:52 -0700
-Subject: [PATCH] Revert "Fix problem with regression tests on recent glibc."
-
-This reverts commit 3a9d32eb59194b989656548755066ccd9feb36ac.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8a9373c..8cda28d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -284,11 +284,9 @@ AC_TYPE_SSIZE_T
- #
- # Checks for libraries and functions.
- #
--#   We test for pthread_detach because glibc 2.22 includes
--#   pthread_create but not pthread_detach.
- if test "$have_w32_system" = no; then
--  AC_SEARCH_LIBS([pthread_detach],[pthread])
--  case "x$ac_cv_search_pthread_detach" in
-+  AC_SEARCH_LIBS([pthread_create],[pthread])
-+  case "x$ac_cv_search_pthread_create" in
-     xno)
-       have_pthread=no
-       ;;
-@@ -297,7 +295,7 @@ if test "$have_w32_system" = no; then
-       ;;
-     *)
-       have_pthread=yes
--      config_libs="$config_libs $ac_cv_search_pthread_detach"
-+      config_libs="$config_libs $ac_cv_search_pthread_create"
-       ;;
-   esac
-   if test "$have_pthread" != no; then
--- 
-2.31.1
-
diff --git a/meta/recipes-support/npth/npth/musl-fix.patch b/meta/recipes-support/npth/npth/musl-fix.patch
new file mode 100644
index 00000000000..fabe78b14c5
--- /dev/null
+++ b/meta/recipes-support/npth/npth/musl-fix.patch
@@ -0,0 +1,37 @@
+From 417abd56fd7bf45cd4948414050615cb1ad59134 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 1 Mar 2024 13:53:52 +0900
+Subject: [PATCH] Fix INSERT_EXPOSE_RWLOCK_API for musl C library.
+
+* configure.ac: Add a case for musl system.
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=417abd56fd7bf45cd4948414050615cb1ad59134]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+--
+
+GnuPG-bug-id: 5664
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c1091b1..576a26e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -381,7 +381,10 @@ fi
+ AC_SUBST(INSERT_NO_RWLOCK)
+ 
+ case "${host}" in
+-    *-*-linux*|*-*-gnu*)
++    *-*-linux-musl*)
++        INSERT_EXPOSE_RWLOCK_API="1"
++        ;;
++    *-*-linux-gnu*|*-*-gnu*)
+         INSERT_EXPOSE_RWLOCK_API="defined(__USE_UNIX98) || defined(__USE_XOPEN2K)"
+         ;;
+     *)
+-- 
+2.30.2
+
+
diff --git a/meta/recipes-support/npth/npth/pkgconfig.patch b/meta/recipes-support/npth/npth/pkgconfig.patch
index b6a12e73099..e736921b43d 100644
--- a/meta/recipes-support/npth/npth/pkgconfig.patch
+++ b/meta/recipes-support/npth/npth/pkgconfig.patch
@@ -1,13 +1,51 @@
-Added npth pkgconfig file
+From ff19a9648f1c7d93087e2c33ca64bb881d53ea5a Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Mon, 10 Nov 2014 13:59:03 -0800
+Subject: [PATCH] Added npth pkgconfig file
 
 Upstream-Status: Pending
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ configure.ac    |  1 +
+ src/Makefile.am |  4 +++-
+ src/npth.pc.in  | 10 ++++++++++
+ 3 files changed, 14 insertions(+), 1 deletion(-)
+ create mode 100644 src/npth.pc.in
 
-Index: npth-1.1/src/npth.pc.in
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 10f3629..65b76a1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -476,6 +476,7 @@ src/Makefile
+ w32/Makefile
+ tests/Makefile])
+ AC_CONFIG_FILES(npth-config, chmod +x npth-config)
++AC_CONFIG_FILES([src/npth.pc])
+ AC_OUTPUT
+ 
+ echo "
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 7070118..6f01c64 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -17,8 +17,10 @@
+ # License along with this program; if not, see <http://www.gnu.org/licenses/>.
+ 
+ ## Process this file with automake to produce Makefile.in
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = npth.pc
+ 
+-EXTRA_DIST = libnpth.vers
++EXTRA_DIST = libnpth.vers npth.pc
+ #	     versioninfo.rc.in
+ nodist_include_HEADERS = npth.h
+ 
+diff --git a/src/npth.pc.in b/src/npth.pc.in
+new file mode 100644
+index 0000000..db091e8
 --- /dev/null
-+++ npth-1.1/src/npth.pc.in
++++ b/src/npth.pc.in
 @@ -0,0 +1,10 @@
 +prefix=@prefix@
 +exec_prefix=@exec_prefix@
@@ -19,31 +57,3 @@ Index: npth-1.1/src/npth.pc.in
 +Version: @VERSION@
 +Libs: -L${libdir} -lnpth -lpthread
 +Cflags: -I${includedir}
-Index: npth-1.1/src/Makefile.am
-===================================================================
---- npth-1.1.orig/src/Makefile.am
-+++ npth-1.1/src/Makefile.am
-@@ -27,8 +27,10 @@
- # License along with this program; if not, see <http://www.gnu.org/licenses/>.
- 
- ## Process this file with automake to produce Makefile.in
-+pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfig_DATA = npth.pc
- 
--EXTRA_DIST = libnpth.vers
-+EXTRA_DIST = libnpth.vers npth.pc
- #	     versioninfo.rc.in
- nodist_include_HEADERS = npth.h
- 
-Index: npth-1.1/configure.ac
-===================================================================
---- npth-1.1.orig/configure.ac
-+++ npth-1.1/configure.ac
-@@ -337,6 +337,7 @@ src/Makefile
- w32/Makefile
- tests/Makefile])
- AC_CONFIG_FILES(npth-config, chmod +x npth-config)
-+AC_CONFIG_FILES([src/npth.pc])
- AC_OUTPUT
- 
- echo "
diff --git a/meta/recipes-support/npth/npth_1.6.bb b/meta/recipes-support/npth/npth_1.7.bb
similarity index 68%
rename from meta/recipes-support/npth/npth_1.6.bb
rename to meta/recipes-support/npth/npth_1.7.bb
index ef863d39b0c..f02a731f850 100644
--- a/meta/recipes-support/npth/npth_1.6.bb
+++ b/meta/recipes-support/npth/npth_1.7.bb
@@ -9,18 +9,14 @@ LIC_FILES_CHKSUM = "\
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
            file://pkgconfig.patch \
-           file://0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch \
-          "
+           file://musl-fix.patch \
+           "
 
-SRC_URI[md5sum] = "375d1a15ad969f32d25f1a7630929854"
-SRC_URI[sha256sum] = "1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1"
-
-BINCONFIG = "${bindir}/npth-config"
+SRC_URI[sha256sum] = "8589f56937b75ce33b28d312fccbf302b3b71ec3f3945fde6aaa74027914ad05"
 
 inherit autotools binconfig-disabled multilib_header
 
 FILES:${PN} = "${libdir}/libnpth.so.*"
-FILES:${PN}-dev += "${bindir}/npth-config"
 
 do_install:append() {
     oe_multilib_header npth.h
-- 
2.39.2


