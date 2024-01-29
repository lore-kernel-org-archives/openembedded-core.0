Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FE3C47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 14:19:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.16020.1706537973032772470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 06:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V5wMYv4Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a358ec50b7cso215805166b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 06:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706537971; x=1707142771; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLJxWIRdue4kEEKhGOw82BQDZdqk7HfjZZMaKw9me8U=;
        b=V5wMYv4ZyMbXfpislzf7xsLa/QIjOLtf6NX/mn289vWDYM84ayjReL3wEU6190CprJ
         7l+KNOZSzdJM43Dcjxqy8ycF0lNyQuP54AoDTDtXki51zfyoKS/wiIfCN+Dg9eKzaqOm
         kGoW+uO2iZrPS1ajbFncjFvzDAi+7C40COZMfgVyX6cpQ7/EeWANJ32958bpOs6+vxIV
         0pI/gvIVZqOCq9mDmL6eWvyTHu9bhcYnoZcjZkroSBzsQkOqx/oFqe9SvAwbZ3n9iRuQ
         keoK6gXK6Hdf1lKLk6y5ZOIR4z5MV6wkQjqTfzudk1l3SN7lyAqU+KD+tEvhA00Bl7JA
         I0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706537971; x=1707142771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLJxWIRdue4kEEKhGOw82BQDZdqk7HfjZZMaKw9me8U=;
        b=gQWNKNbKhwSuDqw2eXyQIF2+Q+rpX2zohapx7/mlgv1LvMCAsVerqVcW/eLFp36yFF
         neCaHdGhgp+PgoGNGnYsEIKVuFDgosRIAKHllw229m6KJfbZw+0rHDxM0P2te3QUsThR
         Nb9wRpvoTV1KqbTzSJLYDT1PXVA3Ei3doc9+QFlAANfkSdZoBiZ53jk6nypcd6+IzBbl
         zgx43kdJ7qTJ2KMZNylvAs8rCjtHBWqescBX5BDVwDPeyyb2AYessxNOuTjFT6e70Zg2
         eXfloA84agsBX/zBdpR5TRLoro0vdLrqh/ToUgQvG9YrxQFxaLjXk/TRrObPjti/XXEI
         Fp+w==
X-Gm-Message-State: AOJu0Yzv1ulmu603mzAbnmQ6kjB2i1q9mGjn1+TL0Lbt/Q3had8ryaFD
	eS01z9H5KjnEWXNfWNw7iRtW4vbcxrtOGdJ3dQB6UTKqAz0reAEj6bBE/+0D5OKGisOF+keJiiV
	65zo8T3sGbyT7EKW72oNccAxZ7J6U50dKSwVqHA==
X-Google-Smtp-Source: AGHT+IH2tGmERxvW3E3+ouNshkIe405fNykjmlHgmKilMmhWxO52ld1F7K6vlIeaadOl4KDmHYmehF6ou3yUbgwxNwI=
X-Received: by 2002:a17:907:1608:b0:a31:1a10:3b1d with SMTP id
 cw8-20020a170907160800b00a311a103b1dmr7507609ejd.7.1706537971245; Mon, 29 Jan
 2024 06:19:31 -0800 (PST)
MIME-Version: 1.0
References: <20240128165358.657852-1-peter.marko@siemens.com>
In-Reply-To: <20240128165358.657852-1-peter.marko@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 29 Jan 2024 04:19:20 -1000
Message-ID: <CAOSpxdYH5AYuEQ3P3dzMWXZmEkaC5D02XLsaNzk+f8vvG89ZWA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] sqlite3: ignore CVE-2024-0232
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 14:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194461

On Sun, Jan 28, 2024 at 6:54=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> This CVE reports bug which was fixed in 3.43.2 by [1].
> Code analysis shows that it is fixing caching issue
> and this cache was introduced by [2].
> This landed only in 3.43.0 so 3.85.5 is not affected.

I think you meant 3.31.1, not 3.85.5

In cases like this where the database is in error it is best to send
an email to cpe_dictionary@nist.gov providing the above data and
asking them to fix the issue. They are usually quite responsive.

Steve

>
> [1] https://sqlite.org/src/info/5b09212ac05615fc
> [2] https://sqlite.org/src/info/2dbb22c75e86f2e3
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-support/sqlite/sqlite3_3.31.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes=
-support/sqlite/sqlite3_3.31.1.bb
> index ef12ef0db2..b2d8f9f1dd 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
> @@ -25,3 +25,5 @@ SRC_URI[sha256sum] =3D "62284efebc05a76f909c580ffa5c008=
a7d22a1287285d68b7825a2b6b5
>  CVE_CHECK_WHITELIST +=3D "CVE-2019-19242"
>  # This is believed to be iOS specific (https://groups.google.com/g/sqlit=
e-dev/c/U7OjAbZO6LA)
>  CVE_CHECK_WHITELIST +=3D "CVE-2015-3717"
> +# This was introduced in 3.43.0, 3.31.1 is not yet affected
> +CVE_CHECK_WHITELIST +=3D "CVE-2024-0232"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194444): https://lists.openembedded.org/g/openembedde=
d-core/message/194444
> Mute This Topic: https://lists.openembedded.org/mt/104014792/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

