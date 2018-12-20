Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA857BF0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 00:55:51 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id r71so9535qkr.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 16:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1sFAfIVEL5SqMtD4+gtuHOBS1y3/91HvB3hNpPZu6DE=;
	b=Bk4nanbiXnD0I7uv8giXLh4uB5j2H+nLjxiuhh2zS8TpSc5p52VMVUXHFfx9ycVYK6
	VZ5QZpY0Qc0yJsXNCQ8MXksifDjGJyBUBausWKdfWwh7mvZu4IbRv7iCgffSEU47Ryap
	Xu6+qzYEihDYVhoCV9or7jEZlEGNSKFADFjkU8IWkM+ydGqF2qi6AwmMz7ZxDpmKcGmT
	6HZIPKgaQhP0vqrlA6uc+BzKSzuUjSKfxZE9SpFlKeVTBlFEw4PwSBqbfecSuW4s8Bwm
	ZpOGuLtkJC4GP7tcqeHjn2+cZYADmAgSeBzIofupmXo3yjhvZES2pBmFZ1AUvYK10MXT
	yL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1sFAfIVEL5SqMtD4+gtuHOBS1y3/91HvB3hNpPZu6DE=;
	b=r/me9dx+kmqiF8vQ4dfLsm5yrnXKCh8H6Sk330rH8eJhvUF+e1z+WVQOaJ0pHJGko+
	4uWUlGvcbAR+h+gY3WY6mpGVe4VpDB6Yyx2fYr2SF102itqIzD/aRlOkQZC2SnU07weR
	pvk8LgGfTBCpf9fdz1HupvJHAhu+SUtSlJMSS9H0475exl4bPSfFSxNqmfIyL2H5VY+R
	5i6iMP5RVH5lgKka9zaALuAbW5m6VZuqsOupGqH3J/WhOzd3P2MEw5F7O/BFGEVSeTsB
	m8+pqlq6JClVYl3cXEcdn5pNZpljHwzmkDbxytnMR+4sB5PHuu8bI7yUQD4lylLMG2QK
	rYTw==
X-Gm-Message-State: AA+aEWavgHJa+oD6JW8vBM88em2ivhELbl/QrZwPbZTjTkVp5Rov74cW
	4S0Bq7LGbaQWDgCm3D98X3ISWKzaz1yqzAYGViw=
X-Google-Smtp-Source: AFSGD/XXhD6Uerg1AjIcP9RW1ZR3kr80SIb5ncG/E5cgs7jyUf3Ia0wdza7Jg1REUKy/yzaNYPG6TNiaEIHwNw4O2G0=
X-Received: by 2002:a37:d408:: with SMTP id l8mr22523082qki.315.1545267351860; 
	Wed, 19 Dec 2018 16:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
	<20181220001545.12618-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20181220001545.12618-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Dec 2018 16:55:26 -0800
Message-ID: <CAMKF1so94po_iN+AmHq7JKjtDKeoQkMUbTu4UTgeGB9u9SmkzA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] gcc: Drop gcc-cross-initial and use gcc-cross instead
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
X-List-Received-Date: Thu, 20 Dec 2018 00:55:51 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard

This is a very good change all in all. I have few comments I added.

On Wed, Dec 19, 2018 at 4:16 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We need a libgcc to build glibc. Tranditionally we therefore build
> a non-threaded and non-shared compiler (gcc-cross-initial), then use
> that to build libgcc-initial which is used to build glibc which we can
> then build gcc-cross and libgcc against.
>
> Firstly, we can drop the glibc dependency from gcc-cross, *if* we make
> two changes:
>
> a) specify the minimum glibc version to support in a configure option
> b) create a dummy limits.h file so that later when glibc creates one,
>    the headers structure has support for it. We can do this with a simple
>    empty file
>
> Once gcc-cross is libc independent, we can use it to build both
> libgcc-initial and then later libgcc.
>
> libgcc-initial is tricky as we need to imitate the non-threaded and
> non-shared case. We can do that by hacking the threading mode back to
> "single" even if gcc reports "posix" and disable libc presence for the
> libgcc-intial build. We have to create the dummy limits.h to avoid
> compiler errors from a missing header.
>
> glibc will fail to link with libgcc-initial due to a missing "exception
> handler" capable libgcc (libgcc_eh.a). Since we know glibc doesn't need
> any exception handler, we can safely symlink to libgcc.a.
>
> With those changes, gcc-cross can be used in all places and we only need
> one build of gcc for each architecture.
>
> For some reason ifunc was being disabled on mips prior to these changes
> but afterwards became enabled but caused assertion failures. This is
> therefore disabled until we can debug that.
>
> The glibc version is a minimum and only used on ppc in the gcc code, it
> doesn't need to be rigerously kept exactly up to date.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/glibc/glibc.inc             |  5 +-
>  .../gcc/gcc-configure-common.inc              |  3 ++
>  .../gcc/gcc-cross-canadian.inc                |  2 +-
>  meta/recipes-devtools/gcc/gcc-cross.inc       |  8 ++-
>  meta/recipes-devtools/gcc/libgcc-initial.inc  | 52 ++++++++++++++++---
>  meta/recipes-devtools/gcc/libgcc.inc          |  2 +-
>  6 files changed, 61 insertions(+), 11 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 43e71337eef..de692fbfd75 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -15,7 +15,7 @@ python () {
>          bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
>  }
>
> -DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers"
> +DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
>
>  PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>  PROVIDES += "virtual/libintl virtual/libiconv"
> @@ -33,6 +33,9 @@ CACHED_CONFIGUREVARS += " \
>    libc_cv_ssp=no \
>  "
>
> +# ifunc doesn't appear to work on mips, casuses libbfd assertion failures
> +CACHED_CONFIGUREVARS_append_mipsarch = " libc_cv_ld_gnu_indirect_function=no"

perhaps we should use --disable-gnu-indirect-function to make it more readable.

> +
>  GLIBC_EXTRA_OECONF ?= ""
>  GLIBC_EXTRA_OECONF_class-nativesdk = ""
>  INHIBIT_DEFAULT_DEPS = "1"
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index e2ce234aa14..009ab111683 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -24,6 +24,8 @@ GCCTHREADS ?= "posix"
>
>  GCCPIE ??= ""
>
> +# glibc version is a minimum and doesn't need to track glibc exactly
> +# only governs ppc specific features in much older glibc versions

I hope there are no effects of this pinning to glibc 2.28 on non-glibc
builds especially musl.

>  EXTRA_OECONF = "\
>      ${@['--enable-clocale=generic', ''][d.getVar('USE_NLS') != 'no']} \
>      --with-gnu-ld \
> @@ -38,6 +40,7 @@ EXTRA_OECONF = "\
>      --enable-libstdcxx-pch \
>      --program-prefix=${TARGET_PREFIX} \
>      --without-local-prefix \
> +    --with-glibc-version=2.28 \
>      ${EXTRA_OECONF_BASE} \
>      ${EXTRA_OECONF_GCC_FLOAT} \
>      ${EXTRA_OECONF_PATHS} \
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 2f32d3407fb..73f1e054463 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -3,7 +3,7 @@ inherit cross-canadian
>  SUMMARY = "GNU cc and gcc C compilers (cross-canadian for ${TARGET_ARCH} target)"
>  PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>
> -DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext flex-native"
> +DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext flex-native virtual/libc"
>
>  GCCMULTILIB = "--enable-multilib"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index 89b19684bef..63a196e2e99 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -2,7 +2,7 @@ inherit cross
>
>  INHIBIT_DEFAULT_DEPS = "1"
>  EXTRADEPENDS = ""
> -DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${EXTRADEPENDS} ${NATIVEDEPS}"
> +DEPENDS = "virtual/${TARGET_PREFIX}binutils ${EXTRADEPENDS} ${NATIVEDEPS}"
>  PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
>  python () {
>      if d.getVar("TARGET_OS").startswith("linux"):
> @@ -44,6 +44,12 @@ EXTRA_OECONF_PATHS = "\
>
>  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
>
> +
> +do_configure_prepend () {
> +       install -d ${RECIPE_SYSROOT}${target_includedir}
> +       touch ${RECIPE_SYSROOT}${target_includedir}/limits.h

I wonder if we should use install  0644 so we dont have permission
errors not sure what touch will do in that regard

> +}
> +
>  do_compile () {
>         export CC="${BUILD_CC}"
>         export AR_FOR_TARGET="${TARGET_SYS}-ar"
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
> index 950ad861e7e..06bf224f734 100644
> --- a/meta/recipes-devtools/gcc/libgcc-initial.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
> @@ -1,20 +1,58 @@
> +#
> +# Notes on the way the OE cross toolchain now works
> +#
> +# We need a libgcc to build glibc. Tranditionally we therefore built
> +# a non-threaded and non-shared compiler (gcc-cross-initial), then use
> +# that to build libgcc-initial which is used to build glibc which we can
> +# then build gcc-cross and libgcc against.
> +#
> +# We were able to drop the glibc dependency from gcc-cross, with two tweaks:
> +
> +# a) specify the minimum glibc version to support in a configure option
> +# b) create a dummy limits.h file so that later when glibc creates one,
> +#    the headers structure has support for it. We can do this with a simple
> +#    empty file
> +#
> +# Once gcc-cross is libc independent, we can use it to build both
> +# libgcc-initial and then later libgcc.
> +#
> +# libgcc-initial is tricky as we need to imitate the non-threaded and
> +# non-shared case. We can do that by hacking the threading mode back to
> +# "single" even if gcc reports "posix" and disable libc presence for the
> +# libgcc-intial build. We have to create the dummy limits.h to avoid
> +# compiler errors from a missing header.
> +#
> +# glibc will fail to link with libgcc-initial due to a missing "exception
> +# handler" capable libgcc (libgcc_eh.a). Since we know glibc doesn't need
> +# any exception handler, we can safely symlink to libgcc.a.
> +#
> +
>  require libgcc-common.inc
>
> -DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
> +DEPENDS = "virtual/${TARGET_PREFIX}gcc"
>
>  LICENSE = "GPL-3.0-with-GCC-exception"
>
> -STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
> -STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
> -PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
> -
>  PACKAGES = ""
>
>  EXTRA_OECONF += "--disable-shared"
>
> -COMPILERINITIAL = "-initial"
> -
>  inherit nopackages
>
>  # We really only want this built by things that need it, not any recrdeptask
>  deltask do_build
> +
> +do_configure_prepend () {
> +       install -d ${STAGING_INCDIR}
> +       touch ${STAGING_INCDIR}/limits.h
> +       sed -i -e 's#INHIBIT_LIBC_CFLAGS =.*#INHIBIT_LIBC_CFLAGS = -Dinhibit_libc#' ${B}/gcc/libgcc.mvars
> +       sed -i -e 's#inhibit_libc = false#inhibit_libc = true#' ${B}/gcc/Makefile
> +}
> +
> +do_configure_append () {
> +       sed -i -e 's#thread_header = .*#thread_header = gthr-single.h#' ${B}/${BPN}/Makefile
> +}
> +
> +do_install_append () {
> +       ln -s libgcc.a ${D}${libdir}/${TARGET_SYS}/${BINV}/libgcc_eh.a
> +}
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
> index 5f1dff609c0..e4e0c480076 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -1,6 +1,6 @@
>  require libgcc-common.inc
>
> -DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
> +DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ virtual/${MLPREFIX}libc"
>
>  do_install_append_class-target () {
>         if [ "${TCLIBC}" != "glibc" ]; then
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

