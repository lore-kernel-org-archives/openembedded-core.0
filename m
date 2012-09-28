Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THPem-0004t2-5y
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 03:46:20 +0200
Received: from mail94-am1-R.bigfish.com (10.3.201.237) by
	AM1EHSOBE009.bigfish.com (10.3.204.29) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 01:33:28 +0000
Received: from mail94-am1 (localhost [127.0.0.1])	by mail94-am1-R.bigfish.com
	(Postfix) with ESMTP id E4BB0360074	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:27 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 6
X-BigFish: VS6(zz936eIc8kd6f1izz1202h1d1ah1d2ah1082kzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1155h)
Received: from mail94-am1 (localhost.localdomain [127.0.0.1]) by mail94-am1
	(MessageSwitch) id 1348796003551382_1303;
	Fri, 28 Sep 2012 01:33:23 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.248])	by
	mail94-am1.bigfish.com (Postfix) with ESMTP id 3CA87A0058	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 01:33:21 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 27 Sep 2012 20:33:20 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8S1XJaI007331 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 18:33:20 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 20:33:05 -0500
Message-ID: <1348795994-21695-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 01/10] eglibc_2.16.bb: replace patch with updated version that supports e6500
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 01:46:20 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: add upstream-status and signed off by to patch

 .../eglibc/eglibc-2.16/glibc.fix_sqrt2.patch       | 1491 ++++++++++++++++++++
 .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch |  538 -------
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    4 +-
 3 files changed, 1493 insertions(+), 540 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/glibc.fix_sqrt2.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/glibc.fix_sqrt2.patch b/meta/recipes-core/eglibc/eglibc-2.16/glibc.fix_sqrt2.patch
new file mode 100644
index 0000000..a669729
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/glibc.fix_sqrt2.patch
@@ -0,0 +1,1491 @@
+Signed-of-by: Edmar Wienskoski <edmar@freescale.com>
+Upstream-Status: Pending
+
+diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+--- libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2012-06-14 14:51:50.452001745 -0500
+@@ -0,0 +1,134 @@
++/* Double-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float two108 = 3.245185536584267269e+32;
++static const float twom54 = 5.551115123125782702e-17;
++static const float half = 0.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the actual square root and half of its reciprocal
++   simultaneously.  */
++
++#ifdef __STDC__
++double
++__ieee754_sqrt (double b)
++#else
++double
++__ieee754_sqrt (b)
++     double b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++      double y, g, h, d, r;
++      ieee_double_shape_type u;
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          u.value = b;
++
++          relax_fenv_state ();
++
++          __asm__ ("frsqrte %[estimate], %[x]\n"
++                   : [estimate] "=f" (y) : [x] "f" (b));
++
++          /* Following Muller et al, page 168, equation 5.20.
++
++             h goes to 1/(2*sqrt(b))
++             g goes to sqrt(b).
++
++             We need three iterations to get within 1ulp.  */
++
++          /* Indicate that these can be performed prior to the branch.  GCC
++             insists on sinking them below the branch, however; it seems like
++             they'd be better before the branch so that we can cover any latency
++             from storing the argument and loading its high word.  Oh well.  */
++
++          g = b * y;
++          h = 0.5 * y;
++  
++          /* Handle small numbers by scaling.  */
++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
++            return __ieee754_sqrt (b * two108) * twom54;
++
++#define FMADD(a_, c_, b_)                                               \
++          ({ double __r;                                                \
++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++#define FNMSUB(a_, c_, b_)                                          \
++          ({ double __r;                                                \
++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
++
++          /* Final refinement.  */
++          d = FNMSUB (g, g, b);
++
++          fesetenv_register (fe);
++          return FMADD (d, h, g);
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_wash (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+--- libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2012-06-14 14:51:50.452001745 -0500
+@@ -0,0 +1,101 @@
++/* Single-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float threehalf = 1.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the reciprocal square root and use that to compute the actual
++   square root.  */
++
++#ifdef __STDC__
++float
++__ieee754_sqrtf (float b)
++#else
++float
++__ieee754_sqrtf (b)
++     float b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++#define FMSUB(a_, c_, b_)                                               \
++      ({ double __r;                                                    \
++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++#define FNMSUB(a_, c_, b_)                                              \
++      ({ double __r;                                                    \
++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          double y, x;
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          relax_fenv_state ();
++
++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
++          y = FMSUB (threehalf, b, b);
++
++          /* Initial estimate.  */
++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
++
++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++
++          /* All done.  */
++          fesetenv_register (fe);
++          return x * b;
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_washf (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+--- libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c	2012-06-14 14:55:14.749001061 -0500
+@@ -0,0 +1,134 @@
++/* Double-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float two108 = 3.245185536584267269e+32;
++static const float twom54 = 5.551115123125782702e-17;
++static const float half = 0.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the actual square root and half of its reciprocal
++   simultaneously.  */
++
++#ifdef __STDC__
++double
++__ieee754_sqrt (double b)
++#else
++double
++__ieee754_sqrt (b)
++     double b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++      double y, g, h, d, r;
++      ieee_double_shape_type u;
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          u.value = b;
++
++          relax_fenv_state ();
++
++          __asm__ ("frsqrte %[estimate], %[x]\n"
++                   : [estimate] "=f" (y) : [x] "f" (b));
++
++          /* Following Muller et al, page 168, equation 5.20.
++
++             h goes to 1/(2*sqrt(b))
++             g goes to sqrt(b).
++
++             We need three iterations to get within 1ulp.  */
++
++          /* Indicate that these can be performed prior to the branch.  GCC
++             insists on sinking them below the branch, however; it seems like
++             they'd be better before the branch so that we can cover any latency
++             from storing the argument and loading its high word.  Oh well.  */
++
++          g = b * y;
++          h = 0.5 * y;
++  
++          /* Handle small numbers by scaling.  */
++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
++            return __ieee754_sqrt (b * two108) * twom54;
++
++#define FMADD(a_, c_, b_)                                               \
++          ({ double __r;                                                \
++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++#define FNMSUB(a_, c_, b_)                                          \
++          ({ double __r;                                                \
++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
++
++          /* Final refinement.  */
++          d = FNMSUB (g, g, b);
++
++          fesetenv_register (fe);
++          return FMADD (d, h, g);
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_wash (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+--- libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c	2012-06-14 14:55:14.749001061 -0500
+@@ -0,0 +1,101 @@
++/* Single-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float threehalf = 1.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the reciprocal square root and use that to compute the actual
++   square root.  */
++
++#ifdef __STDC__
++float
++__ieee754_sqrtf (float b)
++#else
++float
++__ieee754_sqrtf (b)
++     float b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++#define FMSUB(a_, c_, b_)                                               \
++      ({ double __r;                                                    \
++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++#define FNMSUB(a_, c_, b_)                                              \
++      ({ double __r;                                                    \
++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          double y, x;
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          relax_fenv_state ();
++
++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
++          y = FMSUB (threehalf, b, b);
++
++          /* Initial estimate.  */
++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
++
++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++
++          /* All done.  */
++          fesetenv_register (fe);
++          return x * b;
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_washf (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+--- libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c	2012-06-14 14:55:21.812002270 -0500
+@@ -0,0 +1,134 @@
++/* Double-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float two108 = 3.245185536584267269e+32;
++static const float twom54 = 5.551115123125782702e-17;
++static const float half = 0.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the actual square root and half of its reciprocal
++   simultaneously.  */
++
++#ifdef __STDC__
++double
++__ieee754_sqrt (double b)
++#else
++double
++__ieee754_sqrt (b)
++     double b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++      double y, g, h, d, r;
++      ieee_double_shape_type u;
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          u.value = b;
++
++          relax_fenv_state ();
++
++          __asm__ ("frsqrte %[estimate], %[x]\n"
++                   : [estimate] "=f" (y) : [x] "f" (b));
++
++          /* Following Muller et al, page 168, equation 5.20.
++
++             h goes to 1/(2*sqrt(b))
++             g goes to sqrt(b).
++
++             We need three iterations to get within 1ulp.  */
++
++          /* Indicate that these can be performed prior to the branch.  GCC
++             insists on sinking them below the branch, however; it seems like
++             they'd be better before the branch so that we can cover any latency
++             from storing the argument and loading its high word.  Oh well.  */
++
++          g = b * y;
++          h = 0.5 * y;
++  
++          /* Handle small numbers by scaling.  */
++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
++            return __ieee754_sqrt (b * two108) * twom54;
++
++#define FMADD(a_, c_, b_)                                               \
++          ({ double __r;                                                \
++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++#define FNMSUB(a_, c_, b_)                                          \
++          ({ double __r;                                                \
++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
++
++          /* Final refinement.  */
++          d = FNMSUB (g, g, b);
++
++          fesetenv_register (fe);
++          return FMADD (d, h, g);
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_wash (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+--- libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c	2012-06-14 14:55:21.812002270 -0500
+@@ -0,0 +1,101 @@
++/* Single-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float threehalf = 1.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the reciprocal square root and use that to compute the actual
++   square root.  */
++
++#ifdef __STDC__
++float
++__ieee754_sqrtf (float b)
++#else
++float
++__ieee754_sqrtf (b)
++     float b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++#define FMSUB(a_, c_, b_)                                               \
++      ({ double __r;                                                    \
++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++#define FNMSUB(a_, c_, b_)                                              \
++      ({ double __r;                                                    \
++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          double y, x;
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          relax_fenv_state ();
++
++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
++          y = FMSUB (threehalf, b, b);
++
++          /* Initial estimate.  */
++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
++
++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++
++          /* All done.  */
++          fesetenv_register (fe);
++          return x * b;
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_washf (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+--- libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	2012-06-14 14:55:24.620001266 -0500
+@@ -0,0 +1,134 @@
++/* Double-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float two108 = 3.245185536584267269e+32;
++static const float twom54 = 5.551115123125782702e-17;
++static const float half = 0.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the actual square root and half of its reciprocal
++   simultaneously.  */
++
++#ifdef __STDC__
++double
++__ieee754_sqrt (double b)
++#else
++double
++__ieee754_sqrt (b)
++     double b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++      double y, g, h, d, r;
++      ieee_double_shape_type u;
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          u.value = b;
++
++          relax_fenv_state ();
++
++          __asm__ ("frsqrte %[estimate], %[x]\n"
++                   : [estimate] "=f" (y) : [x] "f" (b));
++
++          /* Following Muller et al, page 168, equation 5.20.
++
++             h goes to 1/(2*sqrt(b))
++             g goes to sqrt(b).
++
++             We need three iterations to get within 1ulp.  */
++
++          /* Indicate that these can be performed prior to the branch.  GCC
++             insists on sinking them below the branch, however; it seems like
++             they'd be better before the branch so that we can cover any latency
++             from storing the argument and loading its high word.  Oh well.  */
++
++          g = b * y;
++          h = 0.5 * y;
++  
++          /* Handle small numbers by scaling.  */
++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
++            return __ieee754_sqrt (b * two108) * twom54;
++
++#define FMADD(a_, c_, b_)                                               \
++          ({ double __r;                                                \
++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++#define FNMSUB(a_, c_, b_)                                          \
++          ({ double __r;                                                \
++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
++
++          /* Final refinement.  */
++          d = FNMSUB (g, g, b);
++
++          fesetenv_register (fe);
++          return FMADD (d, h, g);
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_wash (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+--- libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	2012-06-14 14:55:24.620001266 -0500
+@@ -0,0 +1,101 @@
++/* Single-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float threehalf = 1.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the reciprocal square root and use that to compute the actual
++   square root.  */
++
++#ifdef __STDC__
++float
++__ieee754_sqrtf (float b)
++#else
++float
++__ieee754_sqrtf (b)
++     float b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++#define FMSUB(a_, c_, b_)                                               \
++      ({ double __r;                                                    \
++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++#define FNMSUB(a_, c_, b_)                                              \
++      ({ double __r;                                                    \
++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          double y, x;
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          relax_fenv_state ();
++
++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
++          y = FMSUB (threehalf, b, b);
++
++          /* Initial estimate.  */
++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
++
++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++
++          /* All done.  */
++          fesetenv_register (fe);
++          return x * b;
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_washf (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+--- libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2012-06-14 14:51:50.452001745 -0500
+@@ -0,0 +1,134 @@
++/* Double-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float two108 = 3.245185536584267269e+32;
++static const float twom54 = 5.551115123125782702e-17;
++static const float half = 0.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the actual square root and half of its reciprocal
++   simultaneously.  */
++
++#ifdef __STDC__
++double
++__ieee754_sqrt (double b)
++#else
++double
++__ieee754_sqrt (b)
++     double b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++      double y, g, h, d, r;
++      ieee_double_shape_type u;
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          u.value = b;
++
++          relax_fenv_state ();
++
++          __asm__ ("frsqrte %[estimate], %[x]\n"
++                   : [estimate] "=f" (y) : [x] "f" (b));
++
++          /* Following Muller et al, page 168, equation 5.20.
++
++             h goes to 1/(2*sqrt(b))
++             g goes to sqrt(b).
++
++             We need three iterations to get within 1ulp.  */
++
++          /* Indicate that these can be performed prior to the branch.  GCC
++             insists on sinking them below the branch, however; it seems like
++             they'd be better before the branch so that we can cover any latency
++             from storing the argument and loading its high word.  Oh well.  */
++
++          g = b * y;
++          h = 0.5 * y;
++  
++          /* Handle small numbers by scaling.  */
++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
++            return __ieee754_sqrt (b * two108) * twom54;
++
++#define FMADD(a_, c_, b_)                                               \
++          ({ double __r;                                                \
++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++#define FNMSUB(a_, c_, b_)                                          \
++          ({ double __r;                                                \
++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
++
++          /* Final refinement.  */
++          d = FNMSUB (g, g, b);
++
++          fesetenv_register (fe);
++          return FMADD (d, h, g);
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_wash (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+--- libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2012-06-14 14:51:50.452001745 -0500
+@@ -0,0 +1,101 @@
++/* Single-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float threehalf = 1.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the reciprocal square root and use that to compute the actual
++   square root.  */
++
++#ifdef __STDC__
++float
++__ieee754_sqrtf (float b)
++#else
++float
++__ieee754_sqrtf (b)
++     float b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++#define FMSUB(a_, c_, b_)                                               \
++      ({ double __r;                                                    \
++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++#define FNMSUB(a_, c_, b_)                                              \
++      ({ double __r;                                                    \
++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          double y, x;
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          relax_fenv_state ();
++
++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
++          y = FMSUB (threehalf, b, b);
++
++          /* Initial estimate.  */
++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
++
++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++
++          /* All done.  */
++          fesetenv_register (fe);
++          return x * b;
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_washf (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+--- libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c	2012-06-14 14:56:02.080000985 -0500
+@@ -0,0 +1,134 @@
++/* Double-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float two108 = 3.245185536584267269e+32;
++static const float twom54 = 5.551115123125782702e-17;
++static const float half = 0.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the actual square root and half of its reciprocal
++   simultaneously.  */
++
++#ifdef __STDC__
++double
++__ieee754_sqrt (double b)
++#else
++double
++__ieee754_sqrt (b)
++     double b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++      double y, g, h, d, r;
++      ieee_double_shape_type u;
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          u.value = b;
++
++          relax_fenv_state ();
++
++          __asm__ ("frsqrte %[estimate], %[x]\n"
++                   : [estimate] "=f" (y) : [x] "f" (b));
++
++          /* Following Muller et al, page 168, equation 5.20.
++
++             h goes to 1/(2*sqrt(b))
++             g goes to sqrt(b).
++
++             We need three iterations to get within 1ulp.  */
++
++          /* Indicate that these can be performed prior to the branch.  GCC
++             insists on sinking them below the branch, however; it seems like
++             they'd be better before the branch so that we can cover any latency
++             from storing the argument and loading its high word.  Oh well.  */
++
++          g = b * y;
++          h = 0.5 * y;
++  
++          /* Handle small numbers by scaling.  */
++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
++            return __ieee754_sqrt (b * two108) * twom54;
++
++#define FMADD(a_, c_, b_)                                               \
++          ({ double __r;                                                \
++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++#define FNMSUB(a_, c_, b_)                                          \
++          ({ double __r;                                                \
++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
++
++          /* Final refinement.  */
++          d = FNMSUB (g, g, b);
++
++          fesetenv_register (fe);
++          return FMADD (d, h, g);
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_wash (b);
++}
+diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+--- libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c	2012-06-14 14:56:02.080000985 -0500
+@@ -0,0 +1,101 @@
++/* Single-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float threehalf = 1.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the reciprocal square root and use that to compute the actual
++   square root.  */
++
++#ifdef __STDC__
++float
++__ieee754_sqrtf (float b)
++#else
++float
++__ieee754_sqrtf (b)
++     float b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++#define FMSUB(a_, c_, b_)                                               \
++      ({ double __r;                                                    \
++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++#define FNMSUB(a_, c_, b_)                                              \
++      ({ double __r;                                                    \
++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          double y, x;
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          relax_fenv_state ();
++
++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
++          y = FMSUB (threehalf, b, b);
++
++          /* Initial estimate.  */
++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
++
++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++
++          /* All done.  */
++          fesetenv_register (fe);
++          return x * b;
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_washf (b);
++}
+diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
+--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies	2012-06-14 14:51:50.452001745 -0500
+@@ -0,0 +1 @@
++powerpc/powerpc32/603e/fpu
+diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
+--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies	2012-06-14 14:54:00.481000876 -0500
+@@ -0,0 +1 @@
++powerpc/powerpc32/e500mc/fpu
+diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
+--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies	2012-06-14 14:54:17.000001007 -0500
+@@ -0,0 +1 @@
++powerpc/powerpc32/e5500/fpu
+diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
+--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies	2012-06-14 14:54:31.054001299 -0500
+@@ -0,0 +1 @@
++powerpc/powerpc32/e6500/fpu
+diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
+--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies	2012-06-14 14:51:50.453001709 -0500
+@@ -0,0 +1 @@
++powerpc/powerpc64/e5500/fpu
+diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
+--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies	2012-06-14 14:58:14.298001288 -0500
+@@ -0,0 +1 @@
++powerpc/powerpc64/e6500/fpu
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch b/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
deleted file mode 100644
index 203040c..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
+++ /dev/null
@@ -1,538 +0,0 @@
-Upstream-Status: Pending
-
-2011-03-22  Joseph Myers  <joseph@codesourcery.com>
-
-        Merge from SG++ 2.11:
-
-        2010-10-05  Nathan Froyd  <froydnj@codesourcery.com>
-
-        Issue #9382
-
-        * sysdeps/powerpc/powerpc32/603e/: New directory.
-        * sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/: New directory.
-        * sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/: New directory.
-        * sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/: New directory.
-        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c: Update.
-        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c: Update.
-        * sysdeps/powerpc/powerpc64/e5500/fpu/Implies: New file.
-
-Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
-===================================================================
---- /dev/null
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
-@@ -0,0 +1,134 @@
-+/* Double-precision floating point square root.
-+   Copyright (C) 2010 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <math.h>
-+#include <math_private.h>
-+#include <fenv_libc.h>
-+#include <inttypes.h>
-+
-+#include <sysdep.h>
-+#include <ldsodefs.h>
-+
-+static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
-+static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
-+static const float two108 = 3.245185536584267269e+32;
-+static const float twom54 = 5.551115123125782702e-17;
-+static const float half = 0.5;
-+
-+/* The method is based on the descriptions in:
-+
-+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
-+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
-+
-+   We find the actual square root and half of its reciprocal
-+   simultaneously.  */
-+
-+#ifdef __STDC__
-+double
-+__ieee754_sqrt (double b)
-+#else
-+double
-+__ieee754_sqrt (b)
-+     double b;
-+#endif
-+{
-+  if (__builtin_expect (b > 0, 1))
-+    {
-+      double y, g, h, d, r;
-+      ieee_double_shape_type u;
-+
-+      if (__builtin_expect (b != a_inf.value, 1))
-+        {
-+          fenv_t fe;
-+
-+          fe = fegetenv_register ();
-+
-+          u.value = b;
-+
-+          relax_fenv_state ();
-+
-+          __asm__ ("frsqrte %[estimate], %[x]\n"
-+                   : [estimate] "=f" (y) : [x] "f" (b));
-+
-+          /* Following Muller et al, page 168, equation 5.20.
-+
-+             h goes to 1/(2*sqrt(b))
-+             g goes to sqrt(b).
-+
-+             We need three iterations to get within 1ulp.  */
-+
-+          /* Indicate that these can be performed prior to the branch.  GCC
-+             insists on sinking them below the branch, however; it seems like
-+             they'd be better before the branch so that we can cover any latency
-+             from storing the argument and loading its high word.  Oh well.  */
-+
-+          g = b * y;
-+          h = 0.5 * y;
-+  
-+          /* Handle small numbers by scaling.  */
-+          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
-+            return __ieee754_sqrt (b * two108) * twom54;
-+
-+#define FMADD(a_, c_, b_)                                               \
-+          ({ double __r;                                                \
-+          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
-+                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+          __r;})
-+#define FNMSUB(a_, c_, b_)                                          \
-+          ({ double __r;                                                \
-+          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
-+                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+          __r;})
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
-+
-+          /* Final refinement.  */
-+          d = FNMSUB (g, g, b);
-+
-+          fesetenv_register (fe);
-+          return FMADD (d, h, g);
-+        }
-+    }
-+  else if (b < 0)
-+    {
-+      /* For some reason, some PowerPC32 processors don't implement
-+         FE_INVALID_SQRT.  */
-+#ifdef FE_INVALID_SQRT
-+      feraiseexcept (FE_INVALID_SQRT);
-+
-+      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
-+#endif
-+	feraiseexcept (FE_INVALID);
-+      b = a_nan.value;
-+    }
-+  return f_wash (b);
-+}
-Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
-===================================================================
---- /dev/null
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
-@@ -0,0 +1,101 @@
-+/* Single-precision floating point square root.
-+   Copyright (C) 2010 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <math.h>
-+#include <math_private.h>
-+#include <fenv_libc.h>
-+#include <inttypes.h>
-+
-+#include <sysdep.h>
-+#include <ldsodefs.h>
-+
-+static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
-+static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
-+static const float threehalf = 1.5;
-+
-+/* The method is based on the descriptions in:
-+
-+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
-+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
-+
-+   We find the reciprocal square root and use that to compute the actual
-+   square root.  */
-+
-+#ifdef __STDC__
-+float
-+__ieee754_sqrtf (float b)
-+#else
-+float
-+__ieee754_sqrtf (b)
-+     float b;
-+#endif
-+{
-+  if (__builtin_expect (b > 0, 1))
-+    {
-+#define FMSUB(a_, c_, b_)                                               \
-+      ({ double __r;                                                    \
-+        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
-+                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+        __r;})
-+#define FNMSUB(a_, c_, b_)                                              \
-+      ({ double __r;                                                    \
-+        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
-+                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+        __r;})
-+
-+      if (__builtin_expect (b != a_inf.value, 1))
-+        {
-+          double y, x;
-+          fenv_t fe;
-+
-+          fe = fegetenv_register ();
-+
-+          relax_fenv_state ();
-+
-+          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
-+          y = FMSUB (threehalf, b, b);
-+
-+          /* Initial estimate.  */
-+          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
-+
-+          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
-+          x = x * FNMSUB (y, x * x, threehalf);
-+          x = x * FNMSUB (y, x * x, threehalf);
-+          x = x * FNMSUB (y, x * x, threehalf);
-+
-+          /* All done.  */
-+          fesetenv_register (fe);
-+          return x * b;
-+        }
-+    }
-+  else if (b < 0)
-+    {
-+      /* For some reason, some PowerPC32 processors don't implement
-+         FE_INVALID_SQRT.  */
-+#ifdef FE_INVALID_SQRT
-+      feraiseexcept (FE_INVALID_SQRT);
-+
-+      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
-+#endif
-+	feraiseexcept (FE_INVALID);
-+      b = a_nan.value;
-+    }
-+  return f_washf (b);
-+}
-Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
-===================================================================
---- /dev/null
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
-@@ -0,0 +1,134 @@
-+/* Double-precision floating point square root.
-+   Copyright (C) 2010 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <math.h>
-+#include <math_private.h>
-+#include <fenv_libc.h>
-+#include <inttypes.h>
-+
-+#include <sysdep.h>
-+#include <ldsodefs.h>
-+
-+static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
-+static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
-+static const float two108 = 3.245185536584267269e+32;
-+static const float twom54 = 5.551115123125782702e-17;
-+static const float half = 0.5;
-+
-+/* The method is based on the descriptions in:
-+
-+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
-+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
-+
-+   We find the actual square root and half of its reciprocal
-+   simultaneously.  */
-+
-+#ifdef __STDC__
-+double
-+__ieee754_sqrt (double b)
-+#else
-+double
-+__ieee754_sqrt (b)
-+     double b;
-+#endif
-+{
-+  if (__builtin_expect (b > 0, 1))
-+    {
-+      double y, g, h, d, r;
-+      ieee_double_shape_type u;
-+
-+      if (__builtin_expect (b != a_inf.value, 1))
-+        {
-+          fenv_t fe;
-+
-+          fe = fegetenv_register ();
-+
-+          u.value = b;
-+
-+          relax_fenv_state ();
-+
-+          __asm__ ("frsqrte %[estimate], %[x]\n"
-+                   : [estimate] "=f" (y) : [x] "f" (b));
-+
-+          /* Following Muller et al, page 168, equation 5.20.
-+
-+             h goes to 1/(2*sqrt(b))
-+             g goes to sqrt(b).
-+
-+             We need three iterations to get within 1ulp.  */
-+
-+          /* Indicate that these can be performed prior to the branch.  GCC
-+             insists on sinking them below the branch, however; it seems like
-+             they'd be better before the branch so that we can cover any latency
-+             from storing the argument and loading its high word.  Oh well.  */
-+
-+          g = b * y;
-+          h = 0.5 * y;
-+  
-+          /* Handle small numbers by scaling.  */
-+          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
-+            return __ieee754_sqrt (b * two108) * twom54;
-+
-+#define FMADD(a_, c_, b_)                                               \
-+          ({ double __r;                                                \
-+          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
-+                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+          __r;})
-+#define FNMSUB(a_, c_, b_)                                          \
-+          ({ double __r;                                                \
-+          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
-+                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+          __r;})
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          r = FNMSUB (g, h, half);
-+          g = FMADD (g, r, g);
-+          h = FMADD (h, r, h);
-+
-+          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
-+
-+          /* Final refinement.  */
-+          d = FNMSUB (g, g, b);
-+
-+          fesetenv_register (fe);
-+          return FMADD (d, h, g);
-+        }
-+    }
-+  else if (b < 0)
-+    {
-+      /* For some reason, some PowerPC32 processors don't implement
-+         FE_INVALID_SQRT.  */
-+#ifdef FE_INVALID_SQRT
-+      feraiseexcept (FE_INVALID_SQRT);
-+
-+      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
-+#endif
-+	feraiseexcept (FE_INVALID);
-+      b = a_nan.value;
-+    }
-+  return f_wash (b);
-+}
-Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
-===================================================================
---- /dev/null
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
-@@ -0,0 +1,101 @@
-+/* Single-precision floating point square root.
-+   Copyright (C) 2010 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <math.h>
-+#include <math_private.h>
-+#include <fenv_libc.h>
-+#include <inttypes.h>
-+
-+#include <sysdep.h>
-+#include <ldsodefs.h>
-+
-+static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
-+static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
-+static const float threehalf = 1.5;
-+
-+/* The method is based on the descriptions in:
-+
-+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
-+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
-+
-+   We find the reciprocal square root and use that to compute the actual
-+   square root.  */
-+
-+#ifdef __STDC__
-+float
-+__ieee754_sqrtf (float b)
-+#else
-+float
-+__ieee754_sqrtf (b)
-+     float b;
-+#endif
-+{
-+  if (__builtin_expect (b > 0, 1))
-+    {
-+#define FMSUB(a_, c_, b_)                                               \
-+      ({ double __r;                                                    \
-+        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
-+                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+        __r;})
-+#define FNMSUB(a_, c_, b_)                                              \
-+      ({ double __r;                                                    \
-+        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
-+                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
-+        __r;})
-+
-+      if (__builtin_expect (b != a_inf.value, 1))
-+        {
-+          double y, x;
-+          fenv_t fe;
-+
-+          fe = fegetenv_register ();
-+
-+          relax_fenv_state ();
-+
-+          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
-+          y = FMSUB (threehalf, b, b);
-+
-+          /* Initial estimate.  */
-+          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
-+
-+          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
-+          x = x * FNMSUB (y, x * x, threehalf);
-+          x = x * FNMSUB (y, x * x, threehalf);
-+          x = x * FNMSUB (y, x * x, threehalf);
-+
-+          /* All done.  */
-+          fesetenv_register (fe);
-+          return x * b;
-+        }
-+    }
-+  else if (b < 0)
-+    {
-+      /* For some reason, some PowerPC32 processors don't implement
-+         FE_INVALID_SQRT.  */
-+#ifdef FE_INVALID_SQRT
-+      feraiseexcept (FE_INVALID_SQRT);
-+
-+      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
-+#endif
-+	feraiseexcept (FE_INVALID);
-+      b = a_nan.value;
-+    }
-+  return f_washf (b);
-+}
-Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
-===================================================================
---- /dev/null
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
-@@ -0,0 +1 @@
-+powerpc/powerpc32/603e/fpu
-Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/fpu/Implies
-===================================================================
---- /dev/null
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/fpu/Implies
-@@ -0,0 +1 @@
-+powerpc/powerpc32/603e/fpu
-Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
-===================================================================
---- /dev/null
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
-@@ -0,0 +1 @@
-+powerpc/powerpc32/603e/fpu
-Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
-===================================================================
---- /dev/null
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
-@@ -0,0 +1 @@
-+powerpc/powerpc64/e5500/fpu
-Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
-===================================================================
---- /dev/null
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
-@@ -0,0 +1 @@
-+powerpc/powerpc32/603e/fpu
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 72d134a..c97a792 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "20393"
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r10"
+PR = "r11"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
@@ -13,7 +13,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://mips-rld-map-check.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
-           file://ppc-sqrt.patch \
+	   file://glibc.fix_sqrt2.patch \
            file://multilib_readlib.patch \
            file://use-sysroot-cxx-headers.patch \
            file://ppc-sqrt_finite.patch \
-- 
1.7.9.7




