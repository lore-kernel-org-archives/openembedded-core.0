Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B0DC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:18:02 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.4493.1702286271444435203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 01:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jgirc4TS;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c9bd3ec4f6so51318221fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 01:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702286269; x=1702891069; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTujFADx0tieT2dmz1jmUFfFHa76Nh6OCsKp+++wRZs=;
        b=Jgirc4TSpm6COBYoeMiYTjZgkhPSxBZhoKJiwEIyOja0IqtFBLGuPEcPY4DErM9hN6
         HVPwktT6cC4CNkMlHpJEZ6qdtWJfBtS7JEpXyijLdtCc0pCL+OqM3sc4B/Ou2rm3SOhO
         RL+5XjrNlU9ncVcuBl/LCK8lPZjC1xtdnog8aqBF85sQ1/QuStODTJ8zFoLx00RHKgG/
         YcXmyAZblHkTuY7RoF9t4dZxDji4kiypQeSBgPqX644JfnVFSvgk4VGOqAJiuUTn/2nA
         YmTScWuoowGafWKciVu9xB2dvK0QbUtqCrn4FozLzmfZSY/C8VINQp/TyI0+dQ2lCTjT
         4u/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286269; x=1702891069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTujFADx0tieT2dmz1jmUFfFHa76Nh6OCsKp+++wRZs=;
        b=Fgg3BlmmvPPJnamnOQCZ8HgiSd4+RqauUojWie3MMqsGhEfELkmCiORyeyjQg9qwv2
         BR0NqccndJTgoj5FsDIaQ05qDVjsuSA98sXCpVlw5ysIUzbbC3nD8Jxh7tL4y8dZlPCt
         oC0n7owUAJ/MvPrdrCz/uE+lFwgvDARRZHkVlu7ogPEPWHY93eIBOjkvJ9iSP2FCOOzm
         rbbVvC0B4ypy8VHicuWhRllJ+9ppsYDnj1+Wa5P9CtcNOf1EiB/Hq7Q5OSDCNFbkTXln
         OnmIKMJ55I3GGcprTcJtUNWe6zdj4ZZ3qKhVP6UfLp5hATCmlH6wOZbQHeKGpaeizOCx
         0itw==
X-Gm-Message-State: AOJu0YzbQs+fM/7SXd58Or4p2E6Rbai/bXhTUEPFX9MD0LBIdjyDNkBz
	GIe5/2AQVD+VF9YPCsmYa154JlS9Mc32t9fv/zU=
X-Google-Smtp-Source: AGHT+IHW57ZitAPmG8Nxv489+t8zy+E9S3TIN/9s54UU8Ow4oKy12wko99HT+yolbGJCdnoY0ZLLHwmk5vWl9KeVWN0=
X-Received: by 2002:a2e:9891:0:b0:2c9:fa22:b611 with SMTP id
 b17-20020a2e9891000000b002c9fa22b611mr956313ljj.68.1702286269274; Mon, 11 Dec
 2023 01:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20231208140349.3576-1-alex.kiernan@gmail.com> <20231208140349.3576-3-alex.kiernan@gmail.com>
 <a394853b1f2302baab431afe6fd0a1880b8238bd.camel@linuxfoundation.org>
 <CAO5Uq5RaQYvgye7a=qtwO2abDRP6WvggbKvjLpWuepJ1Rr3Z4A@mail.gmail.com> <CA+cAkerS0D8ai-PhV=tiL=6kbbwbaSV2YTKS0oSrTksNpmDNqA@mail.gmail.com>
In-Reply-To: <CA+cAkerS0D8ai-PhV=tiL=6kbbwbaSV2YTKS0oSrTksNpmDNqA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 11 Dec 2023 09:17:38 +0000
Message-ID: <CAO5Uq5S4S=e-zGNLbEscxjroX488=gM4nkT9RMAxdXxJ+uKU-A@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 3/7] rust: Upgrade 1.71.0 -> 1.71.1
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 09:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192149

On Mon, Dec 11, 2023 at 7:15=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
>
>
> On Sun, 10 Dec 2023 at 21:28, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
>>
>> On Sun, Dec 10, 2023 at 7:39=E2=80=AFPM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrote:
>> > > https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html
>> > >
>> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> > > ---
>> > >
>> > >  meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.1.bb} |=
 0
>> > >  .../rust/{libstd-rs_1.71.0.bb =3D> libstd-rs_1.71.1.bb}           |=
 0
>> > >  ...t-cross-canadian_1.71.0.bb =3D> rust-cross-canadian_1.71.1.bb} |=
 0
>> > >  .../rust/{rust-llvm_1.71.0.bb =3D> rust-llvm_1.71.1.bb}           |=
 0
>> > >  meta/recipes-devtools/rust/rust-source.inc                      | 2=
 +-
>> > >  meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.bb}   |=
 0
>> > >  6 files changed, 1 insertion(+), 1 deletion(-)
>> > >  rename meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.=
1.bb} (100%)
>> > >  rename meta/recipes-devtools/rust/{libstd-rs_1.71.0.bb =3D> libstd-=
rs_1.71.1.bb} (100%)
>> > >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.0.bb =
=3D> rust-cross-canadian_1.71.1.bb} (100%)
>> > >  rename meta/recipes-devtools/rust/{rust-llvm_1.71.0.bb =3D> rust-ll=
vm_1.71.1.bb} (100%)
>> > >  rename meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.=
bb} (100%)
>> > >
>> > > diff --git a/meta/recipes-devtools/rust/cargo_1.71.0.bb b/meta/recip=
es-devtools/rust/cargo_1.71.1.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/rust/cargo_1.71.0.bb
>> > > rename to meta/recipes-devtools/rust/cargo_1.71.1.bb
>> > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb b/meta/r=
ecipes-devtools/rust/libstd-rs_1.71.1.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
>> > > rename to meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
>> > > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.b=
b b/meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
>> > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
>> > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.71.0.bb b/meta/r=
ecipes-devtools/rust/rust-llvm_1.71.1.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
>> > > rename to meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
>> > > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recip=
es-devtools/rust/rust-source.inc
>> > > index 3a192e42db7d..0729db6f0b45 100644
>> > > --- a/meta/recipes-devtools/rust/rust-source.inc
>> > > +++ b/meta/recipes-devtools/rust/rust-source.inc
>> > > @@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rust=
c-${RUST_VERSION}-src.tar.xz;n
>> > >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
>> > >              file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.=
patch;patchdir=3D${RUSTSRC} \
>> > >  "
>> > > -SRC_URI[rust.sha256sum] =3D "5814699031aafdcc2e2f71fc9b389678cd7042=
350d1583da061463d8e88681c7"
>> > > +SRC_URI[rust.sha256sum] =3D "371af0fbe04051e20a74dbea6d4e4e548f10f1=
5309c49cae2688afb882b6c7f1"
>> > >
>> > >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
>> > >
>> > > diff --git a/meta/recipes-devtools/rust/rust_1.71.0.bb b/meta/recipe=
s-devtools/rust/rust_1.71.1.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/rust/rust_1.71.0.bb
>> > > rename to meta/recipes-devtools/rust/rust_1.71.1.bb
>> >
>> > I ran some testing and it looks like we could merge up to 1.71.1
>> > without autobuilder failures in this series. Beyond that we have the
>> > reproducibility and zvariant issues.
>> >
>>
>> Thanks.
>>
>> Was the failure at that point reproducibility or the zvariant trait
>> failure? I just posted an update for zvariant which doesn't see the
>> trait recursion failure, but at the same time it no longer exercises
>> crates pulled from git which looked like it was the main purpose it
>> was fulfilling for testing.
>>
> I didn't follow issues about this upgrade, but yes, the zvariant recipe
> was a demonstration on how to handle crates dependencies that come from g=
it.
> (there is a specific crate fetcher url parameter: 'git-dependency')
>

3.12 (which was what we had) exploded with unbounded recursion inside
a trait on later compilers, upgrading to 3.15 fixes it, but they've
dropped the git dependency crate and just used upstream crates:

commit 9e34dd510bf1a50f5168d5164578ebe8958928e3
Author: Zeeshan Ali Khan <zeeshanak@gnome.org>
Date:   Wed May 10 20:45:26 2023 +0200

    zv: Swtich glib from git to latest released version

    We don't need the git version and cargo caching action doesn't help wit=
h
    cloning of git repos so the build takes longer in the CI than it needs
    to.

> If, for some reason, this is no more possible, the whole recipe can be re=
moved
> (unless there is a direct dependency to zvariant in some  other recipes)
>

Sounds like just deleting it might be the thing to do. I did go on a
search for something else which had git dependency crates and didn't
find anything (and I suspect even if we did, we might well be back
here in 6 months if upstream churn deletes it). Maybe we just need
something synthetic which is used here?

--=20
Alex Kiernan

