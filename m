Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6B9C0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 14:49:27 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.34215.1690555760927320352
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 07:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Mrp/0dW1;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5658573b1faso1488924eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690555760; x=1691160560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyOK591VUwpqNNQfcDba6urBBR4jhbeMHQSzyyT5EHI=;
        b=Mrp/0dW1Jb1ff9U11apdXLPf6oDDIrAY+bOr18wH0gvV+POgO15Umba+kc1Do3Wjxt
         av+EcSyecYECt9VXRxzTexearNuZcgV8FVgPpYRsZ5sOCyd8MbCYblkF9+tEvybQ89Yq
         FaNS7V6edFhsC18aazWbylwga/yqqLcxaF2S2IxiUkubsUHlNEOV4cDCheniEsajcOLV
         toO82XBqb085z70XxWzP/6ISYgzZFVfg6PmrfzR43wRavWbE2bIvRGV0Df+lvrNFzVOc
         0R2jzQBGTnzbDTvKHgyAU6iFuF18r1eWpcql/MxgKd1lfkZ77A9uZ2vTh96irzd0DLbS
         A6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690555760; x=1691160560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyOK591VUwpqNNQfcDba6urBBR4jhbeMHQSzyyT5EHI=;
        b=QXOt6U4TRZ3PpAJL63myovajbrd8pgA6Z+BCxvs+0oO6Isvp14e/FjBXsUSj8/kyhN
         dkbLrIVTytJxZRTa0zOeSCXxH2aBtkeGM9fz5Bju1tMk69Ix8IviqMbDorISzOdDDl1n
         yT+iIzFrvZUjiHj0n5OPL6jnblJoq0/eYTsiIRxQ6gmCehy06Q4lhhjOoNxX0k/oGydC
         +1eXgj8pwH+2SigDkH9IDIJrlitQyNtDWTthw4iVpVhBN/x8nR9knlyiZqzGwURzOTZ6
         xnrNxtHzyh8JmaFc6V/VXxwr1JYlcAFMT1itL8QGbowOhKSF0vBtOU9GJZTG//L55kiM
         0f0A==
X-Gm-Message-State: ABy/qLaMByYbGIjzJFOh/NyA2x3NwmFoZnlcUv78Y3C21IryuihWK/iX
	l82JmvgU0XS2xmlGwue2gkF9t3jLxywoAxakBjBiIfyCeAU=
X-Google-Smtp-Source: APBJJlHHmlFo945RkJpx1e/ZbJS0NAM4nVag8YYFDIHSS6h/FY7khSJ1aCaVlr6F+yPGbrzgVeUGh11rZywTKiCh0Fk=
X-Received: by 2002:a4a:6b4c:0:b0:566:f3f1:5f5c with SMTP id
 h12-20020a4a6b4c000000b00566f3f15f5cmr2661567oof.9.1690555759983; Fri, 28 Jul
 2023 07:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230727143627.3718496-1-alex@linutronix.de> <20230727143627.3718496-8-alex@linutronix.de>
 <3365158d-96a0-3d0d-1129-337efb34f50b@gmail.com> <CANNYZj8pdcvQebawV2q4gnH09VRs=hgM9WNoJYQaa+4y-dUhRA@mail.gmail.com>
 <CAMKF1soCnz4zD=AvryDAfZ8a8i_5NOr-tZ7ROS-NcWf2aC13=g@mail.gmail.com> <CANNYZj-BPvhxcJn1K7-kkpZmWm_9Qhr2usFToj1cWTfMVs2FGw@mail.gmail.com>
In-Reply-To: <CANNYZj-BPvhxcJn1K7-kkpZmWm_9Qhr2usFToj1cWTfMVs2FGw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2023 07:48:53 -0700
Message-ID: <CAMKF1spCBvPG+1qy2jMkn-jRz3Bb6ew_zMU1ytb=QCsTZgKaDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/21] gnu-efi: upgrade 3.0.15 -> 3.0.17
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 14:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185036

On Fri, Jul 28, 2023 at 7:47=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Maybe. My goal is only to update the version; if you can experiment
> with CCLD vs LD and send a followup I'd appreaciate. (I don't even
> know what the difference is). The update passed a-full, so it doesn't
> cause obvious problems at least.

yeah, something that should be discussed upstream first perhaps.
>
> Alex
>
> On Fri, 28 Jul 2023 at 16:44, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Jul 28, 2023 at 3:57=E2=80=AFAM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > On Thu, 27 Jul 2023 at 18:09, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On 7/27/23 7:36 AM, Alexander Kanavin wrote:
> > > > > Unset LDFLAGS as the standard ones do not work when linking EFI b=
inaries
> > > > > (the new version of gnu-efi adds various apps).
> > > > >
> > > >
> > > > curious about which ldflags are problematic from OE env.
> > >
> > > | x86_64-poky-linux-ld
> > > --sysroot=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-po=
ky-linux/gnu-efi/3.0.17-r0/recipe-sysroot
> > >   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
> > > -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/co=
re2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-efi=
/3.0.17-r0
> > >  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/c=
ore2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-ef=
i/3.0.17-r0
> > >  -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/c=
ore2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-ef=
i/3.0.17-r0
> > >  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/c=
ore2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-ef=
i/3.0.17-r0
> > >  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/c=
ore2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot=3D
> > >  -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/c=
ore2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot=3D
> > >  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/c=
ore2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot-native=3D
> > >  -Wl,-z,relro,-z,now -nostdlib --warn-common --no-undefined
> > > --fatal-warnings --build-id=3Dsha1 -nostdlib --warn-common
> > > --no-undefined --fatal-warnings --build-id=3Dsha1 -shared -Bsymbolic
> > > -L../lib -L../gnuefi ../gnuefi/crt0-efi-x86_64.o ctors_test.o
> > > ctors_fns.o -o ctors_test.so -lefi -lgnuefi
> > > /srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu=
-efi/3.0.17-r0/recipe-sysroot/usr/lib/../lib/x86_64-poky-linux/13.1.1/libgc=
c.a
> > > -T /srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/=
gnu-efi/3.0.17-r0/gnu-efi-3.0.17//apps/../gnuefi/elf_x86_64_efi.lds
> > > | x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'
> > > | x86_64-poky-linux-ld: use the --help option for usage information
> > >
> >
> > I see, OE LDFLAGS assume compiler driver to call linker and thats why
> > bunch of -Wl, options are used but here, bare ld is called. Does it
> > make sense to use CCLD
> > as linker instead of bare LD in these makefiles. Some options like
> > prefix map etc might be useful for removing build time paths and
> > hash-style is also important one.
> >
> > >
> > > > > -FILES:${PN} +=3D "${libdir}/*.lds"
> > > > > +FILES:${PN} +=3D "${libdir}/*.lds ${libdir}/gnuefi/apps"
> > > >
> > > > Do you think if there is any positives of these be packaged separat=
ely?
> > >
> > > Not really. gnu-efi is a static library that consumers (e.g.
> > > systemd-boot) link with at build time, so the main package has nothin=
g
> > > other than these apps, and one small .lds file. If there's a better
> > > way, it should be done by someone who's an expert in it.
> > >
> > > Alex

