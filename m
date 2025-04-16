Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8DAC369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 10:11:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.15488.1744798256199691304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 03:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VbFKZxS6;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso46941045e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744798254; x=1745403054; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QgMnUM6T/3BGMwjiTZjRJLs/Nkup/oQZpGYik3+qVZw=;
        b=VbFKZxS6U6/9Qvc1715IQmyLIUSqMQO7VWUaWHVDJsE+VsqbAJ8Ul9qyfWzuxVhS9M
         GBbXvnZBQpnBCSIqkH2NrFc1bOOrCn2wg4nzRbE4cXHsw73QEBIby01xTUtdrZb0ESiD
         dk1RyQpBSwRY72271dBc4fmBMToR1HN8OzQoqUkeC5PMQwdjQgjWdJsEhZ6YlM3zFrRj
         /dAH+yBiD2YuA1YxJyPJMcV/hN+nGB2xVAbuj2yDhAkFfzne6+ChkGiE9Gmttsp2yMYc
         58R1KruKmIwAgHok/F37DZGHkM+zpoNegW45BKg61XHioXodt/RKGU6UQgLXbHUBxAkj
         WDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798254; x=1745403054;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgMnUM6T/3BGMwjiTZjRJLs/Nkup/oQZpGYik3+qVZw=;
        b=bzogMHanSew0uoJNYzfGEL1iHvKuZbX1+8+BoQC1L8tc7RReVnWZTZhCfEWXpn+Zmk
         ymNeEGANGJmctVdgZAteeWr4n+4owkqLDkOg58RulSCHW3hhh5S7ZJLHTyRMyG3454El
         1d4dIqDaQHOYIiNgSKw1k6sz0To6xOe2qHSJzPASM4mZC0BYROk9wwoheH2w3Msc22UF
         DCuNTXjW4mliEqzlOXsKxEbUNtuLaHLANzOR6g5+j0gIo5RD3Lb/lQ0/+HfY5i/uf8oI
         UA3xrYpMs17RI3xMIVn5aMbIDCIiXuFWkHGfQBw0i21iuGveFuLBFk5c1hyuBQY+NIGf
         OU9w==
X-Gm-Message-State: AOJu0Yx5/OnmjKoHvUmHJYzTbF+omCe7WftliiKNQrh1Dq2l+N9cURnu
	TLrUHNWFEs3VqyR0Kj0ALVuTzdleE7EuzW4pUvh8+LyC/BD5f9e+
X-Gm-Gg: ASbGncvILt2EfwyntIZXQJyQSFYq+sjq7mDjrf+ljMxgLkgsR5zVHpy8pJdZLWVj292
	oCm0N9arr1pJPMo5cveUoWWdBWvlg/0Dk2A0CtrydHONd6GmG6AZQzsPjJASxIyQ0ZnhYT3IG8R
	fSFG6GvEW2mRX7S0W9fOifIM8DvBdm7u6wav0DvdZbZYo5eMG85UV9JcuzPkQgzcT3Vr3NbDGjd
	UDhPTVveQK545YIlVTEvL9N54ADCgilB1xPUNGPP7ZlV+8z3y1fCLcHP4LoJMhzYvdLXul50iJo
	7itp7o7P1NZqvu2E7QM8J+wCSEzw1Xz9ocIhoXwMP8UB9Gda2Yu631CYrsLKJ7MzoVtYjT2iZ+Q
	6wWYSBZxq0yRqjQ==
X-Google-Smtp-Source: AGHT+IF5totbxVFyAakIia5RV3dazp61Eczm3Yn7OEEi6AkS2r74n2KOKUUPc7HSsn9zrg1dgBQ/ZA==
X-Received: by 2002:a05:600c:3487:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4405d62a49cmr14962315e9.16.1744798254214;
        Wed, 16 Apr 2025 03:10:54 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d1236sm16684875e9.13.2025.04.16.03.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:10:53 -0700 (PDT)
Message-ID: <f8e9b63f9308ad26999ff1e8c4a2ee4aaeb75fa9.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by
 default
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>, "mike.looijmans@topic.nl"	
 <mike.looijmans@topic.nl>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Wed, 16 Apr 2025 12:10:53 +0200
In-Reply-To: <Z_9JcY4ANLN7SPvJ@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
	 <20250404162932.447699-2-mikko.rapeli@linaro.org>
	 <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl> <Z_jy0-3v8qVSyll8@nuoska>
	 <960572ae-f816-4d55-b935-8e11e2dad89f@topic.nl>
	 <CAB3asfhjnUAm-sB=Q4mk9whXUMdgaBZk0kwiwYKKyPJ0ydnU2w@mail.gmail.com>
	 <Z_4sMeEiHjZ8ydfs@nuoska>
	 <DB5PR02MB102130E10617CF99E82F6A94FEFB22@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <Z_9JcY4ANLN7SPvJ@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 10:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214987

On Wed, 2025-04-16 at 09:08 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Tue, Apr 15, 2025 at 04:20:50PM +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From:
> > > openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@list=
s.openembedded.org
> > > > On Behalf Of Mikko Rapeli via lists.openembedded.org
> > > Sent: den 15 april 2025 11:52
> > > To: Adrian Freihofer <adrian.freihofer@gmail.com>
> > > Cc: openembedded-core@lists.openembedded.org;
> > > mike.looijmans@topic.nl
> > > Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi
> > > support by default
> > >=20
> > > Hi,
> > >=20
> > > On Mon, Apr 14, 2025 at 06:28:13PM +0200, Adrian Freihofer wrote:
> > > > Hi Mikko
> > > >=20
> > > > Would it be possible to provide some numbers on the impact on
> > > > the size of
> > > > the binaries and the additional dependencies that could be
> > > > added to the
> > > > image with or without efi enabled?
> > > > I think the patch would be a very good compromise if the impact
> > > > is
> > > > negligible, but otherwise the question is probably still valid.
> >=20
> > I have probably missed something in this very long thread, but what
> > is the=20
> > reason to force EFI support on us rather than relying on the efi
> > distro=20
> > feature? We do not use EFI in any of our products and thus do not
> > have it=20
> > set in DISTRO_FEATURES. If it is suddenly expected that EFI support
> > should=20
> > be enabled all over the place it just means I will have to go
> > hunting for=20
> > it to turn it off rather than just relying on the existing distro
> > feature.
>=20
> Is it ok for Richard to enable "efi" in poky/poky-altcfg
> DISTRO_FEATURES
> by default?
>=20
> It is already enabled in MACHINE_FEATURES for oe-core machines I care
> about.
>=20
> > >=20
> > > The impact is small:
> > >=20
> > > =C2=A0* python3-pyelftools-native is added to build dependencies
> > >=20
> > > =C2=A0* At runtime the efivars partition is now automatically mounted
> > > read-only by
> > > =C2=A0=C2=A0 systemd to /sys/firmware/efi/efivars and can be used to =
query
> > > various firmware
> > > =C2=A0=C2=A0 and EFI bootloader (grub, systemd-boot) details
> > >=20
> > > =C2=A0* Since "efi" is now default, other layers can stop enabling it=
:
> > >=20
> > > =C2=A0=C2=A0
> > > https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-core/syst=
emd/systemd-efi.inc
> > > =C2=A0=C2=A0
> > > https://git.yoctoproject.org/meta-security/tree/meta-tpm/recipes-core=
/systemd/systemd_%25.bbappend#n5
> > > =C2=A0=C2=A0
> > > https://github.com/Wind-River/meta-secure-core/blob/master/meta-efi-s=
ecure-boot/recipes-core/systemd/systemd-efi-secure-boot.inc
> >=20
> > But isn't the problem here rather that these layers want to force
> > EFI=20
> > support instead of using, e.g., REQUIRED_DISTRO_FEATURES =3D "efi"?
>=20
> These layers want to enable EFI support but don't want to change the
> poky/poky-altcfg
> distro settings.
>=20
> In machine features "efi" is already enabled but it was rejeted here
> to use
> MACHINE_FEATURES in systemd.
>=20
> So full loop in the discussion...?
>=20
> Enabling systemd "efi" support by default is a tiny thing which would
> get lost
> all the other changes and IMO would not impact anyone significantly
> at runtime or at build time. Those who optimize systemd for e.g. non-
> EFI
> systems should be setting PACKAGECONFIG fully to their liking.

I understand why ARM is pushing for EFI by default.
- For servers, laptops, makers and other use cases, it is important to
provide a stable ABI between the bootloader and the rest of the system.
However, so far this is often just a =E2=80=9Cnice to have=E2=80=9D require=
ment for
truly industrial-grade, robust, Yocto-based embedded products.
- In the future, features like secure boot or remote attestation will
become much more important for many products. I think EFI (in
combination with a TPM) can be of great help in this area. So it seems
to be less a question of whether EFI will find its way into more
OE/Yocto-based products, but much more a question of when it will find
its way into more OE/Yocto-based products. Maybe it should become the
default as soon as possible.

>=20
> > >=20
> > > =C2=A0* /usr/lib/systemd/libsystemd-shared-257.so size increases 32
> > > bytes from
> > > =C2=A0=C2=A0 4012152 to 4012184 bytes, 0.0008%

That looks like a great compromise for EFI built-in by default.

> > >=20
> > > =C2=A0* systemd package size increase from 9857529 to 10226508, 3.7%,
> > > with
> > > =C2=A0=C2=A0 added files:
> > >=20
> > > +drwxr-xr-x root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 root=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096
> > > ./usr/lib/systemd/boot
> > > +drwxr-xr-x root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 root=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096
> > > ./usr/lib/systemd/boot/efi
> > > +-rw-r--r-- root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 root=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6144
> > > ./usr/lib/systemd/boot/efi/addonaa64.efi.stub
> > > +-rw-r--r-- root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 root=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 101376
> > > ./usr/lib/systemd/boot/efi/linuxaa64.efi.stub
> > > +-rw-r--r-- root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 root=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 120832
> > > ./usr/lib/systemd/boot/efi/systemd-bootaa64.efi
> > > +-rwxr-xr-x -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 67656
> > > ./usr/lib/systemd/systemd-bless-boot
> > > +-rwxr-xr-x -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 67456
> > > ./usr/lib/systemd/system-generators/systemd-bless-boot-generator
> > > +lrwxrwxrwx -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 25
> > > ./usr/lib/systemd/system/sockets.target.wants/systemd-
> > > bootctl.socket -> ../systemd-bootctl.socket
> > > +lrwxrwxrwx -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 35
> > > ./usr/lib/systemd/system/sysinit.target.wants/systemd-boot-
> > > random-seed.service -> ../systemd-boot-random-seed.service
> > > +lrwxrwxrwx -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 34
> > > ./usr/lib/systemd/system/sysinit.target.wants/systemd-hibernate-
> > > clear.service -> ../systemd-hibernate-clear.service
> > > +-rw-r--r-- -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 690
> > > ./usr/lib/systemd/system/systemd-bless-boot.service
> > > +-rw-r--r-- -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 532
> > > ./usr/lib/systemd/system/systemd-bootctl@.service
> > > +-rw-r--r-- -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 596
> > > ./usr/lib/systemd/system/systemd-bootctl.socket
> > > +-rw-r--r-- -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1029
> > > ./usr/lib/systemd/system/systemd-boot-random-seed.service
> > > +-rw-r--r-- -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 733
> > > ./usr/lib/systemd/system/systemd-boot-update.service
> > > +-rw-r--r-- -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 782
> > > ./usr/lib/systemd/system/systemd-hibernate-clear.service
> > > +-rw-r--r-- -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 779
> > > ./usr/lib/tmpfiles.d/20-systemd-stub.conf
> > >=20
> > > =C2=A0 This shows a bug in the config between systemd and systemd-
> > > boot, the EFI binaries are
> > > =C2=A0 provided by both. Sadly systemd-boot doesn't work so well and
> > > doesn't install all
> > > =C2=A0 the services etc which systemd does with "efi" and bootloader
> > > enabled. Not sure
> > > =C2=A0 if the overlap should be fixed or ignored. Using meson to
> > > install systemd-boot
> > > =C2=A0 binaries does fix deployment of the EFI binaries but does not
> > > install the
> > > =C2=A0 random-seed etc services. With this workaround to avoid the EF=
I
> > > file duplication
> > > =C2=A0 in systemd recipe:

It looks to me like more cleanup is needed here before EFI can be
enabled by default. It should be possible to get only the 0.0008% extra
size of the systemd package into an image if systemd is compiled with
EFI support, but the systemd-boot package is not installed into the
image.

There should also be some kind of confirmation from the systemd
community that such a package split is supported by design and will
remain so in the future. At least the Fedora package distribution looks
like this:
https://src.fedoraproject.org/rpms/systemd/blob/rawhide/f/systemd.spec#_560
.

I'm not sure if some tests are needed to check that compiling with efi
but using it without the systemd-boot package actually works. But at
the moment it seems a bit too much like taking risks for non-EFI users.

Thank you for sharing these numbers!
Adrian


> > >=20
> > > --- a/meta/recipes-core/systemd/systemd_257.5.bb
> > > +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> > > @@ -149,7 +149,7 @@ PACKAGECONFIG[default-compression-lz4] =3D "-
> > > Dlz4=3Dtrue -Ddefault-compression=3Dlz4,,
> > > =C2=A0PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue -Ddefaul=
t-
> > > compression=3Dxz,,xz"
> > > =C2=A0PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue -
> > > Ddefault-compression=3Dzstd,,zstd"
> > > =C2=A0PACKAGECONFIG[dbus] =3D "-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbu=
s"
> > > -PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Denabled,-
> > > Defi=3Dfalse -Dbootloader=3Ddisabled,python3-pyelftools-native"
> > > +PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Ddisabled,-
> > > Defi=3Dfalse -Dbootloader=3Ddisabled,python3-pyelftools-native
> > > systemd-boot"
> > >=20
> > > =C2=A0 size without "efi" is 9857529 bytes and with "efi" 9859196, or
> > > size increase
> > > =C2=A0 of 0.016% which is tiny. To stay closer to systemd upstream, I
> > > don't think
> > > =C2=A0 removing the duplication is worth the effort for now. systemd-
> > > boot
> > > =C2=A0 recipe could maybe be replaced by systemd recipe and a systemd=
-
> > > boot binary
> > > =C2=A0 package. Otherwise the configurations don't match. FWIW, it
> > > tried following
> > > =C2=A0 changes to systemd-boot:
> > >=20
> > > --- a/meta/recipes-core/systemd/systemd-boot_257.5.bb
> > > +++ b/meta/recipes-core/systemd/systemd-boot_257.5.bb
> > > @@ -24,6 +24,7 @@ EOF
> > > =C2=A0MESON_CROSS_FILE:append =3D " --cross-file ${WORKDIR}/meson-
> > > ${PN}.cross"
> > >=20
> > > =C2=A0MESON_TARGET =3D "systemd-boot"
> > > +MESON_INSTALL_TAGS =3D "systemd-boot"
> > >=20
> > > =C2=A0EXTRA_OEMESON +=3D "-Defi=3Dtrue \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dbootloader=3Dtrue \
> > > @@ -43,7 +44,7 @@ python __anonymous () {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix=
)
> > > =C2=A0}
> > >=20
> > > -FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
> > > +FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
> > > ${libdir}"
> > >=20
> > > =C2=A0RDEPENDS:${PN} +=3D "virtual-systemd-bootconf"
> > >=20
> > > @@ -53,6 +54,7 @@ COMPATIBLE_HOST =3D
> > > "(aarch64.*|arm.*|x86_64.*|i.86.*|riscv.*)-linux"
> > > =C2=A0COMPATIBLE_HOST:x86-x32 =3D "null"
> > >=20
> > > =C2=A0do_install() {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meson_do_install
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${EFI_FILES=
_PATH}
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install ${B}/src/boot/syst=
emd-boot*.efi
> > > ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
> > > =C2=A0}
> > >=20
> > > Cheers,
> > >=20
> > > -Mikko
> >=20
> > //Peter
> >=20

