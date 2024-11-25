Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC935D58062
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 10:53:02 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.16213.1732531975529758924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 02:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SDbA4avh;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d43e034ef9so35229676d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 02:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732531974; x=1733136774; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SC1tjxKNNqMLit6mgX+DaIJUDCIsSDiraVpXEvXi/Xc=;
        b=SDbA4avhEsN7HBVXMWe3Q5CUhGhQ0NyrBfuJnUtskTVPVKEVOwDdszuMqzdpvY7pPR
         j8FTM8MYZqhlWrz6GSrsGCYQK7ofUEKGw0fL2TZjPfYi6hV6+Ubxwz4DIyeu2udmcCdb
         IQNLkTyyjtq8uTQwowd4nRe8ajiA9mVddb5DUG1ybUoNuxYsrIEI/PYgITOCUtjJFdBX
         fxY0Vy9EPf+8KTaxz/sgwvGvOhd3FAZW5pvwImJUdsB6mNqG1WW5HS+BCCMKNYi4fkAA
         cCLO7OodC6U+UNT4V7nFJvVqgtWinvCwfW+FAvMSf2IeIUksGTkAqMaXnEQBQzsBiIoW
         5XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732531974; x=1733136774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SC1tjxKNNqMLit6mgX+DaIJUDCIsSDiraVpXEvXi/Xc=;
        b=FP5MFQslCt/rDO8lYhroZYVwR6FMT5xoQwqN0j1Q/LmWRQ5hzVPI0geIZukPcaN3P2
         H4he3wl2XLRS8P63GT4t69Iho9CYJe7tG4FBzna07xWnwwT3DEG1c53R/hhoTLo7FbNG
         2Eko6ksSVLneeFo+b261avtvB6UkLLMmHEXfJiu6WpzLWuI6tgrsvE4j/otxyQjhDj4w
         U3V2/nj5In9H9XTcKje3HTb+A+WBbxgPxPHJT/qBv/2y6RVDy0cmR6EP7it6uLwFIMqW
         5Qpn0mKGfh4vk4PGEwF8Y/NVMinhlOOgv8ay6YUq5gTnm6DiBpX8pi/gqNwGEAMZ5M+/
         JUIQ==
X-Gm-Message-State: AOJu0YyxIEvQC2zxRbjgKxnJ8YaWnxInbM/pJtZ7qmT51SLISJkj1LrE
	ea/Lzj+uvZtK57wHe0TusS+dVfpYxEe0ol+zN2zSMxcgwJLVk7yM+swqPyG21psYLo358Ud8y2f
	yFtAfPPaJTt5ofl1ATEvN0UXE0EQ=
X-Gm-Gg: ASbGncu58uD6gTRvEVrY3jEc76ZimjiIuBtq0/B0eaBgcKA7hyxZh9ybu1M7SpQjQmh
	VLTj6bRQVpfTVWuHlXdmoqVgvYPROW1NupOjYyQDSLBcK+5+iv1VFgyNgffhG5qtLyg==
X-Google-Smtp-Source: AGHT+IGU3bzX7afe9kLcNoO5pk3meDurIs/R6ru7HP0jdxwd4XBbHM+XQQCnOO83Tf1hURx/CbMpstxRzKZdorsCD/s=
X-Received: by 2002:a05:6214:2b0f:b0:6d4:1dc0:2616 with SMTP id
 6a1803df08f44-6d451362048mr187425306d6.47.1732531974646; Mon, 25 Nov 2024
 02:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20241125105132.1338770-1-ejo@pengutronix.de>
In-Reply-To: <20241125105132.1338770-1-ejo@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2024 11:52:43 +0100
Message-ID: <CANNYZj-4RLcJ6O==sc_DCx-mza1Dfp=eptkWps4JLD2Bo3Rgcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] barebox-tools: upgrade 2024.09.0 -> 2024.10.0
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 10:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207737

You have missed my comment from v1 :)

Please rebase this patchset on master.

Alex

On Mon, 25 Nov 2024 at 11:51, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:
>
> Regular barebox release.
>
> Changelog: https://lore.barebox.org/barebox/ZxIdBi3xLj0dHqzi@pengutronix.=
de/T/
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

