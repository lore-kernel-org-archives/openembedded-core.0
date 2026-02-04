Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE5CE95397
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 12:34:47 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19384.1770208481625783249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 04:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RMgtJhPj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b884a84e622so1072044166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 04:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770208480; x=1770813280; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mIZbJ/sZvzRJPJ+vaP8DNTNFsjaRngoKyduKASewmEo=;
        b=RMgtJhPjxvNOM81ZMwJysOqLqj9WIDeYtFUH8oi0SskCzYdAFJ22PwR8uqyOaxtvDJ
         uDNoY3J7lisLCg7PqIyX2lEZt26II7KPv/wAMn2p4weRfWU7Vuxk0v9YyADodykAVtma
         RYP73DnBsmkmrGNygRK+vceaRyjwt/uWp3ChE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770208480; x=1770813280;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mIZbJ/sZvzRJPJ+vaP8DNTNFsjaRngoKyduKASewmEo=;
        b=B2l2BjUoOwuTnHHjmrzkeUFcoKtBCLL9ko0aB2tU1oZRfsSjm+4b3uENvlhWhcDcVc
         m4rN0LvCaffh+7LLmVeVgOmupx/T8K2udy2wlGy+ouqI0RPblUze7d+7U0+bHWrqc5MY
         micl3y25YcTDZue6azQ97RxYGbw1VoOi/Ekl9QZK3bO1jC8L+qa6X5fxAaNQIlg9BWMj
         EhcpDHdC6n4srAyl2JvKy+O0Ir7VDWhsxnJoUJpiVx5A6BMLifLJ/6kdBjor7+fVYDqM
         9TZ/KyQK6TxTiLyWUHm8zj2z0ez9R3nCU0QB1vhYeh9kUyGjPuGC1ovHixGguXbYPbMe
         gBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk/SkMQ1am7iNbeEqaA/upPJO5aTpUESGASALSDq4/JDw/QWdLVx/UvazEIVjgR728soeGtWQXl9na+RHPddbLvQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGaDqp7qY+P6FefcGqOezoHLmsysJVS+Am8g8xNUiL7ijTGkgw
	3EY2UB/8b/d3GTRPqNjt6MNb0yhnX/IY3IySXS7v+Et+PcIJ7U8snbAOuK2cc+yIw3Y=
X-Gm-Gg: AZuq6aJz1pzQ94mEq+draotKB5y5myitqCmqH6Dk7b93kMmvMdfcofsbWchm1xS9skQ
	gvxsNHa9mSZeR8C4kynI46Ll/RRqdnWv3ogdlbhMKimPvnRRL/00LjmO3lP1y/cIGWwZ+4LuRX8
	CC8bAubsBgd5KinZ4hrzFPPMu0Lt2tat+yHenHJGP+t2n+ye/jJJbDx73kwQSkUHMWOvjMSTcEx
	ck57pJ5GTCiViYX2eTirhNG6652Gxt1xfqcTNXpMhcESlNu1CqZF4OAKZ87VTYiU1feEC1CI2xd
	bGnby2tuNJ/GX5paxxeyuzTF3tnJkxk3M/SPgWoEWM4vfYeS8Pp6QCbnhjzblJUl2E9h9kn9eN6
	26zP8z5xeRLp1+DGcWUpWuzll2cqae4ju+OKlg6NqYfIZaa40x2zPErK6arkg920KzULXVpP3T3
	MkUM/069uUF3fcSAktb23b5tdyemfJa1jzO/9e+grTAGLcEKUGDqRB2k7cam3M3iIPqiJibiJNK
	l5W4EyARUOGSA==
X-Received: by 2002:a17:907:3d4e:b0:b87:117f:b6ed with SMTP id a640c23a62f3a-b8e9f158a26mr216327666b.21.1770208479898;
        Wed, 04 Feb 2026 04:34:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d? ([2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea00689d4sm118284166b.68.2026.02.04.04.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:34:39 -0800 (PST)
Message-ID: <1cd94533d438ad4e689da8636bae06859778ef29.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 07/15] kernel-yocto.bbclass: Disable ccache
 when rust-kernel is enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, Paul Barker <paul@pbarker.dev>, 
	Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	alistair.francis@wdc.com, bruce.ashfield@gmail.com, elmehdi.younes@smile.fr
Date: Wed, 04 Feb 2026 12:34:38 +0000
In-Reply-To: <DG66GUA3GH4D.31PC9MVWLCK32@smile.fr>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
	 <20260129163910.2612040-8-Harish.Sadineni@windriver.com>
	 <8a9cf281b36ede03135fb042e260d22785ed4f38.camel@pbarker.dev>
	 <DG66GUA3GH4D.31PC9MVWLCK32@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 12:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230518

On Wed, 2026-02-04 at 13:31 +0100, Yoann Congal wrote:
> On Wed Feb 4, 2026 at 1:05 PM CET, Paul Barker wrote:
> > On Thu, 2026-01-29 at 08:39 -0800, Sadineni, Harish via
> > lists.openembedded.org wrote:
> > > From: Yoann Congal <yoann.congal@smile.fr>
> > >=20
> > > Currently, a ccache enabled build fails with:
> > > =C2=A0 |=C2=A0=C2=A0 HOSTRUSTC scripts/generate_rust_target
> > > =C2=A0 |=C2=A0=C2=A0 HOSTCC=C2=A0 scripts/kallsyms
> > > =C2=A0 |=C2=A0=C2=A0 HOSTCC=C2=A0 scripts/sorttable
> > > =C2=A0 |=C2=A0=C2=A0 HOSTCC=C2=A0 scripts/asn1_compiler
> > > =C2=A0 |=C2=A0=C2=A0 TOUCH=C2=A0=C2=A0 include/generated/gcc-plugins.=
h
> > > =C2=A0 |=C2=A0=C2=A0 DESCEND objtool
> > > =C2=A0 | error: multiple input filenames provided (first two filename=
s are gcc and
> > > .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_ta=
rget.rs)
> > >=20
> > > when using ccache, value of "HOSTCC=3Dcache gcc" when this value is p=
assing
> > > to rustc, It is thinking gcc is a input file. when ccache is not used=
 "HOSTCC=3Dgcc" is passed.
> > >=20
> > > Disable ccache for kernel build if rust-kernel is enabled to workarou=
nd
> > > this.
> > >=20
> > > Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> >=20
> > This patch is good, but we should try to get the issue resolved upstrea=
m
> > if we can so that ccache can be used.
> >=20
> > Has this been reported upstream yet? Could you also open a bug in our
> > bugzilla to track this?
>=20
> Hello,
>=20
> For context, a lengthy discussion happened on this patch here:
> https://lore.kernel.org/openembedded-core/CA+TGqK9Yd2WWKrhMkhofF-8N0cESCS=
efWD2DXr4sBO9fDQXyrg@mail.gmail.com/t/#u
>=20
> And, sadly, we lack resources at the moment on our side to follow-up on t=
his :-/

Putting some links alongside this to more details would probably at
least help a bit, particularly if ccache upstream documents it is
imcompatible with rust...

Cheers,

Richard


