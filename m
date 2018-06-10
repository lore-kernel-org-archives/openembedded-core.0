Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EBEB07606C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:44:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41290674"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jun 2018 15:44:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 21ECF4B41ED0;
	Wed, 20 Jun 2018 15:44:04 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Wed, 20 Jun 2018 15:44:05 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jun 2018 11:05:00 -0700
Message-ID: <1528653900-32323-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: 21ECF4B41ED0.A233F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [sumo][PATCH] glibc: fix CVE-2017-18269 and CVE-2018-11236
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
X-List-Received-Date: Wed, 20 Jun 2018 07:44:09 -0000
Content-Type: text/plain

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Backport two CVE patches from the upstream
https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=summary
commit 5460617d1567657621107d895ee2dd83bc1f88f2
commit cd66c0e584c6d692bc8347b5e72723d02b8a8ada

(From OE-Core rev: 398ac946745bbfad55deb382aeafec0be3298819)

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc/CVE-2017-18269.patch | 178 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc/CVE-2018-11236.patch | 164 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.27.bb              |   2 +
 3 files changed, 344 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11236.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-18269.patch b/meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
new file mode 100644
index 0000000..d873c51
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
@@ -0,0 +1,178 @@
+From cd66c0e584c6d692bc8347b5e72723d02b8a8ada Mon Sep 17 00:00:00 2001
+From: Andrew Senkevich <andrew.n.senkevich@gmail.com>
+Date: Fri, 23 Mar 2018 16:19:45 +0100
+Subject: [PATCH] Fix i386 memmove issue (bug 22644).
+
+	[BZ #22644]
+	* sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S: Fixed
+	branch conditions.
+	* string/test-memmove.c (do_test2): New testcase.
+
+Upstream-Status: Backport
+CVE: CVE-2017-18269
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ ChangeLog                                          |  8 +++
+ string/test-memmove.c                              | 58 ++++++++++++++++++++++
+ .../i386/i686/multiarch/memcpy-sse2-unaligned.S    | 12 ++---
+ 3 files changed, 72 insertions(+), 6 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 18ed09e..afdb766 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2018-03-23  Andrew Senkevich  <andrew.senkevich@intel.com>
++	    Max Horn  <max@quendi.de>
++
++	[BZ #22644]
++	* sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S: Fixed
++	branch conditions.
++	* string/test-memmove.c (do_test2): New testcase.
++
+ 2018-02-22  Andrew Waterman <andrew@sifive.com>
+ 
+ 	[BZ # 22884]
+diff --git a/string/test-memmove.c b/string/test-memmove.c
+index edc7a4c..64e3651 100644
+--- a/string/test-memmove.c
++++ b/string/test-memmove.c
+@@ -24,6 +24,7 @@
+ # define TEST_NAME "memmove"
+ #endif
+ #include "test-string.h"
++#include <support/test-driver.h>
+ 
+ char *simple_memmove (char *, const char *, size_t);
+ 
+@@ -245,6 +246,60 @@ do_random_tests (void)
+     }
+ }
+ 
++static void
++do_test2 (void)
++{
++  size_t size = 0x20000000;
++  uint32_t * large_buf;
++
++  large_buf = mmap ((void*) 0x70000000, size, PROT_READ | PROT_WRITE,
++		    MAP_PRIVATE | MAP_ANON, -1, 0);
++
++  if (large_buf == MAP_FAILED)
++    error (EXIT_UNSUPPORTED, errno, "Large mmap failed");
++
++  if ((uintptr_t) large_buf > 0x80000000 - 128
++      || 0x80000000 - (uintptr_t) large_buf > 0x20000000)
++    {
++      error (0, 0, "Large mmap allocated improperly");
++      ret = EXIT_UNSUPPORTED;
++      munmap ((void *) large_buf, size);
++      return;
++    }
++
++  size_t bytes_move = 0x80000000 - (uintptr_t) large_buf;
++  size_t arr_size = bytes_move / sizeof (uint32_t);
++  size_t i;
++
++  FOR_EACH_IMPL (impl, 0)
++    {
++      for (i = 0; i < arr_size; i++)
++        large_buf[i] = (uint32_t) i;
++
++      uint32_t * dst = &large_buf[33];
++
++#ifdef TEST_BCOPY
++      CALL (impl, (char *) large_buf, (char *) dst, bytes_move);
++#else
++      CALL (impl, (char *) dst, (char *) large_buf, bytes_move);
++#endif
++
++      for (i = 0; i < arr_size; i++)
++	{
++	  if (dst[i] != (uint32_t) i)
++	    {
++	      error (0, 0,
++		     "Wrong result in function %s dst \"%p\" src \"%p\" offset \"%zd\"",
++		     impl->name, dst, large_buf, i);
++	      ret = 1;
++	      break;
++	    }
++	}
++    }
++
++  munmap ((void *) large_buf, size);
++}
++
+ int
+ test_main (void)
+ {
+@@ -284,6 +339,9 @@ test_main (void)
+     }
+ 
+   do_random_tests ();
++
++  do_test2 ();
++
+   return ret;
+ }
+ 
+diff --git a/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S b/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S
+index 9c3bbe7..9aa17de 100644
+--- a/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S
++++ b/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S
+@@ -72,7 +72,7 @@ ENTRY (MEMCPY)
+ 	cmp	%edx, %eax
+ 
+ # ifdef USE_AS_MEMMOVE
+-	jg	L(check_forward)
++	ja	L(check_forward)
+ 
+ L(mm_len_0_or_more_backward):
+ /* Now do checks for lengths. We do [0..16], [16..32], [32..64], [64..128]
+@@ -81,7 +81,7 @@ L(mm_len_0_or_more_backward):
+ 	jbe	L(mm_len_0_16_bytes_backward)
+ 
+ 	cmpl	$32, %ecx
+-	jg	L(mm_len_32_or_more_backward)
++	ja	L(mm_len_32_or_more_backward)
+ 
+ /* Copy [0..32] and return.  */
+ 	movdqu	(%eax), %xmm0
+@@ -92,7 +92,7 @@ L(mm_len_0_or_more_backward):
+ 
+ L(mm_len_32_or_more_backward):
+ 	cmpl	$64, %ecx
+-	jg	L(mm_len_64_or_more_backward)
++	ja	L(mm_len_64_or_more_backward)
+ 
+ /* Copy [0..64] and return.  */
+ 	movdqu	(%eax), %xmm0
+@@ -107,7 +107,7 @@ L(mm_len_32_or_more_backward):
+ 
+ L(mm_len_64_or_more_backward):
+ 	cmpl	$128, %ecx
+-	jg	L(mm_len_128_or_more_backward)
++	ja	L(mm_len_128_or_more_backward)
+ 
+ /* Copy [0..128] and return.  */
+ 	movdqu	(%eax), %xmm0
+@@ -132,7 +132,7 @@ L(mm_len_128_or_more_backward):
+ 	add	%ecx, %eax
+ 	cmp	%edx, %eax
+ 	movl	SRC(%esp), %eax
+-	jle	L(forward)
++	jbe	L(forward)
+ 	PUSH (%esi)
+ 	PUSH (%edi)
+ 	PUSH (%ebx)
+@@ -269,7 +269,7 @@ L(check_forward):
+ 	add	%edx, %ecx
+ 	cmp	%eax, %ecx
+ 	movl	LEN(%esp), %ecx
+-	jle	L(forward)
++	jbe	L(forward)
+ 
+ /* Now do checks for lengths. We do [0..16], [0..32], [0..64], [0..128]
+ 	separately.  */
+-- 
+2.9.3
diff --git a/meta/recipes-core/glibc/glibc/CVE-2018-11236.patch b/meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
new file mode 100644
index 0000000..e2bb40b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
@@ -0,0 +1,164 @@
+From 5460617d1567657621107d895ee2dd83bc1f88f2 Mon Sep 17 00:00:00 2001
+From: Paul Pluzhnikov <ppluzhnikov@google.com>
+Date: Tue, 8 May 2018 18:12:41 -0700
+Subject: [PATCH] Fix BZ 22786: integer addition overflow may cause stack
+ buffer overflow when realpath() input length is close to SSIZE_MAX.
+
+2018-05-09  Paul Pluzhnikov  <ppluzhnikov@google.com>
+
+	[BZ #22786]
+	* stdlib/canonicalize.c (__realpath): Fix overflow in path length
+	computation.
+	* stdlib/Makefile (test-bz22786): New test.
+	* stdlib/test-bz22786.c: New test.
+
+CVE: CVE-2018-11236
+Upstream-Status: Backport
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ ChangeLog             |  8 +++++
+ stdlib/Makefile       |  2 +-
+ stdlib/canonicalize.c |  2 +-
+ stdlib/test-bz22786.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 100 insertions(+), 2 deletions(-)
+ create mode 100644 stdlib/test-bz22786.c
+
+diff --git a/ChangeLog b/ChangeLog
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2018-05-09  Paul Pluzhnikov  <ppluzhnikov@google.com>
++
++	[BZ #22786]
++	* stdlib/canonicalize.c (__realpath): Fix overflow in path length
++	computation.
++	* stdlib/Makefile (test-bz22786): New test.
++	* stdlib/test-bz22786.c: New test.
++
+ 2018-03-23  Andrew Senkevich  <andrew.senkevich@intel.com>
+ 	    Max Horn  <max@quendi.de>
+ 
+diff --git a/stdlib/Makefile b/stdlib/Makefile
+index af1643c..1ddb1f9 100644
+--- a/stdlib/Makefile
++++ b/stdlib/Makefile
+@@ -84,7 +84,7 @@ tests		:= tst-strtol tst-strtod testmb testrand testsort testdiv   \
+ 		   tst-cxa_atexit tst-on_exit test-atexit-race 		    \
+ 		   test-at_quick_exit-race test-cxa_atexit-race             \
+ 		   test-on_exit-race test-dlclose-exit-race 		    \
+-		   tst-makecontext-align
++		   tst-makecontext-align test-bz22786
+ 
+ tests-internal	:= tst-strtod1i tst-strtod3 tst-strtod4 tst-strtod5i \
+ 		   tst-tls-atexit tst-tls-atexit-nodelete
+diff --git a/stdlib/canonicalize.c b/stdlib/canonicalize.c
+index 4135f3f..390fb43 100644
+--- a/stdlib/canonicalize.c
++++ b/stdlib/canonicalize.c
+@@ -181,7 +181,7 @@ __realpath (const char *name, char *resolved)
+ 		extra_buf = __alloca (path_max);
+ 
+ 	      len = strlen (end);
+-	      if ((long int) (n + len) >= path_max)
++	      if (path_max - n <= len)
+ 		{
+ 		  __set_errno (ENAMETOOLONG);
+ 		  goto error;
+diff --git a/stdlib/test-bz22786.c b/stdlib/test-bz22786.c
+new file mode 100644
+index 0000000..e7837f9
+--- /dev/null
++++ b/stdlib/test-bz22786.c
+@@ -0,0 +1,90 @@
++/* Bug 22786: test for buffer overflow in realpath.
++   Copyright (C) 2018 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* This file must be run from within a directory called "stdlib".  */
++
++#include <errno.h>
++#include <limits.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <unistd.h>
++#include <sys/stat.h>
++#include <sys/types.h>
++#include <support/test-driver.h>
++#include <libc-diag.h>
++
++static int
++do_test (void)
++{
++  const char dir[] = "bz22786";
++  const char lnk[] = "bz22786/symlink";
++
++  rmdir (dir);
++  if (mkdir (dir, 0755) != 0 && errno != EEXIST)
++    {
++      printf ("mkdir %s: %m\n", dir);
++      return EXIT_FAILURE;
++    }
++  if (symlink (".", lnk) != 0 && errno != EEXIST)
++    {
++      printf ("symlink (%s, %s): %m\n", dir, lnk);
++      return EXIT_FAILURE;
++    }
++
++  const size_t path_len = (size_t) INT_MAX + 1;
++
++  DIAG_PUSH_NEEDS_COMMENT;
++#if __GNUC_PREREQ (7, 0)
++  /* GCC 7 warns about too-large allocations; here we need such
++     allocation to succeed for the test to work.  */
++  DIAG_IGNORE_NEEDS_COMMENT (7, "-Walloc-size-larger-than=");
++#endif
++  char *path = malloc (path_len);
++  DIAG_POP_NEEDS_COMMENT;
++
++  if (path == NULL)
++    {
++      printf ("malloc (%zu): %m\n", path_len);
++      return EXIT_UNSUPPORTED;
++    }
++
++  /* Construct very long path = "bz22786/symlink/aaaa....."  */
++  char *p = mempcpy (path, lnk, sizeof (lnk) - 1);
++  *(p++) = '/';
++  memset (p, 'a', path_len - (path - p) - 2);
++  p[path_len - (path - p) - 1] = '\0';
++
++  /* This call crashes before the fix for bz22786 on 32-bit platforms.  */
++  p = realpath (path, NULL);
++
++  if (p != NULL || errno != ENAMETOOLONG)
++    {
++      printf ("realpath: %s (%m)", p);
++      return EXIT_FAILURE;
++    }
++
++  /* Cleanup.  */
++  unlink (lnk);
++  rmdir (dir);
++
++  return 0;
++}
++
++#define TEST_FUNCTION do_test
++#include <support/test-driver.c>
+-- 
+2.9.3
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index d3bdeae..fe23eb6 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -44,6 +44,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
            file://0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch \
            file://0030-plural_c_no_preprocessor_lines.patch \
+           file://CVE-2017-18269.patch \
+           file://CVE-2018-11236.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
1.9.1




