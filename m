Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F4FEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:30:48 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.16302.1687451441487012724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 09:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XA9uL7Sm;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b47bfd4e45so68238891fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687451439; x=1690043439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK738gRiBpKD//cQKFZDcbXewnp7KiNvsa5B+4941V8=;
        b=XA9uL7Smd/28q8oZR8bb6Nm14AkkRVRhFyhN0+Kaoy+aEyMkkpJbwtUlNz/3XlvUoD
         IYTjcL45O+jbNvit3En9G7rhB6J5Qq085zHNt+DckY2MG/TAeIsTArTTdf6Tsevud8Fq
         B4XZ+QllHZ8sF954225j6R2k0XzAbS+/LLYYa8oX/656GvAj0VazHKeogGjIc8AkSI12
         IzENGoC6Uyvu/ClDboisCktGGCTh0QX9D9zL7Il5uwkvzAMou+qOrwFo9mf/bFyZXM1B
         ga4+e+Ep8Lk9epKCKIRqlWtjlMKKR5v73KDwJVbHBLuBSW5LxXpAYjJ/Bk152vKbvlvT
         LXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687451439; x=1690043439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK738gRiBpKD//cQKFZDcbXewnp7KiNvsa5B+4941V8=;
        b=hgKf4Y93/DQVnuBgqsagpZeaHvvGmkjR3p+a9Q57timBuyji8Xur4toOTQDc1cRNd2
         gIwkcJsdnlSZ4fitpi4ENC6yMyPGpWWpuLcdxkLFOfGbV8BDkKrFPXrAwPcz+WVzpDop
         k6GmgV9l6EV8cqF+P25dZxBazNacvPnSkvzSCQ5gtFXF42Ip2kuW5N2K4xIigulBTTgj
         W8Vcr2Bay7ed+y7D5e0MAOGF/IPjj63BFmXkQJGHWGxO7RpgnYAqMbAHzNR/xP0WrAwo
         boe+O2KFE/a8LEh9jZSqHCgC6ecemcYXccFdwu/UJ0gVu3tmQ+y0YgB0Ovy4/wEn90Y5
         TgQA==
X-Gm-Message-State: AC+VfDx7ZgLO5vYK8ByikpJKEBtm//r/fdmvLiFO/To9XpfhfeBDIKG8
	Erhq1RcydOZPRvqr3V3Xekuv0FNNU8hRXD2FCuo2k+gf
X-Google-Smtp-Source: ACHHUZ5vxI+/AZbsFCzBESN9AtS3zR4T6pb4ySpgDzkQ9laDSXnAXvDQKlp9jwVDB80FHu5daevqMY1YO8wR91PKH2U=
X-Received: by 2002:a19:ca45:0:b0:4f8:651f:9bbe with SMTP id
 h5-20020a19ca45000000b004f8651f9bbemr9242912lfj.54.1687451439369; Thu, 22 Jun
 2023 09:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com> <20230622161749.797820-3-maxime.roussinbelanger@gmail.com>
In-Reply-To: <20230622161749.797820-3-maxime.roussinbelanger@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Jun 2023 18:30:28 +0200
Message-ID: <CANNYZj-pa8CDzKEU12OxYpAqXG3z+ptwoW90pZ6Ps=h2p+YQKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] bitbake.conf: add debug symbol for sdk
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183268

This change is unnecessary, as there is already a mechanism. Just
slightly further down you can see that BUILDSDK_CFLAGS pulls in
BUILD_OPTIMIZATION, which sets -g if you enable DEBUG_BUILD in your
config.

Alex

On Thu, 22 Jun 2023 at 18:20, Maxime Roussin-B=C3=A9langer
<maxime.roussinbelanger@gmail.com> wrote:
>
> From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
>
> Without adding debug flag nativesdk dbg package is not packaged since
> there is no debugging information
>
> Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
> ---
> v2: New commit
>
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9d9b268858..0635affbc1 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -601,7 +601,7 @@ PATCHRESOLVE =3D "noop"
>  ##################################################################
>
>  export BUILD_CPPFLAGS =3D "-isystem${STAGING_INCDIR_NATIVE}"
> -BUILDSDK_CPPFLAGS =3D ""
> +BUILDSDK_CPPFLAGS ?=3D "-g"
>  export CPPFLAGS =3D "${TARGET_CPPFLAGS}"
>  TARGET_CPPFLAGS =3D ""
>
> --
> 2.36.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183265): https://lists.openembedded.org/g/openembedde=
d-core/message/183265
> Mute This Topic: https://lists.openembedded.org/mt/99701056/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

