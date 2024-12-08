Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2059DE77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 22:33:38 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.88029.1733697212446015552
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 14:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DPjPA2EL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso1836940f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 14:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733697210; x=1734302010; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OHOtWzkNuCr/8tWiEOXwaujvIOj2CIXH0B+Vn/kmLJA=;
        b=DPjPA2EL3eA9J7xLCF4NvEKipwYB/Am3Pp3ybmN6WpbOSQppY2noFUxN9b4pFkBEkc
         AiatAAtB4LFxtYNaJWuYtVi8Uwf+dE2YcZ/yKw5/MGNVqMFZTZjFa0DF6/yMrHJqUhYS
         xPg2sYVM2lXilLOhOv8WbT++AnLvz6+p7Z7A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733697210; x=1734302010;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHOtWzkNuCr/8tWiEOXwaujvIOj2CIXH0B+Vn/kmLJA=;
        b=tYekWtZfQslp+MY+HdGXb14lXV1PN5p/x7KR+q2/mxK0Nl+Dx5GLq7ZhKunq4mcxmz
         5jIdJkM0pWKMLtt2OL4VjHM0Umi4uu+uKt3UEFekJLNvaG8vbuhBXcd8wIEjftq1gFF5
         X+k0q//Ugn3fbklVJB8rn2RCLGeJ6Kny85lqvo0095VGV1wrYIoOcQCkJBUL/7LiN11f
         8N8JGrDiS8spaFXmJIFZeNd7ERrcRl3wXoMA1hBH7GykArP1X7kynVyigf6RVcqD1lE4
         blLF2NgF4/c9QA1tHTd/XlpmLyKVtXKT5MQMtMI/lFc80ENVeRAAUyjC980rqxrWX2zP
         MgBA==
X-Forwarded-Encrypted: i=1; AJvYcCUA9AbmH7t3w3N+w/Fm5G6VzdHb+m7p6bCwCObBPD3O7sbr8WSEl5WM6J9Ok0daJ4rQEKoKQyp/CQGndwwOX4a4Og==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVNOWiOhsCFfKDjTUrqSizN2C+0zy4fKvmx+i/mPAn2EQ5I9nS
	46e7floCwgsILhGQCu9KRnNGA5HniF6wKUhLekHTd7arIX+GBuEjtX8R2MDw+WM=
X-Gm-Gg: ASbGncs+ZTaoc0dctenCXlEgcgoZuY7XEWAgzI48wQFmEL2TVzfJc/ZJpzcbrzjs37i
	HuYg8GPbqN8LXeUurRXfx6CzsN0kj/BlHRDofNHNGVEFjtoqMVPAG56jff5JKxb0PJA3tuoco1f
	syNLaUYjPmUTnjTaPkBaLh+B4xD1qGAzqTxbUh05W9UuSkmlogO/wKLAQ/lH6xgwTRbJ8RyjEYW
	v/pvDUUzpuwUshGmVfxwCfAlaCiupwtnpmEtlls5B6CxoAXokmmfHQltGyUYTI544KtU1gsOHyy
	rPwTCTmpaWjiPa2WrxlsVIxAbKfiMcpdZfFhXhI=
X-Google-Smtp-Source: AGHT+IGgNAcmVx09uNEfuz+HyZBms5CGp3zpo6UlbwUvGpE2x3VI8m1rgb9gWaqkcWu8iuXYh9rhZA==
X-Received: by 2002:a05:6000:188f:b0:385:ef2f:9278 with SMTP id ffacd0b85a97d-3862b33d0e8mr8517990f8f.2.1733697210486;
        Sun, 08 Dec 2024 14:33:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c1d1:82c8:bc8d:a69c? ([2001:8b0:aba:5f3c:c1d1:82c8:bc8d:a69c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219095d3sm11386678f8f.71.2024.12.08.14.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 14:33:28 -0800 (PST)
Message-ID: <9542a6bea33f418d5cd4fbb7159cf95b9096d2e8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: fix xxd-native RPROVIDES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: denis@denix.org, openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Date: Sun, 08 Dec 2024 22:33:28 +0000
In-Reply-To: <20241204230907.43936-1-denis@denix.org>
References: <20241204230907.43936-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208471

On Wed, 2024-12-04 at 18:09 -0500, Denys Dmytriyenko via lists.openembedded=
.org wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> BBCLASSEXTEND doesn't handle overrides with suffixed ${PN} for
> native class, e.g.:
>=20
> RPROVIDES:${PN}-xxd =3D "xxd"
>=20
> becomes:
>=20
> RPROVIDES:vim-native-xxd =3D "xxd-native"
>=20
> instead of:
>=20
> RPROVIDES:vim-xxd-native =3D "xxd-native"
>=20
> This results in "Nothing RPROVIDES xxd-native" error when
> something RDEPENDS on xxd-native because there's no such
> package as vim-native-xxd.
>=20
> Use ${BPN} and explicitly handle RPROVIDES.
>=20
> Since native class does not produce packages, other variables
> using :${PN}-xxd override don't matter. And nativesdk class
> is not affected, as it uses a prefix, not suffix.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
> =C2=A0meta/recipes-support/vim/vim_9.1.bb | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/v=
im/vim_9.1.bb
> index fee9f055e9..8968b8cb07 100644
> --- a/meta/recipes-support/vim/vim_9.1.bb
> +++ b/meta/recipes-support/vim/vim_9.1.bb
> @@ -11,7 +11,9 @@ BBCLASSEXTEND =3D "native nativesdk"
> =C2=A0
> =C2=A0PACKAGES =3D+ "${PN}-xxd"
> =C2=A0FILES:${PN}-xxd =3D "${bindir}/xxd"
> -RPROVIDES:${PN}-xxd =3D "xxd"
> +RPROVIDES:${BPN}-xxd =3D "xxd"
> +RPROVIDES:${BPN}-xxd-native =3D "xxd-native"
> +RPROVIDES:nativesdk-${BPN}-xxd =3D "nativesdk-xxd"
> =C2=A0
> =C2=A0ALTERNATIVE:${PN}-xxd =3D "xxd"
> =C2=A0ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"

This implies we'd have to go and change every reference of
RPROVIDES:${PN}-XXX to the new pattern which I'm really not keen to
mandate. I think we'll have to dig into the native class extension code
and try and find a better solution :/

Cheers,

Richard

