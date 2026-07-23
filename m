Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14112C531CD
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:24:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19518.1784798647489970559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SgEk4wku;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47db714766aso138150f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784798645; x=1785403445; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qtlkOmMx3rjxIklp1+N4OafhlGGsn8u8QynqGS/3pzA=;
        b=SgEk4wku59T9Pvl5vB+VGussS0RtVwr/skqBptYZkqbwV69zYwsi8JisCwmWBVp7fc
         mHmStYlm/ZAdjjNT29vsIH33dSD+As66XXCq/ijXLNR1nTS9KgQs0w0nZM25dQxOqgRK
         tFR+aS6ktjvSNcW5tRKdBLOa4Eo7o5m/SnB5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798645; x=1785403445;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtlkOmMx3rjxIklp1+N4OafhlGGsn8u8QynqGS/3pzA=;
        b=n3KaYKXD/QNJYimc5smdPq3Pbi+3b3nqIzFT19LMEvFdE8snUGhteB5OOmrQRKq24H
         jv7tde1yPQH/+ojBHCMwCBtEoxDvuwxzzYTVQk6SJlnlCadjT04H5/EhU8s8JtyjJXcj
         k0aDuL/r/pC+F6D8BSTVoI6ojV8JFekrwdkyDV1pmAHXeK8gDsnzIVopmwYcIqWbC1JW
         TKtcWxkbg9yyaTEwobHCogE6Ssk2+s+HKvaA8kqltTF2t1iuqUhXzAS5HoKOAFcj/0lk
         S8DuWjvtTiGWdG8PH7BhJwjzC4JlJAT15Ap7vf9ryQ4/jjv4Vmci4cXBzob2hGqNB+NS
         ahnw==
X-Gm-Message-State: AOJu0Yw9ikdgYTFBTZ6UA1SMS5iUV/VQpmKT76P9OfaYWxG+xNAYRBP/
	bVUM+eGPuPg98+ovLwCeIJavw9fw4lYy7SpO84GTFrPTPRmg/nhKzBm6ngA8PMceM20=
X-Gm-Gg: AR+sD12I9Lze9rw1pdTkNB6N2Ou78c6tk2R5mzXn6tuJmb2HEctxF2Ud2Skh4Tc256Z
	EozUp1/W0Q16wmtaPI+PFh2kyN9kWtY7EOh+B6OwRZ83v8l180sjzhrgO3FV9mMmEpNcujdvwWr
	/jMNT3X1/vooA1IGy/avOXrTwHGRQX2of09+u1InEcX7BWcGyfWgwOesiYtt8queUxSLFZI2Rvc
	ESFCrkexRCRz6ru5AVUmxNwUh98SFAgO5ScfxtpMYX/iDiwHXBLF4rLBlOgvLMuVnWIqHagua15
	SZk84FyRVnpTcCqlB3Gu1wLs3tPIu5LSwBkeRtAFwCC2PUL2s8BklkFz+egsMmi4CARxpb80xz1
	aCl2ge9eaQ5HJYjfMD5tzdSYhs7TAzFzQH9NOS/vDAlDDrE3jzo5W7MlMwzdyxgV4AJ1L5P654d
	V9/DC0O39Zcxd+k7acmX/HtJ4RNLghFN9UEoLrZNPXnmFbGvBXG6R5wySTh4mMiPSqO+M=
X-Received: by 2002:a5d:6f06:0:b0:47d:f508:3364 with SMTP id ffacd0b85a97d-47f902605c8mr2390452f8f.15.1784798645487;
        Thu, 23 Jul 2026 02:24:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2205:d253:2df6:b9d5? ([2001:8b0:aba:5f3c:2205:d253:2df6:b9d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm14679391f8f.1.2026.07.23.02.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:24:04 -0700 (PDT)
Message-ID: <8492f386f53885c1ceda197e034241b9c9ffab57.camel@linuxfoundation.org>
Subject: Re: [poky] [RFC PATCH] distro/poky: enable minidebuginfo
 DISTRO_FEATURE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, poky@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2026 10:24:03 +0100
In-Reply-To: <20260715162410.639632-1-ross.burton@arm.com>
References: <20260715162410.639632-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241803

On Wed, 2026-07-15 at 17:24 +0100, Ross Burton via lists.yoctoproject.org w=
rote:
> Enable the "minidebuginfo" DISTRO_FEATURE in poky builds, so that all
> binaries have just enough debuginfo in them to get a useful stack trace.
>=20
> This aids with debugging occasional failures that hit the autobuilder,
> at minimal cost.=C2=A0 For example, core-image-sato with systemd:
>=20
> =C2=A0 core-image-sato: IMAGESIZE changed from 481532 to 486044 (+1%)
> =C2=A0 glibc: PKGSIZE changed from 3715743 to 3805871 (+2%)
> =C2=A0 sqlite3: PKGSIZE changed from 462840 to 469056 (+1%)
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta-poky/conf/distro/poky.conf | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky=
.conf
> index 2ba98f4ba2..86576e48a0 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -13,7 +13,7 @@ TARGET_VENDOR =3D "-poky"
> =C2=A0LOCALCONF_VERSION =3D "2"
> =C2=A0
> =C2=A0# Override these in poky based distros
> -POKY_DEFAULT_DISTRO_FEATURES =3D ""
> +POKY_DEFAULT_DISTRO_FEATURES =3D "minidebuginfo"
> =C2=A0POKY_DEFAULT_EXTRA_RDEPENDS =3D "packagegroup-core-boot"
> =C2=A0POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-module-af-packet"

Thinking about this, I think we should do this in core by default,
which will help sstate reuse generally as well.

Cheers,

Richard

