Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B459CC0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 14:44:47 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.34064.1690555478001150501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 07:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=P+ihzJSi;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1bbdddd3c94so1267524fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690555477; x=1691160277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpI3kbQHEKD4lgDbNBkmsAO3d04xBe0+JK3SUSetVI0=;
        b=P+ihzJSiFIohLnYQ9+ei2QsbiIZ3VTJUe8gBf9ASemsorwzftuJpSiNiq4qc8jgWO3
         t2CcOwOG5Xdg2zqKuXrLFMG1a2za20yJ7WvrWW5mEPXl67s0JxRFOpAMtIFluDajC0Ls
         1c+zqqGfUIQj+P53OhTtVmxQwbPjdXT79uPO3m8aPwi+E3VGNk5P4RFId/OC7cLWO2o3
         HLPXtQv+QpYj0SmiyygQv145uCttLuO39niqs35pIhiVxyb5MJlOnm6t8F6KTiE3Rr1K
         vwHiIfmRKP4sUl7yK6tbkk/DX4jo1CO2vmFpyhUGkDP4PgbSHP3XrFCt5y8VV4JwLbZk
         NE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690555477; x=1691160277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpI3kbQHEKD4lgDbNBkmsAO3d04xBe0+JK3SUSetVI0=;
        b=iNFHvbD0vU0z9K+qkyBRgrCAFUNj8PaBx0CcwGKv+Dz33nKNkZrpWor1Jss8MDM8mJ
         9q8J3L+lmxAE8qeWpfOr67KLz5eRQORDYthX4AkAOS5VShS4D04Y4cNaK8k79RH0a5TD
         fyaCRmDyw9HPn9wE6XJWZ7HFhWgOM99bTwSdmZ0M+909eX8zscaqlusSM/EJzIJCSyF6
         l/DHlQ17xYx0KUpBEHgQj9OR+PYAA3xeGfyksuGDclFxdZXVhd4CDFqOcRGQFm9Fu5qa
         0CGurT4dqnyQiSEzkNs6PuOuHPdevVQRlwCH/2gUqNZS/9xexjFpYMaJhmqmN4IbbqVV
         XOag==
X-Gm-Message-State: ABy/qLYJXFNFMqDvGyjbH3YN3slzZWspAdSBaLb4+OiYbdd3e04vYegT
	36WPU4P/o3xtU9TzPtMLOC6Xb3PogDaFcdPJU/GVpkKCx9A=
X-Google-Smtp-Source: APBJJlFXCbYAjeFaT9a3xmJsDivvpN1AY/OJDGpP9E9sf1S/Shk5GVAiijRo3vvfIxmxkYY0y8C8qHejtyu0VTduG3Y=
X-Received: by 2002:a05:6871:1c4:b0:1bb:4ec1:50af with SMTP id
 q4-20020a05687101c400b001bb4ec150afmr2950129oad.4.1690555477001; Fri, 28 Jul
 2023 07:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230727143627.3718496-1-alex@linutronix.de> <20230727143627.3718496-8-alex@linutronix.de>
 <3365158d-96a0-3d0d-1129-337efb34f50b@gmail.com> <CANNYZj8pdcvQebawV2q4gnH09VRs=hgM9WNoJYQaa+4y-dUhRA@mail.gmail.com>
In-Reply-To: <CANNYZj8pdcvQebawV2q4gnH09VRs=hgM9WNoJYQaa+4y-dUhRA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2023 07:44:10 -0700
Message-ID: <CAMKF1soCnz4zD=AvryDAfZ8a8i_5NOr-tZ7ROS-NcWf2aC13=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/21] gnu-efi: upgrade 3.0.15 -> 3.0.17
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 14:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185034

On Fri, Jul 28, 2023 at 3:57=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 27 Jul 2023 at 18:09, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On 7/27/23 7:36 AM, Alexander Kanavin wrote:
> > > Unset LDFLAGS as the standard ones do not work when linking EFI binar=
ies
> > > (the new version of gnu-efi adds various apps).
> > >
> >
> > curious about which ldflags are problematic from OE env.
>
> | x86_64-poky-linux-ld
> --sysroot=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-l=
inux/gnu-efi/3.0.17-r0/recipe-sysroot
>   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
> -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-=
64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-efi/3.0=
.17-r0
>  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2=
-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-efi/3.=
0.17-r0
>  -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2=
-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-efi/3.=
0.17-r0
>  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2=
-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-efi/3.=
0.17-r0
>  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2=
-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot=3D
>  -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2=
-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot=3D
>  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2=
-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot-native=3D
>  -Wl,-z,relro,-z,now -nostdlib --warn-common --no-undefined
> --fatal-warnings --build-id=3Dsha1 -nostdlib --warn-common
> --no-undefined --fatal-warnings --build-id=3Dsha1 -shared -Bsymbolic
> -L../lib -L../gnuefi ../gnuefi/crt0-efi-x86_64.o ctors_test.o
> ctors_fns.o -o ctors_test.so -lefi -lgnuefi
> /srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi=
/3.0.17-r0/recipe-sysroot/usr/lib/../lib/x86_64-poky-linux/13.1.1/libgcc.a
> -T /srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-=
efi/3.0.17-r0/gnu-efi-3.0.17//apps/../gnuefi/elf_x86_64_efi.lds
> | x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'
> | x86_64-poky-linux-ld: use the --help option for usage information
>

I see, OE LDFLAGS assume compiler driver to call linker and thats why
bunch of -Wl, options are used but here, bare ld is called. Does it
make sense to use CCLD
as linker instead of bare LD in these makefiles. Some options like
prefix map etc might be useful for removing build time paths and
hash-style is also important one.

>
> > > -FILES:${PN} +=3D "${libdir}/*.lds"
> > > +FILES:${PN} +=3D "${libdir}/*.lds ${libdir}/gnuefi/apps"
> >
> > Do you think if there is any positives of these be packaged separately?
>
> Not really. gnu-efi is a static library that consumers (e.g.
> systemd-boot) link with at build time, so the main package has nothing
> other than these apps, and one small .lds file. If there's a better
> way, it should be done by someone who's an expert in it.
>
> Alex

