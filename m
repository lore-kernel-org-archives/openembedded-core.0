Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id A80C67DC5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:18:23 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b18so2674061otq.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 05:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0EQY7oFavxy6lH0BpoMTLsyNp8eMGAvkyF6CqTiCZH0=;
	b=U8Ci/RhMq9ZFl09EGotkmhBS27TwJJV5s391eYkR2pjYwLqTCqRBBq2pz5oX/B9eJJ
	4SUGycMd30Yj8vgDoXJC2cZxyfBdpNyT96epa3Xy4oLoR4pYtqNpHAPb1Vt6oX18qzW0
	0uzzVm7gifI6HXaIi9BBuECpd7LtMnTQZzfDbEpTDuC91vSxb088CjXPDokGJm9tV9Y1
	OQOySxtZ4OGpn78UqGqeTSLLJuk774FRG7N+JDb5YAIk7HuLDUetoD0kG6v4JSx+axxF
	gEIBfTUb5zqPYRfb+Nap6nHiHGBSH0OqAWJFXwMaNqdK2ZqtdXijVE0nZ7wrNfIvt9P2
	+T7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0EQY7oFavxy6lH0BpoMTLsyNp8eMGAvkyF6CqTiCZH0=;
	b=L6TgCx32aGx5wghRDE5IeLvM9NeLe2AEsi/cVsxXWiUPl6Q/D+v5VV5A2ciyRi++k+
	NwlyJIC0ZRM0mYRRD86aCfqoFyssF4Y0qp6QoKxLPGPwdxLqKoXwvsNLANv1IWTYZwBD
	gig7sR4/mcYJbyAO7MUMiVk85rrMeLkJ52YuCBQ69qltpq4wckc8UgVtjat/AmoviGaf
	OIhlsTtsHz7EJfNOVeRgMZw3WUzUQryn68tDHrLXC9kEjhZr7zeIkbfY0TMt8K1LaLZh
	8fNwa0PurS6hGVCjo0/978PV/CmOQR/U+WHwoi20NnRMc3Mx+Qi/e5n1NPvtJgezS5JW
	k8vw==
X-Gm-Message-State: APjAAAVLha0xSh6eI0SdQXB+Hf3U1zwnfJi7RvGhWz4H8erS+5J8dT7A
	svov6w/asZsnqS8x6R0tVTxX6BItysvZkdaRreCf8UqV
X-Google-Smtp-Source: APXvYqzv0kTJjaCj4HD3M/U77e7xn8DqNkNX15avu2wJDMWlLkO+ffvP0UKfar58V2ri/gMj0NPaBud3N20r2zBgg00=
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr12810614otf.326.1556626704821;
	Tue, 30 Apr 2019 05:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190430115323.25661-1-m.felsch@pengutronix.de>
In-Reply-To: <20190430115323.25661-1-m.felsch@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Apr 2019 14:18:13 +0200
Message-ID: <CANNYZj8htehKO+DvnzH_uhbQD8DBeipnAP3SkOKhLPHsz8qmqg@mail.gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: fix imx gallium driver
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
X-List-Received-Date: Tue, 30 Apr 2019 12:18:24 -0000
Content-Type: text/plain; charset="UTF-8"

Autotools is indeed deprecated, and we are trying to switch to meson
now. Rather than continue to fix autotools, can you try to help us
with meson please? The latest iteration of the patch should be in the
archives.

Alex


On Tue, 30 Apr 2019 at 14:10, Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Since commit [1] the imx-drm driver is covered by the generic kmsro
> driver. Unfortunatly we need to patch the autotools path too since the
> switch commit [1] missed some dependencies.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/commit/ \
>         41a0acd6a149ec9f47ea527ad08a2b29bf1ee6b2
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  ...Fix-imx-autotools-build-dependencies.patch | 46 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  4 +-
>  meta/recipes-graphics/mesa/mesa_19.0.1.bb     |  1 +
>  3 files changed, 49 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-dependencies.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-dependencies.patch b/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-dependencies.patch
> new file mode 100644
> index 0000000000..6cefe70bd8
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-dependencies.patch
> @@ -0,0 +1,46 @@
> +From 3e2aeab89fdbd0572d635d3a57a54f3fb99af254 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Tue, 30 Apr 2019 09:45:26 +0200
> +Subject: [PATCH] Fix imx autotools build dependencies
> +
> +Since commit 41a0acd6 ("Switch imx to kmsro and remove the imx winsys")
> +the imx-drm is covered by kmsro. During the switch some autotools
> +dependencies are missed. Autotools are marked as deprecated but since
> +yocto still uses them we need to cover this.
> +
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +---
> + configure.ac                           | 4 ++--
> + src/gallium/drivers/kmsro/Automake.inc | 1 +
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 1ef68fe68e6..1623976ab5c 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2861,8 +2861,8 @@ AM_CONDITIONAL(HAVE_SWR_BUILTIN, test "x$HAVE_SWR_BUILTIN" = xyes)
> +
> + dnl We need to validate some needed dependencies for renderonly drivers.
> +
> +-if test "x$HAVE_GALLIUM_VC4" != xyes -a "x$HAVE_GALLIUM_KMSRO" = xyes  ; then
> +-    AC_MSG_ERROR([Building with kmsro requires vc4])
> ++if test "x$HAVE_GALLIUM_VC4" != xyes -a "x$HAVE_GALLIUM_ETNAVIV" != xyes -a "x$HAVE_GALLIUM_KMSRO" = xyes  ; then
> ++    AC_MSG_ERROR([Building with kmsro requires vc4 or etnaviv])
> + fi
> +
> + if test "x$HAVE_GALLIUM_NOUVEAU" != xyes -a "x$HAVE_GALLIUM_TEGRA" = xyes; then
> +diff --git a/src/gallium/drivers/kmsro/Automake.inc b/src/gallium/drivers/kmsro/Automake.inc
> +index d5961c90765..ebed42408c2 100644
> +--- a/src/gallium/drivers/kmsro/Automake.inc
> ++++ b/src/gallium/drivers/kmsro/Automake.inc
> +@@ -2,6 +2,7 @@ if HAVE_GALLIUM_KMSRO
> +
> + TARGET_DRIVERS += pl111
> + TARGET_DRIVERS += hx8357d
> ++TARGET_DRIVERS += imx-drm
> + TARGET_CPPFLAGS += -DGALLIUM_KMSRO
> + TARGET_LIB_DEPS += \
> +     $(top_builddir)/src/gallium/winsys/kmsro/drm/libkmsrodrm.la \
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index ece74974b5..b3339dce33 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -87,11 +87,11 @@ PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-
>  PACKAGECONFIG[egl] = "--enable-egl, --disable-egl"
>
>  PACKAGECONFIG[etnaviv] = ""
> -PACKAGECONFIG[imx] = ""
> +PACKAGECONFIG[kmsro] = ""
>
>  GALLIUMDRIVERS = "swrast"
>  GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
> -GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'imx', ',imx', '', d)}"
> +GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
>
>  # radeonsi requires LLVM
>  GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
> diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.1.bb
> index d90be8a074..753fd5328a 100644
> --- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
> +++ b/meta/recipes-graphics/mesa/mesa_19.0.1.bb
> @@ -5,6 +5,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0002-winsys-svga-drm-Include-sys-types.h.patch \
>             file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
>             file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
> +           file://0005-Fix-imx-autotools-build-dependencies.patch \
>  "
>
>  SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

