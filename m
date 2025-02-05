Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78023C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 11:10:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.9652.1738753840956541360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 03:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G2XiwipM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so65757015e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 03:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738753839; x=1739358639; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=25vmM3WoixqGh8oiw4BW3dDJclVHBEWYqum0PDIyxB4=;
        b=G2XiwipM1lF6nugeMO3fXTE/tALI/0yRdXTLZyt1DcyHq9SqCZaoRXp8gVQ6/8+CFi
         0MmrNBJYz5UGgR1ZXy7autG2op/Gtnxnn3WTVj5lKGyS6K70F+P7SL2DpCYsE/bddfEz
         xokRxt+/WTx47oA+/+QWnowwQxURC+H8h6f4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738753839; x=1739358639;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=25vmM3WoixqGh8oiw4BW3dDJclVHBEWYqum0PDIyxB4=;
        b=v3UUwoaHz/HAN9B4MS9TOiPINYNxpQRZVgMQFDPYdF4bBJZ+frsFPsk4lm9ht9uYr/
         C2ztRdMYH3ir4ENTne9ZivqcZRrzhOO2zLHO+ffplYmfdLp5NvHi1QO7KndC3H2ocqB1
         SFWg2RsghtxbZB3jzhe9Y9fhbSGH+OC+0b8dOdISfNTzn/11AGFnAE16sXoQ74viW8kX
         XZ20+YWoyIjYrOGbU9ikvDWVlUfd8h9MQ7U/XjM7MkWMC5b/eDspBcDIn9Sh/EWZdZVp
         iRKK8w0uYVD8QuMNiYL5Oag0m7fEc1RoudlBpS6BgCvitMcCwMLIX3GqZfqLThzP904H
         SIKw==
X-Forwarded-Encrypted: i=1; AJvYcCWmaGpS6TV+u7wCIzdKXpwCq+b4TRzst73MQUzBWwWmj6tMkrSBn1q1RiPiAyJd+E+/EU/OPw2j8gUOw3tyHvZzdg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzsn2kJv4NAtaQ2HJAE6+LraM7Edul+MQ/DGtF4rT2VO5KG6oMQ
	9dwI4t7tv4D+wKSluK7uBlKCw8z5tqOCIgGwpYIuhaB5cilLsG3oCUCJwi5DAGw=
X-Gm-Gg: ASbGncs/tIqmGU3lnZsm+8CxdSLeoPexaszVbd6WpxHdpHmuJZcUPkrYr7HjFV9JlDB
	5/MDLWNrcA7102ZOecuTDj8l6hP43nhzsZ2fZDQz/D5EVIZ40oYSrTUBujX10EmTxMwPzDKdToi
	RNIthXsOCyK1aZoFcmE/rB9kLLyglS28hgkQxxmbbtbK31mqhG58ha8P3W6c9pyoYw7tL+0b1LL
	7otq2Or04+x65m0Q2TC5diy0DCurK5h1rzg9CMWIIPrFp+x+Fne2HOr5M2+nkC0hhMP/I1uc2rg
	tBafsmFxLqY7SXf+G+nJo/JytNFm/7rZpXFS4DwLNPpBx9fkCDmqq/AEzaxo1SI85xB4UoOTdXU
	RtS0D
X-Google-Smtp-Source: AGHT+IHiHqU82wm7GoeNW9bbjjAw4Y9GZ3hIczVHe98XBD/vP+UZvjcx0c+o1V4H7+vPtzHdO6VXAw==
X-Received: by 2002:a05:600c:4ecb:b0:436:488f:4d8 with SMTP id 5b1f17b1804b1-4390d434843mr21650615e9.11.1738753839294;
        Wed, 05 Feb 2025 03:10:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:be8c:5293:84c1:352a? ([2001:8b0:aba:5f3c:be8c:5293:84c1:352a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d9334e7sm17612115e9.6.2025.02.05.03.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 03:10:38 -0800 (PST)
Message-ID: <378a05664499bf7d4dd91a05fdbf02cbf48bc0d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: esben@geanix.com, "Richard Purdie via lists.openembedded.org"
	 <richard.purdie=linuxfoundation.org@lists.openembedded.org>
Cc: sean@geanix.com, Ross Burton <Ross.Burton@arm.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Feb 2025 11:10:37 +0000
In-Reply-To: <877c64fzvf.fsf@geanix.com>
References: <20250117130851.4055166-1-sean@geanix.com>
		<C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
		<3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
		<ygnmol4i3p5iixvkrzw6spgljha7vnx6zjljajqr4q2j6r5mvo@eud25kakycyq>
		<38dd9094715c7221474248449177f995a443eea6.camel@linuxfoundation.org>
		<87frksg5i5.fsf@geanix.com>
		<f7ca0ce2a482d4b52d55f026bea16ff8475e0b2a.camel@linuxfoundation.org>
		<87bjvgg1jr.fsf@geanix.com>
		<4e7e8eea32f307dd28e5bec216a1b149e42ba5f3.camel@linuxfoundation.org>
	 <877c64fzvf.fsf@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 11:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210843

On Wed, 2025-02-05 at 11:29 +0100, Esben Haabendal via lists.openembedded.o=
rg wrote:
> "Richard Purdie via lists.openembedded.org"
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> writes:
> > > > We'd at least need to make sure there were clear errors about why t=
he
> > > > configuration wouldn't work.
> > >=20
> > > Do you mean
> > >=20
> > > 1. Why adding usrmerge to DISTRO_FEATURES_NATIVESDK won't work?
> > >=20
> > > 2. Why tool X, Y, Z won't work as nativesdk tools?
> > >=20
> > > As for the answer to 1, it is because you are not accepting fixes to =
it.
> > >=20
> > > As for answer to 2, that will be an uphill battle, as more and more
> > > tools are starting to assume usrmerge style layouts. It doesn't matte=
r
> > > if you like it or not, but given the dominance of systemd, it will
> > > happen.
> >=20
> > We should just do what systemd says and drop support for musl, sysvinit
> > and anything else systemd says?
>=20
> No. And you are being completely unreasonable here.
>=20
> We are discussing placing a single symlink in the SDK, and know you are
> implying that this is a part of a greater plan for removing support for
> musl and sysvinit.
>=20
> Sorry, but that is just being bully.

There are other ways to solve this problem.=C2=A0

Sean said you need libudev in nativesdk and I'd imagine there are other
ways to manage to build that without changing the whole SDK layout.
Sure, that is probably a path of least resistance but my point is that
I don't think it is the right one.

One of my jobs as maintainer is to say "no", at least occasionally.=C2=A0I
don't like doing that, I don't like resulting accusations of being a
bully, being brainless and making OE worse.=C2=A0It makes me wonder about
resigning and walking away from all of this as I sometimes feel I've
just about had enough of it.=C2=A0Does anyone actually care since I'm makin=
g
things so bad.=C2=A0

Not every decision is one everyone will 100% agree with and sadly, that
is an unfortunate consequence of having to make a decision in the first
place.=C2=A0I do merge a lot of things I don't like or agree with.

FWIW I'm also told I don't say no nearly often enough :/.

> > >=20
Richard

