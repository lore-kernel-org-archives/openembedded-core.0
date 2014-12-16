Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2481A7256A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 02:19:09 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id w10so12953258pde.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 18:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=N0c0joWrGRjMPiimrojHwdSy30Hx6XXBBjBYM9eD6JU=;
	b=ToTGjT3Xr68FMyTYUe8PUvv/7HKc9ArF5xUsHFefgKVjWLABnivxyhsgWyzuf2ej4s
	N8YyzcLIDHtrf9au7f9+G28G7D0OFRLBo78qgdWRGYhreXeOVc0E04FseenhjKmF8aFI
	dBpdjrZmNv5tRfF2nnjQFIC+vjXpEVxSa3cEQv/mmps1U2+S1c18RrHRRtV+uw1cSlu4
	R9Oo4S4SZKjbirQjcpjQSgCbG3u1XnRM+H6PbDFAdjqnGRoLAwpsL6EsMqZo0MoR/SZT
	GwAafs3Z2mIxIPpX8kwNj6XxFOOvT5HWBuhoZ7BP5Aeqgphml0V/LvKWjgaa0r28oc8w
	pFEQ==
X-Received: by 10.70.54.161 with SMTP id k1mr55837936pdp.110.1418696350064;
	Mon, 15 Dec 2014 18:19:10 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id dk5sm10502426pbc.9.2014.12.15.18.19.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 18:19:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Dec 2014 18:19:05 -0800
Message-Id: <1418696345-3394-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta][PATCH] glibc: CVE 2014-7817 and 2012-3406 fixes
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
X-List-Received-Date: Tue, 16 Dec 2014 02:19:16 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-3406-Stack-overflow-in-vfprintf-BZ-16617.patch | 339 +++++++++++++++++++++
 ...4-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch | 215 +++++++++++++
 meta/recipes-core/glibc/glibc_2.20.bb              |   5 +
 3 files changed, 559 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch b/meta/recipes-core/glibc/glibc/CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch
new file mode 100644
index 0000000..8cfdbea
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch
@@ -0,0 +1,339 @@
+From a5357b7ce2a2982c5778435704bcdb55ce3667a0 Mon Sep 17 00:00:00 2001
+From: Jeff Law <law@redhat.com>
+Date: Mon, 15 Dec 2014 10:09:32 +0100
+Subject: [PATCH] CVE-2012-3406: Stack overflow in vfprintf [BZ #16617]
+
+A larger number of format specifiers coudld cause a stack overflow,
+potentially allowing to bypass _FORTIFY_SOURCE format string
+protection.
+---
+ ChangeLog               |  9 +++++++
+ NEWS                    | 13 +++++----
+ stdio-common/Makefile   |  2 +-
+ stdio-common/bug23-2.c  | 70 +++++++++++++++++++++++++++++++++++++++++++++++++
+ stdio-common/bug23-3.c  | 50 +++++++++++++++++++++++++++++++++++
+ stdio-common/bug23-4.c  | 31 ++++++++++++++++++++++
+ stdio-common/vfprintf.c | 40 ++++++++++++++++++++++++++--
+ 7 files changed, 207 insertions(+), 8 deletions(-)
+ create mode 100644 stdio-common/bug23-2.c
+ create mode 100644 stdio-common/bug23-3.c
+ create mode 100644 stdio-common/bug23-4.c
+
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,12 @@
++2014-12-15  Jeff Law  <law@redhat.com>
++
++   [BZ #16617]
++   * stdio-common/vfprintf.c (vfprintf): Allocate large specs array
++   on the heap.  (CVE-2012-3406)
++   * stdio-common/bug23-2.c, stdio-common/bug23-3.c: New file.
++   * stdio-common/bug23-4.c: New file.  Test case by Joseph Myers.
++   * stdio-common/Makefile (tests): Add bug23-2, bug23-3, bug23-4.
++
+ 2014-11-19  Carlos O'Donell  <carlos@redhat.com>
+        Florian Weimer  <fweimer@redhat.com>
+        Joseph Myers  <joseph@codesourcery.com>
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -13,24 +13,28 @@ Version 2.20
+   15698, 15804, 15894, 15946, 16002, 16064, 16095, 16194, 16198, 16275,
+   16284, 16287, 16315, 16348, 16349, 16354, 16357, 16362, 16447, 16516,
+   16532, 16539, 16545, 16561, 16562, 16564, 16574, 16599, 16600, 16609,
+-  16610, 16611, 16613, 16619, 16623, 16629, 16632, 16634, 16639, 16642,
+-  16648, 16649, 16670, 16674, 16677, 16680, 16681, 16683, 16689, 16695,
+-  16701, 16706, 16707, 16712, 16713, 16714, 16724, 16731, 16739, 16740,
+-  16743, 16754, 16758, 16759, 16760, 16770, 16786, 16789, 16791, 16796,
+-  16799, 16800, 16815, 16823, 16824, 16831, 16838, 16839, 16849, 16854,
+-  16876, 16877, 16878, 16882, 16885, 16888, 16890, 16892, 16912, 16915,
+-  16916, 16917, 16918, 16922, 16927, 16928, 16932, 16943, 16958, 16965,
+-  16966, 16967, 16977, 16978, 16984, 16990, 16996, 17009, 17022, 17031,
+-  17042, 17048, 17050, 17058, 17061, 17062, 17069, 17075, 17078, 17079,
+-  17084, 17086, 17088, 17092, 17097, 17125, 17135, 17137, 17150, 17153,
+-  17187, 17213, 17259, 17261, 17262, 17263, 17319, 17325, 17354, 17625.
+-
++  16610, 16611, 16613, 16617, 16619, 16623, 16629, 16632, 16634, 16639,
++  16642, 16648, 16649, 16670, 16674, 16677, 16680, 16681, 16683, 16689,
++  16695, 16701, 16706, 16707, 16712, 16713, 16714, 16724, 16731, 16739,
++  16740, 16743, 16754, 16758, 16759, 16760, 16770, 16786, 16789, 16791,
++  16796, 16799, 16800, 16815, 16823, 16824, 16831, 16838, 16839, 16849,
++  16854, 16876, 16877, 16878, 16882, 16885, 16888, 16890, 16892, 16912,
++  16915, 16916, 16917, 16918, 16922, 16927, 16928, 16932, 16943, 16958,
++  16965, 16966, 16967, 16977, 16978, 16984, 16990, 16996, 17009, 17022,
++  17031, 17042, 17048, 17050, 17058, 17061, 17062, 17069, 17075, 17078,
++  17079, 17084, 17086, 17088, 17092, 17097, 17125, 17135, 17137, 17150,
++  17153, 17187, 17213, 17259, 17261, 17262, 17263, 17319, 17325, 17354,
++  17625.
++
+ * CVE-2104-7817 The wordexp function could ignore the WRDE_NOCMD flag
+   under certain input conditions resulting in the execution of a shell for
+   command substitution when the applicaiton did not request it. The
+   implementation now checks WRDE_NOCMD immediately before executing the
+   shell and returns the error WRDE_CMDSUB as expected.
+ 
++* CVE-2012-3406 printf-style functions could run into a stack overflow when
++  processing format strings with a large number of format specifiers.
++
+ * Reverted change of ABI data structures for s390 and s390x:
+   On s390 and s390x the size of struct ucontext and jmp_buf was increased in
+   2.19. This change is reverted in 2.20. The introduced 2.19 symbol versions
+Index: git/stdio-common/bug23-2.c
+===================================================================
+--- /dev/null
++++ git/stdio-common/bug23-2.c
+@@ -0,0 +1,70 @@
++#include <stdio.h>
++#include <string.h>
++#include <stdlib.h>
++
++static const char expected[] = "\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55\
++\n\
++a\n\
++abbcd55%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
++
++static int
++do_test (void)
++{
++  char *buf = malloc (strlen (expected) + 1);
++  snprintf (buf, strlen (expected) + 1,
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++	    "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n",
++	    "a", "b", "c", "d", 5);
++  return strcmp (buf, expected) != 0;
++}
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
+Index: git/stdio-common/bug23-3.c
+===================================================================
+--- /dev/null
++++ git/stdio-common/bug23-3.c
+@@ -0,0 +1,50 @@
++#include <stdio.h>
++#include <string.h>
++#include <stdlib.h>
++
++int
++do_test (void)
++{
++  size_t instances = 16384;
++#define X0 "\n%1$s\n" "%1$s" "%2$s" "%2$s" "%3$s" "%4$s" "%5$d" "%5$d"
++  const char *item = "\na\nabbcd55";
++#define X3 X0 X0 X0 X0 X0 X0 X0 X0
++#define X6 X3 X3 X3 X3 X3 X3 X3 X3
++#define X9 X6 X6 X6 X6 X6 X6 X6 X6
++#define X12 X9 X9 X9 X9 X9 X9 X9 X9
++#define X14 X12 X12 X12 X12
++#define TRAILER "%%%%%%%%%%%%%%%%%%%%%%%%%%"
++#define TRAILER2 TRAILER TRAILER
++  size_t length = instances * strlen (item) + strlen (TRAILER) + 1;
++
++  char *buf = malloc (length + 1);
++  snprintf (buf, length + 1,
++	    X14 TRAILER2 "\n",
++	    "a", "b", "c", "d", 5);
++
++  const char *p = buf;
++  size_t i;
++  for (i = 0; i < instances; ++i)
++    {
++      const char *expected;
++      for (expected = item; *expected; ++expected)
++	{
++	  if (*p != *expected)
++	    {
++	      printf ("mismatch at offset %zu (%zu): expected %d, got %d\n",
++		      (size_t) (p - buf), i, *expected & 0xFF, *p & 0xFF);
++	      return 1;
++	    }
++	  ++p;
++	}
++    }
++  if (strcmp (p, TRAILER "\n") != 0)
++    {
++      printf ("mismatch at trailer: [%s]\n", p);
++      return 1;
++    }
++  free (buf);
++  return 0;
++}
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
+Index: git/stdio-common/bug23-4.c
+===================================================================
+--- /dev/null
++++ git/stdio-common/bug23-4.c
+@@ -0,0 +1,31 @@
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/resource.h>
++
++#define LIMIT 1000000
++
++int
++main (void)
++{
++  struct rlimit lim;
++  getrlimit (RLIMIT_STACK, &lim);
++  lim.rlim_cur = 1048576;
++  setrlimit (RLIMIT_STACK, &lim);
++  char *fmtstr = malloc (4 * LIMIT + 1);
++  if (fmtstr == NULL)
++    abort ();
++  char *output = malloc (LIMIT + 1);
++  if (output == NULL)
++    abort ();
++  for (size_t i = 0; i < LIMIT; i++)
++    memcpy (fmtstr + 4 * i, "%1$d", 4);
++  fmtstr[4 * LIMIT] = '\0';
++  int ret = snprintf (output, LIMIT + 1, fmtstr, 0);
++  if (ret != LIMIT)
++    abort ();
++  for (size_t i = 0; i < LIMIT; i++)
++    if (output[i] != '0')
++      abort ();
++  return 0;
++}
+Index: git/stdio-common/vfprintf.c
+===================================================================
+--- git.orig/stdio-common/vfprintf.c
++++ git/stdio-common/vfprintf.c
+@@ -276,6 +276,12 @@ vfprintf (FILE *s, const CHAR_T *format,
+   /* For the argument descriptions, which may be allocated on the heap.  */
+   void *args_malloced = NULL;
+ 
++  /* For positional argument handling.  */
++  struct printf_spec *specs;
++
++  /* Track if we malloced the SPECS array and thus must free it.  */
++  bool specs_malloced = false;
++
+   /* This table maps a character into a number representing a
+      class.  In each step there is a destination label for each
+      class.  */
+@@ -1699,8 +1705,8 @@ do_positional:
+     size_t nspecs = 0;
+     /* A more or less arbitrary start value.  */
+     size_t nspecs_size = 32 * sizeof (struct printf_spec);
+-    struct printf_spec *specs = alloca (nspecs_size);
+ 
++    specs = alloca (nspecs_size);
+     /* The number of arguments the format string requests.  This will
+        determine the size of the array needed to store the argument
+        attributes.  */
+@@ -1743,11 +1749,39 @@ do_positional:
+ 	if (nspecs * sizeof (*specs) >= nspecs_size)
+ 	  {
+ 	    /* Extend the array of format specifiers.  */
++	    if (nspecs_size * 2 < nspecs_size)
++	      {
++		__set_errno (ENOMEM);
++		done = -1;
++		goto all_done;
++	      }
+ 	    struct printf_spec *old = specs;
+-	    specs = extend_alloca (specs, nspecs_size, 2 * nspecs_size);
++	    if (__libc_use_alloca (2 * nspecs_size))
++	      specs = extend_alloca (specs, nspecs_size, 2 * nspecs_size);
++	    else
++	      {
++		nspecs_size *= 2;
++		specs = malloc (nspecs_size);
++		if (specs == NULL)
++		  {
++		    __set_errno (ENOMEM);
++		    specs = old;
++		    done = -1;
++		    goto all_done;
++		  }
++	      }
+ 
+ 	    /* Copy the old array's elements to the new space.  */
+ 	    memmove (specs, old, nspecs * sizeof (*specs));
++
++	    /* If we had previously malloc'd space for SPECS, then
++	       release it after the copy is complete.  */
++	    if (specs_malloced)
++	      free (old);
++
++	    /* Now set SPECS_MALLOCED if needed.  */
++	    if (!__libc_use_alloca (nspecs_size))
++	      specs_malloced = true;
+ 	  }
+ 
+ 	/* Parse the format specifier.  */
+@@ -2068,6 +2102,8 @@ do_positional:
+   }
+ 
+ all_done:
++  if (specs_malloced)
++    free (specs);
+   if (__glibc_unlikely (args_malloced != NULL))
+     free (args_malloced);
+   if (__glibc_unlikely (workstart != NULL))
+Index: git/stdio-common/Makefile
+===================================================================
+--- git.orig/stdio-common/Makefile
++++ git/stdio-common/Makefile
+@@ -66,7 +66,7 @@ tests := tstscanf test_rdwr test-popen t
+ 	 tst-fwrite bug16 bug17 tst-sprintf2 bug18 \
+ 	 bug19 tst-popen2 scanf14 scanf15 bug21 bug22 scanf16 scanf17 \
+ 	 tst-setvbuf1 bug23 bug24 bug-vfprintf-nargs tst-sprintf3 bug25 \
+-	 tst-printf-round bug26
++	 tst-printf-round bug23-2 bug23-3 bug23-4
+ 
+ tests-$(OPTION_EGLIBC_LOCALE_CODE) \
+       += tst-sscanf tst-swprintf test-vfprintf bug14 scanf13 tst-grouping
diff --git a/meta/recipes-core/glibc/glibc/CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch b/meta/recipes-core/glibc/glibc/CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch
new file mode 100644
index 0000000..d95d182
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch
@@ -0,0 +1,215 @@
+From a39208bd7fb76c1b01c127b4c61f9bfd915bfe7c Mon Sep 17 00:00:00 2001
+From: Carlos O'Donell <carlos@redhat.com>
+Date: Wed, 19 Nov 2014 11:44:12 -0500
+Subject: [PATCH] CVE-2014-7817: wordexp fails to honour WRDE_NOCMD.
+
+The function wordexp() fails to properly handle the WRDE_NOCMD
+flag when processing arithmetic inputs in the form of "$((... ``))"
+where "..." can be anything valid. The backticks in the arithmetic
+epxression are evaluated by in a shell even if WRDE_NOCMD forbade
+command substitution. This allows an attacker to attempt to pass
+dangerous commands via constructs of the above form, and bypass
+the WRDE_NOCMD flag. This patch fixes this by checking for WRDE_NOCMD
+in exec_comm(), the only place that can execute a shell. All other
+checks for WRDE_NOCMD are superfluous and removed.
+
+We expand the testsuite and add 3 new regression tests of roughly
+the same form but with a couple of nested levels.
+
+On top of the 3 new tests we add fork validation to the WRDE_NOCMD
+testing. If any forks are detected during the execution of a wordexp()
+call with WRDE_NOCMD, the test is marked as failed. This is slightly
+heuristic since vfork might be used in the future, but it provides a
+higher level of assurance that no shells were executed as part of
+command substitution with WRDE_NOCMD in effect. In addition it doesn't
+require libpthread or libdl, instead we use the public implementation
+namespace function __register_atfork (already part of the public ABI
+for libpthread).
+
+Tested on x86_64 with no regressions.
+---
+ ChangeLog            | 22 ++++++++++++++++++++++
+ NEWS                 |  8 +++++++-
+ posix/wordexp-test.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
+ posix/wordexp.c      | 16 ++++------------
+ 4 files changed, 77 insertions(+), 13 deletions(-)
+
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,24 @@
++2014-11-19  Carlos O'Donell  <carlos@redhat.com>
++       Florian Weimer  <fweimer@redhat.com>
++       Joseph Myers  <joseph@codesourcery.com>
++       Adam Conrad  <adconrad@0c3.net>
++       Andreas Schwab  <schwab@suse.de>
++       Brooks  <bmoses@google.com>
++
++   [BZ #17625]
++   * wordexp-test.c (__dso_handle): Add prototype.
++   (__register_atfork): Likewise.
++   (__app_register_atfork): New function.
++   (registered_forks): New global.
++   (register_fork): New function.
++   (test_case): Add 3 new tests for WRDE_CMDSUB.
++   (main): Call __app_register_atfork.
++   (testit): If WRDE_NOCMD set registered_forks to zero, run test, and if
++   fork count is non-zero fail the test.
++   * posix/wordexp.c (exec_comm): Return WRDE_CMDSUB if WRDE_NOCMD flag
++   is set.
++   (parse_dollars): Remove check for WRDE_NOCMD.
++
+ 2014-09-07  Allan McRae  <allan@archlinux.org
+ 
+ 	* version.h (RELEASE): Set to "stable".
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -23,7 +23,13 @@ Version 2.20
+   16966, 16967, 16977, 16978, 16984, 16990, 16996, 17009, 17022, 17031,
+   17042, 17048, 17050, 17058, 17061, 17062, 17069, 17075, 17078, 17079,
+   17084, 17086, 17088, 17092, 17097, 17125, 17135, 17137, 17150, 17153,
+-  17187, 17213, 17259, 17261, 17262, 17263, 17319, 17325, 17354.
++  17187, 17213, 17259, 17261, 17262, 17263, 17319, 17325, 17354, 17625.
++
++* CVE-2104-7817 The wordexp function could ignore the WRDE_NOCMD flag
++  under certain input conditions resulting in the execution of a shell for
++  command substitution when the applicaiton did not request it. The
++  implementation now checks WRDE_NOCMD immediately before executing the
++  shell and returns the error WRDE_CMDSUB as expected.
+ 
+ * Reverted change of ABI data structures for s390 and s390x:
+   On s390 and s390x the size of struct ucontext and jmp_buf was increased in
+Index: git/posix/wordexp-test.c
+===================================================================
+--- git.orig/posix/wordexp-test.c
++++ git/posix/wordexp-test.c
+@@ -27,6 +27,25 @@
+ 
+ #define IFS " \n\t"
+ 
++extern void *__dso_handle __attribute__ ((__weak__, __visibility__ ("hidden")));
++extern int __register_atfork (void (*) (void), void (*) (void), void (*) (void), void *);
++
++static int __app_register_atfork (void (*prepare) (void), void (*parent) (void), void (*child) (void))
++{
++  return __register_atfork (prepare, parent, child,
++			    &__dso_handle == NULL ? NULL : __dso_handle);
++}
++
++/* Number of forks seen.  */
++static int registered_forks;
++
++/* For each fork increment the fork count.  */
++static void
++register_fork (void)
++{
++  registered_forks++;
++}
++
+ struct test_case_struct
+ {
+   int retval;
+@@ -206,6 +225,12 @@ struct test_case_struct
+     { WRDE_SYNTAX, NULL, "$((2+))", 0, 0, { NULL, }, IFS },
+     { WRDE_SYNTAX, NULL, "`", 0, 0, { NULL, }, IFS },
+     { WRDE_SYNTAX, NULL, "$((010+4+))", 0, 0, { NULL }, IFS },
++    /* Test for CVE-2014-7817. We test 3 combinations of command
++       substitution inside an arithmetic expression to make sure that
++       no commands are executed and error is returned.  */
++    { WRDE_CMDSUB, NULL, "$((`echo 1`))", WRDE_NOCMD, 0, { NULL, }, IFS },
++    { WRDE_CMDSUB, NULL, "$((1+`echo 1`))", WRDE_NOCMD, 0, { NULL, }, IFS },
++    { WRDE_CMDSUB, NULL, "$((1+$((`echo 1`))))", WRDE_NOCMD, 0, { NULL, }, IFS },
+ 
+     { -1, NULL, NULL, 0, 0, { NULL, }, IFS },
+   };
+@@ -258,6 +283,15 @@ main (int argc, char *argv[])
+ 	  return -1;
+     }
+ 
++  /* If we are not allowed to do command substitution, we install
++     fork handlers to verify that no forks happened.  No forks should
++     happen at all if command substitution is disabled.  */
++  if (__app_register_atfork (register_fork, NULL, NULL) != 0)
++    {
++      printf ("Failed to register fork handler.\n");
++      return -1;
++    }
++
+   for (test = 0; test_case[test].retval != -1; test++)
+     if (testit (&test_case[test]))
+       ++fail;
+@@ -367,6 +401,9 @@ testit (struct test_case_struct *tc)
+ 
+   printf ("Test %d (%s): ", ++tests, tc->words);
+ 
++  if (tc->flags & WRDE_NOCMD)
++    registered_forks = 0;
++
+   if (tc->flags & WRDE_APPEND)
+     {
+       /* initial wordexp() call, to be appended to */
+@@ -378,6 +415,13 @@ testit (struct test_case_struct *tc)
+     }
+   retval = wordexp (tc->words, &we, tc->flags);
+ 
++  if ((tc->flags & WRDE_NOCMD)
++      && (registered_forks > 0))
++    {
++	  printf ("FAILED fork called for WRDE_NOCMD\n");
++	  return 1;
++    }
++
+   if (tc->flags & WRDE_DOOFFS)
+       start_offs = sav_we.we_offs;
+ 
+Index: git/posix/wordexp.c
+===================================================================
+--- git.orig/posix/wordexp.c
++++ git/posix/wordexp.c
+@@ -893,6 +893,10 @@ exec_comm (char *comm, char **word, size
+   pid_t pid;
+   int noexec = 0;
+ 
++  /* Do nothing if command substitution should not succeed.  */
++  if (flags & WRDE_NOCMD)
++    return WRDE_CMDSUB;
++
+   /* Don't fork() unless necessary */
+   if (!comm || !*comm)
+     return 0;
+@@ -2082,9 +2086,6 @@ parse_dollars (char **word, size_t *word
+ 	    }
+ 	}
+ 
+-      if (flags & WRDE_NOCMD)
+-	return WRDE_CMDSUB;
+-
+       (*offset) += 2;
+       return parse_comm (word, word_length, max_length, words, offset, flags,
+ 			 quoted? NULL : pwordexp, ifs, ifs_white);
+@@ -2196,9 +2197,6 @@ parse_dquote (char **word, size_t *word_
+ 	  break;
+ 
+ 	case '`':
+-	  if (flags & WRDE_NOCMD)
+-	    return WRDE_CMDSUB;
+-
+ 	  ++(*offset);
+ 	  error = parse_backtick (word, word_length, max_length, words,
+ 				  offset, flags, NULL, NULL, NULL);
+@@ -2357,12 +2355,6 @@ wordexp (const char *words, wordexp_t *p
+ 	break;
+ 
+       case '`':
+-	if (flags & WRDE_NOCMD)
+-	  {
+-	    error = WRDE_CMDSUB;
+-	    goto do_error;
+-	  }
+-
+ 	++words_offset;
+ 	error = parse_backtick (&word, &word_length, &max_length, words,
+ 				&words_offset, flags, pwordexp, ifs,
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index 30a4397..9dd5e67 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=release/${PV}/master \
            file://grok_gold.patch \
            file://fix_am_rootsbindir.patch \
            ${EGLIBCPATCHES} \
+           ${CVEPATCHES} \
           "
 EGLIBCPATCHES = "\
            file://timezone-re-written-tzselect-as-posix-sh.patch \
@@ -40,6 +41,10 @@ EGLIBCPATCHES = "\
 #	    file://initgroups_keys.patch \
 #
 
+CVEPATCHES = "\
+        file://CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch \
+        file://CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch \
+    "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-- 
1.9.1


