Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0879C783BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:47 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v18so465249pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NzZFeov0Y+DIR1tbES9Y09D+ZBAztnf4xUulRno9wQI=;
	b=BlZVP0uZ4+Tv8p9/iB9AR5NfLRbXTdsFq31wqrhfnWS+Bys5heyVjxhvWvtvVeh6kU
	WzNTvJ7Q1vkobX7oKQeWoYPrq7vjDekV1wiG26wSO2Xq4Mq8ALA2h6Xm7R+lrJZww5fh
	ZjoqF0iZ0+gFnPXhCos+Xb9qPWHz4B2FvqEhVu9Jv2/zzAgKsLSnoBDa148nUBpoXOdB
	IWmuSa7Fj+zVnszxDIrUKk/Z09qVAuJfW39jHmhGOY/OyMcugw4b94077EWEBDlpsBAj
	pFHKfqJfb8NHkM6uue6Cky56qqThJM+ta2/lZ3NWoBmZ/4lDM1p6JyIYmBqXKydJEFSL
	HEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NzZFeov0Y+DIR1tbES9Y09D+ZBAztnf4xUulRno9wQI=;
	b=WYmg6ZTM19n0uPP/QTm+Texd0kuqJEB0WKclKoJo/p9P2IoWqS701OfgseqcoIuDWH
	LkeMWl7xGypPUatahfBdaucZamvJBIrhqQBHOTHdArygui+Rgmm2Wtu/nSuXLvuGNxZx
	dqn0SyWqlxAbe4Kp7V9gWKt3XIZCg25Yg/meeWNU1tcqEIOhQh5008vaXwwfBi1N9crH
	OoK2C/5pJTzuR5pQpVdUDNeOAPXrel/MS8r5FevCsdk03R0gWjSdD9JrVqTKZtZ/9zaw
	QPZyuFtsSHW8IqBk0WIlqvk//8C3koIQdvHAoVhYyiOrt8OSwl57hcF2YGu4kDaFjRUs
	TO/Q==
X-Gm-Message-State: AKS2vOwuVEs1MdfldfmTTlLmO4rvenlaQ1E8rBMwDHV3c8EiOL9d7GW4
	Nx0ukEzS5vnwXo4K
X-Received: by 10.99.166.18 with SMTP id t18mr589363pge.218.1497453828806;
	Wed, 14 Jun 2017 08:23:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id i2sm502948pfe.89.2017.06.14.08.23.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:26 -0700
Message-Id: <cd2b720104f722dc81bf356e30df08c21f0e1dd9.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
Subject: [PATCH 07/10] gcc-sanitizer: Fix build with glibc 2.26
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:48 -0000

sigaltstack is no more exposed by glibc see (bug 21517)
therefore adjust to use stack_t instead

Use res_state typedef instead of referring to __res_state struct

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.1.inc              |   1 +
 ...r-Use-stack_t-instead-of-struct-sigaltsta.patch | 160 +++++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0048-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/gcc/gcc-7.1.inc
index 3df04199a6..77d5ac11eb 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
@@ -78,6 +78,7 @@ SRC_URI = "\
            file://0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0047-sync-gcc-stddef.h-with-musl.patch \
+           file://0048-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0048-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch b/meta/recipes-devtools/gcc/gcc-7.1/0048-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
new file mode 100644
index 0000000000..ee15c6cac8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0048-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
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
2.13.1


