Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A36C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 11:44:13 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.6538.1702295042788038897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 03:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BfVDRc/v;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c9f62fca3bso55315921fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 03:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702295041; x=1702899841; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwPAwH0e2YtbcGO09nVVXanyJ+t6Qgp4mkmHn5PUcIk=;
        b=BfVDRc/vVyDPET73B8XGYFeKpzosLk6PLbzr7gpDjeZxj4PbbzNXBZ9CWhhFgdOZPg
         ngInfRLHSbuxQYJ6Kp7l84SE0D3Vge+iK4Pnk3jyGpSKPHxqcEDyEc4Kdw0opaGx42y1
         RuEQs6e9qNPPg1R3fhJNsAtx4+FSD1N0ZY4Jv+N2hdQP9VKkAYZzve2yv8T1qIR6wT4w
         woYrDAKd5A/Wxshtcw52IwrLabKGtYRixxb/2d+AeOVtfHDQHDJCbUPdqWkscHZzRRiU
         E4M3QnRDCxfnLEulaF5WBl3uiKQX/9SbGgVomVEACy4NPO/0D88NtPWI0L3bLWZ4tQHM
         wpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702295041; x=1702899841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwPAwH0e2YtbcGO09nVVXanyJ+t6Qgp4mkmHn5PUcIk=;
        b=CUQSDOGeFt4MlB672vvY21LFAOg4BMEeCHYJSbk1olvxDbNMuoSNDp3vpweD0sgcEf
         tR8LivOSMYti8Dkrq/qtJra9Wz0y+T+Rs5bPk2iB6FM3b3btiUkpQ5E94XJykO5VK+J1
         Q6iA+LHn3elpNpD9nqte401LlI1bIriIoC8Mt3CR0Igdu9OO9CIyZAsNJ+1iGJctsS+x
         5wmUkJiiCjh7/ab3S8DQOB+mxpC2U93xZCZUXI9ANylDtTzYzjoBaTFehNM/aS0KXA8a
         qpHvw3bbnt9F3Hb644PYPxhY6PNsnFwE/uPhVycacc75+Xz6CN2PYaFNr1JOdcAse0Z4
         yZpw==
X-Gm-Message-State: AOJu0YyYKby2tN6MfCRQVVyNe5dYc+dawzS330l/C79RL3dR2TEx5iSX
	UyvOILjdcl9U4+DmSTp3ema8tS3U2r59Zai0Sgw=
X-Google-Smtp-Source: AGHT+IF43qGM6is1pRjB2hUoZuE0T54parpdaFz3JCVuwsQGivbgWthsMYUqY30qRdQ4JEmJ04ZNVZRwETYuhLtyMQ4=
X-Received: by 2002:a2e:a793:0:b0:2cb:2846:26e4 with SMTP id
 c19-20020a2ea793000000b002cb284626e4mr2199765ljf.0.1702295040680; Mon, 11 Dec
 2023 03:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20231208140349.3576-1-alex.kiernan@gmail.com> <20231208140349.3576-3-alex.kiernan@gmail.com>
 <a394853b1f2302baab431afe6fd0a1880b8238bd.camel@linuxfoundation.org>
 <CAO5Uq5RaQYvgye7a=qtwO2abDRP6WvggbKvjLpWuepJ1Rr3Z4A@mail.gmail.com>
 <CA+cAkerS0D8ai-PhV=tiL=6kbbwbaSV2YTKS0oSrTksNpmDNqA@mail.gmail.com>
 <CAO5Uq5S4S=e-zGNLbEscxjroX488=gM4nkT9RMAxdXxJ+uKU-A@mail.gmail.com> <CA+cAkeoxd1eu8KzNbycBFwYYjuR-w8Wx+y+bSNc1u5qmhHFWSg@mail.gmail.com>
In-Reply-To: <CA+cAkeoxd1eu8KzNbycBFwYYjuR-w8Wx+y+bSNc1u5qmhHFWSg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 11 Dec 2023 11:43:48 +0000
Message-ID: <CAO5Uq5TLJuuEEKHx4PX395yB6=XpoYQ+FE_AWic3a+QS0YixRA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 3/7] rust: Upgrade 1.71.0 -> 1.71.1
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 11:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192163

On Mon, Dec 11, 2023 at 10:01=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
>
>
> On Mon, 11 Dec 2023 at 10:17, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
>>
>> On Mon, Dec 11, 2023 at 7:15=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
>> <frederic.martinsons@gmail.com> wrote:
>> >
>> >
>> >
>> > On Sun, 10 Dec 2023 at 21:28, Alex Kiernan <alex.kiernan@gmail.com> wr=
ote:
>> >>
>> >> On Sun, Dec 10, 2023 at 7:39=E2=80=AFPM Richard Purdie
>> >> <richard.purdie@linuxfoundation.org> wrote:
>> >> >
>> >> > On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrote:
>> >> > > https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html
>> >> > >
>> >> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> >> > > ---
>> >> > >
>> >> > >  meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.1.bb=
} | 0
>> >> > >  .../rust/{libstd-rs_1.71.0.bb =3D> libstd-rs_1.71.1.bb}         =
  | 0
>> >> > >  ...t-cross-canadian_1.71.0.bb =3D> rust-cross-canadian_1.71.1.bb=
} | 0
>> >> > >  .../rust/{rust-llvm_1.71.0.bb =3D> rust-llvm_1.71.1.bb}         =
  | 0
>> >> > >  meta/recipes-devtools/rust/rust-source.inc                      =
| 2 +-
>> >> > >  meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.bb} =
  | 0
>> >> > >  6 files changed, 1 insertion(+), 1 deletion(-)
>> >> > >  rename meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.=
71.1.bb} (100%)
>> >> > >  rename meta/recipes-devtools/rust/{libstd-rs_1.71.0.bb =3D> libs=
td-rs_1.71.1.bb} (100%)
>> >> > >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.0.bb=
 =3D> rust-cross-canadian_1.71.1.bb} (100%)
>> >> > >  rename meta/recipes-devtools/rust/{rust-llvm_1.71.0.bb =3D> rust=
-llvm_1.71.1.bb} (100%)
>> >> > >  rename meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71=
.1.bb} (100%)
>> >> > >
>> >> > > diff --git a/meta/recipes-devtools/rust/cargo_1.71.0.bb b/meta/re=
cipes-devtools/rust/cargo_1.71.1.bb
>> >> > > similarity index 100%
>> >> > > rename from meta/recipes-devtools/rust/cargo_1.71.0.bb
>> >> > > rename to meta/recipes-devtools/rust/cargo_1.71.1.bb
>> >> > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb b/met=
a/recipes-devtools/rust/libstd-rs_1.71.1.bb
>> >> > > similarity index 100%
>> >> > > rename from meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
>> >> > > rename to meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
>> >> > > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.71.=
0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
>> >> > > similarity index 100%
>> >> > > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.71.0=
.bb
>> >> > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.b=
b
>> >> > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.71.0.bb b/met=
a/recipes-devtools/rust/rust-llvm_1.71.1.bb
>> >> > > similarity index 100%
>> >> > > rename from meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
>> >> > > rename to meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
>> >> > > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/re=
cipes-devtools/rust/rust-source.inc
>> >> > > index 3a192e42db7d..0729db6f0b45 100644
>> >> > > --- a/meta/recipes-devtools/rust/rust-source.inc
>> >> > > +++ b/meta/recipes-devtools/rust/rust-source.inc
>> >> > > @@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/r=
ustc-${RUST_VERSION}-src.tar.xz;n
>> >> > >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
>> >> > >              file://0001-musl-Define-SOCK_SEQPACKET-in-common-pla=
ce.patch;patchdir=3D${RUSTSRC} \
>> >> > >  "
>> >> > > -SRC_URI[rust.sha256sum] =3D "5814699031aafdcc2e2f71fc9b389678cd7=
042350d1583da061463d8e88681c7"
>> >> > > +SRC_URI[rust.sha256sum] =3D "371af0fbe04051e20a74dbea6d4e4e548f1=
0f15309c49cae2688afb882b6c7f1"
>> >> > >
>> >> > >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
>> >> > >
>> >> > > diff --git a/meta/recipes-devtools/rust/rust_1.71.0.bb b/meta/rec=
ipes-devtools/rust/rust_1.71.1.bb
>> >> > > similarity index 100%
>> >> > > rename from meta/recipes-devtools/rust/rust_1.71.0.bb
>> >> > > rename to meta/recipes-devtools/rust/rust_1.71.1.bb
>> >> >
>> >> > I ran some testing and it looks like we could merge up to 1.71.1
>> >> > without autobuilder failures in this series. Beyond that we have th=
e
>> >> > reproducibility and zvariant issues.
>> >> >
>> >>
>> >> Thanks.
>> >>
>> >> Was the failure at that point reproducibility or the zvariant trait
>> >> failure? I just posted an update for zvariant which doesn't see the
>> >> trait recursion failure, but at the same time it no longer exercises
>> >> crates pulled from git which looked like it was the main purpose it
>> >> was fulfilling for testing.
>> >>
>> > I didn't follow issues about this upgrade, but yes, the zvariant recip=
e
>> > was a demonstration on how to handle crates dependencies that come fro=
m git.
>> > (there is a specific crate fetcher url parameter: 'git-dependency')
>> >
>>
>> 3.12 (which was what we had) exploded with unbounded recursion inside
>> a trait on later compilers, upgrading to 3.15 fixes it, but they've
>> dropped the git dependency crate and just used upstream crates:
>>
>> commit 9e34dd510bf1a50f5168d5164578ebe8958928e3
>> Author: Zeeshan Ali Khan <zeeshanak@gnome.org>
>> Date:   Wed May 10 20:45:26 2023 +0200
>>
>>     zv: Swtich glib from git to latest released version
>>
>>     We don't need the git version and cargo caching action doesn't help =
with
>>     cloning of git repos so the build takes longer in the CI than it nee=
ds
>>     to.
>>
>> > If, for some reason, this is no more possible, the whole recipe can be=
 removed
>> > (unless there is a direct dependency to zvariant in some  other recipe=
s)
>> >
>>
>> Sounds like just deleting it might be the thing to do. I did go on a
>> search for something else which had git dependency crates and didn't
>> find anything (and I suspect even if we did, we might well be back
>> here in 6 months if upstream churn deletes it). Maybe we just need
>> something synthetic which is used here?
>
>
>  I can come up with a simple recipe which will have sources locally
> and a dependencies to some of crates fetched by git if you think
> it would be useful.
>
> I have lot of these kind (git crate dependency) because we have internall=
y a lot of unpublished (private)
> crates in our git repo.
>

Just discovered we have one in meta-oe - thin-provisioning-tools uses
a git dep. Though for test purposes in oe-core, I think I'd still lean
towards something synthetic which we know won't move.

--=20
Alex Kiernan

