Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 59284607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 09:32:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3R9WuIc001508
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 02:32:56 -0700 (PDT)
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Apr 2016 02:32:55 -0700
From: Yuanjie Huang <yuanjie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Apr 2016 02:32:55 -0700
Message-ID: <1461749575-8912-1-git-send-email-yuanjie.huang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [jethro][PATCH] glibc: Fix CVE-2015-8778
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
X-List-Received-Date: Wed, 27 Apr 2016 09:32:56 -0000
Content-Type: text/plain

CVE: CVE-2015-8778

Improve check against integer wraparound in hcreate_r [BZ #18240]

This is an integer overflow in hcreate and hcreate_r which can result in
an out-of-bound memory access.  This could lead to application crashes
or, potentially, arbitrary code execution.

Upstream-Status: Backport [2.23]
(cherry-picked from commit bae7c7c7, 4bd228c8)

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-core/glibc/glibc/CVE-2015-8778.patch | 199 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb             |   1 +
 2 files changed, 200 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8778.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-8778.patch b/meta/recipes-core/glibc/glibc/CVE-2015-8778.patch
new file mode 100644
index 0000000..c505c10
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-8778.patch
@@ -0,0 +1,199 @@
+From d0f05d1e39adb336a8bbccbc276a344e6ff427e3 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 28 Jan 2016 13:59:11 +0100
+Subject: [PATCH] Improve check against integer wraparound in hcreate_r [BZ
+ #18240]
+
+CVE: CVE-2015-8778
+
+Improve check against integer wraparound in hcreate_r [BZ #18240]
+
+This is an integer overflow in hcreate and hcreate_r which can result in
+an out-of-bound memory access.  This could lead to application crashes
+or, potentially, arbitrary code execution.
+
+Upstream-Status: Backport [2.23]
+(cherry-picked from commit bae7c7c7, 4bd228c8)
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ ChangeLog        |  6 +++++
+ NEWS             |  2 +-
+ misc/Makefile    |  2 +-
+ misc/bug18240.c  | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ misc/hsearch_r.c | 28 ++++++++++++---------
+ 5 files changed, 100 insertions(+), 13 deletions(-)
+ create mode 100644 misc/bug18240.c
+
+diff --git a/ChangeLog b/ChangeLog
+index b7701d1..a9dc8a2 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2016-01-27  Paul Eggert  <eggert@cs.ucla.edu>
++
++	[BZ #18240]
++	* misc/hsearch_r.c (isprime, __hcreate_r): Protect against
++	unsigned int wraparound.
++
+ 2016-02-15  Carlos O'Donell  <carlos@redhat.com>
+ 
+    [BZ #18665]
+diff --git a/NEWS b/NEWS
+index cda7a73..fd77c27 100644
+--- a/NEWS
++++ b/NEWS
+@@ -9,7 +9,7 @@ Version 2.22.1
+ 
+ * The following bugs are resolved with this release:
+ 
+-  18778, 18781, 18787, 17905.
++  18240, 18778, 18781, 18787, 17905.
+ 
+ Version 2.22
+ 
+diff --git a/misc/Makefile b/misc/Makefile
+index e6b7c23..463a238 100644
+--- a/misc/Makefile
++++ b/misc/Makefile
+@@ -83,7 +83,7 @@ install-lib := libg.a
+ gpl2lgpl := error.c error.h
+ 
+ tests := tst-dirname tst-tsearch tst-fdset tst-mntent tst-hsearch \
+-	 tst-pselect tst-insremque tst-mntent2 bug-hsearch1
++	 tst-pselect tst-insremque tst-mntent2 bug-hsearch1 bug18240
+ tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) += tst-error1
+ tests-$(OPTION_EGLIBC_FCVT) += tst-efgcvt
+ ifeq ($(run-built-tests),yes)
+diff --git a/misc/bug18240.c b/misc/bug18240.c
+new file mode 100644
+index 0000000..4b26865
+--- /dev/null
++++ b/misc/bug18240.c
+@@ -0,0 +1,75 @@
++/* Test integer wraparound in hcreate.
++   Copyright (C) 2016 Free Software Foundation, Inc.
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
++#include <errno.h>
++#include <limits.h>
++#include <search.h>
++#include <stdbool.h>
++#include <stdio.h>
++#include <stdlib.h>
++
++static void
++test_size (size_t size)
++{
++  int res = hcreate (size);
++  if (res == 0)
++    {
++      if (errno == ENOMEM)
++        return;
++      printf ("error: hcreate (%zu): %m\n", size);
++      exit (1);
++    }
++  char *keys[100];
++  for (int i = 0; i < 100; ++i)
++    {
++      if (asprintf (keys + i, "%d", i) < 0)
++        {
++          printf ("error: asprintf: %m\n");
++          exit (1);
++        }
++      ENTRY e = { keys[i], (char *) "value" };
++      if (hsearch (e, ENTER) == NULL)
++        {
++          printf ("error: hsearch (\"%s\"): %m\n", keys[i]);
++          exit (1);
++        }
++    }
++  hdestroy ();
++
++  for (int i = 0; i < 100; ++i)
++    free (keys[i]);
++}
++
++static int
++do_test (void)
++{
++  test_size (500);
++  test_size (-1);
++  test_size (-3);
++  test_size (INT_MAX - 2);
++  test_size (INT_MAX - 1);
++  test_size (INT_MAX);
++  test_size (((unsigned) INT_MAX) + 1);
++  test_size (UINT_MAX - 2);
++  test_size (UINT_MAX - 1);
++  test_size (UINT_MAX);
++  return 0;
++}
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
+diff --git a/misc/hsearch_r.c b/misc/hsearch_r.c
+index 9f55e84..6000ce2 100644
+--- a/misc/hsearch_r.c
++++ b/misc/hsearch_r.c
+@@ -46,15 +46,12 @@ static int
+ isprime (unsigned int number)
+ {
+   /* no even number will be passed */
+-  unsigned int div = 3;
+-
+-  while (div * div < number && number % div != 0)
+-    div += 2;
+-
+-  return number % div != 0;
++  for (unsigned int div = 3; div <= number / div; div += 2)
++    if (number % div == 0)
++      return 0;
++  return 1;
+ }
+ 
+-
+ /* Before using the hash table we must allocate memory for it.
+    Test for an existing table are done. We allocate one element
+    more as the found prime number says. This is done for more effective
+@@ -81,10 +78,19 @@ __hcreate_r (nel, htab)
+      use will not work.  */
+   if (nel < 3)
+     nel = 3;
+-  /* Change nel to the first prime number not smaller as nel. */
+-  nel |= 1;      /* make odd */
+-  while (!isprime (nel))
+-    nel += 2;
++
++  /* Change nel to the first prime number in the range [nel, UINT_MAX - 2],
++     The '- 2' means 'nel += 2' cannot overflow.  */
++  for (nel |= 1; ; nel += 2)
++    {
++      if (UINT_MAX - 2 < nel)
++	{
++	  __set_errno (ENOMEM);
++	  return 0;
++	}
++      if (isprime (nel))
++	break;
++    }
+ 
+   htab->size = nel;
+   htab->filled = 0;
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index a13b7f9..7b25847 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -47,6 +47,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://CVE-2015-9761_2.patch \
            file://CVE-2015-8776.patch \
            file://CVE-2015-7547.patch \
+           file://CVE-2015-8778.patch \
 "
 
 SRC_URI += "\
-- 
2.7.4


