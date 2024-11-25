Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4472E66893
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 10:39:42 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.16032.1732531176260644626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 02:39:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ov1UJBh4;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-46690cbec70so7310221cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 02:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732531175; x=1733135975; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8OhzgakllOt/BYVTCD3D7w2syEdoR64jT57hKrcwGI=;
        b=Ov1UJBh4CboYMQP71fJzP4Ot08PBxGFpUtHnAgJzJ5Rg+k01NL2NWJJfJeF2Y4/BnA
         3MVqtmjGalzl11GX+6UifK0pmLzo1UUe8exqVWT4YnBWJ/fFx+9YB8LBmrKtXa6mraoh
         pptKxuPtCxxgVVucdzN1/cp36ebCHQP5bNhS2zwynIizAPEqK7K/OdBjEFhnWqdt4FjA
         u3DJSp+YD8mI2j7lwaI0dcobl6/E7ZvQ9ecokC9F5qDgkJmwguHPzhtlT0T6URETqG8F
         7TwYzHU276DFcqYMrF7EyH5KgDbTvaCByttZ0D62Dv7aQvM6sKMJvBt8wHKkNuJfyYWf
         S54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732531175; x=1733135975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8OhzgakllOt/BYVTCD3D7w2syEdoR64jT57hKrcwGI=;
        b=MDMHhkjHHmHTqm2DQbuafnYP3sP+FOaZ7iNsPYHbRZxuIILroA5+DuH7Vjam3zwMBh
         n5NnWjkbxv/B9rTcT+H8fUzdOc1BQEenJcTfs4fPrhoxceBTnVXVf3ACRW+U0NWKiYRH
         kyTL+WOD/L4p0c3hQ7nyT7tgADJrYiVXsO2mtU6O0c0ATlw184uLVzsyCpgul0eTq/5W
         XX+Np+qU16HQxM8WUGB1bCovHUMtCNPWSje839fh95NCy00L5iIU+BxDEPNYknT0+aXi
         J56VG9gx10sdOX48Vu66rZgyJHq5K9mn5Wo/DPmY0qq9DX1gfQwKNtEDHSyeVQaNMzBc
         RKRA==
X-Gm-Message-State: AOJu0YwDNkm5PRg9BtPD1yVnnvraByFSZ03Kt2vbrZbaMjjMa4nw9Z9T
	GtKeJGDciMZ76NY0YgI1+EEOnPcvur8VNLXP6HPdSBoLoZbuC38RnWsxfCUOCb8ndFFM0vEUc4x
	3bDWtg+6aZn/nIzgWil3hLHwu2Lg=
X-Gm-Gg: ASbGnct/ZDbKrjSCfz55pve0Mvleu5tR3Xxiz7N2hwguL+pPHeVhFozoOmvQW8FkQwI
	wiLhUQdLWJaZPEXrw2++Swsh0B/KKUTTPMzI7gzHoWHDYw9XpfCkYfEjHdW+LRlH6FQ==
X-Google-Smtp-Source: AGHT+IF1EnQHJp9OQsAsYPhFl9apIOybC9pyq3//Pb96cbwSFb9gqn68fh9XWulUew3rR4Vk2Fwo4VnJmEpUNb3P7jY=
X-Received: by 2002:a05:6214:19e1:b0:6d4:1a99:4279 with SMTP id
 6a1803df08f44-6d4513538bfmr179278046d6.39.1732531175240; Mon, 25 Nov 2024
 02:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20241125102227.1216656-1-ejo@pengutronix.de>
In-Reply-To: <20241125102227.1216656-1-ejo@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2024 11:39:24 +0100
Message-ID: <CANNYZj_YG8Enba=QM0niqgw0TFj_yojC8-f1rA9pBja=z38PxQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] barebox-tools: upgrade 2024.09.0 -> 2024.10.0
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 10:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207730

Already in master (but barebox is still at 2023.09):
https://git.yoctoproject.org/poky/commit/?id=3D10a2dd4d67d57e8f91a2814cd613=
71b6cab94044

See what I mean about not enforcing lockstep updates? :)

Alex

On Mon, 25 Nov 2024 at 11:23, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:
>
> Regular barebox release.
>
> Changelog: https://lore.pengutronix.de/barebox/ZxIdBi3xLj0dHqzi@pengutron=
ix.de/T/
>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>  .../{barebox-tools_2024.09.0.bb =3D> barebox-tools_2024.10.0.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/barebox/{barebox-tools_2024.09.0.bb =3D> barebox=
-tools_2024.10.0.bb} (93%)
>
> diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb b/meta/r=
ecipes-bsp/barebox/barebox-tools_2024.10.0.bb
> similarity index 93%
> rename from meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
> rename to meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> index 13a308b3da..386656f7ad 100644
> --- a/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
> +++ b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9=
ca1f0d3364286c4192"
>  DEPENDS =3D "bison-native flex-native libusb1"
>
>  SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] =3D "4d4ea7e232aeba2b3cb9ccf0dbf8cd8e01c65b6c615f64c3=
bd0c4f24f23a47da"
> +SRC_URI[sha256sum] =3D "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16d=
ee7442d71a5af88d"
>
>  S =3D "${WORKDIR}/barebox-${PV}"
>  B =3D "${WORKDIR}/build"
> --
> 2.39.5
>

