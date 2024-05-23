Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44677C41513
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 09:26:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.12691.1716456398133676738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 02:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OBLEaio2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-420180b5838so36804845e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716456396; x=1717061196; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDyD8hV3JQluL2Hkp3BHPi34TLx8kJ10x/1l343Yts4=;
        b=OBLEaio2nQAt/PgEd8oBw/NX/SH5OPty6+wpC4KhBVU2UJyqLsQWfrfCelnsAUwaHi
         O1MDdy3gM/DaWRcsYsi0tgSOED7q2hYtkx4iX0l/3tTYw2QpkDMOvQnkBIl7SV6J+xlO
         MDovODYksboqp+ccCy4XvkyQktao3ryEfpBXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716456396; x=1717061196;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDyD8hV3JQluL2Hkp3BHPi34TLx8kJ10x/1l343Yts4=;
        b=AvSmKwdQFHyK1FULKOngUGvYJTFwztMxQbIphyIHWa1dlBdkMbyZs+qG20uXmuT3Gq
         LjrArlj++BfhWYoDhkR643A5MzI1hvCYTsGB6awSg0un9VFzvP1Gzf061cdIUii4iSV6
         3lUDGMNeiAHDeEpkLekVgwEE9a5oFyXk1l1LzA2+47ayXOen8TKja+PkDs+RPRgN8Euv
         jEi62VJnIWQkC157bj1t1hjLpPRHA7+8S+YIrESioJFrdNdmuz5I+WlG2aC2yxLuFg8q
         KY7jK2ClPGCWRDeLk2qE2Lz9FBIZM2HGjlbwVOt3dmhSWioxRaR4X6Yk10Fpp6hSKjED
         AnBA==
X-Forwarded-Encrypted: i=1; AJvYcCUL3g4SeyKNdGq5M9eqi6IKiVvBbrnKv8ZQsfC+biwT06Tny+5On11hyDxUgJK5LKSNkofBc2K7dJxPQGNZLLxk92SwHCZbdBbWx0jZnrcHtv3V2Zt3fSnS
X-Gm-Message-State: AOJu0YxG/Lia4eqEu83V3Ll75M6j0QYqGWZT2A7idQfiLKzOohNYJVDD
	ojuK8scgL+SpFgk1rKgS29q6Jvts30p0MUM0kNA1sQR4TCIERMFUZWfpGk/rK70=
X-Google-Smtp-Source: AGHT+IEoutaaYUhuFCT4bU6HGFQSpo8piQTqZB6yNF58De39DlsNGiK3npCpZ9568EKXJSReH5dQ0g==
X-Received: by 2002:a05:600c:310e:b0:41f:d84b:1ade with SMTP id 5b1f17b1804b1-420fd33b88bmr39548405e9.27.1716456396275;
        Thu, 23 May 2024 02:26:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bf06:e9d5:d26:9301? ([2001:8b0:aba:5f3c:bf06:e9d5:d26:9301])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm19596925e9.17.2024.05.23.02.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:26:35 -0700 (PDT)
Message-ID: <c6d590b949aead11a62e2ce1c75f167a1d76ea44.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] proposal: controlled deprecation
 process for oe-core
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, OE-core
	 <openembedded-core@lists.openembedded.org>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>
Date: Thu, 23 May 2024 10:26:34 +0100
In-Reply-To: <CANNYZj-DL-vo-7kdmij6Rze8J2gy1MYmdfOVGN6F7-73dVdbFw@mail.gmail.com>
References: 
	<CANNYZj84YtfRPXWm7c=DV6mOeQwVJaKLyeOHd7ni6PtZYx88BQ@mail.gmail.com>
	 <6a6aaf4acf3baf2406789f7d00f4f07ee2444d95.camel@linuxfoundation.org>
	 <CANNYZj-DL-vo-7kdmij6Rze8J2gy1MYmdfOVGN6F7-73dVdbFw@mail.gmail.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 09:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199786

On Thu, 2024-05-23 at 10:35 +0200, Alexander Kanavin wrote:
> On Wed, 22 May 2024 at 10:24, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > So yes, there may well be a long list of things you want to remove from
> > core, however, we also have to think about the project's use and why
> > people use it. It is often because we're able to support many weird use
> > cases and interesting scenarios that people do adopt and use the
> > project. I don't want to have a clinical core that is so opinionated
> > about how it should be configured, people can't innovate or experiment
> > and go and use other tools and systems.
>=20
> This and the rest of the message presents the project users'
> perspective well and the arguments are solid. I don't have any
> substantial disagreements.
>=20
> What it doesn't do, is acknowledge or mention the maintainers'
> situation, and the unhealthy dynamic they find themselves in. It's
> nothing new to you perhaps, but to make it clear: appreciation rarely
> if ever happens, but complaints and demands come steadily; work has
> been routine for years; asking for help is met with indifference. All
> the ingredients for burnout are present. And we're all left to deal
> with it on our own, developing coping strategies privately.
>=20
> Lately I've been feeling downright *resentful* towards the embedded
> "industry" and the amount of freeloading they do. So this original
> email was partly born out of that sentiment: try and see if I can do
> something that shifts this balance, particularly by being able to say
> 'no' to some items that are in core but in my view shouldn't be.
>=20
> Mental health is not a privilege.

My suggestion is to only take on the things which you're happy and able
to work on. If for example ppc or mips is breaking, just leave those
bits and let someone else deal with them. Post the patches and just
make it clear those pieces break.

The dilemma of whether to take them or not becomes mine and really
isn't your problem, I can try and find help to fix the remaining
issues, merge it and break something or find some other path.

I appreciate you don't want to push that work to me, equally, I cannot
reasonably expect you to do it either and you have every right to only
work on the pieces that you want to. I've made my position clear as
there was no other way to change it without people knowing but that
doesn't mean things like that can't be pushed back to me and I have
ways to handle it.

I have been feeling bad for a while about replying with the long lists
of test failures for changes people submit, it is quite hard to make
changes to some areas of the project now due to the shear complexity
and diversity of use cases we support. I wish I had good answers to
some of this.

I will say you're not alone with those resentment feelings, I know
others have them and I've shared my own thoughts on the topic too.

I'd highlight that it isn't just about old things either. Rust in
particular showed up as a particular pain point in this regard too
recently - several different requirements (reproducibility, automated
testing, upgrades, intermittent failures) all combined to make
something particularly horrible to wrestle.

As for saying "no" to things in core, I have a list of things I really
dislike in there too. I've come to accept that many of them are
extremely useful and appreciated/used by others though. I try and avoid
them where I can, sometimes my expertise is needed to fix them though
and I usually do. rm_work comes to mind as an example. Our ecosystem
works as it is bigger than any one of us and it would be strange if we
actually liked everything in there so compromise is needed in places.

So I come back to where I started, just focus on the things you are
interested in and happy to work on. The other pieces will resolve
themselves one way or another over time.

Finally, and this applies to everyone, please do look after yourselves!
That should be a priority for everyone.

Cheers,

Richard


