Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA177BD64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 23:44:40 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id n12so4236785qkh.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 15:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=URWijUKEAMMIn8A9SqKn6igrFLfwf/CvtFiTPBXQbtk=;
	b=PAv0e0qqzmjKf+p6t4a2LsU1BWRUwa/Q4FqjCP9kqSJjGBLgrGlJs4ojj1NJ0lLAq2
	w5im3n0EqsCrfzhvpcasHiZaagEsuPboN2hIOq44bGBM32CqaCuwgPWeg/pkdimSsiJ1
	sPrGFGvP5jWovYEkVyxx8T+yQfefyp/f51YuojOymkW8X+im6f/Ki51EuyhzZE+KqyY5
	RXfgRrZ1sTcQXddCqmeR4G8kZ4pTHIBqR5aAl7Qpk49hqdUKWsYHLOSA24Ph1bHPlSLv
	Ml1dITxFTfNWY70CB3lhlTQrlxdKsAoFftRB5qFDFT1lVwxAwJSo6r51yVDhDvqzZJIP
	ALGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=URWijUKEAMMIn8A9SqKn6igrFLfwf/CvtFiTPBXQbtk=;
	b=I9epzoy+WDUyXGzB33+/rSpfWP24cbkh2gkRTMUgnNNYPnXbdT+ltEkDtRhwa7sZxF
	upmM5MZ9vB+os22uH5ikSdnO32K8gYecaHk+/5kObvmgNtwKPMmCP54pr7nDot/O6qOY
	8DQ6+oFKb6WQxFUaJgQUjQakCw1EL7ub0FOXVefY+IyjaoucbkLiByHZWqofNVfw3WkT
	Nnp5E32H/h2DxA/z/YadEl4mEbgBxB/1+jHvPR686ksW42Bw7iGRU4Bbhx4Kj1V3Wt/c
	370pMp0vkrLNmel2nTxCYN/QQYIuubNd8M4HUX17fVWWt+2n0c05Rltip8zaFg2Hj5dd
	HQzg==
X-Gm-Message-State: AA+aEWZ5HkgdBIqBfM4LBnGpycZLvHl5Kr6x3fTCYMGNvqrElohVdTFt
	dMR9OVgrgmpNioL+fxHOi2yT6k/U0x5L+eU9d+M=
X-Google-Smtp-Source: AFSGD/UmjZH8CwIDaTdWlycQ5B+jwqtQZ83X9rZl8+ky9CI0QPHeJbtZcgNpcoH0Jw6td/EgJ2NnGiVG9JyXvQLDPFw=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr4540702qka.206.1544831080639; 
	Fri, 14 Dec 2018 15:44:40 -0800 (PST)
MIME-Version: 1.0
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-12-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1544810082-22164-12-git-send-email-serhe.popovych@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Dec 2018 15:44:14 -0800
Message-ID: <CAMKF1spen8XMTfanhaHX6FybWC5hHjgr6ndH316dQoGpqozEtA@mail.gmail.com>
To: Serhey Popovych <serhe.popovych@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/13] gcc: More places to patch to disable ldbl 128 for musl on PPC
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
X-List-Received-Date: Fri, 14 Dec 2018 23:44:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 14, 2018 at 9:58 AM Serhey Popovych
<serhe.popovych@gmail.com> wrote:
>
> There are four functions using TFmode type (128bit) that isn't
> available when building with musl. Move each of them from common
> ppc64-fp.c to individual files referenced from t-float128 that used
> when ldbl 128 enabled at configure time.
>
> For gcc-7.3 if -mfloat128 is given -mfloat128-type must be given too.
>
> Exclude ibm-ldouble.c when ldbl 128 isn't enabled at config time.
>
> Build and boot tested with musl (no float128) and glibc (float128
> and ibm128 on PowerPC64).
>

We should be dropping gcc 7 support in master for next release. Gcc 8 one is ok
probably worth submitting it to gcc upstream as well.

> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> ---
>  ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 391 ++++++++++++++++++++-
>  ...34-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 342 +++++++++++++++++-
>  2 files changed, 731 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> index e39af9b..f4dd891 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> +++ b/meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> @@ -36,14 +36,385 @@ diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-linux
>  index 4f6d4c4a4d2..c50dd94a2da 100644
>  --- a/libgcc/config/rs6000/t-linux
>  +++ b/libgcc/config/rs6000/t-linux
> -@@ -1,3 +1,6 @@
> +@@ -1,3 +1,9 @@
>   SHLIB_MAPFILES += $(srcdir)/config/rs6000/libgcc-glibc.ver
>
>  -HOST_LIBGCC2_CFLAGS += -mlong-double-128 -mno-minimal-toc
>  +ifeq ($(with_ldbl128),yes)
>  +HOST_LIBGCC2_CFLAGS += -mlong-double-128
> ++else
> ++# We do not want to build ibm-ldouble.c.
> ++LIB2ADD := $(filter-out %ibm-ldouble.c, $(LIB2ADD))
>  +endif
>  +HOST_LIBGCC2_CFLAGS += -mno-minimal-toc
> +diff --git a/libgcc/config/rs6000/fixtfdi.c b/libgcc/config/rs6000/fixtfdi.c
> +new file mode 100644
> +index 0000000..9b979d0
> +--- /dev/null
> ++++ b/libgcc/config/rs6000/fixtfdi.c
> +@@ -0,0 +1,42 @@
> ++/* Software floating-point emulation.
> ++   Convert a to 64bit signed integer
> ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++   Contributed by Richard Henderson (rth@cygnus.com) and
> ++                Jakub Jelinek (jj@ultra.linux.cz).
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   In addition to the permissions in the GNU Lesser General Public
> ++   License, the Free Software Foundation gives you unlimited
> ++   permission to link the compiled version of this file into
> ++   combinations with other programs, and to distribute those
> ++   combinations without any restriction coming from the use of this
> ++   file.  (The Lesser General Public License restrictions do apply in
> ++   other respects; for example, they cover modification of the file,
> ++   and distribution when not linked into a combine executable.)
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifdef _ARCH_PPC64
> ++#include "soft-fp.h"
> ++#include "quad-float128.h"
> ++
> ++DItype
> ++__fixtfdi (TFtype a)
> ++{
> ++  if (a < 0)
> ++    return - __fixunstfdi (-a);
> ++  return __fixunstfdi (a);
> ++}
> ++#endif
> +diff --git a/libgcc/config/rs6000/fixunstfdi.c b/libgcc/config/rs6000/fixunstfdi.c
> +new file mode 100644
> +index 0000000..65e9590
> +--- /dev/null
> ++++ b/libgcc/config/rs6000/fixunstfdi.c
> +@@ -0,0 +1,58 @@
> ++/* Software floating-point emulation.
> ++   Convert a to 64bit unsigned integer
> ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++   Contributed by Richard Henderson (rth@cygnus.com) and
> ++                Jakub Jelinek (jj@ultra.linux.cz).
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   In addition to the permissions in the GNU Lesser General Public
> ++   License, the Free Software Foundation gives you unlimited
> ++   permission to link the compiled version of this file into
> ++   combinations with other programs, and to distribute those
> ++   combinations without any restriction coming from the use of this
> ++   file.  (The Lesser General Public License restrictions do apply in
> ++   other respects; for example, they cover modification of the file,
> ++   and distribution when not linked into a combine executable.)
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifdef _ARCH_PPC64
> ++#include "soft-fp.h"
> ++#include "quad-float128.h"
> ++
> ++DItype
> ++__fixunstfdi (TFtype a)
> ++{
> ++  if (a < 0)
> ++    return 0;
> ++
> ++  /* Compute high word of result, as a flonum.  */
> ++  const TFtype b = (a / (((UDItype) 1) << (sizeof (SItype) * 8)));
> ++  /* Convert that to fixed (but not to DItype!),
> ++     and shift it into the high word.  */
> ++  UDItype v = (USItype) b;
> ++  v <<= (sizeof (SItype) * 8);
> ++  /* Remove high part from the TFtype, leaving the low part as flonum.  */
> ++  a -= (TFtype) v;
> ++  /* Convert that to fixed (but not to DItype!) and add it in.
> ++     Sometimes A comes out negative.  This is significant, since
> ++     A has more bits than a long int does.  */
> ++  if (a < 0)
> ++    v -= (USItype) (-a);
> ++  else
> ++    v += (USItype) a;
> ++  return v;
> ++}
> ++#endif
> +diff --git a/libgcc/config/rs6000/floatditf.c b/libgcc/config/rs6000/floatditf.c
> +new file mode 100644
> +index 0000000..20ad4c6
> +--- /dev/null
> ++++ b/libgcc/config/rs6000/floatditf.c
> +@@ -0,0 +1,47 @@
> ++/* Software floating-point emulation.
> ++   Convert a 64bit signed integer to IEEE quad
> ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++   Contributed by Richard Henderson (rth@cygnus.com) and
> ++                Jakub Jelinek (jj@ultra.linux.cz).
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   In addition to the permissions in the GNU Lesser General Public
> ++   License, the Free Software Foundation gives you unlimited
> ++   permission to link the compiled version of this file into
> ++   combinations with other programs, and to distribute those
> ++   combinations without any restriction coming from the use of this
> ++   file.  (The Lesser General Public License restrictions do apply in
> ++   other respects; for example, they cover modification of the file,
> ++   and distribution when not linked into a combine executable.)
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifdef _ARCH_PPC64
> ++#include "soft-fp.h"
> ++#include "double.h"
> ++#include "quad-float128.h"
> ++
> ++TFtype
> ++__floatditf (DItype u)
> ++{
> ++  DFtype dh, dl;
> ++
> ++  dh = (SItype) (u >> (sizeof (SItype) * 8));
> ++  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> ++  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
> ++
> ++  return (TFtype) dh + (TFtype) dl;
> ++}
> ++#endif
> +diff --git a/libgcc/config/rs6000/floatunditf.c b/libgcc/config/rs6000/floatunditf.c
> +new file mode 100644
> +index 0000000..23dbde2
> +--- /dev/null
> ++++ b/libgcc/config/rs6000/floatunditf.c
> +@@ -0,0 +1,47 @@
> ++/* Software floating-point emulation.
> ++   Convert a 64bit unsigned integer to IEEE quad
> ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++   Contributed by Richard Henderson (rth@cygnus.com) and
> ++                Jakub Jelinek (jj@ultra.linux.cz).
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   In addition to the permissions in the GNU Lesser General Public
> ++   License, the Free Software Foundation gives you unlimited
> ++   permission to link the compiled version of this file into
> ++   combinations with other programs, and to distribute those
> ++   combinations without any restriction coming from the use of this
> ++   file.  (The Lesser General Public License restrictions do apply in
> ++   other respects; for example, they cover modification of the file,
> ++   and distribution when not linked into a combine executable.)
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifdef _ARCH_PPC64
> ++#include "soft-fp.h"
> ++#include "double.h"
> ++#include "quad-float128.h"
> ++
> ++TFtype
> ++__floatunditf (UDItype u)
> ++{
> ++  DFtype dh, dl;
> ++
> ++  dh = (USItype) (u >> (sizeof (SItype) * 8));
> ++  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> ++  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
> ++
> ++  return (TFtype) dh + (TFtype) dl;
> ++}
> ++#endif
> +diff --git a/libgcc/config/rs6000/ppc64-fp.c b/libgcc/config/rs6000/ppc64-fp.c
> +index 5e1cbdd..70ad3c9 100644
> +--- a/libgcc/config/rs6000/ppc64-fp.c
> ++++ b/libgcc/config/rs6000/ppc64-fp.c
> +@@ -25,33 +25,20 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> + <http://www.gnu.org/licenses/>.  */
> +
> + #if defined(__powerpc64__) || defined (__64BIT__) || defined(__ppc64__)
> +-#define TMODES
> + #include "fp-bit.h"
> +
> +-extern DItype __fixtfdi (TFtype);
> + extern DItype __fixdfdi (DFtype);
> + extern DItype __fixsfdi (SFtype);
> + extern USItype __fixunsdfsi (DFtype);
> + extern USItype __fixunssfsi (SFtype);
> +-extern TFtype __floatditf (DItype);
> +-extern TFtype __floatunditf (UDItype);
> + extern DFtype __floatdidf (DItype);
> + extern DFtype __floatundidf (UDItype);
> + extern SFtype __floatdisf (DItype);
> + extern SFtype __floatundisf (UDItype);
> +-extern DItype __fixunstfdi (TFtype);
> +
> + static DItype local_fixunssfdi (SFtype);
> + static DItype local_fixunsdfdi (DFtype);
> +
> +-DItype
> +-__fixtfdi (TFtype a)
> +-{
> +-  if (a < 0)
> +-    return - __fixunstfdi (-a);
> +-  return __fixunstfdi (a);
> +-}
> +-
> + DItype
> + __fixdfdi (DFtype a)
> + {
> +@@ -86,30 +73,6 @@ __fixunssfsi (SFtype a)
> +   return (SItype) a;
> + }
> +
> +-TFtype
> +-__floatditf (DItype u)
> +-{
> +-  DFtype dh, dl;
> +-
> +-  dh = (SItype) (u >> (sizeof (SItype) * 8));
> +-  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> +-  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
> +-
> +-  return (TFtype) dh + (TFtype) dl;
> +-}
> +-
> +-TFtype
> +-__floatunditf (UDItype u)
> +-{
> +-  DFtype dh, dl;
> +-
> +-  dh = (USItype) (u >> (sizeof (SItype) * 8));
> +-  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> +-  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
> +-
> +-  return (TFtype) dh + (TFtype) dl;
> +-}
> +-
> + DFtype
> + __floatdidf (DItype u)
> + {
> +@@ -183,30 +146,6 @@ __floatundisf (UDItype u)
> +   return (SFtype) f;
> + }
> +
> +-DItype
> +-__fixunstfdi (TFtype a)
> +-{
> +-  if (a < 0)
> +-    return 0;
> +-
> +-  /* Compute high word of result, as a flonum.  */
> +-  const TFtype b = (a / (((UDItype) 1) << (sizeof (SItype) * 8)));
> +-  /* Convert that to fixed (but not to DItype!),
> +-     and shift it into the high word.  */
> +-  UDItype v = (USItype) b;
> +-  v <<= (sizeof (SItype) * 8);
> +-  /* Remove high part from the TFtype, leaving the low part as flonum.  */
> +-  a -= (TFtype) v;
> +-  /* Convert that to fixed (but not to DItype!) and add it in.
> +-     Sometimes A comes out negative.  This is significant, since
> +-     A has more bits than a long int does.  */
> +-  if (a < 0)
> +-    v -= (USItype) (-a);
> +-  else
> +-    v += (USItype) a;
> +-  return v;
> +-}
> +-
> + /* This version is needed to prevent recursion; fixunsdfdi in libgcc
> +    calls fixdfdi, which in turn calls calls fixunsdfdi.  */
> +
> +diff --git a/libgcc/config/rs6000/quad-float128.h b/libgcc/config/rs6000/quad-float128.h
> +index 7d69c87..a0c2664 100644
> +--- a/libgcc/config/rs6000/quad-float128.h
> ++++ b/libgcc/config/rs6000/quad-float128.h
> +@@ -99,6 +99,11 @@ extern TItype_ppc __fixkfti (TFtype);
> + extern UTItype_ppc __fixunskfti (TFtype);
> + extern TFtype __floattikf (TItype_ppc);
> + extern TFtype __floatuntikf (UTItype_ppc);
> ++
> ++extern DItype_ppc __fixtfdi (TFtype);
> ++extern DItype_ppc __fixunstfdi (TFtype);
> ++extern TFtype __floatditf (DItype_ppc);
> ++extern TFtype __floatunditf (UDItype_ppc);
> + #endif
> +
> + /* Functions using the ISA 3.0 hardware support.  If the code is compiled with
> +diff --git a/libgcc/config/rs6000/t-float128 b/libgcc/config/rs6000/t-float128
> +index 2c52ca6..3a241aa 100644
> +--- a/libgcc/config/rs6000/t-float128
> ++++ b/libgcc/config/rs6000/t-float128
> +@@ -24,6 +24,7 @@ fp128_softfp_obj     = $(fp128_softfp_static_obj) $(fp128_softfp_shared_obj)
> +
> + # New functions for software emulation
> + fp128_ppc_funcs               = floattikf floatuntikf fixkfti fixunskfti \
> ++                        floatditf floatunditf fixtfdi fixunstfdi \
> +                         extendkftf2-sw trunctfkf2-sw \
> +                         sfp-exceptions _mulkc3 _divkc3
> +
> +@@ -58,7 +59,7 @@ fp128_includes               = $(srcdir)/soft-fp/double.h \
> +                         $(srcdir)/soft-fp/soft-fp.h
> +
> + # Build the emulator without ISA 3.0 hardware support.
> +-FP128_CFLAGS_SW                = -Wno-type-limits -mvsx -mfloat128 \
> ++FP128_CFLAGS_SW                = -Wno-type-limits -mvsx -mfloat128 -mfloat128-type \
> +                          -mno-float128-hardware \
> +                          -I$(srcdir)/soft-fp \
> +                          -I$(srcdir)/config/rs6000 \
> +diff --git a/libgcc/config/rs6000/t-float128-hw b/libgcc/config/rs6000/t-float128-hw
> +index 161062f..0476874 100644
> +--- a/libgcc/config/rs6000/t-float128-hw
> ++++ b/libgcc/config/rs6000/t-float128-hw
> +@@ -21,7 +21,7 @@ fp128_ifunc_obj              = $(fp128_ifunc_static_obj) $(fp128_ifunc_shared_obj)
> + fp128_sed_hw          = -hw
> +
> + # Build the hardware support functions with appropriate hardware support
> +-FP128_CFLAGS_HW                = -Wno-type-limits -mvsx -mfloat128 \
> ++FP128_CFLAGS_HW                = -Wno-type-limits -mvsx -mfloat128 -mfloat128-type \
> +                          -mpower8-vector -mpower9-vector \
> +                          -mfloat128-hardware \
> +                          -I$(srcdir)/soft-fp \
>  diff --git a/libgcc/configure b/libgcc/configure
>  old mode 100644
>  new mode 100755
> @@ -96,6 +467,15 @@ index 45c459788c3..e2d19b144b8
>   # Check whether --with-aix-soname was given.
>   if test "${with_aix_soname+set}" = set; then :
>     withval=$with_aix_soname; case "${host}:${enable_shared}" in
> +@@ -4999,7 +4999,7 @@ case ${host} in
> + # for hardware support.
> + powerpc*-*-linux*)
> +   saved_CFLAGS="$CFLAGS"
> +-  CFLAGS="$CFLAGS -mabi=altivec -mvsx -mfloat128"
> ++  CFLAGS="$CFLAGS -mabi=altivec -mvsx -mfloat128 -mfloat128-type"
> +   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for PowerPC ISA 2.06 to build __float128 libraries" >&5
> + $as_echo_n "checking for PowerPC ISA 2.06 to build __float128 libraries... " >&6; }
> + if test "${libgcc_cv_powerpc_float128+set}" = set; then :
>  diff --git a/libgcc/configure.ac b/libgcc/configure.ac
>  index af151473709..dada52416da 100644
>  --- a/libgcc/configure.ac
> @@ -119,6 +499,15 @@ index af151473709..dada52416da 100644
>   AC_ARG_WITH(aix-soname,
>   [AS_HELP_STRING([--with-aix-soname=aix|svr4|both],
>       [shared library versioning (aka "SONAME") variant to provide on AIX])],
> +@@ -394,7 +394,7 @@ case ${host} in
> + # for hardware support.
> + powerpc*-*-linux*)
> +   saved_CFLAGS="$CFLAGS"
> +-  CFLAGS="$CFLAGS -mabi=altivec -mvsx -mfloat128"
> ++  CFLAGS="$CFLAGS -mabi=altivec -mvsx -mfloat128 -mfloat128-type"
> +   AC_CACHE_CHECK([for PowerPC ISA 2.06 to build __float128 libraries],
> +                [libgcc_cv_powerpc_float128],
> +                [AC_COMPILE_IFELSE(
>  --
>  2.12.2
>
> diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> index 7a69ea2..391cda7 100644
> --- a/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> +++ b/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> @@ -37,14 +37,354 @@ diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-linux
>  index 4f6d4c4a4d2..c50dd94a2da 100644
>  --- a/libgcc/config/rs6000/t-linux
>  +++ b/libgcc/config/rs6000/t-linux
> -@@ -1,3 +1,6 @@
> +@@ -1,3 +1,9 @@
>   SHLIB_MAPFILES += $(srcdir)/config/rs6000/libgcc-glibc.ver
>
>  -HOST_LIBGCC2_CFLAGS += -mlong-double-128 -mno-minimal-toc
>  +ifeq ($(with_ldbl128),yes)
>  +HOST_LIBGCC2_CFLAGS += -mlong-double-128
> ++else
> ++# We do not want to build ibm-ldouble.c.
> ++LIB2ADD := $(filter-out %ibm-ldouble.c, $(LIB2ADD))
>  +endif
>  +HOST_LIBGCC2_CFLAGS += -mno-minimal-toc
> +diff --git a/libgcc/config/rs6000/fixtfdi.c b/libgcc/config/rs6000/fixtfdi.c
> +--- a/libgcc/config/rs6000/fixtfdi.c   1969-12-31 19:00:00.000000000 -0500
> ++++ b/libgcc/config/rs6000/fixtfdi.c   2018-12-12 17:54:50.110755540 -0500
> +@@ -0,0 +1,42 @@
> ++/* Software floating-point emulation.
> ++   Convert a to 64bit signed integer
> ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++   Contributed by Richard Henderson (rth@cygnus.com) and
> ++                Jakub Jelinek (jj@ultra.linux.cz).
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   In addition to the permissions in the GNU Lesser General Public
> ++   License, the Free Software Foundation gives you unlimited
> ++   permission to link the compiled version of this file into
> ++   combinations with other programs, and to distribute those
> ++   combinations without any restriction coming from the use of this
> ++   file.  (The Lesser General Public License restrictions do apply in
> ++   other respects; for example, they cover modification of the file,
> ++   and distribution when not linked into a combine executable.)
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifdef _ARCH_PPC64
> ++#include "soft-fp.h"
> ++#include "quad-float128.h"
> ++
> ++DItype
> ++__fixtfdi (TFtype a)
> ++{
> ++  if (a < 0)
> ++    return - __fixunstfdi (-a);
> ++  return __fixunstfdi (a);
> ++}
> ++#endif
> +diff --git a/libgcc/config/rs6000/fixunstfdi.c b/libgcc/config/rs6000/fixunstfdi.c
> +--- a/libgcc/config/rs6000/fixunstfdi.c        1969-12-31 19:00:00.000000000 -0500
> ++++ b/libgcc/config/rs6000/fixunstfdi.c        2018-12-12 17:56:06.141654537 -0500
> +@@ -0,0 +1,58 @@
> ++/* Software floating-point emulation.
> ++   Convert a to 64bit unsigned integer
> ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++   Contributed by Richard Henderson (rth@cygnus.com) and
> ++                Jakub Jelinek (jj@ultra.linux.cz).
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   In addition to the permissions in the GNU Lesser General Public
> ++   License, the Free Software Foundation gives you unlimited
> ++   permission to link the compiled version of this file into
> ++   combinations with other programs, and to distribute those
> ++   combinations without any restriction coming from the use of this
> ++   file.  (The Lesser General Public License restrictions do apply in
> ++   other respects; for example, they cover modification of the file,
> ++   and distribution when not linked into a combine executable.)
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifdef _ARCH_PPC64
> ++#include "soft-fp.h"
> ++#include "quad-float128.h"
> ++
> ++DItype
> ++__fixunstfdi (TFtype a)
> ++{
> ++  if (a < 0)
> ++    return 0;
> ++
> ++  /* Compute high word of result, as a flonum.  */
> ++  const TFtype b = (a / (((UDItype) 1) << (sizeof (SItype) * 8)));
> ++  /* Convert that to fixed (but not to DItype!),
> ++     and shift it into the high word.  */
> ++  UDItype v = (USItype) b;
> ++  v <<= (sizeof (SItype) * 8);
> ++  /* Remove high part from the TFtype, leaving the low part as flonum.  */
> ++  a -= (TFtype) v;
> ++  /* Convert that to fixed (but not to DItype!) and add it in.
> ++     Sometimes A comes out negative.  This is significant, since
> ++     A has more bits than a long int does.  */
> ++  if (a < 0)
> ++    v -= (USItype) (-a);
> ++  else
> ++    v += (USItype) a;
> ++  return v;
> ++}
> ++#endif
> +diff --git a/libgcc/config/rs6000/floatditf.c b/libgcc/config/rs6000/floatditf.c
> +--- a/libgcc/config/rs6000/floatditf.c 1969-12-31 19:00:00.000000000 -0500
> ++++ b/libgcc/config/rs6000/floatditf.c 2018-12-12 17:57:55.852953553 -0500
> +@@ -0,0 +1,47 @@
> ++/* Software floating-point emulation.
> ++   Convert a 64bit signed integer to IEEE quad
> ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++   Contributed by Richard Henderson (rth@cygnus.com) and
> ++                Jakub Jelinek (jj@ultra.linux.cz).
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   In addition to the permissions in the GNU Lesser General Public
> ++   License, the Free Software Foundation gives you unlimited
> ++   permission to link the compiled version of this file into
> ++   combinations with other programs, and to distribute those
> ++   combinations without any restriction coming from the use of this
> ++   file.  (The Lesser General Public License restrictions do apply in
> ++   other respects; for example, they cover modification of the file,
> ++   and distribution when not linked into a combine executable.)
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifdef _ARCH_PPC64
> ++#include "soft-fp.h"
> ++#include "double.h"
> ++#include "quad-float128.h"
> ++
> ++TFtype
> ++__floatditf (DItype u)
> ++{
> ++  DFtype dh, dl;
> ++
> ++  dh = (SItype) (u >> (sizeof (SItype) * 8));
> ++  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> ++  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
> ++
> ++  return (TFtype) dh + (TFtype) dl;
> ++}
> ++#endif
> +diff --git a/libgcc/config/rs6000/floatunditf.c b/libgcc/config/rs6000/floatunditf.c
> +--- a/libgcc/config/rs6000/floatunditf.c       1969-12-31 19:00:00.000000000 -0500
> ++++ b/libgcc/config/rs6000/floatunditf.c       2018-12-12 17:57:15.262473574 -0500
> +@@ -0,0 +1,47 @@
> ++/* Software floating-point emulation.
> ++   Convert a 64bit unsigned integer to IEEE quad
> ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++   Contributed by Richard Henderson (rth@cygnus.com) and
> ++                Jakub Jelinek (jj@ultra.linux.cz).
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   In addition to the permissions in the GNU Lesser General Public
> ++   License, the Free Software Foundation gives you unlimited
> ++   permission to link the compiled version of this file into
> ++   combinations with other programs, and to distribute those
> ++   combinations without any restriction coming from the use of this
> ++   file.  (The Lesser General Public License restrictions do apply in
> ++   other respects; for example, they cover modification of the file,
> ++   and distribution when not linked into a combine executable.)
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifdef _ARCH_PPC64
> ++#include "soft-fp.h"
> ++#include "double.h"
> ++#include "quad-float128.h"
> ++
> ++TFtype
> ++__floatunditf (UDItype u)
> ++{
> ++  DFtype dh, dl;
> ++
> ++  dh = (USItype) (u >> (sizeof (SItype) * 8));
> ++  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> ++  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
> ++
> ++  return (TFtype) dh + (TFtype) dl;
> ++}
> ++#endif
> +diff --git a/libgcc/config/rs6000/ppc64-fp.c b/libgcc/config/rs6000/ppc64-fp.c
> +--- a/libgcc/config/rs6000/ppc64-fp.c  2018-12-12 17:53:49.540038500 -0500
> ++++ b/libgcc/config/rs6000/ppc64-fp.c  2018-12-12 17:49:51.897235314 -0500
> +@@ -25,34 +25,21 @@
> + <http://www.gnu.org/licenses/>.  */
> +
> + #if defined(__powerpc64__) || defined (__64BIT__) || defined(__ppc64__)
> +-#define TMODES
> + #include "fp-bit.h"
> +
> +-extern DItype __fixtfdi (TFtype);
> + extern DItype __fixdfdi (DFtype);
> + extern DItype __fixsfdi (SFtype);
> + extern USItype __fixunsdfsi (DFtype);
> + extern USItype __fixunssfsi (SFtype);
> +-extern TFtype __floatditf (DItype);
> +-extern TFtype __floatunditf (UDItype);
> + extern DFtype __floatdidf (DItype);
> + extern DFtype __floatundidf (UDItype);
> + extern SFtype __floatdisf (DItype);
> + extern SFtype __floatundisf (UDItype);
> +-extern DItype __fixunstfdi (TFtype);
> +
> + static DItype local_fixunssfdi (SFtype);
> + static DItype local_fixunsdfdi (DFtype);
> +
> + DItype
> +-__fixtfdi (TFtype a)
> +-{
> +-  if (a < 0)
> +-    return - __fixunstfdi (-a);
> +-  return __fixunstfdi (a);
> +-}
> +-
> +-DItype
> + __fixdfdi (DFtype a)
> + {
> +   if (a < 0)
> +@@ -86,30 +73,6 @@
> +   return (SItype) a;
> + }
> +
> +-TFtype
> +-__floatditf (DItype u)
> +-{
> +-  DFtype dh, dl;
> +-
> +-  dh = (SItype) (u >> (sizeof (SItype) * 8));
> +-  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> +-  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
> +-
> +-  return (TFtype) dh + (TFtype) dl;
> +-}
> +-
> +-TFtype
> +-__floatunditf (UDItype u)
> +-{
> +-  DFtype dh, dl;
> +-
> +-  dh = (USItype) (u >> (sizeof (SItype) * 8));
> +-  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> +-  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
> +-
> +-  return (TFtype) dh + (TFtype) dl;
> +-}
> +-
> + DFtype
> + __floatdidf (DItype u)
> + {
> +@@ -183,30 +146,6 @@
> +   return (SFtype) f;
> + }
> +
> +-DItype
> +-__fixunstfdi (TFtype a)
> +-{
> +-  if (a < 0)
> +-    return 0;
> +-
> +-  /* Compute high word of result, as a flonum.  */
> +-  const TFtype b = (a / (((UDItype) 1) << (sizeof (SItype) * 8)));
> +-  /* Convert that to fixed (but not to DItype!),
> +-     and shift it into the high word.  */
> +-  UDItype v = (USItype) b;
> +-  v <<= (sizeof (SItype) * 8);
> +-  /* Remove high part from the TFtype, leaving the low part as flonum.  */
> +-  a -= (TFtype) v;
> +-  /* Convert that to fixed (but not to DItype!) and add it in.
> +-     Sometimes A comes out negative.  This is significant, since
> +-     A has more bits than a long int does.  */
> +-  if (a < 0)
> +-    v -= (USItype) (-a);
> +-  else
> +-    v += (USItype) a;
> +-  return v;
> +-}
> +-
> + /* This version is needed to prevent recursion; fixunsdfdi in libgcc
> +    calls fixdfdi, which in turn calls calls fixunsdfdi.  */
> +
> +diff --git a/libgcc/config/rs6000/quad-float128.h b/libgcc/config/rs6000/quad-float128.h
> +--- a/libgcc/config/rs6000/quad-float128.h     2018-12-12 17:53:49.540038500 -0500
> ++++ b/libgcc/config/rs6000/quad-float128.h     2018-12-12 17:30:19.423468244 -0500
> +@@ -104,6 +104,11 @@
> + extern UTItype_ppc __fixunskfti (TFtype);
> + extern TFtype __floattikf (TItype_ppc);
> + extern TFtype __floatuntikf (UTItype_ppc);
> ++
> ++extern DItype_ppc __fixtfdi (TFtype);
> ++extern DItype_ppc __fixunstfdi (TFtype);
> ++extern TFtype __floatditf (DItype_ppc);
> ++extern TFtype __floatunditf (UDItype_ppc);
> + #endif
> +
> + /* Functions using the ISA 3.0 hardware support.  If the code is compiled with
> +diff --git a/libgcc/config/rs6000/t-float128 b/libgcc/config/rs6000/t-float128
> +--- a/libgcc/config/rs6000/t-float128  2018-12-12 17:53:49.540038500 -0500
> ++++ b/libgcc/config/rs6000/t-float128  2018-12-12 17:45:12.233937136 -0500
> +@@ -24,6 +24,7 @@
> +
> + # New functions for software emulation
> + fp128_ppc_funcs               = floattikf floatuntikf fixkfti fixunskfti \
> ++                        floatditf floatunditf fixtfdi fixunstfdi \
> +                         extendkftf2-sw trunctfkf2-sw \
> +                         sfp-exceptions _mulkc3 _divkc3 _powikf2
> +
> +
>  diff --git a/libgcc/configure b/libgcc/configure
>  old mode 100644
>  new mode 100755
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

