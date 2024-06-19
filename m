Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A307C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 13:24:34 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.21070.1718803471806397467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 06:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=km1u6ruf;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5295e488248so7115460e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 06:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718803470; x=1719408270; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugMCKgSi/U1V7xQusJBUEqJqTodq8YM63nqP159KYB8=;
        b=km1u6ruf9ZKnm+37IApr8EGuo9yCDiffbu8uTcSWMj12iptyn39b4YRKcHOaxjEMLz
         mY9i4johgkAnAlNPYN6zxckIu3UUl+okTMZH0aeoFJVQjcWD9gSWHb5XjS5PdayMAwZb
         fBqCqSsl4Jtfpll0rxFoJxiL3dheu36dhPAha/sQ1q6rAcjVfQNqX9Jj1xX/WIWD5XmX
         2zs6HZrQhOXH0fpbIOV6Nj0hoRU2Q4QO3gb+poAsNZmjKi0P1Z0QCe8fEAO9hYZPpisz
         r10oQL8C8dIUbRqK+etIN9mrWd99j9RClHAi8yertput8JBvk40eIJGvEDaq/SuIcenT
         GjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718803470; x=1719408270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugMCKgSi/U1V7xQusJBUEqJqTodq8YM63nqP159KYB8=;
        b=cfiRaT/WLA842d2nSLryOuMuwQFb9ZIVSb3NUZyyVYc7a6vG4Li0xTLDN61RrWAdvU
         jQ41RSGp4Hqp7FQSJpxiBFGzyPumSytHwxAd71Prr5/JVWjO6kYhiMBORWJQQAGbqLY7
         iF3B2bIJXtmIYi2MqJqyE6cWtnsZ+Yq6hN+J5wca69TSlJOOnL1wN7s0uPTpqxKIDOsL
         LK1GWIex0JrOvSkSEPDgV/sXmFvQZADB5CpwiEwlT8c9h8LqlaCqWzn2R3jZLOv/+8ew
         TPQXNHq875jzpa8Q2QqXX8mvWExzibyOYlVkzmzRkrVk30jWQ0C2YRWE49tCFKppHhWO
         naMA==
X-Forwarded-Encrypted: i=1; AJvYcCX/erCxvxaBAKhsepSNpN0FlKaN2W4D4ndSmLG/VALg6g1zR+aU1MM651YazakFm4xkQVt415CShGwidB32V33Q+xUP4BLzJFCA0g4Jd69JvJIei4ojZd3R
X-Gm-Message-State: AOJu0YyscyUbbfrXbKjpfNXQRCMNYYYSgEUU4gExK3KfF3k1ZBqhnRvZ
	3oSWpxVbDv8Va802PcvxCPHctRHxeNI44pPy6i2FN91TEXm56MI4rRSuc+ffJwQq110GcmdI/ZO
	/bYoKsoQuAXJ6U+xyszmd0hP4J98=
X-Google-Smtp-Source: AGHT+IFuAIqPWWJ7qouRivGmiyfQq+qa7gH0GrlUBBd14gaNhFphZBgtUEALhMiwJGdBWXBGTiyeIO3soej+9AvfS48=
X-Received: by 2002:a05:6512:3c9a:b0:52c:82c7:7181 with SMTP id
 2adb3069b0e04-52ccaa57964mr1736280e87.46.1718803469559; Wed, 19 Jun 2024
 06:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240616153135.3058410-1-kai.kang@windriver.com> <20240616153135.3058410-2-kai.kang@windriver.com>
In-Reply-To: <20240616153135.3058410-2-kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 19 Jun 2024 15:24:09 +0200
Message-ID: <CA+chaQebei7LOk4R12MxDHRTw2q-EUHGtE9_g5WjRB6SOK7U0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/1] gfortran: update runtime dependencies
To: kai.kang@windriver.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 13:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200913

Something seems wrong with this change which was merged today, now with:
MACHINE=3Dqemuarm64
FORTRAN:forcevariable =3D ",fortran"

I'm seeing:
build/oe-core $ bitbake -g nativesdk-libgfortran
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'gcc-cross-x86_64' (but
virtual:nativesdk:/OE/build/oe-core/openembedded-core/meta/recipes-devtools=
/gcc/libgfortran_14.1.bb
DEPENDS on or otherwise requires it). Close matches:
  gcc-cross-aarch64
...

This might have been broken even before this change, but now it got
included in dependency tree of nativesdk-gcc (as shown in bitbake -g
nativesdk-gcc now failing when host and target arch don't match):

"nativesdk-gcc.do_package_qa" -> "nativesdk-libgfortran.do_packagedata"
nativesdk-gcc.do_package_write_ipk" -> "nativesdk-libgfortran.do_packagedat=
a"

Missing or unbuildable dependency chain was: ['image',
'nativesdk-packagegroup-sdk-host', 'nativesdk-lcov',
'nativesdk-gcov-symlinks', 'nativesdk-libgfortran-dev',
'gcc-cross-x86_64']

I guess the easiest fix would be in:
meta/recipes-devtools/gcc/libgfortran.inc:DEPENDS =3D "gcc-runtime
gcc-cross-${TARGET_ARCH}"
but I'm not very familiar with fortran (we've enabled it long time ago
to build lapack(blas) for snowboy, but wasn't actively used for couple
years).

Regards,



On Sun, Jun 16, 2024 at 5:32=E2=80=AFPM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> It fails to run both `gcc` and `gfortran` with errors:
>
> | root@qemux86-64:~# x86_64-poky-linux-gcc a.c
> | x86_64-poky-linux-gcc: fatal error: cannot execute 'as': posix_spawnp: =
No such file or directory
>
> then add binutils which provides `as` to RDEPENDS of gcc.
>
> libgfortran-dev provides libgfortran.spec which required by gfortran:
>
> | root@qemux86-64:~# gfortran hello.f95
> | gfortran: fatal error: cannot read spec file 'libgfortran.spec': No suc=
h file or directory
>
> And gcc provides liblto_plugin.so:
>
> | root@qemux86-64:~# gfortran hello.f95
> | gfortran: fatal error: '-fuse-linker-plugin', but liblto_plugin.so not =
found
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
> index 8e9693b4cb..e9187fc444 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -33,7 +33,7 @@ PACKAGES =3D "\
>      ${PN} ${PN}-plugins ${PN}-symlinks \
>      g++ g++-symlinks \
>      cpp cpp-symlinks \
> -    gfortran gfortran-symlinks \
> +    ${@bb.utils.contains('FORTRAN', ',fortran', 'gfortran gfortran-symli=
nks', '', d)} \
>      gcov gcov-symlinks \
>      ${PN}-doc \
>      ${PN}-dev \
> @@ -60,7 +60,7 @@ RRECOMMENDS:${PN} +=3D "\
>      libssp \
>      libssp-dev \
>  "
> -RDEPENDS:${PN} +=3D "cpp"
> +RDEPENDS:${PN} +=3D "binutils cpp"
>
>  FILES:${PN}-dev =3D "\
>      ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
> @@ -80,10 +80,15 @@ FILES:${PN}-plugins =3D "\
>  "
>  ALLOW_EMPTY:${PN}-plugins =3D "1"
>
> +INSANE_SKIP:${MLPREFIX}gfortran +=3D "dev-deps"
>  FILES:gfortran =3D "\
>      ${bindir}/${TARGET_PREFIX}gfortran \
>      ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
>  "
> +RDEPENDS:gfortran =3D "\
> +    gcc \
> +    libgfortran-dev \
> +"
>  RRECOMMENDS:gfortran =3D "\
>      libquadmath \
>      libquadmath-dev \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200780): https://lists.openembedded.org/g/openembedde=
d-core/message/200780
> Mute This Topic: https://lists.openembedded.org/mt/106704990/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

