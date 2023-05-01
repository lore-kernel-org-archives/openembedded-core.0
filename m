Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39B2C77B60
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 00:24:04 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.83026.1682900637145457964
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Apr 2023 17:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HXogwqR1;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-38de3338abeso1162661b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 17:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682900636; x=1685492636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtKJcOCygXP0O/fkxS40vDPfm2Mjb+PVP+U8S5rWfRA=;
        b=HXogwqR1hDPewHYCIQFzugY6pDiZJ66rYQwz1cI8FsCT1PCSWANKxzEIPU6zuxOJxq
         0gDX0Iqmb0qg4wwJAa2vG1F7xWoDZ/SeafZCKrmbdCR4AnwpyF3bjk6SPhFStKkvIGM0
         IoPiTL2EmhMJW9i9CZmB9bmyGNg0N3O1paQHWF4h39J3htI7yY6kKmL3wLdkhfUM763F
         EaSIuroN/GPrn6tm5QRLNpAW6lW+n57/NWtZvmRX9+Lg2nmI7fGwXycUkKpivmeH9hLO
         O/hhaeS+rOB4V1hYi5MHr5xkqcVWwLiLifxzDEmaQQGvWqzIlE43CuZgDDBfs7nOKEOv
         AvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682900636; x=1685492636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtKJcOCygXP0O/fkxS40vDPfm2Mjb+PVP+U8S5rWfRA=;
        b=Qp41nLFvXNACTW+clN3PskntO6p33ADvyPEM7WeZQMNdaxUG9poCNgmA+zGvw+p6aW
         I+pGywwMdfpsInHNFuu4ZHe36UmDq+bJN1bAtCFidOXHd+KBUmXt06FFh37h+AJgdSdO
         BDLKcc/wJzkDPDe4c7luEhzEgEymOd+z+qXHeBfYUBR5RZeHsrMoYklCNR/ea2sB4xD/
         6ZVsKe2KbFZ+MRWXvnljT656Hnp9LpZf4B3Owf/IlMTdx3CYCuDSi7aJ/dq73iDfQm/K
         UQ/p06uvuBJqTaJM9QtqLcYbSEyBbyyZ8auD9ztRgdZSAnL068nfs4xlbmm0ryqjfVGp
         wHmw==
X-Gm-Message-State: AC+VfDwefnGmxLnKYtcBp8XsTp3Yl4IQrfxjoSrQtrWXaF91W9w47OBK
	qgjYkrFE+b+mdw2DdV2+zmaCeYbCzMOLeCRk/MU=
X-Google-Smtp-Source: ACHHUZ4+QsPf/blN6LuBI7K9oalO2q1QAOlg3EGhCIge7O+ongYNJUX74MJPzOC8+KWS6nOBs5Vag1qqKFaJT7EIx1U=
X-Received: by 2002:a54:4189:0:b0:389:6b33:fe9e with SMTP id
 9-20020a544189000000b003896b33fe9emr6059879oiy.58.1682900636025; Sun, 30 Apr
 2023 17:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-10-alex@linutronix.de>
 <CAMKF1sqM-WhYtLALHemrPC62qMaA4h41UNr_kP6brLvbdJ2j+w@mail.gmail.com>
 <CANNYZj-JbHNHLd1Dh5WAeBUoqLNwoKcdpeDH1UKkxhfsLZSfWQ@mail.gmail.com>
 <CAMKF1sr108FSHSZ0sg7GEedTpfpuR=nnSY_MJGpprVBFzwNx-w@mail.gmail.com> <CANNYZj_eZK+etivyDpRkMRRL0K5Vd5DDY3Z+Y7G31_obabeOTQ@mail.gmail.com>
In-Reply-To: <CANNYZj_eZK+etivyDpRkMRRL0K5Vd5DDY3Z+Y7G31_obabeOTQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Apr 2023 17:23:30 -0700
Message-ID: <CAMKF1sqassFJNsbaEOKB15-XtVeok5ZKOR=ufUXDrKaq6anJMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/11] insane.bbclass: simplify exceptions for
 32 bit time API check
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 00:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180582

here is latest - https://errors.yoctoproject.org/Errors/Build/163426/
I have tree rebased on alex'es master-next here

https://git.yoctoproject.org/poky-contrib/log/?h=3Dyoe/mut

On Sat, Apr 29, 2023 at 10:35=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This looks like a build with v1 version of the patchset, and not v2.
> Pseudo has been specifically excluded from the qa check in v2 for
> instance.
>
> Alex
>
> On Sun, 30 Apr 2023 at 07:16, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > https://errors.yoctoproject.org/Errors/Build/163415/
> >
> > On Sat, Apr 29, 2023 at 9:49=E2=80=AFPM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Can I see the error please?
> > >
> > > Alex
> > >
> > > On Sat 29. Apr 2023 at 21.23, Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >> its still triggering as error.
> > >>
> > >> On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
> > >> <alex.kanavin@gmail.com> wrote:
> > >> >
> > >> > Existing implementation required to list both specific problematic=
 apis, and files that
> > >> > use them: neither is necessary as both are seen in package_qa erro=
r messages, and
> > >> > can cause excessive amount of exception lines, if there are too ma=
ny files, or
> > >> > they are installed in arch-specific locations. Also, the value of =
INSANE_SKIP
> > >> > should be the test that needs to be skipped, and in this case it w=
asn't.
> > >> >
> > >> > Also, all problematic recipes are now correctly listed.
> > >> >
> > >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > >> > ---
> > >> >  meta/classes-global/insane.bbclass  | 14 +++-----------
> > >> >  meta/conf/distro/include/time64.inc | 18 ++++++++++++------
> > >> >  2 files changed, 15 insertions(+), 17 deletions(-)
> > >> >
> > >> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-glo=
bal/insane.bbclass
> > >> > index ee34d5208d1..8788f58fc5b 100644
> > >> > --- a/meta/classes-global/insane.bbclass
> > >> > +++ b/meta/classes-global/insane.bbclass
> > >> > @@ -617,22 +617,14 @@ def check_32bit_symbols(path, packagename, d=
, elf, messages):
> > >> >              # At this point, any symbol information is stripped i=
nto the debug
> > >> >              # package, so that is the only place we will find the=
m.
> > >> >              elfpath =3D elfpath.replace('.debug/', '')
> > >> > -            allowed =3D (
> > >> > -                d.getVarFlag(
> > >> > -                    'INSANE_SKIP:' + d.getVar('PN'), elfpath.repl=
ace('/', '_')
> > >> > -                ) or ''
> > >> > -            ).split()
> > >> > -            usedapis -=3D set(allowed)
> > >> > -            if usedapis:
> > >> > +            allowed =3D "32bit-time" in (d.getVar('INSANE_SKIP') =
or '').split()
> > >> > +            if not allowed:
> > >> >                  msgformat =3D elfpath + " uses 32-bit api '%s'"
> > >> >                  for sym in usedapis:
> > >> >                      oe.qa.add_message(messages, '32bit-time', msg=
format % sym)
> > >> >                  oe.qa.add_message(
> > >> >                      messages, '32bit-time',
> > >> > -                    'Suppress with INSANE_SKIP:%s[%s] =3D "%s"' %=
 (
> > >> > -                        d.getVar('PN'), elfpath.replace('/', '_')=
,
> > >> > -                        ' '.join(usedapis)
> > >> > -                    )
> > >> > +                    'Suppress with INSANE_SKIP =3D "32bit-time"'
> > >> >                  )
> > >> >
> > >> >  # Check license variables
> > >> > diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distr=
o/include/time64.inc
> > >> > index f3bdfba4acf..1a3399bc5e6 100644
> > >> > --- a/meta/conf/distro/include/time64.inc
> > >> > +++ b/meta/conf/distro/include/time64.inc
> > >> > @@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D ""
> > >> >  GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
> > >> >  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
> > >> >
> > >> > -INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf=
_lib_libstd.so] =3D "clock_gettime gettime fcntl fstat64 fstatat64 getsocko=
pt ioctl lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
> > >> > -INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] =3D "fcntl fstat64 prc=
tl stat64 clock_gettime"
> > >> > -INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] =3D "fcntl lsta=
t64 setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstatat64 =
prctl mktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
> > >> > -
> > >> > -# libpulsedsp.so is a preload-library that hooks libc functions
> > >> > -INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] =3D "s=
etsockopt fcntl"
> > >> > +INSANE_SKIP:append:pn-cargo =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-glibc =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-glibc-tests =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-librsvg =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-libstd-rs =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-pulseaudio =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-python3-bcrypt =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-python3-cryptography =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-rust =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-rust-hello-world =3D " 32bit-time"
> > >> > +INSANE_SKIP:append:pn-strace =3D " 32bit-time"
> > >> >
> > >> > --
> > >> > 2.30.2
> > >> >
> > >> >
> > >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> > Links: You receive all messages sent to this group.
> > >> > View/Reply Online (#180428): https://lists.openembedded.org/g/open=
embedded-core/message/180428
> > >> > Mute This Topic: https://lists.openembedded.org/mt/98511412/199791=
4
> > >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/un=
sub [raj.khem@gmail.com]
> > >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> >

