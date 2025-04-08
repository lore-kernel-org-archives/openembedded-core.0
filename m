Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4351C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 09:00:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.70790.1744102808484433123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 02:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PL/FNm08;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso34953045e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744102807; x=1744707607; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/B4ITZ6FTHzk66Srny9f2vb7lW1u05e8l/4JlYIMTAg=;
        b=PL/FNm08cifJugGqMvkCanQbJP8ZNi9KldN88a0q47NiwH68168jBlDjv8oFpsWyLC
         9m4ZLWGgbaMTPx5cgk1xwIfzBDoQB1Yyo4L3gaRzpq1jKnwRQ22YE+gar1+wsNj2mDmt
         3IghoZBHmJhww8MpZp625VoCC54bzzFMt1Rws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102807; x=1744707607;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/B4ITZ6FTHzk66Srny9f2vb7lW1u05e8l/4JlYIMTAg=;
        b=TFAa4x02DK5wzkptyjI4kgnNFcGwJarUXVR91iUzRm5/9nHpbhiA/8tufnH+v8AK5g
         ezZGnIwP1BH6xisBWXc6jXK2WJYdeBJnwlw9C0nH04kIw5NSSbh2kMIJaP1u+0MJjFRW
         lGOcx1DpzyBmG8I1iMeKEpVqZWPLYP0VUPJu5RAHJnpCoWGvDemes8dtRLlLcZlepDVB
         NVjcQYzFDKMY/5LfhNgj93pD6dC5Xz7qzbdSQBhULgByGtAlDaEvoGZnOqrxsaoelHub
         81bAJUUwaqry4qmXXMOD75lquxug2W5EG6XZXcxYVx6GJ9xxluDeqtdlwCpZzByR1beg
         0lLA==
X-Forwarded-Encrypted: i=1; AJvYcCV4ikmfHL3KUbwT1X7itq4756QQBzBqutoOEDKqu7iselt1sYJAku6DynvIt9rFeMWwBpY1syGr3K5ZpCRRxzwMIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YznzgTEdmvDJ2sJGurz6lu7CepLQ47R4ScaAgtZSnYv2b7P10oc
	3h7tv9TyF/rSrATzovgHe/CMysEk8ymN84Ue4/6pLUxVLbTdeH5tXfqMciKLVWI=
X-Gm-Gg: ASbGncubeE05fMCeN5W2ZUtXgYxbqFmHkXDWrTnRklBle1xgb/0SQRa5CKRVcZgWqvf
	ekRfzfk49AhidIl61wDMxnwwlKLQM9rv0eSILqmiwsfo26EDKOxIMHsfBcr8JyMm1CCT3urL+Zw
	tYlYVV8GRag2LzSlEWPocax/gXcvhtpA9wX0d4Dgqis04KBVEo6xfYF4vWyPqEjO93xnzj1TQvE
	xTJcqz/4Ef+2Fv4YMbZ81Tc54oeJjkPuSMXeTiDhcNpOBhnQ0bgMKihU/YMnqXvy8hKYC1ETbv3
	oq1wQJpKkIASjQW9JNaMjSDkBtk/8WvM+xRHiSGkQ+RTJdBrJL9TE+BHHAdjqJVnJoKSgQT0X8t
	3JqyfO8wPOz5UJjBavOoqT0fyvSjA/vfGqw==
X-Google-Smtp-Source: AGHT+IHdO05XsCalYUWFgcbO4maulUXx3HsLtVg/umRtrFa8S65Z+liZaXQWmzHvXRWrlnSh+x0iQQ==
X-Received: by 2002:a05:600c:6056:b0:43d:10a:1b90 with SMTP id 5b1f17b1804b1-43ecf8d27dcmr122511245e9.16.1744102806697;
        Tue, 08 Apr 2025 02:00:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9d50:bfdb:2e5f:afc0? ([2001:8b0:aba:5f3c:9d50:bfdb:2e5f:afc0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec147c9dbsm161600815e9.0.2025.04.08.02.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:00:05 -0700 (PDT)
Message-ID: <e20b2f4791b7481a018ce2c5d3cee9ede1a88fe9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot: set git repo branch with SRCBRANCH
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Tue, 08 Apr 2025 10:00:05 +0100
In-Reply-To: <20250404075136.385270-1-mikko.rapeli@linaro.org>
References: <20250404075136.385270-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 09:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214514

On Fri, 2025-04-04 at 10:51 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> Enables changing branch from "master" to "next"
> when building bleeding edge upstream versions for
> testing purposes. Now local.conf setup to
> build latest "next" version becomes:
>=20
> INHERIT +=3D "poky-bleeding"
> POKY_AUTOREV_RECIPES +=3D "u-boot"
> SRCBRANCH:pn-u-boot =3D "next"
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp=
/u-boot/u-boot-common.inc
> index fc860248ed..9e96c46b74 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -13,8 +13,8 @@ PE =3D "1"
> =C2=A0# We use the revision in order to avoid having to fetch it from the
> =C2=A0# repo during parse
> =C2=A0SRCREV =3D "6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72"
> -
> -SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster"
> +SRCBRANCH ?=3D "master"
> +SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3D${SRCBRANCH}"
> =C2=A0
> =C2=A0S =3D "${WORKDIR}/git"
> =C2=A0B =3D "${WORKDIR}/build"

I do want to be able to do this kind of thing,=C2=A0so to be clear, I do
strongly support the idea.

I am however worried about the implication of how this will scale (or
not). If I merge this, I'm likely to get this change for many other
recipes. I also suspect people will want to parameterise the
"source.denx.de/u-boot/u-boot.git" url part too so they can use their
own local repo.

I can't help wonder if we need some other mechanism for this. I've
talked with Joshua about variable "filter" mecahnisms before which
would be one idea. It would also be possible to filter the variable
with some inline python magic, in much the same way that the code
already tweaks SRCREV to add AUTOREV.

I did also wonder whether our mirror rewriting code could be used
somehow...

Cheers,

Richard





