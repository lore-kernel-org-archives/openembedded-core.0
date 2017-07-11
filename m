Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3627A77DBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:02:43 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e199so456490pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sVXopsU/ANzZp+MOTZMm2EFvTFZRYcj3tS4Uc0M+YxI=;
	b=WCx9PeZdo2ogno3dF1oje6M+xHE/7Rvk0mqVEkKh/uyBAAXfrU38QTc3zmfivsoAwf
	LHQAiZYbV+CCvPcTciaKh+9b6eRlQHGwzAWP5ygu0/dodmTimFH/V7Ol0ryLsNMzJM/J
	NKRNycDH+ZSqhp3O1fqrCQSlOEchKHSbDF8zQc7YJj6dE7PJxawiotXzpeOZFgh/ox1Z
	mwzj3WYLkyB50ukU61iH1A7LVILdEaBVDr+WfGN2/db2x8GzrxCCbKE06E9LtSOE4U0G
	+1L1Bj34XuvhfpKcWDOX1PdlPfJwAmx19tcgOS36gFWcjMlqXxIz/b7Sihxy+7a87Lke
	mq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sVXopsU/ANzZp+MOTZMm2EFvTFZRYcj3tS4Uc0M+YxI=;
	b=Oeusch6IholgW0GxIDFcgK8frPyvLU0kpHsUmVZ28ValVPiwAKCi/rYssbRouy2mHw
	C/Kl/hJ6XILirDpZKFGZAO5i0KMI8qbe9SVCjQzrBiPzjt6P54MYzt+n2tKLdui+Fouk
	dSqIZXXbRHUA3xoz+kxlDZ9aWTUY3wlVQrH9QVTbGAxSDnWJmfCoStHJmaZV0R06G/gQ
	aSX2UkiX8bKaWWtmwg7TYSX3GsXEMJUhtDKsJ1orlt5bpTCiwhQM0fKSZHhegRBUpDW5
	xowahlMOuHEFXKcwg++srBuDp9/a94d6xjExAsb6qG/c01e5EcOS7d7EUwYpUItUJuwO
	oYjw==
X-Gm-Message-State: AIVw113G/AyFp0N8oHxraN3tXJaKVmb0DdkHIdwlq5mLhbpXWkdv/x2Z
	EPaYCcK6AGa5Jjwk
X-Received: by 10.98.204.23 with SMTP id a23mr51189886pfg.59.1499788964768;
	Tue, 11 Jul 2017 09:02:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id n71sm638122pfi.95.2017.07.11.09.02.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 09:02:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 09:02:33 -0700
Message-Id: <20170711160233.32374-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] gcc-7.1: Update the libsanitize stack_t patch to upstreamed version
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
X-List-Received-Date: Tue, 11 Jul 2017 16:02:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-Use-stack_t-instead-of-struct-sigaltsta.patch | 135 +++++----------------
 1 file changed, 28 insertions(+), 107 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch b/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
index ee15c6cac8..165258b5d3 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
@@ -3,6 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 11 Jun 2017 10:09:13 -0700
 Subject: [PATCH] libsanitizer: Use stack_t instead of struct sigaltstack
 
+https://reviews.llvm.org/D35246
+
 Upstream-Status: Submitted
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -12,83 +14,49 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  .../sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc        | 3 ++-
  3 files changed, 7 insertions(+), 6 deletions(-)
 
-Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
-===================================================================
---- gcc-7.1.0.orig/libsanitizer/sanitizer_common/sanitizer_linux.cc
-+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
-@@ -14,6 +14,10 @@
- 
- #if SANITIZER_FREEBSD || SANITIZER_LINUX
- 
-+#if !SANITIZER_ANDROID
-+#include <sys/signal.h>
-+#endif
-+
- #include "sanitizer_common.h"
- #include "sanitizer_flags.h"
- #include "sanitizer_internal_defs.h"
-@@ -71,10 +75,6 @@ extern "C" {
- extern char **environ;  // provided by crt1
- #endif  // SANITIZER_FREEBSD
- 
--#if !SANITIZER_ANDROID
--#include <sys/signal.h>
--#endif
--
- #if SANITIZER_LINUX
- // <linux/time.h>
- struct kernel_timeval {
-@@ -605,8 +605,8 @@ uptr internal_prctl(int option, uptr arg
- }
- #endif
- 
--uptr internal_sigaltstack(const struct sigaltstack *ss,
--                         struct sigaltstack *oss) {
-+uptr internal_sigaltstack(const stack_t *ss,
-+                         stack_t *oss) {
-   return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr)oss);
- }
- 
+
 Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
 ===================================================================
---- gcc-7.1.0.orig/libsanitizer/sanitizer_common/sanitizer_linux.h
+--- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
 +++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
-@@ -19,7 +19,10 @@
+@@ -21,17 +21,15 @@
  #include "sanitizer_platform_limits_posix.h"
  
  struct link_map;  // Opaque type returned by dlopen().
 -struct sigaltstack;
-+
-+#ifndef __stack_t_defined
-+struct stack_t;
-+#endif
  
  namespace __sanitizer {
  // Dirent structure for getdents(). Note that this structure is different from
-@@ -28,8 +31,8 @@ struct linux_dirent;
+ // the one in <dirent.h>, which is used by readdir().
+ struct linux_dirent;
  
  // Syscall wrappers.
  uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int count);
 -uptr internal_sigaltstack(const struct sigaltstack* ss,
 -                          struct sigaltstack* oss);
-+uptr internal_sigaltstack(const stack_t* ss,
-+                          stack_t* oss);
++uptr internal_sigaltstack(const void* ss, void* oss);
  uptr internal_sigprocmask(int how, __sanitizer_sigset_t *set,
      __sanitizer_sigset_t *oldset);
  
-Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
+Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
 ===================================================================
---- gcc-7.1.0.orig/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-@@ -16,6 +16,7 @@
-                         defined(__aarch64__) || defined(__powerpc64__) || \
-                         defined(__s390__))
+--- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
++++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
+@@ -631,8 +631,7 @@
+ }
+ #endif
  
-+#include <signal.h>
- #include "sanitizer_stoptheworld.h"
+-uptr internal_sigaltstack(const struct sigaltstack *ss,
+-                         struct sigaltstack *oss) {
++uptr internal_sigaltstack(const void *ss, void *oss) {
+   return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr)oss);
+ }
  
- #include "sanitizer_platform_limits_posix.h"
-@@ -273,7 +274,7 @@ static int TracerThread(void* argument)
+Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
+===================================================================
+--- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
++++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
+@@ -287,7 +287,7 @@
  
    // Alternate stack for signal handling.
    InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
@@ -99,62 +67,15 @@ Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libc
    handler_stack.ss_size = kHandlerStackSize;
 Index: gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
 ===================================================================
---- gcc-7.1.0.orig/libsanitizer/tsan/tsan_platform_linux.cc
+--- gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
 +++ gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
-@@ -14,6 +14,7 @@
- #include "sanitizer_common/sanitizer_platform.h"
- #if SANITIZER_LINUX || SANITIZER_FREEBSD
- 
-+#include <signal.h>
- #include "sanitizer_common/sanitizer_common.h"
- #include "sanitizer_common/sanitizer_libc.h"
- #include "sanitizer_common/sanitizer_linux.h"
-@@ -28,7 +29,6 @@
- 
- #include <fcntl.h>
- #include <pthread.h>
--#include <signal.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-@@ -287,7 +287,7 @@ void InitializePlatform() {
+@@ -288,7 +288,7 @@
  int ExtractResolvFDs(void *state, int *fds, int nfd) {
  #if SANITIZER_LINUX && !SANITIZER_ANDROID
    int cnt = 0;
 -  __res_state *statp = (__res_state*)state;
-+  res_state statp = (res_state)state;
++  struct __res_state *statp = (struct __res_state*)state;
    for (int i = 0; i < MAXNS && cnt < nfd; i++) {
      if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
        fds[cnt++] = statp->_u._ext.nssocks[i];
-Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc
-===================================================================
---- gcc-7.1.0.orig/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc
-+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc
-@@ -14,6 +14,7 @@
- 
- #if SANITIZER_FREEBSD || SANITIZER_LINUX
- 
-+#include <signal.h>
- #include "sanitizer_allocator_internal.h"
- #include "sanitizer_atomic.h"
- #include "sanitizer_common.h"
-@@ -30,7 +31,6 @@
- 
- #include <link.h>
- #include <pthread.h>
--#include <signal.h>
- #include <sys/resource.h>
- #include <syslog.h>
- 
-Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_symbolizer_posix_libcdep.cc
-===================================================================
---- gcc-7.1.0.orig/libsanitizer/sanitizer_common/sanitizer_symbolizer_posix_libcdep.cc
-+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_symbolizer_posix_libcdep.cc
-@@ -12,6 +12,7 @@
- 
- #include "sanitizer_platform.h"
- #if SANITIZER_POSIX
-+#include <signal.h>
- #include "sanitizer_allocator_internal.h"
- #include "sanitizer_common.h"
- #include "sanitizer_flags.h"
+
-- 
2.13.2


