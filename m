Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B57A10F995C
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 16:28:14 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.110563.1775665683985123298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 09:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aQzIpFkw;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso33991eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775665683; x=1776270483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+F/UXJRHNzsu4WLd345JUIQivDi+ZUd/0ax/5YFH90=;
        b=aQzIpFkwS662YFrGs61LJ1r78ZIjvaZWWxQrx3pTbcsBWJRRceMLwExpCs7wmzk6z0
         u8/buM7fRXcaEIWMRxwesA8Q9KSzMXMG3i6Jhp04lHGgNMRfq8tz8Uql7Qac3U4tnjC1
         Fh7sdlW+CmbpNTP3nXjuxtRnActh6CGhhOIAUHQ1IPLpgZ1S0xZvNg+SiqvCZ7QCOm9G
         mMkQfwcA51AHQfxLpiMFXIFGp4hMJmBMVF+lA5kvsirYmg5heBVjkmUvQLAUI/fptAOt
         jPr0pZCAgWU8TbKOOKbN0DUVDhnxBW53PfRSDe+zFouzn9yQ1+fYFE+bw8QTnX0sNOoy
         CqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775665683; x=1776270483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+F/UXJRHNzsu4WLd345JUIQivDi+ZUd/0ax/5YFH90=;
        b=ou50HFNG/T21WDhXMz9qNoo1WvDjvLvnRvrXQ/xvhmm9tZ/tqvRY4YIFHe9H47kYOS
         ol/nJP0TpCdP7d1/Xh+vYZMEsEdUDCyeLcbaSyDs7CrbwRXNgZJtM8t6FJbzNCT+lsiX
         5NgN5cjdw/YSRKK08pC1wk0X6lY6zULGjyAMCF24V2M4vyQge2DsLmJ05xSTgfeJRbjp
         XRMpAMEMypi43hc5atz7fpynJv2nRRWTwIXUWlUpZj15rBDF3XHuY/nMng7Pu79HtirN
         mcNCCaChy1A+gFdgoneYsjXUgVOhun1HKOHTMZ593w5gQnCptbpAkVQQSMrP116iwf19
         RV0w==
X-Gm-Message-State: AOJu0YxopYfoeiXxAL+bXygiUp7mNdAJZUc442x5fHJhHvLywnQwFPiV
	PhVsRa7V/WsvCUXe2uDxqxSVZRf6qkcdSawjQRzW3BN0++u6Dx7GkAMEwkfVIUtQ
X-Gm-Gg: AeBDietQ22oPomxi4G1qWjyj3O/AuQssJ4FwWbFioxoGG3lipAW3bdDF0rz+3ayP0MX
	LkAfU7UKdO/kPLwlZZoeJrrCVAIKZAeW02yYWqAXtoaCEHY55l+1TMRdZm8l32bDs5l+O7bGU5O
	TYAKUpyQauz8BkG/T8DiYkYnwB3iTbiT9ohckFZpv3rnSAiGLL0wIi85wHEGNuJEpVHGfg7cMee
	DxqAUm7O8jdt6AvI9CWno2OYg99PUOOvn1gzYp26lbPJOuqXVj5BYdYiYb37td5ED2khOhXblsj
	M6fm0iXrAlYciwVZ3hWoEWoUGzZpOapL4cOKY4svPRQwuOOd1wKjpj5/kgVPQpIAFq7c2C3lLUl
	Rj6d4HpXUmbnibFQo23OEluSdqBnXlK7NwfsT4mb7xL10irlLu7Y1TVuRPiNepoZzEUUjMZyQwG
	A8cgrqDYrCoBSZPr8zZy+Yc9yZGFJEqTvOF/j6WhLZ8Du2Zb/Nv84d3JQ1UG9U4LMRXxthg63Z2
	/QDxXfJstvue/wTWv2S3Mp3DJ8C3b6i4P/2IkjMhlxjV8j5BQi7HMcy7y+d
X-Received: by 2002:a05:7300:a887:b0:2c9:ee15:a0ee with SMTP id 5a478bee46e88-2d40f5dbd39mr70486eec.12.1775665682729;
        Wed, 08 Apr 2026 09:28:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d3d48801e7sm1034858eec.16.2026.04.08.09.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:28:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2] db: Pin to use C99 std
Date: Wed,  8 Apr 2026 09:27:59 -0700
Message-ID: <20260408162759.842544-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 16:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234856

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
---
v2: Fix native build regression

 .../db/0001-Fix-implicit-int-warnings.patch   | 106 ++++++++++++++++++
 meta/recipes-support/db/db_5.3.28.bb          |  10 +-
 2 files changed, 111 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/db/db/0001-Fix-implicit-int-warnings.patch

diff --git a/meta/recipes-support/db/db/0001-Fix-implicit-int-warnings.patch b/meta/recipes-support/db/db/0001-Fix-implicit-int-warnings.patch
new file mode 100644
index 0000000000..fff3e876f9
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
+@@ -571,7 +571,7 @@ fi
+
+ # UNIX fcntl system call mutexes.
+ # Note that fcntl mutexes are no longer supported as of 4.8.  This code has been
+-# left in place in case there is some system that we are not aware of that
++# left in place in case there is some system that we are not aware of that
+ # only uses fcntl mutexes.  In that case, contact Oracle for support.
+ if test "$db_cv_mutex" = no; then
+ 	db_cv_mutex=UNIX/fcntl
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 8d2af1f5dc..9183f52ae3 100644
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
@@ -71,7 +72,11 @@ AUTOTOOLS_SCRIPT_PATH = "${S}/dist"
 # configure.
 CONFIG_SITE = ""

+CFLAGS += "-std=gnu99"
+
 oe_runconf:prepend() {
+	export CFLAGS="${CFLAGS}"
+
 	. ${S}/dist/RELEASE
 	# Edit version information we couldn't pre-compute.
 	sed -i -e "s/__EDIT_DB_VERSION_FAMILY__/$DB_VERSION_FAMILY/g" \
@@ -115,8 +120,3 @@ INSANE_SKIP:${PN} = "dev-so"
 INSANE_SKIP:${PN}-cxx = "dev-so"

 BBCLASSEXTEND = "native nativesdk"
-
-# many configure tests are failing with gcc-14
-# -Wno-error=incompatible-pointer-types needed for gcc-15
-CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
-BUILD_CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"

