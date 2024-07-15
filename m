Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304C2C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:59:27 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.34585.1721037562687456749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D5UbPUxi;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eea7e2b073so53725281fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721037561; x=1721642361; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBpBHEpcMqyAN2MdpSSc4J/0yI1gypybAiL96mjIP4U=;
        b=D5UbPUxi7MEUhvjXbDhM1p0LgOBWvdwyf0/vYktbvV91gsLbIKV7KryCKWz5rNhMz7
         NPDsEiyKLNEIImVo26K0t2dDhBmsPxdnsPeoaa7JPZVgOG0iJ7lZUH+7ndoFNWXgLE2D
         Sm7Rj2xhHadRlkaRQ1KHE5sI36oAEDP+Nuwk8nnd1ND+DZZhPXOqJtlLFn4+2+t1NLL+
         kVG3ORj7qKEhegQAER12YeWD/tMllRrJC2cL5c9FQWjqsZzvCIy3m5V8IUevN7++oJKS
         OxFVwLRsL5hVDyQM+y87SBEjaFjpSKWWmsJMilgGvT8yxv+jVHyG8LdMRQVO6NK6Hbm7
         KpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721037561; x=1721642361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBpBHEpcMqyAN2MdpSSc4J/0yI1gypybAiL96mjIP4U=;
        b=LRe/RuCvzBM+Nx6LMkMyAPZ0j4Ip3mu69n3ESzu/Ul7VhLVlM44U1UnnwDYNKQMN+X
         bB7KHJ/SqZwM0dpFcocTHv6hjtTWPaANUrq2DLWQ/nt5cBf9OIxpuYpulIikXzOg1bPi
         hUtlQsoxYjja7cirCrdPOAGroPEJOEOiGHSs+pJ7oepQND8nIsqhPAF0Fj4nKtFb4nie
         SX41rnVcKQj7BhmOshSgjMpBaLvitU+rBm48egOvxQZweZ4+8EYsFbL35H50jWDEz8KK
         5ObXISKWvLyxcrWXEIxfLPH84OYcrLE6qVctcx8GdZELfvdi4sLq9y+EA5lERAdhS5aM
         FD5A==
X-Forwarded-Encrypted: i=1; AJvYcCVT0nxBTshz1xgP/xDlxbodvFkDe744UbpQS/gNOPVVfaB6Pqh49U4ke6rAnxVuvd3VuvtpfgGm2NtvkXGxYEfJURcpKZhKnLJc8x3kPRmMP9lWcCbyXZbL
X-Gm-Message-State: AOJu0Yz8YHv+BwS+PyvLj1MZ2Dp0KyG+mtkmfRgf9o+c9ia1+cqxfVXr
	y//jPfkgZLhcjMcHyyF66LvgMilul+zAadsSoUl0m73qgpivAe9E8Ql0ABw9PMy45fG+UQh9OLR
	oFgM3KkoprwfLX9ayJ6ELWfRdF0A=
X-Google-Smtp-Source: AGHT+IFzB6EP3iurXlOsNMGjMeGVcVhPfbE6bx9jNTxMBsgGi1oSGjcfOG//9p0lyRKWcSH7Sx6E4b5vtd8Atg+dD+M=
X-Received: by 2002:a05:6512:1391:b0:52d:6663:5cbe with SMTP id
 2adb3069b0e04-52eb9990ebemr14508386e87.12.1721037560284; Mon, 15 Jul 2024
 02:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240616153135.3058410-1-kai.kang@windriver.com>
 <20240616153135.3058410-2-kai.kang@windriver.com> <17DA6AA6C1087792.28936@lists.openembedded.org>
 <CA+chaQexmQso_xy45yCMU_EsVDq9RsX+qmmuuVb3r8ur3XQe4A@mail.gmail.com> <7001a7c7-f500-49bd-ae2b-711d42a97f06@windriver.com>
In-Reply-To: <7001a7c7-f500-49bd-ae2b-711d42a97f06@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 Jul 2024 11:59:07 +0200
Message-ID: <CA+chaQczh+jy5tEz67r+dcLUJzV=tpnbMad3dHGGR1+KOmLFbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/1] gfortran: update runtime dependencies
To: Kai <kai.kang@windriver.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 09:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201904

Hi Kai,

are you also seeing these buildpaths warnings from libgfortran? These
will be fatal since ERROR_QA update from yesterday:
https://git.openembedded.org/openembedded-core/commit/?id=3Db79b191cc43a45d=
de2adb61ea349b426cb2461d1
and it probably wasn't detected in AB builds which might not enable fortran=
.

Regards,

On Mon, Jun 24, 2024 at 12:12=E2=80=AFPM Kai <kai.kang@windriver.com> wrote=
:
>
> On 6/19/24 23:00, Martin Jansa wrote:
> > See https://lists.openembedded.org/g/openembedded-core/message/200915
> > which allows to me to build nativesdk-gcc again.
>
> Thanks for your fix.
>
> Regards,
> Kai
>
> >
> > I've built nativesdk-libgfortran and libgfortran with the patch, but
> > haven't used fortran in runtime at all, that's why it's an RFC, there
> > were also 2 warnings:
> > WARNING: nativesdk-libgfortran-14.1.0-r0 do_package_qa: QA Issue: File
> > /opt/.../usr/lib/.debug/libgfortran.so.5.0.0 in package
> > nativesdk-libgfortran-dbg contains reference to TMPDIR [buildpaths]
> > WARNING: libgfortran-14.1.0-r0 do_package_qa: QA Issue: File
> > /usr/lib/.debug/libgfortran.so.5.0.0 in package libgfortran-dbg
> > contains reference to TMPDIR [buildpaths]
> > which I guess were already there.
> >
> > On Wed, Jun 19, 2024 at 3:24=E2=80=AFPM Martin Jansa via
> > lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org=
>
> > wrote:
> >> Something seems wrong with this change which was merged today, now wit=
h:
> >> MACHINE=3Dqemuarm64
> >> FORTRAN:forcevariable =3D ",fortran"
> >>
> >> I'm seeing:
> >> build/oe-core $ bitbake -g nativesdk-libgfortran
> >> NOTE: Resolving any missing task queue dependencies
> >> ERROR: Nothing PROVIDES 'gcc-cross-x86_64' (but
> >> virtual:nativesdk:/OE/build/oe-core/openembedded-core/meta/recipes-dev=
tools/gcc/libgfortran_14.1.bb
> >> DEPENDS on or otherwise requires it). Close matches:
> >>    gcc-cross-aarch64
> >> ...
> >>
> >> This might have been broken even before this change, but now it got
> >> included in dependency tree of nativesdk-gcc (as shown in bitbake -g
> >> nativesdk-gcc now failing when host and target arch don't match):
> >>
> >> "nativesdk-gcc.do_package_qa" -> "nativesdk-libgfortran.do_packagedata=
"
> >> nativesdk-gcc.do_package_write_ipk" -> "nativesdk-libgfortran.do_packa=
gedata"
> >>
> >> Missing or unbuildable dependency chain was: ['image',
> >> 'nativesdk-packagegroup-sdk-host', 'nativesdk-lcov',
> >> 'nativesdk-gcov-symlinks', 'nativesdk-libgfortran-dev',
> >> 'gcc-cross-x86_64']
> >>
> >> I guess the easiest fix would be in:
> >> meta/recipes-devtools/gcc/libgfortran.inc:DEPENDS =3D "gcc-runtime
> >> gcc-cross-${TARGET_ARCH}"
> >> but I'm not very familiar with fortran (we've enabled it long time ago
> >> to build lapack(blas) for snowboy, but wasn't actively used for couple
> >> years).
> >>
> >> Regards,
> >>
> >>
> >>
> >> On Sun, Jun 16, 2024 at 5:32=E2=80=AFPM Kai Kang via lists.openembedde=
d.org
> >> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
> >>> From: Kai Kang <kai.kang@windriver.com>
> >>>
> >>> It fails to run both `gcc` and `gfortran` with errors:
> >>>
> >>> | root@qemux86-64:~# x86_64-poky-linux-gcc a.c
> >>> | x86_64-poky-linux-gcc: fatal error: cannot execute 'as': posix_spaw=
np: No such file or directory
> >>>
> >>> then add binutils which provides `as` to RDEPENDS of gcc.
> >>>
> >>> libgfortran-dev provides libgfortran.spec which required by gfortran:
> >>>
> >>> | root@qemux86-64:~# gfortran hello.f95
> >>> | gfortran: fatal error: cannot read spec file 'libgfortran.spec': No=
 such file or directory
> >>>
> >>> And gcc provides liblto_plugin.so:
> >>>
> >>> | root@qemux86-64:~# gfortran hello.f95
> >>> | gfortran: fatal error: '-fuse-linker-plugin', but liblto_plugin.so =
not found
> >>>
> >>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>> ---
> >>>   meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
> >>>   1 file changed, 7 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-=
devtools/gcc/gcc-target.inc
> >>> index 8e9693b4cb..e9187fc444 100644
> >>> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> >>> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> >>> @@ -33,7 +33,7 @@ PACKAGES =3D "\
> >>>       ${PN} ${PN}-plugins ${PN}-symlinks \
> >>>       g++ g++-symlinks \
> >>>       cpp cpp-symlinks \
> >>> -    gfortran gfortran-symlinks \
> >>> +    ${@bb.utils.contains('FORTRAN', ',fortran', 'gfortran gfortran-s=
ymlinks', '', d)} \
> >>>       gcov gcov-symlinks \
> >>>       ${PN}-doc \
> >>>       ${PN}-dev \
> >>> @@ -60,7 +60,7 @@ RRECOMMENDS:${PN} +=3D "\
> >>>       libssp \
> >>>       libssp-dev \
> >>>   "
> >>> -RDEPENDS:${PN} +=3D "cpp"
> >>> +RDEPENDS:${PN} +=3D "binutils cpp"
> >>>
> >>>   FILES:${PN}-dev =3D "\
> >>>       ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
> >>> @@ -80,10 +80,15 @@ FILES:${PN}-plugins =3D "\
> >>>   "
> >>>   ALLOW_EMPTY:${PN}-plugins =3D "1"
> >>>
> >>> +INSANE_SKIP:${MLPREFIX}gfortran +=3D "dev-deps"
> >>>   FILES:gfortran =3D "\
> >>>       ${bindir}/${TARGET_PREFIX}gfortran \
> >>>       ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
> >>>   "
> >>> +RDEPENDS:gfortran =3D "\
> >>> +    gcc \
> >>> +    libgfortran-dev \
> >>> +"
> >>>   RRECOMMENDS:gfortran =3D "\
> >>>       libquadmath \
> >>>       libquadmath-dev \
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>>
> >>>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#200913): https://lists.openembedded.org/g/openembe=
dded-core/message/200913
> >> Mute This Topic: https://lists.openembedded.org/mt/106704990/3617156
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[martin.jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
> --
> Kai Kang
> Wind River Linux
>

