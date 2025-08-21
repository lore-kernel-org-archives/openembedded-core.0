Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DEDCA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:37:34 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.1213.1755794249912303444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cLsqpGap;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55ce509f80dso1284750e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 09:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755794248; x=1756399048; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLD+TUZkguYfNC62uxRR1fyLUNN4Qf3iZfpQVUil3rI=;
        b=cLsqpGapmYAeiTfReY9tCfbEv1+GzkavKF2kPtyrdDeRmInRTdSmOWmGUbMElUP1+B
         fVfugr1Pj9mY+zDAOXOq29GfJgkQTy1lJqDCDadXLMSZCRKLe5lzYPQS/oHSat2r7nbu
         KBBxJsOcZWBpMwnm+j+HfahkNeCrQaRvZKhFdX4y1YsCXnqUPExfW5X8iI7T3mjRYC9C
         O9E6hJE+iq0pLgl/cXNfuFGcxzfaFFbWet7/ZB4eVaDLSG7rPfGzwRfadTmol4F6HaLC
         CCWZxOdYVk4659xrabiG7VezIRPsiKKhJsqq/eL6HTVqBcx9VTtYan5rKzlmIY/yCUxa
         yKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755794248; x=1756399048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLD+TUZkguYfNC62uxRR1fyLUNN4Qf3iZfpQVUil3rI=;
        b=EtPhfkRtI02nZFkW9krUjrK0lCo7Fo9WtokFG+dnAONIMwbPDAcQduM+52bxCm7Idx
         Xzso9oiiavuMuuhIZIE04OTyw7zNm1wQ7UpErIy7Qt4nkgaOpWbRJmTPCzuOvczGVjLU
         eLnC7GMeTEw35VvBuRn8x0Dy0F7sFketlgL4yLgV9fztiNJ8gE2iezoITMTZmc2V7Phe
         JM0nHBr2qGj+REr/GwEXhrLhr266JF/Q4Ctroh9a6BlKlP4x8Tm1P7QX76vyxWogq9Fe
         dr2t5d3TKilIFMaQItzjY0t2qk9c9oaxT9XJGshOqVI4QYWeK6AdED2tM1THm8WavHOM
         MMkg==
X-Forwarded-Encrypted: i=1; AJvYcCV1+z50RVQZLUdFtwZn+oiXU0XX+FNI+uEIlSxzvObvRfhAewwDbrX9nngWm9MQuhYLXcFHRx8Tm71dQCLBxVEC8g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQ3JXHDzQ06qWjOvtmRIWgblfVrez1TIOaCJ9UU4KKX/Qn35ay
	i+o283JUtkf5936L6+pq9UooRhaDzMK6T/nIEDo+SOuY0gy0ysMZ3AgQBSnKdrdvmAQrMNS5Jnb
	RkaBCoZj6UvlLZQkjuRgeNwh6PJ9ZPGE=
X-Gm-Gg: ASbGnctTbN2T1f7x7BMMAmdu2yQt5brfF8a8M4oUuKp+K/nK/Vn9Qan7snkTJ9mrq+q
	WtTisOZ2VLFaGaOWAf82bCP56lQTZsWF5JMzjarginIizk44wLLak11ju4OIJIyqiKeWYU5l7Gq
	Mn02bHtsk9jn+bVcmKcLaEZJKSOgDAlbsnq6ujqzI9MelPH5pOJx0icSi71gQARgYm58nKxZJxF
	3OmgUEAIw==
X-Google-Smtp-Source: AGHT+IHD3eiqYPPi2c0EsYLacKaCak9+cdUiDtkaMXfM/zRzk8HAnEDtmly9OJ7D0JJhv1czqOHDovGQUgraY1HU4mk=
X-Received: by 2002:a05:6512:420e:b0:55e:11ca:154a with SMTP id
 2adb3069b0e04-55f0cd4a2ebmr27028e87.38.1755794247769; Thu, 21 Aug 2025
 09:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250817205033.3845672-1-martin.jansa@gmail.com>
 <8d5f70ac-7a0e-4c1b-b1c3-3949412843c8@cherry.de> <CA+chaQeo_Fa9G-4rNRuihvsnHbGJFZx_8JS7CHV83KY1w9uFBw@mail.gmail.com>
 <905aedea-e2b1-4b07-8f6d-f68863f60f0d@cherry.de> <CA+chaQek-wO5DvPanFJpC+hCgMH2FLn_EeStsgvXDy8LBb4Acg@mail.gmail.com>
 <dd63bc2f1d4d51e76550b2653fef3f35a0adee6b.camel@linuxfoundation.org> <CAOSpxdaTNWxO6EuCOJ_yfBmcHKOCQvtTAaJLOb_5ihHi=Xfm4w@mail.gmail.com>
In-Reply-To: <CAOSpxdaTNWxO6EuCOJ_yfBmcHKOCQvtTAaJLOb_5ihHi=Xfm4w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 21 Aug 2025 18:37:14 +0200
X-Gm-Features: Ac12FXx6ImzYxxG4MV-rGVHwrm19jlSl3Bs6BREFT5nXyZRu7OHCnlvVIhLB-_s
Message-ID: <CA+chaQevA88L=vcev8y-ckAqF=RGUKmpgcuCh=eGGKump1sHvg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] e2fsprogs: Fix build failure
 with gcc 15
To: Steve Sakoman <steve@sakoman.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, openembedded-core@lists.openembedded.org, 
	Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222275

Thanks Richard and Steve!

Crofton reported ncurses-native issue yesterday on #oe, so I've sent
fix for that as well as cmake-native and git-native which were failing
after that (then noticed that Rudi already reported these a month ago
in Fedora 42 https://lists.yoctoproject.org/g/yocto/message/65542  )

Then I've realized that bunch of -native deps weren't rebuilt in my
builds, due to sstate still being valid after updating docker image
with new ubuntu-25.10 snapshot having gcc-15, so I did one more
scarthgap and walnascar build without any sstate to catch them all
(this time with gentoo with gcc-15 and python-14 to catch all bleeding
edge cases).

Now I've a bit longer set of fixes to send:
a3403dabc9 (HEAD -> jansa/scarthgap, l/jansa/scarthgap, l/HEAD)
yocto-uninative: Update to 4.9 for glibc 2.42
ee2ff5c8e5 yocto-uninative: Update to 4.8 for GCC 15.1

b3c18663ea pkgconfig: fix build with gcc-15
9e6c809248 unifdef: Don't use C23 constexpr keyword
390be89335 gdbm: Use C11 standard
c0f2eff170 gmp: Fix build with older gcc versions
10a482993b gmp: Fix build with GCC15/C23
1cf6c77ae4 m4: Stick to C17 standard
0aaed0c782 unzip: Fix build with GCC-15
and there will be few more before the build finishes (libtirpc-native
elfutils-native libgpg-error-native)

5cbb155559 lib/oe/utils: use multiprocessing from bb

The last one depends on
bde29045a Use a "fork" multiprocessing context
for bitbake which would require minimum version bump for scarthgap
(and similarly for walnascar as well).

The question is, should I send them all in single batch once my local
builds are finished, or just gcc-15 first and then possibly
python-14/bitbake-min-version and uninative fixes later? Sorry I
should have realized that I'll need to manually drop sstate to fully
test this.

Regards,

On Tue, Aug 19, 2025 at 6:53=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> On Tue, Aug 19, 2025 at 9:31=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2025-08-19 at 13:36 +0200, Martin Jansa wrote:
> > > On Tue, Aug 19, 2025 at 11:57=E2=80=AFAM Quentin Schulz
> > > <quentin.schulz@cherry.de> wrote:
> > > >
> > > > Hi Martin,
> > > >
> > > > On 8/19/25 11:24 AM, Martin Jansa wrote:
> > > > > On Tue, Aug 19, 2025 at 11:21=E2=80=AFAM Quentin Schulz
> > > > > <quentin.schulz@cherry.de> wrote:
> > > > > >
> > > > > > Hi Martin,
> > > > > >
> > > > > > Do we actually support any distribution for Scarthgap that has
> > > > > > gcc 15 in
> > > > > > its package feed?
> > > > >
> > > > > I haven't built the whole world, but these changes allowed me to
> > > > > build
> > > > > our images with gcc-15 from ubuntu-25.10 with scarthgap (and 2
> > > > > more
> > > > > changes sent for walnascar).
> > > > >
> > > > > So even when it's not officially supported (or tested on AB),
> > > > > these
> > > > > changes are safe enough, right?
> > > >
> > > > My opinion is if you want to build an old branch on an unsupported
> > > > distro, you maintain a fork yourself. Otherwise use containers
> > > > (kas,
> > > > CROPS, ...) to build old branches on unsupported distros. Master of
> > > > course is a different topic, and patches to support new
> > > > GCC/glibc/musl/clang/cmake/whatever on yet-unsupported distros is
> > > > *very
> > > > much* welcome.
> > >
> > > I use containers, this one with ubuntu-25.10, I can switch to older
> > > ubuntu if needed, but it's useful to catch issues early (by someone
> > > who can also provided patches where needed, instead of random people
> > > reporting that LTS versions don't work on their new system).
> > >
> > > All of these changes are backports from master where it was already
> > > fixed by Khem or me before (with the exception of cairo where I've
> > > backported just 2 fixes from upstream instead of whole minor upgrade
> > > as the rest of the upgrade isn't needed for LTS).
> > >
> > > > I'm not sure we need to add on maintainer load by patching Yocto
> > > > for
> > > > unsupported distros. But that's a call the maintainer(s) and or TSC
> > > > to make.
> > >
> > > Agreed, Steve already queued the patches in scarthgap-nut, similar
> > > fixes were already merged in meta-clang and meta-tensorflow, so
> > > hopefully these small changes to keep the LTS buildable on newer OS
> > > versions don't add too much trouble for them.
> > >
> > > I am not asking anyone to regularly validate that older LTS work on
> > > newer OS then what was originally tested, but if small already tested
> > > fix is identified, sent and doesn't break anything on older supported
> > > OSes, then is it too much to ask for it being applied?
> >
> > Our policy has been to accept simple changes to keep the releases
> > building on newer distros as long as they're not too invasive/risky. As
> > the releases age, the barrier to entry increases.
> >
> > Where a distro is known to work, we also have been known to enable
> > testing on it. It really has to be on a case by case basis though, not
> > all distro changes are equal and we can't know in advance what they
> > are.
>
> Richard took the words right out of my mouth :-)
>
> An additional factor for supporting newer releases when feasible is
> that older releases on autobuilder workers are phased out over time,
> leaving a smaller and smaller pool available for LTS testing.
>
> Being able to add newer releases to the LTS worker pool is definitely
> a good thing!
>
> Steve

