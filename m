Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B10C27C79
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 15:01:14 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.23185.1718809264009258989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 08:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J29I2wEa;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52caebc6137so4190009e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718809262; x=1719414062; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1GIwbbON5YNHv6ot9KgNt8qiEKAirWP4RlpZJGLCC0=;
        b=J29I2wEakhoqHi2epCNruLbeHlG9SqFqOmP70Y82MiWLIafX8Dh7l9QuuGSj9aEXd6
         vt5f/r4bU+JbiU+hCXW9Edhu3UW618LT6GzybXQeAu4jMZDiAlgaecv6kq6NAOCxEcVg
         a7k1WIWw0T5xAKT7N+d1AOj5gUeCD5XqJAMxZdaT44ZuPGQ4+x2fFHOF+ckmA6aY7uAd
         8UHj9iD4yNarCskViQpQejKDKd6vIhk+CzpeDnFeven3BjJmHyxvnFQuuVKbvZslAI5A
         DyWsKpwibyMHaOW+A18HWWP6+nZBzbdHP/V5gzX9grbknCINsjPMNMyp5rFae4pOUKva
         oiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718809262; x=1719414062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1GIwbbON5YNHv6ot9KgNt8qiEKAirWP4RlpZJGLCC0=;
        b=HioUEueBFDSm75IwcxN85nQgl61d0eXBQJnau/+C8oRUSyr5PEkWANJi5AXcYs4UTA
         9izWgX8S3Y9TGDJfSh+w8+Ufu2aQijFpbNbrcX+Ger/j7J3g5iOb2ddgKCsLAUB3XcAk
         XV8foW3c+RYsDL2//5jPksiYvXYWIXyi/Ch1flEXUdBt9lwhARNfHH7A1q/h4nnbUC5m
         W4wtS+iI8xicp2MlTzZUPXPCS5rqBSutRy+7Vkcm2bep7dqDycKRsJwq+RyJOuVvOTWH
         HFGydAfbNtrf2pgjkCWlB2b5Qb0mLS51WdpGT+gjKjt2s3J/OFIAfiZdbuveKMY16CLJ
         uoXw==
X-Forwarded-Encrypted: i=1; AJvYcCVjnzhW6pkoQATo/f3JZ6EtTRXfUpj2T4+0FtKHfSjAu1vpLtWwUTP90nfSmPGddciL/9PgJiXBElV/haPbxUZFp2Rs4rrsfkIZuiVm0p2kRa+YfDV5R2P9
X-Gm-Message-State: AOJu0Ywd57DDWYqf6sh5HvdgeNFfVGSEQBgLHMCWA8KAtVzFuTsYpQGu
	+XccQNK7IA1Vv2p/rIEO3PJecTbjVW/21um8mNPhL+7mPEph8itGy97H+V9Q+6Lc5mWl70gHrYR
	0s6jnap8V7nOQoxkkvFNPAip1op0=
X-Google-Smtp-Source: AGHT+IHUPtZRXn2272ziXpe/qibYtnDIZKYIEstdWkhR2NWhxZ4w3A0v7TN0/zqrBqITw59OO6OcvD+9sCfSvz2RM+0=
X-Received: by 2002:a19:5518:0:b0:52c:7f9a:5053 with SMTP id
 2adb3069b0e04-52ccaa5d811mr1626145e87.23.1718809261850; Wed, 19 Jun 2024
 08:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240616153135.3058410-1-kai.kang@windriver.com>
 <20240616153135.3058410-2-kai.kang@windriver.com> <17DA6AA6C1087792.28936@lists.openembedded.org>
In-Reply-To: <17DA6AA6C1087792.28936@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 19 Jun 2024 17:00:41 +0200
Message-ID: <CA+chaQexmQso_xy45yCMU_EsVDq9RsX+qmmuuVb3r8ur3XQe4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/1] gfortran: update runtime dependencies
To: martin.jansa@gmail.com
Cc: kai.kang@windriver.com, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200916

See https://lists.openembedded.org/g/openembedded-core/message/200915
which allows to me to build nativesdk-gcc again.

I've built nativesdk-libgfortran and libgfortran with the patch, but
haven't used fortran in runtime at all, that's why it's an RFC, there
were also 2 warnings:
WARNING: nativesdk-libgfortran-14.1.0-r0 do_package_qa: QA Issue: File
/opt/.../usr/lib/.debug/libgfortran.so.5.0.0 in package
nativesdk-libgfortran-dbg contains reference to TMPDIR [buildpaths]
WARNING: libgfortran-14.1.0-r0 do_package_qa: QA Issue: File
/usr/lib/.debug/libgfortran.so.5.0.0 in package libgfortran-dbg
contains reference to TMPDIR [buildpaths]
which I guess were already there.

On Wed, Jun 19, 2024 at 3:24=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Something seems wrong with this change which was merged today, now with:
> MACHINE=3Dqemuarm64
> FORTRAN:forcevariable =3D ",fortran"
>
> I'm seeing:
> build/oe-core $ bitbake -g nativesdk-libgfortran
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'gcc-cross-x86_64' (but
> virtual:nativesdk:/OE/build/oe-core/openembedded-core/meta/recipes-devtoo=
ls/gcc/libgfortran_14.1.bb
> DEPENDS on or otherwise requires it). Close matches:
>   gcc-cross-aarch64
> ...
>
> This might have been broken even before this change, but now it got
> included in dependency tree of nativesdk-gcc (as shown in bitbake -g
> nativesdk-gcc now failing when host and target arch don't match):
>
> "nativesdk-gcc.do_package_qa" -> "nativesdk-libgfortran.do_packagedata"
> nativesdk-gcc.do_package_write_ipk" -> "nativesdk-libgfortran.do_packaged=
ata"
>
> Missing or unbuildable dependency chain was: ['image',
> 'nativesdk-packagegroup-sdk-host', 'nativesdk-lcov',
> 'nativesdk-gcov-symlinks', 'nativesdk-libgfortran-dev',
> 'gcc-cross-x86_64']
>
> I guess the easiest fix would be in:
> meta/recipes-devtools/gcc/libgfortran.inc:DEPENDS =3D "gcc-runtime
> gcc-cross-${TARGET_ARCH}"
> but I'm not very familiar with fortran (we've enabled it long time ago
> to build lapack(blas) for snowboy, but wasn't actively used for couple
> years).
>
> Regards,
>
>
>
> On Sun, Jun 16, 2024 at 5:32=E2=80=AFPM Kai Kang via lists.openembedded.o=
rg
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > It fails to run both `gcc` and `gfortran` with errors:
> >
> > | root@qemux86-64:~# x86_64-poky-linux-gcc a.c
> > | x86_64-poky-linux-gcc: fatal error: cannot execute 'as': posix_spawnp=
: No such file or directory
> >
> > then add binutils which provides `as` to RDEPENDS of gcc.
> >
> > libgfortran-dev provides libgfortran.spec which required by gfortran:
> >
> > | root@qemux86-64:~# gfortran hello.f95
> > | gfortran: fatal error: cannot read spec file 'libgfortran.spec': No s=
uch file or directory
> >
> > And gcc provides liblto_plugin.so:
> >
> > | root@qemux86-64:~# gfortran hello.f95
> > | gfortran: fatal error: '-fuse-linker-plugin', but liblto_plugin.so no=
t found
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-de=
vtools/gcc/gcc-target.inc
> > index 8e9693b4cb..e9187fc444 100644
> > --- a/meta/recipes-devtools/gcc/gcc-target.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> > @@ -33,7 +33,7 @@ PACKAGES =3D "\
> >      ${PN} ${PN}-plugins ${PN}-symlinks \
> >      g++ g++-symlinks \
> >      cpp cpp-symlinks \
> > -    gfortran gfortran-symlinks \
> > +    ${@bb.utils.contains('FORTRAN', ',fortran', 'gfortran gfortran-sym=
links', '', d)} \
> >      gcov gcov-symlinks \
> >      ${PN}-doc \
> >      ${PN}-dev \
> > @@ -60,7 +60,7 @@ RRECOMMENDS:${PN} +=3D "\
> >      libssp \
> >      libssp-dev \
> >  "
> > -RDEPENDS:${PN} +=3D "cpp"
> > +RDEPENDS:${PN} +=3D "binutils cpp"
> >
> >  FILES:${PN}-dev =3D "\
> >      ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
> > @@ -80,10 +80,15 @@ FILES:${PN}-plugins =3D "\
> >  "
> >  ALLOW_EMPTY:${PN}-plugins =3D "1"
> >
> > +INSANE_SKIP:${MLPREFIX}gfortran +=3D "dev-deps"
> >  FILES:gfortran =3D "\
> >      ${bindir}/${TARGET_PREFIX}gfortran \
> >      ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
> >  "
> > +RDEPENDS:gfortran =3D "\
> > +    gcc \
> > +    libgfortran-dev \
> > +"
> >  RRECOMMENDS:gfortran =3D "\
> >      libquadmath \
> >      libquadmath-dev \
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200913): https://lists.openembedded.org/g/openembedde=
d-core/message/200913
> Mute This Topic: https://lists.openembedded.org/mt/106704990/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

