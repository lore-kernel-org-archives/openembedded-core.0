Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B61CD1280
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 10:56:58 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.5873.1711450615364337197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 03:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=cDRRB/QA;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.170, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d6ee81bcd4so3157541fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711450613; x=1712055413; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJa8oUVDCDQtHN8tT1kZtEYSwuLThrtWNctjzKSkuHQ=;
        b=cDRRB/QAt7JdjmqKbcgEjulRBNskU8upK3GdIytYUnuJ7XbA+sdHw08T6Fzw3mvZsg
         l3f9/b5cAGqGOGFl/4FmjUnIHQsEVfNRxsqNWyiusVCh+hDZ3rtb07HCa56Bq/lDNdh0
         Tr2iksIfUGn864uH17NvPTmXyX7LiEmdHcc2Zl6BpsGHQyqAFVV16jOCDWE+B/u8JDwC
         SiGaRJE16SgjT4ZbsPAil2dlnYlkDoyytBQI2q/ZFOtctbJFywWDOguiw3AuXJzUMjNe
         IFxdoyzoqG/CkLVFp8/xTUlTWMZBxghjEUoZx04TPN1Jj0LvmCwxlD4ZZHoh620ow9xg
         BgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711450613; x=1712055413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJa8oUVDCDQtHN8tT1kZtEYSwuLThrtWNctjzKSkuHQ=;
        b=O9kMS3ZNd1Un6g3Oww22a6+1+LGlsMYBnjAN2GQRqUfVSld0QB11ulHCPClogSRugi
         hZiuh9i4AGIgrAYcHJU7SinVEK+RrzgomWNjUfzO4IolVKbv9m5vHZbtj0cpunuIBInO
         j/m4DOtQdOV6sE14ljU0B+KPSilT4tY2LsmG2TBL6Il9GYdOL1rAsmITR8Kj/Zy/uv87
         tpLrptUqfxdZbcmMb67kkaz1QCGD18MQaK5mqTGnG/c2rb21qXqlNgrqaI5fBkgh8MLH
         AR9esdGeI/OILEGSEZxtfpKyTkNVbR5NUOHyE9HK5ok64WR0yNVSCuT/iSDzmBWXysmt
         GY3Q==
X-Gm-Message-State: AOJu0YxSwyKISjn06/POxUnY5HVTgASM2Rm34Yi2+vTijDvbF+o4xOWW
	DtV3o2tZULhcc4wLAN5aXIdrfH3GBeZ7zSQN0USklvGYFJqg8jONpA7IoeBGmNFph6jdHBmrPtA
	B2qi7FbSUb7/vWFjfgvfsrxippOohzaxA7pLkKlVy87ZFWjuywFE=
X-Google-Smtp-Source: AGHT+IF7bLJyt0akhRp49WKm+8USWqWxsf7kApPcnX6yScETu3+J6javBSAdmz+c3NpqTB/J1R0FG49uVpDnygvtZto=
X-Received: by 2002:a2e:b607:0:b0:2d5:9703:263c with SMTP id
 r7-20020a2eb607000000b002d59703263cmr6186579ljn.4.1711450613043; Tue, 26 Mar
 2024 03:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1710952928.git.steve@sakoman.com> <c6e4ac2acf35fb2e477799e6faa1cc30feda44c3.1710952928.git.steve@sakoman.com>
In-Reply-To: <c6e4ac2acf35fb2e477799e6faa1cc30feda44c3.1710952928.git.steve@sakoman.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Mar 2024 11:56:42 +0100
Message-ID: <CAMRc=Mcb+30=f=yK927_TJnPMgJuU7b77+1jHfufcuvaYPWUjQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 11/12] linux-firmware: upgrade 20231211 -> 20240220
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 10:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197532

On Wed, Mar 20, 2024 at 5:44=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> License-Update: additional files
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit add81ef0299ea5260f9bdc59ffc8f5cc0e74276f)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  ...{linux-firmware_20231211.bb =3D> linux-firmware_20240220.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231211.bb =
=3D> linux-firmware_20240220.bb} (99%)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
> similarity index 99%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
> index 3f201d853f..873ba9cdf0 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
> @@ -134,7 +134,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5e=
e3f410780e56711ad48eadc22b8bc \
>                      "
>  # WHENCE checksum is defined separately to ease overriding it if
>  # class-devupstream is selected.
> -WHENCE_CHKSUM  =3D "3113c4ea08e5171555f3bf49eceb5b07"
> +WHENCE_CHKSUM  =3D "a344e6c28970fc7daafa81c10247aeb6"
>
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
>  # so that the license files will be copied from fetched source
> @@ -212,7 +212,7 @@ SRC_URI:class-devupstream =3D "git://git.kernel.org/p=
ub/scm/linux/kernel/git/firmw
>  # Pin this to the 20220509 release, override this in local.conf
>  SRCREV:class-devupstream ?=3D "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>
> -SRC_URI[sha256sum] =3D "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799f=
a1caab16a9dbe8bb"
> +SRC_URI[sha256sum] =3D "bf0f239dc0801e9d6bf5d5fb3e2f549575632cf4688f4348=
184199cb02c2bcd7"
>
>  inherit allarch
>
> --
> 2.34.1
>
>

I already sent a patch upgrading linux-firmware to the most recent tag[1].

Bart

[1] https://lore.kernel.org/all/20240314100610.21815-1-brgl@bgdev.pl/T/

