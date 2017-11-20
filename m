Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E499278674
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 19:40:37 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id r68so1865781pfe.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 11:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=x0ZoWzQo4BdeGvh62sn+H9RoIXhuqoOBPS7skpRqPSI=;
	b=LomGTmdkHqTy1goXTw6JxeDg4at5DFKLiVuE2f/bj510uMUWL+GWmOqkliR4ADdYcl
	/PRh3ghLqca1OtUHXaHqsAdVZdnG9aAtJCnnk3Jg66l0qjiuuVeOKH+HpPFYACmYEHVh
	QFXEQxRMJ6EI3NlAsGeTROSpMs4L/Ux2Yl1lzozuq7bqj5EjFHl5ksDtxgmc8AkT0J7j
	ezZd77JiIi5r/l2cPbOKDaSyZiI404cQaFr3Kuh1kShKlPupsUGWt9rYDRikThKxVIQm
	+uWM6A/RYRXECt02i1Y1pVtGiujwvmE/v+dcAl9OsRlOlgckmVfz1pApNcnW+wovgyc6
	s2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x0ZoWzQo4BdeGvh62sn+H9RoIXhuqoOBPS7skpRqPSI=;
	b=O+X7n/STouOF+SgBe7teaLbG+Az3aVugR0kNpNbhrBMa/YuvJA3LHnDJAjMDpyRzKX
	kk9si+I6+wagMVprBwhARUs6ff2e744shlyEdAf7QtMAXRo5sZynZShB4+dtgfh3sARy
	rhrGSUIa/mPEji3kzeh8ZeaRvo6eUFWEjr959G+utHpZYEfLsx+22eWUchgKtbmSrChm
	sRSMWenco2AAZWitPBdNTSiKs/ZUVQME37U6s29OrVggGD2VUtfFPMZyqQX5yJz8LxvM
	rlyyQmifQ7mGnHZ2IWs9MVAzmE3yUrFWXsVsCeSFr9youiAqaLOZ+XZxH/0xm9g+j5W0
	U5gA==
X-Gm-Message-State: AJaThX68PhBxKZiNkJ8TZXQ0+nvfuvZCqbAGOm06M8VTu52EYyKnzSBU
	sAFn1CFLsj48Z/acesM2lYtreA==
X-Google-Smtp-Source: AGs4zMYZp17IcKN4+AIFOcZTWcAgWLgDcVWhmh5PrihVHsDOTijwqyWPO/BEHxejPP9pRrL5cvYepQ==
X-Received: by 10.99.180.77 with SMTP id n13mr444510pgu.317.1511206838476;
	Mon, 20 Nov 2017 11:40:38 -0800 (PST)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	c24sm21606725pfl.2.2017.11.20.11.40.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Nov 2017 11:40:37 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 11:40:30 -0800
Message-Id: <1511206830-6353-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [pyro][PATCH] glibc_2.25: fix building for x86 with -Os (or -fno-omit-frame-pointer)
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
X-List-Received-Date: Mon, 20 Nov 2017 19:40:38 -0000

Glibc 2.25 fails to build for x86 when frame pointers are enabled (ie
when optimised for size or when -fno-omit-frame-pointer is explicitly
included in CFLAGS etc). Backport the upstream fix from glibc 2.26.

  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=3b33d6ed6096c1d20d05a650b06026d673f7399a

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...rk-fno-omit-frame-pointer-support-on-i386.patch | 268 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.25.bb              |   1 +
 2 files changed, 269 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0028-Rework-fno-omit-frame-pointer-support-on-i386.patch

diff --git a/meta/recipes-core/glibc/glibc/0028-Rework-fno-omit-frame-pointer-support-on-i386.patch b/meta/recipes-core/glibc/glibc/0028-Rework-fno-omit-frame-pointer-support-on-i386.patch
new file mode 100644
index 0000000..7ed2b90
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0028-Rework-fno-omit-frame-pointer-support-on-i386.patch
@@ -0,0 +1,268 @@
+From 1ea003d4fccc4646fd1848a182405a1c7000ab18 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Sun, 8 Jan 2017 11:38:23 -0200
+Subject: [PATCH 28/28] Rework -fno-omit-frame-pointer support on i386
+
+Commit 6b1df8b27f fixed the -OS build issue on i386 (BZ#20729) by
+expliciting disabling frame pointer (-fomit-frame-pointer) on the
+faulty objects.  Although it does fix the issue, it is a subpar
+workaround that adds complexity in build process (a rule for each
+object to add the required compiler option and pontentially more
+rules for objects that call {INLINE,INTERNAL}_SYSCALL) and does not
+allow the implementations to get all the possible debug/calltrack
+information possible (used mainly in debuggers and performance
+measurement tools).
+
+This patch fixes it by adding an explicit configure check to see
+if -fno-omit-frame-pointer is set and to act accordingly (set or
+not OPTIMIZE_FOR_GCC_5).  The make rules is simplified and only
+one is required: to add libc-do-syscall on loader due mmap
+(which will be empty anyway for default build with
+-fomit-frame-pointer).
+
+Checked on i386-linux-gnu with GCC 6.2.1 with CFLAGS sets as
+'-Os', '-O2 -fno-omit-frame-pointer', and '-O2 -fomit-frame-pointer'.
+For '-Os' the testsuite issues described by BZ#19463 and BZ#15105
+still applied.
+
+It fixes BZ #21029, although it is marked as duplicated of #20729
+(I reopened to track this cleanup).
+
+	[BZ #21029]
+	* config.h.in [CAN_USE_REGISTER_ASM_EBP]: New define.
+	* sysdeps/unix/sysv/linux/i386/Makefile
+	[$(subdir) = elf] (sysdep-dl-routines): Add libc-do-syscall.
+	(uses-6-syscall-arguments): Remove.
+	[$(subdir) = misc] (CFLAGS-epoll_pwait.o): Likewise.
+	[$(subdir) = misc] (CFLAGS-epoll_pwait.os): Likewise.
+	[$(subdir) = misc] (CFLAGS-mmap.o): Likewise.
+	[$(subdir) = misc] (CFLAGS-mmap.os): Likewise.
+	[$(subdir) = misc] (CFLAGS-mmap64.o): Likewise.
+	[$(subdir) = misc] (CFLAGS-mmap64.os): Likewise.
+	[$(subdir) = misc] (CFLAGS-pselect.o): Likewise.
+	[$(subdir) = misc] (cflags-pselect.o): Likewise.
+	[$(subdir) = misc] (cflags-pselect.os): Likewise.
+	[$(subdir) = misc] (cflags-rtld-mmap.os): Likewise.
+	[$(subdir) = sysvipc] (cflags-semtimedop.o): Likewise.
+	[$(subdir) = sysvipc] (cflags-semtimedop.os): Likewise.
+	[$(subdir) = io] (CFLAGS-posix_fadvise64.o): Likewise.
+	[$(subdir) = io] (CFLAGS-posix_fadvise64.os): Likewise.
+	[$(subdir) = io] (CFLAGS-posix_fallocate.o): Likewise.
+	[$(subdir) = io] (CFLAGS-posix_fallocate.os): Likewise.
+	[$(subdir) = io] (CFLAGS-posix_fallocate64.o): Likewise.
+	[$(subdir) = io] (CFLAGS-posix_fallocate64.os): Likewise.
+	[$(subdir) = io] (CFLAGS-sync_file_range.o): Likewise.
+	[$(subdir) = io] (CFLAGS-sync_file_range.os): Likewise.
+	[$(subdir) = io] (CFLAGS-fallocate.o): Likewise.
+	[$(subdir) = io] (CFLAGS-fallocate.os): Likewise.
+	[$(subdir) = io] (CFLAGS-fallocate64.o): Likewise.
+	[$(subdir) = io] (CFLAGS-fallocate64.os): Likewise.
+	[$(subdir) = nptl] (CFLAGS-pthread_rwlock_timedrdlock.o):
+	Likewise.
+	[$(subdir) = nptl] (CFLAGS-pthread_rwlock_timedrdlock.os):
+	Likewise.
+	[$(subdir) = nptl] (CFLAGS-pthread_rwlock_timedrwlock.o):
+	Likewise.
+	[$(subdir) = nptl] (CFLAGS-pthread_rwlock_timedrwlock.os):
+	Likewise.
+	[$(subdir) = nptl] (CFLAGS-sem_wait.o): Likewise.
+	[$(subdir) = nptl] (CFLAGS-sem_wait.os): Likewise.
+	[$(subdir) = nptl] (CFLAGS-sem_timedwait.o): Likewise.
+	[$(subdir) = nptl] (CFLAGS-sem_timedwait.os): Likewise.
+	* sysdeps/unix/sysv/linux/i386/configure.ac: Add check if compiler allows
+	ebp on inline assembly.
+	* sysdeps/unix/sysv/linux/i386/configure: Regenerate.
+	* sysdeps/unix/sysv/linux/i386/sysdep.h (OPTIMIZE_FOR_GCC_5):
+	Set if CAN_USE_REGISTER_ASM_EBP is set.
+	(check_consistency): Likewise.
+
+Upstream-Status: Backport
+
+  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=3b33d6ed6096c1d20d05a650b06026d673f7399a
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ config.h.in                               |  4 ++++
+ sysdeps/unix/sysv/linux/i386/Makefile     | 39 +------------------------------
+ sysdeps/unix/sysv/linux/i386/configure    | 39 +++++++++++++++++++++++++++++++
+ sysdeps/unix/sysv/linux/i386/configure.ac | 17 ++++++++++++++
+ sysdeps/unix/sysv/linux/i386/sysdep.h     |  6 ++---
+ 5 files changed, 64 insertions(+), 41 deletions(-)
+
+diff --git a/config.h.in b/config.h.in
+index 7bfe923..fb2cc51 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -259,4 +259,8 @@
+ /* Build glibc with tunables support.  */
+ #define HAVE_TUNABLES 0
+ 
++/* Some compiler options may now allow to use ebp in __asm__ (used mainly
++   in i386 6 argument syscall issue).  */
++#define CAN_USE_REGISTER_ASM_EBP 0
++
+ #endif
+diff --git a/sysdeps/unix/sysv/linux/i386/Makefile b/sysdeps/unix/sysv/linux/i386/Makefile
+index 9609752..6aac0df 100644
+--- a/sysdeps/unix/sysv/linux/i386/Makefile
++++ b/sysdeps/unix/sysv/linux/i386/Makefile
+@@ -1,47 +1,18 @@
+ # The default ABI is 32.
+ default-abi := 32
+ 
+-# %ebp is used to pass the 6th argument to system calls, so these
+-# system calls are incompatible with a frame pointer.
+-uses-6-syscall-arguments = -fomit-frame-pointer
+-
+ ifeq ($(subdir),misc)
+ sysdep_routines += ioperm iopl vm86
+-CFLAGS-epoll_pwait.o += $(uses-6-syscall-arguments)
+-CFLAGS-epoll_pwait.os += $(uses-6-syscall-arguments)
+-CFLAGS-mmap.o += $(uses-6-syscall-arguments)
+-CFLAGS-mmap.os += $(uses-6-syscall-arguments)
+-CFLAGS-mmap64.o += $(uses-6-syscall-arguments)
+-CFLAGS-mmap64.os += $(uses-6-syscall-arguments)
+-CFLAGS-pselect.o += $(uses-6-syscall-arguments)
+-CFLAGS-pselect.os += $(uses-6-syscall-arguments)
+-CFLAGS-rtld-mmap.os += $(uses-6-syscall-arguments)
+-endif
+-
+-ifeq ($(subdir),sysvipc)
+-CFLAGS-semtimedop.o += $(uses-6-syscall-arguments)
+-CFLAGS-semtimedop.os += $(uses-6-syscall-arguments)
+ endif
+ 
+ ifeq ($(subdir),elf)
++sysdep-dl-routines += libc-do-syscall
+ sysdep-others += lddlibc4
+ install-bin += lddlibc4
+ endif
+ 
+ ifeq ($(subdir),io)
+ sysdep_routines += libc-do-syscall
+-CFLAGS-posix_fadvise64.o += $(uses-6-syscall-arguments)
+-CFLAGS-posix_fadvise64.os += $(uses-6-syscall-arguments)
+-CFLAGS-posix_fallocate.o += $(uses-6-syscall-arguments)
+-CFLAGS-posix_fallocate.os += $(uses-6-syscall-arguments)
+-CFLAGS-posix_fallocate64.o += $(uses-6-syscall-arguments)
+-CFLAGS-posix_fallocate64.os += $(uses-6-syscall-arguments)
+-CFLAGS-sync_file_range.o += $(uses-6-syscall-arguments)
+-CFLAGS-sync_file_range.os += $(uses-6-syscall-arguments)
+-CFLAGS-fallocate.o += $(uses-6-syscall-arguments)
+-CFLAGS-fallocate.os += $(uses-6-syscall-arguments)
+-CFLAGS-fallocate64.o += $(uses-6-syscall-arguments)
+-CFLAGS-fallocate64.os += $(uses-6-syscall-arguments)
+ endif
+ 
+ ifeq ($(subdir),nptl)
+@@ -61,14 +32,6 @@ ifeq ($(subdir),nptl)
+ # pull in __syscall_error routine
+ libpthread-routines += sysdep
+ libpthread-shared-only-routines += sysdep
+-CFLAGS-pthread_rwlock_timedrdlock.o += $(uses-6-syscall-arguments)
+-CFLAGS-pthread_rwlock_timedrdlock.os += $(uses-6-syscall-arguments)
+-CFLAGS-pthread_rwlock_timedwrlock.o += $(uses-6-syscall-arguments)
+-CFLAGS-pthread_rwlock_timedwrlock.os += $(uses-6-syscall-arguments)
+-CFLAGS-sem_wait.o += $(uses-6-syscall-arguments)
+-CFLAGS-sem_wait.os += $(uses-6-syscall-arguments)
+-CFLAGS-sem_timedwait.o += $(uses-6-syscall-arguments)
+-CFLAGS-sem_timedwait.os += $(uses-6-syscall-arguments)
+ endif
+ 
+ ifeq ($(subdir),rt)
+diff --git a/sysdeps/unix/sysv/linux/i386/configure b/sysdeps/unix/sysv/linux/i386/configure
+index eb72659..ae2c356 100644
+--- a/sysdeps/unix/sysv/linux/i386/configure
++++ b/sysdeps/unix/sysv/linux/i386/configure
+@@ -3,5 +3,44 @@
+ 
+ arch_minimum_kernel=2.6.32
+ 
++# Check if CFLAGS allows compiler to use ebp register in inline assembly.
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if compiler flags allows ebp in inline assembly" >&5
++$as_echo_n "checking if compiler flags allows ebp in inline assembly... " >&6; }
++if ${libc_cv_can_use_register_asm_ebp+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++
++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++    void foo (int i)
++    {
++      register int reg asm ("ebp") = i;
++      asm ("# %0" : : "r" (reg));
++    }
++int
++main ()
++{
++
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  libc_cv_can_use_register_asm_ebp=yes
++else
++  libc_cv_can_use_register_asm_ebp=no
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_can_use_register_asm_ebp" >&5
++$as_echo "$libc_cv_can_use_register_asm_ebp" >&6; }
++if test $libc_cv_can_use_register_asm_ebp = yes; then
++  $as_echo "#define CAN_USE_REGISTER_ASM_EBP 1" >>confdefs.h
++
++fi
++
+ libc_cv_gcc_unwind_find_fde=yes
+ ldd_rewrite_script=sysdeps/unix/sysv/linux/ldd-rewrite.sed
+diff --git a/sysdeps/unix/sysv/linux/i386/configure.ac b/sysdeps/unix/sysv/linux/i386/configure.ac
+index 1a11da6..1cd632e 100644
+--- a/sysdeps/unix/sysv/linux/i386/configure.ac
++++ b/sysdeps/unix/sysv/linux/i386/configure.ac
+@@ -3,5 +3,22 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
+ 
+ arch_minimum_kernel=2.6.32
+ 
++# Check if CFLAGS allows compiler to use ebp register in inline assembly.
++AC_CACHE_CHECK([if compiler flags allows ebp in inline assembly],
++                libc_cv_can_use_register_asm_ebp, [
++AC_COMPILE_IFELSE(
++  [AC_LANG_PROGRAM([
++    void foo (int i)
++    {
++      register int reg asm ("ebp") = i;
++      asm ("# %0" : : "r" (reg));
++    }])],
++  [libc_cv_can_use_register_asm_ebp=yes],
++  [libc_cv_can_use_register_asm_ebp=no])
++])
++if test $libc_cv_can_use_register_asm_ebp = yes; then
++  AC_DEFINE(CAN_USE_REGISTER_ASM_EBP)
++fi
++
+ libc_cv_gcc_unwind_find_fde=yes
+ ldd_rewrite_script=sysdeps/unix/sysv/linux/ldd-rewrite.sed
+diff --git a/sysdeps/unix/sysv/linux/i386/sysdep.h b/sysdeps/unix/sysv/linux/i386/sysdep.h
+index baf4642..449b23e 100644
+--- a/sysdeps/unix/sysv/linux/i386/sysdep.h
++++ b/sysdeps/unix/sysv/linux/i386/sysdep.h
+@@ -44,9 +44,9 @@
+ /* Since GCC 5 and above can properly spill %ebx with PIC when needed,
+    we can inline syscalls with 6 arguments if GCC 5 or above is used
+    to compile glibc.  Disable GCC 5 optimization when compiling for
+-   profiling since asm ("ebp") can't be used to put the 6th argument
+-   in %ebp for syscall.  */
+-#if __GNUC_PREREQ (5,0) && !defined PROF
++   profiling or when -fno-omit-frame-pointer is used since asm ("ebp")
++   can't be used to put the 6th argument in %ebp for syscall.  */
++#if __GNUC_PREREQ (5,0) && !defined PROF && CAN_USE_REGISTER_ASM_EBP
+ # define OPTIMIZE_FOR_GCC_5
+ #endif
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
index cf9c4f7..0f1ec0c 100644
--- a/meta/recipes-core/glibc/glibc_2.25.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.bb
@@ -42,6 +42,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           file://0028-Rework-fno-omit-frame-pointer-support-on-i386.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
1.9.1


