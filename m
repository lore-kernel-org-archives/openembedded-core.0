Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0F37E6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 18:40:32 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so116162566pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 11:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=dmaHa+7poSa5gGpNzApJwdPW9HRczew6hPv139tWDj8=;
	b=uR+sOGXEXB1U8RUuh1SsqDtjAnq5GJjNC5kYezLXqUXo2ZFczAi3mZaChiPqM9y8WB
	Qf7kHR7TluIR3VD/CHRNBpuCfHnS/GhXKRAnN6Xj5QFmg0iwDhk0ZUjfRUSCYeUlcduw
	HzY6+0cLxOMkfnDDGnH5t4LWkN2Rh2Hjjxf0yzZFrPsiJYUp0PpAOv7QgmkmxSwQMQYX
	aFxlUzMpp2VXNRQ8DGyT4mrV7WquIhyOVS1ksoNwywsw8Pt4HSnrd9fFUajDF7gI/8LE
	P5hU8a1LKfWnikUAGazGJ0Hwnwi7t7jd4DfrNZgT6sYdNsCLS7Meg4VHhzMbFIK66MhI
	in+A==
X-Received: by 10.70.1.75 with SMTP id 11mr2445759pdk.147.1426876833679;
	Fri, 20 Mar 2015 11:40:33 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:51a7:8961:930d:8f0d?
	([2601:9:3580:84c:51a7:8961:930d:8f0d])
	by mx.google.com with ESMTPSA id k10sm9266253pdn.64.2015.03.20.11.40.32
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Mar 2015 11:40:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1426876321-19141-1-git-send-email-armccurdy@gmail.com>
Date: Fri, 20 Mar 2015 11:40:31 -0700
Message-Id: <4B7FE4EF-7583-45DF-A2BF-340C6EBC6CAE@gmail.com>
References: <1426876321-19141-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] directfb: retire directfb.inc
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
X-List-Received-Date: Fri, 20 Mar 2015 18:40:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Mar 20, 2015, at 11:32 AM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Splitting the DirectFB recipe into .bb and .inc hinders maintenance
> and the addition of new features such as class-native support.
>=20
> Remove directfb.inc and merge everything into directfb_1.7.6.bb.

Having a fairly static inc file has advantage that we don=E2=80=99t have =
to do git log =E2=80=94follow
to see what the sequence of changes were since the recipe gets renamed =
with upgrades
and not much changes ideally just the SRC_URI and signatures which can =
stay in a recipe
but if we change the .inc all the time then we have not abstracted out =
properly

>=20
> No functional changes.
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-graphics/directfb/directfb.inc      | 76 =
------------------------
> meta/recipes-graphics/directfb/directfb_1.7.6.bb | 75 =
++++++++++++++++++++---
> 2 files changed, 68 insertions(+), 83 deletions(-)
> delete mode 100644 meta/recipes-graphics/directfb/directfb.inc
>=20
> diff --git a/meta/recipes-graphics/directfb/directfb.inc =
b/meta/recipes-graphics/directfb/directfb.inc
> deleted file mode 100644
> index 669c0ff..0000000
> --- a/meta/recipes-graphics/directfb/directfb.inc
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -SUMMARY =3D "Graphics abstraction library for the Linux Framebuffer =
Device"
> -DESCRIPTION =3D "DirectFB is a thin library that provides developers =
\
> -with hardware graphics acceleration, input device handling and \
> -abstraction, an integrated windowing system with support for \
> -translucent windows and multiple display layers on top of the \
> -Linux framebuffer device."
> -SECTION =3D "libs"
> -LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Ddcf3c825659e82539645da41a7908589"
> -
> -HOMEPAGE =3D "http://directfb.org"
> -DEPENDS =3D "jpeg libpng freetype zlib tslib"
> -
> -SRC_URI =3D =
"http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.tar.gz=
 \
> -           file://configurefix.patch \
> -           file://fusion.patch"
> -
> -S =3D "${WORKDIR}/DirectFB-${PV}"
> -
> -LDFLAGS_append =3D" -lts -lm"
> -
> -BINCONFIG =3D "${bindir}/directfb-config"
> -
> -inherit autotools binconfig-disabled pkgconfig
> -
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[jpeg2000] =3D =
"--enable-jpeg2000,--disable-jpeg2000,jasper"
> -PACKAGECONFIG[drmkms] =3D "--enable-drmkms,--disable-drmkms,libdrm"
> -PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,tiff"
> -PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp"
> -
> -EXTRA_OECONF =3D "\
> -  --with-gfxdrivers=3Dnone \
> -  --enable-libmpeg3=3Dno \
> -  --enable-freetype=3Dyes \
> -  --enable-sdl=3Dno \
> -  --enable-vnc=3Dno \
> -  --disable-x11 \
> -  --disable-mesa \
> -"
> -
> -#Once -fno-omit-frame-pointer option of gcc is added into =
TARGET_CLFAGS as default
> -#this will cause directfb build failure on x86 arch, so filter out =
it.
> -TARGET_CFLAGS_x86 :=3D "${@oe_filter_out('-fno-omit-frame-pointer', =
'${TARGET_CFLAGS}', d)}"
> -
> -#PACKAGES_DYNAMIC +=3D "^directfb-inputdrivers-.*"
> -#
> -#python populate_packages_prepend () {
> -#    inputdrivers_libdir =3D =
d.expand('${libdir}/directfb-${RV}/inputdrivers')
> -#    do_split_packages(d, inputdrivers_libdir, '*.so$', =
'directfb-inputdrivers-%s', 'Directfb plugin for %s')
> -#}
> -
> -# NOTE: monolithic packaging for now, should improve that eventually
> -
> -
> -
> -FILES_${PN}-dbg +=3D "\
> -  ${libdir}/directfb-${RV}/*/*/.debug/*.so \
> -  ${libdir}/directfb-${RV}/*/.debug/*.so \
> -"
> -
> -FILES_${PN}-dev +=3D "\
> -  ${bindir}/directfb-config \
> -  ${libdir}/directfb-${RV}/systems/*.la \
> -  ${libdir}/directfb-${RV}/inputdrivers/*.la \
> -  ${libdir}/directfb-${RV}/interfaces/*/*.la \
> -  ${libdir}/directfb-${RV}/wm/*.la \
> -"
> -
> -FILES_${PN} +=3D "\
> -  ${libdir}/directfb-${RV}/systems/*.so \
> -  ${libdir}/directfb-${RV}/inputdrivers/*.so \
> -  ${libdir}/directfb-${RV}/interfaces/*/*.so \
> -  ${libdir}/directfb-${RV}/wm/*.so \
> -  ${datadir}/directfb-${PV} \
> -"
> diff --git a/meta/recipes-graphics/directfb/directfb_1.7.6.bb =
b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
> index d25d987..53451e3 100644
> --- a/meta/recipes-graphics/directfb/directfb_1.7.6.bb
> +++ b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
> @@ -1,21 +1,82 @@
> -require directfb.inc
> +SUMMARY =3D "Graphics abstraction library for the Linux Framebuffer =
Device"
> +DESCRIPTION =3D "DirectFB is a thin library that provides developers =
\
> +with hardware graphics acceleration, input device handling and \
> +abstraction, an integrated windowing system with support for \
> +translucent windows and multiple display layers on top of the \
> +Linux framebuffer device."
> +HOMEPAGE =3D "http://directfb.org"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Ddcf3c825659e82539645da41a7908589"
> +
> +DEPENDS =3D "jpeg libpng freetype zlib tslib sysfsutils"
>=20
> RV =3D "1.7-6"
>=20
> -DEPENDS +=3D "sysfsutils"
> +SRC_URI =3D =
"http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.tar.gz=
 \
> +           file://configurefix.patch \
> +           file://fusion.patch"
> +
> +SRC_URI[md5sum] =3D "8a7bb06b3f58599b230b4cf314004512"
> +SRC_URI[sha256sum] =3D =
"44f32bacfb842ea234599532f8481fe41b5bd2310d2bd101508eb3a5df26c9e1"
> +
> +S =3D "${WORKDIR}/DirectFB-${PV}"
> +
> +LDFLAGS_append =3D" -lts -lm"
> +
> +BINCONFIG =3D "${bindir}/directfb-config"
> +
> +inherit autotools binconfig-disabled pkgconfig
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[jpeg2000] =3D =
"--enable-jpeg2000,--disable-jpeg2000,jasper"
> +PACKAGECONFIG[drmkms] =3D "--enable-drmkms,--disable-drmkms,libdrm"
> +PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,tiff"
> +PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp"
>=20
> EXTRA_OECONF =3D "\
> +  --with-gfxdrivers=3Dnone \
>   --enable-freetype=3Dyes \
>   --enable-zlib \
> -  --with-gfxdrivers=3Dnone \
> +  --disable-imlib2 \
> +  --disable-mesa \
>   --disable-sdl \
>   --disable-vnc \
>   --disable-x11 \
> -  --disable-imlib2 \
> -  --disable-mesa \
> "
>=20
> LEAD_SONAME =3D "libdirectfb-1.7.so.0"
>=20
> -SRC_URI[md5sum] =3D "8a7bb06b3f58599b230b4cf314004512"
> -SRC_URI[sha256sum] =3D =
"44f32bacfb842ea234599532f8481fe41b5bd2310d2bd101508eb3a5df26c9e1"
> +#Once -fno-omit-frame-pointer option of gcc is added into =
TARGET_CLFAGS as default
> +#this will cause directfb build failure on x86 arch, so filter out =
it.
> +TARGET_CFLAGS_x86 :=3D "${@oe_filter_out('-fno-omit-frame-pointer', =
'${TARGET_CFLAGS}', d)}"
> +
> +#PACKAGES_DYNAMIC +=3D "^directfb-inputdrivers-.*"
> +#
> +#python populate_packages_prepend () {
> +#    inputdrivers_libdir =3D =
d.expand('${libdir}/directfb-${RV}/inputdrivers')
> +#    do_split_packages(d, inputdrivers_libdir, '*.so$', =
'directfb-inputdrivers-%s', 'Directfb plugin for %s')
> +#}
> +
> +# NOTE: monolithic packaging for now, should improve that eventually
> +
> +FILES_${PN}-dbg +=3D "\
> +  ${libdir}/directfb-${RV}/*/*/.debug/*.so \
> +  ${libdir}/directfb-${RV}/*/.debug/*.so \
> +"
> +
> +FILES_${PN}-dev +=3D "\
> +  ${bindir}/directfb-config \
> +  ${libdir}/directfb-${RV}/systems/*.la \
> +  ${libdir}/directfb-${RV}/inputdrivers/*.la \
> +  ${libdir}/directfb-${RV}/interfaces/*/*.la \
> +  ${libdir}/directfb-${RV}/wm/*.la \
> +"
> +
> +FILES_${PN} +=3D "\
> +  ${libdir}/directfb-${RV}/systems/*.so \
> +  ${libdir}/directfb-${RV}/inputdrivers/*.so \
> +  ${libdir}/directfb-${RV}/interfaces/*/*.so \
> +  ${libdir}/directfb-${RV}/wm/*.so \
> +  ${datadir}/directfb-${PV} \
> +"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


