Return-Path: <juro.bystricky@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA427892B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 17:09:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2018 10:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,465,1515484800"; d="scan'208";a="34667434"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.59])
	by orsmga003.jf.intel.com with ESMTP; 13 Mar 2018 10:09:45 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2018 10:09:42 -0700
Message-Id: <1520960982-31022-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [rocko][PATCH] gcc6: Patch to fix broken gcc-sanitizers build
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
X-List-Received-Date: Tue, 13 Mar 2018 17:09:44 -0000

Backport a patch to fix errors such as:
error: aggregate 'sigaltstack handler_stack' has incomplete type and cannot be defined

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/gcc/gcc-6.4.inc              |  1 +
 .../gcc/gcc-6.4/backport/0013-gcc-sanitizers.patch | 90 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0013-gcc-sanitizers.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
index a2430a9..42eabef 100644
--- a/meta/recipes-devtools/gcc/gcc-6.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -93,6 +93,7 @@ BACKPORTS = "\
            file://0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch \
            file://0011-i386-Update-mfunction-return-for-return-with-pop.patch \
            file://0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch \
+           file://0013-gcc-sanitizers.patch \
 "
 
 SRC_URI[md5sum] = "11ba51a0cfb8471927f387c8895fe232"
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0013-gcc-sanitizers.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0013-gcc-sanitizers.patch
new file mode 100644
index 0000000..47bcd8e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0013-gcc-sanitizers.patch
@@ -0,0 +1,90 @@
+From 0fa7102d76376b27ae4bbc10848600aac6ed71d2 Mon Sep 17 00:00:00 2001
+From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 17 Jul 2017 19:41:08 +0000
+Subject: [PATCH] 	Backported from mainline 	2017-07-14  Jakub
+ Jelinek  <jakub@redhat.com>
+
+	PR sanitizer/81066
+	* sanitizer_common/sanitizer_linux.h: Cherry-pick upstream r307969.
+	* sanitizer_common/sanitizer_linux.cc: Likewise.
+	* sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc: Likewise.
+	* tsan/tsan_platform_linux.cc: Likewise.
+
+[Romain cherry-pick on gcc-6-branch from gcc-7-branch]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@250287 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+---
+ libsanitizer/sanitizer_common/sanitizer_linux.cc                      | 3 +--
+ libsanitizer/sanitizer_common/sanitizer_linux.h                       | 4 +---
+ libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc | 2 +-
+ libsanitizer/tsan/tsan_platform_linux.cc                              | 2 +-
+ 4 files changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.cc b/libsanitizer/sanitizer_common/sanitizer_linux.cc
+index 2cefa20..223d9c6 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_linux.cc
++++ b/libsanitizer/sanitizer_common/sanitizer_linux.cc
+@@ -546,8 +546,7 @@ uptr internal_prctl(int option, uptr arg2, uptr arg3, uptr arg4, uptr arg5) {
+ }
+ #endif
+ 
+-uptr internal_sigaltstack(const struct sigaltstack *ss,
+-                         struct sigaltstack *oss) {
++uptr internal_sigaltstack(const void *ss, void *oss) {
+   return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr)oss);
+ }
+ 
+diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.h b/libsanitizer/sanitizer_common/sanitizer_linux.h
+index 4497702..1594058 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_linux.h
++++ b/libsanitizer/sanitizer_common/sanitizer_linux.h
+@@ -19,7 +19,6 @@
+ #include "sanitizer_platform_limits_posix.h"
+ 
+ struct link_map;  // Opaque type returned by dlopen().
+-struct sigaltstack;
+ 
+ namespace __sanitizer {
+ // Dirent structure for getdents(). Note that this structure is different from
+@@ -28,8 +27,7 @@ struct linux_dirent;
+ 
+ // Syscall wrappers.
+ uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int count);
+-uptr internal_sigaltstack(const struct sigaltstack* ss,
+-                          struct sigaltstack* oss);
++uptr internal_sigaltstack(const void* ss, void* oss);
+ uptr internal_sigprocmask(int how, __sanitizer_sigset_t *set,
+     __sanitizer_sigset_t *oldset);
+ void internal_sigfillset(__sanitizer_sigset_t *set);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
+index c919e4f..014162af 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
++++ b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
+@@ -267,7 +267,7 @@ static int TracerThread(void* argument) {
+ 
+   // Alternate stack for signal handling.
+   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
+-  struct sigaltstack handler_stack;
++  stack_t handler_stack;
+   internal_memset(&handler_stack, 0, sizeof(handler_stack));
+   handler_stack.ss_sp = handler_stack_memory.data();
+   handler_stack.ss_size = kHandlerStackSize;
+diff --git a/libsanitizer/tsan/tsan_platform_linux.cc b/libsanitizer/tsan/tsan_platform_linux.cc
+index 09cec5f..908f4fe 100644
+--- a/libsanitizer/tsan/tsan_platform_linux.cc
++++ b/libsanitizer/tsan/tsan_platform_linux.cc
+@@ -291,7 +291,7 @@ bool IsGlobalVar(uptr addr) {
+ int ExtractResolvFDs(void *state, int *fds, int nfd) {
+ #if SANITIZER_LINUX
+   int cnt = 0;
+-  __res_state *statp = (__res_state*)state;
++  struct __res_state *statp = (struct __res_state*)state;
+   for (int i = 0; i < MAXNS && cnt < nfd; i++) {
+     if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
+       fds[cnt++] = statp->_u._ext.nssocks[i];
+-- 
+2.9.4
-- 
2.7.4


