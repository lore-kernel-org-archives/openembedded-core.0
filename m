Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A1BD44D56
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 10:39:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.68842.1730975978827381234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 02:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JVnbuaNo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315eac969aso4657045e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730975977; x=1731580777; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYHLXyMVHKM3KiYKkhiU2WFP0SqSzURxSHi/nFZ0Vsw=;
        b=JVnbuaNoqr9jdy34ll1Tg/PHwkIxtjmSFYGPmAWECOBrCAD8viPyEj4iNFd4EzziWG
         bicpBDgPcYVGf1Z2RT9MVWfe/9z1Oy5jut0qm9MIe8MiIbg+Cgbum7OUPUeLsW5j3Woi
         8UeDbZh8HbS/ktCa/svqQZFWtOPXfPvGXefk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975977; x=1731580777;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tYHLXyMVHKM3KiYKkhiU2WFP0SqSzURxSHi/nFZ0Vsw=;
        b=ji0neB5dt4lv7SbyE4hqqrT7/oEMFjXjR7CZoTdrb8nIu0iZD9rIju8chv7D6nCYe0
         RXBUBcWHxT0xA+uU+VnAppDPENs4KaGm9fP4dGc268tqN4vMacHDZOYrqGl60sq5d5kF
         z+J/pWuDaK1w5cPKGJGBwjfST5seSbfQlaVUrroQKPEagZTZ06PQ51gsa3Ey4f4a/ilt
         EF1VIzxatCX7Y7TUQ4ZN+N+vSHS9oDNcMoi99tCK5cPrAXRiAhaV7mP87mD4dBtBx8ZA
         nrBPq93+0wBBWKunDb43h2QOJdM+ugQi8WGyWey9Z3QnG4n3y1vRcah02VdBHLUIkDUc
         f0iA==
X-Forwarded-Encrypted: i=1; AJvYcCUxaeCUoJkvaP6Nco6W2aqJ3yXyUPRGBveEOB7pLC7N9bWZfacTKaVCEzR/47hWrYBr+eVfh+uqiyNxX5Q0uobDmg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCT9YVJWNw7xmZGoKT7VcJMztbS269a+nJW2xN0ylBKjMixR2y
	njSiZoLQH/ZE//HvIWWyJLUo6tC9xKymmRobWL9qG/TiTBOV/6KrGGBRwvvcUBY=
X-Google-Smtp-Source: AGHT+IFWgOblNq2OhTWIB0QbXgcKwQMqqsz9XhDl3lvs4xMy/OjeCTiUNeg8P3sH3f1KCaH1PFm+rw==
X-Received: by 2002:a05:600c:1c8a:b0:431:9340:77e0 with SMTP id 5b1f17b1804b1-432b382bdc8mr7359605e9.9.1730975977044;
        Thu, 07 Nov 2024 02:39:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c2a0:1728:e87f:b86b? ([2001:8b0:aba:5f3c:c2a0:1728:e87f:b86b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054c179sm18641315e9.18.2024.11.07.02.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 02:39:36 -0800 (PST)
Message-ID: <d478c0e7ec94a2e3c7552711d7631c5ea45c0b4d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] bitbake.conf: Enable ipv6/acl/xattr for
 nativesdk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 07 Nov 2024 10:39:35 +0000
In-Reply-To: <DB5PR02MB10213CD43DB2665982DF6E1F6EF532@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241106100957.2905277-1-richard.purdie@linuxfoundation.org>
	 <DB5PR02MB10213CD43DB2665982DF6E1F6EF532@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 10:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206831

On Wed, 2024-11-06 at 22:39 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@=
lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 6 november 2024 11:10
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v2] bitbake.conf: Enable ipv6/acl/xattr for n=
ativesdk
> >=20
> > I was surprised to realise our buildtools doesn't support IPv6 which br=
eaks
> > usage in our own autobuilder, let alone anywhere else.
> >=20
> > Enable ipv6 in our SDKs and enable acl/xattr as well before we have the=
 same
> > kind of issues with those, these features are now common on most linux =
systems
> > and we should be defaulting to including them.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > v2 - Handle mingw which doesn't support acl/attr
> >=20
> > =C2=A0meta/conf/bitbake.conf | 3 ++-
> > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 14e761e2e7e..02bbf0e7a52 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -916,7 +916,8 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
> > =C2=A0# Native distro features (will always be used for -native, even i=
f they
> > =C2=A0# are not enabled for target)
> > =C2=A0DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
> > -DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> > +DISTRO_FEATURES_NATIVESDK ?=3D "acl x11 ipv6 xattr"
> > +DISTRO_FEATURES_NATIVESDK:mingw32 =3D "x11 ipv6"
>=20
> While I know you do not like :remove in OE-Core, isn't this a case where =
it=20
> should be used? I.e.:
>=20
> DISTRO_FEATURES_NATIVESDK:remove:mingw32 =3D "acl xattr"
>=20
> Otherwise someone doing DISTRO_FEATURES_NATIVESDK +=3D "foobar" in their=
=20
> configuration will get a very unexpected result if they are building for=
=20
> mingw32 after the above is integrated.

We have this problem in a lot of cases and as you know, I'm deeply
unhappy with the way our variables work in this regard but I'm not sure
how to improve things.

Adding :remove basically can't be undone and therefore I'm very
reluctant to do it, particularly in core.

I tried to pick the lesser of several bad options.

> An alternative would be:
>=20
> DISTRO_FEATURES_NATIVE_DEFAULT =3D "acl x11 ipv6 xattr"
> DISTRO_FEATURES_NATIVE_DEFAULT:mingw32 =3D "x11 ipv6"
> DISTRO_FEATURES_NATIVE ?=3D "${DISTRO_FEATURES_NATIVE_DEFAULT}"
> DISTRO_FEATURES_NATIVESDK ?=3D "${DISTRO_FEATURES_NATIVE_DEFAULT}"

I do not want to do this every time we declare a variable :(

Cheers,

Richard



