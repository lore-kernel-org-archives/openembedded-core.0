Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45109C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 18:39:17 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.2290.1745433555966032604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 11:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bFhIVv4x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso114623f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 11:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745433554; x=1746038354; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o1PPQWysd6f6b03ryZVZdVW1P7rsFteszAJvgXW39Mg=;
        b=bFhIVv4xTIn9HyAVAZVErVUxWUbLg3z83+Z2WFAocy0r4BLVV1802X4A6KO/Zoa84v
         GVAysgXkRmuqQ77yXKcMvaJFiD13UAjkrISZUigXwzl5znE0AsLqNMQXRELtar8+P9zQ
         U0/DQRgFcczfZdcaevr7Kawa/IqZfZnFUlwf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745433554; x=1746038354;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1PPQWysd6f6b03ryZVZdVW1P7rsFteszAJvgXW39Mg=;
        b=mOV7UakcjSoqya24SY6ZlO0z53Zm7/yBl9vPV+RlcKegKJSf69HUuAgm0hbYeBcVjp
         7ZDNC9HsrvmQfE7DM1N/Y8srZT0rdAMQoOPgcKEI/EiQH/NHbOqbO+rtPxqLTdbg9fqk
         h5COD1E7dnCGiiW+Yc6VkcRY+yHf1fw4/jsI7XQGDhEefKopdkklzm6ZEMbHpJ5rCayK
         wkwgetmYa2cQXwnyj2/8B77eQJeRcLeMZpH3v41PrrrZ6Rsl1GxJu+iZKAyghAnAE6dG
         F+2CkX6IguoNL7E43XXXa5ZJtl5Txlcrq40suf4KEAdrITiSj/B8khFgUQ7st+4iNK4B
         Nr0w==
X-Forwarded-Encrypted: i=1; AJvYcCWPS9M3axzXMhWGpiYvoosiNFpTkBBpA8iwwVMLiYyUuX0RnQcEGFoEzTXhitxUZuUEzZV+YBa7gDk3RgcElIo+aA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwX4Re1VMnzawBb/pbAq+5DDG4NTlAuj8on11DsmPHzjOTyZ1t3
	Z+oPGGd/WmBs56Nrg7YR1VIYKluIEzyu3CI5DTiHEJxTc6KnbTMnPicrT0KK93M=
X-Gm-Gg: ASbGncsPPj0nEvxLhcehajkPirc2ltRFSsVkWjQWue0TveYPxNghI/GflpynTdfOCO1
	0PF5xRSqQyYP241PGoEigtvRNWmjCZYvleiVgjTEjSMaROS8paw4TpUAJ4QKIqKIglS6bnmZVio
	pCXus6RfvC2lqEm6DUmp807Nc9nLsQ/hBhLToNMzi/99UY9n0qe3tAiQtNvhB1S/Do8lIUe99MO
	Nr3yoDgEx0GhXFt4MceknsvvqTQe0pGL8S4dJAqvtXtPinEcY+NgcH60EQKHXN8AzQ18USIT0Jv
	5Gk5lwoP+OgQpOKhpdUEVu05byh9tF+nepFbA2HpzBWEx62rOQ3D+uJ5qDlvOlfTTjdl7WWILhs
	NlcI4gHz609eDbPltdOeL/xytkzg7OA==
X-Google-Smtp-Source: AGHT+IEUVpXvw7yQ6z5CZjh24a192AOoHEs1oYhw54erdNDQUyHVBkhbD1Ts4N4U4xfMkZKZS5d9tQ==
X-Received: by 2002:a5d:584e:0:b0:39f:ef3:b51b with SMTP id ffacd0b85a97d-3a06c38ebcfmr518505f8f.32.1745433554213;
        Wed, 23 Apr 2025 11:39:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3b2:3212:3f21:a1ef? ([2001:8b0:aba:5f3c:e3b2:3212:3f21:a1ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d2f0b5sm34417385e9.23.2025.04.23.11.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:39:12 -0700 (PDT)
Message-ID: <1a68b59a2ce821e27d7746365d9cdd9741da3f6c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] autoconf: mangle PV to avoid
 version-goes-backwards
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Cc: koen.kooi@oss.qualcomm.com
Date: Wed, 23 Apr 2025 19:39:11 +0100
In-Reply-To: <20250423150746.3951901-1-ross.burton@arm.com>
References: <20250423150746.3951901-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 18:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215319

On Wed, 2025-04-23 at 16:07 +0100, Ross Burton via lists.openembedded.org w=
rote:
> I previously upgrade autoconf 2.72e (the fifth release candidate) to the
> final release 2.72, but unfortunately failed to notice that the version
> appears to go backwards as the package managers sort 2.72e _after_ 2.72.
>=20
> We could resolve this with an epoch (via PE) but epochs are forever and
> this mistake is temporary, so set a convoluted PV to fix the sorting
> order that can be removed when the next major release is made.
>=20
> [1] oe-core 11ff8dba0ce ("autoconf: upgrade to final 2.72 release")
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-devtools/autoconf/autoconf_2.72.bb | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb b/meta/recip=
es-devtools/autoconf/autoconf_2.72.bb
> index f2d2781fec9..283596d556e 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> @@ -11,8 +11,14 @@ DEPENDS:remove:class-native =3D "autoconf-native autom=
ake-native help2man-native"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcc3f3a7596cb558bbd9eb7fb=
aa3ef16c=C2=A0\
> =C2=A0		=C2=A0=C2=A0=C2=A0 file://COPYINGv3;md5=3D1ebbd3e34237af26da5dc08=
a4e440464"
> =C2=A0
> +# Remove this when upgrading past 2.72, as package managers sort 2.72e (=
the
> +# fifth release candidate) after 2.72.
> +REALPV =3D "2.72"
> +PV =3D "2.72e+really${REALPV}"
> +S =3D "${WORKDIR}/${BPN}-${REALPV}"
> +
> =C2=A0SRC_URI =3D " \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${GNU_MIRRO=
R}/autoconf/${BP}.tar.gz \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${GNU_MIRRO=
R}/autoconf/${BPN}-${REALPV}.tar.gz \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/program_prefix.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/autoreconf-exclude.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/remove-usr-local-lib-from-m4.patch=C2=A0\
>=20

Would setting PKGV work instead of this?

Cheers,

Richard


