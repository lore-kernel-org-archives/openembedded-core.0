Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F8BC54ED0
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 17:59:06 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.13665.1748195938476943043
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 10:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PvZ7MuHy;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2d0920ce388so669964fac.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 10:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748195938; x=1748800738; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXl9KEAYBTujIAV2MD7Z2H6mz24RO5aB9OXTqF8u+Ww=;
        b=PvZ7MuHy+U3/LMV1biSSAWmfm56Vr+TbLCNP++zNDF1Y9VmcWQvO2Xdrh6guYyAqj3
         shFqN6vzzwfaquNMpmXzkQwALJbrcJefsowjzOqOpITAh3qClIs/pE16pPpR7oarUIjD
         fMvt3CJ/qwFTaUmc+C64ZO/hat4sXzcGMTYXkdMJTjXl4ZkiUxWBUOOV/37GSm6RDf5G
         9EoZN9FHTnWH2QdTHTl3WD5qzj2S5a5jSCmkc/GgEBo9LO3MBHO/Knr3YKjv0aqjtKPq
         ACE7vKPpF8zDe6OcEDVjoQQfNSiH7w4yl9SdIfLjr5lZHeWK/P4aE8ZsHuVfgpqmCczu
         xQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748195938; x=1748800738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXl9KEAYBTujIAV2MD7Z2H6mz24RO5aB9OXTqF8u+Ww=;
        b=ESaXHhf+H72kDUjIKLYUWnk+N6Ff3bDH+V+3nzkUrb52aOorI1z3IupeAGLXH4PTkW
         rGCBflBd4Wm7MxgrPF7ZFEZfYmaGvo9p8AW63m9i3oX67f60OMwAPTrwMy0A1bxv+ALX
         IPcXWitTlV4sJmA21XGOlT1VMC1XyvdknSGmay8MyjBRpMABWZ3z/3fjNxIvcwMS6y1Y
         K3xN+gYg7SC1tIrRatmY+hNxCPjsPRsQjulkRe1eNMYgHnbJGhPbd7KWBoBovEUQgBAx
         ZrqiYVNa4AVPMOXZIOwTKP4tTbjfU2cmmDiuhtVcVdHWOcEvBxr0LW6gbcHkrc5oE7aX
         6gnQ==
X-Gm-Message-State: AOJu0Yw8ygABVXMAYiE31S3T7RHdJs3mtvaP1mSmjX72ta4ooyMoRoup
	IM9uxrt1vBDbY64lanJ74jAukqTfUP25vqKtfip1rrvP53yD0SvCBpA/4YPk8fCjLmp0rwShl/k
	1ISYaXCIy/x1V6GS7+g6q/r20pMDZRYs=
X-Gm-Gg: ASbGncs5lsR31wMSGqokbYdLIZo+5+l1sG8iNW7P8Ps1qRwifBmp0HNnU8+zxIXqttG
	BbjEE6/dQmS2eqDu2jf92hmm1FNbmtrJYhmaMJNt6mjyYavvBeGRc/EKJUVoEkgwHx6R+tCuuJT
	ccbiG6C0oLUV7yvxLCH4LsJKxW1M74n7h7mmbIt9VWvKsx9eJp3t/hkI1FIg==
X-Google-Smtp-Source: AGHT+IH/A098m55N1NbgxV1N3eKjsmlHz11iyyom86dLjZNmZBnDUmuekDUTX9yzh1QVRENEYLpCA2sREZUFIE/wtXY=
X-Received: by 2002:a05:6871:a4c8:b0:2bc:7007:5145 with SMTP id
 586e51a60fabf-2e861dfe4b7mr3427756fac.9.1748195937605; Sun, 25 May 2025
 10:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 May 2025 10:58:31 -0700
X-Gm-Features: AX0GCFuh83E7w8o5jQvzOHSBySFxLC2vtJsLeC54tJWkdkKLA3G5-t2cw-ttWz4
Message-ID: <CAMKF1sq3gPQ6E2zNdqnqczi1dQhodoDO4vUhUQ-a7E8qAd2qFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 01/12] mesa: remove OSMesa support
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 17:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217249

You should also remove its use from
mesa-gl and mesa-demos recipe as well.

On Thu, May 22, 2025 at 7:46=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Mesa 25.1 has dropped OSMesa support. Remove corresponding bits from the
> recipe.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 07a57b11c80b..2ff69c3ace2c 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -219,8 +219,6 @@ GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACK=
AGECONFIG', 'tegra', ',tegra,
>
>  PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3Dfal=
se"
>
> -PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Dtrue,-Dosmesa=3Dfalse"
> -
>  PACKAGECONFIG[perfetto] =3D "-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,libper=
fetto"
>
>  PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,=
libunwind"
> @@ -254,7 +252,6 @@ ALLOW_EMPTY:libgles3-mesa =3D "1"
>  RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
>
>  PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
> -             libosmesa libosmesa-dev \
>               libgallium \
>               libgl-mesa libgl-mesa-dev \
>               libglx-mesa libglx-mesa-dev \
> @@ -353,7 +350,6 @@ FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
>  FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
>  FILES:libopencl-mesa =3D "${libdir}/lib*OpenCL.so.* ${libdir}/gallium-pi=
pe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
>  FILES:libglapi =3D "${libdir}/libglapi.so.*"
> -FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
>  FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
>
>  FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${l=
ibdir}/vdpau/*.so"
> @@ -366,7 +362,6 @@ FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* $=
{includedir}/GLES ${libdir}/p
>  FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 $=
{libdir}/pkgconfig/glesv2.pc"
>  FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
>  FILES:libopencl-mesa-dev =3D "${libdir}/lib*OpenCL.so"
> -FILES:libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h=
 ${libdir}/pkgconfig/osmesa.pc"
>  FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxatra=
cker.la \
>                            ${includedir}/xa_tracker.h ${includedir}/xa_co=
mposite.h ${includedir}/xa_context.h \
>                            ${libdir}/pkgconfig/xatracker.pc"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217112): https://lists.openembedded.org/g/openembedde=
d-core/message/217112
> Mute This Topic: https://lists.openembedded.org/mt/113248263/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

