Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B3EC5DF9D
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:53:17 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31047.1787817195516332051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 00:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dzjtV2+s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4815bce4652so1101417f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787817194; x=1788421994; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ryQC5oXbF35xRB+8FtliPe9Kw38T1gRDevq7GvRo2gM=;
        b=dzjtV2+sIs0HYVPoZY+iCQzTKwcxzWBh6DzIjRPDVqluZzIlgnbZHpWLZkPcnfl4Rx
         VExYcgEpHyup0OmFzmunlNQLcSU9ht0Y7q1tDuO1ULONOw/Xb0M6cmcwgEQ+2HVQwshi
         alJCvmbwHAMV9D5MKhv4N/Z+sO/IEpTy7FOPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817194; x=1788421994;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryQC5oXbF35xRB+8FtliPe9Kw38T1gRDevq7GvRo2gM=;
        b=SM0J4jBzKd9Big13ry5zud1a2CDOpLB5TCYweK9Vet5ki9rU9LoDgshZbMksi1wG7/
         FtumUomozY/OdCRQbS2oV0nYfgMKv83erDbSgjbheiAvozXGUW2xuXIdLeE+LTLdFeA2
         h7EX1CVXavRBhmNisq8asrZcLx8aA5EjkQDUD+/lusC4tIPPCfLVIqH4p7JsjiaNJ6Si
         2xndrTvE5eVYVE/C6EWXH78NaV1aYzvJyJI8GbeyAQOK8yB9xrwlfo7HTqwZzl/Ac/PT
         2BJbgXI6HjQG9XHYDEwetIz+kGOgCHsx/BZpzgR6xdBrQew3hV5jyfZ3qkm93ZMDkTz+
         ZpDg==
X-Forwarded-Encrypted: i=1; AHgh+RqU5IbVGSFF6UmZwX1QESxRFniiVQ2a1d74PuCN5MfSq7/K7EUYVZeiEKKTkIKKide7VbBptiFgM+IaXjSB3CiAWg==@lists.openembedded.org
X-Gm-Message-State: AFuF++nnoTpvIz4HJRlzxpcpphRf7cAekNcrQrrckwI9B3lpph62RUOR
	w/L1G6N+IY51kf9dSnQUTXdQn4rYX0gCeAfeGcq8PXyNzvDBGydfZ2xwgvvufUHWLuc=
X-Gm-Gg: AR+sD10WUzC34SHJhhgK2uxC8qVHH8IE47lxnAW3Kzs+qXnaYazSM0lw7OjqxT6R/rz
	JZEeeJpd0mXrV5dx5PaxmhnIcecMqxKN5rohtgGZIk7B34te66fc9+BTV4OHj9HxeAKnM94DxSj
	68Hgzkg2llckH9cCt1v8M776F+pmCH65VhuUR59+YTSx+N/SR9FTuR2/tuzMuh3XveLtoS81dqM
	1lyXVqscAKse0YWjr+4tBOJP4GHNsRTKIgIX1vi8mF/dIEXXHpdQ5RvDrThg9QMb3dn/w+znhfc
	SrY7cNYmMHrjxI/SEBZIvHq5SOcL7TPUl/hkoVaQg9BX1QRiT9ymTdQO6EmHm0HuIBToI0zVqh0
	pRINBiuFqM6Ut3yfZNdtVPaIWxZRt7bHLhthk4S64gy9e5U7OlrsO4JmBinj30B30qZUhZ/evR6
	E6JGfhmVrIBBLtYS3Y3J4V1Z6q0PkViCAeHORhF1exh6FjMbc3lO8YiTo4VYh0QH4VCtxFzfoSe
	Hd0KLQ/CsGZwNKmbtJL+WIw4XUjiTlbWXF757xNL6FwYUBY05yzWw==
X-Received: by 2002:a05:6000:2903:b0:482:c676:8d04 with SMTP id ffacd0b85a97d-482e26cb081mr12217662f8f.18.1787817193542;
        Thu, 27 Aug 2026 00:53:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9129:8016:1316:65e1? ([2001:8b0:aba:5f3c:9129:8016:1316:65e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27aa050sm7019550f8f.12.2026.08.27.00.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:53:12 -0700 (PDT)
Message-ID: <e6874bb2ac2d116380c62b2295da246b79136093.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] rust: Avoid passing host-specific
 information to crates Strict Version Hash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alhe@linux.microsoft.com>, 
	SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2026 08:53:11 +0100
In-Reply-To: <18CF75EE37DB8543.642712@lists.openembedded.org>
References: <20260826155417.2774608-1-alhe@linux.microsoft.com>
		 <2326647.1787768749336187635@lists.openembedded.org>
		 <fac01045131c56332854097dc98f0744a0e5ee5a.camel@linuxfoundation.org>
		 <69b11fc6-cffc-4b91-8853-c9ab277577c8@linux.microsoft.com>
	 <18CF75EE37DB8543.642712@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 07:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244468

On Wed, 2026-08-26 at 21:47 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Wed, 2026-08-26 at 14:08 -0600, Alejandro Hernandez wrote:
> >=20
> > On 8/26/2026 1:17 PM, Richard Purdie via lists.openembedded.org
> > wrote:
> > > On Wed, 2026-08-26 at 11:25 -0700, Dora, Sunil Kumar via
> > > lists.openembedded.org wrote:
> > > > Hi Alejandro,
> > > >=20
> > > > Thanks for chasing this one down. Small notes on v3:
> > > >=20
> > > > The commit is tagged [YOCTO #15554], but that bug is
> > > > "reproducibility
> > > > failures with 'rustdoc' on rust 1.75" (path-length dependent),
> > > > RESOLVED FIXED
> > > > since 2024-08-01 via codegen-units=3D1 / lto=3Doff.
> > > >=20
> > > > What you describe here - artifacts differing by build host arch,
> > > > causing
> > > > cross-architecture sstate matches - looks like:
> > > >=20
> > > > =C2=A0=C2=A0 [YOCTO #16376] AB-INT: build system architecture
> > > > reproducibility issue
> > > > =C2=A0=C2=A0 https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16=
376
> > > >=20
> > > > which is still open. Could you retag it in v4, unless you had a
> > > > reason to
> > > > point at 15554 that I'm missing?
> > > > ---
> > > > One pointer that may or may not be relevant: the 1.97.1 upgrade
> > > > (65271a5d3b)
> > > > carries an LLVM backport:
> > > >=20
> > > > =C2=A0=C2=A0 0043-LoopUnroll-Iterate-exit-fold-candidates-in-
> > > > determini.patch
> > > >=20
> > > > added for a repro issue seen with rust 1.97.0. I haven't looked
> > > > at whether it
> > > > interacts with the SVH path at all - just flagging it in case
> > > > it's useful context.
> >=20
> > Hey Richard,
> >=20
> >=20
> > Sorry for the incorrect tag.
>=20
> No problem, that is at least easily fixed!
>=20
> > I'll look into these failures as well and send a v4
>=20
> Thanks! I appreciate the work on this as it should improve things a
> lot.
>=20
> > > I put v3 in for testing on the autobuilder and it looks promising,
> > > there are some rust test suite failures though:
> > >=20
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/44=
72
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/45=
77
> > >=20
> > > and probably more to follow. We may need to exclude those tests?
> > >=20
> > > I also triggered the reproducibility test targets:
> > >=20
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/builds/3
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/builds/3
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/builds/3
> > >=20
> > > those builds are ongoing.
>=20
> One of these completed:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/builds/3
>=20
> which leads to:
>=20
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260826-plagtpa=
m/packages/diff-html/
>=20
> There looks to be a locale issue, some python config tweaks, curl-
> config binconfig needing a tweak and a smaller rust issue left.=C2=A0
>=20
> Definitely progress, much fewer recipes showing issues and fewer binary
> ones and more text ones left...

Sadly the other two test runs looked less promising:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/builds/3
https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/builds/3

both of which have a lot of rust related looking differences :/

Cheers,

Richard




