Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94832C77B61
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 08:35:27 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.88785.1682930120581253624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 01:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TAHrhoPQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f0108a7d20so2715272e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 01:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682930119; x=1685522119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCBfUxFTAlD0k1PloCts/l6jYd+LT4E1jwX2lrh/MeA=;
        b=TAHrhoPQ6pvb0nOTOa12qgr0RrwhoQY+0CxqRboomauNPAf2lIKuaF4p7roOUgb8wE
         CM8VyH+MEu5QWZIYNkEAeTv5Yj8upkRQQR1hGoSoTSbeeWMeElNPFkN2hYNvTODy40i7
         Od4I56Pge+wSi1luKUBJJovz9V0ixFcbGyxqHehMMSdOZFwf0WZ2TfQ5/Rh2C0RjouWc
         hUpShnnK+S8eihvuyA13mK3PR3J9G5IGz2iVVZ+yzY2eCDb+GoOQ25XFLzO9qYuG9FZY
         TovO0c+mpaSOCAHPMt7fFIjI+dHv8mYrVSrr5Om99oUmRs0Ybq0Srtjn4Zt+LLb5DdV3
         7rSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682930119; x=1685522119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCBfUxFTAlD0k1PloCts/l6jYd+LT4E1jwX2lrh/MeA=;
        b=EYrkqpG3/zm22c/l6qbbNz0XwBewH2jntaO0K4/RiVy3p1K//E1OmQWmwiv5dP+FXy
         mCaAb8GP9xZCPtwcOfJeOVHuXVikx+VHK/5TaWjtsq/rRMuGzEG//won7kmR1H/yxL/e
         X/1vdDb/+GqznO8kwH45FfXjdf3dNdOnI2gtHP8II+h6ubmel4tNeBbnwI4H2S6FqP+C
         aU7xfwx7oKKvd89hYeuP9rxZCWpcxJ5R2ZKi6DjUwEzmkq7/oNcsGrJOk2ttyiVbwya4
         bKAY+zEGlUtgmzxhpLweRrV+Fah60y2UBz2XnR3rybHkJfNGV0Jkm1XdpQsRQlzpzZk/
         Y0NQ==
X-Gm-Message-State: AC+VfDw1g0YpPDHG4++ENGZ0Xc7Q4qigvt0a/RIknI0IGY8FkK2sOKMo
	ypMZMWLK/a+MwWKVYsoy6m+JEK+Cw3HmpHLjzCc=
X-Google-Smtp-Source: ACHHUZ6+Az68eeru5NtCN8DWFrm5AK9VYqgf0TqOtwQPBGobpNkftQQOF4p0XnH0i9ByPUBCMEziUCyd/MEWkg0CXhg=
X-Received: by 2002:ac2:4189:0:b0:4e8:4bc3:fe8a with SMTP id
 z9-20020ac24189000000b004e84bc3fe8amr3126932lfh.25.1682930118566; Mon, 01 May
 2023 01:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-10-alex@linutronix.de>
 <CAMKF1sqM-WhYtLALHemrPC62qMaA4h41UNr_kP6brLvbdJ2j+w@mail.gmail.com>
 <CANNYZj-JbHNHLd1Dh5WAeBUoqLNwoKcdpeDH1UKkxhfsLZSfWQ@mail.gmail.com>
 <CAMKF1sr108FSHSZ0sg7GEedTpfpuR=nnSY_MJGpprVBFzwNx-w@mail.gmail.com>
 <CANNYZj_eZK+etivyDpRkMRRL0K5Vd5DDY3Z+Y7G31_obabeOTQ@mail.gmail.com>
 <CAMKF1sqassFJNsbaEOKB15-XtVeok5ZKOR=ufUXDrKaq6anJMw@mail.gmail.com> <175AE10D5735A1BE.29517@lists.openembedded.org>
In-Reply-To: <175AE10D5735A1BE.29517@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 May 2023 10:35:06 +0200
Message-ID: <CANNYZj-GKP+tKeStySStFTNZTA_yVHG=kstfpiRoY397aPzGDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/11] insane.bbclass: simplify exceptions for
 32 bit time API check
To: alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex@linutronix.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 08:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180584

For example, pseudo is still there even though it's explicitly
excluded from the check in the new version of the patchset. Something
doesn't compute here.

Alex

On Mon, 1 May 2023 at 03:34, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> So how would I replicate these? What build is actually being run?
>
> Alex
>
> On Mon 1. May 2023 at 2.23, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> here is latest - https://errors.yoctoproject.org/Errors/Build/163426/
>> I have tree rebased on alex'es master-next here
>>
>> https://git.yoctoproject.org/poky-contrib/log/?h=3Dyoe/mut
>>
>> On Sat, Apr 29, 2023 at 10:35=E2=80=AFPM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > This looks like a build with v1 version of the patchset, and not v2.
>> > Pseudo has been specifically excluded from the qa check in v2 for
>> > instance.
>> >
>> > Alex
>> >
>> > On Sun, 30 Apr 2023 at 07:16, Khem Raj <raj.khem@gmail.com> wrote:
>> > >
>> > > https://errors.yoctoproject.org/Errors/Build/163415/
>> > >
>> > > On Sat, Apr 29, 2023 at 9:49=E2=80=AFPM Alexander Kanavin
>> > > <alex.kanavin@gmail.com> wrote:
>> > > >
>> > > > Can I see the error please?
>> > > >
>> > > > Alex
>> > > >
>> > > > On Sat 29. Apr 2023 at 21.23, Khem Raj <raj.khem@gmail.com> wrote:
>> > > >>
>> > > >> its still triggering as error.
>> > > >>
>> > > >> On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
>> > > >> <alex.kanavin@gmail.com> wrote:
>> > > >> >
>> > > >> > Existing implementation required to list both specific problema=
tic apis, and files that
>> > > >> > use them: neither is necessary as both are seen in package_qa e=
rror messages, and
>> > > >> > can cause excessive amount of exception lines, if there are too=
 many files, or
>> > > >> > they are installed in arch-specific locations. Also, the value =
of INSANE_SKIP
>> > > >> > should be the test that needs to be skipped, and in this case i=
t wasn't.
>> > > >> >
>> > > >> > Also, all problematic recipes are now correctly listed.
>> > > >> >
>> > > >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > > >> > ---
>> > > >> >  meta/classes-global/insane.bbclass  | 14 +++-----------
>> > > >> >  meta/conf/distro/include/time64.inc | 18 ++++++++++++------
>> > > >> >  2 files changed, 15 insertions(+), 17 deletions(-)
>> > > >> >
>> > > >> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-=
global/insane.bbclass
>> > > >> > index ee34d5208d1..8788f58fc5b 100644
>> > > >> > --- a/meta/classes-global/insane.bbclass
>> > > >> > +++ b/meta/classes-global/insane.bbclass
>> > > >> > @@ -617,22 +617,14 @@ def check_32bit_symbols(path, packagename=
, d, elf, messages):
>> > > >> >              # At this point, any symbol information is strippe=
d into the debug
>> > > >> >              # package, so that is the only place we will find =
them.
>> > > >> >              elfpath =3D elfpath.replace('.debug/', '')
>> > > >> > -            allowed =3D (
>> > > >> > -                d.getVarFlag(
>> > > >> > -                    'INSANE_SKIP:' + d.getVar('PN'), elfpath.r=
eplace('/', '_')
>> > > >> > -                ) or ''
>> > > >> > -            ).split()
>> > > >> > -            usedapis -=3D set(allowed)
>> > > >> > -            if usedapis:
>> > > >> > +            allowed =3D "32bit-time" in (d.getVar('INSANE_SKIP=
') or '').split()
>> > > >> > +            if not allowed:
>> > > >> >                  msgformat =3D elfpath + " uses 32-bit api '%s'=
"
>> > > >> >                  for sym in usedapis:
>> > > >> >                      oe.qa.add_message(messages, '32bit-time', =
msgformat % sym)
>> > > >> >                  oe.qa.add_message(
>> > > >> >                      messages, '32bit-time',
>> > > >> > -                    'Suppress with INSANE_SKIP:%s[%s] =3D "%s"=
' % (
>> > > >> > -                        d.getVar('PN'), elfpath.replace('/', '=
_'),
>> > > >> > -                        ' '.join(usedapis)
>> > > >> > -                    )
>> > > >> > +                    'Suppress with INSANE_SKIP =3D "32bit-time=
"'
>> > > >> >                  )
>> > > >> >
>> > > >> >  # Check license variables
>> > > >> > diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/di=
stro/include/time64.inc
>> > > >> > index f3bdfba4acf..1a3399bc5e6 100644
>> > > >> > --- a/meta/conf/distro/include/time64.inc
>> > > >> > +++ b/meta/conf/distro/include/time64.inc
>> > > >> > @@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D ""
>> > > >> >  GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
>> > > >> >  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
>> > > >> >
>> > > >> > -INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueab=
ihf_lib_libstd.so] =3D "clock_gettime gettime fcntl fstat64 fstatat64 getso=
ckopt ioctl lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
>> > > >> > -INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] =3D "fcntl fstat64 =
prctl stat64 clock_gettime"
>> > > >> > -INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] =3D "fcntl l=
stat64 setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstatat=
64 prctl mktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
>> > > >> > -
>> > > >> > -# libpulsedsp.so is a preload-library that hooks libc function=
s
>> > > >> > -INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] =3D=
 "setsockopt fcntl"
>> > > >> > +INSANE_SKIP:append:pn-cargo =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-glibc =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-glibc-tests =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-librsvg =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-libstd-rs =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-pulseaudio =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-python3-bcrypt =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-python3-cryptography =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-rust =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-rust-hello-world =3D " 32bit-time"
>> > > >> > +INSANE_SKIP:append:pn-strace =3D " 32bit-time"
>> > > >> >
>> > > >> > --
>> > > >> > 2.30.2
>> > > >> >
>> > > >> >
>> > > >> >
>> > > >> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180583): https://lists.openembedded.org/g/openembedde=
d-core/message/180583
> Mute This Topic: https://lists.openembedded.org/mt/98511412/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

