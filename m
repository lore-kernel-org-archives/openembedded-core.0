Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C14C9833F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 13:04:32 +0000 (UTC)
Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57938.1790600661364349212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 06:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GgLvdBv5;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.99, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so4672064a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790600659; x=1791205459; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N1ZX7lqGRjdztTwdWbuq8ENyQ1nc23KGN/WO3uAqpj4=;
        b=GgLvdBv5hhBTNEpFsVHEGTyXMu4JAVoHa5XzDboTPwgyQZiSAFrI7n8vGakTDt+Pwf
         OblxlIf4esabAhfW/QaJCxQioM42nr/mzoFJLEfJa1Vhyx5OW+C0Xd4N+foRJdZTf61g
         +fThfb4DYzRdi2IMZswG3xFKEzKzD/UBF+44I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600659; x=1791205459;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1ZX7lqGRjdztTwdWbuq8ENyQ1nc23KGN/WO3uAqpj4=;
        b=G4xF3EWEUPkmaSK/TaBXlzTh4PgS6KCcNp6X/SBwsAWRqds0keaX1kuIp+u5gYn1/+
         ZYcKXnDCS0OCVhzao8Yvlcw1v0+urJK1GBHJB0QR7DmoDSssHKygo0D/olfx1GhRIpvU
         /62+9zum13jBLrVLlzKj3PNqWJNPGwPcEnhrLg4X5nWjOND73+1ban0LodnQ/jzUgEPJ
         fe959VS2NPZAjJZ9eET2FfQ0EOmshU2rU4UepvFk92o6OuIHQb1yybC1702IzdjGP6ZT
         sL4QvzUuLR8DFNdcd5j3kThgTMekzm9FGd7RIaPS10Hm8MeImCeEBjMd6oX9E20c/RSr
         /68w==
X-Forwarded-Encrypted: i=1; AKwUvByAycReGyK54070pQkfxMnwA5p1rn/0bxTCu3YdL2ly1rON/TKHu7XmFtk+IxjvsIQ6YN82ABbFEU/qF81kLvBoVA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJLSLM9FNXLF1QIJ5XhGdHpfjpMt9BzT6GympUEkL60LJRi3xrc
	figUwpxBVjkdQtT66DPPsPO7dYmG+Ya1IBUFKbzdtk+UP8iSJLIyUFV5Id3XKluaiu8=
X-Gm-Gg: AYBFou2OD5i+7dUtQDZbXld7zFitqohEIZft3gxNm7BlpwFfiAtKFDJWDAfE5mb5bC+
	b7+viDnoU9lE+qLmTyuFiW/QKfT4oJ2oF4lh2iBqc8aaQE/n0e5rZIHDxivZflS1wKoq3hXr2ad
	ZmeSbsz7ycCAqYR9QV9fpvnYCzZipBXBsteHKbliUHVlCqPyHylKJZUxjInrYxqPiMofMBPMNka
	uR7anqEerwbEyeSqY4oI33cR2kNLg0YM6Zt8Vt2f17N9TstWW/j6PttHu18leykGyL968M7nYh5
	me5s8BP48yVS5jRRdQHBfCtWtCpHsccBaiALrBvtQGDWi+DUg3Wh7W0DGdbbCVCbgBuB8wZBT3Y
	1BhNSM6kmOJtYKQg+9UaK/Tz8YvgUWS2yLE1ZjstihKPYTqEodyH9x8SxRHZ4qxUOLgGnzcJCTA
	cVp+MIRqxkkqmaQdAzQif9pf9YRMoQgfBZFaaS+7tn1C/C2idjWW5yEe8bl3YnjBwcqldbBQmA+
	kvzTOfLQq8mIuQCAss8h/ppc52yBTZ4Bp4oJ/QnA6ZXiDFvMaZ7+9w9wpUlcW4=
X-Received: by 2002:a05:6402:2803:b0:6ac:7d58:dbd2 with SMTP id 4fb4d7f45d1cf-6ac7d58e0a3mr2132208a12.22.1790600658623;
        Mon, 28 Sep 2026 06:04:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e53f:c6ab:eb79:60b3? ([2001:8b0:aba:5f3c:e53f:c6ab:eb79:60b3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc097csm4030900a12.12.2026.09.28.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:04:17 -0700 (PDT)
Message-ID: <cb4625f943a2836c2618d04a9db0e807136edceb.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] toolchain/clang: prepend target host-sys to
 HOST_CC_ARCH
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>, 
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Date: Mon, 28 Sep 2026 14:04:16 +0100
In-Reply-To: <AS8PR10MB5073188A36969BE5B9F44940FD8D2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260820201120.293849-1-peter.marko@siemens.com>
	 <AS8PR10MB5073188A36969BE5B9F44940FD8D2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 13:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246763

On Mon, 2026-09-28 at 12:35 +0000, Marko, Peter wrote:
> This patch is sitting in master-next for some time already and is
> probably spending a minute or two of everyone's time on each patch
> review call.

That is true.

> Let's try to do a decision whether to merge it or drop it.
> I (without asking or rewording via AI) think this:
>=20
> I see following ways how to approach this clang-tidy problem:
> - make clang-tidy architecture aware upstream
> - add these flags to tell it the architecture (what this patch
> proposes and what was present in scarthgap)
> - add it only to recipes which use clang-tidy (or other similar clang
> tools)
>=20
> clang-tidy (and this also applies to some other clang support tools)
> is in principle architecture independent.
> Linter should not care about build arch, correct?, it just needs to
> know the paths to sources.
> So imho making it architecture dependent would go in a wrong
> direction, probably wasting time of whoever develops this and
> upstream clang maintainers.
>=20
> Explicit set of architecture globally looks like a better choice.
> Yocto currently does not set the triplet in build flags, because it's
> hardcoded in toolchain and thus "it works" (however as we see here,
> only in 99.9% of cases)
> For clang compiler it's a no-op (the value is the same as value that
> it has hardcoded during its compilation).
> And it helps all "arch-independent" clang tools to find the right
> headers.
>=20
> Having a special handling for clang-tidy in all recipes using it is
> certainly possible, but seems to be sub-par.
> Yocto should support clang-tidy workflows natively.

I think several of us all have mixed feelings on it.=C2=A0On the one hand i=
t
fixes a problem. On the other, the rest of clang doesn't need this and
these kinds of flags, once added, are very very hard to remove again.

I guess we lack enough data to make an informed choice and are worried
about sending this in the wrong direction if we reject it, equally, we
don't really want to make a change like this as it doesn't feel right.
We are therefore struggling to reach a decision :/.

Even trying to articulate that in a way you can take some action on is
hard, hence it is sitting there :/

Cheers,

Richard

