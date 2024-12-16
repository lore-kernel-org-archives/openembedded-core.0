Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACD4E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:17:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.61973.1734369465931525747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 09:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sz/pVoyU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436341f575fso30545185e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 09:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734369464; x=1734974264; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FfdQ2ot+JTYHr+q2WU6690xa+8+7N4TwYYNuQpNiSlg=;
        b=Sz/pVoyUlhyz5PVDZJ2NI8tG8JBdkOuSE1GY1hPaPw56WDuOeaGZ2MIlWlljTLH/P9
         jdYbRAsnuUJhH3vaynzwAJzYN1CaMurhIWE4AA3hcr+DxbEyxcClwLgZt44k5qEAilqu
         7amsaVxB165QUNyFBEk1xZMm/3xjkWanWR9Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734369464; x=1734974264;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FfdQ2ot+JTYHr+q2WU6690xa+8+7N4TwYYNuQpNiSlg=;
        b=vF8xJ/fmEynZWTfCm+edJbuRwC560Ij5kT9UXds9ltKmLZkBPYX9S/pNdKdVDgXdVt
         L11Mx7r1xOcFA6RXHM3gv19xDwD0viGvSwGjkKKp/KRE8LCDfQLDIOnZux+dORaV44Bu
         BAwRo7KYxeH1332gt8kpk+jdp8UjlfyyDnIFIYRxhQ+fM4w5ovXlfORALqPCOWygAwwq
         2WLZ6wqpDV/DrTGNdR4SL9VpA21xF7UPvtE05Xo9Nsdxky0B5xTdr/d+2WGXSwMS/8AO
         26RqJTw5YZJ2/67UQM1H9yKiVHmZ1eTsRMosoEv9+dnZUBKtYEI15HszUyCPa6TW1S5r
         WziA==
X-Gm-Message-State: AOJu0YzGCfgQkY/CBW3US97Bew5mEK1luLcZiEGtqp8AI69ovErqyDvq
	xP/lZPwLYqcWIn3gs7QbgaJLKSIn5EGlshuKER1VO7a8utpInuyIL3S4MfseYJQ=
X-Gm-Gg: ASbGncvR7HRrynMptKIQdQcpU7g/0EhI2dzJ/hDM2QOMnxeG6kJl7TP+9YFKLiRKusr
	2k9LDx9QAM/P0bwJkAgSw9ZlmyJvzc44cZlszsfmKskqTv2oQUsp0dQhV2hOTqcwnz/sJc5BMYf
	QK2Z0vIC4yP8dAf8z++bIY5kg+YN7C1SeGRSW3qU7EiLGDGKsRv6vvjGId6OIXxFDgXjVe4wKTH
	a+sEIJGkmNpG+U49ppUAuud6tIZVYd5KEkNdg82a8wG8D9YV3vd6J4v8fonSLkoIRlspMOMYj3x
	cLfg7p3HLJgTBgeJ/dZqUHkyJ9jVJ+jjgLvN+u/KznuV8A==
X-Google-Smtp-Source: AGHT+IFu5Kz+ju6FqQRPH7Ej6omICrXMhrMMrYKqRXSjkIyCyXCPaxNSym8M9b8n+4tjP92tvN0NLA==
X-Received: by 2002:a05:600c:c85:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-4362aa9982dmr115576845e9.24.1734369464340;
        Mon, 16 Dec 2024 09:17:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7? ([2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801223dsm8831902f8f.3.2024.12.16.09.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:17:43 -0800 (PST)
Message-ID: <9ac4e3a73940331000196e9ef19e013d49a8b21f.camel@linuxfoundation.org>
Subject: Re: bitbake.conf: add lz4c to HOSTTOOLS_NONFATAL
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Justin Bronder <jsbronder@cold-front.org>
Cc: openembedded-core@lists.openembedded.org, Denys Dmytriyenko
	 <denys@konsulko.com>
Date: Mon, 16 Dec 2024 17:17:42 +0000
In-Reply-To: <Z2BeHc33PUsrN7NA@ravine.members.linode.com>
References: <20241210151015.2450083-2-jsbronder@cold-front.org>
	 <9c3143ebb7f9e17cfbd318ef0e17994aae7264be.camel@linuxfoundation.org>
	 <Z2BeHc33PUsrN7NA@ravine.members.linode.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 17:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208783

On Mon, 2024-12-16 at 12:06 -0500, Justin Bronder wrote:
> On 10/12/24 21:53 +0000, Richard Purdie wrote:
> > On Tue, 2024-12-10 at 10:10 -0500, Justin Bronder via lists.openembedde=
d.org wrote:
> > > Commit fe167e082cbde1c6d186ecdda531abef610ac2ac switched to requiring
> > > lz4 instead of lz4c which allows us to support distros dropping lz4c.
> > > However, it's only in the 6.13 kernel that CONFIG_KERNEL_LZ4 makes th=
e
> > > switch from lz4c to lz4.=C2=A0 So we should continue to link lz4c if =
it's
> > > available to support older kernels.
> > >=20
> > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > ---
> > > =C2=A0meta/conf/bitbake.conf | 3 +++
> > > =C2=A01 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 1d2c2e0022..c7927d19a0 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -553,6 +553,9 @@ HOSTTOOLS_NONFATAL +=3D "gsutil"
> > > =C2=A0# Link to git-lfs if present
> > > =C2=A0HOSTTOOLS_NONFATAL +=3D "git-lfs"
> > > =C2=A0
> > > +# Link to lz4c if present, used by linux <6.13 with CONFIG_KERNEL_LZ=
4
> > > +HOSTTOOLS_NONFATAL +=3D "lz4c"
> > > +
> > > =C2=A0CCACHE ??=3D ""
> > > =C2=A0
> > > =C2=A0TOOLCHAIN_OPTIONS =3D " --sysroot=3D${STAGING_DIR_TARGET}"
> > >=20
> >=20
> > The YP TSC chatted a bit about this. Personally, I'm a bit nervous as
> > this could make the builds a bit non-deterministic and allow the builds
> > to fail well into the build. We try to do that "up front" if and where
> > we can to make developers lives easier. This becomes more likely as
> > distros drop lz4c and releases age, i.e. we'll hit problems years down
> > the line.
> >=20
> > I did have an idea for another potential solution which would be to put
> > a lz4c wrapper in the scripts/native-intercept directory which tweaks
> > the parameters and calls lz4.=C2=A0Could I convince someone to see if t=
hat
> > would work?
>=20
> That works for the kernel build if I put the wrapper in scripts/.=C2=A0 B=
ut it
> doesn't if the wrapper is in scripts/native-intercept as that's only adde=
d to
> the PATH if native.bbclass is inherited.
>=20
> Is adding a wrapper in script/ acceptable?=C2=A0 I see we already have on=
e for git.

It isn't ideal but we can probably do that. As you say, there is precedent.=
..

Cheers,

Richard

