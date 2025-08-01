Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25958C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 15:48:36 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.91254.1754063307446247267
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 08:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tsx/MxNp;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71b4fc462ddso15090747b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754063306; x=1754668106; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4me/AC25AmcE99bjkzxhGHZ+HTtu0f/XDQsm5tjjUJA=;
        b=Tsx/MxNpaLmcfAMoeAY1ejDdpoucmHhs9fiqSpz/uBYJ51yxBPaJ2azcrCAesYEcoA
         N1B3h2ILSC3zyXZS7yx8mN4KLpH0cXXbYb4V8EtrKh9Io8M6nYcesrqNqJBt+cmCdb3h
         ZorvFZilMFH/zA0XO20x3+RvuFlW/vG6PfBUpmG4eyxLn3iopMW8xFRWLqNkbUtxjpmN
         JFq++lOpiOcMO0tr4J2RwMofo/nO9OchNwoCGTRqUPmxAbR5QmSuqHggXa5E6BN7PNLE
         v7fz2Bi8klIkrjaIgdvIbREMmTKKUNt362yAi6Q8c72wx86pGdpoH2iDly2vkCampVan
         xBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754063306; x=1754668106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4me/AC25AmcE99bjkzxhGHZ+HTtu0f/XDQsm5tjjUJA=;
        b=L5K+2TUj3IoubtfihgluCIvWXhAuYB7P8rGXTqLLTCFVoLFHSOEB/3kiAs/GqXG3wK
         NGbX5/i4mH7HAxbGeFBPeRJTr0nLB17n2HMFD+HWviTK7uvL452xbNtvA5B21O0LSHFy
         LCJpzJtqhM4g/8zA9LiNQo2knV5HTR5QLbVAuA2wHmz5qObCQdYuZC0JPWJfCIy/caLS
         hQN/zqV/9ky0FWTVnGaIJJpisOkUuJy5So/i2un6pveJq3qCjIVYvwNpxE/QWDo3Wt3I
         2WCKgJVBFX37DBdx2Qvl7OGHgrqIm8Fa/FzXPFzkeiEZBlPi+nAnGGNQz3Pt0w4xEJsz
         KSeA==
X-Gm-Message-State: AOJu0YxizvBEQ8FlhrSqaF5mk0KTm8pndRfRv0qswAsIWSfRWMrBFK6C
	grhXYkuKIbgW4hMqTP3B+Ys4V761FrCs0c8V9/hcl+D00iE54QfSABkl/WDB5rBi7i32HhXAE6f
	58TpGaoX7+HwBKp1phLak5ZF9yr78p0w=
X-Gm-Gg: ASbGncvSsYG9DqdgwsaJWo7UUV5j25JmIx6jKLOC3QP5zQIcbNEtQW79y6sKc04Iy5c
	yH2gm5iGe3xlDdGghbFz+jDg4Rm3sEDli+7JwBuKBkkF7CJwTBl6yDVIJaoDZKWVPCTwSBBrNU8
	DqdOmXgu4noTpJLzrNyK/ottxdsAxKMdcYua/C+PDALl//HD5KDyg38cv43HVVEO6Y0JqyQKN1L
	Ic53Rhn5SOBatTSX6esk0yqlhob6ricwo9tIntI
X-Google-Smtp-Source: AGHT+IHHNyZMvQbw6JhJ9tZ0HkN0w7xFBCNPHZAsevxuj70QK7TvUO23ydpwxfOoKzEnVciE77ah0Hh7BEJTQRCwJIg=
X-Received: by 2002:a05:690c:4b08:b0:71a:4099:4254 with SMTP id
 00721157ae682-71b7ef4db70mr1596267b3.22.1754063306462; Fri, 01 Aug 2025
 08:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250730061807.1642753-1-raj.khem@gmail.com> <1CB5D038-8F5F-4FE8-88F6-602717B1657B@arm.com>
In-Reply-To: <1CB5D038-8F5F-4FE8-88F6-602717B1657B@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Aug 2025 08:47:59 -0700
X-Gm-Features: Ac12FXxjmETLq1TeFqJbIKRsJg0zOgcGv3iHT088wa2QE9VfofFl4EdjKGFVUZ8
Message-ID: <CAMKF1spbzekne5XijsiBHBXimAF9an-2az79=Pt7XTdtExPpnQ@mail.gmail.com>
Subject: Re: [PATCH] libclc: Set LDFLAGS to BUILD_LDFLAGS in do_build_prepare_builtins
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 15:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221366

On Fri, Aug 1, 2025 at 5:59=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 30 Jul 2025, at 07:18, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This function is compiling a native binary, however its operating
> > largely inside a target or nativesdk shell environment. It does
> > tricks by passing toolchain-native.cmake to provide native
> > overrides for cmake, which works for most of variables of interest
> > besides LDFLAGS. In the toolchain.cmake files on OE we do not
> > override LDFLAGS but append to it via CMAKE_CXX_LINK_FLAGS  or
> > CMAKE_C_LINK_FLAGS, which causes problems because LDFLAGS for
> > nativesdk will contain --dynamic-linker option pointing into
> > nativesdk string and when doing target build it will use the
> > LDFLAGS from target environment which might work if it does
> > not contain conflicting flags.
>
> Is the problem that the environment contains variables like LDFLAGS which=
 are for the target, and cmake is respecting them when we=E2=80=99re doing =
a native build?
>

right. toolchain-native.cmake overrides some and appends to some
variables and LDFLAGS is not overridden but appended to.


> Possibly, our toolchain files should be setting CMAKE_SHARED_LINKER_FLAGS=
_INIT to the variables don=E2=80=99t get used at all.  But until we change =
the cmake class, I wonder if we should just nuke the environment when runni=
ng CMake as there=E2=80=99s more variables than LDFLAGS to cause trouble? I=
 can=E2=80=99t replicate your failure, but this seems to work in libclc:

You need to build libclc from clang-21 for this to show up. If you are
interested use kraj/clang-21 branch

>
> do_build_prepare_builtins() {
>   env -i PATH=3D$PATH cmake =E2=80=A6
>
> I=E2=80=99ve just sent a patch, can you test it?

Yes, this works too.

>
> Ross

