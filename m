Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BA2E7719A
	for <webhook@archiver.kernel.org>; Sat, 11 Jan 2025 18:42:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.21664.1736620966580922040
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jan 2025 10:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DdIzj9um;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso21725805e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jan 2025 10:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736620965; x=1737225765; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vw7pPML+gRuS23RZGzZv+IEkX3CtlxtPtkoHj1Tw5C0=;
        b=DdIzj9umo0P1P+IPKGg7+L1njygEsZkIWrpdzQbUurQ76A7bT7QRaXTrmygCMAhJcx
         +HmR2fIT/j4bfxkVStQPFUbPV69135FKfK+Wf/FAP6wlkfflGqJ3iN2iofUQDpG7KbEy
         MrTgzhB0QdrIG8km2cPT9+LERWPtoPDx0gj6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620965; x=1737225765;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vw7pPML+gRuS23RZGzZv+IEkX3CtlxtPtkoHj1Tw5C0=;
        b=sIkCTugUYVYSrZQpEOI2Jc5ZVVBu1kMl+Owmblm7S3mz977zC85Sy/8jJCwDBmeCW+
         FWbTPuyRUN81RNyDmhcF1gPsq8pYSsKR3FIzsKbZnNHihyNKBAFTyal4x+s0E2RoVANu
         AqYT4VqTD3oeEN4IvWLKW67pDcuKoaScqWeqBk97c1S1T8TRodtrrQfJgTZa7ifq3rbO
         jKnAK/j5hcBQ+nsCOMaRTrJP3HznvAFZtVpnTZ0unRf6JDyYzbG22X1ErLWTA7GdHY+7
         7LNLYAEGH5R5qUPY5LCVlCsQX2BD4GNHg+dFHdFvFBO9mQIZS8upxvYDCkSccq0q2g1Q
         ukIg==
X-Forwarded-Encrypted: i=1; AJvYcCWHE6Hh9BN0YqDdDUh13I2FMIDlKd/fPDWdNb5oZg1X/WSQtCGwj5C8Rgo2VGUnEZd9Pc6OnTFRkEEqx83OdAwkDg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwxlkWbIMlSncfpmxqnqBzbTQp0/Yrk/DY6vNayBo8jXxI10K8
	zNsof+DppAdyk8GVdmuXU4dyyX7gcOIhSZLIsWfoXcThlD/6sV7/rTlp6uLjC9I=
X-Gm-Gg: ASbGncvozEKEwTFh4j4nXrfaBTw0VvKoWu3d5MB5WkzyWwGftwA1DUoHCDNAU3zihXW
	YK0eJcazBhRIELUjGbvrgj2E2bilM9cXG46xciHFptGg8RJn5DDt7oQL6xqzh3h6IO3bCEtjGVR
	xKNE7gw4RqarE05/wibwJ74HRYhiuoRIIjXLb3Pke8yOLA8ULm+T4/509fG3jw0ezqm2K313q2f
	jts0aJAMdYqNcmjBCXPQvXM4uGv0W9mJ/e4g9IAxh3bEfj9g2JthqwdxXFRzfD2nugHH1kKnH2d
	bIF1ZctFDwPT4QMgHiKSkPZegPuxAqH5E7qEwHP3oukLyA==
X-Google-Smtp-Source: AGHT+IFPgX6Pcps+ncXoNAxm1/UMWa4DN+aUXqQw1NoqhbLRvTK+ce8ZFFWxTW/3nZsu3Z0oHlAK3g==
X-Received: by 2002:a05:600c:4744:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-436e26f043dmr132014515e9.20.1736620964952;
        Sat, 11 Jan 2025 10:42:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2dac:67d4:48d9:fbc6? ([2001:8b0:aba:5f3c:2dac:67d4:48d9:fbc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92f60sm124310985e9.40.2025.01.11.10.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:42:44 -0800 (PST)
Message-ID: <d957f54f2f53d16750159f2f914a6139cf5f5ceb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] glibc-package: move ldconfig to
 ML-specific file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bbara93@gmail.com, openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Date: Sat, 11 Jan 2025 18:42:43 +0000
In-Reply-To: <20250108071513.2807528-3-bbara93@gmail.com>
References: <20250108071513.2807528-1-bbara93@gmail.com>
	 <20250108071513.2807528-3-bbara93@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jan 2025 18:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209672

On Wed, 2025-01-08 at 08:15 +0100, Benjamin Bara via lists.openembedded.org=
 wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
>=20
> Otherwise, installing ldconfig via multilib results in overwriting.
>=20
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
> =C2=A0meta/recipes-core/glibc/glibc-package.inc | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
> index ad34b87929..1e7f3753c2 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -28,7 +28,7 @@ INSANE_SKIP:${MLPREFIX}ldso:append =3D " dev-so libdir"
> =C2=A0FILES:${PN} =3D "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.=
so.conf"
> =C2=A0CONFFILES:${PN} =3D "${sysconfdir}/ld.so.conf"
> =C2=A0RRECOMMENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ldc=
onfig', '${MLPREFIX}ldconfig', '', d)}"
> -FILES:ldconfig =3D "${base_sbindir}/ldconfig"
> +FILES:ldconfig =3D "${base_sbindir}/${MLPREFIX}ldconfig"
> =C2=A0FILES:ldd =3D "${bindir}/ldd"
> =C2=A0FILES:ldso =3D "${bindir}/${MLPREFIX}ld.so"
> =C2=A0FILES:libmemusage =3D "${base_libdir}/libmemusage.so"
> @@ -123,6 +123,7 @@ do_install() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -rs ${D}${base_libdir=
}/librt.so.1 ${D}${libdir}/librt.so
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${MLPREFIX}" ];=
 then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 mv ${D}${bindir}/ld.so ${D}${bindir}/${MLPREFIX}ld=
.so
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mv ${D}${base_sbindir}/ldconfig ${D}${base_sbindir}/${ML=
PREFIX}ldconfig
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0}

I'm a bit puzzled by what would use this in real world use. Do you have
systems where you have two different ld caches? Can our postinst code
call the right prefixed ldconfig binaries?

I merged the other patches in the series, thanks.

Cheers,

Richard

