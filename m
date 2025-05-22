Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFB1C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 15:36:30 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.26803.1747928189582074767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 08:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9Unlq7X;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40356cb3352so4112b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747928189; x=1748532989; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irVI6aAzmJgPnWN09FPkpqtCbzyoo/MMRdaMdGDLeAg=;
        b=g9Unlq7XOLu+VVUAZ8iD+1dVrfk/OX6Hf4BTXQGCKzXJm3ZfXnXw90/d91L6WgNLZC
         m53cUwCN+HEprff8O4XmQI5M5b7P+PyKPdvV6hbCHT8YlRhOnD57n9qrEp1wLm9xSSGD
         NS5oQTvmk79s+kO7gS3286+E3QJ0NmGFWsUfynABH1Z6edYA59hpkxsvPfjDVc+WeFkl
         e8Wx05vh07O0Mrj71mnk+6QWgPJdRDtdsSsds4p6TAq4Qs24XBFJMaUuNyA5ltJZ62SY
         sMXrIF6FOBs7MDCHdN0HOWivmA6L8AJABABPY7NDTK2o0MC11iLxUL7TbBgEWj82iRwW
         zEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747928189; x=1748532989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irVI6aAzmJgPnWN09FPkpqtCbzyoo/MMRdaMdGDLeAg=;
        b=KsakaQCHtRV1+uHmISniGWSe2xry0FLBEdOvdoGX3t514RBowH2QbBVBM/PWhMXWfa
         Mq/C2GyYipOPad9Medvit3gXshlDvzYnKbQz20JeAdKLPUfyvFV+rV2tgausEB9ljt97
         PosY58hNrlRBAGTZf6zDf7kkLuUFnF1QfljcYi6auoBoyfp4IbB1J3J8wM+OngfKdXUR
         WLeh1rgfYxhiQvcFeIJOxCjqm/LrrhRFambVJrrUfGZIpJWXP7E1XSWucPylzKo0I1/9
         Z23CxZSO9KpaHpgZhoK7S2SQcGjUFuOH2zuN3ymJGIs8T8n2z5vlObtfIyxZixgFyTy1
         XMOw==
X-Gm-Message-State: AOJu0YybM+8cbuxszwTBEQYEVSZ/d5BaNklR65mFDbdjnhzNwRbhCG7l
	FPlNHgr5Lr+6WCppd99vF0jwzm951ePg0CGZkM5TqdWL2zYu+GgUvemtXa1Q/i2oADOKXec9tgZ
	7Bxcl86qolGzxOa/1eOKmQNnZ9I6H8vE=
X-Gm-Gg: ASbGnctLp7TuMuaf1DOAo5sXwaJWyFxwW3sbMBC+HdEkjufx+D8G2s/uewKvMvgxE8h
	UilCBUUwDgRr1Br3IFxppo9n3Swl2K1juA8OS9v41RorYxz/xf7W+hXWg4ABE6UJxHXFUaL3GrC
	o4yN74aL+31/bN/DWqnAhXatYetHWrc/Ti
X-Google-Smtp-Source: AGHT+IFAnPBrGl+VouuaijBJ6N6Bcz/DEdKTHiBLC4iJrhW4o7zSYRp/6oYoAxP84y5d8vfzX+L64mhy28a4p9OE2Ac=
X-Received: by 2002:a05:6808:1250:b0:3f6:a851:fe56 with SMTP id
 5614622812f47-404cd7430b3mr13457346b6e.12.1747928188652; Thu, 22 May 2025
 08:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-8-db97c2eb3756@gmail.com> <5994B15C-6892-421C-8DE9-947331A9C451@arm.com>
In-Reply-To: <5994B15C-6892-421C-8DE9-947331A9C451@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 08:36:01 -0700
X-Gm-Features: AX0GCFsOsrVdTgRtLD5usSbFOOihsgfzXRMoCQYiBxrjcfdBy1c_KXaGc-WE_mk
Message-ID: <CAMKF1spdc7C4NWHLDs0-hZ=SKAvzoQugZu3L1j7Nn45DWaABiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 08/28] libjpeg-turbo: Fix build on mips/clang
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 15:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217128

On Thu, May 22, 2025 at 2:47=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 21 May 2025, at 07:19, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb | 6 ++++++
> > 1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb b/meta/r=
ecipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > index 8533bd8525311e783572cbafb6fccf240db9e0e8..90aa2ef43956f0a1e64f8e0=
8e47d953bf5773e19 100644
> > --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > @@ -47,6 +47,12 @@ EXTRA_OECMAKE:append:class-target:powerpc64le =3D " =
${@bb.utils.contains("TUNE_FEA
> > DEBUG_OPTIMIZATION:append:armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS=
', '-mthumb', '-fomit-frame-pointer', '', d)}"
> > DEBUG_OPTIMIZATION:append:armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS=
', '-mthumb', '-fomit-frame-pointer', '', d)}"
> >
> > +# libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
> > +# <instantiation>:13:5: error: invalid token in expression
> > +# .if $17 !=3D 0
> > +# ^
> > +CFLAGS:append:toolchain-clang:mipsarch =3D " -no-integrated-as"
>
> The log is from 2.0.2, did you replicate this with 3.1.0 before moving fr=
om meta-clang?

Yes, I have started with vanilla poky and waded through world builds
for all qemu machines, bringing only the changes which were
still failing and not fixable differently. If this helps.

>
> Ross
>

