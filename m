Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60448C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:43:49 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.3186.1748551422387064509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OcDN0DWZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-735ae68cc78so783984a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748551421; x=1749156221; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+FE0xpzA3bTmluJocIvzZbvsbC6qb4ajgvqgCrleQM=;
        b=OcDN0DWZlG3ReZQTHWj+aWTkASo73KTNc3ZShuQcrZ6Bl2s9edwFVcj1dvjUda+r4W
         QSbqSiOiHM4BSxjlKXaCBNdG669KnBIXqA51O0cyo8+TGLBPeccA4Uuff8XGVQ0n6dnp
         LPDVpj2CqjnahWC/OvC6q6Ab39VIlbwgLCpntybK+oFhq5SlB2iu9XNUGAi9qCKf7Hlj
         /rWb10tbNRAYgl0sJdil+i/6DtjwRuNPd/YB8Iec/jVyAOVThE4IgrmTTiul7MgzoEvp
         cShQoR/7Dh0khwa369kD9DpkCVodlZM1g16O5TY0EdVFIA7yRCiQOuPL9uOHQxY7hmJQ
         H4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748551421; x=1749156221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+FE0xpzA3bTmluJocIvzZbvsbC6qb4ajgvqgCrleQM=;
        b=iJVQODevmJWqWarmxU3TXO/obzqlV4ErKHo2vitFVOCdzpKJqoV+ES4dYJMDepSG49
         p22irqEhBY2DVaq3mfvWVVL2xOxXXeI1ze3joIRhZK5KvcWFfWl4C+T4eOnKpcjzsYFw
         GKb69HUVMujrnIs1sRuuG3oLoYoV1fVo86jsq6fx24fu1ImL4D/CqVRADCVOP1VQv7Ow
         zGTLlTlwySB/z6h9mdhJfszI00UAZgmHsdMlVsvWXCCfHz+P+qnoZXWOD8iHcglt6Qje
         dHo3431KlR/84oUQQ742XkJzRPBt8FOc1CMtXaAeTpJX/4YZWOpK+AJdhQ4afMbkiVcN
         juaA==
X-Gm-Message-State: AOJu0Yy9CM/Vn6Wqkt3TACERP3umyoDANJvjR4D1Giy5xv8o734xd2MZ
	hLWjwrfR24w/cNDP2F2Gmg2W/3dX+zu6P5pGT7PDWTzzor1mCFZQJbOBfehVVwgE5ZmWSjztaYz
	CKCZaGpnBwrvf/cmaXOJW0HgIgDghYIA=
X-Gm-Gg: ASbGncshVjeI/J13GyRN6bN2SJmIjoDP7r3yDw//GZKRNuQPH/hwi6vB4jjemHGSu4x
	gi1bmkLDkODFCUdkL5fWLf6Z9Z3OmFaMSUJJXxg33GB/dKs0+rrilY3XaqD685QiXG7yrkhGf26
	4up6qMYhX/2Wo+ZEjOPBSkX8jU0O4Qp0Ni3TI4wM1Nhlk=
X-Google-Smtp-Source: AGHT+IEIXbgKM4fWRfffa3NR+CYz53/RB7CAeZcniG8GkC4ukrU7FsvrR6qWSsQoXbc79unQKMkdecalxtDbZ0Rz9G4=
X-Received: by 2002:a05:6870:ea07:b0:2d5:1d1:8613 with SMTP id
 586e51a60fabf-2e921393cf9mr454551fac.23.1748551421339; Thu, 29 May 2025
 13:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
 <20250522-clang-toolchain-v3-7-16cfc6d9891b@gmail.com> <4FFE439D-3DDE-4B8E-BD3A-1E8C0B76A387@arm.com>
In-Reply-To: <4FFE439D-3DDE-4B8E-BD3A-1E8C0B76A387@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 May 2025 13:43:15 -0700
X-Gm-Features: AX0GCFuf7LtrdgB9eX1-AafVT5ueo0pi7YHmn9ylrD4fDgTxOhgRhD0gcmBLokQ
Message-ID: <CAMKF1srPfigZbCQvwuzq0qnN9+razOu5uTHzEt7s-WOajs87hA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 07/13] pixman: Fix build with mips/clang
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217448

On Thu, May 29, 2025 at 2:25=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 23 May 2025, at 04:52, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > +DEPENDS:append:toolchain-clang:mipsarch =3D " openmp=E2=80=9D
>
> Can you elaborate on why openmp is only needed for mips with clang, and n=
o other targets?
>

seems pixman's detection logic for openMP support checks for including
omp.h. I see for qemumips, it ends up detecting openmp even when its
not in dependencies because omp.h is
installed by libgomp from gcc-runtime.


Run-time dependency OpenMP found: YES 5.1


where the same test on qemuarm64 fails with

mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux-musl/pixm=
an/0.46.0/build/meson-private/tmpyl863djw/testfile.c:4:12:
error: "Header 'omp_lib.h' could not be found"
    4 |           #error "Header 'omp_lib.h' could not be found"
      |            ^
1 error generated.
-----------
WARNING: OpenMP found but omp.h missing.
Run-time dependency OpenMP found: NO (tried system)

It culminates to a problem in header include paths that mips and
aarch64 clang is using

mips
#include <...> search starts here:
 /mnt/b/yoe/master/sources/poky/build/tmp/work/mips32r2-poky-linux-musl/pix=
man/0.46.0/recipe-sysroot/usr/lib/mips-poky-linux-musl/15.1.0/include
 /mnt/b/yoe/master/sources/poky/build/tmp/work/mips32r2-poky-linux-musl/pix=
man/0.46.0/recipe-sysroot/usr/include
 /mnt/b/yoe/master/sources/poky/build/tmp/work/mips32r2-poky-linux-musl/pix=
man/0.46.0/recipe-sysroot-native/usr/lib/clang/20/include
End of search list.

aarch64
#include <...> search starts here:
 /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux-musl/pi=
xman/0.46.0/recipe-sysroot/usr/include
 /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux-musl/pi=
xman/0.46.0/recipe-sysroot-native/usr/lib/clang/20/include
End of search list.

that's why it finds omp.h since the path is on searchdir on mips but
not on aarch64, I think mips behavior is unwanted.

I think the linking to openmp should be unconditional on clang, since
it will be using it with gcc but then disables it for clang since the
test fails. I will send another version

> Ross
>

