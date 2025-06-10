Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE30FC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 13:00:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.86200.1749560417432742832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 06:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ShPa77Q1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so62331105e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 06:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749560416; x=1750165216; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Gca3Yt7QZB5QwL/a9QQ526oLpqg53N2NKkOZS3J3OY=;
        b=ShPa77Q1KIFWobenjws+y2KWcNpd+PISynQuvU9KgYUuGgM4Kq7GA0bXLM8zg5Ssok
         l7Ncyr751fBn9KFO57Zrcj605100lSnSPn4el7NEH6UPGe8IYwrbLyokrGWs8Oe8b4NI
         1+IJNXxVbVZ/3AUwfXEd1FUxP0CmoaFiP0u2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560416; x=1750165216;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Gca3Yt7QZB5QwL/a9QQ526oLpqg53N2NKkOZS3J3OY=;
        b=Ha7PvK6mSECfjp8FrefhSFtqLpBweg4QFqfZMRJr4vMw4f4GG0rG+slqNQOSWH3q+T
         cZnTk9EnLNYh/+wzO43M28hMNwkGzyDe5T0X91X+QIWY05oGEaRhkbwB89ANYz26iI2B
         sWu2upJ6yNv/Qz1+SFplaXCleOnKXDBOiTtaZLGEt4cizP1MapuyZvC76Las9W4VuQNy
         P/H7hL+yqemIEAiNHDt4jRaQ6XP6MleNYllhzAfGTsantBwGGLNiGLhTwTFH95D0p6Lx
         guZHAd3mx3q1vhqhch3oUOJJajXS6de6mNHnQdUHks1vayAMqaEE6Y1LqH1J3AIME8TF
         hj5A==
X-Gm-Message-State: AOJu0YwJKBWOz/jFrR/lYqhzYFNMz8NajSTnGmtlROeRQsmon6aBoyKW
	slCTye+8JGZ5RP4QKXcRsmvuro6vSRZtCHExHOSQr6LAklcTK1ea2v1iBb0gukBIIBI=
X-Gm-Gg: ASbGncv27KqyZ64WjhY1igoVQbWLNQFKGx+2JqEOSMC+2h4Z1OrwPVTtz1iCIZy2ihf
	WD2rAjnW39mSsqmXIuyLvDELoTaa9ZrgG2u7J7Lk0Kk2MmRerv1IBfbTCU0A5msaG8YwfS80bvl
	pIBsZypK9mLW1mH3KoxZrPUVGpth/bgTIX1A+2iROWT6EzMf6YoPrcA8uSpCsOrDGQ7RCeEpURS
	F9BOG/8VshkeC48dioXD95AzPTHPBCkdDfbTlxzTfz5K32DlAytnRy7dwZyeBes80Sf/wdXRPcn
	Cg/z4GxzP/vGJ6dtVFVA+EJvL62TCLfycdNAhXaxZUggoD9V1P6vbbcb2xEZo3wuZpDb9H3kBsx
	X4LfvktgNQ45RjOv9OsXbahVJSkVvwaXFTvDBdAH39ZRLALJH
X-Google-Smtp-Source: AGHT+IEs3abLudIskjaygxO8i+WMBcqefnH/Oz8AqKERC3xcuO6dtlCnjbAdvaHMZpfp2jmSttp+ZA==
X-Received: by 2002:a05:600c:1d86:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-452013ab8e3mr191585765e9.16.1749560415117;
        Tue, 10 Jun 2025 06:00:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2b:2750:8c03:51f7? ([2001:8b0:aba:5f3c:f2b:2750:8c03:51f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f04dsm12208791f8f.73.2025.06.10.06.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:00:14 -0700 (PDT)
Message-ID: <81c17cb1a4f19ae850a5d24e49d2034e56cc13ad.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] reproducible: allow each layer to define
 its known non-repro packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, Quentin Schulz
	 <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, Guillaume Swaenepoel
	 <guillaume.swaenepoel@smile.fr>
Date: Tue, 10 Jun 2025 14:00:13 +0100
In-Reply-To: <CAMSfU+50UFfmzHUf+ag9_8-FAau4+ym3+Oe+9G-i97C+2irVDQ@mail.gmail.com>
References: <20250609152757.1153027-1-yoann.congal@smile.fr>
	 <3e190ff1-9261-4a13-8c1c-daeb16671b44@cherry.de>
	 <CAMSfU+50UFfmzHUf+ag9_8-FAau4+ym3+Oe+9G-i97C+2irVDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 13:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218352

On Tue, 2025-06-10 at 14:50 +0200, Yoann Congal wrote:
>=20
>=20
> Le=C2=A0mar. 10 juin 2025 =C3=A0=C2=A012:57, Quentin Schulz <quentin.schu=
lz@cherry.de> a =C3=A9crit=C2=A0:
> > Hi Yoann,
> >=20
> > On 6/9/25 5:27 PM, Yoann Congal via lists.openembedded.org wrote:
> > > From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> > >=20
> > > With this change, layers can use a conf/include/known_non_repro.inc f=
ile
> > > to extend the OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES variable with their=
 own known
> > > non-reproducible packages to make them automatically excluded from th=
e
> > > reproducible test.
> > >=20
> > > Example of usage, in conf/include/known_non_repro.inc:
> > > =C2=A0 =C2=A0 OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D " \
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-package-is-not-reproducible \
> > > =C2=A0 =C2=A0 "
> > >=20
> > > This uses the new "include_all" in the reproducible test and will mov=
e
> > > the maintenance burden from AB config[0] to the layers themselves.
> > >=20
> >=20
> > Isn't this something that could already be handled by a simple
> >=20
> > OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D "this-package-is-not-reproduci=
ble"
> >=20
> > in the appropriate layer.conf file by any chance?
> >=20
>=20
>=20
> Yes, I guess that would work (and without adding new code).
> I seen so much bad stuff put in=C2=A0layer.conf files that I always forgo=
t that you can! -_-
>=20
> Richard, what do you think? Should we switch from
> an include_all=C2=A0conf/include/known_non_repro.inc in each layer
> to
> OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D " ..." in layer.conf of each lay=
er?

I think I'd be ok with that...

Cheers,

Richard

