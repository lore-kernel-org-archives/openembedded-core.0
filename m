Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E28CD7C806
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 06:50:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1J6oufR021104
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 22:50:56 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Mon, 18 Feb 2019 22:50:56 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Feb 2019 22:50:55 -0800
Message-ID: <20190219065055.120034-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] glibc: CVE-2019-7309
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
X-List-Received-Date: Tue, 19 Feb 2019 06:50:56 -0000
Content-Type: text/plain

Backport the CVE patch from the upstream
commit 3f635fb43389b54f682fc9ed2acc0b2aaf4a923d

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...e-unsigned-Jcc-instructions-on-size-.patch | 223 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.29.bb         |   1 +
 2 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch b/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch
new file mode 100644
index 0000000000..1c625f63c7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch
@@ -0,0 +1,223 @@
+From 3f635fb43389b54f682fc9ed2acc0b2aaf4a923d Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 4 Feb 2019 06:31:01 -0800
+Subject: [PATCH] x86-64 memcmp: Use unsigned Jcc instructions on size [BZ
+ #24155]
+
+Since the size argument is unsigned. we should use unsigned Jcc
+instructions, instead of signed, to check size.
+
+Tested on x86-64 and x32, with and without --disable-multi-arch.
+
+	[BZ #24155]
+	CVE-2019-7309
+	* NEWS: Updated for CVE-2019-7309.
+	* sysdeps/x86_64/memcmp.S: Use RDX_LP for size.  Clear the
+	upper 32 bits of RDX register for x32.  Use unsigned Jcc
+	instructions, instead of signed.
+	* sysdeps/x86_64/x32/Makefile (tests): Add tst-size_t-memcmp-2.
+	* sysdeps/x86_64/x32/tst-size_t-memcmp-2.c: New test.
+
+CVE: CVE-2019-7309
+Upstream-Status: Backport
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ ChangeLog                                | 11 ++++
+ sysdeps/x86_64/memcmp.S                  | 20 +++---
+ sysdeps/x86_64/x32/Makefile              |  3 +-
+ sysdeps/x86_64/x32/tst-size_t-memcmp-2.c | 79 ++++++++++++++++++++++++
+ 5 files changed, 111 insertions(+), 10 deletions(-)
+ create mode 100644 sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
+
+diff --git a/ChangeLog b/ChangeLog
+index 29bc4451ef..a0dcdac323 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,14 @@
++2019-02-04  H.J. Lu  <hongjiu.lu@intel.com>
++
++	[BZ #24155]
++	CVE-2019-7309
++	* NEWS: Updated for CVE-2019-7309.
++	* sysdeps/x86_64/memcmp.S: Use RDX_LP for size.  Clear the
++	upper 32 bits of RDX register for x32.  Use unsigned Jcc
++	instructions, instead of signed.
++	* sysdeps/x86_64/x32/Makefile (tests): Add tst-size_t-memcmp-2.
++	* sysdeps/x86_64/x32/tst-size_t-memcmp-2.c: New test.
++
+ 2019-01-31  Carlos O'Donell  <carlos@redhat.com>
+ 	    Torvald Riegel  <triegel@redhat.com>
+ 	    Rik Prohaska  <prohaska7@gmail.com>
+diff --git a/sysdeps/x86_64/memcmp.S b/sysdeps/x86_64/memcmp.S
+index 1fc487caa5..1322bb3b92 100644
+--- a/sysdeps/x86_64/memcmp.S
++++ b/sysdeps/x86_64/memcmp.S
+@@ -21,14 +21,18 @@
+ 
+ 	.text
+ ENTRY (memcmp)
+-	test	%rdx, %rdx
++#ifdef __ILP32__
++	/* Clear the upper 32 bits.  */
++	movl	%edx, %edx
++#endif
++	test	%RDX_LP, %RDX_LP
+ 	jz	L(finz)
+ 	cmpq	$1, %rdx
+-	jle	L(finr1b)
++	jbe	L(finr1b)
+ 	subq	%rdi, %rsi
+ 	movq	%rdx, %r10
+ 	cmpq	$32, %r10
+-	jge	L(gt32)
++	jae	L(gt32)
+ 	/* Handle small chunks and last block of less than 32 bytes.  */
+ L(small):
+ 	testq	$1, %r10
+@@ -156,7 +160,7 @@ L(A32):
+ 	movq	%r11, %r10
+ 	andq	$-32, %r10
+ 	cmpq	%r10, %rdi
+-        jge	L(mt16)
++        jae	L(mt16)
+ 	/* Pre-unroll to be ready for unrolled 64B loop.  */
+ 	testq	$32, %rdi
+ 	jz	L(A64)
+@@ -178,7 +182,7 @@ L(A64):
+ 	movq	%r11, %r10
+ 	andq	$-64, %r10
+ 	cmpq	%r10, %rdi
+-        jge	L(mt32)
++        jae	L(mt32)
+ 
+ L(A64main):
+ 	movdqu    (%rdi,%rsi), %xmm0
+@@ -216,7 +220,7 @@ L(mt32):
+ 	movq	%r11, %r10
+ 	andq	$-32, %r10
+ 	cmpq	%r10, %rdi
+-        jge	L(mt16)
++        jae	L(mt16)
+ 
+ L(A32main):
+ 	movdqu    (%rdi,%rsi), %xmm0
+@@ -254,7 +258,7 @@ L(ATR):
+ 	movq	%r11, %r10
+ 	andq	$-32, %r10
+ 	cmpq	%r10, %rdi
+-        jge	L(mt16)
++        jae	L(mt16)
+ 	testq	$16, %rdi
+ 	jz	L(ATR32)
+ 
+@@ -325,7 +329,7 @@ L(ATR64main):
+ 	movq	%r11, %r10
+ 	andq	$-32, %r10
+ 	cmpq	%r10, %rdi
+-        jge	L(mt16)
++        jae	L(mt16)
+ 
+ L(ATR32res):
+ 	movdqa    (%rdi,%rsi), %xmm0
+diff --git a/sysdeps/x86_64/x32/Makefile b/sysdeps/x86_64/x32/Makefile
+index 1557724b0c..8748956563 100644
+--- a/sysdeps/x86_64/x32/Makefile
++++ b/sysdeps/x86_64/x32/Makefile
+@@ -8,7 +8,8 @@ endif
+ ifeq ($(subdir),string)
+ tests += tst-size_t-memchr tst-size_t-memcmp tst-size_t-memcpy \
+ 	 tst-size_t-memrchr tst-size_t-memset tst-size_t-strncasecmp \
+-	 tst-size_t-strncmp tst-size_t-strncpy tst-size_t-strnlen
++	 tst-size_t-strncmp tst-size_t-strncpy tst-size_t-strnlen \
++	 tst-size_t-memcmp-2
+ endif
+ 
+ ifeq ($(subdir),wcsmbs)
+diff --git a/sysdeps/x86_64/x32/tst-size_t-memcmp-2.c b/sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
+new file mode 100644
+index 0000000000..d8ae1a0813
+--- /dev/null
++++ b/sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
+@@ -0,0 +1,79 @@
++/* Test memcmp with size_t in the lower 32 bits of 64-bit register.
++   Copyright (C) 2019 Free Software Foundation, Inc.
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
++#define TEST_MAIN
++#ifdef WIDE
++# define TEST_NAME "wmemcmp"
++#else
++# define TEST_NAME "memcmp"
++#endif
++
++#include "test-size_t.h"
++
++#ifdef WIDE
++# include <inttypes.h>
++# include <wchar.h>
++
++# define MEMCMP wmemcmp
++# define CHAR wchar_t
++#else
++# define MEMCMP memcmp
++# define CHAR char
++#endif
++
++IMPL (MEMCMP, 1)
++
++typedef int (*proto_t) (const CHAR *, const CHAR *, size_t);
++
++static int
++__attribute__ ((noinline, noclone))
++do_memcmp (parameter_t a, parameter_t b)
++{
++  return CALL (&b, a.p, b.p, a.len);
++}
++
++static int
++test_main (void)
++{
++  test_init ();
++
++  parameter_t dest = { { page_size / sizeof (CHAR) }, buf1 };
++  parameter_t src = { { 0 }, buf2 };
++
++  memcpy (buf1, buf2, page_size);
++
++  CHAR *p = (CHAR *) buf1;
++  p[page_size / sizeof (CHAR) - 1] = (CHAR) 1;
++
++  int ret = 0;
++  FOR_EACH_IMPL (impl, 0)
++    {
++      src.fn = impl->fn;
++      int res = do_memcmp (dest, src);
++      if (res >= 0)
++	{
++	  error (0, 0, "Wrong result in function %s: %i >= 0",
++		 impl->name, res);
++	  ret = 1;
++	}
++    }
++
++  return ret ? EXIT_FAILURE : EXIT_SUCCESS;
++}
++
++#include <support/test-driver.c>
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index 72db00cdb7..beddbffee2 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -56,6 +56,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0029-inject-file-assembly-directives.patch \
            file://0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           file://0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


