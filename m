Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB9BE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 22:33:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.69289.1734388396204374576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 14:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cyAKyg3U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434e3953b65so32333775e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 14:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734388394; x=1734993194; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7M2H/8abBIzF0mcBPwihyAeDU2GRYhk3x/pTKGlPh7g=;
        b=cyAKyg3ULq4pqpicnvkJ/nNdcuoWf+ncnMr+y9nt/bcr8KjPC3lTJWtdZoGm7xXVCD
         RCf0muQLzPJtxspZZcWSC04oc46oevuz5pGYIGFWN9XBOC/G2WR7PkgfSHsOI1z690bQ
         18kJ/veJ3lgBMEGHbgNx2JziypZ40wZ2EdGpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388394; x=1734993194;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7M2H/8abBIzF0mcBPwihyAeDU2GRYhk3x/pTKGlPh7g=;
        b=VDEQS5YdPbzSVoyKdpFcBvA9TksfXbbpllEGZhcfxK/ct+crpr0YtvkvaWQvxE9gyR
         ZPGiT1GfkNW+Qz5bAdER6bL30TUezd6GgRt9uoag0rjdj3godFX4wrlIYcQaXDhduGh4
         7m8OyvNRo3CO5uuHZxn0wt/xDOQgL/N2E3imVz7wwcWCmIKJu12dSKvMX7Sw/0mXwJHa
         6Ea2WYf3ka1pS5KHqMNjb/wKAqLCTlh4iLzq+TilMjkgRz3WgcR3D8O+GfXB2GNnbEEw
         ts5gfNbC0YiU+kcdjPJ6aIDcRZ/D7CCMPfGG7LA67qGxxm6apYxbJRH0VOGekrkMmNs8
         wv4Q==
X-Gm-Message-State: AOJu0Ywu8zdOtpiVWZ4F8g81mkaA7Et0l0/Ty57J96vybaeZYIYJPwHZ
	d0gn/BItHxf0wnizrDcdzYOL9hKJA+wM0jjhXJ2OekbfA8ihfBzybn6PPzsqaPM=
X-Gm-Gg: ASbGncvxQ6/sVcPbxlZYHgjjVDwumqHv59DXXWMlFWmHCYCBpDv00OH+WN5EZbeqib6
	V7MSLQ9Z+wwppqTIdgTqBXFTf/IrT90MM4KFSMDllizwTCniZaNFAWen0QIRQgd/Q4FQV1LcvgM
	A+ziYi6l0BSflg9C9QPpiGoYiqbP0qL46IgWVcyWOJ40k/yd4jxkf1HnL1i+FJOWNUOoEPUzWCy
	4UOaWw6M5VRpfV5T5wDt/TKxmrTiO4PUxC6yy0qgYg4EFJssYcpTSbIXRh7vM1QSMwCfR3vjkhZ
	kMjl732T1jsepjaxCa49artFhpmiyo3OjCzUaYI6J1TLYQ==
X-Google-Smtp-Source: AGHT+IHCz/vTO50w2w/JbkPhfKV9J+s4u0qmlEpxv1nQJTVlv7Q4ihK3SzdOls12AWJFYUX1G/zXoA==
X-Received: by 2002:a05:600c:3b02:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-4362aa944ffmr113960335e9.25.1734388394645;
        Mon, 16 Dec 2024 14:33:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1fc0:ef8f:2636:e0cd? ([2001:8b0:aba:5f3c:1fc0:ef8f:2636:e0cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436255800f6sm150923345e9.18.2024.12.16.14.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 14:33:13 -0800 (PST)
Message-ID: <63fd8df5142be2e4e87d390db461ea41584311ce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icecc: fix PN 'no-pn' handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Steve
 Sakoman <steve@sakoman.com>
Date: Mon, 16 Dec 2024 22:33:12 +0000
In-Reply-To: <20241216222221.ylk2ijte5h56ecsa@pengutronix.de>
References: <20241209164608.3595821-1-m.felsch@pengutronix.de>
	 <180F920C983A7BC6.8554@lists.openembedded.org>
	 <d470ced4a402955d9061201ba33c8b875f0bce63.camel@linuxfoundation.org>
	 <20241209173815.lq7fh5nr55mttn6u@pengutronix.de>
	 <7262a79ef16c1e01a26491d0a6cc1ddc46d969df.camel@linuxfoundation.org>
	 <20241216222221.ylk2ijte5h56ecsa@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 22:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208794

On Mon, 2024-12-16 at 23:22 +0100, Marco Felsch wrote:
> Hi,
>=20
> On 24-12-16, Richard Purdie wrote:
> > On Mon, 2024-12-09 at 18:38 +0100, Marco Felsch wrote:
> > > On 24-12-09, Richard Purdie wrote:
> > > > On Mon, 2024-12-09 at 17:22 +0000, Richard Purdie via
> > > > lists.openembedded.org wrote:
>=20
> ...
>=20
> > > > The modern way of doing much of this would be a python prefunc
> > > > on
> > > > the
> > > > appropriate tasks. I have to wonder how many people are using
> > > > icecc
> > > > :/.
> > >=20
> > > Okay, I will give it a try with a python based prefunc.
> >=20
> > Just wanted to say thanks for that patch, it looks like a neater
> > way to
> > fix this and likely other issues too.
>=20
> I've seen that you applied both v2 patches onto the master branch. Is
> it possible to apply both to scarthgap too?

From my perspective I think they would be reasonable fixes to backport
given the relative isolation of the class and the benefit as they are
broken at the moment. I've copied Steve Sakoman on the email, you need
to point him at the patches. To save a few electrons, the patches in
question are:

https://git.yoctoproject.org/poky/commit/?id=3Df391bf2c0804aca812ad24e52c14=
b30347726111
https://git.yoctoproject.org/poky/commit/?id=3Db8e99c75a1b0c7c5bb84adcb9070=
61005f504764

Cheers,

Richard

