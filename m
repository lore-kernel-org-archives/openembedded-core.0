Return-Path: <erik.boto@pelagicore.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 73E3273E36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 08:39:13 +0000 (UTC)
Received: by qgfa66 with SMTP id a66so104190qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 01:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=8DZIxC2vZ8EkN18gjr2nYvNlhe6bCjmZPr0O5eQ2eUM=;
	b=GZNWnEiCvkhF5arIpjOCOQsLZxo/F5/jjxxKmT00zNjO6AS5m/GQvYB0vgx3U3KK6o
	eJ3ggfME6npmS8maOMUBEWX22nZkk+kJqngbTvB6luZ/Fs3Fd71reYDT5jLyJMLjt0Mw
	k+OY1RQRH7Ugyw7ZT4MIH7AC5wS9P+RD/T9Sv01tlt/xCH/474yOXqbWMG+n4UjEiXdY
	aYVwdQa2x2hTcotuMP91rozSQ8oujwkYVwQt01Bk0Ii4dC6wWxX0wAxKnQMxgRkBzhoV
	b6UnWAlw3FheBKNjPKe8hYJGgamPVf5SfjuYCF/kBpOw1bAbKFAwac1ABDtgI7anZTjn
	0o0Q==
X-Gm-Message-State: ALoCoQlMFDO8FhxK27vLKjKiupW9x4aLVKwcBRYgWND2FRyKqT0Qr0f4aMvHc7MduRf9xZljmNBQ
MIME-Version: 1.0
X-Received: by 10.55.16.67 with SMTP id a64mr16192898qkh.31.1434011954792;
	Thu, 11 Jun 2015 01:39:14 -0700 (PDT)
Received: by 10.96.184.134 with HTTP; Thu, 11 Jun 2015 01:39:14 -0700 (PDT)
In-Reply-To: <1432309362-3275-1-git-send-email-dave.lerner@windriver.com>
References: <1432309362-3275-1-git-send-email-dave.lerner@windriver.com>
Date: Thu, 11 Jun 2015 10:39:14 +0200
Message-ID: <CA+AhUGx_O0zSnPQbqtH8rUwGDj3ru5zrb68z87Ze00ZKsH8yaw@mail.gmail.com>
From: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
To: Dave Lerner <dave.lerner@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: remove arm tests that don't compile
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
X-List-Received-Date: Thu, 11 Jun 2015 08:39:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'd like to see this backported into fido if possible, I saw that it's
now merged in master.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=d1ce219960c031c00b48bf454b740b8bffcfbc43

Cheers,
Erik

On Fri, May 22, 2015 at 5:42 PM, Dave Lerner <dave.lerner@windriver.com> wrote:
> [Yocto #7453]
>
> Corrects the original commit for the patch that removed ARM ptest CFLAGS
> settings. Since the flags could be set by a user, the flags should
> be kept in place during compilation.  By keeping the original up-stream
> CFLAGS for the tests, then additional tests successfully compile
> for all tested ARM tunings.
>
> However, there were still two tests listed below that did not compile
> for any beaglebone tuning that is valid for valgrind. With the updated
> patch, the set of excluded ARM ptests and their respective build
> failures are:
>   intdiv - fails for all beaglebone tunings with 2 errors:
>   {standard input}:(40 or 41): Error: selected processor does not
>        support Thumb mode `udiv r3,r9,r10'
>   {standard input}:(72 or 73): Error: selected processor does not
>        support Thumb mode `sdiv r3,r9,r10'
>
>   vcvt_fixed_float_VFP - fails for all beaglebone tunings in one of
>   two ways:
>     with neon tuning (-mfpu=neon) fails with Internal Compiler Error
>     without neon tuning fails with 3 errors:
>     {standard input}:33: Error: selected FPU does not support
>       instruction -- `vcvt.f32.s32 s15,s15,#1'
>     {standard input}:58: Error: selected FPU does not support
>       instruction -- `vcvt.f32.s32 s15,s15,#32'
>     {standard input}:136: Error: selected FPU does not support
>       instruction -- `vcvt.f32.u32 s15,s15,#1'
>
> After applying this commit, the valgrind ARM ptests compile without
> errors for tunings:
>   armv7[t][hf][b][-neon] cortexa8[t][hf][-neon]
> where the tuning [option] was successfully compiled, both with
> and without the 'option', and in combination with all other options.
>
> Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
> ---
>  .../valgrind/remove-arm-variant-specific.patch     | 99 +++++++++++-----------
>  1 file changed, 48 insertions(+), 51 deletions(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
> index f84bf9a..2319ab9 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
> +++ b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
> @@ -1,69 +1,66 @@
> -Remove tests that require thumb compiler flags
> -
> -Default compiler options for arm machines are incompatible with the
> -'-mthumb' compiler option imposed by the intdiv and lrt test
> -applications, so those two are removed from the ptest build.
> +Remove arm tests that don't compile
>
>  Upstream-Status: Pending
>
> +Corrects the original commit for the patch that removed ARM ptest CFLAGS
> +settings. Since the flags could be set by a user, the flags should
> +be kept in place during compilation.  By keeping the original up-stream
> +CFLAGS for the tests, then additional tests successfully compile
> +for all tested ARM tunings.
> +
> +However, there were still two tests listed below that did not compile
> +for any beaglebone tuning that is valid for valgrind. With the updated
> +patch, the set of excluded ARM ptests and their respective build
> +failures are:
> +  intdiv - fails for all beaglebone tunings with 2 errors:
> +  {standard input}:(40 or 41): Error: selected processor does not
> +       support Thumb mode `udiv r3,r9,r10'
> +  {standard input}:(72 or 73): Error: selected processor does not
> +       support Thumb mode `sdiv r3,r9,r10'
> +
> +  vcvt_fixed_float_VFP - fails for all beaglebone tunings in one of
> +  two ways:
> +    with neon tuning (-mfpu=neon) fails with Internal Compiler Error
> +    without neon tuning fails with 3 errors:
> +    {standard input}:33: Error: selected FPU does not support
> +      instruction -- `vcvt.f32.s32 s15,s15,#1'
> +    {standard input}:58: Error: selected FPU does not support
> +      instruction -- `vcvt.f32.s32 s15,s15,#32'
> +    {standard input}:136: Error: selected FPU does not support
> +      instruction -- `vcvt.f32.u32 s15,s15,#1'
> +
> +After applying this commit, the valgrind ARM ptests compile without
> +errors for tunings:
> +  armv7[t][hf][b][-neon] cortexa8[t][hf][-neon]
> +where the tuning [option] was successfully compiled, both with
> +and without the 'option', and in combination with all other options.
> +
>  Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
>
> -Index: valgrind-3.10.0/none/tests/arm/Makefile.am
> +Index: valgrind-3.10.1/none/tests/arm/Makefile.am
>  ===================================================================
> ---- valgrind-3.10.0.orig/none/tests/arm/Makefile.am
> -+++ valgrind-3.10.0/none/tests/arm/Makefile.am
> -@@ -17,15 +17,16 @@ EXTRA_DIST = \
> +--- valgrind-3.10.1.orig/none/tests/arm/Makefile.am    2015-05-19 15:11:59.224842927 -0500
> ++++ valgrind-3.10.1/none/tests/arm/Makefile.am 2015-05-19 15:14:20.808847028 -0500
> +@@ -17,9 +17,13 @@
>         vfp.stdout.exp vfp.stderr.exp vfp.vgtest \
>         vfpv4_fma.stdout.exp vfpv4_fma.stderr.exp vfpv4_fma.vgtest
>
> -+# For yocto:
> -+#  Only include tests that don't require Thumb.
> -+#  Only use CFLAGS passed in by the build system.
> -+# Some tests may fail, but all tests must compile.
> ++# Remove the following tests which cause compiler errors for all tunings
> ++#  available for beagle bone (see remove-arm-variant-specific.patch):
> ++#     intdiv
> ++#     vcvt_fixed_float_VFP
> ++
>   check_PROGRAMS = \
>         allexec \
>  -      intdiv \
> --      ldrt \
> +       ldrt \
>         ldrt_arm \
>         neon128 \
> -       neon64 \
> +@@ -27,7 +31,6 @@
>         v6intARM \
> --      v6intThumb \
> +       v6intThumb \
>         v6media \
> -       vcvt_fixed_float_VFP \
> +-      vcvt_fixed_float_VFP \
>         vfp \
> -@@ -36,34 +37,3 @@ AM_CXXFLAGS  += @FLAG_M32@
> - AM_CCASFLAGS += @FLAG_M32@
> +       vfpv4_fma
>
> - allexec_CFLAGS                = $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
> --
> --# These two are specific to their ARM/Thumb respectively and so we
> --# hardwire -marm/-mthumb.  neon64 and neon128 are compilable on both,
> --# however, ask for them to be compiled on thumb, as that looks
> --# like that's going to be the more common use case.  They also
> --# need special helping w.r.t -mfpu and -mfloat-abi, though.
> --# Also force -O0 since -O takes hundreds of MB of memory
> --# for v6intThumb.c.
> --v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -marm
> --v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
> --
> --v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
> --
> --vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
> --                      -mfpu=neon \
> --                      -mthumb
> --
> --
> --neon128_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
> --                      -mfpu=neon \
> --                      -mthumb
> --
> --neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
> --                      -mfpu=neon \
> --                      -mthumb
> --
> --intdiv_CFLAGS   = $(AM_CFLAGS) -g -mcpu=cortex-a15 -mthumb
> --ldrt_CFLAGS     = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mthumb
> --ldrt_arm_CFLAGS         = $(AM_CFLAGS) -g -mcpu=cortex-a8 -marm
> --
> --vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a15 -mfpu=vfpv4 -marm
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

