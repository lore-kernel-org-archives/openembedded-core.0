Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C443FC83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 01:40:20 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.39084.1752716418165225752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 18:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Arj8cas+;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71841a48502so3337127b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 18:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752716417; x=1753321217; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyJOXdw/mAPgZzHrWZBkUX41Zis6f78QP0ryict3xRY=;
        b=Arj8cas+L6NIvUO8orbJyayd9fb2RNdzNVtCW5Fm2u2SrP1pkObS/2UO/R/LFu+FmM
         lPLJnzAOVjugSoiUsAZtvAmqs6LiIxuCsxKTX5CAM/ZnzfFRl/AZsPppIqr6dWcA03Qj
         hqc/2NW8F/e7rD94NWsjcB2LjVkgYXOLqyF6J2R8TD+hhqWwyoGOkhMo1aTfq1PtG+Hn
         2zKy+HgHWpGve8rKvMDDKXyo8wUEGpE8B7A9vcehBVKFJaIOsI2FM4RcdXnoVZQr/sEc
         VSQB2AfHQ06mY0XqQIvNDLCPrRBjsl5eqbUjzjjoEP5KaU+mKUesGxHNtFE424cEL038
         xVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752716417; x=1753321217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyJOXdw/mAPgZzHrWZBkUX41Zis6f78QP0ryict3xRY=;
        b=hLJh9/Wmpm1aQTMMnJJpZS7a3DJ2AxKyMTonUSOM3dyOBTsfeopIySkGDYVH8fjvm5
         Shh65KOr+XcvUED6Trb6UKxGmhUfTh1+OxAZhobliBjsc+BvvYvfOrv3VWtPtfjKOzKi
         VjTXWdnRtFk767mquu41hNlosfI+VO/V9B3l1IFkGrjbBWCwFxAn+7wSfzYtZZ6tf3uI
         B6nMdJM74XT9ggP1/Ldkazej9upjlnisufYhSQMeK6O9vdYxfDtQ0wn/BHTwQPL4GaOj
         J2kE99UIfXwiZCPq8B5s2vRoIvpuMOhDabRFyHQLs/9XLg9exhTmlbzNtmy40LhxV3uS
         KIDw==
X-Forwarded-Encrypted: i=1; AJvYcCUC75YPEIjjx3UJiPkQZo2gdHt7JQH+s4Q9zVGn8HUnu+gcIqLo/fzRqfowTXYgcVkapapeJW+kbrUCiTMoiFQn/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy2ekIQyDj2dJsUYcZaqhezP337f/lRAwq7Zj3lJ/5NLaDUkkKt
	MyFp/fKsq+RFTxCXXFDoOHRqVZ9mkA82iVat5hiR4smBaeeJIh8uDG2HnuODtl24ezAjKqPM8kO
	B7QcvdTN532EWvjwucPGiLV/AyxBGWS0=
X-Gm-Gg: ASbGncuH0FXs3ieh4ux+g5H1L7zCrF18dn5B9u2pCqGpdENAGG3UB1ilJowzh1blvu9
	UFK6upebXEMGQEnj3MqG4SMg80w2Z09tBs+oQbSzjKCYeoy2M6xLu8hV67b+ys6YAu+xEAE659s
	gbezE04u091GMyERSkpHp+6Hm7yS8ZIQXI0+h8X8iIHh5wS5HoUeAMrq2uPNHTIxZDoGU4HPeLo
	TAJ/A==
X-Google-Smtp-Source: AGHT+IGfO3UtYnhs7cSUq/Z/TX46Yo5tEAt5L1ebmG7I7ysOKaPzjaSJG40ULHL2DVOX+nnv+3ORETSChJpjOoMh5Ak=
X-Received: by 2002:a05:690c:7206:b0:70c:d322:8587 with SMTP id
 00721157ae682-71836ca9a62mr65874657b3.6.1752716417049; Wed, 16 Jul 2025
 18:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250716145707.2271609-1-skandigraun@gmail.com> <a514a643-5ca6-419e-845a-e62beabb198f@cherry.de>
In-Reply-To: <a514a643-5ca6-419e-845a-e62beabb198f@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jul 2025 18:39:50 -0700
X-Gm-Features: Ac12FXy5Erfmsdb_K9qX7l2WpsjXpiPMcv3Mq2IOe4HitjRwAjchaO6rszKClSQ
Message-ID: <CAMKF1spBcJetnA0VkAc3vPRVn6=svwP1WaJ+AQO8eYJ=YtBXfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] toolchain/clang: handle big.LITTLE Arm SoCs
To: quentin.schulz@cherry.de
Cc: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 01:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220482

On Wed, Jul 16, 2025 at 8:10=E2=80=AFAM Quentin Schulz via
lists.openembedded.org
<quentin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
>
> Hi Gyorgy,
>
> On 7/16/25 4:57 PM, Gyorgy Sarvari via lists.openembedded.org wrote:
> > clang doesn't have Arm big.LITTLE specific tune options - when they are=
 used,
> > the compilation fails with an error like this:
> >
> > aarch64-poky-linux-clang: error: unsupported argument 'cortex-a72.corte=
x-a53+crc+crypto' to option '-mcpu=3D'
> >
> > To avoid this, in case a big.LITTLE SoC is the target, select the tune =
corresponding
> > to the LITTLE core.
> >
> > This has been lifted from meta-clang, extended with cortexa73-cortexa35=
 which
> > was missing.
> >
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > ---
> >   meta/classes/toolchain/clang.bbclass | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolch=
ain/clang.bbclass
> > index d7b8a3657c..b0e284be84 100644
> > --- a/meta/classes/toolchain/clang.bbclass
> > +++ b/meta/classes/toolchain/clang.bbclass
> > @@ -34,4 +34,20 @@ TUNE_CCARGS +=3D "${@bb.utils.contains("DISTRO_FEATU=
RES", "usrmerge", " --dyld-pre
> >   LDFLAGS:append:class-nativesdk:x86-64 =3D " -Wl,-dynamic-linker,${bas=
e_libdir}/ld-linux-x86-64.so.2"
> >   LDFLAGS:append:class-nativesdk:aarch64 =3D " -Wl,-dynamic-linker,${ba=
se_libdir}/ld-linux-aarch64.so.1"
> >
> > +# clang doesn't support big.LITTLE tunes, choose always the tune for t=
he LITTLE cores
> > +TUNE_CCARGS:remove =3D "\
> > +    -mcpu=3Dcortex-a57.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
> > +    -mcpu=3Dcortex-a72.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
> > +    -mcpu=3Dcortex-a15.cortex-a7${TUNE_CCARGS_MARCH_OPTS} \
> > +    -mcpu=3Dcortex-a17.cortex-a7${TUNE_CCARGS_MARCH_OPTS} \
> > +    -mcpu=3Dcortex-a72.cortex-a35${TUNE_CCARGS_MARCH_OPTS} \
> > +    -mcpu=3Dcortex-a73.cortex-a35${TUNE_CCARGS_MARCH_OPTS} \
> > +    -mcpu=3Dcortex-a73.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
> > +    -mcpu=3Dcortex-a75.cortex-a55${TUNE_CCARGS_MARCH_OPTS} \
> > +    -mcpu=3Dcortex-a76.cortex-a55${TUNE_CCARGS_MARCH_OPTS}"
> > +TUNE_CCARGS:append =3D "${@bb.utils.contains_any("TUNE_FEATURES", "cor=
texa72-cortexa53 cortexa57-cortexa53 cortexa73-cortexa53", " -mcpu=3Dcortex=
-a53${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
> > +TUNE_CCARGS:append =3D "${@bb.utils.contains_any("TUNE_FEATURES", "cor=
texa15-cortexa7 cortexa17-cortexa7", " -mcpu=3Dcortex-a7${TUNE_CCARGS_MARCH=
_OPTS}", "", d)}"
> > +TUNE_CCARGS:append =3D "${@bb.utils.contains_any("TUNE_FEATURES", "cor=
texa72-cortexa35 cortexa73-cortexa35", " -mcpu=3Dcortex-a35${TUNE_CCARGS_MA=
RCH_OPTS}", "", d)}"
> > +TUNE_CCARGS:append =3D "${@bb.utils.contains_any("TUNE_FEATURES", "cor=
texa75-cortexa55 cortexa76-cortexa55", " -mcpu=3Dcortex-a55${TUNE_CCARGS_MA=
RCH_OPTS}", "", d)}"
> > +
>
> Wouldn't it be better to have this in the tune conf file directly? I'm a
> bit worried we'll have more big.LITTLE flavors in the future and because
> this is in a separate file it'll be out of date.
>
> We should be able to do that by simply using the toolchain-clang or
> toolchain-gcc override wherever appropriate?
>
> E.g.
>
> MCPU =3D "cortexa73-cortexa35"
> # clang doesn't have Arm big.LITTLE specific tune options, so select the
> tune corresponding to the LITTLE core.
> MCPU:toolchain-clang =3D "cortexa35"
>
> TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "cortexa73-cortexa35", " -mcpu=3D${MCPU}", "", d)}"
>
> [... and other replacements in
> meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc]
>
> (NOT TESTED) something like that?
>
> What do you think?

Agreed. Having it in tune files is definitely easier to maintain

>
> Cheers,
> Quentin
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220469): https://lists.openembedded.org/g/openembedde=
d-core/message/220469
> Mute This Topic: https://lists.openembedded.org/mt/114186273/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

