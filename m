Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A642C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 08:15:31 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.15792.1702023324912072277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 00:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m1ufXhOG;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cb20c82a79so6229261fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 00:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702023323; x=1702628123; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2FpbCtMxPJ69EQHQPI7tNccHejsiFWv4C1rbSX55bQ=;
        b=m1ufXhOGnUSnF1QbhesHtiURnYe8YuFo9y0kzu/CSZ2976fBmHGBj4UgiGT2hYYZm1
         40ghp5glZeP039+4nhu96c4rNJAFu+MTaYPKq0u3eurZdEAgtwVxuALJ4iT7mzx/86mD
         eMMGyDlYjl8z1DRVemJpj6qrQReZT6nqsEXW1Du/7rk9WxoRypgQ9ZLzuDlaT4LAJPlw
         EF5p44XT5Lp/klMyKF2uVEshhMIz/mcPHxt07OfII0mq2miWByx5LjofeQkDL3W97W9o
         T/pDx76C7XCz3AMNtuL/gRO1AX+qXfflr7Im26etm6h7my5zria9hqEFbKsuP7QAVHu5
         K7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702023323; x=1702628123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2FpbCtMxPJ69EQHQPI7tNccHejsiFWv4C1rbSX55bQ=;
        b=j5BHInO/e6hpaIPGxFGtTJMAl9C8PIbXdKtNoPUSTqrH/sM8Eg7a2wFmXNSHCLE5/x
         sE7Qz0kxfV95Ou+dZn0WuI+Sn/2YjgHVclvrNNatE0sLoV+1HixhUs7UC2vD12/XXt8P
         TTOrfW+FfYn4Fp5m7wbSEEzWgTQZvuumOKWHtqam314uhhdLCMARu7aKgYlYSn0V6ca6
         +QvMG9as33CJi1lOKoo1Qso616s9Tvum+dawNXr7yP9COy6EKTfeSBvBWiApp57JTJlY
         GWFOZsM7Ecwp8pNdH64cDSEYXpNmMTIvRtgqOLwC52GA81qVN60aQ7zl/cwP5IBvg+pH
         EyKg==
X-Gm-Message-State: AOJu0YxdtK7777kBpXSj7fxyZrYjZAWlt/gIXNUC2I1G8Nd+vF3vpkGh
	rLmERfMdRBPqEKOAIBryue4BY1bYF9IKGLrn+Po=
X-Google-Smtp-Source: AGHT+IExMuOU8zu1I1e+XkaYpd4bSUxgVTV3cKaPeD934hkZD1+dDaD1epv4BWVsUiTbqmmXRe8trprgNn1jE6JrKQ0=
X-Received: by 2002:a2e:a0d1:0:b0:2ca:cb:4275 with SMTP id f17-20020a2ea0d1000000b002ca00cb4275mr2037576ljm.87.1702023322650;
 Fri, 08 Dec 2023 00:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20231207133913.443-1-alex.kiernan@gmail.com> <20231207133913.443-2-alex.kiernan@gmail.com>
 <58a265ee08706c7d5e0b9c5678dfbe44b63c96cb.camel@linuxfoundation.org>
In-Reply-To: <58a265ee08706c7d5e0b9c5678dfbe44b63c96cb.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 8 Dec 2023 08:15:10 +0000
Message-ID: <CAO5Uq5T2OdiJS_HvZJBVGNqaS5gA7MxQUx2-5embGX9jMKs_gQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/3] cargo: Move CARGO_MANIFEST_PATH/CARGO_SRC_DIR
 to cargo_common
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 08:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192014

On Thu, Dec 7, 2023 at 10:40=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-12-07 at 13:39 +0000, Alex Kiernan wrote:
> > cargo_common_do_configure uses CARGO_MANIFEST_PATH (which depends on
> > CARGO_SRC_DIR), but their definition was in cargo.bbclass.
> >
> > Match the other variables here and change to default values, rather
> > than weak defaults.
>
> FWIW "single value" class variables tend to work much better as ??=3D
> (which I'd call default value) since than it doesn't matter if the
> recipe setting comes before or after the inherit and the inherit
> position in the recipe doesn't matter.
>

Ah, I guess that makes sense - for "single value" :append/:remove
aren't really useful, so leaving the actual assignment as late as
possible works?

TBH I've never really been very clear what the "right" thing to use is
between ?=3D and ??=3D

> I'd call ?=3D a weak assignment or weak default.
>
> Thanks for working on cleaning some of these things up. I got so far
> with it originally and then ran out of time (and too frustrated with
> the long build/test cycles!).
>

I'll go back and do the opposite cleanup and send a v2.

> Cheers,
>
> Richard
>
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/classes-recipe/cargo.bbclass        | 7 -------
> >  meta/classes-recipe/cargo_common.bbclass | 7 +++++++
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/ca=
rgo.bbclass
> > index 96a74e2ef1ec..0829a58dd90f 100644
> > --- a/meta/classes-recipe/cargo.bbclass
> > +++ b/meta/classes-recipe/cargo.bbclass
> > @@ -30,13 +30,6 @@ B =3D "${WORKDIR}/build"
> >  # where the issue occured
> >  export RUST_BACKTRACE =3D "1"
> >
> > -# The directory of the Cargo.toml relative to the root directory, per =
default
> > -# assume there's a Cargo.toml directly in the root directory
> > -CARGO_SRC_DIR ??=3D ""
> > -
> > -# The actual path to the Cargo.toml
> > -CARGO_MANIFEST_PATH ??=3D "${S}/${CARGO_SRC_DIR}/Cargo.toml"
> > -
> >  RUSTFLAGS ??=3D ""
> >  BUILD_MODE =3D "${@['--release', ''][d.getVar('DEBUG_BUILD') =3D=3D '1=
']}"
> >  # --frozen flag will prevent network access (which is required since o=
nly
> > diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-re=
cipe/cargo_common.bbclass
> > index bf298e96c745..c330c122a9d3 100644
> > --- a/meta/classes-recipe/cargo_common.bbclass
> > +++ b/meta/classes-recipe/cargo_common.bbclass
> > @@ -33,6 +33,13 @@ CARGO_DISABLE_BITBAKE_VENDORING ?=3D "0"
> >  # Used by libstd-rs to point to the vendor dir included in rustc src
> >  CARGO_VENDORING_DIRECTORY ?=3D "${CARGO_HOME}/bitbake"
> >
> > +# The directory of the Cargo.toml relative to the root directory, per =
default
> > +# assume there's a Cargo.toml directly in the root directory
> > +CARGO_SRC_DIR ?=3D ""
> > +
> > +# The actual path to the Cargo.toml
> > +CARGO_MANIFEST_PATH ?=3D "${S}/${CARGO_SRC_DIR}/Cargo.toml"
> > +
> >  CARGO_RUST_TARGET_CCLD ?=3D "${RUST_TARGET_CCLD}"
> >  cargo_common_do_configure () {
> >       mkdir -p ${CARGO_HOME}/bitbake
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191955): https://lists.openembedded.org/g/openembed=
ded-core/message/191955
> > Mute This Topic: https://lists.openembedded.org/mt/103034028/1686473
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
richard.purdie@linuxfoundation.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Alex Kiernan

