Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE5BC982CD
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 06:21:58 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33466.1789626115347948343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 23:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZqyKoNAt;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so2228035e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 23:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789626113; x=1790230913; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LuoFf3JDwjtj1kKD5CdFJ0NhCHWhozLGeYUCDkZ/+48=;
        b=ZqyKoNAtPluOCkPkrd5BcSOGjzgQlZ3YGlH9KNpocpdiYUJ+PAccKagxTj2FUjlr1C
         b9M4dXUm/RQ4E30DGpZ4r9bbzx4YEuXBgFuU3SnCEnKU63yKBtVYHv9U7nt7h/0QAvaY
         TFCSTbvSmPOSX2VRGX1lGiNrLxKBE/h4Ms7D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789626113; x=1790230913;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuoFf3JDwjtj1kKD5CdFJ0NhCHWhozLGeYUCDkZ/+48=;
        b=JuccZUgGMQyGBHEywaslNBsoK1PUTOyTH0ADqaVmawBNBNtLAdq7MTg2SKu2iPUQTp
         Y/25Vjn64CXiK7fRyqG0vsXWyV66YhodTTTjhlNjvv+eLK5SYP5HYCZy9kgSn3cEAhc7
         ZmrYZrR89H3s1OOXMYGwvjsHbcyIsdG5ONxm/ziFmTGh/miewoEtq/9AQB7s0aloVJ93
         FC43rBtxevOp5RW6Dy1DFAD8LIAaIk+/bqY8AFG6u6EZ33DNeBDV2AMkfLszJNBORKlL
         /93cyA64zlzJzz+k0jMGCu+L8FVJgNHVljRxqLO1tY+0YNMLZ2Ft385o+Jr9vDabUvbT
         HrrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGGEucMOe+bBlN/1fjgpON22NLl7IcfK1m28aFHO2b/Mj2Tos1VHs6/glENn8lsG9pFVlofFcktq+CQGJ6eYHxFw==@lists.openembedded.org
X-Gm-Message-State: AFuF++k6/iHrNllOOMzOXXmaS+RWa0as+VhcAsKtHeorTxPVNH57EYK7
	qe6D4BXL4EPDbZ7hL5zO4K7fIo2IiHlj4DQgPbVF8PswuQzSNfx4yD/Qq9ZQx1V54Ss=
X-Gm-Gg: AYBFou3UypAWoJI5K0fQKK74qBvGUUWhNlVdO0fMov8TD77KrNDWSNnfkUaWe2Wk/rJ
	Rj2o3hr/4CByW2PILwOrSU+kGY3ey+xnKrCjBfe8uw7Oq6fW1DIjuCzFEA+xOHLvvSwpSNvEq3D
	XbR6q6c2K8EjqRNZeWv27rnStKKT/Pmx6KCzvtrM6iJFy6glKs54V+m9vQrQD5OsI2L74HJzN2X
	fItLNTlWM9HdOpxYMFmCOqjFlkcbqtiW6SAP+8iag2XnEk9NIs9QQTKb1NxsfCYjGBh4weKezB3
	jaet8dybPoN/GdehwRpyip9QvjBTCzftjnyXfkr0QD/kUlydH0DAdH9MCMdM7ngBzOXb+vA5F3w
	Nk5ZsFWT6KC3P+/QdOtP+UyaZy7Mz6fuK60F5KXKDMPMnyzr3OQTpkTEahbEmsjTb9aAp+X4Jdw
	xZTBOr/tag6dSxLDoccrh4x4pZsyx7kgtqtsoZJfIdDggrGzpfty68fCW9TtSrDoltfjEJ9oB9w
	rFlUefBgQjFYXpszMJ0ka2FDriWSYUWHy2wA0KXXUhb9C056VygiFeHw2P/b7CT
X-Received: by 2002:a05:600c:1c19:b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-49eb732cce6mr83618525e9.22.1789626113511;
        Wed, 16 Sep 2026 23:21:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4507:59aa:c79a:ecab? ([2001:8b0:aba:5f3c:4507:59aa:c79a:ecab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216028sm46733875e9.7.2026.09.16.23.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:21:51 -0700 (PDT)
Message-ID: <626e0f4314d6573170afb8adc9d0271f4b2b88aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] seatd: add PACKAGECONFIG for the man-pages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2026 07:21:49 +0100
In-Reply-To: <20260916160246.276107-1-ross.burton@arm.com>
References: <20260916160246.276107-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 06:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246021

On Wed, 2026-09-16 at 17:02 +0100, Ross Burton via lists.openembedded.org w=
rote:
> seatd will build manpages if scdoc is present.=C2=A0 Inherit manpages and
> add a PACKAGECONFIG so that we build them if they're enabled.
>=20
> This also removes a floating dependency on scdoc.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-core/seatd/seatd_0.9.3.bb | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/seatd/seatd_0.9.3.bb b/meta/recipes-core/s=
eatd/seatd_0.9.3.bb
> index 72c54d58ab9..82a47196a73 100644
> --- a/meta/recipes-core/seatd/seatd_0.9.3.bb
> +++ b/meta/recipes-core/seatd/seatd_0.9.3.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "git://git.sr.ht/~kennylevinsen/seatd;proto=
col=3Dhttps;branch=3Dmaster;tag
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/init"
> =C2=A0SRCREV =3D "daa8196e10b180b8b0caeafa8e5f860eb1bd6706"
> =C2=A0
> -inherit meson pkgconfig systemd update-rc.d useradd
> +inherit meson manpages pkgconfig systemd update-rc.d useradd
> =C2=A0
> =C2=A0# https://www.openwall.com/lists/musl/2020/01/20/3
> =C2=A0CFLAGS:append:libc-musl:powerpc64le =3D " -Wno-error=3Doverflow"
> @@ -30,6 +30,7 @@ PACKAGECONFIG ?=3D " \
> =C2=A0
> =C2=A0PACKAGECONFIG[libseat-builtin] =3D "-Dlibseat-builtin=3Denabled,-Dl=
ibseat-builtin=3Ddisabled"
> =C2=A0PACKAGECONFIG[systemd] =3D "-Dlibseat-logind=3Dsystemd,,systemd"
> +PACKAGECONFIG[manpages] =3D "-Dman-pages=3Denabled,-Dman-pages-disabled,=
scdoc-native"
> =C2=A0
> =C2=A0do_install:append() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${VIRTUAL-RUNTIME_=
init_manager}" !=3D "systemd" ]; then

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4676

| meson setup: error: The argument for option '-D' must be in OPTION=3DVALU=
E format.

You mean -Dman-pages=3Ddisabled

I'll tweak the patch.

Cheers,

Richard


