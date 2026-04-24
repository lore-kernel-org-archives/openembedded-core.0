Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F5FFF8844
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:13 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32613.1777064231196487986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ujtFaCxM;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4891f625344so70031875e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064229; x=1777669029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/5uH84GzSNCTskm7w//9+OTClqBfMpIL+hWWoQQbBw=;
        b=ujtFaCxMaRVdUxFqTEeLHDcETspMSiiXiu3uewV1S6gjy2UVLR1MoWgoq4nqYqpO6s
         9QkK5b353fDeodlz55aAxgftLvw79zandX4HlOvrg+b47O78oHu0x0qwWJs4T7zQ9pRy
         GQnBuIR8iHP/yVM02R5VbWeBr4Am47fGLZosc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064229; x=1777669029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4/5uH84GzSNCTskm7w//9+OTClqBfMpIL+hWWoQQbBw=;
        b=Ep4/9iUvxqZcS6yX2yT+c6ChIEhy7FQsVvqE/okEog51A7g7MT1SesxcQtWakZfYoN
         6GsNVb3Z5t3DxErBiZ+KqiuxQ/lCdp7iFgp/8LUYERVRhPrQXRqwviZqZBAnh62uZRh9
         GE6lt3WaiNhnlpKujgZSBS0qKYf9iSBGOnnCRIQz6tWJgwIY1dblTCmH0vQQFiyymboN
         KXEVx7deA4c4xvyHoRSsQ5fWwDRHk1RgU6Tu4d25/Ro0h+90mgJy/OvNT1To+NOReRnZ
         DzIrrL63grNX6YAo2FX4lp6EX8uVp57U6CbMbg/DhU3pP+Uo0dqhtSzedIVqWV6ijGbD
         xD5A==
X-Gm-Message-State: AOJu0YzqlGgewm84xMhebwtzYyImHaeeUkKA64Eq5cVQaAHULdSUiORo
	8csA4gRTSPgvdJjSgNcLFo3CC7muo4gWScQl5iKxYr3y4hKtidSySYACvu/AZcoMaDzGNO3OMuk
	B1+ET/CRxMNAj
X-Gm-Gg: AeBDievUogWX2GwSc6Zr3TKrEDLBOoq/9Qta4SLZv8h/GDvWZmb9LbnVpXwNJqjR+in
	Vf7u8zFZke2s3rSZ05ejWbspqwrFvNSpiOeFq+VBr85wWSTeXMUaxUfWV87LP6ltePxf+rsapA8
	uhw8QkLuciU+U7xl5wu4gLnB18ATXdB4cMxUbhn6+zyZCRKCq5wV3bx4dcc6Z87LVtPKTnTV1zO
	a4W7S3ohpFXMt2tZqD5EcHt3YRtPTF4FBc7yoEjqPoUyyeR7WvtZmdqh/Z1aA02e0Blnq5CMWfL
	SfJbfXw54aX9hjlnVrZmyf/2x090Lrx7io3m3h8QUpIO2gLrtc/+uphwS7Hx+AUuZSdVTbl6Sq5
	CZyexvLjiUeW/1hGLCXGmjM4je7IhLG/hQIEa8zuGYlh3FHibbMRLZXXfJOXFpTvrmGr+5tsKIN
	y4KqK1VqRqhVwGzq3hlc415KdJRpgDHKa+hIUbs5M+m1kgVdmOmxfUjes4DB5uw2ul3s47yOZIU
	wAHw4RCZyEv0Qsk8lCS2UnTHSyhUWyTRCaHHg==
X-Received: by 2002:a05:600c:c112:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-488fb896910mr385436015e9.7.1777064229259;
        Fri, 24 Apr 2026 13:57:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 56/66] db: Pin to use C99 std
Date: Fri, 24 Apr 2026 22:55:55 +0200
Message-ID: <ff6d0aa3ce4d39bc6b140c13846b5872ce4a181c.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235929

From: Khem Raj <raj.khem@gmail.com>

GCC-15 has switched to using C23 by default, we have been selectively
disabling warnings as errors to get by, however with autoconf 2.72 adding
-std=gnu23 it now gets enabled for every compiler and clang-22 is more
obidient and has dropped support for K&R C completely. db5 code has a lot
of K&R C prototypes and it starts to fail vigorously. We can not keep
working around with out uplifting sources to be compliant with newer C
standard like C23.

Therefore pin the cflags to use C99 standard as this package expects.

Drop the code to disable warnings as errors selectively instead add a
fix for addressing implicit int warnings

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8615b3388b97a56096b959dea4d7499e03187100)
[YC: switched from CFLAGS += to CFLAGS:append]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../db/0001-Fix-implicit-int-warnings.patch   | 106 ++++++++++++++++++
 meta/recipes-support/db/db_5.3.28.bb          |   9 +-
 2 files changed, 111 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/db/db/0001-Fix-implicit-int-warnings.patch

diff --git a/meta/recipes-support/db/db/0001-Fix-implicit-int-warnings.patch b/meta/recipes-support/db/db/0001-Fix-implicit-int-warnings.patch
new file mode 100644
index 00000000000..5cca6dffa11
--- /dev/null
+++ b/meta/recipes-support/db/db/0001-Fix-implicit-int-warnings.patch
@@ -0,0 +1,106 @@
+From c744b20658641b46cf66429f573240b1b5737872 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 8 Apr 2026 08:52:55 -0700
+Subject: [PATCH] Fix implicit int warnings
+
+Newer compilers flag this warning which results in configure tests
+failing especially seen on native builds where AC_TRY_RUN is
+being used to detect mutex support.
+
+Also see
+https://sources.debian.org/src/db5.3/5.3.28%2Bdfsg2-11/debian/patches/014-implicit-int.patch
+
+Upstream-Status: Inappropriate [Inactive Upstream]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ dist/aclocal/mutex.m4 | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/dist/aclocal/mutex.m4 b/dist/aclocal/mutex.m4
+index 81f1ea8..8476f39 100644
+--- a/dist/aclocal/mutex.m4
++++ b/dist/aclocal/mutex.m4
+@@ -5,7 +5,7 @@ AC_DEFUN(AM_PTHREADS_SHARED, [
+ AC_TRY_RUN([
+ #include <stdlib.h>
+ #include <pthread.h>
+-main() {
++int main() {
+ 	pthread_cond_t cond;
+ 	pthread_mutex_t mutex;
+ 	pthread_condattr_t condattr;
+@@ -49,7 +49,7 @@ AC_DEFUN(AM_PTHREADS_PRIVATE, [
+ AC_TRY_RUN([
+ #include <stdlib.h>
+ #include <pthread.h>
+-main() {
++int main() {
+ 	pthread_cond_t cond;
+ 	pthread_mutex_t mutex;
+ 	pthread_condattr_t condattr;
+@@ -89,13 +89,13 @@ AC_DEFUN(AM_PTHREADS_CONDVAR_DUPINITCHK, [
+ AC_TRY_RUN([
+ #include <stdlib.h>
+ #include <pthread.h>
+-main() {
++int main() {
+ 	pthread_cond_t cond;
+ 	pthread_condattr_t condattr;
+ 	exit(pthread_condattr_init(&condattr) ||
+ 	pthread_cond_init(&cond, &condattr) ||
+ 	pthread_cond_init(&cond, &condattr));
+-}], [db_cv_pthread_condinit_dupgood="yes"], 
++}], [db_cv_pthread_condinit_dupgood="yes"],
+ [db_cv_pthread_condinit_dupgood="no"],
+ AC_TRY_LINK([
+ #include <stdlib.h>
+@@ -104,19 +104,19 @@ AC_TRY_LINK([
+ 	pthread_condattr_t condattr;
+ 	exit(pthread_condattr_init(&condattr) ||
+ 	pthread_cond_init(&cond, &condattr));
+-], [db_cv_pthread_condinit_dupgood="yes"], 
++], [db_cv_pthread_condinit_dupgood="yes"],
+ [db_cv_pthread_condinit_dupgood="no"]))])
+ AC_DEFUN(AM_PTHREADS_RWLOCKVAR_DUPINITCHK, [
+ AC_TRY_RUN([
+ #include <stdlib.h>
+ #include <pthread.h>
+-main() {
++int main() {
+ 	pthread_rwlock_t rwlock;
+ 	pthread_rwlockattr_t rwlockattr;
+ 	exit(pthread_rwlockattr_init(&rwlockattr) ||
+ 	pthread_rwlock_init(&rwlock, &rwlockattr) ||
+ 	pthread_rwlock_init(&rwlock, &rwlockattr));
+-}], [db_cv_pthread_rwlockinit_dupgood="yes"], 
++}], [db_cv_pthread_rwlockinit_dupgood="yes"],
+ [db_cv_pthread_rwlockinit_dupgood="no"],
+ AC_TRY_LINK([
+ #include <stdlib.h>
+@@ -125,7 +125,7 @@ AC_TRY_LINK([
+ 	pthread_rwlockattr_t rwlockattr;
+ 	exit(pthread_rwlockattr_init(&rwlockattr) ||
+ 	pthread_rwlock_init(&rwlock, &rwlockattr));
+-], [db_cv_pthread_rwlockinit_dupgood="yes"], 
++], [db_cv_pthread_rwlockinit_dupgood="yes"],
+ [db_cv_pthread_rwlockinit_dupgood="no"]))])
+ 
+ # Figure out mutexes for this compiler/architecture.
+@@ -207,7 +207,7 @@ if test "$db_cv_mutex" = no; then
+ 		;;
+ 	esac
+ 	# We probe for private pthreads only when the user has asked for posix
+-	# mutexes and we don't have a multiprocess pthreads library available. 
++	# mutexes and we don't have a multiprocess pthreads library available.
+ 	if test "$db_cv_mutex" = posix_only; then
+ 		AM_PTHREADS_PRIVATE(POSIX/pthreads/private)
+ 		AM_PTHREADS_CONDVAR_DUPINITCHK
+@@ -571,7 +571,7 @@
+ 
+ # UNIX fcntl system call mutexes.
+ # Note that fcntl mutexes are no longer supported as of 4.8.  This code has been
+-# left in place in case there is some system that we are not aware of that 
++# left in place in case there is some system that we are not aware of that
+ # only uses fcntl mutexes.  In that case, contact Oracle for support.
+ if test "$db_cv_mutex" = no; then
+ 	db_cv_mutex=UNIX/fcntl
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index a7d061e0da3..2f21d153c27 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://fix-parallel-build.patch \
             file://sequence-type.patch \
             file://0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch \
             file://0001-clock-Do-not-define-own-timespec.patch \
+            file://0001-Fix-implicit-int-warnings.patch \
            "
 # We are not interested in official latest 6.x versions;
 # let's track what debian is using.
@@ -72,7 +73,11 @@ AUTOTOOLS_SCRIPT_PATH = "${S}/dist"
 # configure.
 CONFIG_SITE = ""
 
+CFLAGS:append = " -std=gnu99"
+
 oe_runconf:prepend() {
+	export CFLAGS="${CFLAGS}"
+
 	. ${S}/dist/RELEASE
 	# Edit version information we couldn't pre-compute.
 	sed -i -e "s/__EDIT_DB_VERSION_FAMILY__/$DB_VERSION_FAMILY/g" \
@@ -116,7 +121,3 @@ INSANE_SKIP:${PN} = "dev-so"
 INSANE_SKIP:${PN}-cxx = "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
-
-# many configure tests are failing with gcc-14
-CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"
-BUILD_CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"

