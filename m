Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC45C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 20:47:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22196.1787777242231014063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 13:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eKsEg4Dm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so7752955e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 13:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787777240; x=1788382040; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MORoTSRiqBo7ArzG9sYSUw4bMg7UyplBPN375FRIhKs=;
        b=eKsEg4DmaeX5ehRilHk7LupnlI7qBd8Tps69wWXvrNG17nDQpqoDeX97LL6mTB8RlL
         kalCqYPAuciKNAWx4mlBsNium6+f7ZpUfKRStIJBligII/GTmA/VH5ppU+2qrDkxeyQt
         +9X15vEnU5KCGmPptQFOUtitPx7wuc+Hbn3Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787777240; x=1788382040;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MORoTSRiqBo7ArzG9sYSUw4bMg7UyplBPN375FRIhKs=;
        b=VP8O+EdKi7wrXbK0aMNpdSMBv458yfkG/qLxiLpnW16LfI39u5wc386yVbyGX2mJRU
         iRQ1L3hNRKdQP/ySoO9eGScfdTyV7MBNJ4CW9/Ij+BYfk6fJmx9oCBIlZAwc+74GTCgZ
         nFbsROJRZWLPyXImXlNO3r82UWOT1I7UwdZI2Fw/SbYWaeApujwZOPOdPzVqqMF8yCZt
         o0Pqzx3JNKmbNFWK9MyJ5K1F/k0o6NTECoqyU3EpvvSpjLVT8f0iYLRspmzXEFYZXas5
         xJi9iqCXo83DmX3vk7cg1iAf51ic9jjAC2KU+etajbddTv5izHQrcCQ27neRD03g7tut
         GMhA==
X-Forwarded-Encrypted: i=1; AHgh+RoucYZPCOSEbSNOrIzhgIF3RKVMLSFfaEkET9E/rCnIHIWZOIHSAgarV3/lamPoi2N84ZLXqdG9v4x5WuI/2GmuEg==@lists.openembedded.org
X-Gm-Message-State: AFuF++ntLPRVVZ5YUNMK3aSticLFZmkvlC96KFNfMw5f64I8avAX1Gqt
	/cl5ubBqDG1g1lDHHizULd9N/nsnYPLDeZXN7qQD47EVn5u1nZl1OJgyvThs65scWdw=
X-Gm-Gg: AR+sD11qa8NMSUQqkJxxzfTwX1DF12fWf5DGVTY058dqu/0f1CHbmI8et9/+7SDkxxI
	iqbcOGPiBhsuTf1KFMxt85tzlSYhsk4Ui66uPLGzDfzzIeVMZDarhq7NloMR12ur/dhvPOkOxHy
	P851OrQezL0sQ/HVSehiieZR6V4y5Uc79ddbjNi9cSKL/r5S1d9HL4gp9PPJ/1LXm1PQPorTyDS
	OX000SkuO7+W6hhENiK2vjj67vviaSvixzWO7FlP6Vvj1RU7t5HyUn+b/EukjcgA/tX5dXXVhOK
	YkTeD/Jltp/MZszW+NqpFOR7sfCJ/z+GSPFbP7/Qot1w46g/jZlQb9mCnj7tK0xFEkbDIAKvNhk
	Tx+z57Feaqg4TBjoPwbzNigypbBznciLTnQm8EDNDGK5COkXryrXL59BIR4LMWnYR0huFjQSCdY
	23Fe89TA1oPcdRW0P6eq2S2JUR1sbnJ5jxeQXzxg31hBFaWbXvb0usbu2M/t6U8+h6en/SF/ITH
	LnGJQbSNFhhOXEzShQxO2A9NpMiIh6UqR7WEMiLdT0ixxrTsEdtFg==
X-Received: by 2002:a05:600c:3e83:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-499dc823a01mr95390895e9.14.1787777240291;
        Wed, 26 Aug 2026 13:47:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e581:1e52:aeaa:4925? ([2001:8b0:aba:5f3c:e581:1e52:aeaa:4925])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcae3216sm39607955e9.15.2026.08.26.13.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 13:47:18 -0700 (PDT)
Message-ID: <005fb03d99e0fe1930c71dad8e727fecda8ea3f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] rust: Avoid passing host-specific
 information to crates Strict Version Hash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alhe@linux.microsoft.com>, 
	SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2026 21:47:17 +0100
In-Reply-To: <69b11fc6-cffc-4b91-8853-c9ab277577c8@linux.microsoft.com>
References: <20260826155417.2774608-1-alhe@linux.microsoft.com>
	 <2326647.1787768749336187635@lists.openembedded.org>
	 <fac01045131c56332854097dc98f0744a0e5ee5a.camel@linuxfoundation.org>
	 <69b11fc6-cffc-4b91-8853-c9ab277577c8@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 20:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244416

On Wed, 2026-08-26 at 14:08 -0600, Alejandro Hernandez wrote:
>=20
> On 8/26/2026 1:17 PM, Richard Purdie via lists.openembedded.org
> wrote:
> > On Wed, 2026-08-26 at 11:25 -0700, Dora, Sunil Kumar via
> > lists.openembedded.org wrote:
> > > Hi Alejandro,
> > >=20
> > > Thanks for chasing this one down. Small notes on v3:
> > >=20
> > > The commit is tagged [YOCTO #15554], but that bug is
> > > "reproducibility
> > > failures with 'rustdoc' on rust 1.75" (path-length dependent),
> > > RESOLVED FIXED
> > > since 2024-08-01 via codegen-units=3D1 / lto=3Doff.
> > >=20
> > > What you describe here - artifacts differing by build host arch,
> > > causing
> > > cross-architecture sstate matches - looks like:
> > >=20
> > > =C2=A0=C2=A0 [YOCTO #16376] AB-INT: build system architecture
> > > reproducibility issue
> > > =C2=A0=C2=A0 https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1637=
6
> > >=20
> > > which is still open. Could you retag it in v4, unless you had a
> > > reason to
> > > point at 15554 that I'm missing?
> > > ---
> > > One pointer that may or may not be relevant: the 1.97.1 upgrade
> > > (65271a5d3b)
> > > carries an LLVM backport:
> > >=20
> > > =C2=A0=C2=A0 0043-LoopUnroll-Iterate-exit-fold-candidates-in-
> > > determini.patch
> > >=20
> > > added for a repro issue seen with rust 1.97.0. I haven't looked
> > > at whether it
> > > interacts with the SVH path at all - just flagging it in case
> > > it's useful context.
>=20
> Hey Richard,
>=20
>=20
> Sorry for the incorrect tag.

No problem, that is at least easily fixed!

> I'll look into these failures as well and send a v4

Thanks! I appreciate the work on this as it should improve things a
lot.

> > I put v3 in for testing on the autobuilder and it looks promising,
> > there are some rust test suite failures though:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/4472
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/4577
> >=20
> > and probably more to follow. We may need to exclude those tests?
> >=20
> > I also triggered the reproducibility test targets:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/builds/3
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/builds/3
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/builds/3
> >=20
> > those builds are ongoing.

One of these completed:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/builds/3

which leads to:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260826-plagtpam/=
packages/diff-html/

There looks to be a locale issue, some python config tweaks, curl-
config binconfig needing a tweak and a smaller rust issue left.=C2=A0

Definitely progress, much fewer recipes showing issues and fewer binary
ones and more text ones left...

Cheers,

Richard




