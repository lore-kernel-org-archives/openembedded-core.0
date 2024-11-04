Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46973D1BDD0
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 17:18:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.1102.1730740683991957535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 09:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QBQ7NBhJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315eac969aso27192085e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 09:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730740682; x=1731345482; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KHp/YQH6c7wCqt3zQx2lf8dgzRe5Wf3+2NsD0/vvTTo=;
        b=QBQ7NBhJfDPOpaa4zyGw3DteLdbTeE6Z9y9fP1q3Ieef78BUGKy4WhNOJU38SSikoj
         wfEAuvxIAXzB18g0CgYvRYby/LPSvnDeGoJT0GiSY56Ot9T3p1xyFIU5QlS+NI+2YiXB
         gVe0fAr+vdJ97n6bORbTlKz/1yjUH1KwmeR6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730740682; x=1731345482;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KHp/YQH6c7wCqt3zQx2lf8dgzRe5Wf3+2NsD0/vvTTo=;
        b=eVMcZNkn/CaJDEi54CqV3fKH+wpCers4296NlQyizRr0Mbk6+PzZybxNmvnVbnAV+V
         zvVS+uK3mlKYLPEcvb9symnEgZC+JXTZUiVcQy0dt+sBztrWS2SAS7/ZaYbasAo1UsUW
         a9UWHpUVAg+zP0xkRQ3ma3/n96132AbCybatSjIoOBOiekyfi86LZ3C89cJfn/UWYBGv
         g0EHeiTtaN2MSMKwSuyXmcePla9nKcqy5c72d0jwsPlL6iJwqrzRvHKGLcXeuc4gY7Jn
         3d7ha9xux6NG6XyF0CSCq2rkmi67GKHJFX33VRWLwRK7Hoi7LSwGm8tXGTI3LI5Qxcyz
         wK7g==
X-Gm-Message-State: AOJu0YxW3rASvcNQ33Pg//AzYH7Ik/X4oWD66vvWWuT4wouI+hXcry4h
	iWVwKZz2btud+v3euOg+KyJJRarkW1bnnuQIRw4mtqM3dxHM5QBwpK8yGlVicYo=
X-Google-Smtp-Source: AGHT+IEBB1IhUYxaJhHozERTwco0INTpHxcUjpySMFNAD/nbZFPABYWJHPUk1BL6qX5NCnu1e49r8A==
X-Received: by 2002:a05:600c:a09:b0:431:55f3:d34e with SMTP id 5b1f17b1804b1-4327dac7748mr124618235e9.15.1730740682386;
        Mon, 04 Nov 2024 09:18:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce35:7d7b:4b91:8e7d? ([2001:8b0:aba:5f3c:ce35:7d7b:4b91:8e7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e7d23sm188114845e9.7.2024.11.04.09.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:18:02 -0800 (PST)
Message-ID: <ae554f47fe13215139c6ea3cd88e5c8fdf29707f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH
 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
 "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 04 Nov 2024 17:18:01 +0000
In-Reply-To: <DM8PR12MB54304D02DCB6765D471334CD8B512@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20241101193811.2068211-1-chris.laplante@agilent.com>
		 <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
		 <DM8PR12MB5430BF49467783C0051229C68B562@DM8PR12MB5430.namprd12.prod.outlook.com>
		 <DM8PR12MB54306736B03571231E94A9498B562@DM8PR12MB5430.namprd12.prod.outlook.com>
		 <CANNYZj8rn3ocAAbCRYF-YKea8=DtVjcUv3vU+wbpCskzQ3JC=Q@mail.gmail.com>
	 <1a87ce686c05f97ab77fe19c658a6882a8dbd48c.camel@linuxfoundation.org>
	 <DM8PR12MB54304D02DCB6765D471334CD8B512@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 17:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206692

On Mon, 2024-11-04 at 14:56 +0000, chris.laplante@agilent.com wrote:
> Hi Richard, Alex,
>=20
> > > > Even if we take DEVTOOL_PREFER_BRANCH out of the equation, I
> > > > think
> > > > that's also true for a recipe that just uses SRCREV =3D
> > > > "${AUTOREV}".
> > >=20
> > > I was also wondering if this new variable is really needed.
> > > Perhaps
> > > devtool should just do the logical thing automatically when it
> > > sees
> > > AUTOREV.
> >=20
> > I'd note that you can use AUTOREV and have local patches or local
> > files so I
> > think we do need to support that use case.
> >=20
> > We probably need two things, firstly to make AUTOREV work properly
> > with
> > devtool and secondly a way to disable the branch changes. That
> > would
> > presumably error if SRC_URI wasn't just a single SCM url.
> >=20
> > Our devtool testsuite is quite comprehensive so I'd ask that any
> > changes do have
> > appropriate test cases (oe-selftest -r devtool).
>=20
> Internally, my experience has been that users do not notice the
> 'devtool' branch has been checked out. They go to push their changes
> and end up creating a bizarre 'devtool' branch on the remote, which
> obviously doesn=E2=80=99t get picked up by our build.
>=20
> In the case of AUTOREV without any local patches, I'd argue that by
> default 'devtool modify' should checkout the branch from SRC_URI. We
> could add a flag to override that behavior (e.g. -d), or
> alternatively hint to the user they can pass '--branch devtool'.
>=20
> Would we be OK with this? If we're worried about it breaking
> backwards compatibility, then I would prefer to have an escape hatch
> (like DEVTOOL_PREFER_BRANCH) that I can use to opt-in to the new
> behavior.=20

There are a few conflicting things here. We've tried to make devtool
modify behave the same whether it operates on something source control
based or tarball based, in both cases with and without patches or
additional config/data files. That is a good thing in general but I can
see how in this case it doesn't do what the user would like.

How clearly is devtool saying what it is doing? Is the user being told
that a "devtool" branch is being created to hold their changes?

It isn't unreasonable to hold our local changes on the basis that the
user wants to write them back into the recipe so the tool does really
need a way to track that.

I think UI people looking at this from the bigger perspective would
consider the behaviour changing depending on context to be confusing
and perhaps the real issue is we're not telling the user what is going
on (perhaps with some detail on *why* in the docs too)?

I'm not worried about breaking compatibility, I'm worried about making
the experience inconsistent. A new magic config option doesn't really
make me feel that much happier, it just forks our UI into two streams
making things generally more confusing to users :(.

As well as making devtool clearly tell the user what it is doing, could
we set up the remotes in the git repos so that pushes did the expected
thing instead (i.e. map devtool back to master/main/whatever)?

Cheers,

Richard







