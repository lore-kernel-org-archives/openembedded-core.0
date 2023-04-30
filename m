Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06514C77B60
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 05:35:10 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.63841.1682832903474800908
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 22:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gAbMxQ7e;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4ec9c7c6986so1765491e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 22:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682832902; x=1685424902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr5IHSZiyiDgSoZuhw+SlocXpHi4MGrppmRzh+fx3bo=;
        b=gAbMxQ7eKxQvSYGVSuIBr9FOUEX09Rx80J1x6MBCEs9IBjiXHDBLSSF+u4NNZSHqUa
         dRGpCOqLZMjClceuDW92RNTz8kSpossZznWA2qUvuTn0G/6GMx9h/mL6qTmSvXUwb45q
         nEx9YuuxsFW/NnpKSfMe5PkontufK8c7fQQbtG5MKE9zcgBRuWoBAVjdwX6QbC4p2Ty1
         xoKaAZHTwYUSTOimBnXp6GH9U4+2u7F/lHgbr765FEH17WEI2QYYGWyGw+9cVe35Reg+
         sh2E5YKF1ekpq5J0f5d25HlY22HbgizL0mCdDYCYf0+wyaoH4wlzyojrB0RiGWE0Bnr5
         1HTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682832902; x=1685424902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yr5IHSZiyiDgSoZuhw+SlocXpHi4MGrppmRzh+fx3bo=;
        b=LVoQLKtC7XTEUvGwY1561Kz4YzcWhdrEq5Upz1IL/ADVocL+3/EqU8mxKByjVRzjXe
         d2SRFTV4W2n8BPvbIULFPzvho8VyuoVo7K517hC9JVX/L9z9WhUxd+8uvzlsFnlnsCSt
         iomSKWe4yhvkwjZKkvWyr7w6aCZi9KcccPTKzE1QYwji9QLz9NFmLRDlZ1cZ3qIntNpC
         u3PQ9SI5tq3eSrYt+qFr4AfH1RTmkPH5JK+l0WfAgkcw0XJtxcS1z8W+JhKH7Kxz/+Lr
         Ho81toHc80dk8zY2lo9ykLtxuqwlKikcmY/UDLxaAswtA2fzbXvCGLnrXrZOm9UwHjLa
         qnlg==
X-Gm-Message-State: AC+VfDzj5oEwiRkyvRGXFNI/ilAIYShx8ck9wRvV2xRNMQAqwI1PcmoL
	l+xSCKF4OvAyVyX6xygN+1sE+nCKNHALgX1XGow=
X-Google-Smtp-Source: ACHHUZ63Q1jHEHtFgg4Izn0KNZabLWCcVywK2+4c9EbgCVzGraECMqGfRf5MRK7NgyK1jRM5HpjTmlPBe2a5qswCqdY=
X-Received: by 2002:ac2:44d2:0:b0:4ed:c17c:5e3d with SMTP id
 d18-20020ac244d2000000b004edc17c5e3dmr2666139lfm.4.1682832901502; Sat, 29 Apr
 2023 22:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-10-alex@linutronix.de>
 <CAMKF1sqM-WhYtLALHemrPC62qMaA4h41UNr_kP6brLvbdJ2j+w@mail.gmail.com>
 <CANNYZj-JbHNHLd1Dh5WAeBUoqLNwoKcdpeDH1UKkxhfsLZSfWQ@mail.gmail.com> <CAMKF1sr108FSHSZ0sg7GEedTpfpuR=nnSY_MJGpprVBFzwNx-w@mail.gmail.com>
In-Reply-To: <CAMKF1sr108FSHSZ0sg7GEedTpfpuR=nnSY_MJGpprVBFzwNx-w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 30 Apr 2023 07:34:49 +0200
Message-ID: <CANNYZj_eZK+etivyDpRkMRRL0K5Vd5DDY3Z+Y7G31_obabeOTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/11] insane.bbclass: simplify exceptions for
 32 bit time API check
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 05:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180566

This looks like a build with v1 version of the patchset, and not v2.
Pseudo has been specifically excluded from the qa check in v2 for
instance.

Alex

On Sun, 30 Apr 2023 at 07:16, Khem Raj <raj.khem@gmail.com> wrote:
>
> https://errors.yoctoproject.org/Errors/Build/163415/
>
> On Sat, Apr 29, 2023 at 9:49=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Can I see the error please?
> >
> > Alex
> >
> > On Sat 29. Apr 2023 at 21.23, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> its still triggering as error.
> >>
> >> On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Existing implementation required to list both specific problematic a=
pis, and files that
> >> > use them: neither is necessary as both are seen in package_qa error =
messages, and
> >> > can cause excessive amount of exception lines, if there are too many=
 files, or
> >> > they are installed in arch-specific locations. Also, the value of IN=
SANE_SKIP
> >> > should be the test that needs to be skipped, and in this case it was=
n't.
> >> >
> >> > Also, all problematic recipes are now correctly listed.
> >> >
> >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> > ---
> >> >  meta/classes-global/insane.bbclass  | 14 +++-----------
> >> >  meta/conf/distro/include/time64.inc | 18 ++++++++++++------
> >> >  2 files changed, 15 insertions(+), 17 deletions(-)
> >> >
> >> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-globa=
l/insane.bbclass
> >> > index ee34d5208d1..8788f58fc5b 100644
> >> > --- a/meta/classes-global/insane.bbclass
> >> > +++ b/meta/classes-global/insane.bbclass
> >> > @@ -617,22 +617,14 @@ def check_32bit_symbols(path, packagename, d, =
elf, messages):
> >> >              # At this point, any symbol information is stripped int=
o the debug
> >> >              # package, so that is the only place we will find them.
> >> >              elfpath =3D elfpath.replace('.debug/', '')
> >> > -            allowed =3D (
> >> > -                d.getVarFlag(
> >> > -                    'INSANE_SKIP:' + d.getVar('PN'), elfpath.replac=
e('/', '_')
> >> > -                ) or ''
> >> > -            ).split()
> >> > -            usedapis -=3D set(allowed)
> >> > -            if usedapis:
> >> > +            allowed =3D "32bit-time" in (d.getVar('INSANE_SKIP') or=
 '').split()
> >> > +            if not allowed:
> >> >                  msgformat =3D elfpath + " uses 32-bit api '%s'"
> >> >                  for sym in usedapis:
> >> >                      oe.qa.add_message(messages, '32bit-time', msgfo=
rmat % sym)
> >> >                  oe.qa.add_message(
> >> >                      messages, '32bit-time',
> >> > -                    'Suppress with INSANE_SKIP:%s[%s] =3D "%s"' % (
> >> > -                        d.getVar('PN'), elfpath.replace('/', '_'),
> >> > -                        ' '.join(usedapis)
> >> > -                    )
> >> > +                    'Suppress with INSANE_SKIP =3D "32bit-time"'
> >> >                  )
> >> >
> >> >  # Check license variables
> >> > diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/=
include/time64.inc
> >> > index f3bdfba4acf..1a3399bc5e6 100644
> >> > --- a/meta/conf/distro/include/time64.inc
> >> > +++ b/meta/conf/distro/include/time64.inc
> >> > @@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D ""
> >> >  GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
> >> >  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
> >> >
> >> > -INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_l=
ib_libstd.so] =3D "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt=
 ioctl lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
> >> > -INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] =3D "fcntl fstat64 prctl=
 stat64 clock_gettime"
> >> > -INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] =3D "fcntl lstat6=
4 setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstatat64 pr=
ctl mktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
> >> > -
> >> > -# libpulsedsp.so is a preload-library that hooks libc functions
> >> > -INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] =3D "set=
sockopt fcntl"
> >> > +INSANE_SKIP:append:pn-cargo =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-glibc =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-glibc-tests =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-librsvg =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-libstd-rs =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-pulseaudio =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-python3-bcrypt =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-python3-cryptography =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-rust =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-rust-hello-world =3D " 32bit-time"
> >> > +INSANE_SKIP:append:pn-strace =3D " 32bit-time"
> >> >
> >> > --
> >> > 2.30.2
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#180428): https://lists.openembedded.org/g/openem=
bedded-core/message/180428
> >> > Mute This Topic: https://lists.openembedded.org/mt/98511412/1997914
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [raj.khem@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >

