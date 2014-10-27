Return-Path: <krirobo@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 80AE060097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 19:54:19 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id i138so3953384oig.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fc0iFCGyxXWXdtcTfgPqtVDxk6DlcJiaAbFCevbr+w0=;
	b=dGhTu8HbRZ4izV2WQuKCrh6CjDv1OZ2NYFbngsgPBZ51ZI+VIYFj6fqdUZoUit1JSc
	scK5meUAd+/sB2hlgcPXvCKpCLoQUCJtSjS+IlGarA/AMBUx3SgaoQsFccbf2kDZowNU
	CYgnGnuIuUHwURnD4QVWzmUGl1HjazgpaYmFZkbKsn+NQkPb7k4hw7ObifZf9JPMtRn+
	uFUHoq1qQHuRU2mRLXGLJmUPLyHWEhrcWgqKHIIyghNsvHH3hWHSnee8ITGjP5OHxyek
	26KjrCOKkqO1OchG4pXvq6AJIA0dmRFilpT+2XHqOx2Hvbxda7xNijhynHHADoY+zqeF
	m3IA==
MIME-Version: 1.0
X-Received: by 10.182.142.10 with SMTP id rs10mr15391788obb.36.1414439659424; 
	Mon, 27 Oct 2014 12:54:19 -0700 (PDT)
Received: by 10.76.150.38 with HTTP; Mon, 27 Oct 2014 12:54:19 -0700 (PDT)
In-Reply-To: <1398958819.30460.86.camel@ted>
References: <1398958819.30460.86.camel@ted>
Date: Mon, 27 Oct 2014 20:54:19 +0100
Message-ID: <CAFgGSN7et4nS+yD39199rF+7mgHkfApmQ5E9M4u=Zvzw-gGSkg@mail.gmail.com>
From: Kristof Robot <krirobo@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-common: Only apply fpu settings to target gcc
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
X-List-Received-Date: Mon, 27 Oct 2014 19:54:30 -0000
Content-Type: text/plain; charset=UTF-8

Richard, all,

After bisecting, I found that, since this patch, my toolchain is being
built with soft floating point support, while it should be built with
hard floating point support:

(1) Compiling parent commit 74d8866814aec520822518cc4cb8a942f7069bf7
[1] gives hard floating point support (good):
    $./build.good74d8/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gcc
 -dM -E - < /dev/null | grep -i SOFTFP
    $

(2) Compiling with this patch (commit
ce1f3fd20d81545d6d5dfc68f86f9fddf8ac9bbf [2]) gives soft floating
point support (bad):
    $ ./build.badce1f/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gcc
 -dM -E - < /dev/null | grep -i SOFTFP
    #define __SOFTFP__ 1
    $

I am using DEFAULTTUNE = "cortexa7hf-neon-vfpv4", resulting in
following build configuration parameters:
    TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard vfpv4 cortexa7"
    TARGET_FPU        = "vfp-vfpv4-neon"

I can fix this by reverting the changes to
meta/recipes-devtools/gcc/gcc-configure-common.inc, i.e.:
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -61,7 +61,7 @@ EXTRA_OECONF_append_libc-uclibc        = " --enable-__cxa_atex
 EXTRA_OECONF_append_mips64    = " --with-abi=64 --with-arch-64=mips64 --with-tu
 EXTRA_OECONF_append_mips64el    = " --with-abi=64 --with-arch-64=mips64 --with-

-EXTRA_OECONF_FPU ??= ""
+EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 CPPFLAGS = ""
S = ""


Would that indeed be the correct way to fix this issue, or am I
missing something?

Thanks!

Kristof

[1] https://github.com/openembedded/openembedded-core/commit/74d8866814aec520822518cc4cb8a942f7069bf7
[2] https://github.com/openembedded/openembedded-core/commit/ce1f3fd20d81545d6d5dfc68f86f9fddf8ac9bbf

On Thu, May 1, 2014 at 5:40 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Within the OE build environment, we supply the correct fpu settings. These
> only need to be spelt out for the on-target gcc.
>
> Doing this means the checksums for the core compiler don't depend on the fpu
> settings. We exclude the compiler tunes for similar reasons, it doesn't need
> to influence the compiler build.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> index 0408e65..e56e598 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -63,7 +63,7 @@ def get_tune_parameters(tune, d):
>      retdict['package_extra_archs'] = localdata.getVar('PACKAGE_EXTRA_ARCHS', True)
>      return retdict
>
> -get_tune_parameters[vardepsexclude] = "AVAILTUNES"
> +get_tune_parameters[vardepsexclude] = "AVAILTUNES TUNE_CCARGS"
>
>  DEBIANNAME_${MLPREFIX}libgcc = "libgcc1"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 3cb6ec8..31e3cc4 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -61,7 +61,7 @@ EXTRA_OECONF_append_libc-uclibc        = " --enable-__cxa_atexit"
>  EXTRA_OECONF_append_mips64    = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
>  EXTRA_OECONF_append_mips64el    = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
>
> -EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
> +EXTRA_OECONF_FPU ??= ""
>  CPPFLAGS = ""
>
>  # powerpc needs this to comply with the ABI
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> index 45a1637..de906d6 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -7,6 +7,8 @@ EXTRA_OECONF_PATHS = " \
>      --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
>      --with-gxx-include-dir=${includedir}/c++/"
>
> +EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
> +
>  PACKAGES = "\
>    ${PN} ${PN}-plugins ${PN}-symlinks \
>    g++ g++-symlinks \
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

