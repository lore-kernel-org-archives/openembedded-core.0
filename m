Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.896.1610653880319693745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 11:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jdE9CEH5;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2so4000700pfq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 11:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=geioWZ+XUAIj/sRYfyh7ayVpRloOGzBzkcZSRtajbh4=;
        b=jdE9CEH5QPTCXHGGpzXJt/9oazRSVkhcERis40XFw24PZCjvyuwnzHxb3QeYssnprV
         fJsI93+zMUk8+3F4ym1ZzUq8qma2+Ej3UOFZdr/njfGpXbUNCEOLjC0ddtoxhcGKmrmx
         qt2xIA/0aSlYOiAQpVh9I6CEiruo7r2ueAafkhe0LOe9/YPys7xwYD4i8K7q3dlNwApV
         sgk3QiVublgQeDcv0iEbMX57brYWKfCV1dKNYfAkTTk2rhuk5W2yDSv1Tk/Ry633LNos
         gi/d0G/vzUP0Ehp07tseAUJTF9kQ3EtWMfx6sBZyPoVnWmCkGgDNuqfEv0RaRYcjkCvG
         5yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=geioWZ+XUAIj/sRYfyh7ayVpRloOGzBzkcZSRtajbh4=;
        b=Cgwv1sJLXTcPTMLCNE3Q0h2tKUctbd+d0btKDFqMyRVsvpTLasD5e+z7jeUHvUGkn8
         yWk4FPvvo+vXVSwt4MqBctKEdJhE0kB3DOX3c/gs8rLrKn6ViQVjiSh9bUD2R0SB3YF1
         jEzn6/ymsZyoFhymy4gzD5jDCSs5EPj266e2IW8c0a9UcBQYJPg95R7xcvI/8SYV6UGu
         EctStzsPgpz6iLC4UY9IZIcxi5FwrCahVE1K6PityhCz4ry/LqnuwlwamcMLZ8A8U49n
         Vpy0napcT8d/BrnwssmlMQhFGgz0jI7LijEKVQmtlabdtOpgjOPi/uX+/T4mdUhVXSz4
         oQig==
X-Gm-Message-State: AOAM531JkpiA9NhOz0sm1FC0LCyRcYRI4wXBcwNSYFybEyxUnBWigfoy
	p25dXyNJEdb+zTh06bWFbDBxavDw+/Q6bw==
X-Google-Smtp-Source: ABdhPJwvV6na/2nzMUoR+qgh8n1IPLdJYsNvx16twz/Q+mkaYSK81X5lssYPUqhvKFY47SRboOLkfA==
X-Received: by 2002:a63:3549:: with SMTP id c70mr8994109pga.361.1610653879473;
        Thu, 14 Jan 2021 11:51:19 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:19ce:8609:7a34:860])
        by smtp.gmail.com with ESMTPSA id u68sm5573617pfb.70.2021.01.14.11.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:51:19 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH] glibc: Security fix for CVE-2020-29573
Date: Thu, 14 Jan 2021 11:51:17 -0800
Message-Id: <20210114195117.16142-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

Source: glibc.org
MR: 107580
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/?p=glibc.git;a=commit;h=681900d29683722b1cb0a8e565a0585846ec5a61

ChangeID: 7bc5edb2e1947ac0774a453000a1568bbe3bb7d2
Description:

Fixedup to match 2.31 context. ldbl2mpn.c is in i386 for this version

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../glibc/glibc/CVE-2020-29573.patch          | 128 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29573.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch b/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
new file mode 100644
index 00000000000..1e75f2d29d4
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
@@ -0,0 +1,128 @@
+From 681900d29683722b1cb0a8e565a0585846ec5a61 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 22 Sep 2020 19:07:48 +0200
+Subject: [PATCH] x86: Harden printf against non-normal long double values (bug
+ 26649)
+
+The behavior of isnan/__builtin_isnan on bit patterns that do not
+correspond to something that the CPU would produce from valid inputs
+is currently under-defined in the toolchain. (The GCC built-in and
+glibc disagree.)
+
+The isnan check in PRINTF_FP_FETCH in stdio-common/printf_fp.c
+assumes the GCC behavior that returns true for non-normal numbers
+which are not specified as NaN. (The glibc implementation returns
+false for such numbers.)
+
+At present, passing non-normal numbers to __mpn_extract_long_double
+causes this function to produce irregularly shaped multi-precision
+integers, triggering undefined behavior in __printf_fp_l.
+
+With GCC 10 and glibc 2.32, this behavior is not visible because
+__builtin_isnan is used, which avoids calling
+__mpn_extract_long_double in this case.  This commit updates the
+implementation of __mpn_extract_long_double so that regularly shaped
+multi-precision integers are produced in this case, avoiding
+undefined behavior in __printf_fp_l.
+
+Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
+CVE: CVE-2020-29573
+Signed-off-By: Armin Kuster <akuster@mvista.com>
+
+---
+ sysdeps/x86/Makefile                    |  4 ++
+ sysdeps/x86/ldbl2mpn.c                  |  8 ++++
+ sysdeps/x86/tst-ldbl-nonnormal-printf.c | 52 +++++++++++++++++++++++++
+ 3 files changed, 64 insertions(+)
+ create mode 100644 sysdeps/x86/tst-ldbl-nonnormal-printf.c
+
+Index: git/sysdeps/x86/Makefile
+===================================================================
+--- git.orig/sysdeps/x86/Makefile
++++ git/sysdeps/x86/Makefile
+@@ -9,6 +9,10 @@ tests += tst-get-cpu-features tst-get-cp
+ tests-static += tst-get-cpu-features-static
+ endif
+ 
++ifeq ($(subdir),math)
++tests += tst-ldbl-nonnormal-printf
++endif # $(subdir) == math
++
+ ifeq ($(subdir),setjmp)
+ gen-as-const-headers += jmp_buf-ssp.sym
+ sysdep_routines += __longjmp_cancel
+Index: git/sysdeps/x86/tst-ldbl-nonnormal-printf.c
+===================================================================
+--- /dev/null
++++ git/sysdeps/x86/tst-ldbl-nonnormal-printf.c
+@@ -0,0 +1,52 @@
++/* Test printf with x86-specific non-normal long double value.
++   Copyright (C) 2020 Free Software Foundation, Inc.
++
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
++#include <stdio.h>
++#include <string.h>
++#include <support/check.h>
++
++/* Fill the stack with non-zero values.  This makes a crash in
++   snprintf more likely.  */
++static void __attribute__ ((noinline, noclone))
++fill_stack (void)
++{
++  char buffer[65536];
++  memset (buffer, 0xc0, sizeof (buffer));
++  asm ("" ::: "memory");
++}
++
++static int
++do_test (void)
++{
++  fill_stack ();
++
++  long double value;
++  memcpy (&value, "\x00\x04\x00\x00\x00\x00\x00\x00\x00\x04", 10);
++
++  char buf[30];
++  int ret = snprintf (buf, sizeof (buf), "%Lg", value);
++  TEST_COMPARE (ret, strlen (buf));
++  if (strcmp (buf, "nan") != 0)
++    /* If snprintf does not recognize the non-normal number as a NaN,
++       it has added the missing explicit MSB.  */
++    TEST_COMPARE_STRING (buf, "3.02201e-4624");
++  return 0;
++}
++
++#include <support/test-driver.c>
+Index: git/sysdeps/i386/ldbl2mpn.c
+===================================================================
+--- git.orig/sysdeps/i386/ldbl2mpn.c
++++ git/sysdeps/i386/ldbl2mpn.c
+@@ -115,6 +115,12 @@ __mpn_extract_long_double (mp_ptr res_pt
+ 	   && res_ptr[N - 1] == 0)
+     /* Pseudo zero.  */
+     *expt = 0;
+-
++  else
++    /* The sign bit is explicit, but add it in case it is missing in
++       the input.  Otherwise, callers will not be able to produce the
++       expected multi-precision integer layout by shifting the sign
++       bit into the MSB.  */
++    res_ptr[N - 1] |= (mp_limb_t) 1 << (LDBL_MANT_DIG - 1
++                   - ((N - 1) * BITS_PER_MP_LIMB));
+   return N;
+ }
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 3a0d60abf8d..067d4de64a6 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -42,6 +42,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://CVE-2020-29562.patch \
+           file://CVE-2020-29573.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.17.1

