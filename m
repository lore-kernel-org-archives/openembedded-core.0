Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F40E77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 10:22:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.56468.1736158947406253628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 02:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g301g6qy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43621d27adeso98000315e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 02:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736158946; x=1736763746; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPKy5OwcsU07BzRZE8a0YA5qfHrtWqaODCfdTghSHrs=;
        b=g301g6qyN5TWZ+mLJZAlNZc/RK9HLz3u6kKeQi/Pi/Nnt2RzSFySqkQYCWaVIujaSd
         KWUDTqkf96iDmLOISfaz7CH+C551c6cTKumUYr2/EPgMZcvcalfT8ceX8lsVTJGnOduX
         LrIXk8Z1vIu9jCZixBLWfNQYQbZNn6Yzi/0SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158946; x=1736763746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uPKy5OwcsU07BzRZE8a0YA5qfHrtWqaODCfdTghSHrs=;
        b=VOHHKg2s1voHmHxIB2NgITdztk7bMKrjoElcZ2BvAZznRsP7bD5KJ1PicHjpcS1IU5
         18pgc1jmQzlAVvU8LAM3W8BJVlETRBT79Mv17J2MAPfDJkrZLxZPPGJ7VxeXRppcfVWG
         iySj2O+yRwJB1HdW25+bh25hmyQIE/iLHZS9fABYxZHiJDpVOZNl8J070PtHisMg41ZR
         3K8gc3mSJAso/gXhNfNgzdny1PbHb0Fr/KAcF2pZQpPFGps3zpYVjqQiMepZiznYzqvb
         Ek/qcOxxMHco7ta/vFo7vDMZeTWGqeVWkkjk7yBGI+T6ISA/Dc19pHKLoBZbMmyUp68L
         8C/A==
X-Forwarded-Encrypted: i=1; AJvYcCWDd4MK/LYB+79cMuAIVtAas09uehlQA/hunLA/cMMI5F/XqIaGHDdrlx3gf75J5cweL4/iOWnVgWUktfS+ukrv5g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxP9bkXy2dx5ziHrN94zTKOI03cwhl2rODAhMhlf1gtOO0YLz3v
	MNUyTGGYI+FC6ruEMxQVEjA7ouByVql1e8tEFCnZjD6xgIucWp5kOYke16XkKCY=
X-Gm-Gg: ASbGncsr0JihRwiCwH+N6Nq5NFN3n43u2diiDzQ4cglvD6AgM3i826uRTPwRgrllYS5
	Mu+1ktLVZEcyJnDZT+f1G3oEiXDI7QprHu7suZLPhfu/wMb+0ofV9bnl6nBrkLV3k9Xd9TahCy5
	gSBlqyD+BNd0uMtD2Tsd6DMbmInzqdAr66QcmJLfxzoAlUZH1wJG/7GaCfp/dZX3FZl1eyvz8oO
	UH0Oehp/26K/JkrmYnYpb1Ky2UtgLELZVtWunQYNsKjOltuvsfbpFjb+ICOwT+z7Dz9ILR7fWUt
	T28k7AbfNgxfv3PF2kdNigFY6wliBJ9pNTvG2DWVlX0xCQ==
X-Google-Smtp-Source: AGHT+IFjGaqNweeeFRL0/DM89z+I02skubpgPtPtcPYhCllCg6x5eon4YRvFYvCD8mbJI6lQHA5SDA==
X-Received: by 2002:a05:600c:3b23:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-43668b49a05mr427959205e9.21.1736158945651;
        Mon, 06 Jan 2025 02:22:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3607:7267:e27a:36e4? ([2001:8b0:aba:5f3c:3607:7267:e27a:36e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364b1516bbsm436061135e9.1.2025.01.06.02.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:22:24 -0800 (PST)
Message-ID: <afaadd6dc85a15c95a6ed3b5302800abaa0dd527.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] pseudo: Fix compile error on
 centos7
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: guocai.he.cn@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 06 Jan 2025 10:22:24 +0000
In-Reply-To: <20250102054451.500564-1-guocai.he.cn@windriver.com>
References: <20250102054451.500564-1-guocai.he.cn@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 10:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209424

On Thu, 2025-01-02 at 13:44 +0800, guocai he via lists.openembedded.org wro=
te:
> From: Guocai He <guocai.he.cn@windriver.com>
>=20
> When host is centos7, fix the following build errors:
>=20
> In file included from pseudolog.c:21:
> /usr/include/sys/stat.h:366:31: error: array type has incomlete element t=
ype
>=20
> In file included from pseudolog.c:21:
> /usr/include/sys/stat.h:366:31: error: array type has incomplete element =
type "struct timespec"
> =C2=A0 366 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct=
 timespec __times[2],
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~
> pseudolog.c: In function "parse_file_type":
> pseudolog.c:214:10: error: "S_IFSOCK" undeclared (first use in this funct=
ion)
> =C2=A0 214 |=C2=A0=C2=A0 return S_IFSOCK;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~
> pseudolog.c: In function "format_one":
> pseudolog.c:754:43: error: "ALLPERM"=C2=A0 undeclared (first use in this =
function)
> =C2=A0 754 |=C2=A0=C2=A0 printf(fmtbuf, (unsigned int) e->mode & ALLPERMS=
);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~
>=20
> upstream commit:
> https://git.yoctoproject.org/pseudo/commit/?id=3D15b4f4ca25593f684e6517d0=
b809605b443d1953
> When the host is older system,such as centos7, this upstream commit will =
introduce=20
> the build errors. To add "#define _BSD_SOURCE" is mainly to avoid issues =
on older=20
> systems that do not recognize _DEFAULT_SOURCE.
>=20
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/pseudo/files/glibc238.patch | 14 ++++++++++++=
++
> =C2=A01 file changed, 14 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/rec=
ipes-devtools/pseudo/files/glibc238.patch
> index dfb5c283f6..9a7cd3744d 100644
> --- a/meta/recipes-devtools/pseudo/files/glibc238.patch
> +++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
> @@ -28,6 +28,20 @@ Index: git/pseudo_wrappers.c
> =C2=A0 #include <assert.h>
> =C2=A0 #include <stdlib.h>
> =C2=A0 #include <limits.h>
> +Index: git/pseudolog.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/pseudolog.c
> ++++ git/pseudolog.c
> +@@ -10,6 +10,9 @@
> +=C2=A0 * we then don't get S_IFSOCK... _GNU_SOURCE turns on everything. =
*/
> + #define _DEFAULT_SOURCE
> + #define _XOPEN_SOURCE
> ++/* This is mainly to avoid issues on older systems that do not
> ++ * recognize _DEFAULT_SOURCE. */
> ++#define _BSD_SOURCE
> +
> + #include <ctype.h>
> + #include <limits.h>
> =C2=A0Index: git/pseudo_util.c
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0--- git.orig/pseudo_util.c

Whilst this may fix centos 7 I suspect it may break other newer distros :(

Cheers,

Richard


