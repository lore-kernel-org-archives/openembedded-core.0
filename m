Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E89CC5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:26:19 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.2776.1748550369573932839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PCsQCXv0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4d33f971aso948221f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748550368; x=1749155168; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQYDvWDaBIsGZR4GkyFe4Wo2ipJVwa70wUMSa6Gb3n4=;
        b=PCsQCXv0joVxwnKDDU00SEEtAqnTNJ8TuAbLEgaDk7qVdWH1JlsVhWkX3UKfaA7XCe
         LBpupC8bFSHCnMygdcr2HcNHdoxOK5z0rKQWj4fXT2t1DG8P426dIA69CNUKIzUr+vhM
         iXNPuK/kOKPdM4upGDPbZIu0KbbQyjbszwKJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748550368; x=1749155168;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TQYDvWDaBIsGZR4GkyFe4Wo2ipJVwa70wUMSa6Gb3n4=;
        b=lND8DmfRmu2O06p8jR2houkXqbYxRQkvi+M05terSiQ9MRxr8GqGHGbtnN4xbNxEWm
         geDkDpEVTij2doravXGkH20jhR0TklDoNsCGf2EG8p23khSY5NyIGyJAB3eWzeLWwCyM
         J/Wb3H3yiIuToPQKvPrIllaSRjAyZ4AS/ikifTXRhDm01dm9WHP8EHJ79oE30d4QpCsk
         jBBpUyxybwI0rjP4kWoKuPnoSOQ4FjBR2NtyOyqBUjQnRJi8i0sdrNM8A78ok5m2M65I
         kLL62vTfMbDtDYDxjoE4+nDyT+Gsz0O1104tDXzrbPaxHvL6e9kgE0zhVO1mjgglP5ni
         lNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaAeR/1/fCNbndJcdrcWnPju2qy2K3Sp4OPs1/6GB8vj9IbqfpuSDvEaiIOq+x9r6L2LasSXwfS4cY0I7Y9WzTHA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/jwdE71tNNWv2i/Dh8ZZHjEEMA5VZ86uxjqODo0WpQgmBmeW+
	WrMEGYG69t+vbYVEnfBYlQeXquaZKPxZwlvtJ9bUawh1U9uVvQwtitQqI7IOfqi8RXg=
X-Gm-Gg: ASbGncvobIC+oWUxHIVQkHCK7QOrS9HjpY5t1WUwmTgv/9RTHCCkx58P3X+k1MfQA9f
	k1QWVgFWObxJMhUIx8pbSx3f7rm3souvOJVRVmHFa+iGWhiQhrVolneS41UECeKM/oxDWKHA1uz
	Yys96QBo9GaaVAxTAZtDrNqOlAeljlrhL5Yl+x/PH/00oe3owk74wctTVHirD3zUSxaCxHGyLVT
	uDSwfzDmdfHS4+S4yXAkHIr+iQNK6ymx+KfCvAjQK+GmwPlbaJ7u2HkXVXFGBOcmgz9TFHp27nS
	fSOFPaJr21mxC819/S5D4mPHEBxHbYaAx5zpSW1JclpocmcGGqsNa1027D0q7Jt3WeMvG77JglU
	cg/N7oOcjNoTzdB3iOUguSal5ZaAqw3rfyoXj7AOZkIgU78GeGXI=
X-Google-Smtp-Source: AGHT+IE0fud6h7yrLI/p59X9S8LREb76Cv++huil7GQiIKO8LcZgE2iTQugGCa3Xt3/oj1XtBy1Hug==
X-Received: by 2002:a05:6000:420d:b0:3a3:7753:20ff with SMTP id ffacd0b85a97d-3a4f7a36f76mr519131f8f.35.1748550367786;
        Thu, 29 May 2025 13:26:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3b45:5e9b:189b:a16c? ([2001:8b0:aba:5f3c:3b45:5e9b:189b:a16c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f0097205sm2945496f8f.79.2025.05.29.13.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:26:07 -0700 (PDT)
Message-ID: <a7bd4a5baccd74088cb3fd6b485ed21bba75547a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 06/13] libjpeg-turbo: Fix build on
 mips/clang
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2025 21:26:06 +0100
In-Reply-To: <e019bc45-77c9-4c04-905f-d4e0cdaa01b4@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
	 <20250522-clang-toolchain-v3-6-16cfc6d9891b@gmail.com>
	 <8779472af099d97425a52fe97f63f5c5e13e9655.camel@linuxfoundation.org>
	 <e019bc45-77c9-4c04-905f-d4e0cdaa01b4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217437

On Thu, 2025-05-29 at 09:28 -0700, Khem Raj wrote:
>=20
>=20
> On 5/29/25 2:22 AM, Richard Purdie wrote:
> > On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via
> > lists.openembedded.org
> > wrote:
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > =C2=A0=C2=A0meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb | 6 +++=
+++
> > > =C2=A0=C2=A01 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > > b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > > index
> > > 8533bd8525311e783572cbafb6fccf240db9e0e8..90aa2ef43956f0a1e64f8e0
> > > 8e47
> > > d953bf5773e19 100644
> > > --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > > +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > > @@ -47,6 +47,12 @@ EXTRA_OECMAKE:append:class-target:powerpc64le
> > > =3D "
> > > ${@bb.utils.contains("TUNE_FEA
> > > =C2=A0=C2=A0DEBUG_OPTIMIZATION:append:armv4 =3D "
> > > ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-
> > > pointer', '', d)}"
> > > =C2=A0=C2=A0DEBUG_OPTIMIZATION:append:armv5 =3D "
> > > ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-
> > > pointer', '', d)}"
> > > =C2=A0=20
> > > +# libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
> > > +# <instantiation>:13:5: error: invalid token in expression
> > > +# .if $17 !=3D 0
> > > +# ^
> > > +CFLAGS:append:toolchain-clang:mipsarch =3D " -no-integrated-as"
> > > +
> > > =C2=A0=C2=A0PACKAGES =3D+ "jpeg-tools libturbojpeg"
> >=20
> > I noticed you use "-no-integrated-as" but in the next patch in
> > pixman,
> > you use "-fno-integrated-as". Should we be consistent or are these
> > different?
>=20
> they are effectively same. -no-integrated-as is legacy clang option=20
> format while -fno-integrated-as is more in line with gcc options
> it's generally better to use -fno-integrated-as since it follows the=20
> conventional flag naming pattern that other compilers might also
> recognize.
>=20
> I will change it in a follow up for consistency.

I've tweaked the patch and merged it. With the pixman one we need to
explain the DEPENDS change before that one can go in.

Cheers,

Richard

