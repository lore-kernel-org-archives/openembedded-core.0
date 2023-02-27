Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F8CC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 11:28:22 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.87895.1677497294704664801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 03:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hlav6lEv;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id q6so2419151iot.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6275tou5kcZtqABGN9FYoObA+W9QyBWM32UOs+dOK8=;
        b=Hlav6lEvyU5+JJXRUYz+Xmmiz2Zld4T+bTF6KTdx/2qrtZ4BTe/arK6Kh7/f7+5D2z
         ZhU+M6ozspxbxT063aY4yPmqe9u9453lfRnWxr1dzYofVqN/SvS+HgsmhoJiTOvQwIS1
         NSIU7HFFKA4qv1LsUQJuX7maPNsLLa8ehigTG2NV3rc0ambyDqjyQSHVRifPG96iBSkH
         qlh9lsU0hQjg8CoALvdZ4yKG1DgEoy21CMn5g3MeEWoMN1H2p5s0TnDaDTPtOh7QAeGX
         lPpW/oB+X+8maMG8U2WbJkTcnTu4RCduCVVrQvbGe/428ojedpqG8DQ9UDDjc09vUsmq
         fB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6275tou5kcZtqABGN9FYoObA+W9QyBWM32UOs+dOK8=;
        b=tt0sjwZLdOKTRGBWx5dPkFPDMvAIUYrL4zTSMU1qJhzrDGjiKb3ZG1Pj+t7BeiOcr0
         9Wj2vqFRPB70+7qy2z2t31Y7HAq7I6l0nq/C0FlcgArMEkeXU0Pxt2FkrQUA4VjOkSN+
         y80aYTIrtbP7NUcLKzWiE1T7cx9dP8cDVBakn+HebRhWAKWCWvILTGKPTSJZnELbLJG8
         hNMGg89YF4BPYcdUvw+A3pIN9Ib3HpsYyiz7Fes9nhCiEhmfXmKWUzuImzrp8O8B63z0
         oBhyXEyKeLvuBmlOBXgCnRoJ2z1UM/GEa/G3bw7iQw/vEltWsUk05Vc5wp8aJ+pS/vTs
         fCtA==
X-Gm-Message-State: AO0yUKVp+NxpfecsAD7yLvoLSa+iIzp6kbojiKiYgHbm3dP19+UT0OI/
	6FPb28dXy8SkVayaWKsUsuze29oNSF4HorfszS0=
X-Google-Smtp-Source: AK7set+Maf44sA621sF+9XaaDkJ+ErBpkUw1ea03g2+9lY6M8LNKMMTpLq/kmgoTRc1jQLFApN+OLKR7zBeCgarRVQs=
X-Received: by 2002:a6b:b20e:0:b0:74c:8ba9:290e with SMTP id
 b14-20020a6bb20e000000b0074c8ba9290emr5562198iof.2.1677497293811; Mon, 27 Feb
 2023 03:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20230224093850.3393567-1-zboszor@gmail.com> <20230226050814.929055-1-zboszor@gmail.com>
 <20230226050814.929055-4-zboszor@gmail.com> <17479FC3A76A2964.29542@lists.openembedded.org>
 <CAO5Uq5R0gJUJuE6kMfsPd4BT5Psy=nVPnLMuYbYVfH3OgC5rpA@mail.gmail.com> <9e42abc2-7920-8a01-cc49-53d2e9f66150@gmail.com>
In-Reply-To: <9e42abc2-7920-8a01-cc49-53d2e9f66150@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 27 Feb 2023 11:28:01 +0000
Message-ID: <CAO5Uq5Q+zRcvQ1zCY23p2eRFd9HQbXpoKFifnmPsG82jiDMX-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] mesa: Add PACKAGECONFIG "rusticl"
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 11:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177788

On Mon, Feb 27, 2023 at 10:36 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zb=
oszor@gmail.com> wrote:
>
> 2023. 02. 27. 10:32 keltez=C3=A9ssel, Alex Kiernan =C3=ADrta:
> > On Mon, Feb 27, 2023 at 8:04 AM Alex Kiernan via
> > lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org=
>
> > wrote:
> >> On Sun, Feb 26, 2023 at 5:08 AM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi=
 <zboszor@gmail.com> wrote:
> >>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >>> ---
> >>>   meta/recipes-graphics/mesa/mesa.inc | 15 ++++++++++++---
> >>>   1 file changed, 12 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graph=
ics/mesa/mesa.inc
> >>> index 89e2dc6e90..2fbc1f971e 100644
> >>> --- a/meta/recipes-graphics/mesa/mesa.inc
> >>> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >>> @@ -46,6 +46,7 @@ PROVIDES =3D " \
> >>>       "
> >>>
> >>>   inherit meson pkgconfig python3native gettext features_check
> >>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'rust', '',=
 d)}
> >>>
> >>>   BBCLASSEXTEND =3D "native nativesdk"
> >>>
> >>> @@ -119,6 +120,13 @@ PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=
=3Ddisabled"
> >>>   OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno=
', '-Dopencl-native=3Dtrue', '', d)}"
> >>>   PACKAGECONFIG[clover] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3D=
true ${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,li=
bclc spirv-tools"
> >>>
> >>> +# "rusticl" requires libclc and spirv-llvm-translator from meta-clan=
g and spirv-tools from OE-Core
> >>> +PACKAGECONFIG[rusticl] =3D "-Dgallium-rusticl=3Dtrue -Drust_std=3D20=
21,-Dgallium-rusticl=3Dfalse,bindgen-cli-native libclc spirv-tools spirv-ll=
vm-translator,libclc spirv-tools spirv-llvm-translator"
> >>> +
> >>> +# Building "rusticl" runs bindgen.
> >>> +# This setting is needed by bindgen to dlopen the correct libclang.
> >>> +export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
> >>> +
> >> Could that be part of a wrapper in the bindgen recipe?
> >>
> > Also, with this export, I don't believe you have a dependency on
> > anything from meta-clang (certainly you're not declaring it here
> > AFAICS).
>
> See https://gitlab.freedesktop.org/mesa/mesa/-/issues/8352
> bindgen dlopens libclang which AFAIK doesn't exist in oe-core or meta-oe.
> Unless I am wrong, bindgen does depend on meta-clang.
>

Reading your recipe, it looks to me like your libclang dependency is
resolving from rust-native, as you've no DEPENDS to bring clang-native
into your recipe's sysroot-native.


> >
> >>>   PACKAGECONFIG[broadcom] =3D ""
> >>>   PACKAGECONFIG[etnaviv] =3D ""
> >>>   PACKAGECONFIG[freedreno] =3D ""
> >>> @@ -197,6 +205,7 @@ DEV_PKG_DEPENDENCY =3D ""
> >>>   RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
> >>>
> >>>   RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG',=
 'clover', 'libclc spirv-tools', '', d)}"
> >>> +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', =
'rusticl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
> >>>
> >>>   PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
> >>>                libosmesa libosmesa-dev \
> >>> @@ -233,7 +242,7 @@ do_install:append () {
> >>>   # RPROVIDEs/RCONFLICTs on the generic libgl name.
> >>>   python __anonymous() {
> >>>       pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
> >>> -    if "clover" in pkgconfig:
> >>> +    if "clover" in pkgconfig or "rusticl" in pkgconfig:
> >>>           pkgconfig.append("opencl")
> >>>       suffix =3D ""
> >>>       if "-native" in d.getVar("PN"):
> >>> @@ -305,7 +314,7 @@ FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.=
*"
> >>>   FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
> >>>   FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
> >>>   FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
> >>> -FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/gal=
lium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
> >>> +FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/lib=
RusticlOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors=
/mesa.icd ${sysconfdir}/OpenCL/vendors/rusticl.icd"
> >>>   FILES:libglapi =3D "${libdir}/libglapi.so.*"
> >>>   FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
> >>>   FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
> >>> @@ -319,7 +328,7 @@ FILES:libglapi-dev =3D "${libdir}/libglapi.*"
> >>>   FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/G=
LES ${libdir}/pkgconfig/glesv1*.pc"
> >>>   FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GL=
ES2 ${libdir}/pkgconfig/glesv2.pc"
> >>>   FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
> >>> -FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
> >>> +FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so ${libdir}/l=
ibRusticlOpenCL.so"
> >>>   FILES:libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osm=
esa.h ${libdir}/pkgconfig/osmesa.pc"
> >>>   FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/lib=
xatracker.la \
> >>>                             ${includedir}/xa_tracker.h ${includedir}/=
xa_composite.h ${includedir}/xa_context.h \
> >>> --
> >>> 2.39.2
> >>>
> >>
> >> --
> >> Alex Kiernan
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#177775): https://lists.openembedded.org/g/openembe=
dded-core/message/177775
> >> Mute This Topic: https://lists.openembedded.org/mt/97240533/3618097
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kiernan@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
>


--
Alex Kiernan

