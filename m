Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 43D0A61B53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 01:15:33 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id h8so5521647pgs.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 18:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uCnM61Neo2QF2YRFl6K8wsS9IdUyVOj31xbKYC5FXX0=;
	b=rrsz1bvET6/3D/0sDXSmO5ynfMWG2tVuVErFN7mNpVnca/OcXu07WnZA57ed7J93Mn
	8zeASfii+o1qmSy1kc+bYyJq4yg2INcWOwfd7WmdUfwUbOiMYV0w/pz9n5xdXrSBIrY9
	kquaUGonl1EQw9JGzj1MUt/cDvdWWUCT8kYu7ET6hei0VuErkn9KDmuhhkjX1v+J2Vcb
	tOMYdR9IG2isyOAuYK20WaFy7ZSa0OWdFBTE+wwUIub+/yE8X3wcvqMV1I5zBd5LJRkG
	nH6vLY7MK3+sP37MrcR+Ee8jE0bPVvrFz8foSK+vv7c33rsCuHQOALhJf4V8cx3/ejAO
	pPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uCnM61Neo2QF2YRFl6K8wsS9IdUyVOj31xbKYC5FXX0=;
	b=rQmxkD7+QkRWOYMiW+/DJi48ztLQ0ztedLdae9LVQ+VG9BRikleQAw9xyFRv3vOeSI
	1RC8fETS4zdivBmBRq9XVTGtMaEk35bfdtxrG/KEtldZfg0tncYLZ69lZpO9c8GXF2PJ
	IMzfMjnEZVqVxt2YmqaOPZOM8RAjricBoxbllRR4MFIUelWysIyjmMujlT13pyaPZobT
	gVywF7CLRowU3wYJ/AbtY/0GXKbwY+Biw63RZm7wC7TwM7nrmQCoXPHNR5PscKfyjsZ4
	LoyCVjhlHrXhuSuMPatLQ2BvmGyphX9P0uW6E1ZxoxT6yvr1slyfbJOMm5va/PqsgLmy
	tUIA==
X-Gm-Message-State: ANhLgQ3SDxpZEg70ZUaidPZtnXXvblWnausJUoD2Xi9gFO2D8Usb+Smh
	aXPsUMLLjUkdlUI4aveCmgh10gxhg8w=
X-Google-Smtp-Source: ADFU+vs3if2K720ejSCkZ+UONoEFVKCZkioafKHqQRhazNsGVWCcXTJPZPgjmXaXFeHbGdzJoHyX7A==
X-Received: by 2002:a63:6f06:: with SMTP id k6mr11099717pgc.371.1583802933724; 
	Mon, 09 Mar 2020 18:15:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id na18sm737200pjb.9.2020.03.09.18.15.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 18:15:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 18:15:43 -0700
Message-Id: <20200310011544.3022342-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310011544.3022342-1-raj.khem@gmail.com>
References: <20200310011544.3022342-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/3] valgrind: Fix timerfd syscall test to be 64bit time_t safe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Mar 2020 01:15:33 -0000
Content-Transfer-Encoding: 8bit

This helps compile the testcase with musl on 32bit arches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use header check instead of function checks

 ...check-tests-Fix-timerfd-syscall-test.patch | 98 +++++++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
new file mode 100644
index 0000000000..15fbbe954f
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -0,0 +1,98 @@
+From 5d411fd147d652e9d7bb259f4048693c6e4742aa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 9 Mar 2020 16:30:19 -0700
+Subject: [PATCH] memcheck/tests: Fix timerfd syscall test
+
+modern libc provides these functions, moreover this also ensures that we
+are 64bit time_t safe. Fallback to existing definitions if libc does not
+have the implementation or syscall is not defined
+
+Upstream-Status: Submitted [https://sourceforge.net/p/valgrind/mailman/message/36943897/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ config.h.in                            |  9 +++++++++
+ configure.ac                           |  3 +++
+ memcheck/tests/linux/timerfd-syscall.c | 10 ++++++++--
+ 5 files changed, 32 insertions(+), 2 deletions(-)
+
+--- a/config.h.in
++++ b/config.h.in
+@@ -301,6 +301,9 @@
+ /* Define to 1 if you have the <sys/sysnvl.h> header file. */
+ #undef HAVE_SYS_SYSNVL_H
+ 
++/* Define to 1 if you have the <sys/timerfd.h> header file. */
++#undef HAVE_SYS_TIMERFD_H
++
+ /* Define to 1 if you have the <sys/time.h> header file. */
+ #undef HAVE_SYS_TIME_H
+ 
+--- a/configure.ac
++++ b/configure.ac
+@@ -4098,6 +4098,7 @@ AC_CHECK_HEADERS([       \
+         sys/syscall.h    \
+         sys/sysnvl.h     \
+         sys/time.h       \
++        sys/timerfd.h    \
+         sys/types.h      \
+         ])
+ 
+--- a/memcheck/tests/linux/timerfd-syscall.c
++++ b/memcheck/tests/linux/timerfd-syscall.c
+@@ -45,6 +45,9 @@
+ #if defined(HAVE_SYS_TIME_H)
+ #include <sys/time.h>
+ #endif
++#if defined(HAVE_SYS_TIMERFD_H)
++#include <sys/timerfd.h>
++#endif
+ #if defined(HAVE_SYS_TYPES_H)
+ #include <sys/types.h>
+ #endif
+@@ -54,7 +57,8 @@
+  * timerfd_* system call numbers introduced in 2.6.23. These constants are
+  * not yet in the glibc 2.7 headers, that is why they are defined here.
+  */
+-#ifndef __NR_timerfd_create
++#if !defined(HAVE_SYS_TIMERFD_H)
++#if !defined(__NR_timerfd_create)
+ #if defined(__x86_64__)
+ #define __NR_timerfd_create  283
+ #elif defined(__i386__)
+@@ -67,8 +71,10 @@
+ #error Cannot detect your architecture!
+ #endif
+ #endif
++#endif
+ 
+-#ifndef __NR_timerfd_settime
++#if !defined(HAVE_SYS_TIMERFD_H)
++#if !defined(__NR_timerfd_settime)
+ #if defined(__x86_64__)
+ #define __NR_timerfd_settime 286
+ #define __NR_timerfd_gettime 287
+@@ -85,7 +91,7 @@
+ #error Cannot detect your architecture!
+ #endif
+ #endif
+-
++#endif
+ 
+ 
+ /* Definitions from include/linux/timerfd.h */
+@@ -127,6 +133,7 @@ void set_timespec(struct timespec *tmr,
+   tmr->tv_nsec = (long) (1000ULL * (ustime % 1000000ULL));
+ }
+ 
++#if !defined(HAVE_SYS_TIMERFD_H)
+ int timerfd_create(int clockid, int flags)
+ {
+   return syscall(__NR_timerfd_create, clockid, flags);
+@@ -142,6 +149,7 @@ int timerfd_gettime(int ufc, struct itim
+ {
+   return syscall(__NR_timerfd_gettime, ufc, otmr);
+ }
++#endif
+ 
+ long waittmr(int tfd, int timeo)
+ {
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 1475ff841e..7954437a1a 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-tests-Make-pthread_detatch-call-portable-across-plat.patch \
+           file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            "
 SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
 SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
-- 
2.25.1


