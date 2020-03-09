Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id E0C8C61B64
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 23:44:42 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id y30so5422349pga.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 16:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DNjRIGnHYChAq+wkzQhUYStMsykfjVm6LtjP9rOw4bg=;
	b=BW86I9mDlCX06MK6f6pdTKaI/LX7Nf1c1pAowtTMQeg1wSbfg523cP+hlORqUzSt5b
	TdiIFrl3w/DovOW0GqdWs9YT5Wr8fPsgHI/oCsfdYzIgUvhL06swj+qllsUORThzu2qH
	ELbOQMc15IFEgOKI95KKM31Wm6/VQL47XGv0G0dPGC4wLQl+ABA+I8G5tz3Ig1gbrqOF
	K9Iwm63Qj6sx36Kta+R4wI6qhb0hrnO1ZtyzaSf8aacxkIS0zTrdEsrFTmApupq9guiV
	xDkaVfFSA/2WioUv6441LKDBgJCDZmxRz4O35Hu2SV1lJSC/ekZrAUMMR2G56dQh8dIy
	sakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DNjRIGnHYChAq+wkzQhUYStMsykfjVm6LtjP9rOw4bg=;
	b=RqQSXm2K9YB/DdYq+HPDJnEq8IIM6Gtc0bKGey18mMbWZpIH5U+ElqR1VFD8BrDhmM
	bniMeXCu8mD3qy8QHjyKT31dYtu4UNdpz+vBJtFAEC5Vec5LYR/pmVg/6B/ZzsuAOLMI
	JWOQhHs5HVsWFflCwAn1a/iPy7Yc0xaoP9TQYa0fFL3MIUhWI1jrDfofGU3DukWiElIc
	KXVsR/Zj3cWboteQ7Pc1PIm0wknnnXtvQxBs45CnS62cjiGPj2TS7+HcUXBwEoBt5oZ/
	aiLLGx2UY1Fsq6FH2zFWFrx0vqpSO/5EvqbKl2Ia/Y9JdjYIPuNyl5oaCWxOtfcMkCf2
	eVMA==
X-Gm-Message-State: ANhLgQ0rmpnvuYMHkf8qjCvmy/B3gVl7oQM6v3cUywRBm/8MpS17QbkW
	RpPmOB6PzSdP6tNvbYkMlj1RRNAw/pE=
X-Google-Smtp-Source: ADFU+vth0oBJZIgIbGB4So7M5UFnpLmDuS+bU8wyhYI8EtpfpeqX4KZ7NiXpUubBa1rUGn+XfB6H8A==
X-Received: by 2002:a62:760e:: with SMTP id r14mr11647009pfc.51.1583797483119; 
	Mon, 09 Mar 2020 16:44:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	s7sm44313584pgp.44.2020.03.09.16.44.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 16:44:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 16:44:54 -0700
Message-Id: <20200309234454.1387958-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309234454.1387958-1-raj.khem@gmail.com>
References: <20200309234454.1387958-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] valgrind: Fix timerfb syscall test to be 64bit time_t safe
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
X-List-Received-Date: Mon, 09 Mar 2020 23:44:43 -0000
Content-Transfer-Encoding: 8bit

This helps compile the testcase with musl on 32bit arches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...check-tests-Fix-timerfd-syscall-test.patch | 210 ++++++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |   1 +
 2 files changed, 211 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
new file mode 100644
index 0000000000..d1d96a0eff
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -0,0 +1,210 @@
+From 5d411fd147d652e9d7bb259f4048693c6e4742aa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 9 Mar 2020 16:30:19 -0700
+Subject: [PATCH] memcheck/tests: Fix timerfd syscall test
+
+modern libc provides these functions, moreover this also ensures that we
+are 64bit time_t safe. Fallback to existing definitions if libc does not
+have the implementation or syscall is not defined
+
+Upstream-Status: Submitted [https://sourceforge.net/p/valgrind/mailman/message/36943866/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ config.h                               |  9 +++++++++
+ config.h.in                            |  9 +++++++++
+ configure                              |  3 +++
+ configure.ac                           |  3 +++
+ memcheck/tests/linux/timerfd-syscall.c | 10 ++++++++--
+ 5 files changed, 32 insertions(+), 2 deletions(-)
+
+--- a/config.h
++++ b/config.h
+@@ -47,20 +47,20 @@
+ /* #undef ENABLE_LTO */
+ 
+ /* path to GDB */
+-#define GDB_PATH "/usr/bin/gdb"
++#define GDB_PATH "/no/gdb/was/found/at/configure/time"
+ 
+ /* Define to 1 if index() and strlen() have been optimized heavily (x86 glibc
+    >= 2.12) */
+-#define GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT 1
++/* #undef GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT */
+ 
+ /* Define to 1 if strlen() has been optimized heavily (amd64 glibc >= 2.10) */
+-#define GLIBC_MANDATORY_STRLEN_REDIRECT 1
++/* #undef GLIBC_MANDATORY_STRLEN_REDIRECT */
+ 
+ /* Define to 1 if you have the <asm/unistd.h> header file. */
+ #define HAVE_ASM_UNISTD_H 1
+ 
+ /* Define to 1 if as supports fxsave64/fxrstor64. */
+-#define HAVE_AS_AMD64_FXSAVE64 1
++/* #undef HAVE_AS_AMD64_FXSAVE64 */
+ 
+ /* Define to 1 if as supports floating point phased out category. */
+ /* #undef HAVE_AS_PPC_FPPO */
+@@ -92,7 +92,7 @@
+ #define HAVE_CLOCK_MONOTONIC 1
+ 
+ /* Define to 1 if you have a dlinfo that can do RTLD_DI_TLS_MODID. */
+-#define HAVE_DLINFO_RTLD_DI_TLS_MODID 1
++/* #undef HAVE_DLINFO_RTLD_DI_TLS_MODID */
+ 
+ /* Define to 1 if the system has the type `Elf32_Chdr'. */
+ #define HAVE_ELF32_CHDR 1
+@@ -134,7 +134,7 @@
+ /* #undef HAVE_LIBSCF */
+ 
+ /* Define to 1 if you have the `mallinfo' function. */
+-#define HAVE_MALLINFO 1
++/* #undef HAVE_MALLINFO */
+ 
+ /* Define to 1 if you have the `memchr' function. */
+ #define HAVE_MEMCHR 1
+@@ -176,26 +176,26 @@
+ /* #undef HAVE_PTHREAD_CREATE_GLIBC_2_0 */
+ 
+ /* Define to 1 if you have the `PTHREAD_MUTEX_ADAPTIVE_NP' constant. */
+-#define HAVE_PTHREAD_MUTEX_ADAPTIVE_NP 1
++/* #undef HAVE_PTHREAD_MUTEX_ADAPTIVE_NP */
+ 
+ /* Define to 1 if you have the `PTHREAD_MUTEX_ERRORCHECK_NP' constant. */
+-#define HAVE_PTHREAD_MUTEX_ERRORCHECK_NP 1
++/* #undef HAVE_PTHREAD_MUTEX_ERRORCHECK_NP */
+ 
+ /* Define to 1 if you have the `PTHREAD_MUTEX_RECURSIVE_NP' constant. */
+-#define HAVE_PTHREAD_MUTEX_RECURSIVE_NP 1
++/* #undef HAVE_PTHREAD_MUTEX_RECURSIVE_NP */
+ 
+ /* Define to 1 if you have the `pthread_mutex_timedlock' function. */
+ #define HAVE_PTHREAD_MUTEX_TIMEDLOCK 1
+ 
+ /* Define to 1 if pthread_mutex_t has a member __data.__kind. */
+-#define HAVE_PTHREAD_MUTEX_T__DATA__KIND 1
++/* #undef HAVE_PTHREAD_MUTEX_T__DATA__KIND */
+ 
+ /* Define to 1 if pthread_mutex_t has a member called __m_kind. */
+ /* #undef HAVE_PTHREAD_MUTEX_T__M_KIND */
+ 
+ /* Define to 1 if you have the `PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP'
+    constant. */
+-#define HAVE_PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP 1
++/* #undef HAVE_PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP */
+ 
+ /* Define to 1 if you have the `pthread_rwlock_t' type. */
+ #define HAVE_PTHREAD_RWLOCK_T 1
+@@ -213,7 +213,7 @@
+ #define HAVE_PTHREAD_SPIN_LOCK 1
+ 
+ /* Define to 1 if you have the `pthread_yield' function. */
+-#define HAVE_PTHREAD_YIELD 1
++/* #undef HAVE_PTHREAD_YIELD */
+ 
+ /* Define to 1 if you have the `PTRACE_GETREGS' ptrace request. */
+ #define HAVE_PTRACE_GETREGS 1
+@@ -309,7 +309,16 @@
+ #define HAVE_SYS_TYPES_H 1
+ 
+ /* Define to 1 if <sys/user.h> defines struct user_regs_struct */
+-#define HAVE_SYS_USER_REGS 1
++/* #undef HAVE_SYS_USER_REGS */
++
++/* Define to 1 if you have the `timerfd_create' function. */
++#define HAVE_TIMERFD_CREATE 1
++
++/* Define to 1 if you have the `timerfd_gettime' function. */
++#define HAVE_TIMERFD_GETTIME 1
++
++/* Define to 1 if you have the `timerfd_settime' function. */
++#define HAVE_TIMERFD_SETTIME 1
+ 
+ /* can use __thread to define thread-local variables */
+ #define HAVE_TLS 1
+@@ -324,7 +333,7 @@
+ #define HAVE_UTIMENSAT 1
+ 
+ /* Define to 1 if you're using Musl libc */
+-/* #undef MUSL_LIBC */
++#define MUSL_LIBC 1
+ 
+ /* Name of package */
+ #define PACKAGE "valgrind"
+--- a/config.h.in
++++ b/config.h.in
+@@ -310,6 +310,15 @@
+ /* Define to 1 if <sys/user.h> defines struct user_regs_struct */
+ #undef HAVE_SYS_USER_REGS
+ 
++/* Define to 1 if you have the `timerfd_create' function. */
++#undef HAVE_TIMERFD_CREATE
++
++/* Define to 1 if you have the `timerfd_gettime' function. */
++#undef HAVE_TIMERFD_GETTIME
++
++/* Define to 1 if you have the `timerfd_settime' function. */
++#undef HAVE_TIMERFD_SETTIME
++
+ /* can use __thread to define thread-local variables */
+ #undef HAVE_TLS
+ 
+--- a/configure.ac
++++ b/configure.ac
+@@ -4169,6 +4169,9 @@ AC_CHECK_FUNCS([     \
+         strrchr      \
+         strstr       \
+         syscall      \
++        timerfd_create    \
++        timerfd_gettime   \
++        timerfd_settime   \
+         utimensat    \
+         process_vm_readv  \
+         process_vm_writev \
+--- a/memcheck/tests/linux/timerfd-syscall.c
++++ b/memcheck/tests/linux/timerfd-syscall.c
+@@ -54,7 +54,7 @@
+  * timerfd_* system call numbers introduced in 2.6.23. These constants are
+  * not yet in the glibc 2.7 headers, that is why they are defined here.
+  */
+-#ifndef __NR_timerfd_create
++#if !defined(__NR_timerfd_create) && !defined(HAVE_TIMERFD_CREATE)
+ #if defined(__x86_64__)
+ #define __NR_timerfd_create  283
+ #elif defined(__i386__)
+@@ -68,7 +68,7 @@
+ #endif
+ #endif
+ 
+-#ifndef __NR_timerfd_settime
++#if !defined(__NR_timerfd_settime) && !defined(HAVE_TIMERFD_SETTIME)
+ #if defined(__x86_64__)
+ #define __NR_timerfd_settime 286
+ #define __NR_timerfd_gettime 287
+@@ -127,21 +127,27 @@ void set_timespec(struct timespec *tmr,
+   tmr->tv_nsec = (long) (1000ULL * (ustime % 1000000ULL));
+ }
+ 
++#if !defined(HAVE_TIMERFD_CREATE)
+ int timerfd_create(int clockid, int flags)
+ {
+   return syscall(__NR_timerfd_create, clockid, flags);
+ }
++#endif
+ 
++#if !defined(HAVE_TIMERFD_SETTIME)
+ int timerfd_settime(int ufc, int flags, const struct itimerspec *utmr,
+ 		    struct itimerspec *otmr)
+ {
+   return syscall(__NR_timerfd_settime, ufc, flags, utmr, otmr);
+ }
++#endif
+ 
++#if !defined(HAVE_TIMERFD_GETTIME)
+ int timerfd_gettime(int ufc, struct itimerspec *otmr)
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


