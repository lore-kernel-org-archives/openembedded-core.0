Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +YixbwxQlEXzpTJgxkHkAYi9s5JPr4nFJ/8L9yAO8kjcfWWN6oX0daHtS/QmWNafs7i1m15r/B
 e+rTZ0hLxgfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236043"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236043"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:13 -0800
IronPort-SDR: TFGkuD4lAHkeVCDL/x1c3oDtQqlB9GfToc7zPMCig0rfEq4LqPbFoHL5yYhW95rTU6+iAvy2g+
 oXqw25O4qmWg==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027584"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:12 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/35] glibc: Make adjtime() for 32 bit support being called with delta == NULL
Date: Wed, 23 Dec 2020 23:18:25 +0800
Message-Id: <2f8da84311bb0a3b6eb93e4d5fe55914a84e68d7.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This backports a fix from glibc's master branch, which solves a
regression in 2.32 with adjtime() where it would seg fault if being
called with delta == NULL on 32 bit machines.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aeecccf17c45c840c070e2de95c602a3c7e9d30e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-adjtime-with-NULL-argument-BZ-26833.patch | 110 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.32.bb         |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch

diff --git a/meta/recipes-core/glibc/glibc/0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch b/meta/recipes-core/glibc/glibc/0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch
new file mode 100644
index 0000000000..a458a2a223
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch
@@ -0,0 +1,110 @@
+From 75a193b7611bade31a150dfcc528b973e3d46231 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Mon, 2 Nov 2020 16:18:29 -0300
+Subject: [PATCH] linux: Allow adjtime with NULL argument [BZ #26833]
+
+The adjtime interface allows return the amount of time remaining
+from any previous adjustment that has not yet been completed by
+passing a NULL as first argument.  This was introduced with y2038
+support 0308077e3a.
+
+Checked on i686-linux-gnu.
+
+Reviewed-by: Lukasz Majewski <lukma@denx.de>
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=75a193b7611bade31a150dfcc528b973e3d46231]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ sysdeps/unix/sysv/linux/adjtime.c | 11 +++++---
+ time/Makefile                     |  3 ++-
+ time/tst-adjtime.c                | 44 +++++++++++++++++++++++++++++++
+ 3 files changed, 54 insertions(+), 4 deletions(-)
+ create mode 100644 time/tst-adjtime.c
+
+diff --git a/sysdeps/unix/sysv/linux/adjtime.c b/sysdeps/unix/sysv/linux/adjtime.c
+index 3f9a4ea2eb..6d1d1b6af2 100644
+--- a/sysdeps/unix/sysv/linux/adjtime.c
++++ b/sysdeps/unix/sysv/linux/adjtime.c
+@@ -68,11 +68,16 @@ libc_hidden_def (__adjtime64)
+ int
+ __adjtime (const struct timeval *itv, struct timeval *otv)
+ {
+-  struct __timeval64 itv64, otv64;
++  struct __timeval64 itv64, *pitv64 = NULL;
++  struct __timeval64 otv64;
+   int retval;
+ 
+-  itv64 = valid_timeval_to_timeval64 (*itv);
+-  retval = __adjtime64 (&itv64, otv != NULL ? &otv64 : NULL);
++  if (itv != NULL)
++    {
++      itv64 = valid_timeval_to_timeval64 (*itv);
++      pitv64 = &itv64;
++    }
++  retval = __adjtime64 (pitv64, otv != NULL ? &otv64 : NULL);
+   if (otv != NULL)
+     *otv = valid_timeval64_to_timeval (otv64);
+ 
+diff --git a/time/Makefile b/time/Makefile
+index 26aa835166..f27a75a115 100644
+--- a/time/Makefile
++++ b/time/Makefile
+@@ -47,7 +47,8 @@ tests	:= test_time clocktest tst-posixtz tst-strptime tst_wcsftime \
+ 	   tst-mktime3 tst-strptime2 bug-asctime bug-asctime_r bug-mktime1 \
+ 	   tst-strptime3 bug-getdate1 tst-strptime-whitespace tst-ftime \
+ 	   tst-tzname tst-y2039 bug-mktime4 tst-strftime2 tst-strftime3 \
+-	   tst-clock tst-clock2 tst-clock_nanosleep tst-cpuclock1
++	   tst-clock tst-clock2 tst-clock_nanosleep tst-cpuclock1 \
++	   tst-adjtime
+ 
+ include ../Rules
+ 
+diff --git a/time/tst-adjtime.c b/time/tst-adjtime.c
+new file mode 100644
+index 0000000000..ae2b37cdab
+--- /dev/null
++++ b/time/tst-adjtime.c
+@@ -0,0 +1,44 @@
++/* Basic tests for adjtime.
++   Copyright (C) 2020 Free Software Foundation, Inc.
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
++   <https://www.gnu.org/licenses/>.  */
++
++#include <sys/time.h>
++#include <stdlib.h>
++
++#include <errno.h>
++#include <support/check.h>
++
++
++static int
++do_test (void)
++{
++  /* Check if the interface allows getting the amount of time remaining
++     from any previous adjustment that has not yet been completed.  This
++     is a non-privileged function of adjtime.  */
++  struct timeval tv;
++  int r = adjtime (NULL, &tv);
++  if (r == -1)
++    {
++      if (errno == ENOSYS)
++	FAIL_UNSUPPORTED ("adjtime unsupported");
++      FAIL_EXIT1 ("adjtime (NULL, ...) failed: %m");
++    }
++
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
index 6d42f33822..b850c28c78 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -43,6 +43,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
+           file://0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch \
            file://CVE-2020-29562.patch \
            file://CVE-2020-29573.patch \
            "
-- 
2.29.2

