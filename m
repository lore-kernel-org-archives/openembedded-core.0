Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECC0C369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 16:55:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.25049.1744822539657115505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 09:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fl2T8mNF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c2688619bso4646199f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 09:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744822538; x=1745427338; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3TurUFjjTtfceUIil2u3K8aiTZFxY2dXLX3Q75K8s8=;
        b=fl2T8mNFNYaViEBgP/Dn+dIbLVKMJJJkguh1WmQquRqdu6yUNgP1HpH9VaraNM96St
         UWPf8qeLT/A1dMJhl3hgT7jMkQ+ZJuGBdJ4djVmPi1+MOBw3ttZeYpwYY8jVNgcUb90Y
         hUDtZROO54I+sNPYeAF86EygOX0mfZwVdspF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822538; x=1745427338;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N3TurUFjjTtfceUIil2u3K8aiTZFxY2dXLX3Q75K8s8=;
        b=e6LxzVosObt2v4tZePrGSZunvj44laAFwwLJlm9hpR1ddB3WE+XfXyvXpWmK0juG8q
         KhvG19/h3G5T/LDKZ2daHKOINpn4b70vNQ+3bJ5IpOxpUAKmvNGFtwKP/pJAFQX/uxa7
         km6qyh3KH0jURFKzJVDJe5QdZycQ8DKndl05mlQGmmn0Tqa0xGnfBZ0EfayYDgzy6kV/
         6hCDDItaHOXt8XYN6danZuurgSgbeR0nnLPgKf4XY0CmQCtMQkuKM0K9Tx0/+wPSd/RL
         bz/aL65VbJ4UA75SKLHplg2u47UX9kH3YbW64vl2ivLD7jHGMD4Y3eJrugbB4xaBEEDG
         jvXw==
X-Forwarded-Encrypted: i=1; AJvYcCWascV2nFN9nsdy91LENnBOZyoeO1zMsnv+Qk7fw0lhw/s8nkPcMiFn9D/ZyKbVmBOq8c5w1j+yWGvQ64I1ogDvnQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwUOV0o9nE5atlrJshSUJkizNR1SYFLMz/ob5X9e038IODrvms6
	flUMQ+EGu8tZaLCgj9bHHeKeXOvL8hncl/I5DNBj44ULBVAb9O+7ekzQj8ue+h2cJ2CzaMPH8YX
	N
X-Gm-Gg: ASbGnct7Aq/3zeOkm5zJQH+yhAKF2W7GIC/aKF2l7iLYJ5D0UuEJKoiIM1FqTek1JmR
	NjGqUK+68zMqAjx61EgSIbIZZGYsO5OqG21pAiP+WzGRoJsKV7rm6eRgAKuBGaKrjNjET2KX8x2
	86QlE8dOPItq1RdAxdQ6P7wpqbA8u/gTN1hjR8sFXRK/YNWBFZ4r4TUHi4PH+WKh+4U42ldkGpx
	0HzX6ThjwsWIJcEFrKSp9gTeEZxuxxcxdzLh06gWmaX7DKhZLm/r7iwZ0Fhb0mx0QYNpeRG6fBr
	AGLhksil1acnENvEl+eyLP+vgOLCPo3rfcEhIFNCPBIF/baFwaH/LQOypSMPwlOpHuGZ55NAM8Y
	ZzSmojtsb9dhZ2modpZi/6rE2nDjC0OzaHqgfdXd4
X-Google-Smtp-Source: AGHT+IHqnj+6W0KDAER1FSZid8s52QHahEjYDB7RceM5jl8AC+gwtjv6MuoqMzXs7XD4Ia8NWjR78Q==
X-Received: by 2002:a05:6000:2210:b0:39c:1257:feba with SMTP id ffacd0b85a97d-39ee5bb15fbmr2420248f8f.58.1744822537672;
        Wed, 16 Apr 2025 09:55:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3e1:10a8:f859:c922? ([2001:8b0:aba:5f3c:e3e1:10a8:f859:c922])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963cb1sm17745774f8f.14.2025.04.16.09.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:55:37 -0700 (PDT)
Message-ID: <c4542dc8cddfd0e401f74629fd7f28e9dd209237.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH V3 1/5] classes/recipes: remove unnecessary
 qemu inherit and use qemuwrapper-cross
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 16 Apr 2025 17:55:36 +0100
In-Reply-To: <20250414053503.1180029-1-Qi.Chen@windriver.com>
References: <20250414053503.1180029-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 16:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215002

On Sun, 2025-04-13 at 22:34 -0700, Chen Qi via lists.openembedded.org wrote=
:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> These classes/recipes inherit qemu.bbclass but do not use anything from i=
t.
> What they use is qemuwrapper-cross, which is needed at do_rootfs time and
> needs to be pulled-in by PACKAGE_WRITE_DEPS.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> =C2=A0meta/classes-recipe/fontcache.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +--
> =C2=A0meta/classes-recipe/gio-module-cache.bbclass=C2=A0=C2=A0=C2=A0 | 3 =
+--
> =C2=A0meta/classes-recipe/gtk-immodules-cache.bbclass | 4 +---
> =C2=A0meta/classes-recipe/manpages.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0meta/classes-recipe/pixbufcache.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 5 +----
> =C2=A0meta/recipes-core/systemd/systemd_257.5.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 5 +++--
> =C2=A0meta/recipes-core/udev/eudev_3.2.14.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A07 files changed, 10 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/=
fontcache.bbclass
> index 6f4978369d..deadcd2fbb 100644
> --- a/meta/classes-recipe/fontcache.bbclass
> +++ b/meta/classes-recipe/fontcache.bbclass
> @@ -9,8 +9,7 @@
> =C2=A0# packages.
> =C2=A0#
> =C2=A0
> -PACKAGE_WRITE_DEPS +=3D "qemu-native"
> -inherit qemu
> +PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"
> =C2=A0
> =C2=A0FONT_PACKAGES ??=3D "${PN}"
> =C2=A0FONT_PACKAGES:class-native =3D ""
> diff --git a/meta/classes-recipe/gio-module-cache.bbclass b/meta/classes-=
recipe/gio-module-cache.bbclass
> index d12e03c4a0..3714678c7c 100644
> --- a/meta/classes-recipe/gio-module-cache.bbclass
> +++ b/meta/classes-recipe/gio-module-cache.bbclass
> @@ -4,8 +4,7 @@
> =C2=A0# SPDX-License-Identifier: MIT
> =C2=A0#
> =C2=A0
> -PACKAGE_WRITE_DEPS +=3D "qemu-native"
> -inherit qemu
> +PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"
> =C2=A0
> =C2=A0GIO_MODULE_PACKAGES ??=3D "${PN}"
> =C2=A0
> diff --git a/meta/classes-recipe/gtk-immodules-cache.bbclass b/meta/class=
es-recipe/gtk-immodules-cache.bbclass
> index 8fbe1dd1fb..585838c105 100644
> --- a/meta/classes-recipe/gtk-immodules-cache.bbclass
> +++ b/meta/classes-recipe/gtk-immodules-cache.bbclass
> @@ -8,9 +8,7 @@
> =C2=A0#
> =C2=A0# Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to up=
date the inputmethod modules
> =C2=A0
> -PACKAGE_WRITE_DEPS +=3D "qemu-native"
> -
> -inherit qemu
> +PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"
> =C2=A0
> =C2=A0GTKIMMODULES_PACKAGES ?=3D "${PN}"
> =C2=A0
> diff --git a/meta/classes-recipe/manpages.bbclass b/meta/classes-recipe/m=
anpages.bbclass
> index e9ca2f895b..f3d034b046 100644
> --- a/meta/classes-recipe/manpages.bbclass
> +++ b/meta/classes-recipe/manpages.bbclass
> @@ -10,7 +10,7 @@
> =C2=A0# by default.
> =C2=A0PACKAGECONFIG:append:class-target =3D " ${@bb.utils.contains('DISTR=
O_FEATURES', 'api-documentation', 'manpages', '', d)}"
> =C2=A0
> -inherit qemu
> +PACKAGE_WRITE_DEPS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'api-do=
cumentation', 'qemuwrapper-cross', '', d)}"
> =C2=A0
> =C2=A0# usually manual files are packaged to ${PN}-doc except man-pages
> =C2=A0MAN_PKG ?=3D "${PN}-doc"
> diff --git a/meta/classes-recipe/pixbufcache.bbclass b/meta/classes-recip=
e/pixbufcache.bbclass
> index 107e38885e..c32673df55 100644
> --- a/meta/classes-recipe/pixbufcache.bbclass
> +++ b/meta/classes-recipe/pixbufcache.bbclass
> @@ -9,12 +9,9 @@
> =C2=A0# packages.
> =C2=A0#
> =C2=A0
> -DEPENDS:append:class-target =3D " qemu-native"
> -inherit qemu
> -
> =C2=A0PIXBUF_PACKAGES ??=3D "${PN}"
> =C2=A0
> -PACKAGE_WRITE_DEPS +=3D "qemu-native gdk-pixbuf-native"
> +PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross gdk-pixbuf-native"
> =C2=A0
> =C2=A0pixbufcache_common() {
> =C2=A0if [ "x$D" !=3D "x" ]; then
> diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-co=
re/systemd/systemd_257.5.bb
> index 24aad11c0a..0f0c846db6 100644
> --- a/meta/recipes-core/systemd/systemd_257.5.bb
> +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "gperf-native libcap util-linux python3-jinja=
2-native"
> =C2=A0
> =C2=A0SECTION =3D "base/shell"
> =C2=A0
> -inherit useradd pkgconfig meson perlnative update-rc.d update-alternativ=
es qemu systemd gettext bash-completion manpages features_check mime
> +inherit useradd pkgconfig meson perlnative update-rc.d update-alternativ=
es systemd gettext bash-completion manpages features_check mime
> =C2=A0
> =C2=A0# unmerged-usr support is deprecated upstream, taints the system an=
d will be
> =C2=A0# removed in the near future. Fail the build if it is not enabled.
> @@ -932,7 +932,8 @@ pkg_prerm:${PN}:libc-glibc () {
> =C2=A0	fi
> =C2=A0}
> =C2=A0
> -PACKAGE_WRITE_DEPS +=3D "qemu-native"
> +PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"
> +
> =C2=A0pkg_postinst:udev-hwdb () {
> =C2=A0	if test -n "$D"; then
> =C2=A0		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefi=
x=3D${MLPREFIX} binprefix=3D${MLPREFIX} \
> diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/u=
dev/eudev_3.2.14.bb
> index b3e7d092c5..a2d222e655 100644
> --- a/meta/recipes-core/udev/eudev_3.2.14.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.14.bb
> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] =3D "8da4319102f24abbf7fff5ce9c416af=
848df163b29590e666d334cc192
> =C2=A0
> =C2=A0GITHUB_BASE_URI =3D "https://github.com/eudev-project/eudev/release=
s"
> =C2=A0
> -inherit autotools update-rc.d qemu pkgconfig features_check manpages git=
hub-releases
> +inherit autotools update-rc.d pkgconfig features_check manpages github-r=
eleases
> =C2=A0
> =C2=A0CONFLICT_DISTRO_FEATURES =3D "systemd"
> =C2=A0
> @@ -77,7 +77,7 @@ RDEPENDS:${PN} +=3D "kmod"
> =C2=A0RPROVIDES:${PN} =3D "hotplug udev"
> =C2=A0RPROVIDES:${PN}-hwdb +=3D "udev-hwdb"
> =C2=A0
> -PACKAGE_WRITE_DEPS +=3D "qemu-native"
> +PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"
> =C2=A0pkg_postinst:${PN}-hwdb () {
> =C2=A0	if test -n "$D"; then
> =C2=A0		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefi=
x=3D${MLPREFIX} binprefix=3D${MLPREFIX}
>=20


Something in this series is still causing allarch variable dependency
problems, as can be seen running "oe-selftest -r
sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs -j 1".

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1308

I'm seeing bitbake-diffsigs output of:

basehash changed from dfc2d35677a0412cc783f8b35f24dc6722d84be9f2cddff1adc2a=
e81dbf707c6 to 723f58407e0fcfae4450cee918fcbe3a8aebe3721eca0de8cf7a48ae4d15=
0171
List of dependencies for variable QEMU_OPTIONS changed from 'frozenset({'QE=
MU_EXTRAOPTIONS:tune-cortexa15t2hf-neon', 'TUNE_PKGARCH', 'OLDEST_KERNEL'})=
' to 'frozenset({'TUNE_PKGARCH', 'OLDEST_KERNEL', 'QEMU_EXTRAOPTIONS:tune-c=
ore2-64'})'
changed items: frozenset({'QEMU_EXTRAOPTIONS:tune-cortexa15t2hf-neon', 'QEM=
U_EXTRAOPTIONS:tune-core2-64'})
List of dependencies for variable TUNE_PKGARCH changed from 'frozenset({'AR=
MPKGSFX_THUMB', 'ARMPKGSFX_FPU', 'ARMPKGSFX_ENDIAN', 'ARMPKGARCH', 'ARMPKGS=
FX_EABI', 'ARMPKGSFX_DSP'})' to 'frozenset({'TUNE_PKGARCH:tune-core2-64', '=
DEFAULTTUNE'})'
changed items: frozenset({'ARMPKGSFX_THUMB', 'ARMPKGSFX_FPU', 'TUNE_PKGARCH=
:tune-core2-64', 'DEFAULTTUNE', 'ARMPKGSFX_ENDIAN', 'ARMPKGARCH', 'ARMPKGSF=
X_EABI', 'ARMPKGSFX_DSP'})
Dependency on variable QEMU_EXTRAOPTIONS:tune-core2-64 was added
Dependency on variable TUNE_PKGARCH:tune-core2-64 was added
Dependency on Variable ARMPKGARCH was removed
Dependency on Variable ARMPKGARCH:tune-cortexa15thf-neon was removed
Dependency on Variable ARMPKGSFX_DSP was removed
Dependency on Variable ARMPKGSFX_EABI was removed
Dependency on Variable ARMPKGSFX_ENDIAN was removed
Dependency on Variable ARMPKGSFX_FPU was removed
Dependency on Variable ARMPKGSFX_THUMB was removed
Dependency on Variable ARM_INSTRUCTION_SET was removed
Dependency on Variable ARM_M_OPT was removed
Dependency on Variable ARM_THUMB_OPT was removed
Dependency on Variable ARM_THUMB_SUFFIX was removed
Dependency on Variable QEMU_EXTRAOPTIONS:tune-cortexa15t2hf-neon was remove=
d
Dependency on Variable TUNE_CCARGS_MFLOAT was removed
Dependency on Variable TUNE_CCARGS_MFPU was removed
Dependency on Variable TUNE_FEATURES was removed
Dependency on Variable TUNE_FEATURES:tune-cortexa15 was removed
Dependency on Variable TUNE_FEATURES:tune-cortexa15-neon was removed
Dependency on Variable TUNE_FEATURES:tune-cortexa15t-neon was removed
Dependency on Variable TUNE_FEATURES:tune-cortexa15thf-neon was removed
Variable DEFAULTTUNE value changed from 'cortexa15thf-neon' to 'core2-64'
Variable OLDEST_KERNEL value changed from '3.3.0' to '5.15'
Variable TUNE_PKGARCH value changed from '${ARMPKGARCH}${ARMPKGSFX_THUMB}${=
ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}' to '${T=
UNE_PKGARCH:tune-${DEFAULTTUNE}}'

for "bitbake-diffsigs ../build-st-1070764/tmp-sstatesamehash*/stamps/all-po=
ky-linux/wayland-protocols/1.42.do_write_configsigdata.*".

Cheers,

Richard


