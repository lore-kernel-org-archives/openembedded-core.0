Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174DBCD343F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 22:18:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9105.1779142735255793702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 15:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aPCqZ0V7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-459bf19e87bso1676205f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 15:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779142733; x=1779747533; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSE5Ej8NNQM6U1kcTPqgCFMqj/dEKS9P7/TV1n0ohNA=;
        b=aPCqZ0V74zR+9Brk2nBeIezzvzPrNnRWSS3jjOM5uxr24jwNxMl/yFqIzxOxjx8bet
         BF5TfON82YY4FY77jt3Hsm/wM7SR2kvQVrqH48heJ9wuw8bGqPE2hpnoroTNAZWPY6Xg
         xRMo97E+GdnjtiCAtlFBOBO/twm0I8dAzAkzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142733; x=1779747533;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSE5Ej8NNQM6U1kcTPqgCFMqj/dEKS9P7/TV1n0ohNA=;
        b=HgRKoNOE7iGVvVl4VU0M4QgPPPR7KjDmmqskUvfbNZh3kPPC6kZCxj7uzOKc9S3hb2
         nXSCQX+ix+wa7CJbbbbSqyQMIOBY9v4y3SNop4Ssv0rMXiRQn86eZQ2UT95MuJN6h1xh
         xCTSkcZR2XPHSnKfQccUzQgXwkDJa6f3mGWXP+g5TReqYq+2WL9lOwR3ooGhiebBvx8C
         jXfp1eeiQSOvUF+DNAVgGHij4tS3N7LozBRkkdC4qxRlTjN8bIqaTwtBVTetylTC4LOM
         IpH1NTtIbk2lFXnRPteLupPTRMXXe8w8bRxfqTW9fYfZrXRluLtwsRw58SnFT/kQlVQ0
         hsDA==
X-Forwarded-Encrypted: i=1; AFNElJ80pw02PbE96b8BCcqFBfhWFV/1oud53hwbNTvAzLdyi+papZnkY0jC2Qq+a3GJXjPSmUKri4nhPt30xdHcoBEWMQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3WdxBNHrKT65CdBoDUnc4QFXFXFW2YkblfGb4TT/gic4C8+Nx
	XZKGrTLKct9Ot4lkETmLtchTgv7tzgXzk68F5Ap2CUQjPIIy01/O7T33dguJ7PfzT2U=
X-Gm-Gg: Acq92OFxn0itq0VBmjdiypyt660hL10U1Qt6g8uuMBnL+0/1ryqkttvxV+EwpeLTzgS
	AkRM8+ouoPDfc8u/tfu1CiTIiR3/scWXWmjr0qklBGQfAQLqb91Vz28NbNi3U8qy5cyg2yp6PtF
	UYbMuboT4MPkxQOymFFtoUgzYpC2940P+9TIg76H1CaW9bzCC6DcofKxpI08OXVKqaBT1Wgvwv3
	9SQp3SFBT4hpxgwcwI01tKhaYTYuvmzNXRLM0WT0QjvWjsdJ39UqewIGxa1ISx5PU0EcSNg+/Vq
	bBD6KSM+ayyDIWmGKnhFav/sxxuckHb3eS5ozIBvYOG5A4w9L3GMgfs+Piro6IZBO8T+T/a4r5O
	JvZt7mkMP9vWgA8EDIiiMcnI5KxJuuPmiP5KsofauUdYFw6h16Lvr1Rb2eO8wMELW1dfcW0lYqV
	EpvbejJW3xF+c3Ao9myxTC2HO7CjejuLUDya7G+N6iADQqcqVTASbaZi85wLEP5VjF9kh74ydYh
	+ai3p57RCqagvLu5NFGQCNGDgfrgP2YSKJq4A==
X-Received: by 2002:a05:6000:2288:b0:455:4695:92d9 with SMTP id ffacd0b85a97d-45e5c5894cdmr27108256f8f.12.1779142733509;
        Mon, 18 May 2026 15:18:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f8a4:5aa5:6f2a:b16e? ([2001:8b0:aba:5f3c:f8a4:5aa5:6f2a:b16e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm42846796f8f.18.2026.05.18.15.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:18:52 -0700 (PDT)
Message-ID: <2c9316c55d73b284eee16ba257c9e7009851d89e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/5] Add support for USERMOD_PARAM in
 useradd.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 18 May 2026 23:18:52 +0100
In-Reply-To: <DB5PR02MB10213126762F3E1B53CD51C8FEF392@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260512190415.948535-1-pkj@axis.com>
	 <2fc29d67622c753049478f8d1a399120310f281f.camel@linuxfoundation.org>
	 <DB5PR02MB10213126762F3E1B53CD51C8FEF392@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 22:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237263

On Tue, 2026-05-12 at 21:00 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 12 maj 2026 21:49
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 0/5] Add support for USERMOD_PARAM in
> > useradd.bbclass
> >=20
> > On Tue, 2026-05-12 at 21:04 +0200, Peter Kjellerstedt via lists.openemb=
edded.org wrote:
> > > This is my proposed solution for groupmems' lack of support for the
> > > --prefix option
> > > (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16277), and the =
fact
> > > that groupmems will be removed in the next version of shadow.
> > >=20
> > > The first three commits make a little bit of clean-up to
> > > useradd.bbclass and then add the support for USERMOD_PARAM. These I
> > > would like to see backported to Wrynose. While technically it is a ne=
w
> > > feature, I hope this can be accepted (it should not affect anyone who
> > > does not actively start using it). It would make it a lot easier for =
us
> > > and others who are using GROUPMEMS_PARAM today (we have more than 300
> > > recipes that will need to be updated) as it would then be possible to
> > > migrate the recipes over some time rather than having to do a flag da=
y
> > > rewrite.
> >=20
> > I appreciate the patch series, thanks for doing that. I'm much less
> > happy that this is marked as "something we must backport" and then the
>=20
> I did write "that I would like" and "I hope" so definitely not "must".=
=20
>=20
> > series starts with a patch mixing whitespace and "simplifications".
>=20
> I can split this if that is the only blocker for a backport so that=20
> what is needed for the two following commits remain, and the cleanup=20
> is left as a separate commit for master. However, ...
>=20
> > Whilst I appreciate it would make it easier for you, you're breaking
> > several different elements of the stable backport policies and hence
> > actually actively make it harder to make case to backport it. It
> > certainly doesn't make it easier for me, quite the opposite.
>=20
> I am aware of that this is a new feature, albeit one that should not=20
> affect anyone who are not actively trying to solve the problem with=20
> groupmems. It would certainly be easier for me if support for=20
> USERMOD_PARAM is backported, but we can make do without it as we can=20
> backport a version of useradd.bbclass into one of our own layers.=20
> Having it in OE-Core is mainly a way to help others who are in the=20
> same situation as us.=20

I'm not seeing anyone else responding on this and I suspect this area
of the code isn't used by many, it doesn't appear to be used by many
public recipes. You didn't rework or resend the series and I don't
think it is backportable in the current form. Convincing the TSC of the
need to backport isn't easy and I don't think the bar is met in this
case.

As such I could merge the patches as is, but it will make any future
backport requests harder.

> What I would really appreciate though is to allow support for=20
> GROUPMEMS_PARAM (emulated using usermod) to remain on master until=20
> closer to feature freeze as otherwise we will have to resort to=20
> a flag day update of all our recipes that use GROUPMEMS_PARAM.=20
> I promise that I will send a patch that removes support for=20
> GROUPMEMS_PARAM in good time before the feature freeze.

We can keep it for a short while, probably not as long as feature
freeze. If there is a new release of shadow to upgrade to, that will
probably mark when we drop the support, if that happens sooner.

> The sad part (as I realized while making these changes), is that=20
> groupmems (and therefore GROUPMEMS_PARAM) actually has a better API=20
> for what OE is doing, and allows for much better validation in=20
> perform_groupmems() than in perform_usermod(). And no, I am not=20
> arguing for keeping support for GROUPMEMS_PARAM, as that does not=20
> make any sense in the long run if upstream is removing the command.=20
> I just thought I'd mention it.

We're at the mercy of upstream on things like this really...

Cheers,

Richard

