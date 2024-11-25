Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF85FE6689E
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 10:40:12 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.16046.1732531209761522601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 02:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1rRPxYm;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d842280932so17524806d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 02:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732531209; x=1733136009; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkzL/yAlOGfAcCoV0EZdZPPCrTzFM3n3Z2VfjewyfB0=;
        b=U1rRPxYmgHgHRuVUeHdrio0+jjj71iyLL7MgxQiEJaq2UUO0bo8vkuvAnkJMnQ7VCA
         UyYUWwzwo15cqVk6mp1AoCvmlSx0Mr098cZUWjpCp1K/cz48AyO89QfB9bVLvHHRnd0G
         ZhwZ9xbJmPjpNgkgoPXIG1YFsh7HQjMz0JtD5Q+bC7rP1oAB8QatsJWJVehOaYlNxPhl
         rhs7g0ame6v5YQonvuUzkNoZbeNfTYpcDcSeWnPoL7A4SQUlAUvUxmo3wVJxXpBRLH6t
         k0FY2YJYq3XmH7fMTpf1aomWTU4w6R7KdMw+hgbwJHmt+tMh604sQCLiMnsWe8sfDhG8
         vCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732531209; x=1733136009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkzL/yAlOGfAcCoV0EZdZPPCrTzFM3n3Z2VfjewyfB0=;
        b=OeFNHjn6xn0HF7HFuydTNQwsAS8o56x7FqevToNoPOVbF//YvEZ2M7sTqYPy6jh0ms
         E05ktKLzqyPM5UH97WQ6ojyoXHtoLIFtftyAWWwi6waFp2y6uIC01Z5llfPH8G9TlrrI
         lKJu89BrULxmjX5Ai5BzhZjSsHBAU0Tt94GWMKnvzpHcvPvsaIcyvZAS23b+XNLlJr2i
         IWslNirx8QeYwISb9bZ/RQ4yPNJi22KqrHsKBYfKU+DCluZWtZIokdUwt0Yty+b8QKOk
         qzcDrvK+5lkzdUzu5jNSV7brfn7gUz8aufwq/NOFPRlT2PMn29cOTRTBqiok8Nj0MV18
         sz5A==
X-Gm-Message-State: AOJu0YwNRBuC9ae6B+lOdMmFhkwV0wz681axWPJoEnE7/5uNJM4oDGO3
	5I7eHSdSzpBMejPxaLkSP/k//J/cdiWKH2Gt41dciRT7teAOn0Dvz72y5/zFszhgL5J1XnXiKkf
	5AKjgyFJ3fCKiWQp3W0z2TdjXbTM=
X-Gm-Gg: ASbGncv1MT8CzJC8gZwJl0ggXe/XVgZz7wqfCPEb4a2go2tUVcY/VFzOZgzwgnD5r2h
	kQ0UeRsyKjwk0P0BaCtK0PFmxUEPnowjFgXOBiEVYl55tv+mXqJb6zocooPww1s+CNg==
X-Google-Smtp-Source: AGHT+IG1C97qOHZ42G7P6pw11/FU97DIvw1E1pyf4iF3PrYkXvv15xl2VsZMqPAbwgoM5OXoMNTSckl2n3HZnh+QYt0=
X-Received: by 2002:ad4:5aa7:0:b0:6d4:27a1:5e94 with SMTP id
 6a1803df08f44-6d4513867c3mr223372576d6.49.1732531208851; Mon, 25 Nov 2024
 02:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20241125102227.1216656-1-ejo@pengutronix.de> <20241125102227.1216656-3-ejo@pengutronix.de>
In-Reply-To: <20241125102227.1216656-3-ejo@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2024 11:39:57 +0100
Message-ID: <CANNYZj-gecZZxzQfHNuBgo+3P+u-YZ6qL-TaJ2ZfVq1cgTrh3Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] barebox: move version checksum to common .inc
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 10:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207731

The actual .inc isn't in the commit.

Alex

On Mon, 25 Nov 2024 at 11:23, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:
>
> This makes it more obvious to update barebox and barebox-tools together
> and should help the AUH to update both.
>
> Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>  meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb | 3 ++-
>  meta/recipes-bsp/barebox/barebox_2024.10.0.bb       | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb b/meta/r=
ecipes-bsp/barebox/barebox-tools_2024.10.0.bb
> index 386656f7ad..25d6a5c062 100644
> --- a/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> +++ b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9=
ca1f0d3364286c4192"
>  DEPENDS =3D "bison-native flex-native libusb1"
>
>  SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] =3D "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16d=
ee7442d71a5af88d"
> +
> +require barebox-version.inc
>
>  S =3D "${WORKDIR}/barebox-${PV}"
>  B =3D "${WORKDIR}/build"
> diff --git a/meta/recipes-bsp/barebox/barebox_2024.10.0.bb b/meta/recipes=
-bsp/barebox/barebox_2024.10.0.bb
> index c886fcfba3..aa63be4080 100644
> --- a/meta/recipes-bsp/barebox/barebox_2024.10.0.bb
> +++ b/meta/recipes-bsp/barebox/barebox_2024.10.0.bb
> @@ -14,4 +14,5 @@ inherit barebox
>  SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2 \
>             file://0001-lib-lz4-use-lz4-instead-of-lz4c.patch \
>             "
> -SRC_URI[sha256sum] =3D "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16d=
ee7442d71a5af88d"
> +
> +require barebox-version.inc
> --
> 2.39.5
>

