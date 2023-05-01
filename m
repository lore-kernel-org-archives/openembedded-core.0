Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76166C7EE21
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 19:21:30 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.104289.1682968885386870345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 12:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=srD11Gk6;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1927aa264deso243969fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682968884; x=1685560884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbBFwYCro1IJBQBNwrTd9C2MNGQWzQERmLWi9+zCDoM=;
        b=srD11Gk6GQ7p4xgWPu+BdAAbGdef2JLUWUm7IvAzBiTPMr++3g/Nrk05hHuDof2eqF
         qzYgp6sx+YR5jao1JNIvvkQqy9U/gu6YHP7recP7nfWurqneMGD9QMVHcHX1JLOHVkOf
         61nXeABxOyA09w2fe/Rje+sED60U8PLmxHA9WrRsv1UwosZyzJlgs2l+ViZzE3c08bQ0
         t/6f0DVHiOJYNhx35NxFjBnLlJ1rlMdsbXa52SGv7252Bv6qvNggX65fo+yIsQX5E/vb
         riAOH43pq1zySr0ptewXK+SV/n63jIFszqm+r665ycVHitzaRVvgs0CBZl46NSlr/l33
         oDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682968884; x=1685560884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbBFwYCro1IJBQBNwrTd9C2MNGQWzQERmLWi9+zCDoM=;
        b=RLz1O9E5izco0qme2ZE9YzrbmletVMHHcviG/XQceABE1701MbJH0SOIEq++g6ih+d
         3EvzKc8kypW6heyb57qOz/cvQC2xM2XIzqxW328KRUAW15CWtlZE4apulYopjRHli3EU
         Y6EYrYdCuo6kmJ8K3NugxyQmR+QyrY40rbsmmF1hpmOtzHU5RnaB9UOcF0V50znmxRc1
         b1P8eDxBQCpMsIgFaklWUEC7lBlQUpy/MUenWBMZ1G/uC3T4GMiGHb5fBfoLIAI5m3vK
         CpOVfu/m1H1bYymx7tH5LxQDSM6y3gROn0LJACfTSn9i8HFIrV40lzb/nO56r8FWPh+v
         s9+w==
X-Gm-Message-State: AC+VfDw3kXVcoxUPiOMHJKkjxESxcHeVp4p+H6KHhtlxSqdWU/NtIJHP
	8BVGTo1CW/9wAQiPWHVmgQhW0AkLt8HprByRPc8=
X-Google-Smtp-Source: ACHHUZ7FR/mQ6qEgb9F7HSjsmjPAd9LoP8dSBg82tJ6pB2E1GGqQoW+KthLT04ypwMPi+81FsuNiDeGrb0pOdVrkBl4=
X-Received: by 2002:a05:6870:a8b2:b0:18b:ff9e:db04 with SMTP id
 eb50-20020a056870a8b200b0018bff9edb04mr7363090oab.6.1682968884458; Mon, 01
 May 2023 12:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-10-alex@linutronix.de>
 <CAMKF1sqM-WhYtLALHemrPC62qMaA4h41UNr_kP6brLvbdJ2j+w@mail.gmail.com>
 <CANNYZj-JbHNHLd1Dh5WAeBUoqLNwoKcdpeDH1UKkxhfsLZSfWQ@mail.gmail.com>
 <CAMKF1sr108FSHSZ0sg7GEedTpfpuR=nnSY_MJGpprVBFzwNx-w@mail.gmail.com>
 <CANNYZj_eZK+etivyDpRkMRRL0K5Vd5DDY3Z+Y7G31_obabeOTQ@mail.gmail.com>
 <CAMKF1sqassFJNsbaEOKB15-XtVeok5ZKOR=ufUXDrKaq6anJMw@mail.gmail.com>
 <175AE10D5735A1BE.29517@lists.openembedded.org> <CANNYZj-GKP+tKeStySStFTNZTA_yVHG=kstfpiRoY397aPzGDQ@mail.gmail.com>
In-Reply-To: <CANNYZj-GKP+tKeStySStFTNZTA_yVHG=kstfpiRoY397aPzGDQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 May 2023 12:20:58 -0700
Message-ID: <CAMKF1soU2=NY3p7DGHYfEb28CiLyEJ-BnJfM6KytoFguAjfgkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/11] insane.bbclass: simplify exceptions for
 32 bit time API check
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 19:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180587

On Mon, May 1, 2023 at 1:35=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> For example, pseudo is still there even though it's explicitly
> excluded from the check in the new version of the patchset. Something
> doesn't compute here.

yeah, it was a blip on my automation. poky repository had not been
pruned for many months, and somehow it was failing to rebase due to
diverged heads
so project was not updating the branch to latest yoe/mut. I have fixed
it now and lets see what happens.

>
> Alex
>
> On Mon, 1 May 2023 at 03:34, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > So how would I replicate these? What build is actually being run?
> >
> > Alex
> >
> > On Mon 1. May 2023 at 2.23, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> here is latest - https://errors.yoctoproject.org/Errors/Build/163426/
> >> I have tree rebased on alex'es master-next here
> >>
> >> https://git.yoctoproject.org/poky-contrib/log/?h=3Dyoe/mut
> >>
> >> On Sat, Apr 29, 2023 at 10:35=E2=80=AFPM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > This looks like a build with v1 version of the patchset, and not v2.
> >> > Pseudo has been specifically excluded from the qa check in v2 for
> >> > instance.
> >> >
> >> > Alex
> >> >
> >> > On Sun, 30 Apr 2023 at 07:16, Khem Raj <raj.khem@gmail.com> wrote:
> >> > >
> >> > > https://errors.yoctoproject.org/Errors/Build/163415/
> >> > >
> >> > > On Sat, Apr 29, 2023 at 9:49=E2=80=AFPM Alexander Kanavin
> >> > > <alex.kanavin@gmail.com> wrote:
> >> > > >
> >> > > > Can I see the error please?
> >> > > >
> >> > > > Alex
> >> > > >
> >> > > > On Sat 29. Apr 2023 at 21.23, Khem Raj <raj.khem@gmail.com> wrot=
e:
> >> > > >>
> >> > > >> its still triggering as error.
> >> > > >>
> >> > > >> On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
> >> > > >> <alex.kanavin@gmail.com> wrote:
> >> > > >> >
> >> > > >> > Existing implementation required to list both specific proble=
matic apis, and files that
> >> > > >> > use them: neither is necessary as both are seen in package_qa=
 error messages, and
> >> > > >> > can cause excessive amount of exception lines, if there are t=
oo many files, or
> >> > > >> > they are installed in arch-specific locations. Also, the valu=
e of INSANE_SKIP
> >> > > >> > should be the test that needs to be skipped, and in this case=
 it wasn't.
> >> > > >> >
> >> > > >> > Also, all problematic recipes are now correctly listed.
> >> > > >> >
> >> > > >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> > > >> > ---
> >> > > >> >  meta/classes-global/insane.bbclass  | 14 +++-----------
> >> > > >> >  meta/conf/distro/include/time64.inc | 18 ++++++++++++------
> >> > > >> >  2 files changed, 15 insertions(+), 17 deletions(-)
> >> > > >> >
> >> > > >> > diff --git a/meta/classes-global/insane.bbclass b/meta/classe=
s-global/insane.bbclass
> >> > > >> > index ee34d5208d1..8788f58fc5b 100644
> >> > > >> > --- a/meta/classes-global/insane.bbclass
> >> > > >> > +++ b/meta/classes-global/insane.bbclass
> >> > > >> > @@ -617,22 +617,14 @@ def check_32bit_symbols(path, packagena=
me, d, elf, messages):
> >> > > >> >              # At this point, any symbol information is strip=
ped into the debug
> >> > > >> >              # package, so that is the only place we will fin=
d them.
> >> > > >> >              elfpath =3D elfpath.replace('.debug/', '')
> >> > > >> > -            allowed =3D (
> >> > > >> > -                d.getVarFlag(
> >> > > >> > -                    'INSANE_SKIP:' + d.getVar('PN'), elfpath=
.replace('/', '_')
> >> > > >> > -                ) or ''
> >> > > >> > -            ).split()
> >> > > >> > -            usedapis -=3D set(allowed)
> >> > > >> > -            if usedapis:
> >> > > >> > +            allowed =3D "32bit-time" in (d.getVar('INSANE_SK=
IP') or '').split()
> >> > > >> > +            if not allowed:
> >> > > >> >                  msgformat =3D elfpath + " uses 32-bit api '%=
s'"
> >> > > >> >                  for sym in usedapis:
> >> > > >> >                      oe.qa.add_message(messages, '32bit-time'=
, msgformat % sym)
> >> > > >> >                  oe.qa.add_message(
> >> > > >> >                      messages, '32bit-time',
> >> > > >> > -                    'Suppress with INSANE_SKIP:%s[%s] =3D "%=
s"' % (
> >> > > >> > -                        d.getVar('PN'), elfpath.replace('/',=
 '_'),
> >> > > >> > -                        ' '.join(usedapis)
> >> > > >> > -                    )
> >> > > >> > +                    'Suppress with INSANE_SKIP =3D "32bit-ti=
me"'
> >> > > >> >                  )
> >> > > >> >
> >> > > >> >  # Check license variables
> >> > > >> > diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/=
distro/include/time64.inc
> >> > > >> > index f3bdfba4acf..1a3399bc5e6 100644
> >> > > >> > --- a/meta/conf/distro/include/time64.inc
> >> > > >> > +++ b/meta/conf/distro/include/time64.inc
> >> > > >> > @@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D ""
> >> > > >> >  GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
> >> > > >> >  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
> >> > > >> >
> >> > > >> > -INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnue=
abihf_lib_libstd.so] =3D "clock_gettime gettime fcntl fstat64 fstatat64 get=
sockopt ioctl lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
> >> > > >> > -INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] =3D "fcntl fstat6=
4 prctl stat64 clock_gettime"
> >> > > >> > -INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] =3D "fcntl=
 lstat64 setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstat=
at64 prctl mktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
> >> > > >> > -
> >> > > >> > -# libpulsedsp.so is a preload-library that hooks libc functi=
ons
> >> > > >> > -INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] =
=3D "setsockopt fcntl"
> >> > > >> > +INSANE_SKIP:append:pn-cargo =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-glibc =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-glibc-tests =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-librsvg =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-libstd-rs =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-pulseaudio =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-python3-bcrypt =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-python3-cryptography =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-rust =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-rust-hello-world =3D " 32bit-time"
> >> > > >> > +INSANE_SKIP:append:pn-strace =3D " 32bit-time"
> >> > > >> >
> >> > > >> > --
> >> > > >> > 2.30.2
> >> > > >> >
> >> > > >> >
> >> > > >> >
> >> > > >> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180583): https://lists.openembedded.org/g/openembed=
ded-core/message/180583
> > Mute This Topic: https://lists.openembedded.org/mt/98511412/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

