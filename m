Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB668C77B73
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 05:16:29 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.63264.1682831782516555798
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 22:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Vj4JXS3W;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-18f4a6d2822so10938386fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 22:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682831782; x=1685423782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2YPaMyObzbL5BB7HspSmgau1bWtKcaf66UjC/kzzNo=;
        b=Vj4JXS3WD33TZV2QNFL2LFOVYF8Zv8UhySP35DR1M2neNz/7akRxjVDbJVp5uRoIky
         weDVmwldtnWYNLGLn12jYWwWk+ebOuue1gBCor27MoqntqbwncMsUw52pDamgny7exYE
         eIa2XTmTNyKX7omq/1NFzsXl1T7NOYsNgiYxTst+9YGN2lGbDdwtx7+j0VKWxlEpzBj7
         21SnGQRSRXVP+xhCFky8Te/ErEHbsTTHrVE/aLZNYDuQh+/SvrbTR179Ov2NMasBOC3m
         5raCYu3z9rfQkkumg3AmRDIT8/2JaxwgOppfXwQRi3BuMzknNb0cr9pxL2sT3RhUm6tJ
         idRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682831782; x=1685423782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2YPaMyObzbL5BB7HspSmgau1bWtKcaf66UjC/kzzNo=;
        b=K4l8VExmuJ/jt61ic2YVps9SrPj7a/kqUgAL0GLDPK892vJII/2hB2sSpC/1auUxSk
         Z5byeDYBf5FrVoXOjukMglQs9GBrEWnv4yTJZUNONOv1LvPMl0uEcuAfUpQt/kv+R/hS
         ZqwuIuptK42Z2O3KtlcYTzzFxlIefpmWwC72PmGluj2oLb5wvztxQd/2ib5UCpCOsW0A
         ijf7XrOxtaqfbo651Ay7ZOTPsZebPWByIkGPGB2XwUZPPAzOFcFNZbmgSOyo5KHkE6/T
         EESvCppDu97y+vqlpbcn26Cd5BQqo7QyS9whokeR+tQT62ybwfzcpnyZBqLDTvNv6ssi
         WSfQ==
X-Gm-Message-State: AC+VfDw6nELmh6OVHIVLrcv1ytfcWvxcfL/nL+pPdF9VwzpZXH6vWL/G
	OcbI8IVdWEAD7+RVs363V5fcsBVgU5Q9qKMcYl9fTSecwps=
X-Google-Smtp-Source: ACHHUZ5SX003qrEjbwrmDOzhzdENI3VZePSBXC2/KluYIjyTGrW/1r2v136fWNLFBm1aXcqfRH6ymMc/XF3czJMBl0o=
X-Received: by 2002:aca:f355:0:b0:390:621b:de11 with SMTP id
 r82-20020acaf355000000b00390621bde11mr6207809oih.29.1682831781585; Sat, 29
 Apr 2023 22:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-10-alex@linutronix.de>
 <CAMKF1sqM-WhYtLALHemrPC62qMaA4h41UNr_kP6brLvbdJ2j+w@mail.gmail.com> <CANNYZj-JbHNHLd1Dh5WAeBUoqLNwoKcdpeDH1UKkxhfsLZSfWQ@mail.gmail.com>
In-Reply-To: <CANNYZj-JbHNHLd1Dh5WAeBUoqLNwoKcdpeDH1UKkxhfsLZSfWQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Apr 2023 22:15:55 -0700
Message-ID: <CAMKF1sr108FSHSZ0sg7GEedTpfpuR=nnSY_MJGpprVBFzwNx-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/11] insane.bbclass: simplify exceptions for
 32 bit time API check
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 05:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180564

https://errors.yoctoproject.org/Errors/Build/163415/

On Sat, Apr 29, 2023 at 9:49=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Can I see the error please?
>
> Alex
>
> On Sat 29. Apr 2023 at 21.23, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> its still triggering as error.
>>
>> On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Existing implementation required to list both specific problematic api=
s, and files that
>> > use them: neither is necessary as both are seen in package_qa error me=
ssages, and
>> > can cause excessive amount of exception lines, if there are too many f=
iles, or
>> > they are installed in arch-specific locations. Also, the value of INSA=
NE_SKIP
>> > should be the test that needs to be skipped, and in this case it wasn'=
t.
>> >
>> > Also, all problematic recipes are now correctly listed.
>> >
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >  meta/classes-global/insane.bbclass  | 14 +++-----------
>> >  meta/conf/distro/include/time64.inc | 18 ++++++++++++------
>> >  2 files changed, 15 insertions(+), 17 deletions(-)
>> >
>> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/=
insane.bbclass
>> > index ee34d5208d1..8788f58fc5b 100644
>> > --- a/meta/classes-global/insane.bbclass
>> > +++ b/meta/classes-global/insane.bbclass
>> > @@ -617,22 +617,14 @@ def check_32bit_symbols(path, packagename, d, el=
f, messages):
>> >              # At this point, any symbol information is stripped into =
the debug
>> >              # package, so that is the only place we will find them.
>> >              elfpath =3D elfpath.replace('.debug/', '')
>> > -            allowed =3D (
>> > -                d.getVarFlag(
>> > -                    'INSANE_SKIP:' + d.getVar('PN'), elfpath.replace(=
'/', '_')
>> > -                ) or ''
>> > -            ).split()
>> > -            usedapis -=3D set(allowed)
>> > -            if usedapis:
>> > +            allowed =3D "32bit-time" in (d.getVar('INSANE_SKIP') or '=
').split()
>> > +            if not allowed:
>> >                  msgformat =3D elfpath + " uses 32-bit api '%s'"
>> >                  for sym in usedapis:
>> >                      oe.qa.add_message(messages, '32bit-time', msgform=
at % sym)
>> >                  oe.qa.add_message(
>> >                      messages, '32bit-time',
>> > -                    'Suppress with INSANE_SKIP:%s[%s] =3D "%s"' % (
>> > -                        d.getVar('PN'), elfpath.replace('/', '_'),
>> > -                        ' '.join(usedapis)
>> > -                    )
>> > +                    'Suppress with INSANE_SKIP =3D "32bit-time"'
>> >                  )
>> >
>> >  # Check license variables
>> > diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/in=
clude/time64.inc
>> > index f3bdfba4acf..1a3399bc5e6 100644
>> > --- a/meta/conf/distro/include/time64.inc
>> > +++ b/meta/conf/distro/include/time64.inc
>> > @@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D ""
>> >  GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
>> >  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
>> >
>> > -INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib=
_libstd.so] =3D "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt i=
octl lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
>> > -INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] =3D "fcntl fstat64 prctl s=
tat64 clock_gettime"
>> > -INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] =3D "fcntl lstat64 =
setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstatat64 prct=
l mktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
>> > -
>> > -# libpulsedsp.so is a preload-library that hooks libc functions
>> > -INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] =3D "setso=
ckopt fcntl"
>> > +INSANE_SKIP:append:pn-cargo =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-glibc =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-glibc-tests =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-librsvg =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-libstd-rs =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-pulseaudio =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-python3-bcrypt =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-python3-cryptography =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-rust =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-rust-hello-world =3D " 32bit-time"
>> > +INSANE_SKIP:append:pn-strace =3D " 32bit-time"
>> >
>> > --
>> > 2.30.2
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#180428): https://lists.openembedded.org/g/openembe=
dded-core/message/180428
>> > Mute This Topic: https://lists.openembedded.org/mt/98511412/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

