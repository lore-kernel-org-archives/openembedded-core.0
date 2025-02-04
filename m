Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6321C02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 09:44:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.112268.1738662276098409385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 01:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YHPSmVIv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so54726315e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 01:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738662274; x=1739267074; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QVR5rV9qYqasnbCcvsuoC5fWW5Xhrt1TBNH9vUe1kso=;
        b=YHPSmVIv0Tc9G5UajQgRX2gZprOikii772pbOl6dW5jDNu0LzeLd8BFQ6LHk0oItuX
         QJS5m89uBTpYABuTR+85Sfg2SBwPtFcQ2MYlJ6xqghaiH2YfrQ4Ip9/Vn+rB6u1Yo51O
         kB+MMNvjsG3/pMFDd6nQiE9bkr7eGJ0Sil3OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738662274; x=1739267074;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVR5rV9qYqasnbCcvsuoC5fWW5Xhrt1TBNH9vUe1kso=;
        b=B4ImDarX64GiWtsi6MDGNjaLeVVbAD554rQuvkgddixCYOmwe9ui/xMnZNcydfamu6
         PXshqlF/feAckBmxrZ5bjLYfAZhp9TqsON1m3NKt8ywsILseTI5r+qfsryg1A4iMukOv
         qw+gxnyuPlu3zU0o41RxoHIUqvKStHPLVKt1ZiRXLIEGhvd2vOesFjBGQ+9jJFlxUxhz
         /liMnhCWhFTKwlMUbaIfFh64NDheyHeC8oTuz55ZRraVgPF15udL/RNe05BYuwd00yHc
         Ie1XG8Q4Cv8/ApHLjl/GsjC3kO3MosSfy3ZWTPR2Natwr0DMULC3W179Lq2imFpUgOgI
         6cAQ==
X-Gm-Message-State: AOJu0YzWocBIKwUQY0P4WLInRsdu18pKltT+7b1z/4sWgQB3lF0M9WGW
	gTz3NUbJmGj6mhuA9BItkQpkIgj3cb2RsI3BpkGI9E+fpmjtgO0X/5RADz7WTGE=
X-Gm-Gg: ASbGncuWzl0YvJ1GKUZ/SHxcp3WtUNIYJEAvI7TaPx0Q6xe355jEoeQvPy+mmSIf0q0
	i9iczXXeN00eIZRmqQ2KZ8L26Y5qt4ftA6un7ayBQyCcCrM7WPLGAohh/qUeDhu1LC4Gmj7oIH8
	Jg2fLZDH3rzTXaVJSZ6eS2SEuge278AEB7n+dYWpJjm5Tipw6E/cWWcwZy1oDOuxnyL1r2Thg/m
	jVbdpZ5WZk6vTqz7p0KFNuSs9+ziREnWpoy86KGlJgu8wgLktpaR1bPnuhALFfPThSMs0Bo0G+H
	5DsDK3Tr9g1U7oapVFiPnHshy7KI1Q+G+L/dv8H4Uip5lJtnzQHbrG/9S5JRMMU7VVT3ap2oIo3
	dsAth
X-Google-Smtp-Source: AGHT+IHJJzuAabFHhTU//EwRX8g4YxXwX4LLUtdqtWYXXhZwoI4O4zLdRqYWbxbDmTpcF0HZZ9LVvQ==
X-Received: by 2002:a05:600c:22d9:b0:435:1a2:2633 with SMTP id 5b1f17b1804b1-438dc48a91amr220252775e9.15.1738662274346;
        Tue, 04 Feb 2025 01:44:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b0f0:1828:fe17:cc0d? ([2001:8b0:aba:5f3c:b0f0:1828:fe17:cc0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d443esm190306655e9.1.2025.02.04.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 01:44:33 -0800 (PST)
Message-ID: <b7cc4bb4c1a3c313bfbd9579a199d5ce702add7b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/2] add basic b4 config file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, Khem Raj <raj.khem@gmail.com>, foss@0leil.net
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 04 Feb 2025 09:44:32 +0000
In-Reply-To: <cd355530-d72b-476e-9c99-bc53f0a3a337@cherry.de>
References: <20250203-b4-support-v2-0-848008ad29ea@cherry.de>
	 <CAMKF1sqh0VMORr2ivhz82XVt7EuZ_UmUgtFVHOXb0pQwDesnnw@mail.gmail.com>
	 <cd355530-d72b-476e-9c99-bc53f0a3a337@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 09:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210754

On Tue, 2025-02-04 at 10:13 +0100, Quentin Schulz via lists.openembedded.or=
g wrote:
> On 2/3/25 8:42 PM, Khem Raj wrote:
> > On Mon, Feb 3, 2025 at 7:18=E2=80=AFAM Quentin Schulz via
> > lists.openembedded.org <foss=3D0leil.net@lists.openembedded.org> wrote:
> > >=20
> > > This adds very basic support for using b4 in OE-Core. This essentiall=
y
> > > just automatically adds the proper mailing list when running b4 prep
> > > --auto-to-cc.
> > >=20
> > > This also adds the b4 wrapper script that poky will need to use in or=
der
> > > to identify which mailing list a patch needs to be sent to and do som=
e
> > > additional per-patch checks that aren't necessary when running from
> > > vanilla OE-Core.
> > >=20
> > > Once this is merged, poky will need to merge OE-Core into itself and
> > > override with its own .b4-config that makes use of that script.
> > >=20
> > > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > > ---
> > > Changes in v2:
> > > - add mention to first patch that running patchtest for b4 prep --che=
ck
> > > =C2=A0=C2=A0 is what we're eventually aiming for,
> > > - add poky b4 wrapper script (it used to be in the patch series for
> > > =C2=A0=C2=A0 poky, c.f. https://lore.kernel.org/poky/20250123-b4-supp=
ort-v1-1-4841f52eccbb@cherry.de/T/#m95d6aa25cc42352416da477cf07d7b3cbd67123=
1
> > > - poky b4 wrapper script properly identifies patches with files modif=
ied
> > > =C2=A0=C2=A0 in both OE-Core and other repos part of poky,
> > > - poky b4 wrapper script pretty prints when there's more than one
> > > =C2=A0=C2=A0 project modified by a script, instead of lazily printing=
 a Python
> > > =C2=A0=C2=A0 list,
> > > - Link to v1: https://lore.kernel.org/r/20250117-b4-support-v1-1-fe74=
a5f50eb6@cherry.de
> > >=20
> > > ---
> > > Quentin Schulz (2):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add basic b4 config file
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scripts: add b4-wrapper for poky
> > >=20
> > > =C2=A0 .b4-config=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> > > =C2=A0 scripts/b4-wrapper-poky.py | 170 +++++++++++++++++++++++++++++=
++++++++++++++++
> >=20
> > is there anything specific to poky in this script ? if not then it
> > should not use that in name, it will
>=20
> Yes it is poky specific...
>=20
> > make it confusing. In oe-core we do not refer to particular distros if
> > not needed.
> >=20
>=20
> ...git-repo poky specific, not poky distro specific. Do you have=20
> something better to suggest than this?

To be clear, we could "bury" this b4 helper script in some other
layer/place. I'm a bit reluctant to do it since I think there are
things in here which may help anyone else trying to split a repo into
multiple different submission locations, even just as a reference
implementation. As such I did suggest it go into core, even if that
looks slightly unusual.

As Quentin says, we're open to better ideas on naming but I do fairly
strongly believe hiding it somewhere else will just confuse things.

Cheers,

Richard


