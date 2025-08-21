Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B5BCA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 17:33:25 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.2626.1755797601959858744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 10:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RNTp0iW0;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d6014810fso11703147b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 10:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755797601; x=1756402401; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y2X7zBL35fXFzHUt6CMM/SmO6gy6KqJxGSHJFejjc8=;
        b=RNTp0iW0kD9BKyifF11WKn+q35E75wiG3tLp8KPJKzMRItVgvGT81rwO8cqcqNXfn1
         snGLPd7Ok4opLnMuDS+JbU9sgMgfTysF8/y5K4xXpvgzSbCSnkQafxYC86ECOSRCuHhl
         NFnBsrBpr03Y73975ZkOsyU3PIKpRgL8UHa+SxGFOApuJYfJrheJKu4sc/YbJxoe1rnB
         XshgHxUH4+osEtoQkkhVfz+GYC6ScjgMTmlNvshPzx7R+cGmymQsql8oZdzJHaQBG+bP
         n3n6zcxaVnr65gKURCK45Y73GmOrOfIAd7P6ENgnUHtwifdS1/f3bIL/LMhoe92MA3zi
         3lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755797601; x=1756402401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Y2X7zBL35fXFzHUt6CMM/SmO6gy6KqJxGSHJFejjc8=;
        b=tbhifbLNpaOAnX88zMvAaoPuvVYQaWBJ3rIcR0UM22qGczdup2clDQIx5PCy0CdVG9
         mA5kAhZTyocSjX+6MPg90+RFoWbwjtDcOb93er7GOpTmhV1mh0qT3DeP3Robv7xpRN2x
         eQoyW8HjcnBBY4/idgsabygf9xKzpj3KySTOZCXhdy4/gdb9i98n9W+w+9dJuc0BKRST
         ivMYTKG+4S4Y6Uv4m2nY2o6xexAUvbI9yPZtvLUXaqfntxu1uMJsF9E/gmOXROxzDtTL
         Xen6lSo2Y6/qTja0FbN6BEB0gi5nbmqKlIZ2TD3qWDOblWbMQ7kMVPgOh6p5554WWtZL
         SwUg==
X-Forwarded-Encrypted: i=1; AJvYcCVyzqiH9SuJCJsWLlTTjFdq59dnbew2bMRLezzoTYLQ0um/wtvQ83auI6Ii0s6vaRoqzez72N3a+7d2DP+CP7PKzg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9PNxKJL3PLPq4gSopCNbe7kI21KiG9bbEt+kOcaUByIe6d3g4
	ics0NSxXunsqbqRPNIVhzeDHWGjY2bAJ0zxeI9bjGaPbK5v5NKGva6S1XVCji9XcKcQ8lE4mURo
	aXw5sDcPWd3c71YmoHedfzQ2t3Ogvg76CpINgusJfyg==
X-Gm-Gg: ASbGncu5NIBQTTREdKywoFFfbX6yMZpenCWEBaLC9EDFu8rHJukliGav/FPpx6j4gNW
	O3F+zMM6eRN9xWVZ11ezxOHVcJ7yNaOT1mI+qvrvukIcPndNCNEnO/TN0bCM3n17DpBi9q6uvSQ
	v47FvWHpPAgCbsnAqBrcGSlgjRG+5qJ7WaY9tZb5+ISrXxtU4gbWan3f+TD44x9rG5olVkAxJZ6
	FoQcQb5mBhH+V1n5+pJyIv5pF0U5uMaqtgIdQw=
X-Google-Smtp-Source: AGHT+IEMC4E+jjnp1DlsBjWAmeVG4xTDZ0ueP0Y2mCBqZbJjBf7V3noy+GlozzzIYzBHSwqY2ZwugXiQWKyFF2tK6Ac=
X-Received: by 2002:a05:690c:680c:b0:71e:7e24:41e1 with SMTP id
 00721157ae682-71fdc3db18fmr348167b3.32.1755797600884; Thu, 21 Aug 2025
 10:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250817205033.3845672-1-martin.jansa@gmail.com>
 <8d5f70ac-7a0e-4c1b-b1c3-3949412843c8@cherry.de> <CA+chaQeo_Fa9G-4rNRuihvsnHbGJFZx_8JS7CHV83KY1w9uFBw@mail.gmail.com>
 <905aedea-e2b1-4b07-8f6d-f68863f60f0d@cherry.de> <CA+chaQek-wO5DvPanFJpC+hCgMH2FLn_EeStsgvXDy8LBb4Acg@mail.gmail.com>
 <dd63bc2f1d4d51e76550b2653fef3f35a0adee6b.camel@linuxfoundation.org>
 <CAOSpxdaTNWxO6EuCOJ_yfBmcHKOCQvtTAaJLOb_5ihHi=Xfm4w@mail.gmail.com> <CA+chaQevA88L=vcev8y-ckAqF=RGUKmpgcuCh=eGGKump1sHvg@mail.gmail.com>
In-Reply-To: <CA+chaQevA88L=vcev8y-ckAqF=RGUKmpgcuCh=eGGKump1sHvg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 21 Aug 2025 10:33:10 -0700
X-Gm-Features: Ac12FXyH7-judAVzt3RK4VVmGzwPb2IGGoOIZmJuk8PddSvllFlDmA-RmuuTzHU
Message-ID: <CAOSpxdZBq5dKDgKkjF07ysJFmeQnTJ5XJGwpYwXAPqgKPUzM1Q@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] e2fsprogs: Fix build failure
 with gcc 15
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, openembedded-core@lists.openembedded.org, 
	Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 17:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222277

On Thu, Aug 21, 2025 at 9:37=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> Thanks Richard and Steve!
>
> Crofton reported ncurses-native issue yesterday on #oe, so I've sent
> fix for that as well as cmake-native and git-native which were failing
> after that (then noticed that Rudi already reported these a month ago
> in Fedora 42 https://lists.yoctoproject.org/g/yocto/message/65542  )
>
> Then I've realized that bunch of -native deps weren't rebuilt in my
> builds, due to sstate still being valid after updating docker image
> with new ubuntu-25.10 snapshot having gcc-15, so I did one more
> scarthgap and walnascar build without any sstate to catch them all
> (this time with gentoo with gcc-15 and python-14 to catch all bleeding
> edge cases).
>
> Now I've a bit longer set of fixes to send:
> a3403dabc9 (HEAD -> jansa/scarthgap, l/jansa/scarthgap, l/HEAD)
> yocto-uninative: Update to 4.9 for glibc 2.42
> ee2ff5c8e5 yocto-uninative: Update to 4.8 for GCC 15.1
>
> b3c18663ea pkgconfig: fix build with gcc-15
> 9e6c809248 unifdef: Don't use C23 constexpr keyword
> 390be89335 gdbm: Use C11 standard
> c0f2eff170 gmp: Fix build with older gcc versions
> 10a482993b gmp: Fix build with GCC15/C23
> 1cf6c77ae4 m4: Stick to C17 standard
> 0aaed0c782 unzip: Fix build with GCC-15
> and there will be few more before the build finishes (libtirpc-native
> elfutils-native libgpg-error-native)
>
> 5cbb155559 lib/oe/utils: use multiprocessing from bb
>
> The last one depends on
> bde29045a Use a "fork" multiprocessing context
> for bitbake which would require minimum version bump for scarthgap
> (and similarly for walnascar as well).
>
> The question is, should I send them all in single batch once my local
> builds are finished, or just gcc-15 first and then possibly
> python-14/bitbake-min-version and uninative fixes later? Sorry I
> should have realized that I'll need to manually drop sstate to fully
> test this.

Thanks for doing this!

I don't have a strong preference, so whatever is convenient for you is
fine by me.

Steve

> On Tue, Aug 19, 2025 at 6:53=E2=80=AFPM Steve Sakoman <steve@sakoman.com>=
 wrote:
> >
> > On Tue, Aug 19, 2025 at 9:31=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2025-08-19 at 13:36 +0200, Martin Jansa wrote:
> > > > On Tue, Aug 19, 2025 at 11:57=E2=80=AFAM Quentin Schulz
> > > > <quentin.schulz@cherry.de> wrote:
> > > > >
> > > > > Hi Martin,
> > > > >
> > > > > On 8/19/25 11:24 AM, Martin Jansa wrote:
> > > > > > On Tue, Aug 19, 2025 at 11:21=E2=80=AFAM Quentin Schulz
> > > > > > <quentin.schulz@cherry.de> wrote:
> > > > > > >
> > > > > > > Hi Martin,
> > > > > > >
> > > > > > > Do we actually support any distribution for Scarthgap that ha=
s
> > > > > > > gcc 15 in
> > > > > > > its package feed?
> > > > > >
> > > > > > I haven't built the whole world, but these changes allowed me t=
o
> > > > > > build
> > > > > > our images with gcc-15 from ubuntu-25.10 with scarthgap (and 2
> > > > > > more
> > > > > > changes sent for walnascar).
> > > > > >
> > > > > > So even when it's not officially supported (or tested on AB),
> > > > > > these
> > > > > > changes are safe enough, right?
> > > > >
> > > > > My opinion is if you want to build an old branch on an unsupporte=
d
> > > > > distro, you maintain a fork yourself. Otherwise use containers
> > > > > (kas,
> > > > > CROPS, ...) to build old branches on unsupported distros. Master =
of
> > > > > course is a different topic, and patches to support new
> > > > > GCC/glibc/musl/clang/cmake/whatever on yet-unsupported distros is
> > > > > *very
> > > > > much* welcome.
> > > >
> > > > I use containers, this one with ubuntu-25.10, I can switch to older
> > > > ubuntu if needed, but it's useful to catch issues early (by someone
> > > > who can also provided patches where needed, instead of random peopl=
e
> > > > reporting that LTS versions don't work on their new system).
> > > >
> > > > All of these changes are backports from master where it was already
> > > > fixed by Khem or me before (with the exception of cairo where I've
> > > > backported just 2 fixes from upstream instead of whole minor upgrad=
e
> > > > as the rest of the upgrade isn't needed for LTS).
> > > >
> > > > > I'm not sure we need to add on maintainer load by patching Yocto
> > > > > for
> > > > > unsupported distros. But that's a call the maintainer(s) and or T=
SC
> > > > > to make.
> > > >
> > > > Agreed, Steve already queued the patches in scarthgap-nut, similar
> > > > fixes were already merged in meta-clang and meta-tensorflow, so
> > > > hopefully these small changes to keep the LTS buildable on newer OS
> > > > versions don't add too much trouble for them.
> > > >
> > > > I am not asking anyone to regularly validate that older LTS work on
> > > > newer OS then what was originally tested, but if small already test=
ed
> > > > fix is identified, sent and doesn't break anything on older support=
ed
> > > > OSes, then is it too much to ask for it being applied?
> > >
> > > Our policy has been to accept simple changes to keep the releases
> > > building on newer distros as long as they're not too invasive/risky. =
As
> > > the releases age, the barrier to entry increases.
> > >
> > > Where a distro is known to work, we also have been known to enable
> > > testing on it. It really has to be on a case by case basis though, no=
t
> > > all distro changes are equal and we can't know in advance what they
> > > are.
> >
> > Richard took the words right out of my mouth :-)
> >
> > An additional factor for supporting newer releases when feasible is
> > that older releases on autobuilder workers are phased out over time,
> > leaving a smaller and smaller pool available for LTS testing.
> >
> > Being able to add newer releases to the LTS worker pool is definitely
> > a good thing!
> >
> > Steve

