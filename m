Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1645577FA6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:34:41 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id q85so8249617pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NyegmRLN9a4uw+XjZttgxXA+IzD8xJG2tnWbpiFW3Dw=;
	b=RMm6F2Ije7JYOkIe4GgODIA8pNaD/y/rqzjRT6qhAWkcI3ED7vA+t/7R+aE6H5hhVr
	runx5Smm0YoKqsHIMpVpWLahAsjugLjVOSC6DoJSQQ7dlft9IoRnifqsB2rNs17Ub4D2
	xP0ZqmgMYCgNXZsgTufJv+/w2jE4SVUDRTdcm5y7056EeiU6kbfeqdB7jH10Yyak9NdY
	SqGAch7dSfJvNEUOxV2j4UGStTKG4reqHzyIP4uKAYBKdZjg065+wlLgPEKbbvfdidBR
	a/DmCZiHBmHHmcohGraaMOP/fF1oHPQ0ppuExkBcifJd0FuDI5uQKwyjhnnAfU+pLrX/
	hYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NyegmRLN9a4uw+XjZttgxXA+IzD8xJG2tnWbpiFW3Dw=;
	b=aSmYWWl4ilQ66p+ZDek3uXUlDCHl4yHRdJJcPa5Oh8syoDcxKaLl/bsH07lYfu9WnB
	zJA3JCtRlk+6Nzrz8BngEpRlL8hQVC54BNHRIVqGCyGoxCkWsYfHtmp3Qc/zuO4dA51M
	2AM69PtWUKXBjzJ/FIRNF4E4J60LfMxDIXn8OsReX5VPoLBSLmqnTFwUwlqePgO6T9K2
	JW0LmJK42XUsBVfqM0XrGeHBx/UFlaH3AXi9uxazT6qnNn+CrL0eN9OZ2kYORSPQeGrH
	pNlKZtpKBoF44fuXH5GlnqxcYyKdgbcf2yZKf7vKJM7aRRHRF6gMXtQNb9X5gr0F+rlT
	Aivg==
X-Gm-Message-State: AIVw110LD735GQMGbT4P4Cb/U+UvanfAJuMrxYKA1GuFm6ZvFdqz3akJ
	452F74gjk9pnb91c
X-Received: by 10.99.62.65 with SMTP id l62mr6230196pga.106.1499520883074;
	Sat, 08 Jul 2017 06:34:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	i27sm15575561pfi.82.2017.07.08.06.34.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:34:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:34:23 -0700
Message-Id: <9ce77bee1a0d8c66023a27c66beea99c93ede3a4.1499520469.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499520469.git.raj.khem@gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
Subject: [PATCH 04/10] gcc-sanitizer: Fix build with glibc 2.26
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
X-List-Received-Date: Sat, 08 Jul 2017 13:34:42 -0000

sigaltstack is no more exposed by glibc see (bug 21517)
therefore adjust to use stack_t instead

Use res_state typedef instead of referring to __res_state struct

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.1.inc              |   1 +
 ...r-Use-stack_t-instead-of-struct-sigaltsta.patch | 160 +++++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/gcc/gcc-7.1.inc
index 96fc11c943..f30a73c31c 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
@@ -73,6 +73,7 @@ SRC_URI = "\
            file://0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0047-sync-gcc-stddef.h-with-musl.patch \
            file://0048-gcc-Enable-static-PIE.patch \
+           file://0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch b/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
new file mode 100644
index 0000000000..ee15c6cac8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
@@ -0,0 +1,160 @@
+From 4c07606bb77bbd30f02adb947d480516da3fa3f7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 Jun 2017 10:09:13 -0700
+Subject: [PATCH] libsanitizer: Use stack_t instead of struct sigaltstack
+
+Upstream-Status: Submitted
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libsanitizer/sanitizer_common/sanitizer_linux.cc                    | 4 ++--
+ libsanitizer/sanitizer_common/sanitizer_linux.h                     | 6 +++---
+ .../sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc        | 3 ++-
+ 3 files changed, 7 insertions(+), 6 deletions(-)
+
+Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
+===================================================================
+--- gcc-7.1.0.orig/libsanitizer/sanitizer_common/sanitizer_linux.cc
++++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
+@@ -14,6 +14,10 @@
+ 
+ #if SANITIZER_FREEBSD || SANITIZER_LINUX
+ 
++#if !SANITIZER_ANDROID
++#include <sys/signal.h>
++#endif
++
+ #include "sanitizer_common.h"
+ #include "sanitizer_flags.h"
+ #include "sanitizer_internal_defs.h"
+@@ -71,10 +75,6 @@ extern "C" {
+ extern char **environ;  // provided by crt1
+ #endif  // SANITIZER_FREEBSD
+ 
+-#if !SANITIZER_ANDROID
+-#include <sys/signal.h>
+-#endif
+-
+ #if SANITIZER_LINUX
+ // <linux/time.h>
+ struct kernel_timeval {
+@@ -605,8 +605,8 @@ uptr internal_prctl(int option, uptr arg
+ }
+ #endif
+ 
+-uptr internal_sigaltstack(const struct sigaltstack *ss,
+-                         struct sigaltstack *oss) {
++uptr internal_sigaltstack(const stack_t *ss,
++                         stack_t *oss) {
+   return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr)oss);
+ }
+ 
+Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
+===================================================================
+--- gcc-7.1.0.orig/libsanitizer/sanitizer_common/sanitizer_linux.h
++++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
+@@ -19,7 +19,10 @@
+ #include "sanitizer_platform_limits_posix.h"
+ 
+ struct link_map;  // Opaque type returned by dlopen().
+-struct sigaltstack;
++
++#ifndef __stack_t_defined
++struct stack_t;
++#endif
+ 
+ namespace __sanitizer {
+ // Dirent structure for getdents(). Note that this structure is different from
+@@ -28,8 +31,8 @@ struct linux_dirent;
+ 
+ // Syscall wrappers.
+ uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int count);
+-uptr internal_sigaltstack(const struct sigaltstack* ss,
+-                          struct sigaltstack* oss);
++uptr internal_sigaltstack(const stack_t* ss,
++                          stack_t* oss);
+ uptr internal_sigprocmask(int how, __sanitizer_sigset_t *set,
+     __sanitizer_sigset_t *oldset);
+ 
+Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
+===================================================================
+--- gcc-7.1.0.orig/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
++++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
+@@ -16,6 +16,7 @@
+                         defined(__aarch64__) || defined(__powerpc64__) || \
+                         defined(__s390__))
+ 
++#include <signal.h>
+ #include "sanitizer_stoptheworld.h"
+ 
+ #include "sanitizer_platform_limits_posix.h"
+@@ -273,7 +274,7 @@ static int TracerThread(void* argument)
+ 
+   // Alternate stack for signal handling.
+   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
+-  struct sigaltstack handler_stack;
++  stack_t handler_stack;
+   internal_memset(&handler_stack, 0, sizeof(handler_stack));
+   handler_stack.ss_sp = handler_stack_memory.data();
+   handler_stack.ss_size = kHandlerStackSize;
+Index: gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
+===================================================================
+--- gcc-7.1.0.orig/libsanitizer/tsan/tsan_platform_linux.cc
++++ gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
+@@ -14,6 +14,7 @@
+ #include "sanitizer_common/sanitizer_platform.h"
+ #if SANITIZER_LINUX || SANITIZER_FREEBSD
+ 
++#include <signal.h>
+ #include "sanitizer_common/sanitizer_common.h"
+ #include "sanitizer_common/sanitizer_libc.h"
+ #include "sanitizer_common/sanitizer_linux.h"
+@@ -28,7 +29,6 @@
+ 
+ #include <fcntl.h>
+ #include <pthread.h>
+-#include <signal.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -287,7 +287,7 @@ void InitializePlatform() {
+ int ExtractResolvFDs(void *state, int *fds, int nfd) {
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+   int cnt = 0;
+-  __res_state *statp = (__res_state*)state;
++  res_state statp = (res_state)state;
+   for (int i = 0; i < MAXNS && cnt < nfd; i++) {
+     if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
+       fds[cnt++] = statp->_u._ext.nssocks[i];
+Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc
+===================================================================
+--- gcc-7.1.0.orig/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc
++++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc
+@@ -14,6 +14,7 @@
+ 
+ #if SANITIZER_FREEBSD || SANITIZER_LINUX
+ 
++#include <signal.h>
+ #include "sanitizer_allocator_internal.h"
+ #include "sanitizer_atomic.h"
+ #include "sanitizer_common.h"
+@@ -30,7 +31,6 @@
+ 
+ #include <link.h>
+ #include <pthread.h>
+-#include <signal.h>
+ #include <sys/resource.h>
+ #include <syslog.h>
+ 
+Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_symbolizer_posix_libcdep.cc
+===================================================================
+--- gcc-7.1.0.orig/libsanitizer/sanitizer_common/sanitizer_symbolizer_posix_libcdep.cc
++++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_symbolizer_posix_libcdep.cc
+@@ -12,6 +12,7 @@
+ 
+ #include "sanitizer_platform.h"
+ #if SANITIZER_POSIX
++#include <signal.h>
+ #include "sanitizer_allocator_internal.h"
+ #include "sanitizer_common.h"
+ #include "sanitizer_flags.h"
-- 
2.13.2


