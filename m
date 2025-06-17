Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7112DC71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 09:21:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.14489.1750152079408671797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 02:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NJPgCIGZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso5291377f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750152078; x=1750756878; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvGrqkqW00g8IWoryvMvKHajSTU1eqb0wFY8prjWczQ=;
        b=NJPgCIGZ2bkJ3TLuytTj/MEOcsiv6FDKLeBCluFK1+oTPC1L/mPF94UkIozThhF2Qn
         w2yIiMKT3GvcAdalEj/gfDly+uyVyJSJiwBTrE9t4bHYjVEutRBEqiwceberZnd20SFv
         vB+a5nULKOgV4CqHeP7PSLj/Tpx1HNJYavsMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152078; x=1750756878;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvGrqkqW00g8IWoryvMvKHajSTU1eqb0wFY8prjWczQ=;
        b=Wizfojc37TIBBxDp9D1+lWdwMz9LvOaFnIqam8WiMUCTgAxAjE+qRJ0v1Qk2XpBFS7
         ZuFbT4ru65qXipZs0byy5y8mf1Hav5SA+7ao6nnkCHH7LiyLuL19rj7hZC13bPWeQp/1
         w7uQ7wvRae40ftl7wWk2dtG/JZkGFT6mNhmmx3z7Qbcit/2c9XDBuoRM3Gub/Eo6JRkW
         8tcBkBjH/iaSOAjk2Ot2cUWCNa2TqlO1hcwsb+5WtjPWQ1V+yPwUf1FIulyWSrHMf51m
         CqJvG//JXjEspVm93vLZeG7osRbYt0tnbwKinOSo7PtYLSYdGSiy+IBJGn2FHasZRqic
         EqGw==
X-Forwarded-Encrypted: i=1; AJvYcCVXB15/ukXkYiIBjkCzrrJAWS1/DLW/viC8Ofe7OeKuixpdRuK2Mj6NraB8hSYVyoKlpB749WQqI9Mbm+2A7TyNMA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzX1mqNxlTbWJWBKRI76NTxv96f+aRKpyOgYHtcBNkcxq9eXEqF
	RcwIF8sjbwJoJy/o4DJNqmbprUK1TLCEx4d7DM8iffuFf5d0Q5ZQQCn7M5WwtO6UZFk=
X-Gm-Gg: ASbGnct1aEbIk7jwVpcQFNfxnvYlslzHoOeuqh6frq0DKrfkQqtm9Wj2Xe5jIx1va9Q
	St6NXR2/f4k5Q0E4wtLOIESpP4jrrlx1G5sQxpP33/Yqoz4v0LgbokkIWCnrdSe3IwwN44AUGN/
	9braSZ5I4tokbjlABCvaGb6QkLAk6OXKM+1ZJAKhQJg+0tcGFj/xCQC8RRBR9/TUQGv2ZaUWphb
	W4HrMue5VQ8g4Dsgau1aewugYBDlkoqHg9fkalNru2iEWRvLYdWObbiHeEg53bL/Dsk15je8muS
	NCD/p9wt50W80XbvBdSKuYfOMHbTaIXhmdqzttEv62xipJrZz8f32me5zWGn0UcsqsNWY9BDI+P
	QCaT58o7QmGotPiZqPdEmbTSCc7UAQ4IICo6UpVQBQsr+dw+3g+pZs/FeXSSRfA==
X-Google-Smtp-Source: AGHT+IEYxHCm7CXYorz+XdC1eLt4aQT1vbvJVsJmJ/VU44K4r+6+SNaQKVi0fVjKDqVtsHonzhzUdw==
X-Received: by 2002:a05:6000:4211:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a572e4b6eemr10375404f8f.49.1750152077780;
        Tue, 17 Jun 2025 02:21:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1aa8:70fb:7368:37ad? ([2001:8b0:aba:5f3c:1aa8:70fb:7368:37ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73a7bsm13609249f8f.36.2025.06.17.02.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:21:16 -0700 (PDT)
Message-ID: <9dae216637e5b3d51f9da41b16fbe091d050fdb4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/5] toolchain: Provide abstraction for recipe
 specific toolchain selection
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2025 10:21:16 +0100
In-Reply-To: <DB5PR02MB102130026EDA1102924183010EF73A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
	 <20250612135955.1413300-2-richard.purdie@linuxfoundation.org>
	 <DB5PR02MB102130026EDA1102924183010EF73A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218866

On Tue, 2025-06-17 at 09:12 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@=
lists.openembedded.org> On Behalf Of Richard Purdie via lists.openembedded.=
org
> > Sent: den 12 juni 2025 16:00
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 2/5] toolchain: Provide abstraction for recip=
e
> > specific toolchain selection
> >=20
> > This implements a toolchain selection mechanism, defaulting to gcc
> > as per the existing defaults.
> >=20
> > Introduce a variable called TOOLCHAIN, which denotes the familiar
> > name for toolchain e.g. "gcc" which selects GNU compiler + binutils
> > as default C/C++ toolchain or "clang" which will use LLVM/Clang Compile=
r
> >=20
> > TOOLCHAIN variable has a global fallback to "gcc" in configuration
> > metadata. A distro can switch to using say "clang" as default system
> > compiler by defining
> >=20
> > TOOLCHAIN ?=3D "clang"
> >=20
> > In local.conf or other distro specific global configuration metadata
> >=20
> > It is also selectable at recipe scope, since not all packages are
> > buildable with either clang or gcc, a recipe can explicitly demand
> > a given toolchain e.g. glibc can not be built with clang therefore
> > glibc recipe sets.
> >=20
> > TOOLCHAIN =3D "gcc"
> >=20
> > Based on ideas/work by Khem Raj <raj.khem@gmail.com>
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/classes-global/base.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
> > =C2=A0.../clang.inc =3D> classes/toolchain/clang.bbclass}=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> > =C2=A0.../toolchain/gcc-native.bbclass}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> > =C2=A0.../toolchain/gcc.inc =3D> classes/toolchain/gcc.bbclass}=C2=A0 |=
 0
> > =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 3 ---
> > =C2=A0meta/recipes-devtools/binutils/binutils-cross.inc=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> > =C2=A0meta/recipes-devtools/clang/clang-cross_git.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A0meta/recipes-devtools/clang/clang-crosssdk_git.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A08 files changed, 13 insertions(+), 3 deletions(-)
> > =C2=A0rename meta/{conf/toolchain/clang.inc =3D> classes/toolchain/clan=
g.bbclass} (100%)
> > =C2=A0rename meta/{conf/toolchain/build-gcc.inc =3D> classes/toolchain/=
gcc-native.bbclass} (100%)
> > =C2=A0rename meta/{conf/toolchain/gcc.inc =3D> classes/toolchain/gcc.bb=
class} (100%)
> >=20
> > diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/bas=
e.bbclass
> > index 4ac3b83eb5c..4809cca27de 100644
> > --- a/meta/classes-global/base.bbclass
> > +++ b/meta/classes-global/base.bbclass
> > @@ -19,6 +19,15 @@ PACKAGECONFIG_CONFARGS ??=3D ""
> >=20
> > =C2=A0inherit metadata_scm
> >=20
> > +TOOLCHAIN ??=3D "gcc"
> > +TOOLCHAIN:class-native ??=3D "gcc"
> > +TOOLCHAIN:class-cross ??=3D "gcc"
> > +TOOLCHAIN:class-crosssdk ??=3D "gcc"
> > +TOOLCHAIN:class-nativesdk ??=3D "gcc"
> > +
> > +inherit toolchain/gcc-native
> > +inherit_defer toolchain/${TOOLCHAIN}
>=20
> What if you want to use clang as your native compiler for everything,
> i.e., even when building target recipes? Would something like this=20
> make sense?
>=20
> TOOLCHAIN_NATIVE ??=3D "gcc"
>=20
> TOOLCHAIN ??=3D "gcc"
> TOOLCHAIN:class-native ??=3D "${TOOLCHAIN_NATIVE}"
> TOOLCHAIN:class-cross ??=3D "gcc"
> TOOLCHAIN:class-crosssdk ??=3D "gcc"
> TOOLCHAIN:class-nativesdk ??=3D "gcc"
>=20
> inherit toolchain/${TOOLCHAIN_NATIVE}-native
> inherit_defer toolchain/${TOOLCHAIN}

You'd need to use inherit_defer there ;-)

But, I know what you mean and this doesn't work since a recipe like
clang-cross sets TOOLCHAIN =3D "clang" and you'd override it here to gcc.

Ultimately we do want to allow native and sdk toolchain selection but
I'd not got to enabling that yet.

Cheers,

Richard


