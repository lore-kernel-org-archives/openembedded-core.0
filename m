Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDE4CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 16:31:46 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.511.1755621101725894322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 09:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bTYY1h8B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so39360995e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 09:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755621100; x=1756225900; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8C9H3r9Ql7oTKQzWPUlPsfw897m4+lnH2gCX/8GUzls=;
        b=bTYY1h8BUTMeTkpPx1ASvJSHo/K+5dEVrerpE8AJ/erQzblnV1o/ZDjIq54B8rds8q
         G3w5Rv2AfXGEYo3zi9X3UELD5Dsqs2p8//aD+0C1gtB3XjMRuG7moONsiWwLFY20Aa+c
         T81ZRmZEoh8M/oYuLu2FxEWmfwWhO/F86UFwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755621100; x=1756225900;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8C9H3r9Ql7oTKQzWPUlPsfw897m4+lnH2gCX/8GUzls=;
        b=CLOkL57F83ku0GzeBaU0FulRm4N6AKeXCNFlrWWoX6tSp1nFRB6c6U74DX/X67ZQSx
         E/kBrWsGwlVn+mLiU1SpthhlgYnXdzIMDOsKUpxmy6VWkdOlbv0Q21rJMrFJTB2PVvTp
         WNzyEfCtffJC+LH/UkGQdsb63ctVrhINtdpKZHnrGGZHkfI9dIh1CP4AYYWbW8pRkQdm
         Pf5kj6Mhw6rY9LdBScUdb8cFMRBnrpIm8A4hnzOuUvfHsfwdL6HSjI//DUDebzqBDczN
         VY7Fw2cKawWO7pJoZOHb4qSXoZ6Wyplc+ZcWP2ntTFhF8EN7Qyrkvn+v848UTwypCD3b
         XKdg==
X-Gm-Message-State: AOJu0Yy3oO9rdCIJFhm0EVqVa8OFaoWsMMMvxAPfr18mViQSYEOHv/vA
	xkdA5sOT6F5IPF/NoxG60fu4VxrA4U4i+xiSQ9M78C5eajX71mpLUkk+mq+Lr/myLSc=
X-Gm-Gg: ASbGnctD7bwvL/oSmjoz39KMLN4EfqVj5i2P6hfvwtKAtqdlmIgYcYASL9DWKVj0Gf4
	kZDvAlBedgv7N4FhJNxchbA79ac+T5AEqIDYRRSQ+8PThrkfTfcMk7GUQrbbQgwOs3zOhRdbGLM
	vzw/aIe6BcYG0iNyDhdnTZDpP7A4bgrqcetKurAjCtDtuhuBpeYqklq7iYUYVVBVjrv5sYCMoZC
	E6bZLhOadcx7kBwqmD0gDZUmKFz1aKFzVFcL2RdXgj+rUfDGVIC9ukIeDjJCAcF+HudELk94W2a
	fYc8Rxpbmtrwn3gcnRc/tmmmwtU0dTx6+8KzQEouOMA4/Km4mk0+f9zNzmfGQNjndSsnAPu4b92
	dgnvlA1pY/8e/my84FxvUnaTMMC0SJm/ZIA/oonIJqT0qOSHIqEQu4g6en1tXFRr6r6Z5ZEEdz5
	KPr4kz0BFVEhQqIPKq+IZA+rre0Bnd1kba
X-Google-Smtp-Source: AGHT+IE06OeTxK0v2ssRvVk+tdYJ4hunnAsrxWj0qG5uASROJbpXzx48O1pMKR6G4YzJCXTw039yig==
X-Received: by 2002:a05:600c:8b17:b0:458:a847:671e with SMTP id 5b1f17b1804b1-45b46bf4258mr6149585e9.23.1755621100055;
        Tue, 19 Aug 2025 09:31:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d5c:7b3b:65dd:ef80? ([2001:8b0:aba:5f3c:3d5c:7b3b:65dd:ef80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c748a9esm219227935e9.19.2025.08.19.09.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:31:39 -0700 (PDT)
Message-ID: <dd63bc2f1d4d51e76550b2653fef3f35a0adee6b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] e2fsprogs: Fix build failure
 with gcc 15
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Quentin Schulz
	 <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com, Khem Raj
	 <raj.khem@gmail.com>
Date: Tue, 19 Aug 2025 17:31:38 +0100
In-Reply-To: <CA+chaQek-wO5DvPanFJpC+hCgMH2FLn_EeStsgvXDy8LBb4Acg@mail.gmail.com>
References: <20250817205033.3845672-1-martin.jansa@gmail.com>
	 <8d5f70ac-7a0e-4c1b-b1c3-3949412843c8@cherry.de>
	 <CA+chaQeo_Fa9G-4rNRuihvsnHbGJFZx_8JS7CHV83KY1w9uFBw@mail.gmail.com>
	 <905aedea-e2b1-4b07-8f6d-f68863f60f0d@cherry.de>
	 <CA+chaQek-wO5DvPanFJpC+hCgMH2FLn_EeStsgvXDy8LBb4Acg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 16:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222120

On Tue, 2025-08-19 at 13:36 +0200, Martin Jansa wrote:
> On Tue, Aug 19, 2025 at 11:57=E2=80=AFAM Quentin Schulz
> <quentin.schulz@cherry.de> wrote:
> >=20
> > Hi Martin,
> >=20
> > On 8/19/25 11:24 AM, Martin Jansa wrote:
> > > On Tue, Aug 19, 2025 at 11:21=E2=80=AFAM Quentin Schulz
> > > <quentin.schulz@cherry.de> wrote:
> > > >=20
> > > > Hi Martin,
> > > >=20
> > > > Do we actually support any distribution for Scarthgap that has
> > > > gcc 15 in
> > > > its package feed?
> > >=20
> > > I haven't built the whole world, but these changes allowed me to
> > > build
> > > our images with gcc-15 from ubuntu-25.10 with scarthgap (and 2
> > > more
> > > changes sent for walnascar).
> > >=20
> > > So even when it's not officially supported (or tested on AB),
> > > these
> > > changes are safe enough, right?
> >=20
> > My opinion is if you want to build an old branch on an unsupported
> > distro, you maintain a fork yourself. Otherwise use containers
> > (kas,
> > CROPS, ...) to build old branches on unsupported distros. Master of
> > course is a different topic, and patches to support new
> > GCC/glibc/musl/clang/cmake/whatever on yet-unsupported distros is
> > *very
> > much* welcome.
>=20
> I use containers, this one with ubuntu-25.10, I can switch to older
> ubuntu if needed, but it's useful to catch issues early (by someone
> who can also provided patches where needed, instead of random people
> reporting that LTS versions don't work on their new system).
>=20
> All of these changes are backports from master where it was already
> fixed by Khem or me before (with the exception of cairo where I've
> backported just 2 fixes from upstream instead of whole minor upgrade
> as the rest of the upgrade isn't needed for LTS).
>=20
> > I'm not sure we need to add on maintainer load by patching Yocto
> > for
> > unsupported distros. But that's a call the maintainer(s) and or TSC
> > to make.
>=20
> Agreed, Steve already queued the patches in scarthgap-nut, similar
> fixes were already merged in meta-clang and meta-tensorflow, so
> hopefully these small changes to keep the LTS buildable on newer OS
> versions don't add too much trouble for them.
>=20
> I am not asking anyone to regularly validate that older LTS work on
> newer OS then what was originally tested, but if small already tested
> fix is identified, sent and doesn't break anything on older supported
> OSes, then is it too much to ask for it being applied?

Our policy has been to accept simple changes to keep the releases
building on newer distros as long as they're not too invasive/risky. As
the releases age, the barrier to entry increases.

Where a distro is known to work, we also have been known to enable
testing on it. It really has to be on a case by case basis though, not
all distro changes are equal and we can't know in advance what they
are.

Cheers,

Richard

