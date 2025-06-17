Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0B7C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 09:33:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.14736.1750152771385581376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 02:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hfQYrEjw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453398e90e9so28945115e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750152770; x=1750757570; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NL4YVibSPX+iJrazakeNz/90rJinu5DnjAG7Q4vtHaw=;
        b=hfQYrEjwKrFDbaNKQ4iZ/MsQKpSVeN3HM+H2lnGkbb6XLjZZCPIYlBC1G9DdSR8S/P
         V6Pbp4yKO/yUW3mVxHbPD3Si/jIKsSzlD2Ar+XQifuiPDhvGGtSnn88223MxEGk8RgcL
         fxZKYU+OmAeUAamwBmb2wDcAoz33YxaI2Oq00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152770; x=1750757570;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NL4YVibSPX+iJrazakeNz/90rJinu5DnjAG7Q4vtHaw=;
        b=F7BjJT+Pg98OZj3Pj2n1qF2whGI+PkPYYXHhr62vHv+DAM7ULU5hcphOrQ0iY0Q71W
         cbKrxwRcWSwYFdBL0a0Ykb6COPE8e5F3El9Vb9BUf7j7Anks6LkyiQPXrFVsMpobFWEs
         iJpBDhJgpPlMtuhmpl0DfqCkjUJSBNcJXO4sqJIRcwcVm2sZoq9rcHf0xkjaKvOUcGDN
         qBPpxuTmt3BfFLEb2wchG2WC70gSL6mQUj95rO/7TOnTUISq/jJYpbl+8JbsfXX3Ehde
         gk5UHmjf5BBmOFsp/vyCt8ZgcEYnzkvkSICO7a9Bano3YmgfdanW5GWRF8/o0Y4+zZpm
         ciaA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Xf3r1DpuZ4nP2BfZT24zMbgnpa3DGV5ewMwbrQPjotsoIiC+LUg1icTirboh49JZ06WCDvx8lTvbHRCy+HfJug==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywp3mlUyHCAzIOaajgRq0WJS/MM9pIOnJbYCHfwAIuYYAeESyt5
	GqI/L4M34QoLD0K6HpL7/+IiPW0ddyPn0dkn4TaIpmGRhTAHwZPPGfSdfzl3R62VW/0=
X-Gm-Gg: ASbGncsXUwL1moA6FUtjVQWfLcDKYE3jmQYqulimGtcj4vIrAZE1tTuI8xa20BZ5H+p
	qimpHTm9eKgI/x7pEpcuN01UYqEEvYE8sCitCpXdwk8eGeDf0Cimb5ccSBfjzYe2stf9fOhOSdV
	3w1h/0ctxsKcXnID5Ww8j63cFpjBYnmEGy2NZkCuqLSJKcSY5zUwrnvSU047yjYtpiZmkUiIDJ2
	T5hHJan9dpv/gh9oF50LHACbLzF85MluedYP+rSlgYIxLsXYxGi4jMsLjP1sZcTxjCOLtRyd2lP
	JzdfvsVC+5Jgi/isfXMJkuRb1qgrlSGZoRtbCpSoswKDcqc2RQYmJPmrSt5cs1U1qh4/TGjCwYy
	NQUtOt5MIZR0BhvHllnpPCCypS2A11pMAp/12swu361pev9QdUc0=
X-Google-Smtp-Source: AGHT+IEApjPf8mXbbmjXOGtyR9PdbRK9kIk8lsQ947btHfKvDla+GcUJ6QZT+cuKG7/YLnb5gfxK5Q==
X-Received: by 2002:a05:600c:a00c:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-4533fc72ca5mr110573965e9.0.1750152769721;
        Tue, 17 Jun 2025 02:32:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1aa8:70fb:7368:37ad? ([2001:8b0:aba:5f3c:1aa8:70fb:7368:37ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e244392sm169623875e9.22.2025.06.17.02.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:32:49 -0700 (PDT)
Message-ID: <1a7f82da17a76d675848414a269c996638b97414.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/5] toolchain: Provide abstraction for recipe
 specific toolchain selection
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2025 10:32:48 +0100
In-Reply-To: <1849CA0B3F4FE921.11779@lists.openembedded.org>
References: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
		 <20250612135955.1413300-2-richard.purdie@linuxfoundation.org>
		 <DB5PR02MB102130026EDA1102924183010EF73A@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <1849CA0B3F4FE921.11779@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218868

On Tue, 2025-06-17 at 10:21 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2025-06-17 at 09:12 +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From:
> > > openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@list=
s.openembedded.org
> > > > On Behalf Of Richard Purdie via lists.openembedded.org
> > > Sent: den 12 juni 2025 16:00
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [PATCH 2/5] toolchain: Provide abstraction for
> > > recipe
> > > specific toolchain selection
> > >=20
> > > This implements a toolchain selection mechanism, defaulting to
> > > gcc
> > > as per the existing defaults.
> > >=20
> > > Introduce a variable called TOOLCHAIN, which denotes the familiar
> > > name for toolchain e.g. "gcc" which selects GNU compiler +
> > > binutils
> > > as default C/C++ toolchain or "clang" which will use LLVM/Clang
> > > Compiler
> > >=20
> > > TOOLCHAIN variable has a global fallback to "gcc" in
> > > configuration
> > > metadata. A distro can switch to using say "clang" as default
> > > system
> > > compiler by defining
> > >=20
> > > TOOLCHAIN ?=3D "clang"
> > >=20
> > > In local.conf or other distro specific global configuration
> > > metadata
> > >=20
> > > It is also selectable at recipe scope, since not all packages are
> > > buildable with either clang or gcc, a recipe can explicitly
> > > demand
> > > a given toolchain e.g. glibc can not be built with clang
> > > therefore
> > > glibc recipe sets.
> > >=20
> > > TOOLCHAIN =3D "gcc"
> > >=20
> > > Based on ideas/work by Khem Raj <raj.khem@gmail.com>
> > >=20
> > > Signed-off-by: Richard Purdie
> > > <richard.purdie@linuxfoundation.org>
> > > ---
> > > =C2=A0meta/classes-global/base.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9
> > > +++++++++
> > > =C2=A0.../clang.inc =3D> classes/toolchain/clang.bbclass}=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> > > =C2=A0.../toolchain/gcc-native.bbclass}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> > > =C2=A0.../toolchain/gcc.inc =3D> classes/toolchain/gcc.bbclass}=C2=A0=
 | 0
> > > =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 3 ---
> > > =C2=A0meta/recipes-devtools/binutils/binutils-cross.inc=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> > > =C2=A0meta/recipes-devtools/clang/clang-cross_git.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > > =C2=A0meta/recipes-devtools/clang/clang-crosssdk_git.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > > =C2=A08 files changed, 13 insertions(+), 3 deletions(-)
> > > =C2=A0rename meta/{conf/toolchain/clang.inc =3D>
> > > classes/toolchain/clang.bbclass} (100%)
> > > =C2=A0rename meta/{conf/toolchain/build-gcc.inc =3D>
> > > classes/toolchain/gcc-native.bbclass} (100%)
> > > =C2=A0rename meta/{conf/toolchain/gcc.inc =3D>
> > > classes/toolchain/gcc.bbclass} (100%)
> > >=20
> > > diff --git a/meta/classes-global/base.bbclass b/meta/classes-
> > > global/base.bbclass
> > > index 4ac3b83eb5c..4809cca27de 100644
> > > --- a/meta/classes-global/base.bbclass
> > > +++ b/meta/classes-global/base.bbclass
> > > @@ -19,6 +19,15 @@ PACKAGECONFIG_CONFARGS ??=3D ""
> > >=20
> > > =C2=A0inherit metadata_scm
> > >=20
> > > +TOOLCHAIN ??=3D "gcc"
> > > +TOOLCHAIN:class-native ??=3D "gcc"
> > > +TOOLCHAIN:class-cross ??=3D "gcc"
> > > +TOOLCHAIN:class-crosssdk ??=3D "gcc"
> > > +TOOLCHAIN:class-nativesdk ??=3D "gcc"
> > > +
> > > +inherit toolchain/gcc-native
> > > +inherit_defer toolchain/${TOOLCHAIN}
> >=20
> > What if you want to use clang as your native compiler for
> > everything,
> > i.e., even when building target recipes? Would something like this=20
> > make sense?
> >=20
> > TOOLCHAIN_NATIVE ??=3D "gcc"
> >=20
> > TOOLCHAIN ??=3D "gcc"
> > TOOLCHAIN:class-native ??=3D "${TOOLCHAIN_NATIVE}"
> > TOOLCHAIN:class-cross ??=3D "gcc"
> > TOOLCHAIN:class-crosssdk ??=3D "gcc"
> > TOOLCHAIN:class-nativesdk ??=3D "gcc"
> >=20
> > inherit toolchain/${TOOLCHAIN_NATIVE}-native
> > inherit_defer toolchain/${TOOLCHAIN}
>=20
> You'd need to use inherit_defer there ;-)
>=20
> But, I know what you mean and this doesn't work since a recipe like
> clang-cross sets TOOLCHAIN =3D "clang" and you'd override it here to
> gcc.
>=20
> Ultimately we do want to allow native and sdk toolchain selection but
> I'd not got to enabling that yet.

I also just realised this was against an older patch. I did end up
merging something different to this due to the reasons I mentioned. I
don't think it was possible to use just the TOOLCHAIN variable to cover
all options, much as I'd liked to have.

Cheers,

Richard

