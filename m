Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 292C065E09
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 05:05:39 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id hl10so3642458igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Apr 2014 22:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=K6y2ah1/TgnmmjlPSOGck6QiTmhmuPBi5zn462TKRgw=;
	b=vsp/8+A3gV9Ep5kdbJmoD194j+8/GSNhDCT9Eh8lW+zLy6SJIiR0S2zifFLq/bcA5A
	RhEO0Pf8qeFCiV/u5y+hpTOzduU7v2t5bc8NIxHX+9iJf7T3grJ/3Pw1kdN8m+MQ4fPB
	GgN8B0lmOqwNGFiuKvEQ+ZDZUXhb/Xc4U8ceES00wYqdsoLslblLsOMvO5BQr5jJEvcT
	tmWAg7bUX75iipPwLAyHzubrqWgKoscn2x2ijxGgy2lFslp8mM0EROd7AEC65gpDjNiM
	/7MmpjBwBGcYQ/OsXPo2v9HMpX5jNuNkbwqeygDk46Dcr+z79J5n/TfEqI8b2+h7rYoh
	ZpUQ==
X-Received: by 10.43.59.82 with SMTP id wn18mr16179266icb.6.1398575140235;
	Sat, 26 Apr 2014 22:05:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Sat, 26 Apr 2014 22:05:10 -0700 (PDT)
In-Reply-To: <1398558130.16672.282.camel@ted>
References: <1398558130.16672.282.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2014 22:05:10 -0700
Message-ID: <CAMKF1sqSYANfi1XjgrjUwkB0+bDcj45Vzd05ANv=XZ5=dOgQbA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Drop ARCH_FLAGS_FOR_TARGET usage
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
X-List-Received-Date: Sun, 27 Apr 2014 05:05:42 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 26, 2014 at 5:22 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> As far as I can tell this variable is now completely unneeded. It would
> only ever get used in target builds and these are now correctly done
> in the target environment namespace, not any of our cross environments.
> As such, CC and other variables contain the correct compilers and other
> tune options and these are correctly picked up when building libgcc,
> libstdc++ and others.
>
> I tried to figure out where else these would make any sense and couldn't
> find anything. Builds appear fine without them so lets drop the complexity
> including the patch adding in this flag to gcc.

AFAR these were needed when doing SDK builds which was a shortcoming
in gcc itself
have you tried a SDK build with it ?

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index 855ec26..42b4212 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -22,7 +22,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                    file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
>
>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> -          file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
>            file://0002-uclibc-conf.patch \
>            file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
>            file://0004-uclibc-locale.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 3cc5efa..7ff1a10 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -68,11 +68,6 @@ CPPFLAGS = ""
>  EXTRA_OECONF_append_powerpc = " --with-long-double-128"
>  EXTRA_OECONF_append_powerpc64 = " --with-long-double-128"
>
> -# Used by configure to define additional values for FLAGS_FOR_TARGET -
> -# passed to all the compilers.
> -ARCH_FLAGS_FOR_TARGET = "${TARGET_CC_ARCH}"
> -EXTRA_OEMAKE += "ARCH_FLAGS_FOR_TARGET='${ARCH_FLAGS_FOR_TARGET}'"
> -
>  SYSTEMHEADERS = "${target_includedir}"
>  SYSTEMLIBS = "${target_base_libdir}/"
>  SYSTEMLIBS1 = "${target_libdir}/"
> @@ -121,7 +116,6 @@ do_configure () {
>         export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
>         export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
>         export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
> -       export ARCH_FLAGS_FOR_TARGET="${ARCH_FLAGS_FOR_TARGET}"
>         export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
>         export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
>         export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 2e82a09..c59c35a 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -7,8 +7,6 @@ EXTRA_OECONF_PATHS = " \
>      --with-sysroot=${STAGING_DIR_TARGET} \
>      --with-build-sysroot=${STAGING_DIR_TARGET}"
>
> -ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
> -
>  EXTRA_OECONF += "--disable-libunwind-exceptions"
>  EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> index 3412aa8..aff395c 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -7,8 +7,6 @@ EXTRA_OECONF_PATHS = " \
>      --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
>      --with-gxx-include-dir=${includedir}/c++/"
>
> -ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
> -
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

