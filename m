Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092A0C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 08:24:19 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.4997.1716366251572023103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 01:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XhvO1Dy5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.171, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e3e18c24c1so69425361fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 01:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716366250; x=1716971050; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIl9Wk5sISx2HMXQkmMIeSbiqLnKq8DgT/vGAFFaOHQ=;
        b=XhvO1Dy5lX6W42d6hnBIgsXxGrZD0VOzvY0xEl7MfX5uLR80SxhqZaLsqrHXesoCwf
         CrNXMlX2cTZ63IM0Bj1MvITPPaAq87a0obcIvBeS1eEpALcs9hm2DFZL0tcp9HEMbtXU
         k3JF2FCj2dYeD+Mr2OzXxgxStwQEeBsI7N0yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716366250; x=1716971050;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIl9Wk5sISx2HMXQkmMIeSbiqLnKq8DgT/vGAFFaOHQ=;
        b=oDrVJ7w/0Q/9k2/d0b2yi4S4IgBX25WdTQel0c+iPbGQfw6iwXc8sZItBjUdFsRQU9
         2A+7B0EHzZdm1M+jHrrVkYIe/2VnRt1+nbXm20WQTI1jipK4xiZCvIpHU8TI+1SxnZgX
         N+D4t2HvsdzuQ93et3CEJ2ZI76bnUCZdJLGvGLaJeT4Ea3kImCE4AwL52j4rPRi5oQIm
         sXAyMm0WqCA0pPm+Ka9a6WTzebLR39FUbKDgfjPcHIBmanbXAu+37s3Yg+njlJSlqliJ
         gre07XQdEQqQ8s11gFZEKqEhLBjZd/v0PsuueeMV2OlJqEdk51id5NV9FPnl2L/Na0qp
         GhIA==
X-Forwarded-Encrypted: i=1; AJvYcCVSrh/z7EeiOvA/Bpn12NixSiuXtRgJw0Fl9iHfRcxKK1dZpQHGu+nGVZ78/+I45y0fDhk0WUraYdcxQ4BPyi8s9ARvYIoH0T82zjpEJ7IMt/GM5mBmK4oA
X-Gm-Message-State: AOJu0Yyp3jUpMTrF6GmpaqDLCX4d46taPERretGQFRdni0w+I4Kf0oJH
	L83vLQA9krRsTGeeeAAc9bs3W00dj3lnFg753AJ8SAU49bTbry8TjPoiO9IF1gw=
X-Google-Smtp-Source: AGHT+IGtwad2Z+AV7DsJp7RPJPzI0Na0voemWqEThhBKn7cT2t87QG12rIk08L18sV5/ZFltK7qsow==
X-Received: by 2002:a2e:7204:0:b0:2e7:199b:5e8c with SMTP id 38308e7fff4ca-2e9495a95ffmr8402871fa.3.1716366249417;
        Wed, 22 May 2024 01:24:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ef1c:155d:9d8e:11ce? ([2001:8b0:aba:5f3c:ef1c:155d:9d8e:11ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42010940845sm413141175e9.35.2024.05.22.01.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 01:24:08 -0700 (PDT)
Message-ID: <6a6aaf4acf3baf2406789f7d00f4f07ee2444d95.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] proposal: controlled deprecation
 process for oe-core
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, OE-core
	 <openembedded-core@lists.openembedded.org>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>
Date: Wed, 22 May 2024 09:24:07 +0100
In-Reply-To: <CANNYZj84YtfRPXWm7c=DV6mOeQwVJaKLyeOHd7ni6PtZYx88BQ@mail.gmail.com>
References: 
	<CANNYZj84YtfRPXWm7c=DV6mOeQwVJaKLyeOHd7ni6PtZYx88BQ@mail.gmail.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 08:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199691

Hi Alex,

On Wed, 2024-05-22 at 09:53 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> right now it's extremely difficult to remove anything from oe-core.
> The reasons are that either we don't know how removal will affect
> possible users, or we do know that and we don't want to upset them by
> sudden breakage and 'flag days'. Especially if those users are
> supporting the project through membership fees.
>=20
> On the other hand the maintainers burden is only growing as more and
> more things are being added into core. This has consequences, the
> most
> damaging being the resulting burnout, or coming dangerously close to
> it. It's not just RP pushing himself into unhealthy territory: all of
> us are, and me as well. Spending most (or all) of the time on
> routine,
> unappreciated things that hold no interest or fun is not healthy;
> there must be time and space for exciting, novel, fun activities.
> Yes,
> even when one gets paid for it.
>=20
> To steer things into a healthier, more sustainable direction, I'm
> proposing a two stage deprecation process for things that should be
> either maintained elsewhere, or dropped altogether:
>=20
> 1. Phase one: if a deprecated feature or recipe is enabled, users get
> a warning at the start of the build and an invitation to describe
> their usage of the feature in public (e.g. oe-core list or a bugzilla
> ticket). Otherwise nothing changes: the autobuilder testing of the
> deprecated item remains as it was (with a tweak to enable it
> explicitly rather than through poky/core defaults if needed), and the
> build is not going to fail.
>=20
> This would allow the project to more accurately assess the usage of
> the feature, and whether the users are willing to allocate resources
> towards keeping it alive. Right now we often simply have no idea
> about
> those things, just a vague feeling that it's not particularly useful
> or used. We have to force users to come out and tell us what they use
> and how. At that point, we could also hand them the list of open
> bugs,
> intermittent autobuilder fails, etc. caused by the thing they rely
> on,
> and see how that is taken.
>=20
> 2. Phase two: taking this feedback into account (also there might be
> none!), the feature is dropped from the autobuilder test matrix, and
> optionally relocated to its own layer. No maintainer is assigned to
> that layer until someone steps up.
>=20
> How long between phases one and two? At most, four yocto releases, so
> that there's at most one LTS release occurring in that period,
> complete with deprecation warnings that all LTS users will see.
> Ideally, it should be just one yocto release.
>=20
> What would I like to deprecate? I wrote that down, then realized it's
> a highly flammable, explosive list, and each of those items should be
> discussed separately, and only after we agree to the overall approach
> without bikeshedding about individual items.

Sadly I don't think this is going to work.

One purely technical and resolvable issue is that we don't run
autobuilder builds with warnings. Once you have one warning you stop
looking for other warnings and they breed and quality degrades. Any
proposal where the autobuilder runs with warnings will therefore not
work. That issue is solvable.

Another issue is timescale. A decent portion of our users don't run day
to day builds with master. We can agree they probably should, but
people don't do many things they really should. If we're lucky they
switch every six months but some switch every two years on the LTS (or
worse). There has so far been an understanding that we wouldn't "pull
the rug out" from under things they use. Given what you want to achieve
above, I suspect six months of warnings is too long, let alone two
years of them.

If you do run warnings with such a long time frame, it also devalues
them as people will start to just ignore them. Currently most users do
tend to fix warnings which isn't something I want to "undo".

So yes, there may well be a long list of things you want to remove from
core, however, we also have to think about the project's use and why
people use it. It is often because we're able to support many weird use
cases and interesting scenarios that people do adopt and use the
project. I don't want to have a clinical core that is so opinionated
about how it should be configured, people can't innovate or experiment
and go and use other tools and systems.

Even taking some things which should be "uncontroversial" like ppc or
mips support, there is a core of project members who do want and need
at least some level of support for those architectures. There is some
level of willingness to help too, it just doesn't work on the
timescales we often run into problems and need them fixed within (e.g.
upgrading to a new gcc whilst users of fedora 40 run into build
issues). There is a bit of a point of pride that our tools can and do
support the old and new like this. Where we have removed things like
uclibc in the past, we probably did lose some userbase to other
projects as a result and we did dent our reputation for being able to
support wide and varied use cases. With uclibc, I agree it could be
done in a separate layer if there was demand but it didn't happen as
nobody had the time/skills to make that transition.

I guess my other worry is even if you do get feedback saying "yes, we
use this", how do you evaluate that. Does it only count if you support
the project in some way? Do you have to have 5 people respond? 50? I
suspect with a number of the changes you're thinking of, you'd argue
they shouldn't be using XXX anyway. If that is the case, the process
probably isn't needed and we should be moving more directly to making a
decision and making a change, which is the direction I've been trying
with a number of other changes.

My final comment would be able removal vs simplification. I'm keen to
try and simplify where we can as I think it is a much bigger problem
than needing to remove things. The unpack changes do make devtool much
simpler and we have scope to simplify in other areas too. Layer
priority is another topic we need to revisit and there are things with
the tooling around the signatures I still don't think we've fully
explored.

Cheers,

Richard


