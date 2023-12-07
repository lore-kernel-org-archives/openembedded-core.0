Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEFDC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 15:07:28 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.86261.1701961642158561408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 07:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QPo6G0K7;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a1e35c2807fso128818166b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 07:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701961640; x=1702566440; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ej0bH0v53EiaB24SZve7lHvVc92yPpH2Y7Vegc9wbaQ=;
        b=QPo6G0K75eShxTHHnyGJEpw27/Wu2hxaxS7AvQ0TY5p6aa1StSiM3fFPfc3zY4Yvvn
         nn4AZYvbGJaqOp96VG3gHwGJKFa6O73OPHsKRgiLO1H32uJMNjcy9/Dr2+yvvciSIT36
         UCVdbqVVEeCBpwBfdZBBqmEK1VFRpfxPK1jSO/Bia50Oe9Ewe1kqs6kcldt2GBrWJ4GK
         Fpkuo+tRLrrpUtawB8nXBLCsEDJwvJMgI+LoRjkP5FToqfAwM3TdBRGqHAF6zX/H/Pyj
         dXVwytRcD7EmBKSaiIKw9cJoR/r3kmNwYOJAoKq/JhLWpexMVAR30830oDFKEUNpm6IP
         fq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961640; x=1702566440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ej0bH0v53EiaB24SZve7lHvVc92yPpH2Y7Vegc9wbaQ=;
        b=sz5JJZYvGGIIy/hJK+NXQeVGfBuIVELyfuU97kszRic6xpa4KO0E7XH7+onn5F7aOi
         7lRRP16UB6L+nYb478Zki+rcIesIG43whdXWICeEYvPBAN9iiwm7Ahu3l1gpw3PHIX6U
         I22DDQQZ8BO8UzDl0FRpi8HMSktmubWJErRG7TTAKsMqzdTFTT/BHMyqz+vytn/wkA5O
         YMHvsD6k0O7vZ4yUdtLnxS/e5wBthwxoUhwTdtLKaEjORCkLXV9Znm/oGtPJJqzyONl8
         91Om8RuGldd1v5W3mkZMV+Ygt/qvbCXrkGL9Dcn+t4WtISppE/tjz331TOvl5UXTcFz6
         GGxQ==
X-Gm-Message-State: AOJu0YwebRnSTuaw9wfBgcPKMowctHuWP/mWHho6DDbeY1sJTrm6Yugv
	1w0ylgapqYNvkND//1eGKPtjPESbY8otQoIb8ThrzQ==
X-Google-Smtp-Source: AGHT+IFgLJuZ7tphcrixmVmftaN2zWpKpaKaGPOoS5tfz5GR4MKvulmfWXBsrrHwCK0A0+aZ95ZKo86mz3xBDIBzBhk=
X-Received: by 2002:a17:906:101:b0:a1d:9d6c:57d4 with SMTP id
 1-20020a170906010100b00a1d9d6c57d4mr1828921eje.55.1701961640510; Thu, 07 Dec
 2023 07:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20231206091249.1357218-1-claus.stovgaard@gmail.com>
In-Reply-To: <20231206091249.1357218-1-claus.stovgaard@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 7 Dec 2023 05:07:09 -1000
Message-ID: <CAOSpxdYJ6g3P6=0uBJSaCRQLJNHQq-C2BvJS3gPu_10xaoZUQA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] gstreamer1.0-plugins-base: enable
 glx/opengl support
To: Claus Stovgaard <claus.stovgaard@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Alexander Kanavin <alex@linutronix.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 15:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191965

On Tue, Dec 5, 2023 at 11:13=E2=80=AFPM Claus Stovgaard
<claus.stovgaard@gmail.com> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> This is required by latest webkit when built with x11 support.

Is this an issue for the version of webkit in kirkstone?  i.e. is it
currently broken?

Steve

>
> (From OE-Core rev: 024edebf6f722ae4d05411be348730d9eeb3bd7c)
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-base_1.20.7.bb           | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2=
0.7.bb
> index 8822c6a905..8dfa70aea3 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.=
bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.=
bb
> @@ -21,7 +21,8 @@ inherit gobject-introspection
>
>  # opengl packageconfig factored out to make it easy for distros
>  # and BSP layers to choose OpenGL APIs/platforms/window systems
> -PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',=
 'gles2 egl', '', d)}"
> +PACKAGECONFIG_X11 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'o=
pengl glx', '', d)}"
> +PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',=
 'gles2 egl ${PACKAGECONFIG_X11}', '', d)}"
>
>  PACKAGECONFIG ??=3D " \
>      ${GSTREAMER_ORC} \
> @@ -32,7 +33,7 @@ PACKAGECONFIG ??=3D " \
>  "
>
>  OPENGL_APIS =3D 'opengl gles2'
> -OPENGL_PLATFORMS =3D 'egl'
> +OPENGL_PLATFORMS =3D 'egl glx'
>
>  X11DEPENDS =3D "virtual/libx11 libsm libxrender libxv"
>  X11ENABLEOPTS =3D "-Dx11=3Denabled -Dxvideo=3Denabled -Dxshm=3Denabled"
> @@ -61,6 +62,7 @@ PACKAGECONFIG[gles2]        =3D ",,virtual/libgles2"
>
>  # OpenGL platform packageconfigs
>  PACKAGECONFIG[egl]          =3D ",,virtual/egl"
> +PACKAGECONFIG[glx]          =3D ",,virtual/libgl"
>
>  # OpenGL window systems (except for X11)
>  PACKAGECONFIG[gbm]          =3D ",,virtual/libgbm libgudev libdrm"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191876): https://lists.openembedded.org/g/openembedde=
d-core/message/191876
> Mute This Topic: https://lists.openembedded.org/mt/103009798/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

