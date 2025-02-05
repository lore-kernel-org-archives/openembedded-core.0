Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A43CC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 10:10:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8599.1738750208092843323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 02:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dAYdCOv2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436345cc17bso48736575e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738750206; x=1739355006; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=duOfHFyTBcnLxHBQt4n9TkcLWAiXWL+g5RhVmOibtlo=;
        b=dAYdCOv2RfDMYWO2zaeKLOFaDHLxkrZ28HDHBb509T+hVZFa+8/GdIhxPpdH2qdXYF
         dbJDyEtac9G0DBjFBdhUn0kKhc5z5HjCmjQYZTMNJ0zLpwObwFvTeThXQAOeuVUSnx2y
         PtgGq7Hf5dmYkpV2xozFSEFPXXy9FCDPCNVWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750206; x=1739355006;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duOfHFyTBcnLxHBQt4n9TkcLWAiXWL+g5RhVmOibtlo=;
        b=asHvwHeLQg4S1A5s60qoy8NZrvsOwt9+TPfOe25P4xVEEcvFVUAHUqXBE++20kcumR
         vsVjxqzYVlSrr5/OTEBwAF3u3uv4LLXA9eDb8YSLUWfbMXKfA48GGY5uTJNLd5uNePdL
         cVmCBf1xOrFUpdlmx50f9aHltE54dd9ZHaWdQyPASbfTJq6vY4d6YGHvJ3HWiVtxvXXa
         gwG73nH5I3mksWAQtztxk+c2rvWv+SJyhVrF3qXZAgI18sv0fsZaTjfasLw18/McRO3T
         abDHCQaP7X6nwtiqTptHmVEkDS/Xp0ZlpnEJR0SFP8v5zLtKWa4Pgg8kboRnTE3jk39s
         nxvA==
X-Forwarded-Encrypted: i=1; AJvYcCX40qfTkQuDWhbi1WbnhBuRwXH2+uLU1LXfRIsVYnj4u1sQN18iINET7DbeXW9iLddTzrh95me6PaWYMNjzv78wpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmLDlSWUolASZlCpBvbzHNM/ZwiIC5Ex3Tnp4uZ/6r3603tLZa
	XjQ2Os7oIuDwk3j6expTYU9CgaXQOmjb5fJGJ8nnUyJk87p0DdhwD95nwQmxcgs=
X-Gm-Gg: ASbGncsUT9x+oHUV7EV6xjZfEnMmQPQutibKeerFQ1APOhneHesSh4U/K6t9bkSB22t
	tsLbng4r33p6QtMn53L32NYJ973JfL4KNHGt8gs9s3aEYhUkKoWv1evZFnP/7zFBQgny6nJOgpv
	JtgSxgswFgQV2aV+/mUiVRBHsDCXz6nMsArBPTFbFaHclf7Hi5VwwyW/RFs4EEMWhdruzFH/h7G
	3FJgTwpmD7bmNEeBf9yxGVSz4dt2gSdHckQKO+hm0BR1Q8i7/zzrTU8HCV6jJAAuOszhuS+riPd
	U1XtTabRwdoacd84lZ795o+u9WwFYnOA8syLIzliOd8Foy/W6QVeAAl0FEWe6osyYuZaboeIrKM
	HQxUF
X-Google-Smtp-Source: AGHT+IEQpupekFRAZhBcdiWvyEzF5K582pVf1s0T6XJK9XpDeoLy/JPJZMwIf2f6YxQ/YGVtRtxNuQ==
X-Received: by 2002:a5d:6d85:0:b0:38b:f3f4:57af with SMTP id ffacd0b85a97d-38db491f1c1mr1684887f8f.35.1738750206151;
        Wed, 05 Feb 2025 02:10:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:be8c:5293:84c1:352a? ([2001:8b0:aba:5f3c:be8c:5293:84c1:352a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm3630099f8f.48.2025.02.05.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 02:10:05 -0800 (PST)
Message-ID: <4e7e8eea32f307dd28e5bec216a1b149e42ba5f3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Esben Haabendal <esben@geanix.com>
Cc: "Richard Purdie via lists.openembedded.org"	
 <richard.purdie=linuxfoundation.org@lists.openembedded.org>,
 sean@geanix.com,  Ross Burton <Ross.Burton@arm.com>,
 "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Feb 2025 10:10:04 +0000
In-Reply-To: <87bjvgg1jr.fsf@geanix.com>
References: <20250117130851.4055166-1-sean@geanix.com>
		<C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
		<3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
		<ygnmol4i3p5iixvkrzw6spgljha7vnx6zjljajqr4q2j6r5mvo@eud25kakycyq>
		<38dd9094715c7221474248449177f995a443eea6.camel@linuxfoundation.org>
		<87frksg5i5.fsf@geanix.com>
		<f7ca0ce2a482d4b52d55f026bea16ff8475e0b2a.camel@linuxfoundation.org>
	 <87bjvgg1jr.fsf@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 10:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210839

On Wed, 2025-02-05 at 10:53 +0100, Esben Haabendal wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>=20
> > On Wed, 2025-02-05 at 09:28 +0100, Esben Haabendal wrote:
> > > "Richard Purdie via lists.openembedded.org"
> > > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> writes:
> > > > > Is anything holding this back?
> > > >=20
> > > > Yes, there is.
> > > >=20
> > > > You're using the SDK in a way which it wasn't really intended for a=
nd
> > > > we're seeing "feature creep" where systemd's requirements being pus=
hed
> > > > into places they don't really belong.
> > >=20
> > > Applying "usrmerge" to SDK is not a systemd feature as such. In my
> > > opinion, not splitting binaries in multiple bin dirs in general makes
> > > sense for an SDK. And throwing in a simple symlink for making stuff
> > > work, is super innocent in my opinion (for whatever that is worth).
> > >=20
> > > What is so fundamentally wrong or bad in allowing people to create SD=
K
> > > with usrmerge?
> > >=20
> > > > If systemd was truly "cross", you wouldn't need to force the target
> > > > layout into the SDK.
> > >=20
> > > There is no pushing of target layout into the SDK. The need or desire
> > > for having usrmerge in SDK is independent of target layout as such.
> > > Of-course, if you are having any kind of systemd tools in SDK, chance=
s
> > > are that you are including some systemd features in target rootfs as
> > > well. But in theory, it is really independent.
> > >=20
> > > It is totally possible to for example want to include systemd-repart
> > > command in SDK and not have anything systemd in target rootfs.
> > >=20
> > > > The SDK layout should be independent of the target
> > > > system and this breaks that understanding.
> > >=20
> > > I agree on the former, and disagree on the latter. What Sean is pushi=
ng
> > > here allows people to build SDK with a usrmerge style layout. If they
> > > want to use usrmerge layout in rootfs layout or not is a different
> > > story.
> >=20
> > Play out this scenario. Firstly, we would now officially have to
> > support two different SDK layouts. The alternative is we don't test one
> > of them, which would imply one of them is broken some of the time.
>=20
> What do you mean with "officially" here?

Tested on the autobuilder. Taking that patch would be taken as a sign
we planned to support that workflow.

> Right now, as I showed you, you can try and add usrmerge to
> DISTRO_FEATURES_NATIVESDK, causing SDK to fail.
> Are you saying that we should see that as a "feature"?

You can do lots of things. If we take patches fixing things it does
imply that workflow becomes more supported.

If someone files a bug about usrmerge in nativesdk, are you saying I
can still close it as "not supported" even after I merge patches fixing
it?

> As it stands now, anyone that for whatever reason comes up with the idea
> of adding usrmerge to DISTRO_FEATURES_NATIVESDK will run into this
> problem. Is that a good thing?
>=20
> > As soon as someone wants to include systemd-repart or libudev or one of
> > these other tools, we'd effectively force the selection of usrmerge in
> > the SDK since it won't build/work otherwise.
>=20
> No, we would not be forcing users to do that. The tools that are
> implemented that way is forcing that choice.
>=20
> It seems to me that your suggestion is that Yocto users should not be
> allowed to use such tools. At least not without out-of-tree patching.
> Please correct me if I am wrong.

I'm saying that out of tree patching in this case is definitely
preferable.

> > We'd at least need to make sure there were clear errors about why the
> > configuration wouldn't work.
>=20
> Do you mean
>=20
> 1. Why adding usrmerge to DISTRO_FEATURES_NATIVESDK won't work?
>=20
> 2. Why tool X, Y, Z won't work as nativesdk tools?
>=20
> As for the answer to 1, it is because you are not accepting fixes to it.
>=20
> As for answer to 2, that will be an uphill battle, as more and more
> tools are starting to assume usrmerge style layouts. It doesn't matter
> if you like it or not, but given the dominance of systemd, it will
> happen.

We should just do what systemd says and drop support for musl, sysvinit
and anything else systemd says?

> > These two factors combined effectively forces everyone to that layout
> > whether they want to use it or not.
>=20
> Switching to only supporting usrmerge style SDK layout would be fine
> IMHO.
>=20
> > I really don't like imposing design choices like that by stealth.
>=20
> You/we are not doing that. Somebody else is doing that. If you like it
> or not is not really important. It is there.

We don't have to just accept it.

> > To be honest I'd probably agree about only needing one bindir but what
> > I object to is doing it via usrmerge and doing it because systemd
> > requires it.
>=20
> Sorry, but that is knowingly making OpenEmbedded a worse tool, without
> any benefit. If we switch to having one bindir, placing a symlink to
> make stuff work is a no-brainer.

I very strongly disagree.

The point is that OE supports customisation and layout is one of those
things. We use layout customisation to make the SDK work at all.
Removing/limiting the ability to customise undermines one of OE's key
values. Even chipping away at the edges of that will ultimately
undermine it.

> > If we did it, we should do it properly and for example
> > skip the symlinks since we control all the code.
>=20
> Most of the code is only under our control as far as we are willing to
> patch it.
> I believe reducing the amount of patches to 3rd party software was a
> good thing.

It is, but there is also sometimes a need to patch things.


>=20
Richard

