Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63D5C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 13:28:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.10046.1654349273886012899
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 06:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bv81zppZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id a10so2793412wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 06:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=T2QTexnJyEwOdVXTAzidKc7AmNlzOY7JiGrSpdZbdnQ=;
        b=Bv81zppZrdXnOU5oOZD9m0MzWBnBecl7Yml/dT0/2SkDF1eqP0sthPeMsjUzRLBHrM
         EXjygUx+E4c2j3/Vl9qpYPsP8veFS6/rhwj2que51a8FWeFI3YV7Yzl60uTRze643FqF
         uLlqnfvVNjPwNpzcl3048VZ2M5viaINPwvEm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=T2QTexnJyEwOdVXTAzidKc7AmNlzOY7JiGrSpdZbdnQ=;
        b=7DG60r9SG/l8INfX9kDiCkYSwgafqVLWpoxgDsB7lclpQYtkXsfhMqjurQjeJvM0Ue
         cyMO+PtTGWsE9xqCe26hbKp8qqlBxfwe9MB22xbV7gld6Bn6KGQI7qcWYcqKHE7TyzMK
         dYLXpQo8n7Puv05PWqxRoV5jqPEWt85eDnwkoMrwsIq9cYIcOR+7yp7Xq3von9oMlgL6
         sTmepJGJrMyqpMDsH7u4L2sxt47WBV8e9ng9i49xEOHxZG36V8TV4THHfw8vchN5Dq2a
         ESs6nyZjBYsvtbgaZFNs51TfzqIxdogtTGS6IHpTRpob0DBPY+wXSsZ173jaz8QszWzS
         T6Eg==
X-Gm-Message-State: AOAM5336RAdUIR8S1ejEiVnCmgROq1rL9QIhbFti/pAx/zjU6lFZtqwJ
	jcQQeMShO1uda0O8uUt1gNKoiAhEDBV9emVr
X-Google-Smtp-Source: 
 ABdhPJzB38DWnn1to05hoeIKM0muOjvFY37nJTOFrYupdrS8fNUziJUnZFe6XyRCsMwV4SrQwlgDNA==
X-Received: by 2002:a05:600c:1e04:b0:397:80cf:8109 with SMTP id
 ay4-20020a05600c1e0400b0039780cf8109mr43734945wmb.176.1654349272449;
        Sat, 04 Jun 2022 06:27:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118?
 ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a5d4d8b000000b0020c7ec0fdf4sm11835170wru.117.2022.06.04.06.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 06:27:51 -0700 (PDT)
Message-ID: 
 <d82cc562394b4cd74a3fedc53e6b41f7bb053f81.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv2 4/6] libsdl2: dont mix opengl and gles
 backends for wayland
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Sat, 04 Jun 2022 14:27:51 +0100
In-Reply-To: <20220604053028.4682-4-f_l_k@t-online.de>
References: <20220604053028.4682-1-f_l_k@t-online.de>
	 <20220604053028.4682-4-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 13:28:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166568

On Sat, 2022-06-04 at 07:30 +0200, Markus Volk wrote:
> This fixes "Could not initialize egl display" in libsdl2 apps for
> wayland without DISTRO_FEATURE x11
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.22.bb
> index 8519e7f732..e057b5cbbc 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> @@ -56,14 +56,16 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -D=
SDL_ARTS=3DOFF \
> =20
>  # opengl packageconfig factored out to make it easy for distros
>  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
> -PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d=
)}"
> +PACKAGECONFIG_GL ?=3D " \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', =
d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'gles2', '=
', d)} \
> +"
> =20
>  PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}"
>  PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)} ${PACKAGECONFIG_GL}"
>  PACKAGECONFIG ??=3D " \
>      ${PACKAGECONFIG_GL} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11'=
, d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', =
'', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11 =
wayland', d)} \
>      ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
>  "
>  PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib=
,"

I think this is breaking mingw builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/5320


Cheers,

Richard

