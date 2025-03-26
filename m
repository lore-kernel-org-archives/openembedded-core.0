Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7A4C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 19:27:01 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.31804.1743017212579886113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 12:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O+CpGx4z;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3fa0eb29cebso773652b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743017212; x=1743622012; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJLf3m3NmK6EG8GJIdvQbds8jNi215y8Pogwq0+tGZQ=;
        b=O+CpGx4zvFZm7dPvMq/62eIJxKzl+GraDaIN6quE2cD6zi+ZZ0tz9toL7mY7xWbysl
         VCm8vm0V2OTQxCJVzezca2wIiQf7hYgfAvS+EWRW1aFJgE9ICWKUvS29I9a9uHFHlZIv
         AquQT/d6O/pxWXFH2Qeww74idjNZeTissRvTOYVYU1uEL3ewiEccWvSncvC7fT4gfNbD
         0/EeRL+eyWwLY/bERkPBeVO8QjM4/QeZxjatzLUGrb6HiASRI05txDwy1tol0xc0NAOK
         s5JkwmEtFQm/q0CuOp6kFYy7X0JlUEqZO1RfoAzGuIB91nntqhdnMiobhaSq0ZbBahpn
         YBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743017212; x=1743622012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJLf3m3NmK6EG8GJIdvQbds8jNi215y8Pogwq0+tGZQ=;
        b=Bzdu1cH1LOq1OnEirju5VrMZ+Z4H6FhZruV5z0EDqy2LvdCymCeEbJKxcHGzvQRzy7
         sukHXYfCNNsqCISR+jAfHo52PdF8MmeUHrhugeQiqkZpmIwjx7hMMbhUsMG4+zpzSzFH
         BmpoI+3kIvqOfKG245kE3D85pK/Evfyo/v0FYHDd5UUb4iOhgvL8E2YLw7NKv97cNAlw
         WDZZsG+ONKCPpp2212prhtOaVzdobyc/IC+nPWvbogoyux9ERlTRjC8dDGrTO/DHwAlO
         +UMzK+N2fVtQudTbFomLskLHCTx0aHL7Sh6810c7PKKtMySH8SaHnx67Qjydswls0Hmn
         I3dA==
X-Forwarded-Encrypted: i=1; AJvYcCWqZVuKsKWRaeDyiwUx/csnuFChMDlFMbOKnE0AZTCksB1D4fFXG69lPQ0u5eEAG/Ot/47sKFgSM99j8RP0Rh1obA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzfTk0S+N/OipPXvkiMaJTslaFfSDu/vItb0OgFhebGY+Enq5tH
	wa/qlllQPfJBrfPmNO/97+v/UDMTcVnmYIPjafVkIdDan+PxcE1161gvJKQ9Rc36eaAKrdUmLF0
	YXJdsQrFYbGH1GPg/Vqzx4d/sRTY=
X-Gm-Gg: ASbGncu0pIrg/oAH0pbYjyMt/MGxFXoTiUfTRjNgNTusswI3heqwaUe19fAc/067lrA
	jiGHgzmYqDSvwbQ1HHkoiDYHBVHI1QkZ/l7F/oaVbHpsQnwOUGdLBWnmwtyGKDAOeBydSB8c9F8
	er+qIKFpJgN1DvhyNOKmwI/2LVDrqeEUbu9bOI/BwXcHpEfTmIkJ6yjg==
X-Google-Smtp-Source: AGHT+IH3zzbl8Ny4j8ifHwcoRjaXCDP7/gFwq1TzWXFeJ+p1p1w4TJXJ2BML/cMzczoG20vSbQ4q9x1QnN5FEc04sck=
X-Received: by 2002:a05:6808:1b9b:b0:3f3:fe04:f86 with SMTP id
 5614622812f47-3fef9b61461mr834799b6e.0.1743017211465; Wed, 26 Mar 2025
 12:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <5be84788-6fa5-453c-83bc-d547246dc037@bootlin.com>
 <296b0e95be234db91dfaa8164e45d035973aa459.camel@linuxfoundation.org> <29e667c7-c9d9-496c-b7b7-bf580c39eda4@bootlin.com>
In-Reply-To: <29e667c7-c9d9-496c-b7b7-bf580c39eda4@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Mar 2025 12:26:24 -0700
X-Gm-Features: AQ5f1JoTqK0nIcuNgJrd3ZPP_0F_4yY5JY1S7ynzfiz4UJukJ6aGdGKmzMBcHaw
Message-ID: <CAMKF1srT0JWLi5+1gv+W2xu-HyfzgZRaGAgFAGeHVx75+YOdsg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] recipe's sysroot misconfiguration in multilib
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org, 
	Thomas Perrot <thomas.perrot@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 19:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213659

On Wed, Mar 26, 2025 at 12:15=E2=80=AFPM Joao Marcos Costa
<joaomarcos.costa@bootlin.com> wrote:
>
> Hello, Richard
>
> Thanks for your reply
>
> On 3/26/25 19:55, Richard Purdie via lists.openembedded.org wrote:
> > On Wed, 2025-03-26 at 19:47 +0100, Joao Marcos Costa wrote:
> >> I have been trying to set up a multilib environment to generate
> >> libraries built with Control Flow Integrity support. The gcc toolchain
> >> is already patched to support this custom multilib ABI, and it is inde=
ed
> >> capable of generating binaries with the CFI flags.
> >>
> >> I am, however, facing this strange issue where a header is not found i=
n
> >> the multilib recipe-sysroot (i.e., libcfi-recipe-sysroot) of a given
> >> package (e.g., zstd), and do_compile task fails:
> >>
> (...)
> >>
> >> Besides my TUNE_*, DEFAULTTUNE, BASE_LIB values set up, I also added
> >> 'GCCMULTILIB =3D "--enable-multilib"' to gcc-cross.inc, to enable mult=
ilib
> >> for the cross toolchain. Could I be missing something, maybe with
> >> recipes-devtools/gcc/gcc-multilib-config.inc?
> >
> > I'm finding it odd that you have to add --enable-multilib since in
> > general with gcc-cross, we use separate cross toolchains for each
> > multilib. This kind of implies you're configuring the setup differently
> > to how the system would expect.
>
> If I don't, my cross toolchain is configured with "--disable-multilib".
> To confirm this, I ran gcc with "-v" from within the recipe's native
> sysroot, and the output is:
>
> Target: riscv64-freedomusdkmllibcfi-linux
> Configured with:
> ../../../../../../work-shared/gcc-internal-13.2.0-r0/git/configure
> --build=3Dx86_64-linux --host=3Dx86_64-linux
> --target=3Driscv64-freedomusdkmllibcfi-linux --prefix=3D//host/usr
> --exec_prefix=3D//host/usr
> --bindir=3D//host/usr/bin/riscv64-freedomusdkmllibcfi-linux
> --sbindir=3D//host/usr/bin/riscv64-freedomusdkmllibcfi-linux
> --libexecdir=3D//host/usr/libexec/riscv64-freedomusdkmllibcfi-linux
> --datadir=3D//host/usr/share --sysconfdir=3D//host/etc
> --sharedstatedir=3D//host/com --localstatedir=3D//host/var
> --libdir=3D//host/usr/lib/riscv64-freedomusdkmllibcfi-linux
> --includedir=3D//host/usr/include --oldincludedir=3D//host/usr/include
> --infodir=3D//host/usr/share/info --mandir=3D//host/usr/share/man
> --disable-silent-rules --disable-dependency-tracking
> --with-libtool-sysroot=3D//host --enable-clocale=3Dgeneric --with-gnu-ld
> --enable-shared --enable-languages=3Dc,c++,fortran --enable-threads=3Dpos=
ix
> --disable-multilib --enable-default-pie --enable-c99 --enable-long-long
> --enable-(...)
>
> As a consequence, the build fails even before it gets to libcfi-zstd:
>
> ...libcfi-glibc-internal/2.37/recipe-sysroot-native/usr/bin/riscv64-freed=
omusdkmllibcfi-linux/../../libexec/riscv64-freedomusdkmllibcfi-linux/gcc/ri=
scv64-freedomusdkmllibcfi-linux/13.2.0/ld.bfd:
> cannot find -lgcc: No such file or directory
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [Makefile:1293:

OE's notion of multilib is at system level, which means it will need
full runtimes for the chosen multilibs, GCC builds the compiler
runtime and has its own
directory naming structure to place them which may not be inline with
what OE toolchain is doing. For hosted targets we do not build a
toolchain with all
possible multilibs for a given architecture which technically is
possible with gcc. our mutlilibs are a small subset of that and that
is what toolchain will recognise
provided its placed in right locations in sysroot.

> ...libcfi-glibc-internal/2.37/build-riscv64-freedomusdkmllibcfi-linux/elf=
/librtld.map]
> Error 1
>
>
> >
> > The recipe-sysroot-native/installeddeps/ directory will show you what
> > is installed in each and might help narrow down the size difference.
> >
>
> Oddly enough, both installeddeps seem to contain (at least) the same
> number of items:
>
> $ ls -l zstd/1.5.5/recipe-sysroot-native/installeddeps/ | wc -l
> 74
> $ ls
> ../riscv64cfi-freedomusdkmllibcfi-linux/libcfi-zstd/1.5.5/recipe-sysroot-=
native/installeddeps/
> -l | wc -l
> 75
>
> But, to be honest, my comparison didn't go any further than comparing
> this line count.
>
> > Cheers,
> >
> > Richard
>
> Thanks!
>
> --
> Best regards,
> Jo=C3=A3o Marcos Costa

