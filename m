Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QozOq-0003jN-1y
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:59:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Aug 2011 07:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,317,1309762800"; d="scan'208";a="35382519"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2011 07:55:27 -0700
Message-ID: <4E3AB2DD.7010209@linux.intel.com>
Date: Thu, 04 Aug 2011 07:55:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312208782-14078-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312208782-14078-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] eglibc_2.13: Add support for handling sqrt &	sqrtf on powerpc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2011 14:59:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2011 07:26 AM, Kumar Gala wrote:
> Some of powerpc's dont support the fsqrt[s] instructions so we need an
> implementation of the library functions for those processors.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
>   2 files changed, 540 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch b/meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
> new file mode 100644
> index 0000000..203040c
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
> @@ -0,0 +1,538 @@
> +Upstream-Status: Pending
> +
> +2011-03-22  Joseph Myers<joseph@codesourcery.com>
> +
> +        Merge from SG++ 2.11:
> +
> +        2010-10-05  Nathan Froyd<froydnj@codesourcery.com>
> +
> +        Issue #9382
> +
> +        * sysdeps/powerpc/powerpc32/603e/: New directory.
> +        * sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/: New directory.
> +        * sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/: New directory.
> +        * sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/: New directory.
> +        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c: Update.
> +        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c: Update.
> +        * sysdeps/powerpc/powerpc64/e5500/fpu/Implies: New file.
> +
> +Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
> +===================================================================
> +--- /dev/null
> ++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
> +@@ -0,0 +1,134 @@
> ++/* Double-precision floating point square root.
> ++   Copyright (C) 2010 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, write to the Free
> ++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> ++   02111-1307 USA.  */
> ++
> ++#include<math.h>
> ++#include<math_private.h>
> ++#include<fenv_libc.h>
> ++#include<inttypes.h>
> ++
> ++#include<sysdep.h>
> ++#include<ldsodefs.h>
> ++
> ++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
> ++static const float two108 = 3.245185536584267269e+32;
> ++static const float twom54 = 5.551115123125782702e-17;
> ++static const float half = 0.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
> ++
> ++   We find the actual square root and half of its reciprocal
> ++   simultaneously.  */
> ++
> ++#ifdef __STDC__
> ++double
> ++__ieee754_sqrt (double b)
> ++#else
> ++double
> ++__ieee754_sqrt (b)
> ++     double b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b>  0, 1))
> ++    {
> ++      double y, g, h, d, r;
> ++      ieee_double_shape_type u;
> ++
> ++      if (__builtin_expect (b != a_inf.value, 1))
> ++        {
> ++          fenv_t fe;
> ++
> ++          fe = fegetenv_register ();
> ++
> ++          u.value = b;
> ++
> ++          relax_fenv_state ();
> ++
> ++          __asm__ ("frsqrte %[estimate], %[x]\n"
> ++                   : [estimate] "=f" (y) : [x] "f" (b));
> ++
> ++          /* Following Muller et al, page 168, equation 5.20.
> ++
> ++             h goes to 1/(2*sqrt(b))
> ++             g goes to sqrt(b).
> ++
> ++             We need three iterations to get within 1ulp.  */
> ++
> ++          /* Indicate that these can be performed prior to the branch.  GCC
> ++             insists on sinking them below the branch, however; it seems like
> ++             they'd be better before the branch so that we can cover any latency
> ++             from storing the argument and loading its high word.  Oh well.  */
> ++
> ++          g = b * y;
> ++          h = 0.5 * y;
> ++
> ++          /* Handle small numbers by scaling.  */
> ++          if (__builtin_expect ((u.parts.msw&  0x7ff00000)<= 0x02000000, 0))
> ++            return __ieee754_sqrt (b * two108) * twom54;
> ++
> ++#define FMADD(a_, c_, b_)                                               \
> ++          ({ double __r;                                                \
> ++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
> ++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++          __r;})
> ++#define FNMSUB(a_, c_, b_)                                          \
> ++          ({ double __r;                                                \
> ++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
> ++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++          __r;})
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
> ++
> ++          /* Final refinement.  */
> ++          d = FNMSUB (g, g, b);
> ++
> ++          fesetenv_register (fe);
> ++          return FMADD (d, h, g);
> ++        }
> ++    }
> ++  else if (b<  0)
> ++    {
> ++      /* For some reason, some PowerPC32 processors don't implement
> ++         FE_INVALID_SQRT.  */
> ++#ifdef FE_INVALID_SQRT
> ++      feraiseexcept (FE_INVALID_SQRT);
> ++
> ++      fenv_union_t u = { .fenv = fegetenv_register () };
> ++      if ((u.l[1]&  FE_INVALID) == 0)
> ++#endif
> ++	feraiseexcept (FE_INVALID);
> ++      b = a_nan.value;
> ++    }
> ++  return f_wash (b);
> ++}
> +Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
> +===================================================================
> +--- /dev/null
> ++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
> +@@ -0,0 +1,101 @@
> ++/* Single-precision floating point square root.
> ++   Copyright (C) 2010 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, write to the Free
> ++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> ++   02111-1307 USA.  */
> ++
> ++#include<math.h>
> ++#include<math_private.h>
> ++#include<fenv_libc.h>
> ++#include<inttypes.h>
> ++
> ++#include<sysdep.h>
> ++#include<ldsodefs.h>
> ++
> ++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
> ++static const float threehalf = 1.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
> ++
> ++   We find the reciprocal square root and use that to compute the actual
> ++   square root.  */
> ++
> ++#ifdef __STDC__
> ++float
> ++__ieee754_sqrtf (float b)
> ++#else
> ++float
> ++__ieee754_sqrtf (b)
> ++     float b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b>  0, 1))
> ++    {
> ++#define FMSUB(a_, c_, b_)                                               \
> ++      ({ double __r;                                                    \
> ++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
> ++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++        __r;})
> ++#define FNMSUB(a_, c_, b_)                                              \
> ++      ({ double __r;                                                    \
> ++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
> ++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++        __r;})
> ++
> ++      if (__builtin_expect (b != a_inf.value, 1))
> ++        {
> ++          double y, x;
> ++          fenv_t fe;
> ++
> ++          fe = fegetenv_register ();
> ++
> ++          relax_fenv_state ();
> ++
> ++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
> ++          y = FMSUB (threehalf, b, b);
> ++
> ++          /* Initial estimate.  */
> ++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
> ++
> ++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++
> ++          /* All done.  */
> ++          fesetenv_register (fe);
> ++          return x * b;
> ++        }
> ++    }
> ++  else if (b<  0)
> ++    {
> ++      /* For some reason, some PowerPC32 processors don't implement
> ++         FE_INVALID_SQRT.  */
> ++#ifdef FE_INVALID_SQRT
> ++      feraiseexcept (FE_INVALID_SQRT);
> ++
> ++      fenv_union_t u = { .fenv = fegetenv_register () };
> ++      if ((u.l[1]&  FE_INVALID) == 0)
> ++#endif
> ++	feraiseexcept (FE_INVALID);
> ++      b = a_nan.value;
> ++    }
> ++  return f_washf (b);
> ++}
> +Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
> +===================================================================
> +--- /dev/null
> ++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
> +@@ -0,0 +1,134 @@
> ++/* Double-precision floating point square root.
> ++   Copyright (C) 2010 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, write to the Free
> ++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> ++   02111-1307 USA.  */
> ++
> ++#include<math.h>
> ++#include<math_private.h>
> ++#include<fenv_libc.h>
> ++#include<inttypes.h>
> ++
> ++#include<sysdep.h>
> ++#include<ldsodefs.h>
> ++
> ++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
> ++static const float two108 = 3.245185536584267269e+32;
> ++static const float twom54 = 5.551115123125782702e-17;
> ++static const float half = 0.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
> ++
> ++   We find the actual square root and half of its reciprocal
> ++   simultaneously.  */
> ++
> ++#ifdef __STDC__
> ++double
> ++__ieee754_sqrt (double b)
> ++#else
> ++double
> ++__ieee754_sqrt (b)
> ++     double b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b>  0, 1))
> ++    {
> ++      double y, g, h, d, r;
> ++      ieee_double_shape_type u;
> ++
> ++      if (__builtin_expect (b != a_inf.value, 1))
> ++        {
> ++          fenv_t fe;
> ++
> ++          fe = fegetenv_register ();
> ++
> ++          u.value = b;
> ++
> ++          relax_fenv_state ();
> ++
> ++          __asm__ ("frsqrte %[estimate], %[x]\n"
> ++                   : [estimate] "=f" (y) : [x] "f" (b));
> ++
> ++          /* Following Muller et al, page 168, equation 5.20.
> ++
> ++             h goes to 1/(2*sqrt(b))
> ++             g goes to sqrt(b).
> ++
> ++             We need three iterations to get within 1ulp.  */
> ++
> ++          /* Indicate that these can be performed prior to the branch.  GCC
> ++             insists on sinking them below the branch, however; it seems like
> ++             they'd be better before the branch so that we can cover any latency
> ++             from storing the argument and loading its high word.  Oh well.  */
> ++
> ++          g = b * y;
> ++          h = 0.5 * y;
> ++
> ++          /* Handle small numbers by scaling.  */
> ++          if (__builtin_expect ((u.parts.msw&  0x7ff00000)<= 0x02000000, 0))
> ++            return __ieee754_sqrt (b * two108) * twom54;
> ++
> ++#define FMADD(a_, c_, b_)                                               \
> ++          ({ double __r;                                                \
> ++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
> ++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++          __r;})
> ++#define FNMSUB(a_, c_, b_)                                          \
> ++          ({ double __r;                                                \
> ++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
> ++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++          __r;})
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
> ++
> ++          /* Final refinement.  */
> ++          d = FNMSUB (g, g, b);
> ++
> ++          fesetenv_register (fe);
> ++          return FMADD (d, h, g);
> ++        }
> ++    }
> ++  else if (b<  0)
> ++    {
> ++      /* For some reason, some PowerPC32 processors don't implement
> ++         FE_INVALID_SQRT.  */
> ++#ifdef FE_INVALID_SQRT
> ++      feraiseexcept (FE_INVALID_SQRT);
> ++
> ++      fenv_union_t u = { .fenv = fegetenv_register () };
> ++      if ((u.l[1]&  FE_INVALID) == 0)
> ++#endif
> ++	feraiseexcept (FE_INVALID);
> ++      b = a_nan.value;
> ++    }
> ++  return f_wash (b);
> ++}
> +Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
> +===================================================================
> +--- /dev/null
> ++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
> +@@ -0,0 +1,101 @@
> ++/* Single-precision floating point square root.
> ++   Copyright (C) 2010 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, write to the Free
> ++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> ++   02111-1307 USA.  */
> ++
> ++#include<math.h>
> ++#include<math_private.h>
> ++#include<fenv_libc.h>
> ++#include<inttypes.h>
> ++
> ++#include<sysdep.h>
> ++#include<ldsodefs.h>
> ++
> ++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
> ++static const float threehalf = 1.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
> ++
> ++   We find the reciprocal square root and use that to compute the actual
> ++   square root.  */
> ++
> ++#ifdef __STDC__
> ++float
> ++__ieee754_sqrtf (float b)
> ++#else
> ++float
> ++__ieee754_sqrtf (b)
> ++     float b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b>  0, 1))
> ++    {
> ++#define FMSUB(a_, c_, b_)                                               \
> ++      ({ double __r;                                                    \
> ++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
> ++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++        __r;})
> ++#define FNMSUB(a_, c_, b_)                                              \
> ++      ({ double __r;                                                    \
> ++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
> ++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++        __r;})
> ++
> ++      if (__builtin_expect (b != a_inf.value, 1))
> ++        {
> ++          double y, x;
> ++          fenv_t fe;
> ++
> ++          fe = fegetenv_register ();
> ++
> ++          relax_fenv_state ();
> ++
> ++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
> ++          y = FMSUB (threehalf, b, b);
> ++
> ++          /* Initial estimate.  */
> ++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
> ++
> ++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++
> ++          /* All done.  */
> ++          fesetenv_register (fe);
> ++          return x * b;
> ++        }
> ++    }
> ++  else if (b<  0)
> ++    {
> ++      /* For some reason, some PowerPC32 processors don't implement
> ++         FE_INVALID_SQRT.  */
> ++#ifdef FE_INVALID_SQRT
> ++      feraiseexcept (FE_INVALID_SQRT);
> ++
> ++      fenv_union_t u = { .fenv = fegetenv_register () };
> ++      if ((u.l[1]&  FE_INVALID) == 0)
> ++#endif
> ++	feraiseexcept (FE_INVALID);
> ++      b = a_nan.value;
> ++    }
> ++  return f_washf (b);
> ++}
> +Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
> +===================================================================
> +--- /dev/null
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
> +@@ -0,0 +1 @@
> ++powerpc/powerpc32/603e/fpu
> +Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/fpu/Implies
> +===================================================================
> +--- /dev/null
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/fpu/Implies
> +@@ -0,0 +1 @@
> ++powerpc/powerpc32/603e/fpu
> +Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
> +===================================================================
> +--- /dev/null
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
> +@@ -0,0 +1 @@
> ++powerpc/powerpc32/603e/fpu
> +Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
> +===================================================================
> +--- /dev/null
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
> +@@ -0,0 +1 @@
> ++powerpc/powerpc64/e5500/fpu
> +Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
> +===================================================================
> +--- /dev/null
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
> +@@ -0,0 +1 @@
> ++powerpc/powerpc32/603e/fpu
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
> index 41fe7c7..772c01f 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>   SRCREV = "14157"
>
>   DEPENDS += "gperf-native"
> -PR = "r9"
> +PR = "r10"
>   PR_append = "+svnr${SRCPV}"
>
>   EGLIBC_BRANCH="eglibc-2_13"
> @@ -16,6 +16,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
>              file://etc/ld.so.conf \
>              file://generate-supported.mk \
>              file://glibc_bug_fix_12454.patch \
> +           file://ppc-sqrt.patch \
>   	   "
>   LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
>         file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \

Merged into OE-Core with a fix from RP for the CR/LF issue

Thanks

Sau!


