Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309F9CEACC8
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 14:08:50 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.82740.1727791720947165479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 07:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gtg5jsmI;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e26290a13d5so1484552276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 07:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791720; x=1728396520; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKDet0mby0SxiSiKgWcM1top3lYLNZmMewR/3GkkQ68=;
        b=Gtg5jsmI7q+iOqhrbHeKd1YK395wAJQjBrnQMkbRCZE9EKMO091LySttwsS7RbbDrd
         SVYN4ZADLZ+gFT3whNpp7zd9Wd5oU8/tIvJZt40ZcJft6zKlle7oTbGfzmg8M6hKQBop
         IBZKnRVAEY290vUFHC4hzUmiAfeS/DpSNeBLox+JEkIWy1NCj1foplZlRrdqelpBwdru
         zkmgHh4UtuK3iHNS9M3pkQydqM2v1ziw+OcRcAfmziCM1aFna+uPhB/4yyowv4HcTi0K
         1ItuU2WeXDjfvpnjR6IAwkg/pJq83tiXuQTC/fcJCqOgyYwL3M6zGw7hcTwu2rzpQDgk
         kmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791720; x=1728396520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKDet0mby0SxiSiKgWcM1top3lYLNZmMewR/3GkkQ68=;
        b=JrxdkZXRCOBUrZNbJV50QJY3DD3NZa6SKePcCIKfZSUe0LcTfkjtjxYewMFAlRrrnA
         phK2Q2h8Otrp4oBpvdzXnXoo5HjjfFeUx9qSe9yP0ojEKibz+hk7JPx9rjTMpVGda0bq
         kbk1YVN1+JIcc6QAWvKkD5cusp42fsJGy17ZgI3p5nBSDPAzJRKefOoO2ROs3MpgTtpJ
         8DZMihlYML2Uenmw+ZRME0UlsUMxSrJsg/FnpB6Z7pnT8/TP/KnKnvLfTVD2kWcpY9lx
         DIL5mntfWttwMySq6h9GsppGL36EcnJCP1f8JNEVBJpDzvr6n8X/FPXH9r0VXu65WkcZ
         VoxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAhh/kgBCQUp2dhpJQxIIwXIlHaLbR/yDG6hsoNqf5KZp5hvIvTxQxUm6wgYyCk2RoguZLWl+jFlN9lplQf3bz3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yylus0Ij9Za3l1l/wcTL6pTfx6dzpOTT2dy4QKW5JY713Lxk+of
	tg9CeL2cnb+c1BOhdfya/SxI5fpJU0v1mGG4c7d8Mn+/qk+PeI4/o7JTG/jLHRi6QH2TmbDzNVG
	+JBrGdvYaJ8l0W1RjFvz4ujQ1nbw=
X-Google-Smtp-Source: AGHT+IHes/OUKZ/X6Ad4eib6R9cV60lQt3sUU23gQfAk76sWF+mUG7i2YkuL+O+ym9VKOVLkfioqGRGcMTvqm0PLnok=
X-Received: by 2002:a05:690c:281:b0:6dd:bcce:7cd7 with SMTP id
 00721157ae682-6e247610cfcmr120456957b3.42.1727791719737; Tue, 01 Oct 2024
 07:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
 <e1eea6c3ea87aebfdaabf5a987a7290d7e9a4485.1723399246.git.bruce.ashfield@gmail.com>
 <4a44e457-b17b-41c6-8e10-18d9fbea4a88@cherry.de> <CADkTA4NqO5uGBJu7Oe79vurUss8cPBUW7wqVF+wRcj25WEf4vQ@mail.gmail.com>
 <bd0c9228-ac33-4334-ba40-5d739951b14d@cherry.de> <CADkTA4Mk8wCpLGTEeYZXOp2OFEM2FObwU28bKK3gN=huD_6a+w@mail.gmail.com>
 <7422f5a8-b872-4f89-ba10-1bdc642993c2@cherry.de> <CADkTA4O=fOj3QCzV6VzcSxBg49g8b5nVu=DY6zcbT1Z689EwPg@mail.gmail.com>
 <6a946e21-1e4d-43ee-909e-5ae51d1f90d5@cherry.de>
In-Reply-To: <6a946e21-1e4d-43ee-909e-5ae51d1f90d5@cherry.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 Oct 2024 10:08:27 -0400
Message-ID: <CADkTA4PELVd9GnegoW-10BLH3waagWp-etejQ6gM8j9Lx6wVVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] linux-yocto-dev: bump to v6.11
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 14:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205170

On Mon, Sep 30, 2024 at 6:09=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Bruce,
>
> On 9/25/24 4:23 PM, Bruce Ashfield wrote:
> > On Wed, Sep 25, 2024 at 10:07=E2=80=AFAM Quentin Schulz <quentin.schulz=
@cherry.de>
> > wrote:
> >
> >> Hi Bruce,
> >>
> >> On 9/25/24 3:57 PM, Bruce Ashfield wrote:
> >>> On Wed, Sep 25, 2024 at 9:37=E2=80=AFAM Quentin Schulz <quentin.schul=
z@cherry.de
> >>>
> >>> wrote:
> >>>
> >>>> Hi Bruce,
> >>>>
> >>>> On 9/24/24 4:11 PM, Bruce Ashfield wrote:
> >>>>> On Tue, Sep 24, 2024 at 9:02=E2=80=AFAM Quentin Schulz <
> >> quentin.schulz@cherry.de
> >>>>>
> >>>>> wrote:
> >>>>>
> >>>>>> Hi Bruce,
> >>>>>>
> >>>>>> On 8/11/24 8:04 PM, Bruce Ashfield via lists.openembedded.org wrot=
e:
> >>>>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>>>>
> >>>>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>>>> ---
> >>>>>>>      meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
> >>>>>>>      1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>>>>> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>>>>>> index 0097fec7b2..292897ce43 100644
> >>>>>>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>>>>>> @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
> >>>>>>>      # provide this .inc to set specific revisions
> >>>>>>>      include recipes-kernel/linux/linux-yocto-dev-revisions.inc
> >>>>>>>
> >>>>>>> -KBRANCH =3D "v6.10/standard/base"
> >>>>>>> +KBRANCH =3D "v6.11/standard/base"
> >>>>>>>      KMETA =3D "kernel-meta"
> >>>>>>>
> >>>>>>>      SRC_URI =3D "git://
> >>>>>>
> >>>>
> >> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name=3Dma=
chine;protocol=3Dhttps
> >> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%=
7D;name=3Dmachine;protocol=3Dhttps>
> >>>> <
> >> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7=
D;name=3Dmachine;protocol=3Dhttps
> >>>
> >>>>>> <
> >>>>
> >> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7=
D;name=3Dmachine;protocol=3Dhttps
> >>>>>
> >>>>>> \
> >>>>>>> @@ -28,7 +28,7 @@ SRC_URI =3D "git://
> >>>>>> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name
> >> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%=
7D;name>
> >>>> <
> >> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7=
D;name
> >>>
> >>>>>> <
> >>>>
> >> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7=
D;name
> >>>>>
> >>>>>>>      SRCREV_machine ?=3D
> >>>>>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
> >>>>>> "linux-yocto-dev", "${AUTOREV}",
> >>>>>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >>>>>>>      SRCREV_meta ?=3D
> >>>>>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
> >>>>>> "linux-yocto-dev", "${AUTOREV}",
> >>>>>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >>>>>>>
> >>>>>>> -LINUX_VERSION ?=3D "6.10"
> >>>>>>> +LINUX_VERSION ?=3D "6.11"
> >>>>>>>      LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}=
"
> >>>>>>>      PV =3D "${LINUX_VERSION}+git"
> >>>>>>>
> >>>>>>
> >>>>>> I haven't tried to compile linux-yocto-dev but I have my own v6.11=
-rc6
> >>>>>> based kernel recipe.
> >>>>>>
> >>>>>> It failed to build on Scarthgap because I was missing coreutils-na=
tive
> >>>>>> (specifically truncate binary) because CONFIG_KALLSYMS was enabled=
.
> >> This
> >>>>>> comes from
> >>>>>>
> >>>>>>
> >>>>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95
> >>>>>>
> >>>>>> It seems there are some config fragments in linux-yocto-cache
> >>>>>> (ktypes/base/base.cfg) with it, so maybe we want to always add the
> >>>>>> dependency (or is there a way to add a build time dependency from =
an
> >>>>>> .scc file?).
> >>>>>>
> >>>>>
> >>>>>
> >>>>> Interesting!
> >>>>>
> >>>>> I build linux-yocto-dev nightly, so I can confidently say that this
> >> isn't
> >>>>> being seen with the reference recipe.
> >>>>>
> >>>>> I also do have KALLSYMS in the default .config, so I've worked thro=
ugh
> >>>> the
> >>>>> same new commit and enabling option.
> >>>>>
> >>>>> I get truncate in my kernel builds via hosttools, so the dependency
> >>>>> wasn't/isn't needed.
> >>>>>
> >>>>
> >>>> truncate isn't in HOSTTOOLS in any release yet, just master.
> >>>>
> >>>> c.f.
> >>>>
> >>>>
> >> https://git.openembedded.org/openembedded-core/commit/?id=3D522000ce5c=
4f0201cbe42d7826b6a8489ed10117
> >>>>
> >>>> This means people won't be able to build 6.11 and later with
> >>>> CONFIG_KALLSYMS enabled in Scarthgap and earlier releases...
> >>>>
> >>>> ... unless we backport this patch to still supported releases?
> >>>>
> >>>> BTW, I could reproduce on Scarthgap by checking out poky in its
> >>>> scarthgap branch, then running `git checkout origin/master --
> >>>> meta/recipes-kernel/linux/linux-yocto-dev.bb`, then adding
> >>>> `PREFERRED_PROVIDER_virtual/kernel=3D"linux-yocto-dev"` to conf/loca=
l.conf
> >>>> and then running `MACHINE=3Dqemuarm64 bitbake linux-yocto-dev` from =
either
> >>>> a kas-container (4.3.2) or Debian Bullseye.
> >>>>
> >>>
> >>> Right. I only target linux-yocto-dev at the latest master where we do=
 all
> >>> our testing. The support matrix of ever newer kernels against the old=
er
> >>> releases can get complicated, but we can at least say a given release
> >>> supports the reference kernels + the reference -dev kernel version.
> >>>
> >>> Anything more we do on a case by case basis.
> >>>
> >>
> >> Oh for sure! I wasn't implying we aren't testing appropriately or that
> >> we need to increase the number of kernels to support per release. Just
> >> that **some** people (likely me.... :) ) may want to support 6.12 on
> >> Scarthgap whenever it's out and that will be an issue. The answer to
> >> that issue could very well be "upstream isn't interested in supporting
> >> this for already-released versions, just handle this in your layer".
> >>
> >> I assume one could simply add HOSTTOOLS +=3D "truncate" in the kernel
> >> recipe and be done with it? I would be worried to add it globally as i=
t
> >> could then break/change other stuff since the host's tool would be use=
d
> >> instead of the one in recipe-sysroot-native (is that even true?)?
> >>
> >
> > That would mess with the configuration space from a recipe, and won't
> > work. It's already gone into use long before the kernel starts to be
> > parsed and built.
> >
> >
> >>
> >>> I'd go with that simple host tool addition, rather than adding
> >>> coreutils-native
> >>> as a dependency.
> >>>
> >>> I have a patch locally that can test hosttools and if truncate is mis=
sing
> >>> conditionally add the dependency. That balances the speed vs supporti=
ng
> >>> non-default host configuration.
> >>>
> >>
> >> I'm not planning on using linux-yocto for our products so was hoping f=
or
> >> a generic solution maybe? If there's one :)
> >>
> >
> > I really push back on polluting kernel.bbclass with any version specifi=
c
> > dependencies and changes. It is best handled in the versioned recipes
> > until it is no longer version specific.
> >
> >
> >>
> >> I guess adding truncate to HOSTTOOLS in conf/bitbake.conf in an
> >> already-released version is just not something we want?
> >>
> >>
> > I personally have no issue with it, the tool is tiny and I'd be shocked=
 if
> > it wasn't on all the supported hosts for the release(s) in question.
> >
> > It is far preferable to doing kernel version specific tests and depende=
ncies
> > and/or adding coreutils-native unconditionally.
> >
> >
> >
> >> Just looking for guidance so I know which direction to go in 3/4 month=
s
> >> from now when I'll be supporting 6.12 :)
> >>
> >
> > I'd append to HOSTTOOLS in your layer ! Or just copy into your
> > kernel recipe what I'm about to add to linux-yocto-dev :)
> >
>
> Did you send something already? I think I missed it if you did?
>
> Will send the backport patches as an RFC for scarthgap in any case but
> I'm still interested to see what you came up with :)

I didn't send anything yet, as my test and add coreutils-native as a DEPEND=
S,
seemed less ideal than just adding the hosttool to older releases.
Since anything
newer will have that hosttool passthrough. There's a number of other tools =
that
could get the same treatment (i.e. don't assume they are in hosttools and b=
uild
a -native in that case).

That being said, I can definitely send it, and will do so once I'm through =
some
other test cycles.

Bruce

>
> Cheers,
> Quentin



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

