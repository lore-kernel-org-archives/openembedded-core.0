Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A5BC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 08:23:21 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.15912.1702023795469363464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 00:23:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XKz4RPN1;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cb20c82a79so6296831fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 00:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702023793; x=1702628593; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lK0ZTC1jsh1tvvfuhPQP9vmz5blnZIx3sLx0Ou5ZiE=;
        b=XKz4RPN1sZsOMZLaOMsaxFhgK+tpP73bjR5ofoZFJeq4wNrWoxEgKIKguCEBxAAzGp
         LUsosk0WoUVHiCoI6OzO0LuplpnzwQvsk74txt03fwWMJ2di/YgNAIzm4JZP/uvyoLiS
         ZSn0ciCHy3NiJGArCPAW9kxwZ9IPhpYBywkjBsRoWXK6i+C2B/TZY+VWOelVUh8lFxso
         uUHjwZUHMHbC0ycWmVlIOC2xTDzAFJ839LdAae0oX1zg4w6db+PeWxncnCsvw5M1qiAX
         AbAro3ZMCWMgwPXrCOfvp/++gne+qtKDJtAa0lTwmu/iHNFzBbc2AcT7RgsdP591UDJP
         oXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702023793; x=1702628593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lK0ZTC1jsh1tvvfuhPQP9vmz5blnZIx3sLx0Ou5ZiE=;
        b=KICmRrOhhecgbcU+cKwuzAOiZkK1gv8una4686Ku+CwSQhMqPEDoRdAbzUwlGenQIR
         s/pEp71hT/ORvy1Nm9LZxkTu9CoAaQj4m6je5Yx2HeQl/y3tdIGHqv/EYUifeQjj/Jil
         t7/WEP+9D+6g91DLEhqSsri8r3CwuYVOcvC8wyRe+dP1OqWwpn+bGr7M48DNtM1YvRQu
         f5WxDUg346eOzL/cf1TikWxJiHKlcjZOKepXBWu8pQpMi2RCIjAIVeyCNes1yN39Sg8E
         JNPCjKFnK0JTAfvqJj+g6xKaYcwKlrO5d107AzfXL+KHNZZ+xQ6laln5z+YOjB/cQoVx
         YG/A==
X-Gm-Message-State: AOJu0Yz6eQ4aRWRlC5godwED8gygAV7LwERJZeJizzFM/U/MdqVDBR7b
	r9jr26TWcn5Fe5c87JNEya6s9Fc8kOjwpBDUIjywbTFe
X-Google-Smtp-Source: AGHT+IF5o+wvZ0as0H0hW/nkRdH2IQ8wDoqPx4zCI6bba7YmpHZA2etcsrCntzK+2L2wdl1IVZu5N3Js3gA7oapsFRo=
X-Received: by 2002:a2e:9b10:0:b0:2c9:f656:c4bd with SMTP id
 u16-20020a2e9b10000000b002c9f656c4bdmr2120636lji.78.1702023793203; Fri, 08
 Dec 2023 00:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20231207133913.443-1-alex.kiernan@gmail.com> <20231207133913.443-2-alex.kiernan@gmail.com>
 <58a265ee08706c7d5e0b9c5678dfbe44b63c96cb.camel@linuxfoundation.org> <179ECD325A85AE45.16398@lists.openembedded.org>
In-Reply-To: <179ECD325A85AE45.16398@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 8 Dec 2023 08:23:01 +0000
Message-ID: <CAO5Uq5Tc0Xqg9_+cefwk66hhBBXOPaLtkNFk0EEOiW2+y=ihPg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/3] cargo: Move CARGO_MANIFEST_PATH/CARGO_SRC_DIR
 to cargo_common
To: alex.kiernan@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 08:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192016

On Fri, Dec 8, 2023 at 8:15=E2=80=AFAM Alex Kiernan via lists.openembedded.=
org
<alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Thu, Dec 7, 2023 at 10:40=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2023-12-07 at 13:39 +0000, Alex Kiernan wrote:
> > > cargo_common_do_configure uses CARGO_MANIFEST_PATH (which depends on
> > > CARGO_SRC_DIR), but their definition was in cargo.bbclass.
> > >
> > > Match the other variables here and change to default values, rather
> > > than weak defaults.
> >
> > FWIW "single value" class variables tend to work much better as ??=3D
> > (which I'd call default value) since than it doesn't matter if the
> > recipe setting comes before or after the inherit and the inherit
> > position in the recipe doesn't matter.
> >
>
> Ah, I guess that makes sense - for "single value" :append/:remove
> aren't really useful, so leaving the actual assignment as late as
> possible works?
>

And I've just read the bitbake docs and I clearly still don't really
understand... its +=3D / -=3D rather than append/remove which are the
things which are important here.

> TBH I've never really been very clear what the "right" thing to use is
> between ?=3D and ??=3D
>
> > I'd call ?=3D a weak assignment or weak default.
> >
> > Thanks for working on cleaning some of these things up. I got so far
> > with it originally and then ran out of time (and too frustrated with
> > the long build/test cycles!).
> >
>
> I'll go back and do the opposite cleanup and send a v2.
>
> > Cheers,
> >
> > Richard
> >
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >
> > >  meta/classes-recipe/cargo.bbclass        | 7 -------
> > >  meta/classes-recipe/cargo_common.bbclass | 7 +++++++
> > >  2 files changed, 7 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/=
cargo.bbclass
> > > index 96a74e2ef1ec..0829a58dd90f 100644
> > > --- a/meta/classes-recipe/cargo.bbclass
> > > +++ b/meta/classes-recipe/cargo.bbclass
> > > @@ -30,13 +30,6 @@ B =3D "${WORKDIR}/build"
> > >  # where the issue occured
> > >  export RUST_BACKTRACE =3D "1"
> > >
> > > -# The directory of the Cargo.toml relative to the root directory, pe=
r default
> > > -# assume there's a Cargo.toml directly in the root directory
> > > -CARGO_SRC_DIR ??=3D ""
> > > -
> > > -# The actual path to the Cargo.toml
> > > -CARGO_MANIFEST_PATH ??=3D "${S}/${CARGO_SRC_DIR}/Cargo.toml"
> > > -
> > >  RUSTFLAGS ??=3D ""
> > >  BUILD_MODE =3D "${@['--release', ''][d.getVar('DEBUG_BUILD') =3D=3D =
'1']}"
> > >  # --frozen flag will prevent network access (which is required since=
 only
> > > diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-=
recipe/cargo_common.bbclass
> > > index bf298e96c745..c330c122a9d3 100644
> > > --- a/meta/classes-recipe/cargo_common.bbclass
> > > +++ b/meta/classes-recipe/cargo_common.bbclass
> > > @@ -33,6 +33,13 @@ CARGO_DISABLE_BITBAKE_VENDORING ?=3D "0"
> > >  # Used by libstd-rs to point to the vendor dir included in rustc src
> > >  CARGO_VENDORING_DIRECTORY ?=3D "${CARGO_HOME}/bitbake"
> > >
> > > +# The directory of the Cargo.toml relative to the root directory, pe=
r default
> > > +# assume there's a Cargo.toml directly in the root directory
> > > +CARGO_SRC_DIR ?=3D ""
> > > +
> > > +# The actual path to the Cargo.toml
> > > +CARGO_MANIFEST_PATH ?=3D "${S}/${CARGO_SRC_DIR}/Cargo.toml"
> > > +
> > >  CARGO_RUST_TARGET_CCLD ?=3D "${RUST_TARGET_CCLD}"
> > >  cargo_common_do_configure () {
> > >       mkdir -p ${CARGO_HOME}/bitbake
> > >
> > >
> >
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192014): https://lists.openembedded.org/g/openembedde=
d-core/message/192014
> Mute This Topic: https://lists.openembedded.org/mt/103034028/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

