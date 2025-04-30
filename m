Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16239C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 10:20:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.13409.1746008418327551247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 03:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YuF+JkaG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so5290363f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746008416; x=1746613216; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uq4p7Z7MV2Imtzy4tXC1LJvbSsyDcnO0nPCLv4lop9w=;
        b=YuF+JkaG2akLd1MFE8LeDxC5Bphz4zoRhCEHNi0dY6LuQFTLl4BDVp4xhA2M0U5FZ5
         OwU+LWyQLOy+ieq8Pe/q9joCva26+J7xScoHnCQqaafhNdwcYVwPxMUfaaV2rYQg0/sb
         mOctaPP4aiX7xDnuD2xRfxCgjm0Q1j5pukjhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746008416; x=1746613216;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uq4p7Z7MV2Imtzy4tXC1LJvbSsyDcnO0nPCLv4lop9w=;
        b=D7fp53KZRah43n2zqbiucWmLNfHjGVRHyZVFa06wGiHfDApmVGzOsoP2LEdlzdJEfl
         BPWfIy7BEVxN9LOgbWuGPVfpaLpGnZX/un1dV3Yh8tvT52sDaGPhZeN2qmK3J6VpKmBr
         Acoxt5oYkKFPcEmiXvDyXEUiPtOXoyrvc2IL8FqhuLk3kGGz6Ar3X1eWRwdDnUE0UjSC
         l0C+OeIjJT6pmilGSj+y1rMZq6FLxWpg/HKg7+yA+a/LqUSZWzBT1Zo4ItRSURukXouN
         kvAEWc4bfxD6TWoflRy9dV5BQV7JgzGBz14AwAIUPP3hK/wWHYUKPXeN71c/kooMY9ni
         7LWw==
X-Gm-Message-State: AOJu0YwfKWqub/oylj3BOqfHzcM63xYKVKUiF++D/foxu7q7xbv9Dz1c
	SKEFGgpRsOUVUqKlDMajC6R4tKKDaeQF0frn+kD7OyseXkLZR7EQvaDDO5Hq1C8=
X-Gm-Gg: ASbGncuN9u7TirztC25BtNBNb1xD5VcBGEXdwhKFpQCel8imUM+yCkxOcSU+q4htknb
	KTZgIn3puozPsthG8rhzlpp999dGIkEhHa0IKxPJkyGomqByUhglq26ZOKTLGN2SRGD8zUImvuE
	QJnl5lY+LpeLx0RniiKlY2+03w0RGnvGKBxuj8hd36AD0Ddc9RD3sWfCJvlwScE4+ytv15ko9Ge
	ZdzlILrocUCa64G9UQACdtFWX6xZJhOvVSyqWwskqlSNXKpehT7EfxWsy4+nr7n+YJ9E9OL4dls
	CRSbTJ6rw61UFLvduo80bgf4+EqEppZ2ErD1OxpxAsphUjf81Xt8ki86tcc3l64uBaaVsVx3SHq
	vYG9tUlazIcicEySDMXC1UrJZar7t3g==
X-Google-Smtp-Source: AGHT+IEO0dJ7HjfoohymJp+/hdeH3Y6dZ5CBIvyACCELEmpNUGpSTjPYXWp92XbJJUA+7e45Vcnr/w==
X-Received: by 2002:a05:6000:400b:b0:3a0:849b:23a2 with SMTP id ffacd0b85a97d-3a08f771df3mr2463082f8f.25.1746008416339;
        Wed, 30 Apr 2025 03:20:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:da55:d8b8:29ea:771c? ([2001:8b0:aba:5f3c:da55:d8b8:29ea:771c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8d769sm16835596f8f.12.2025.04.30.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:20:15 -0700 (PDT)
Message-ID: <f8ee9dbf94bf37d436e94b3cbe2aa9362587b455.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 30 Apr 2025 11:20:14 +0100
In-Reply-To: <CANNYZj-g2t4s86QBTvEYj5W1GPA_z222FeeNz4GUqYmhNMtG0A@mail.gmail.com>
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
	 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
	 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
	 <18394019E7982924.8448@lists.openembedded.org>
	 <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
	 <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com>
	 <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org>
	 <CANNYZj_j9TnJGEsfQ9fuivKQ0KcZgSyCc-OXbyXvzOuy2=S68g@mail.gmail.com>
	 <db5f670164880a45133b2133b3957214b3ff0880.camel@linuxfoundation.org>
	 <CANNYZj8ooWqS1OXO7M+S4wgX8sVkWG3wTiCb5s-bnZhE9CxZRQ@mail.gmail.com>
	 <a0571f14790862528506c994f349a78517031624.camel@linuxfoundation.org>
	 <CANNYZj-g2t4s86QBTvEYj5W1GPA_z222FeeNz4GUqYmhNMtG0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 10:20:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215739

On Fri, 2025-04-25 at 19:29 +0200, Alexander Kanavin wrote:
> On Fri, 25 Apr 2025 at 11:31, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > 3. This will also break all the tools that assume the current
> > > structure, and another reason this change shouldn't be taken lightly.
> >=20
> > Perhaps, or perhaps not. Do we have a lot of tools that wouldn't cope
> > with this?
>=20
> Likely Visual Studio Code support will have to be fixed? Impact of
> changes like this is difficult to predict until they're done. Then
> everyone comes out complaining their private scripts broke.
>=20
> Otherwise, I'm slowly getting convinced that this is the right thing :)

I think you can see how my thoughts ended up here :)

>=20
> > That 'logic' is effectively what do_unpack is already doing itself to
> > maintain 'compatibility'. Perhaps we could use the same logic in both
> > places and be consistent!
> >=20
> > I'm torn here. I could take your patch, bury my head in the sand and
> > pretend everything is fine. We could try and actually improve this and
> > set things in a better direction for the future, at the expense of
> > breaking things in the short/medium term. I don't know what to do for
> > the best here to be honest. Taking the patch is way easier for me I
> > doubt we'll ever improvements if I don't push back on things at times
> > :/.
>=20
> Here's something I want to propose, feel free to shoot it down. Should
> we start by just dropping support for this legacy compatibility of
> sources in workdir, and S =3D "${WORKDIR}/something"? So S, when set
> that way, becomes a hard recipe_qa error, and sources are always in
> UNPACKDIR. Yes, there would be a ton of recipes to be fixed, but the
> fix would be largely a search-and-replace. Admittedly, I didn't follow
> the arguments around UNPACKDIR closely and it may have been talked
> about, but why not just do it?

I think this is where I got to last time I looked at this. I ended up
introducing UNPACKDIR and cleaning up some of the stuff and leaving
that workaround in place in do_unpack.

To be honest I'm torn. Part of me wants to do it, part of me worries
about the breakage. We probably would need to prototype some patches,
see how bad it really is.

> Then this fix for devtool wouldn't add more complexity, it would just
> similarly replace workdir with unpackdir - not making things better
> but not making them worse either. On the other hand, if we do nothing,
> then devtool currently doesn't work for recipes that set S to
> unpackdir, negatively impacting AUH rates for one thing (this is why I
> got into it in the first place) :-(

I agree we need to do something, it is just a question of what (and
perhaps when).

Cheers,

Richard

