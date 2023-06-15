Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2F7EB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 07:07:09 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.12541.1686812823065271548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 00:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pp2lIPZx;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1a98a7fde3eso958150fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 00:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686812822; x=1689404822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fzo2exUPb9gRwQLMymkr+elbh+6L7Y0IFKaELjLRybM=;
        b=pp2lIPZxs1LsNxAV4Xz6tGWJMKl9nSiMaZDKXOOK9UTs7ZrhoPNZVEK71STtZAuIsk
         IaOmKt9MLxZTEj082hV4TgZYPYKHDWA3VfIwVZ4NMnUzf/oNEbDLT6vVgY8/QM8Xsavl
         OKXTb5kw8XDGGSjXrd4RC43a1LCKVdp/PSFjK4StEksoca4G4NE4oPx/h9En+F1/tD9r
         YsoQJ1azoBTr5cSzWTkaphJws1I/PDGiKuliLoqbqFJY1TYStNHIc12vUELbquWra6hd
         XUSd9gYcUXVt2Um6YYGM/gORCxPMMUPWqU2u3sEmn8sOrOz5i4iAjeVT/EBNgxqK0jRG
         JMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686812822; x=1689404822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fzo2exUPb9gRwQLMymkr+elbh+6L7Y0IFKaELjLRybM=;
        b=azgK6oUj5AuyHIxL7SG3GIF+cPqL3IZ9EbQG89k6TiwInDJW9njNg7562zN7meJ8oT
         vJ20u0KgnQGWVNJHiJGEzPKs0Sk80c7q1fIQ66DvoG4GvdsDEDI7dlXlAQcKNPN1WS0+
         SASEJXwOk2JYEm1OYvT9Y6yuLJt6C5dazVch/PHyjtdC52+TL65OycqUBEFT1rnc/6tV
         NZ0W2CBXSYLvIB3L2Fr4avfaIU+2cjLQfhYbEaYLCTi3HOzJBT9XqWB/shkAA8tgowph
         WBSUTclMgZWmshm9ehl+GmSF6ELN+pCQl5qME8mllNgqGIygTNWrClNHt7anukW2sCrA
         pipw==
X-Gm-Message-State: AC+VfDxQSHFuaI58VZaSeBS/jKWXe9dT/QhjovatXLedL1Deb7YfnSOw
	LFu87nQ3SStyrHzLeH6aygSUe/PsTi7vrkgWte8=
X-Google-Smtp-Source: ACHHUZ6ODZxO2dhpAcQuDhUJXRDZfBTfO9fMq2X0Z8J0//ApKgWlRSYPd17NZ6kcoYDpQftBfU/vVP28ZXKz4+RScZc=
X-Received: by 2002:a05:6870:d8aa:b0:19f:202b:5105 with SMTP id
 dv42-20020a056870d8aa00b0019f202b5105mr11088893oab.50.1686812821721; Thu, 15
 Jun 2023 00:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230531030126.5837-1-mark.hatle@amd.com> <176483072E4808AE.3142@lists.openembedded.org>
 <202306011654530a51e97e@mail.local> <CAMKF1soz3ep1ie63jz-3dAHD8yCtdKnSoYywACs08GmX9Sa3iQ@mail.gmail.com>
 <7671ff2e-d117-a9b1-026e-3852d707bfc1@loongson.cn>
In-Reply-To: <7671ff2e-d117-a9b1-026e-3852d707bfc1@loongson.cn>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jun 2023 00:06:35 -0700
Message-ID: <CAMKF1sqWgDN8rqoiH+YEGgf_M68okiP=ZdfUpFm9+JhcgQPsgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][pseudo] Move __*xstat* and __xmknod functions
 to new subport 'old__x'
To: =?UTF-8?B?5byg5a625bKt?= <zhangjialing@loongson.cn>
Cc: alexandre.belloni@bootlin.com, mark.hatle@amd.com, 
	openembedded-core@lists.openembedded.org, seebs@seebs.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 07:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182833

On Wed, Jun 14, 2023 at 11:32=E2=80=AFPM =E5=BC=A0=E5=AE=B6=E5=B2=AD <zhang=
jialing@loongson.cn> wrote:
>
> Hi Khem,
>
>      I noticed the issue you mentioned, I want to fix it , but I'm not
> sure how to reproduce it on my build machine .Please how can I debug
> this issue use  the autobuilder.yoctoproject.org builders .
>

add meta-clang to your layers and then
bitbake libcxx

>
>
>
> =E5=9C=A8 2023/6/11 01:03, Khem Raj =E5=86=99=E9=81=93:
> > I see another issue with libcxx when using meta-clang
> >
> > The error is here
> >
> > http://sprunge.us/SoBHMo
> >
> > On Thu, Jun 1, 2023 at 9:55=E2=80=AFAM Alexandre Belloni via
> > lists.openembedded.org
> > <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> >> On 01/06/2023 12:43:42+0200, Alexandre Belloni via lists.openembedded.=
org wrote:
> >>> Hello Mark,
> >>>
> >>> This causes failures on opensuse154 and debian11 workers. I've tried =
to
> >>> get pseudo.log for the failures but they are not present on debian11 =
and
> >>> are not interesting for opensuse154.
> >>>
> >>> debian11 failures look like that:
> >>>
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/718=
4/steps/12/logs/stdio
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/718=
4/steps/13/logs/stdio
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/715=
2/steps/12/logs/stdio
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/715=
2/steps/13/logs/stdio
> >>>
> >>> opensuse:
> >>>
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/28=
19/steps/14/logs/stdio
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/759=
7/steps/13/logs/stdio
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/721=
1/steps/13/logs/stdio
> >>>
> >>> stream8 is similar:
> >>>
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/29=
39/steps/13/logs/stdio
> >>>
> >>>
> >>> I also suspect this causes:
> >>>
> >>> ERROR: cmdline-shebang-wrapper-test-1.0-r0 do_install: Wrapper permis=
sions for /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-17=
82300/tmp/work/core2-64-poky-linux/cmdline-shebang-wrapper-test/1.0-r0/imag=
e/usr/bin/test.real not preserved. Found 600 but expected 400
> >>> ERROR: cmdline-shebang-wrapper-test-1.0-r0 do_install: ExecutionError=
('/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1782300/tm=
p/work/core2-64-poky-linux/cmdline-shebang-wrapper-test/1.0-r0/temp/run.do_=
install.322689', 1, None, None)
> >>> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-=
selftest-fedora/build/build-st-1782300/tmp/work/core2-64-poky-linux/cmdline=
-shebang-wrapper-test/1.0-r0/temp/log.do_install.322689
> >>> NOTE: recipe cmdline-shebang-wrapper-test-1.0-r0: task do_install: Fa=
iled
> >>> ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-fedora/build/bu=
ild-st-1782300/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-t=
est.bb:do_install) failed with exit code '1'
> >>>
> >> For the record, it also broke systemd on the target with ubuntu or
> >> fedora workers:
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/257=
6/steps/13/logs/stdio
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/608=
5/steps/13/logs/stdio
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/466=
1/steps/13/logs/stdio
> >>
> >>
> >>>
> >>> On 30/05/2023 20:01:26-0700, Mark Hatle via lists.openembedded.org wr=
ote:
> >>>> Changes to eliminate __*.c function usage were based on the patch:
> >>>>
> >>>>     From: JiaLing Zhang <zhangjialing@loongson.cn>
> >>>>     Subject: [OE-core] [PATCH v4] Fixes pseudo build in loongarch64
> >>>>
> >>>>     Fixes [YOCTO #15110]
> >>>>
> >>>>     Some functions used in the project have been removed from glibc.=
 After the removal of these functions,
> >>>>     the architecture in glibc will not include the removed functions=
.
> >>>>     This patch resolves the usage and compilation issues on the loon=
garch64 architecture
> >>>>
> >>>>     Signed-off-by: JiaLing Zhang <zhangjialing@loongson.cn>
> >>>>
> >>>> This code is NOT loongarch64 specific, but implements support for ne=
wer
> >>>> glibc where the __*x*stat and __xmknod* functions are no longer pres=
ent
> >>>> in headers as of roughly glibc 2.33.
> >>>>
> >>>> The functions, on x86, x86_64 and aarch64 may still be present for
> >>>> compatibility but new software should no longer be using it.  Pseudo
> >>>> can likely change it's default behavior unless support for really ol=
d
> >>>> hosts is still desired.
> >>>>
> >>>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> >>>> ---
> >>>>   ports/linux/guts/fopen64.c                   |  4 +-
> >>>>   ports/linux/guts/freopen64.c                 |  4 +-
> >>>>   ports/linux/guts/fstat.c                     |  8 ++-
> >>>>   ports/linux/guts/fstat64.c                   | 14 +++-
> >>>>   ports/linux/guts/fstatat.c                   |  9 ++-
> >>>>   ports/linux/guts/fstatat64.c                 | 42 +++++++++++-
> >>>>   ports/linux/guts/lstat.c                     |  2 +-
> >>>>   ports/linux/guts/lstat64.c                   |  2 +-
> >>>>   ports/linux/guts/mknod.c                     |  2 +-
> >>>>   ports/linux/guts/mknodat.c                   | 71 ++++++++++++++++=
+++-
> >>>>   ports/linux/guts/mkostemp64.c                |  2 +-
> >>>>   ports/linux/guts/openat.c                    | 18 ++---
> >>>>   ports/linux/guts/stat.c                      |  2 +-
> >>>>   ports/linux/guts/stat64.c                    |  2 +-
> >>>>   ports/linux/old__x/README                    | 28 ++++++++
> >>>>   ports/linux/{ =3D> old__x}/guts/__fxstat.c     |  0
> >>>>   ports/linux/{ =3D> old__x}/guts/__fxstat64.c   |  0
> >>>>   ports/linux/{ =3D> old__x}/guts/__fxstatat.c   |  0
> >>>>   ports/linux/{ =3D> old__x}/guts/__fxstatat64.c |  0
> >>>>   ports/linux/{ =3D> old__x}/guts/__lxstat.c     |  0
> >>>>   ports/linux/{ =3D> old__x}/guts/__lxstat64.c   |  0
> >>>>   ports/linux/{ =3D> old__x}/guts/__xmknod.c     |  0
> >>>>   ports/linux/{ =3D> old__x}/guts/__xmknodat.c   |  0
> >>>>   ports/linux/{ =3D> old__x}/guts/__xstat.c      |  0
> >>>>   ports/linux/{ =3D> old__x}/guts/__xstat64.c    |  0
> >>>>   ports/linux/old__x/guts/fstat.c              | 15 +++++
> >>>>   ports/linux/old__x/guts/fstat64.c            | 15 +++++
> >>>>   ports/linux/old__x/guts/fstatat.c            | 15 +++++
> >>>>   ports/linux/old__x/guts/fstatat64.c          | 15 +++++
> >>>>   ports/linux/old__x/guts/lstat.c              | 15 +++++
> >>>>   ports/linux/old__x/guts/lstat64.c            | 15 +++++
> >>>>   ports/linux/old__x/guts/mknod.c              | 15 +++++
> >>>>   ports/linux/old__x/guts/mknodat.c            | 15 +++++
> >>>>   ports/linux/old__x/guts/mkostemp64.c         | 53 +++++++++++++++
> >>>>   ports/linux/old__x/portdefs.h                | 40 +++++++++++
> >>>>   ports/linux/old__x/pseudo_wrappers.c         | 48 +++++++++++++
> >>>>   ports/linux/old__x/wrapfuncs.in              | 18 +++++
> >>>>   ports/linux/portdefs.h                       | 19 ------
> >>>>   ports/linux/pseudo_wrappers.c                | 43 ------------
> >>>>   ports/linux/subports                         | 15 +++++
> >>>>   ports/linux/wrapfuncs.in                     | 26 +++----
> >>>>   pseudo_client.h                              | 38 +++++++++--
> >>>>   42 files changed, 520 insertions(+), 110 deletions(-)
> >>>>   create mode 100644 ports/linux/old__x/README
> >>>>   rename ports/linux/{ =3D> old__x}/guts/__fxstat.c (100%)
> >>>>   rename ports/linux/{ =3D> old__x}/guts/__fxstat64.c (100%)
> >>>>   rename ports/linux/{ =3D> old__x}/guts/__fxstatat.c (100%)
> >>>>   rename ports/linux/{ =3D> old__x}/guts/__fxstatat64.c (100%)
> >>>>   rename ports/linux/{ =3D> old__x}/guts/__lxstat.c (100%)
> >>>>   rename ports/linux/{ =3D> old__x}/guts/__lxstat64.c (100%)
> >>>>   rename ports/linux/{ =3D> old__x}/guts/__xmknod.c (100%)
> >>>>   rename ports/linux/{ =3D> old__x}/guts/__xmknodat.c (100%)
> >>>>   rename ports/linux/{ =3D> old__x}/guts/__xstat.c (100%)
> >>>>   rename ports/linux/{ =3D> old__x}/guts/__xstat64.c (100%)
> >>>>   create mode 100644 ports/linux/old__x/guts/fstat.c
> >>>>   create mode 100644 ports/linux/old__x/guts/fstat64.c
> >>>>   create mode 100644 ports/linux/old__x/guts/fstatat.c
> >>>>   create mode 100644 ports/linux/old__x/guts/fstatat64.c
> >>>>   create mode 100644 ports/linux/old__x/guts/lstat.c
> >>>>   create mode 100644 ports/linux/old__x/guts/lstat64.c
> >>>>   create mode 100644 ports/linux/old__x/guts/mknod.c
> >>>>   create mode 100644 ports/linux/old__x/guts/mknodat.c
> >>>>   create mode 100644 ports/linux/old__x/guts/mkostemp64.c
> >>>>   create mode 100644 ports/linux/old__x/portdefs.h
> >>>>   create mode 100644 ports/linux/old__x/pseudo_wrappers.c
> >>>>   create mode 100644 ports/linux/old__x/wrapfuncs.in
> >>>>
> >>>> diff --git a/ports/linux/guts/fopen64.c b/ports/linux/guts/fopen64.c
> >>>> index e76da69..33ccd3a 100644
> >>>> --- a/ports/linux/guts/fopen64.c
> >>>> +++ b/ports/linux/guts/fopen64.c
> >>>> @@ -11,7 +11,7 @@
> >>>>      struct stat64 buf;
> >>>>      int save_errno;
> >>>>
> >>>> -   int existed =3D (real___xstat64(_STAT_VER, path, &buf) !=3D -1);
> >>>> +   int existed =3D (base_stat64(path, &buf) !=3D -1);
> >>>>
> >>>>      rc =3D real_fopen64(path, mode);
> >>>>      save_errno =3D errno;
> >>>> @@ -20,7 +20,7 @@
> >>>>              int fd =3D fileno(rc);
> >>>>
> >>>>              pseudo_debug(PDBGF_FILE, "fopen64 '%s': fd %d <FILE %p>=
\n", path, fd, (void *) rc);
> >>>> -           if (real___fxstat64(_STAT_VER, fd, &buf) !=3D -1) {
> >>>> +           if (base_fstat64(fd, &buf) !=3D -1) {
> >>>>                      if (!existed) {
> >>>>                              real_fchmod(fd, PSEUDO_FS_MODE(0666 & ~=
pseudo_umask, 0));
> >>>>                              pseudo_client_op(OP_CREAT, 0, -1, -1, p=
ath, &buf);
> >>>> diff --git a/ports/linux/guts/freopen64.c b/ports/linux/guts/freopen=
64.c
> >>>> index 5fc9073..9bcc06a 100644
> >>>> --- a/ports/linux/guts/freopen64.c
> >>>> +++ b/ports/linux/guts/freopen64.c
> >>>> @@ -10,7 +10,7 @@
> >>>>    */
> >>>>      struct stat64 buf;
> >>>>      int save_errno;
> >>>> -   int existed =3D (real___xstat64(_STAT_VER, path, &buf) !=3D -1);
> >>>> +   int existed =3D (base_stat64(path, &buf) !=3D -1);
> >>>>
> >>>>      rc =3D real_freopen64(path, mode, stream);
> >>>>      save_errno =3D errno;
> >>>> @@ -19,7 +19,7 @@
> >>>>              int fd =3D fileno(rc);
> >>>>
> >>>>              pseudo_debug(PDBGF_FILE, "freopen64 '%s': fd %d\n", pat=
h, fd);
> >>>> -           if (real___fxstat64(_STAT_VER, fd, &buf) !=3D -1) {
> >>>> +           if (base_fstat64(fd, &buf) !=3D -1) {
> >>>>                      if (!existed) {
> >>>>                              real_fchmod(fd, PSEUDO_FS_MODE(0666 & ~=
pseudo_umask, 0));
> >>>>                              pseudo_client_op(OP_CREAT, 0, -1, -1, p=
ath, &buf);
> >>>> diff --git a/ports/linux/guts/fstat.c b/ports/linux/guts/fstat.c
> >>>> index b089b15..80933e2 100644
> >>>> --- a/ports/linux/guts/fstat.c
> >>>> +++ b/ports/linux/guts/fstat.c
> >>>> @@ -8,7 +8,13 @@
> >>>>    * int rc =3D -1;
> >>>>    */
> >>>>
> >>>> -   rc =3D wrap___fxstat(_STAT_VER, fd, buf);
> >>>> +   struct stat64 buf64;
> >>>> +   /* populate buffer with complete data */
> >>>> +   real_fstat(fd, buf);
> >>>> +   /* obtain fake data */
> >>>> +   rc =3D wrap_fstat64(fd, &buf64);
> >>>> +   /* overwrite */
> >>>> +   pseudo_stat32_from64(buf, &buf64);
> >>>>
> >>>>   /* return rc;
> >>>>    * }
> >>>> diff --git a/ports/linux/guts/fstat64.c b/ports/linux/guts/fstat64.c
> >>>> index 6dd97da..22d46a9 100644
> >>>> --- a/ports/linux/guts/fstat64.c
> >>>> +++ b/ports/linux/guts/fstat64.c
> >>>> @@ -8,8 +8,20 @@
> >>>>    * int rc =3D -1;
> >>>>    */
> >>>>
> >>>> -   rc =3D wrap___fxstat64(_STAT_VER, fd, buf);
> >>>> +   pseudo_msg_t *msg;
> >>>> +   int save_errno;
> >>>>
> >>>> +   rc =3D real_fstat64(fd, buf);
> >>>> +   save_errno =3D errno;
> >>>> +   if (rc =3D=3D -1) {
> >>>> +           return rc;
> >>>> +   }
> >>>> +   msg =3D pseudo_client_op(OP_FSTAT, 0, fd, -1, 0, buf);
> >>>> +   if (msg && msg->result =3D=3D RESULT_SUCCEED) {
> >>>> +           pseudo_stat_msg(buf, msg);
> >>>> +   }
> >>>> +
> >>>> +   errno =3D save_errno;
> >>>>   /* return rc;
> >>>>    * }
> >>>>    */
> >>>> diff --git a/ports/linux/guts/fstatat.c b/ports/linux/guts/fstatat.c
> >>>> index 3267641..7b9652d 100644
> >>>> --- a/ports/linux/guts/fstatat.c
> >>>> +++ b/ports/linux/guts/fstatat.c
> >>>> @@ -1,4 +1,5 @@
> >>>>   /*
> >>>> + * Copyright (c) 2008-2010 Wind River Systems; see
> >>>>    * Copyright (c) 2021 Linux Foundation; see
> >>>>    * guts/COPYRIGHT for information.
> >>>>    *
> >>>> @@ -8,7 +9,13 @@
> >>>>    * int rc =3D -1;
> >>>>    */
> >>>>
> >>>> -   rc =3D wrap___fxstatat(_STAT_VER, dirfd, path, buf, flags);
> >>>> +   struct stat64 buf64;
> >>>> +   /* populate buffer with complete data */
> >>>> +   real_fstatat(dirfd, path, buf, flags);
> >>>> +   /* obtain fake data */
> >>>> +   rc =3D wrap_fstatat64(dirfd, path, &buf64, flags);
> >>>> +   /* overwrite */
> >>>> +   pseudo_stat32_from64(buf, &buf64);
> >>>>
> >>>>   /* return rc;
> >>>>    * }
> >>>> diff --git a/ports/linux/guts/fstatat64.c b/ports/linux/guts/fstatat=
64.c
> >>>> index c981e14..13c1143 100644
> >>>> --- a/ports/linux/guts/fstatat64.c
> >>>> +++ b/ports/linux/guts/fstatat64.c
> >>>> @@ -1,4 +1,5 @@
> >>>>   /*
> >>>> + * Copyright (c) 2008-2010 Wind River Systems;
> >>>>    * Copyright (c) 2021 Linux Foundation; see
> >>>>    * guts/COPYRIGHT for information.
> >>>>    *
> >>>> @@ -8,7 +9,46 @@
> >>>>    * int rc =3D -1;
> >>>>    */
> >>>>
> >>>> -   rc =3D wrap___fxstatat64(_STAT_VER, dirfd, path, buf, flags);
> >>>> +   pseudo_msg_t *msg;
> >>>> +   int save_errno;
> >>>> +
> >>>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> >>>> +   if (dirfd !=3D AT_FDCWD) {
> >>>> +           errno =3D ENOSYS;
> >>>> +           return -1;
> >>>> +   }
> >>>> +#endif
> >>>> +   if (flags & AT_SYMLINK_NOFOLLOW) {
> >>>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> >>>> +           rc =3D real_lstat64(path, buf);
> >>>> +#else
> >>>> +           rc =3D real_fstatat64(dirfd, path, buf, flags);
> >>>> +#endif
> >>>> +           if (rc =3D=3D -1) {
> >>>> +                   return rc;
> >>>> +           }
> >>>> +   } else {
> >>>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> >>>> +           rc =3D real_stat64(path, buf);
> >>>> +#else
> >>>> +           rc =3D real_fstatat64(dirfd, path, buf, flags);
> >>>> +#endif
> >>>> +           if (rc =3D=3D -1) {
> >>>> +                   return rc;
> >>>> +           }
> >>>> +   }
> >>>> +   save_errno =3D errno;
> >>>> +
> >>>> +   /* query database
> >>>> +    * note that symlink canonicalizing is now automatic, so we
> >>>> +    * don't need to check for a symlink on this end
> >>>> +    */
> >>>> +   msg =3D pseudo_client_op(OP_STAT, 0, -1, dirfd, path, buf);
> >>>> +   if (msg && msg->result =3D=3D RESULT_SUCCEED) {
> >>>> +           pseudo_stat_msg(buf, msg);
> >>>> +   }
> >>>> +
> >>>> +   errno =3D save_errno;
> >>>>
> >>>>   /* return rc;
> >>>>    * }
> >>>> diff --git a/ports/linux/guts/lstat.c b/ports/linux/guts/lstat.c
> >>>> index d2c4d50..0bc9362 100644
> >>>> --- a/ports/linux/guts/lstat.c
> >>>> +++ b/ports/linux/guts/lstat.c
> >>>> @@ -8,7 +8,7 @@
> >>>>    * int rc =3D -1;
> >>>>    */
> >>>>
> >>>> -   rc =3D wrap___fxstatat(_STAT_VER, AT_FDCWD, path, buf, AT_SYMLIN=
K_NOFOLLOW);
> >>>> +   rc =3D wrap_fstatat(AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
> >>>>
> >>>>   /* return rc;
> >>>>    * }
> >>>> diff --git a/ports/linux/guts/lstat64.c b/ports/linux/guts/lstat64.c
> >>>> index 43d0ce1..9e0ff19 100644
> >>>> --- a/ports/linux/guts/lstat64.c
> >>>> +++ b/ports/linux/guts/lstat64.c
> >>>> @@ -8,7 +8,7 @@
> >>>>    * int rc =3D -1;
> >>>>    */
> >>>>
> >>>> -   rc =3D wrap___fxstatat64(_STAT_VER, AT_FDCWD, path, buf, AT_SYML=
INK_NOFOLLOW);
> >>>> +   rc =3D wrap_fstatat64(AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
> >>>>
> >>>>   /* return rc;
> >>>>    * }
> >>>> diff --git a/ports/linux/guts/mknod.c b/ports/linux/guts/mknod.c
> >>>> index 61fd320..66787c0 100644
> >>>> --- a/ports/linux/guts/mknod.c
> >>>> +++ b/ports/linux/guts/mknod.c
> >>>> @@ -8,7 +8,7 @@
> >>>>    * int rc =3D -1;
> >>>>    */
> >>>>
> >>>> -   rc =3D wrap___xmknod(_MKNOD_VER, path, mode, &dev);
> >>>> +   rc =3D wrap_mknodat(AT_FDCWD, path, mode, dev);
> >>>>
> >>>>   /* return rc;
> >>>>    * }
> >>>> diff --git a/ports/linux/guts/mknodat.c b/ports/linux/guts/mknodat.c
> >>>> index a7e4293..c51a82d 100644
> >>>> --- a/ports/linux/guts/mknodat.c
> >>>> +++ b/ports/linux/guts/mknodat.c
> >>>> @@ -1,4 +1,5 @@
> >>>>   /*
> >>>> + * Copyright (c) 2008-2010 Wind River Systems; see
> >>>>    * Copyright (c) 2016 Wind River Systems; see
> >>>>    * guts/COPYRIGHT for information.
> >>>>    *
> >>>> @@ -8,7 +9,75 @@
> >>>>    * int rc =3D -1;
> >>>>    */
> >>>>
> >>>> -   rc =3D wrap___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
> >>>> +   pseudo_msg_t *msg;
> >>>> +   struct stat64 buf;
> >>>> +
> >>>> +   /* mask out mode bits appropriately */
> >>>> +   mode =3D mode & ~pseudo_umask;
> >>>> +        /* if you don't specify a type, assume regular file */
> >>>> +        if (!(mode & S_IFMT)) {
> >>>> +                mode |=3D S_IFREG;
> >>>> +        }
> >>>> +        pseudo_debug(PDBGF_FILE, "mknodat creating '%s', mode 0%o\n=
",
> >>>> +                path ? path : "<no name>", (int) mode);
> >>>> +
> >>>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> >>>> +   if (dirfd !=3D AT_FDCWD) {
> >>>> +           errno =3D ENOSYS;
> >>>> +           return -1;
> >>>> +   }
> >>>> +   rc =3D real_stat64(path, &buf);
> >>>> +#else
> >>>> +   rc =3D real_fstatat64(dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
> >>>> +#endif
> >>>> +   if (rc !=3D -1) {
> >>>> +           /* if we can stat the file, you can't mknod it */
> >>>> +           errno =3D EEXIST;
> >>>> +           return -1;
> >>>> +   }
> >>>> +   if (!dev) {
> >>>> +           errno =3D EINVAL;
> >>>> +           return -1;
> >>>> +   }
> >>>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> >>>> +   rc =3D real_open(path, O_CREAT | O_WRONLY | O_EXCL,
> >>>> +           PSEUDO_FS_MODE(mode, 0));
> >>>> +#else
> >>>> +   rc =3D real_openat(dirfd, path, O_CREAT | O_WRONLY | O_EXCL,
> >>>> +           PSEUDO_FS_MODE(mode, 0));
> >>>> +#endif
> >>>> +   if (rc =3D=3D -1) {
> >>>> +           return -1;
> >>>> +   }
> >>>> +   real_fchmod(rc, PSEUDO_FS_MODE(mode, 0));
> >>>> +   real_fstat64(rc, &buf);
> >>>> +   /* mknod does not really open the file.  We don't have
> >>>> +    * to use wrap_close because we've never exposed this file
> >>>> +    * descriptor to the client code.
> >>>> +    */
> >>>> +   real_close(rc);
> >>>> +
> >>>> +   /* mask in the mode type bits again */
> >>>> +   buf.st_mode =3D (PSEUDO_DB_MODE(buf.st_mode, mode) & 07777) |
> >>>> +                   (mode & ~07777);
> >>>> +   buf.st_rdev =3D dev;
> >>>> +   msg =3D pseudo_client_op(OP_MKNOD, 0, -1, dirfd, path, &buf);
> >>>> +   if (msg && msg->result !=3D RESULT_SUCCEED) {
> >>>> +           errno =3D EPERM;
> >>>> +           rc =3D -1;
> >>>> +   } else {
> >>>> +           /* just pretend we worked */
> >>>> +           rc =3D 0;
> >>>> +   }
> >>>> +   if (rc =3D=3D -1) {
> >>>> +           int save_errno =3D errno;
> >>>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> >>>> +           real_unlink(path);
> >>>> +#else
> >>>> +           real_unlinkat(dirfd, path, AT_SYMLINK_NOFOLLOW);
> >>>> +#endif
> >>>> +           errno =3D save_errno;
> >>>> +   }
> >>>>
> >>>>   /* return rc;
> >>>>    * }
> >>>> diff --git a/ports/linux/guts/mkostemp64.c b/ports/linux/guts/mkoste=
mp64.c
> >>>> index 502211b..694070b 100644
> >>>> --- a/ports/linux/guts/mkostemp64.c
> >>>> +++ b/ports/linux/guts/mkostemp64.c
> >>>> @@ -35,7 +35,7 @@
> >>>>      if (rc !=3D -1) {
> >>>>              save_errno =3D errno;
> >>>>
> >>>> -           if (real___fxstat64(_STAT_VER, rc, &buf) !=3D -1) {
> >>>> +           if (base_fstat64(rc, &buf) !=3D -1) {
> >>>>                      real_fchmod(rc, PSEUDO_FS_MODE(0600, 0));
> >>>>                      pseudo_client_op(OP_CREAT, 0, -1, -1, tmp_templ=
ate, &buf);
> >>>>                      pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE,=
 rc, -1, tmp_template, &buf);
> >>>> diff --git a/ports/linux/guts/openat.c b/ports/linux/guts/openat.c
> >>>> index 656ac2b..d027154 100644
> >>>> --- a/ports/linux/guts/openat.c
> >>>> +++ b/ports/linux/guts/openat.c
> >>>> @@ -56,12 +56,12 @@
> >>>>              save_errno =3D errno;
> >>>>   #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> >>>>              if (flags & O_NOFOLLOW) {
> >>>> -                   rc =3D real___lxstat64(_STAT_VER, path, &buf);
> >>>> +                   rc =3D base_lstat64(path, &buf);
> >>>>              } else {
> >>>> -                   rc =3D real___xstat64(_STAT_VER, path, &buf);
> >>>> +                   rc =3D base_stat64(path, &buf);
> >>>>              }
> >>>>   #else
> >>>> -           rc =3D real___fxstatat64(_STAT_VER, dirfd, path, &buf, (=
flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
> >>>> +           rc =3D base_fstatat64(dirfd, path, &buf, (flags & O_NOFO=
LLOW) ? AT_SYMLINK_NOFOLLOW : 0);
> >>>>   #endif
> >>>>              existed =3D (rc !=3D -1);
> >>>>              if (!existed)
> >>>> @@ -77,12 +77,12 @@
> >>>>              save_errno =3D errno;
> >>>>   #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> >>>>              if (flags & O_NOFOLLOW) {
> >>>> -                   rc =3D real___lxstat64(_STAT_VER, path, &buf);
> >>>> +                   rc =3D base_lstat64(path, &buf);
> >>>>              } else {
> >>>> -                   rc =3D real___xstat64(_STAT_VER, path, &buf);
> >>>> +                   rc =3D base_stat64(path, &buf);
> >>>>              }
> >>>>   #else
> >>>> -           rc =3D real___fxstatat64(_STAT_VER, dirfd, path, &buf, (=
flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
> >>>> +           rc =3D base_fstatat64(dirfd, path, &buf, (flags & O_NOFO=
LLOW) ? AT_SYMLINK_NOFOLLOW : 0);
> >>>>   #endif
> >>>>              if (rc !=3D -1 && S_ISFIFO(buf.st_mode)) {
> >>>>                      overly_magic_nonblocking =3D 1;
> >>>> @@ -135,12 +135,12 @@
> >>>>   #endif
> >>>>   #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> >>>>              if (flags & O_NOFOLLOW) {
> >>>> -                   stat_rc =3D real___lxstat64(_STAT_VER, path, &bu=
f);
> >>>> +                   stat_rc =3D base_lstat64(path, &buf);
> >>>>              } else {
> >>>> -                   stat_rc =3D real___xstat64(_STAT_VER, path, &buf=
);
> >>>> +                   stat_rc =3D base_xstat64(path, &buf);
> >>>>              }
> >>>>   #else
> >>>> -           stat_rc =3D real___fxstatat64(_STAT_VER, dirfd, path, &b=
uf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
> >>>> +           stat_rc =3D base_fstatat64(dirfd, path, &buf, (flags & O=
_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
> >>>>   #endif
> >>>>
> >>>>              pseudo_debug(PDBGF_FILE, "openat(path %s), flags %o, st=
at rc %d, stat mode %o\n",
> >>>> diff --git a/ports/linux/guts/stat.c b/ports/linux/guts/stat.c
> >>>> index f8c73f7..ccd00db 100644
> >>>> --- a/ports/linux/guts/stat.c
> >>>> +++ b/ports/linux/guts/stat.c
> >>>> @@ -8,7 +8,7 @@
> >>>>    * int rc =3D -1;
> >>>>    */
> >>>>
> >>>> -   rc =3D wrap___fxstatat(_STAT_VER, AT_FDCWD, path, buf, 0);
> >>>> +   rc =3D wrap_fstatat(AT_FDCWD, path, buf, 0);
> >>>>
> >>>>   /* return rc;
> >>>>    * }
> >>>> diff --git a/ports/linux/guts/stat64.c b/ports/linux/guts/stat64.c
> >>>> index d8b3f36..391a73f 100644
> >>>> --- a/ports/linux/guts/stat64.c
> >>>> +++ b/ports/linux/guts/stat64.c
> >>>> @@ -8,7 +8,7 @@
> >>>>    * int rc =3D -1;
> >>>>    */
> >>>>
> >>>> -   rc =3D wrap___fxstatat64(_STAT_VER, AT_FDCWD, path, buf, 0);
> >>>> +   rc =3D wrap_fstatat64(AT_FDCWD, path, buf, 0);
> >>>>
> >>>>   /* return rc;
> >>>>    * }
> >>>> diff --git a/ports/linux/old__x/README b/ports/linux/old__x/README
> >>>> new file mode 100644
> >>>> index 0000000..c94413f
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/README
> >>>> @@ -0,0 +1,28 @@
> >>>> +Older glibcs contain stat functions such as:
> >>>> +
> >>>> +__fxstat
> >>>> +__fxstatat
> >>>> +__lxstat
> >>>> +__xstat
> >>>> +
> >>>> +__fxstat64
> >>>> +__fxstatat64
> >>>> +__lxstat64
> >>>> +__xstat64
> >>>> +
> >>>> +The format of these functions use the _STAT_VER defintion.  New gli=
bc no
> >>>> +longer define or utilize these functions, so neither can we.
> >>>> +
> >>>> +We only use this subport when the functions are present, this is ch=
ecked
> >>>> +by with the existence of _STAT_VER.
> >>>> +
> >>>> +Older glibcs also contain mknod functions such as:
> >>>> +
> >>>> +__xmknod
> >>>> +__xmknodat
> >>>> +
> >>>> +The format of these functions use the _MKNOD_VER defintion.  New gl=
ibc no
> >>>> +longer define or utilize these functions, so neither can we.
> >>>> +
> >>>> +We only use this subport when the functions are present, this is ch=
ecked
> >>>> +by with the existence of _MKNOD_VER.
> >>>> diff --git a/ports/linux/guts/__fxstat.c b/ports/linux/old__x/guts/_=
_fxstat.c
> >>>> similarity index 100%
> >>>> rename from ports/linux/guts/__fxstat.c
> >>>> rename to ports/linux/old__x/guts/__fxstat.c
> >>>> diff --git a/ports/linux/guts/__fxstat64.c b/ports/linux/old__x/guts=
/__fxstat64.c
> >>>> similarity index 100%
> >>>> rename from ports/linux/guts/__fxstat64.c
> >>>> rename to ports/linux/old__x/guts/__fxstat64.c
> >>>> diff --git a/ports/linux/guts/__fxstatat.c b/ports/linux/old__x/guts=
/__fxstatat.c
> >>>> similarity index 100%
> >>>> rename from ports/linux/guts/__fxstatat.c
> >>>> rename to ports/linux/old__x/guts/__fxstatat.c
> >>>> diff --git a/ports/linux/guts/__fxstatat64.c b/ports/linux/old__x/gu=
ts/__fxstatat64.c
> >>>> similarity index 100%
> >>>> rename from ports/linux/guts/__fxstatat64.c
> >>>> rename to ports/linux/old__x/guts/__fxstatat64.c
> >>>> diff --git a/ports/linux/guts/__lxstat.c b/ports/linux/old__x/guts/_=
_lxstat.c
> >>>> similarity index 100%
> >>>> rename from ports/linux/guts/__lxstat.c
> >>>> rename to ports/linux/old__x/guts/__lxstat.c
> >>>> diff --git a/ports/linux/guts/__lxstat64.c b/ports/linux/old__x/guts=
/__lxstat64.c
> >>>> similarity index 100%
> >>>> rename from ports/linux/guts/__lxstat64.c
> >>>> rename to ports/linux/old__x/guts/__lxstat64.c
> >>>> diff --git a/ports/linux/guts/__xmknod.c b/ports/linux/old__x/guts/_=
_xmknod.c
> >>>> similarity index 100%
> >>>> rename from ports/linux/guts/__xmknod.c
> >>>> rename to ports/linux/old__x/guts/__xmknod.c
> >>>> diff --git a/ports/linux/guts/__xmknodat.c b/ports/linux/old__x/guts=
/__xmknodat.c
> >>>> similarity index 100%
> >>>> rename from ports/linux/guts/__xmknodat.c
> >>>> rename to ports/linux/old__x/guts/__xmknodat.c
> >>>> diff --git a/ports/linux/guts/__xstat.c b/ports/linux/old__x/guts/__=
xstat.c
> >>>> similarity index 100%
> >>>> rename from ports/linux/guts/__xstat.c
> >>>> rename to ports/linux/old__x/guts/__xstat.c
> >>>> diff --git a/ports/linux/guts/__xstat64.c b/ports/linux/old__x/guts/=
__xstat64.c
> >>>> similarity index 100%
> >>>> rename from ports/linux/guts/__xstat64.c
> >>>> rename to ports/linux/old__x/guts/__xstat64.c
> >>>> diff --git a/ports/linux/old__x/guts/fstat.c b/ports/linux/old__x/gu=
ts/fstat.c
> >>>> new file mode 100644
> >>>> index 0000000..b089b15
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/guts/fstat.c
> >>>> @@ -0,0 +1,15 @@
> >>>> +/*
> >>>> + * Copyright (c) 2011 Wind River Systems; see
> >>>> + * guts/COPYRIGHT for information.
> >>>> + *
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + * int fstat(int fd, struct stat *buf)
> >>>> + * int rc =3D -1;
> >>>> + */
> >>>> +
> >>>> +   rc =3D wrap___fxstat(_STAT_VER, fd, buf);
> >>>> +
> >>>> +/* return rc;
> >>>> + * }
> >>>> + */
> >>>> diff --git a/ports/linux/old__x/guts/fstat64.c b/ports/linux/old__x/=
guts/fstat64.c
> >>>> new file mode 100644
> >>>> index 0000000..6dd97da
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/guts/fstat64.c
> >>>> @@ -0,0 +1,15 @@
> >>>> +/*
> >>>> + * Copyright (c) 2012 Wind River Systems; see
> >>>> + * guts/COPYRIGHT for information.
> >>>> + *
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + * int fstat64(int fd, struct stat *buf)
> >>>> + * int rc =3D -1;
> >>>> + */
> >>>> +
> >>>> +   rc =3D wrap___fxstat64(_STAT_VER, fd, buf);
> >>>> +
> >>>> +/* return rc;
> >>>> + * }
> >>>> + */
> >>>> diff --git a/ports/linux/old__x/guts/fstatat.c b/ports/linux/old__x/=
guts/fstatat.c
> >>>> new file mode 100644
> >>>> index 0000000..3267641
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/guts/fstatat.c
> >>>> @@ -0,0 +1,15 @@
> >>>> +/*
> >>>> + * Copyright (c) 2021 Linux Foundation; see
> >>>> + * guts/COPYRIGHT for information.
> >>>> + *
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + * int fstatat(int dirfd, const char *path, struct stat *buf, int f=
lags)
> >>>> + * int rc =3D -1;
> >>>> + */
> >>>> +
> >>>> +   rc =3D wrap___fxstatat(_STAT_VER, dirfd, path, buf, flags);
> >>>> +
> >>>> +/* return rc;
> >>>> + * }
> >>>> + */
> >>>> diff --git a/ports/linux/old__x/guts/fstatat64.c b/ports/linux/old__=
x/guts/fstatat64.c
> >>>> new file mode 100644
> >>>> index 0000000..c981e14
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/guts/fstatat64.c
> >>>> @@ -0,0 +1,15 @@
> >>>> +/*
> >>>> + * Copyright (c) 2021 Linux Foundation; see
> >>>> + * guts/COPYRIGHT for information.
> >>>> + *
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + * int fstatat64(int dirfd, const char *path, struct stat64 *buf, i=
nt flags)
> >>>> + * int rc =3D -1;
> >>>> + */
> >>>> +
> >>>> +   rc =3D wrap___fxstatat64(_STAT_VER, dirfd, path, buf, flags);
> >>>> +
> >>>> +/* return rc;
> >>>> + * }
> >>>> + */
> >>>> diff --git a/ports/linux/old__x/guts/lstat.c b/ports/linux/old__x/gu=
ts/lstat.c
> >>>> new file mode 100644
> >>>> index 0000000..d2c4d50
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/guts/lstat.c
> >>>> @@ -0,0 +1,15 @@
> >>>> +/*
> >>>> + * Copyright (c) 2011 Wind River Systems; see
> >>>> + * guts/COPYRIGHT for information.
> >>>> + *
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + * int lstat(const char *path, struct stat *buf)
> >>>> + * int rc =3D -1;
> >>>> + */
> >>>> +
> >>>> +   rc =3D wrap___fxstatat(_STAT_VER, AT_FDCWD, path, buf, AT_SYMLIN=
K_NOFOLLOW);
> >>>> +
> >>>> +/* return rc;
> >>>> + * }
> >>>> + */
> >>>> diff --git a/ports/linux/old__x/guts/lstat64.c b/ports/linux/old__x/=
guts/lstat64.c
> >>>> new file mode 100644
> >>>> index 0000000..43d0ce1
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/guts/lstat64.c
> >>>> @@ -0,0 +1,15 @@
> >>>> +/*
> >>>> + * Copyright (c) 2012 Wind River Systems; see
> >>>> + * guts/COPYRIGHT for information.
> >>>> + *
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + * int lstat64(const char *path, struct stat *buf)
> >>>> + * int rc =3D -1;
> >>>> + */
> >>>> +
> >>>> +   rc =3D wrap___fxstatat64(_STAT_VER, AT_FDCWD, path, buf, AT_SYML=
INK_NOFOLLOW);
> >>>> +
> >>>> +/* return rc;
> >>>> + * }
> >>>> + */
> >>>> diff --git a/ports/linux/old__x/guts/mknod.c b/ports/linux/old__x/gu=
ts/mknod.c
> >>>> new file mode 100644
> >>>> index 0000000..61fd320
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/guts/mknod.c
> >>>> @@ -0,0 +1,15 @@
> >>>> +/*
> >>>> + * Copyright (c) 2016 Wind River Systems; see
> >>>> + * guts/COPYRIGHT for information.
> >>>> + *
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + * int mknod(const char *path, mode_t mode, dev_t dev)
> >>>> + * int rc =3D -1;
> >>>> + */
> >>>> +
> >>>> +   rc =3D wrap___xmknod(_MKNOD_VER, path, mode, &dev);
> >>>> +
> >>>> +/* return rc;
> >>>> + * }
> >>>> + */
> >>>> diff --git a/ports/linux/old__x/guts/mknodat.c b/ports/linux/old__x/=
guts/mknodat.c
> >>>> new file mode 100644
> >>>> index 0000000..a7e4293
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/guts/mknodat.c
> >>>> @@ -0,0 +1,15 @@
> >>>> +/*
> >>>> + * Copyright (c) 2016 Wind River Systems; see
> >>>> + * guts/COPYRIGHT for information.
> >>>> + *
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + * int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev)
> >>>> + * int rc =3D -1;
> >>>> + */
> >>>> +
> >>>> +   rc =3D wrap___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
> >>>> +
> >>>> +/* return rc;
> >>>> + * }
> >>>> + */
> >>>> diff --git a/ports/linux/old__x/guts/mkostemp64.c b/ports/linux/old_=
_x/guts/mkostemp64.c
> >>>> new file mode 100644
> >>>> index 0000000..502211b
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/guts/mkostemp64.c
> >>>> @@ -0,0 +1,53 @@
> >>>> +/*
> >>>> + * Copyright (c) 2010 Wind River Systems; see
> >>>> + * guts/COPYRIGHT for information.
> >>>> + *
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + * static int
> >>>> + * wrap_mkstemp64(char *template, int oflags) {
> >>>> + * int rc =3D -1;
> >>>> + */
> >>>> +   struct stat64 buf;
> >>>> +   int save_errno;
> >>>> +   size_t len;
> >>>> +   char *tmp_template;
> >>>> +
> >>>> +   if (!template) {
> >>>> +           errno =3D EFAULT;
> >>>> +           return 0;
> >>>> +   }
> >>>> +
> >>>> +   len =3D strlen(template);
> >>>> +   tmp_template =3D PSEUDO_ROOT_PATH(AT_FDCWD, template, AT_SYMLINK=
_NOFOLLOW);
> >>>> +
> >>>> +   if (!tmp_template) {
> >>>> +           errno =3D ENOENT;
> >>>> +           return -1;
> >>>> +   }
> >>>> +
> >>>> +   /* mkstemp64 wrapper uses this code and mkostemp64 not present i=
n some glibc versions */
> >>>> +   if (oflags =3D=3D 0)
> >>>> +           rc =3D real_mkstemp64(tmp_template);
> >>>> +   else
> >>>> +           rc =3D real_mkostemp64(tmp_template, oflags);
> >>>> +
> >>>> +   if (rc !=3D -1) {
> >>>> +           save_errno =3D errno;
> >>>> +
> >>>> +           if (real___fxstat64(_STAT_VER, rc, &buf) !=3D -1) {
> >>>> +                   real_fchmod(rc, PSEUDO_FS_MODE(0600, 0));
> >>>> +                   pseudo_client_op(OP_CREAT, 0, -1, -1, tmp_templa=
te, &buf);
> >>>> +                   pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE, =
rc, -1, tmp_template, &buf);
> >>>> +           } else {
> >>>> +                   pseudo_debug(PDBGF_CONSISTENCY, "mkstemp (fd %d)=
 succeeded, but fstat failed (%s).\n",
> >>>> +                           rc, strerror(errno));
> >>>> +                   pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE, =
rc, -1, tmp_template, 0);
> >>>> +           }
> >>>> +           errno =3D save_errno;
> >>>> +   }
> >>>> +   /* mkstemp only changes the XXXXXX at the end. */
> >>>> +   memcpy(template + len - 6, tmp_template + strlen(tmp_template) -=
 6, 6);
> >>>> +/* return rc;
> >>>> + * }
> >>>> + */
> >>>> diff --git a/ports/linux/old__x/portdefs.h b/ports/linux/old__x/port=
defs.h
> >>>> new file mode 100644
> >>>> index 0000000..f2bdc22
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/portdefs.h
> >>>> @@ -0,0 +1,40 @@
> >>>> +/*
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + */
> >>>> +
> >>>> +/* If the subport was enabled, and these are not defined provide a =
default */
> >>>> +#ifndef _STAT_VER
> >>>> +#if defined (__aarch64__)
> >>>> +#define _STAT_VER 0
> >>>> +#elif defined (__x86_64__)
> >>>> +#define _STAT_VER 1
> >>>> +#else
> >>>> +#define _STAT_VER 3
> >>>> +#endif
> >>>> +#endif
> >>>> +
> >>>> +#if PSEUDO_STATBUF_64
> >>>> +#define base_fstat(fd, buf) real___fxstat64(_STAT_VER, fd, buf)
> >>>> +#define base_stat(path, buf) real___xstat64(_STAT_VER, path, buf)
> >>>> +#define base_fstatat(dirfd, path, buf, flags) real___fxstatat64(_ST=
AT_VER, dirfd, path, buf, flags)
> >>>> +#else
> >>>> +#define base_fstat(fd, buf) real___fxstat(_STAT_VER, fd, buf)
> >>>> +#define base_stat(path, buf) real___xstat(_STAT_VER, path, buf)
> >>>> +#define base_fstatat(dirfd, path, buf, flags) real___fxstatat(_STAT=
_VER, dirfd, path, buf, flags)
> >>>> +#endif
> >>>> +
> >>>> +#define base_fstat64(path, buf) real___fxstat64(_STAT_VER, path, bu=
f)
> >>>> +#define base_stat64(path, buf) real___xstat64(_STAT_VER, path, buf)
> >>>> +#define base_fstatat64(dirfd, path, buf, flags) real___fxstatat64(_=
STAT_VER, dirfd, path, buf, flags)
> >>>> +
> >>>> +/* If the subport was enabled, and these are not defined provide a =
default */
> >>>> +#ifndef _MKNOD_VER
> >>>> +#if defined (__aarch64__)
> >>>> +#define _MKNOD_VER 0
> >>>> +#elif defined (__x86_64__)
> >>>> +#define _MKNOD_VER 0
> >>>> +#else
> >>>> +#define _MKNOD_VER 1
> >>>> +#endif
> >>>> +#endif
> >>>> diff --git a/ports/linux/old__x/pseudo_wrappers.c b/ports/linux/old_=
_x/pseudo_wrappers.c
> >>>> new file mode 100644
> >>>> index 0000000..455bc09
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/pseudo_wrappers.c
> >>>> @@ -0,0 +1,48 @@
> >>>> +/*
> >>>> + * SPDX-License-Identifier: LGPL-2.1-only
> >>>> + *
> >>>> + */
> >>>> +/* the unix port wants to know that real_stat() and
> >>>> + * friends exist.  So they do. And because the Linux
> >>>> + * port really uses stat64 for those...
> >>>> + */
> >>>> +int
> >>>> +pseudo_stat(const char *path, struct stat *buf) {
> >>>> +   return real___xstat(_STAT_VER, path, buf);
> >>>> +}
> >>>> +
> >>>> +int
> >>>> +pseudo_lstat(const char *path, struct stat *buf) {
> >>>> +   return real___lxstat(_STAT_VER, path, buf);
> >>>> +}
> >>>> +
> >>>> +int
> >>>> +pseudo_fstat(int fd, struct stat *buf) {
> >>>> +   return real___fxstat(_STAT_VER, fd, buf);
> >>>> +}
> >>>> +
> >>>> +int
> >>>> +pseudo_stat64(const char *path, struct stat64 *buf) {
> >>>> +   return real___xstat64(_STAT_VER, path, buf);
> >>>> +}
> >>>> +
> >>>> +int
> >>>> +pseudo_lstat64(const char *path, struct stat64 *buf) {
> >>>> +   return real___lxstat64(_STAT_VER, path, buf);
> >>>> +}
> >>>> +
> >>>> +int
> >>>> +pseudo_fstat64(int fd, struct stat64 *buf) {
> >>>> +   return real___fxstat64(_STAT_VER, fd, buf);
> >>>> +}
> >>>> +
> >>>> +/* similar thing happens with mknod */
> >>>> +int
> >>>> +pseudo_mknod(const char *path, mode_t mode, dev_t dev) {
> >>>> +   return real___xmknod(_MKNOD_VER, path, mode, &dev);
> >>>> +}
> >>>> +
> >>>> +int
> >>>> +pseudo_mknodat(int dirfd, const char *path, mode_t mode, dev_t dev)=
 {
> >>>> +   return real___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
> >>>> +}
> >>>> diff --git a/ports/linux/old__x/wrapfuncs.in b/ports/linux/old__x/wr=
apfuncs.in
> >>>> new file mode 100644
> >>>> index 0000000..de24e63
> >>>> --- /dev/null
> >>>> +++ b/ports/linux/old__x/wrapfuncs.in
> >>>> @@ -0,0 +1,18 @@
> >>>> +int __xstat(int ver, const char *path, struct stat *buf);
> >>>> +int __lxstat(int ver, const char *path, struct stat *buf); /* flags=
=3DAT_SYMLINK_NOFOLLOW */
> >>>> +int __fxstat(int ver, int fd, struct stat *buf);
> >>>> +int __fxstatat(int ver, int dirfd, const char *path, struct stat *b=
uf, int flags);
> >>>> +int __xstat64(int ver, const char *path, struct stat64 *buf);
> >>>> +int __lxstat64(int ver, const char *path, struct stat64 *buf); /* f=
lags=3DAT_SYMLINK_NOFOLLOW */
> >>>> +int __fxstat64(int ver, int fd, struct stat64 *buf);
> >>>> +int __fxstatat64(int ver, int dirfd, const char *path, struct stat6=
4 *buf, int flags);
> >>>> +
> >>>> +int stat(const char *path, struct stat *buf); /* real_func=3Dpseudo=
_stat */
> >>>> +int lstat(const char *path, struct stat *buf); /* real_func=3Dpseud=
o_lstat, flags=3DAT_SYMLINK_NOFOLLOW */
> >>>> +int lstat64(const char *path, struct stat64 *buf); /* real_func=3Dp=
seudo_lstat64, flags=3DAT_SYMLINK_NOFOLLOW */
> >>>> +int fstat64(int fd, struct stat64 *buf); /* real_func=3Dpseudo_fsta=
t64 */
> >>>> +
> >>>> +int __xmknod(int ver, const char *path, mode_t mode, dev_t *dev); /=
* flags=3DAT_SYMLINK_NOFOLLOW */
> >>>> +int __xmknodat(int ver, int dirfd, const char *path, mode_t mode, d=
ev_t *dev); /* flags=3DAT_SYMLINK_NOFOLLOW */
> >>>> +int mknod(const char *path, mode_t mode, dev_t dev); /* real_func=
=3Dpseudo_mknod */
> >>>> +int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev); /=
* real_func=3Dpseudo_mknodat */
> >>>> diff --git a/ports/linux/portdefs.h b/ports/linux/portdefs.h
> >>>> index 9545550..a92e969 100644
> >>>> --- a/ports/linux/portdefs.h
> >>>> +++ b/ports/linux/portdefs.h
> >>>> @@ -34,22 +34,3 @@ GLIBC_COMPAT_SYMBOL(memcpy,2.0);
> >>>>   #include <sys/syscall.h>
> >>>>   #include <sys/prctl.h>
> >>>>   #include <linux/seccomp.h>
> >>>> -
> >>>> -#ifndef _STAT_VER
> >>>> -#if defined (__aarch64__)
> >>>> -#define _STAT_VER 0
> >>>> -#elif defined (__x86_64__)
> >>>> -#define _STAT_VER 1
> >>>> -#else
> >>>> -#define _STAT_VER 3
> >>>> -#endif
> >>>> -#endif
> >>>> -#ifndef _MKNOD_VER
> >>>> -#if defined (__aarch64__)
> >>>> -#define _MKNOD_VER 0
> >>>> -#elif defined (__x86_64__)
> >>>> -#define _MKNOD_VER 0
> >>>> -#else
> >>>> -#define _MKNOD_VER 1
> >>>> -#endif
> >>>> -#endif
> >>>> diff --git a/ports/linux/pseudo_wrappers.c b/ports/linux/pseudo_wrap=
pers.c
> >>>> index 7659897..7a4f549 100644
> >>>> --- a/ports/linux/pseudo_wrappers.c
> >>>> +++ b/ports/linux/pseudo_wrappers.c
> >>>> @@ -2,50 +2,7 @@
> >>>>    * SPDX-License-Identifier: LGPL-2.1-only
> >>>>    *
> >>>>    */
> >>>> -/* the unix port wants to know that real_stat() and
> >>>> - * friends exist.  So they do. And because the Linux
> >>>> - * port really uses stat64 for those...
> >>>> - */
> >>>> -int
> >>>> -pseudo_stat(const char *path, struct stat *buf) {
> >>>> -   return real___xstat(_STAT_VER, path, buf);
> >>>> -}
> >>>> -
> >>>> -int
> >>>> -pseudo_lstat(const char *path, struct stat *buf) {
> >>>> -   return real___lxstat(_STAT_VER, path, buf);
> >>>> -}
> >>>> -
> >>>> -int
> >>>> -pseudo_fstat(int fd, struct stat *buf) {
> >>>> -   return real___fxstat(_STAT_VER, fd, buf);
> >>>> -}
> >>>> -
> >>>> -int
> >>>> -pseudo_stat64(const char *path, struct stat64 *buf) {
> >>>> -   return real___xstat64(_STAT_VER, path, buf);
> >>>> -}
> >>>> -
> >>>> -int
> >>>> -pseudo_lstat64(const char *path, struct stat64 *buf) {
> >>>> -   return real___lxstat64(_STAT_VER, path, buf);
> >>>> -}
> >>>> -
> >>>> -int
> >>>> -pseudo_fstat64(int fd, struct stat64 *buf) {
> >>>> -   return real___fxstat64(_STAT_VER, fd, buf);
> >>>> -}
> >>>> -
> >>>>   /* similar thing happens with mknod */
> >>>> -int
> >>>> -pseudo_mknod(const char *path, mode_t mode, dev_t dev) {
> >>>> -   return real___xmknod(_MKNOD_VER, path, mode, &dev);
> >>>> -}
> >>>> -
> >>>> -int
> >>>> -pseudo_mknodat(int dirfd, const char *path, mode_t mode, dev_t dev)=
 {
> >>>> -   return real___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
> >>>> -}
> >>>>
> >>>>   int pseudo_capset(cap_user_header_t hdrp, const cap_user_data_t da=
tap) {
> >>>>      (void)hdrp;
> >>>> diff --git a/ports/linux/subports b/ports/linux/subports
> >>>> index 099ea59..53f6696 100755
> >>>> --- a/ports/linux/subports
> >>>> +++ b/ports/linux/subports
> >>>> @@ -70,3 +70,18 @@ else
> >>>>   fi
> >>>>   rm -f dummy.c dummy.o
> >>>>
> >>>> +# Check if _STAT_VER is defined.  This is an indication that the ol=
d internal __*xstat* functions are available
> >>>> +# Check if _MKNOD_VER is defined.  This is an indication that the o=
ld internal __xmknod* functions are available
> >>>> +cat > dummy.c <<EOF
> >>>> +#include <sys/stat.h>
> >>>> +#ifndef _STAT_VER
> >>>> +#error _STAT_VER not defined
> >>>> +#endif
> >>>> +#ifndef _MKNOD_VER
> >>>> +#error _MKNOD_VER not defined
> >>>> +#endif
> >>>> +EOF
> >>>> +if ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
> >>>> +        echo "linux/old__x"
> >>>> +fi
> >>>> +rm -f dummy.c dummy.o
> >>>> diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
> >>>> index 97b16c2..5187fd8 100644
> >>>> --- a/ports/linux/wrapfuncs.in
> >>>> +++ b/ports/linux/wrapfuncs.in
> >>>> @@ -1,17 +1,11 @@
> >>>>   int open(const char *path, int flags, ...{mode_t mode}); /* flags=
=3Dflags&O_NOFOLLOW, noignore_path=3D1 */
> >>>>   char *get_current_dir_name(void);
> >>>> -int __xstat(int ver, const char *path, struct stat *buf);
> >>>> -int __lxstat(int ver, const char *path, struct stat *buf); /* flags=
=3DAT_SYMLINK_NOFOLLOW */
> >>>> -int __fxstat(int ver, int fd, struct stat *buf);
> >>>>   int lchmod(const char *path, mode_t mode); /* flags=3DAT_SYMLINK_N=
OFOLLOW */
> >>>>   int lchown(const char *path, uid_t owner, gid_t group); /* flags=
=3DAT_SYMLINK_NOFOLLOW */
> >>>> -int __fxstatat(int ver, int dirfd, const char *path, struct stat *b=
uf, int flags);
> >>>>   int openat(int dirfd, const char *path, int flags, ...{mode_t mode=
}); /* flags=3Dflags&O_NOFOLLOW, noignore_path=3D1 */
> >>>>   int __openat_2(int dirfd, const char *path, int flags); /* flags=
=3Dflags&O_NOFOLLOW, noignore_path=3D1 */
> >>>> -int mknod(const char *path, mode_t mode, dev_t dev); /* real_func=
=3Dpseudo_mknod */
> >>>> -int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev); /=
* real_func=3Dpseudo_mknodat */
> >>>> -int __xmknod(int ver, const char *path, mode_t mode, dev_t *dev); /=
* flags=3DAT_SYMLINK_NOFOLLOW */
> >>>> -int __xmknodat(int ver, int dirfd, const char *path, mode_t mode, d=
ev_t *dev); /* flags=3DAT_SYMLINK_NOFOLLOW */
> >>>> +int mknod(const char *path, mode_t mode, dev_t dev);
> >>>> +int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev);
> >>>>   int fcntl(int fd, int cmd, ...{struct flock *lock});  /* noignore_=
path=3D1 */
> >>>>   int fcntl64(int fd, int cmd, ...{struct flock *lock});  /* noignor=
e_path=3D1 */
> >>>>   # just so we know the inums of symlinks
> >>>> @@ -21,18 +15,14 @@ int open64(const char *path, int flags, ...{mode=
_t mode}); /* flags=3Dflags&O_NOFO
> >>>>   int openat64(int dirfd, const char *path, int flags, ...{mode_t mo=
de}); /* flags=3Dflags&O_NOFOLLOW, noignore_path=3D1 */
> >>>>   int __openat64_2(int dirfd, const char *path, int flags); /* flags=
=3Dflags&O_NOFOLLOW, noignore_path=3D1 */
> >>>>   int creat64(const char *path, mode_t mode);
> >>>> -int stat(const char *path, struct stat *buf); /* real_func=3Dpseudo=
_stat */
> >>>> -int lstat(const char *path, struct stat *buf); /* real_func=3Dpseud=
o_lstat, flags=3DAT_SYMLINK_NOFOLLOW */
> >>>> -int fstat(int fd, struct stat *buf); /* real_func=3Dpseudo_fstat */
> >>>> +int stat(const char *path, struct stat *buf);
> >>>> +int lstat(const char *path, struct stat *buf); /* flags=3DAT_SYMLIN=
K_NOFOLLOW */
> >>>> +int fstat(int fd, struct stat *buf);
> >>>>   int fstatat(int dirfd, const char *path, struct stat *buf, int fla=
gs);
> >>>> -int stat64(const char *path, struct stat64 *buf); /* real_func=3Dps=
eudo_stat64 */
> >>>> -int lstat64(const char *path, struct stat64 *buf); /* real_func=3Dp=
seudo_lstat64, flags=3DAT_SYMLINK_NOFOLLOW */
> >>>> -int fstat64(int fd, struct stat64 *buf); /* real_func=3Dpseudo_fsta=
t64 */
> >>>> +int stat64(const char *path, struct stat64 *buf);
> >>>> +int lstat64(const char *path, struct stat64 *buf); /* flags=3DAT_SY=
MLINK_NOFOLLOW */
> >>>> +int fstat64(int fd, struct stat64 *buf);
> >>>>   int fstatat64(int dirfd, const char *path, struct stat64 *buf, int=
 flags);
> >>>> -int __xstat64(int ver, const char *path, struct stat64 *buf);
> >>>> -int __lxstat64(int ver, const char *path, struct stat64 *buf); /* f=
lags=3DAT_SYMLINK_NOFOLLOW */
> >>>> -int __fxstat64(int ver, int fd, struct stat64 *buf);
> >>>> -int __fxstatat64(int ver, int dirfd, const char *path, struct stat6=
4 *buf, int flags);
> >>>>   FILE *fopen64(const char *path, const char *mode); /* noignore_pat=
h=3D1 */
> >>>>   int nftw64(const char *path, int (*fn)(const char *, const struct =
stat64 *, int, struct FTW *), int nopenfd, int flag); /* noignore_path=3D1 =
*/
> >>>>   FILE *freopen64(const char *path, const char *mode, FILE *stream);=
  /* noignore_path=3D1 */
> >>>> diff --git a/pseudo_client.h b/pseudo_client.h
> >>>> index d7944ce..8d05e4f 100644
> >>>> --- a/pseudo_client.h
> >>>> +++ b/pseudo_client.h
> >>>> @@ -12,15 +12,41 @@ extern int pseudo_client_ignore_fd(int fd);
> >>>>   extern void pseudo_client_linked_paths(const char *oldpath, const =
char *newpath);
> >>>>   #if PSEUDO_STATBUF_64
> >>>>   #define base_lstat real_lstat64
> >>>> -#define base_fstat real_fstat64
> >>>> -#define base_stat real_stat64
> >>>> -#define base_fstatat(dirfd, path, buf, flags) real___fxstatat64(_ST=
AT_VER, dirfd, path, buf, flags)
> >>>> +#ifndef base_fstat
> >>>> + #define base_fstat real_fstat64
> >>>> +#endif
> >>>> +#ifndef base_stat
> >>>> + #define base_stat real_stat64
> >>>> +#endif
> >>>> +#ifndef base_fstatat
> >>>> + #define base_fstatat real_fstatat64
> >>>> +#endif
> >>>>   #else
> >>>>   #define base_lstat real_lstat
> >>>> -#define base_fstat real_fstat
> >>>> -#define base_stat real_stat
> >>>> -#define base_fstatat(dirfd, path, buf, flags) real___fxstatat(_STAT=
_VER, dirfd, path, buf, flags)
> >>>> +#ifndef base_fstat
> >>>> + #define base_fstat real_fstat
> >>>> +#endif
> >>>> +#ifndef base_stat
> >>>> + #define base_stat real_stat
> >>>> +#endif
> >>>> +#ifndef base_fstatat
> >>>> + #define base_fstatat real_fstatat
> >>>> +#endif
> >>>>   #endif
> >>>> +
> >>>> +#ifndef base_lstat64
> >>>> + #define base_lstat64 real_lstat64
> >>>> +#endif
> >>>> +#ifndef base_fstat64
> >>>> + #define base_fstat64 real_fstat64
> >>>> +#endif
> >>>> +#ifndef base_stat64
> >>>> + #define base_stat64 real_stat64
> >>>> +#endif
> >>>> +#ifndef base_fstatat64
> >>>> + #define base_fstatat64 real_fstatat64
> >>>> +#endif
> >>>> +
> >>>>   extern void pseudo_antimagic(void);
> >>>>   extern void pseudo_magic(void);
> >>>>   extern void pseudo_client_touchuid(void);
> >>>> --
> >>>> 2.17.1
> >>>>
> >>>>
> >>>>
> >>>
> >>> --
> >>> Alexandre Belloni, co-owner and COO, Bootlin
> >>> Embedded Linux and Kernel engineering
> >>> https://bootlin.com
> >>>
> >>>
> >>>
> >>
> >> --
> >> Alexandre Belloni, co-owner and COO, Bootlin
> >> Embedded Linux and Kernel engineering
> >> https://bootlin.com
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#182117): https://lists.openembedded.org/g/openembe=
dded-core/message/182117
> >> Mute This Topic: https://lists.openembedded.org/mt/99234918/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

