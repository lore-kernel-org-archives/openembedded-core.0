Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6013972A78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 17:44:33 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so34017931pab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=687+hQcygpYK4gnji/ixCY8mJlKNoZ3D41STiGULsSc=;
	b=vsWXrtW4twyzz8n1CRELCWGHBAdDykw6fzmXMP/MevpXjz+jWO74EiXqdYszBdukaE
	f6fB1JyXC4xYcHN2U1YXzmEn93eXHnoaFoUrgRvFZKiTKC07I/98FxLLBqG69vLR98vB
	q3KM171WTaT9ORIbmbHj8wydpAwclBnjafK+0KjYbYg2LN5NqjRMEFxz0zeBPq5hcaMC
	Nfctu22vhv0hAvuU553JmMSNBYDVfI3CLR0ShpCBoNoVb5nSG8v6mssf2NLgbYS3pJKp
	SmGLCE115kgJjZbND0VRnOGiIwteKgM/ROpQwDn088Pqqhr0j0jaCezUpLnXZNP+hnCV
	1ESw==
X-Received: by 10.66.232.8 with SMTP id tk8mr375735pac.5.1430329474928;
	Wed, 29 Apr 2015 10:44:34 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id kr9sm9574726pbc.34.2015.04.29.10.44.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Apr 2015 10:44:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2015 10:44:27 -0700
Message-Id: <1430329467-19882-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [Daisy][PATCH] eglibc: fix two security issues.
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
X-List-Received-Date: Wed, 29 Apr 2015 17:44:36 -0000

The includes two CVE fixes:
CVE-2012-3406
CVE-2014-7817

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-3406-Stack-overflow-in-vfprintf-BZ-16617.patch | 317 +++++++++++++++++++++
 ...4-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch | 216 ++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.19.bb            |   2 +
 3 files changed, 535 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.19/CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch
new file mode 100644
index 0000000..c94e682
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch
@@ -0,0 +1,317 @@
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
+Index: libc/ChangeLog
+===================================================================
+--- libc.orig/ChangeLog
++++ libc/ChangeLog
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
+Index: libc/NEWS
+===================================================================
+--- libc.orig/NEWS
++++ libc/NEWS
+@@ -26,7 +26,7 @@ Version 2.19
+   16271, 16274, 16283, 16289, 16293, 16314, 16316, 16330, 16337, 16338,
+   16356, 16365, 16366, 16369, 16372, 16375, 16379, 16384, 16385, 16386,
+   16387, 16390, 16394, 16398, 16400, 16407, 16408, 16414, 16430, 16431,
+-  16453, 16474, 16506, 16510, 16529, 17187, 17625.
++  16453, 16474, 16506, 16510, 16529, 16619, 17187, 17625.
+ 
+ * CVE-2104-7817 The wordexp function could ignore the WRDE_NOCMD flag
+   under certain input conditions resulting in the execution of a shell for
+@@ -34,6 +34,9 @@ Version 2.19
+   implementation now checks WRDE_NOCMD immediately before executing the
+   shell and returns the error WRDE_CMDSUB as expected.
+ 
++* CVE-2012-3406 printf-style functions could run into a stack overflow when
++  processing format strings with a large number of format specifiers.
++
+ * Slovenian translations for glibc messages have been contributed by the
+   Translation Project's Slovenian team of translators.
+ 
+Index: libc/stdio-common/bug23-2.c
+===================================================================
+--- /dev/null
++++ libc/stdio-common/bug23-2.c
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
+Index: libc/stdio-common/bug23-3.c
+===================================================================
+--- /dev/null
++++ libc/stdio-common/bug23-3.c
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
+Index: libc/stdio-common/bug23-4.c
+===================================================================
+--- /dev/null
++++ libc/stdio-common/bug23-4.c
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
+Index: libc/stdio-common/vfprintf.c
+===================================================================
+--- libc.orig/stdio-common/vfprintf.c
++++ libc/stdio-common/vfprintf.c
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
+@@ -1698,8 +1704,8 @@ do_positional:
+     size_t nspecs = 0;
+     /* A more or less arbitrary start value.  */
+     size_t nspecs_size = 32 * sizeof (struct printf_spec);
+-    struct printf_spec *specs = alloca (nspecs_size);
+ 
++    specs = alloca (nspecs_size);
+     /* The number of arguments the format string requests.  This will
+        determine the size of the array needed to store the argument
+        attributes.  */
+@@ -1742,11 +1748,39 @@ do_positional:
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
+@@ -2067,6 +2101,8 @@ do_positional:
+   }
+ 
+ all_done:
++  if (specs_malloced)
++    free (specs);
+   if (__glibc_unlikely (args_malloced != NULL))
+     free (args_malloced);
+   if (__glibc_unlikely (workstart != NULL))
+Index: libc/stdio-common/Makefile
+===================================================================
+--- libc.orig/stdio-common/Makefile
++++ libc/stdio-common/Makefile
+@@ -64,7 +64,7 @@ tests := tstscanf test_rdwr test-popen t
+ 	 tst-fwrite bug16 bug17 tst-sprintf2 bug18 \
+ 	 bug19 tst-popen2 scanf14 scanf15 bug21 bug22 scanf16 scanf17 \
+ 	 tst-setvbuf1 bug23 bug24 bug-vfprintf-nargs tst-sprintf3 bug25 \
+-	 tst-printf-round bug26
++	 tst-printf-round bug23-2 bug23-3 bug23-4
+ tests-$(OPTION_EGLIBC_LOCALE_CODE) \
+       += tst-sscanf tst-swprintf test-vfprintf bug14 scanf13 tst-grouping
+ tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) \
diff --git a/meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch
new file mode 100644
index 0000000..2741ce6
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch
@@ -0,0 +1,216 @@
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
+Index: libc/ChangeLog
+===================================================================
+--- libc.orig/ChangeLog
++++ libc/ChangeLog
+@@ -1,3 +1,25 @@
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
++   (parse_dquote): Likewise.
++
+ 2014-08-26  Florian Weimer  <fweimer@redhat.com>
+ 
+ 	[BZ #17187]
+Index: libc/posix/wordexp-test.c
+===================================================================
+--- libc.orig/posix/wordexp-test.c
++++ libc/posix/wordexp-test.c
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
+Index: libc/posix/wordexp.c
+===================================================================
+--- libc.orig/posix/wordexp.c
++++ libc/posix/wordexp.c
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
+Index: libc/NEWS
+===================================================================
+--- libc.orig/NEWS
++++ libc/NEWS
+@@ -26,7 +26,13 @@ Version 2.19
+   16271, 16274, 16283, 16289, 16293, 16314, 16316, 16330, 16337, 16338,
+   16356, 16365, 16366, 16369, 16372, 16375, 16379, 16384, 16385, 16386,
+   16387, 16390, 16394, 16398, 16400, 16407, 16408, 16414, 16430, 16431,
+-  16453, 16474, 16506, 16510, 16529, 17187
++  16453, 16474, 16506, 16510, 16529, 17187, 17625.
++
++* CVE-2104-7817 The wordexp function could ignore the WRDE_NOCMD flag
++  under certain input conditions resulting in the execution of a shell for
++  command substitution when the applicaiton did not request it. The
++  implementation now checks WRDE_NOCMD immediately before executing the
++  shell and returns the error WRDE_CMDSUB as expected.
+ 
+ * Slovenian translations for glibc messages have been contributed by the
+   Translation Project's Slovenian team of translators.
diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
index 090cfe6..a15573c 100644
--- a/meta/recipes-core/eglibc/eglibc_2.19.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
@@ -27,6 +27,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25
            file://ppce6500-32b_slow_ieee754_sqrt.patch \
            file://grok_gold.patch \
            file://CVE-2014-5119.patch \
+           file://CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch \
+           file://CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch \
           "
 SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
 SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
-- 
2.3.5


