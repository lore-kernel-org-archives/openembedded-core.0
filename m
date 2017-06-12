Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB63782CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:59:20 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id l89so52442015pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VwkHCBr4i/CHhYSy8+pM+6068CWtTrSQfgBzkWNPSb4=;
	b=LRnl4tP8d7TsgeQ4A7dxY9/Nq7hkIysQxUct14khbnUPJ4Gv9Al0JfLzN5dnrFJAB3
	V4kq/5g3jj3WkSz2eDoDA0TwRui0vk0NlVqQGxjElSc4sUWsMYSOde4LaokaxgXl3ZgQ
	fbvgQUZtriGNJEVuq0ochm4yWQU88Ulx1wOiLiO6Zi6Wa25kib38y7tJ+fLoChVKksXr
	iFq7kBfHlVsHViWFvOydV5+GacUVYcm7NlqMtBItQH8EY77cIVWMWwW3nUn4JxuJaMLV
	2QpZaluF/dCOLAKwA4vwEnzrHykDl4vILplC8EQZTIJZoDTd8cOZFLx4Yrnw/rFdwltC
	2VtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VwkHCBr4i/CHhYSy8+pM+6068CWtTrSQfgBzkWNPSb4=;
	b=IDK3vO8gODjgwu/5yxFe70SccjrQXsYmjSGUOTDgRxWgW9W32h2/0VlUHnBO6FQ1Lt
	9Ye5yhMe9gTbvOTDTL+onYnMdKE9g7oPtLrRNvwcImH9/vjgsIE/YRsQNONw3ig0IbVe
	1y6vc57nBSGYMYegw47wy1j15Dw8nSiQFBVXvVKTJ5IKIsptMrAuPulNLIEiiU0GDFJv
	CByOo2/dkU0miu5Qf7/iKe5LcOR4p2+hP/5NHHU0vuSUYasXYSGVEB0VEdjFuEn9JTi7
	mI2fEFF8OoAF+lSTgfrCEhznR9lzk7rPi90do+ueYHXAF5+ahgpWT/cJMOuMcxKQl1yq
	sSmw==
X-Gm-Message-State: AODbwcAFT9zkHAJktx2Bhbd4XOZdsFsI6rlBOb78H2BX7e5KiupURDdX
	4f90ZB6OTchbNsIe
X-Received: by 10.84.224.1 with SMTP id r1mr58335205plj.262.1497279561891;
	Mon, 12 Jun 2017 07:59:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	i17sm20554732pgn.60.2017.06.12.07.59.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 07:59:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 07:59:05 -0700
Message-Id: <3046a1a8ef89c895f332b829097a1c650bdfac48.1497279306.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497279306.git.raj.khem@gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
Subject: [PATCH 5/7] valgrind: Fix ptest build with musl
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
X-List-Received-Date: Mon, 12 Jun 2017 14:59:21 -0000

musl unearthed a problem when building out of tree, config.h was being
used from $(srcdir) instead of generated config.h in $(builddir)
this assumed functions e.g. mallinfo() and more which are not in musl
as a result tests broke.

Also add fixes to build remaining tests when building on musl

pass -fno-pie as it cant use PIE especially in ptests/x86_64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Rename-_sifields-to-__si_fields-on-musl.patch | 31 ++++++++++++++
 ...tr_tester.c-Limit-rawmemchr-test-to-glibc.patch | 39 +++++++++++++++++
 ...02-context-APIs-are-not-available-on-musl.patch | 49 ++++++++++++++++++++++
 ...rrect-include-directive-path-for-config.h.patch | 45 ++++++++++++++++++++
 ...4-pth_atfork1.c-Define-error-API-for-musl.patch | 37 ++++++++++++++++
 ...erifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch | 30 +++++++++++++
 ...d3.c-Dereference-pthread_t-before-adding-.patch | 32 ++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  | 12 ++++++
 8 files changed, 275 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-pth_atfork1.c-Define-error-API-for-musl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
new file mode 100644
index 0000000000..27366153f7
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
@@ -0,0 +1,31 @@
+From 64ad2744acfb4fa40b1c114633a053f87125a203 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Jun 2017 00:46:39 -0700
+Subject: [PATCH 1/6] sigqueue: Rename _sifields to __si_fields on musl
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ memcheck/tests/linux/sigqueue.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/memcheck/tests/linux/sigqueue.c b/memcheck/tests/linux/sigqueue.c
+index d18bd72..acb7cba 100644
+--- a/memcheck/tests/linux/sigqueue.c
++++ b/memcheck/tests/linux/sigqueue.c
+@@ -8,6 +8,11 @@
+ #include <syscall.h>
+ #include <unistd.h>
+ 
++/* musl libc defines siginfo_t __si_fields instead of _sifields */
++#if defined(__linux__) && !defined(__GLIBC__)
++#define _sifields __si_fields
++#endif
++
+ int main(int argc, char **argv)
+ {
+   siginfo_t *si;
+-- 
+2.13.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch b/meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch
new file mode 100644
index 0000000000..185b8f9e60
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch
@@ -0,0 +1,39 @@
+From de692e359801a1f0488c76267e4f904dd2efe754 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Jun 2017 00:39:07 -0700
+Subject: [PATCH] str_tester.c: Limit rawmemchr() test to glibc
+
+rawmemchr() is a GNU extention therefore mark it so
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ memcheck/tests/str_tester.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/memcheck/tests/str_tester.c b/memcheck/tests/str_tester.c
+index 9f7790a..47e4b4a 100644
+--- a/memcheck/tests/str_tester.c
++++ b/memcheck/tests/str_tester.c
+@@ -504,7 +504,7 @@ test_strchrnul (void)
+ #endif
+ 
+ // DDD: better done by testing for the function.
+-#if !defined(__APPLE__) && !defined(__sun)
++#if !defined(__APPLE__) && !defined(__sun) && defined(__GLIBC__)
+ static void
+ test_rawmemchr (void)
+ {
+@@ -1442,7 +1442,7 @@ main (void)
+   test_strchrnul ();
+ # endif
+ 
+-# if !defined(__APPLE__) && !defined(__sun)
++# if !defined(__APPLE__) && !defined(__sun) && defined(__GLIBC__)
+   /* rawmemchr.  */
+   test_rawmemchr ();
+ # endif
+-- 
+2.13.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
new file mode 100644
index 0000000000..3f9f33b487
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
@@ -0,0 +1,49 @@
+From 862b807076d57f2f58ed9d572ddac8bb402774a2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Jun 2017 01:01:10 -0700
+Subject: [PATCH 2/6] context APIs are not available on musl
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ memcheck/tests/linux/stack_changes.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux/stack_changes.c
+index a978fc2..ffb49c6 100644
+--- a/memcheck/tests/linux/stack_changes.c
++++ b/memcheck/tests/linux/stack_changes.c
+@@ -10,6 +10,7 @@
+ // This test is checking the libc context calls (setcontext, etc.) and
+ // checks that Valgrind notices their stack changes properly.
+ 
++#ifdef __GLIBC__
+ typedef  struct ucontext  mycontext;
+ 
+ mycontext ctx1, ctx2, oldc;
+@@ -51,9 +52,11 @@ int init_context(mycontext *uc)
+ 
+     return ret;
+ }
++#endif
+ 
+ int main(int argc, char **argv)
+ {
++#ifdef __GLIBC__
+     int c1 = init_context(&ctx1);
+     int c2 = init_context(&ctx2);
+ 
+@@ -66,6 +69,8 @@ int main(int argc, char **argv)
+     //free(ctx1.uc_stack.ss_sp);
+     VALGRIND_STACK_DEREGISTER(c2);
+     //free(ctx2.uc_stack.ss_sp);
+-
++#else
++    printf("libc context call APIs e.g. getcontext() are deprecated by posix\n");
++#endif
+     return 0;
+ }
+-- 
+2.13.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
new file mode 100644
index 0000000000..c2965c40df
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
@@ -0,0 +1,45 @@
+From ecbdea7bd8b08205f1bc3f6b72d4b4a80f313fcb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Jun 2017 01:03:17 -0700
+Subject: [PATCH 3/6] correct include directive path for config.h
+
+when building out of source tree, it can not find
+the generated config.h otherwise
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ memcheck/tests/linux/syscalls-2007.c  | 2 +-
+ memcheck/tests/linux/syslog-syscall.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/memcheck/tests/linux/syscalls-2007.c b/memcheck/tests/linux/syscalls-2007.c
+index b61c6d5..cc3fd62 100644
+--- a/memcheck/tests/linux/syscalls-2007.c
++++ b/memcheck/tests/linux/syscalls-2007.c
+@@ -10,7 +10,7 @@
+ 
+ #define _GNU_SOURCE
+ 
+-#include "../../config.h"
++#include "config.h"
+ #include <fcntl.h>
+ #include <signal.h>
+ #include <stdint.h>
+diff --git a/memcheck/tests/linux/syslog-syscall.c b/memcheck/tests/linux/syslog-syscall.c
+index 1143722..21e758b 100644
+--- a/memcheck/tests/linux/syslog-syscall.c
++++ b/memcheck/tests/linux/syslog-syscall.c
+@@ -6,7 +6,7 @@
+  *    klogctl().
+  */
+ 
+-#include "../../config.h"
++#include "config.h"
+ #include <stdio.h>
+ #if defined(HAVE_SYS_KLOG_H)
+ #include <sys/klog.h>
+-- 
+2.13.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-pth_atfork1.c-Define-error-API-for-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0004-pth_atfork1.c-Define-error-API-for-musl.patch
new file mode 100644
index 0000000000..1cb7062545
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0004-pth_atfork1.c-Define-error-API-for-musl.patch
@@ -0,0 +1,37 @@
+From fb77fef4f866dac7bcc6d1ae025da60564869f84 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Jun 2017 01:06:11 -0700
+Subject: [PATCH 4/6] pth_atfork1.c: Define error() API for musl
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ none/tests/pth_atfork1.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/none/tests/pth_atfork1.c b/none/tests/pth_atfork1.c
+index 34201ef..b7f5f2d 100644
+--- a/none/tests/pth_atfork1.c
++++ b/none/tests/pth_atfork1.c
+@@ -18,7 +18,7 @@
+    Boston, MA 02111-1307, USA.  */
+ 
+ #include <errno.h>
+-#if !defined(__APPLE__) && !defined(__sun)
++#if !defined(__APPLE__) && !defined(__sun) && defined(__GLIBC__)
+ # include <error.h>
+ #endif
+ #include <stdlib.h>
+@@ -27,7 +27,7 @@
+ #include <sys/wait.h>
+ #include <stdio.h>
+ 
+-#if defined(__APPLE__) || defined(__sun)
++#if defined(__APPLE__) || defined(__sun) || (defined(__linux__) && !defined(__GLIBC__))
+ #include <string.h>  /* strerror */
+ static void error (int status, int errnum, char* msg)
+ {
+-- 
+2.13.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch
new file mode 100644
index 0000000000..6176640e42
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch
@@ -0,0 +1,30 @@
+From b4b9f072c22f96844e02cb9d68f7ff2408680817 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Jun 2017 01:07:59 -0700
+Subject: [PATCH 5/6] tc20_verifywrap.c: Fake __GLIBC_PREREQ with musl
+
+similar to sun
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ helgrind/tests/tc20_verifywrap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/helgrind/tests/tc20_verifywrap.c b/helgrind/tests/tc20_verifywrap.c
+index c110000..a311a49 100644
+--- a/helgrind/tests/tc20_verifywrap.c
++++ b/helgrind/tests/tc20_verifywrap.c
+@@ -20,7 +20,7 @@
+ 
+ #if !defined(__APPLE__)
+ 
+-#if defined(__sun__)
++#if defined(__sun__) || (defined(__linux__) && !defined(__GLIBC__))
+ /* Fake __GLIBC_PREREQ on Solaris. Pretend glibc >= 2.4. */
+ # define __GLIBC_PREREQ
+ #else
+-- 
+2.13.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch b/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
new file mode 100644
index 0000000000..05886c743d
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
@@ -0,0 +1,32 @@
+From a6547fc17c120dbd95b852f50b0c4bdee4fedb9a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Jun 2017 01:20:32 -0700
+Subject: [PATCH 6/6] pth_detached3.c: Dereference pthread_t before adding
+ offset to it
+
+Fixes
+error: invalid use of undefined type 'struct __pthread'
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ drd/tests/pth_detached3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drd/tests/pth_detached3.c b/drd/tests/pth_detached3.c
+index c02eef1..35d43a6 100644
+--- a/drd/tests/pth_detached3.c
++++ b/drd/tests/pth_detached3.c
+@@ -21,7 +21,7 @@ int main(int argc, char** argv)
+   pthread_detach(thread);
+ 
+   /* Invoke pthread_detach() with an invalid thread ID. */
+-  pthread_detach(thread + 8);
++  pthread_detach((pthread_t*)(&thread + 8));
+ 
+   fprintf(stderr, "Finished.\n");
+ 
+-- 
+2.13.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index d5a8dda487..d7b6d77000 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -24,6 +24,13 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
            file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
            file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
+           file://0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch \
+           file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
+           file://0002-context-APIs-are-not-available-on-musl.patch \
+           file://0003-correct-include-directive-path-for-config.h.patch \
+           file://0004-pth_atfork1.c-Define-error-API-for-musl.patch \
+           file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
+           file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
            "
 SRC_URI_append_libc-musl = "\
            file://0001-fix-build-for-musl-targets.patch \
@@ -67,6 +74,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
 
 CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "
+CFLAGS += "-no-pie"
 
 def get_mcpu(d):
     for arg in (d.getVar('TUNE_CCARGS') or '').split():
@@ -76,6 +84,10 @@ def get_mcpu(d):
             continue
     return ""
 
+do_configure_prepend () {
+    rm -rf ${S}/config.h
+}
+
 do_install_append () {
     install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
 }
-- 
2.13.1


