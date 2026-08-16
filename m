Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B492BC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:29:05 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8241.1786879736694458675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=XHvC4zz0;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=jpIeaKGJ;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id D67051D000A8;
	Sun, 16 Aug 2026 07:28:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Aug 2026 07:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786879735;
	 x=1786966135; bh=4mNcLFduG9Eu6HxaIPuICW8vkuqujsYGJxoPmznFtt8=; b=
	XHvC4zz0hYZI0yIaRhCWlyatiHSSBqneaGXvnBHYPzAUmopTKjOoPz9ASDQfFK+Z
	Ikt62GLlKYV3CTFoF6gQ7xo2SG2VHs03v9YmJyPIxMTn8ZYtRDtZNo4RpcfCAFO3
	/uVkPmsbgJeM2oKfIRkNfmnUj53x7Hm61Nu7alnNjqr+nEtuiKvfzcGa3Zfmhs5s
	PsVvMDX4nYUkA/hilFPtwn2Rt0K5qqPrZdgBPPPTDaDtTlW/ONU0/mgkRJcjYokk
	TYLWtg2c7fnU3T8l+8VZJrCrZQFbW+DLcCMlzi174VqLOgYoOXdj0DG+iylCyi9+
	BjsihruEPjyYp4o/vgP0TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786879735; x=1786966135; bh=4
	mNcLFduG9Eu6HxaIPuICW8vkuqujsYGJxoPmznFtt8=; b=jpIeaKGJO2pRDvqfr
	J8dPby7Xs2Cz7O4ZfgJRS+SSeA72lkyV52F3+BhK2A6GCEefNXmAvdmmNtSQ/vcu
	QbeK/0JiE1od/E9It9uX5IXzfEuPNIAQuoXDkb38DTsELAybFz07WGvlEqRoPZzz
	/TKInnYqonElvHf+Mi2o9flvYYsCUdJW7+vLNYGlfPNHF+Q0FyAhYyqwpBiS5XL0
	GrvGrz9v45wuddGbkJZYfvOuEjkigWxrFU4Jci1tdXDm1gePVNi0K6+mAM42ujt5
	/YVvyohvvkexvYLkoSIRvsqA1JQopt+EITa4P/RCtEnZkWntYOToRuE5ZuWJq2FY
	2l2jw==
X-ME-Sender: <xms:956BaswIW-HVO2enLWqk2rCOyubM7S6YGQCkKQ7YZsbXwISXglafRQ>
    <xme:956BamSmTZoaGWJ0J1mxSdLlrpzJfcFWji_qsHZ6Z0xKphLiHaGcrCFvPxAPyOyqQ
    RIPLPlMRqcKxwcg-w20FT3QTj9yjBaZ9HO-oh4sf2hCQsbbuQsU4Ss>
X-ME-Received: <xmr:956Bar-mBsdgUxXfIE6l_j3KANB4bD2DVR5av_tZiUghfKvIdSyMNm5V4bZORGfnVM9ZitLFR_5L01UYFTFrwct1jQS2sKkgcpCYSMzyBqGL>
X-ME-Proxy-Cause: dmFkZTGECpXNZsBETKgFxqKZM7Ykf+9OUYj1yNPdxoiMIQeo1D6sPZjcqyHKTBgPc9bksl
    dLRJSgnNuTV850+Ku5HutXUWvfi6I0EoDdafIWx3oCZUGNgQHqdNQfnE0+JoKKLRZyPXdP
    z0wTs8LbjgF2K+59klZOhTG3F95PskTrjxuRsqctF5i4rBDm5skWmsaULeR/CWu1hy0FfU
    jFTDc8sFs9fdGnAOfbUNVcQwRYKymgXQ6ATOzFhgqukd5D2QPirTO2Lhs3ZZd59dmJxloJ
    XSyICUPve9aWM/w08PPyb6l+Ng5HTYy/5G+BrMbiQ1/B6WjY/E8mLkJ31+/pLDBGdf2XlL
    maeT73+G0evz5Oh3TQ5HJHYO70SeYRlBnHS9ED3vAJU36CVq47XRR5rgHTMf/nqw8uw67O
    dLiuUQRpOzRnV647mAPjFW7ENzXr0Js1jXhOPi88CU64AxWHPmo4fB03DBmlGwHmezN+gE
    q2LT/5a/ETRu5vJfubL/ovG+NP4TCEK3MyVD7AymmzzaQuDz/dkublqfubsEs7GoJKApha
    dNDMffWnKkL9NYEm/VbPierzTOa7e961Wu2XGarSu9/rtfdFy6PaCOU/mzu+HRl0FWC79T
    RxdwtPAYABTFTRhQQHtYQ7MPKIvZw1yCQJ407OKp6N3MaJiIONpvpLtK4xjQ
X-ME-Proxy: <xmx:956BalrikjnQMtZ2ambunEQy3HbV77TwuF36CxUoft_iN4GlsubEXQ>
    <xmx:956Bagm6pRtth4tCoMhkZ208-S6ubYzmWx3pjlM1YoysqOH1uH_6fg>
    <xmx:956BakI3mJaV_Iw7QmlsfvTdHZR2ImHUkQEfnmff8yqRAPkDxldyKw>
    <xmx:956BatyF4ehZ_SRC9Lr-pJNtrU_4MgHjNF5c1Po6q_wU-Bx-0TGz8w>
    <xmx:956BasATvVCgYF8eE5tAPXxzOXRdBElCzhNwh9kWqWWBBfFGq5Ji2DCf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 07:28:55 -0400 (EDT)
Message-ID: <4277612b6204d7b2ca64848f9ba92233faccdfd7.camel@pbarker.dev>
Subject: Re: [PATCH] scripts/lib/buildstats: allow aggregation to skip
 mismatched recipes
From: Paul Barker <paul@pbarker.dev>
To: Francisco Pedraza <fjpedrazag@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 12:28:54 +0100
In-Reply-To: <20260806062342.3737135-1-fjpedrazag@gmail.com>
References: <20260806062342.3737135-1-fjpedrazag@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243525

On Wed, 2026-08-05 at 23:23 -0700, Francisco Pedraza wrote:
> oe-build-perf-report aggregates the buildstats of every test run sharing
> an openembedded-core commit. Since buildperf began tracking
> openembedded-core rather than poky, metadata changes in meta-yocto no
> longer alter the commit hash, so two runs at the same revision can
> legitimately contain different recipe versions. When that happens
> BSRecipe.aggregate() raises and report generation aborts entirely:
>=20
>   Refusing to aggregate buildstats, recipe version differs:
>   linux-yocto-6.16.11+git-r0 vs. linux-yocto-6.18.1+git-r0
>=20
> Two problems follow. The failure discards the entire run rather than the
> recipe that differs, so data for every other recipe is lost with it. And
> because BuildStats.aggregate() mutates as it iterates, recipes processed
> before the mismatch have already been converted to BSTaskAggregate when
> the exception is raised, leaving the object partially merged; which
> recipes survive depends on the ordering returned by os.listdir() in
> from_dir().
>=20
> Check every recipe before modifying any of them, and add a strict
> argument to BuildStats.aggregate(). With strict=3DTrue, the default, a
> ValueError is still raised, but now before anything has been mutated, so
> buildstats-diff keeps refusing to combine buildstats that a user has
> explicitly asked it to combine. The message it raises now names all
> offending recipes rather than only the first. oe-build-perf-report
> passes strict=3DFalse, which skips the recipes that cannot be aggregated,
> logs which ones and why, and aggregates the rest.
>=20
> Skipping only the mismatched recipes preserves the most data, at the
> cost of recipes having differing sample counts within a revision.
> BSTaskAggregate already handles that, as it averages over its own task
> list.
>=20
> Tested with:
>=20
>   oe-selftest -r oescripts.OEBuildStatsAggregateTests
>=20
> covering the strict and non-strict paths in both recipe orderings, the
> differing-task-set condition, and that identical runs still aggregate.
>=20
> Fixes [YOCTO #16119]
>=20
> Signed-off-by: Francisco Pedraza <fjpedrazag@gmail.com>

Hi,

This misunderstands the issue. We should not be aggregating the
buildstats between builds with different metadata or bitbake versions.
Previously we could differentiate metadata/bitbake versions by looking
at the poky commit hash, now we can't as the poky combo repo is gone. We
put in place a temporary fix to differentiate using the OE-core commit
hash, but that misses changes in bitbake and meta-yocto.

I have to ask, was this submission AI generated? Have you read the
contributor guide [1]?

[1]: https://docs.yoctoproject.org/contributor-guide/submit-changes.html#ac=
ceptance-of-ai-generated-code

Best regards,

--=20
Paul Barker


