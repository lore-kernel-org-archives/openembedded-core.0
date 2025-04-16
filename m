Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEA2C369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 06:09:01 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.12776.1744783736216401312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 23:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RCMLlRR1;
 spf=pass (domain: linaro.org, ip: 209.85.208.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso245257a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 23:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744783734; x=1745388534; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V0H4NHJZTqrvpGORGGfkc0JC57+vWYaAA9wE4sQdJYU=;
        b=RCMLlRR1tkkhWQHqeLFvR7rXLOl5orV1BWlA99BpOPprveOD1Yr5ZeFZXRcoJhtjQs
         /kdIn3dOGEOZDMaT2QyXe8EclBG0lC78XJjSFeuvZlg4Qjz4raohPrZHdShEpoqZ2rN7
         h0iVzsMmh1Z0wLzEhANdETHQzFy2ye1+fQUYrIVych1wDo3Cwdbnvdt0zZN5HVa+2NsD
         RiKIezV2qmFeFHl5xqCu9Fq+/bXdHMgIgptueHdqIN90Bzxb1bOSg0bd174a2KoT6qP9
         Vr3ey/fpYc7D5bwChQlpQKCK4/SOaZvctmnT8DTFGhPcdA13RgwhAqawtQxPhYuEO1Ol
         S+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744783734; x=1745388534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0H4NHJZTqrvpGORGGfkc0JC57+vWYaAA9wE4sQdJYU=;
        b=kXbsg95Ybrz2eesvmWLPdMbeCwOLYIDbAAhFlED9/AliPMCxCAjB/n4bNcyhPl5fBO
         A3f5agruXBz9yTlk0RQeI3gwHlgeo1Xk/cFApoyKHLYAsOlV50q9ctWnAVwT9XQ0hwYQ
         JfLbRgf/YMgHVZte0fN4shnhxgFz2BNDY8Gyv6YAHj94S35YVNC2Z89dksJWkrjN5h4p
         ck+JK5aorZl6lue2bxPibtBuKix6bosQ6HjgcOexz/m1OV0nfG1XxjQylvXNDmkLFoD6
         FAYXrYomdRoxjBKcelNiaa5VPfHW9Qz3So181GUbliUPHm5C2t5YZPcZxK3hRghjExWP
         E+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqv+6cYVxMUEhE3RE3Fh8xsSC5mqt0KOX7l77r2TgaZXj9pVwHB+DHZ6w/v8Lk3NIchlSand2RKiDi7wCNtDXUjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0F7pEqOcQ7mEQIcDE/HqgwoYT7MVhUyOZgfXMZ1cPNVlIqdLf
	CSyFXJB+1yfxOAhfw+hdowCleG8vkXGvsn8sThFEvxybbYecTdJXD2HuSRWo9EM=
X-Gm-Gg: ASbGncvvhoINniPnoKkZQaubbL5mR5pJ9wKbBTeqp19xUVl7hJ/pVk3kDTrSYFMzXdj
	lYo2TlPxU6M3ANQfUo9tgUyoim9xRK5u56+kikNiZFWqmfaNgjsq6TOBpQlUvy+sGoBHs0EFODT
	PrlAE7RJhmNq0s50kTybaS8WelAJJvpXHk3W10j1d7QHV54FxXyqoYI8ntg6q5a9sAGoXHDNtL5
	isIScCuQeH44lTZ/FFyFgnjbRw2isph8VqOctmpgej7OXvTZjl9WZd2uDubC1ytFdzcPzzinFpn
	+3DMnbHE/wsp7YNq70gVODjZmSplb9UYYcK7seXQZp2XGJli+KBc5NblTNkanTkyyPY=
X-Google-Smtp-Source: AGHT+IEff/UZHJVv2A+VUuSLniTH+RhiiWLj3blOG9KjJaGRPzHYH7PHOiem39zWcocIC1Gowg4huQ==
X-Received: by 2002:a17:907:d1b:b0:ac3:47b1:d210 with SMTP id a640c23a62f3a-acb42ad5829mr37509466b.39.1744783734170;
        Tue, 15 Apr 2025 23:08:54 -0700 (PDT)
Received: from nuoska (i68970912.versanet.de. [104.151.9.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1c8517sm61969366b.140.2025.04.15.23.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 23:08:53 -0700 (PDT)
Date: Wed, 16 Apr 2025 09:08:49 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"mike.looijmans@topic.nl" <mike.looijmans@topic.nl>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
Message-ID: <Z_9JcY4ANLN7SPvJ@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org>
 <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl>
 <Z_jy0-3v8qVSyll8@nuoska>
 <960572ae-f816-4d55-b935-8e11e2dad89f@topic.nl>
 <CAB3asfhjnUAm-sB=Q4mk9whXUMdgaBZk0kwiwYKKyPJ0ydnU2w@mail.gmail.com>
 <Z_4sMeEiHjZ8ydfs@nuoska>
 <DB5PR02MB102130E10617CF99E82F6A94FEFB22@DB5PR02MB10213.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB5PR02MB102130E10617CF99E82F6A94FEFB22@DB5PR02MB10213.eurprd02.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 06:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214979

Hi,

On Tue, Apr 15, 2025 at 04:20:50PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Mikko Rapeli via lists.openembedded.org
> > Sent: den 15 april 2025 11:52
> > To: Adrian Freihofer <adrian.freihofer@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org; mike.looijmans@topic.nl
> > Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
> > 
> > Hi,
> > 
> > On Mon, Apr 14, 2025 at 06:28:13PM +0200, Adrian Freihofer wrote:
> > > Hi Mikko
> > >
> > > Would it be possible to provide some numbers on the impact on the size of
> > > the binaries and the additional dependencies that could be added to the
> > > image with or without efi enabled?
> > > I think the patch would be a very good compromise if the impact is
> > > negligible, but otherwise the question is probably still valid.
> 
> I have probably missed something in this very long thread, but what is the 
> reason to force EFI support on us rather than relying on the efi distro 
> feature? We do not use EFI in any of our products and thus do not have it 
> set in DISTRO_FEATURES. If it is suddenly expected that EFI support should 
> be enabled all over the place it just means I will have to go hunting for 
> it to turn it off rather than just relying on the existing distro feature.

Is it ok for Richard to enable "efi" in poky/poky-altcfg DISTRO_FEATURES
by default?

It is already enabled in MACHINE_FEATURES for oe-core machines I care about.

> > 
> > The impact is small:
> > 
> >  * python3-pyelftools-native is added to build dependencies
> > 
> >  * At runtime the efivars partition is now automatically mounted read-only by
> >    systemd to /sys/firmware/efi/efivars and can be used to query various firmware
> >    and EFI bootloader (grub, systemd-boot) details
> > 
> >  * Since "efi" is now default, other layers can stop enabling it:
> > 
> >    https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-core/systemd/systemd-efi.inc
> >    https://git.yoctoproject.org/meta-security/tree/meta-tpm/recipes-core/systemd/systemd_%25.bbappend#n5
> >    https://github.com/Wind-River/meta-secure-core/blob/master/meta-efi-secure-boot/recipes-core/systemd/systemd-efi-secure-boot.inc
> 
> But isn't the problem here rather that these layers want to force EFI 
> support instead of using, e.g., REQUIRED_DISTRO_FEATURES = "efi"?

These layers want to enable EFI support but don't want to change the poky/poky-altcfg
distro settings.

In machine features "efi" is already enabled but it was rejeted here to use
MACHINE_FEATURES in systemd.

So full loop in the discussion...?

Enabling systemd "efi" support by default is a tiny thing which would get lost
all the other changes and IMO would not impact anyone significantly
at runtime or at build time. Those who optimize systemd for e.g. non-EFI
systems should be setting PACKAGECONFIG fully to their liking.

Cheers,

-Mikko

> > 
> >  * /usr/lib/systemd/libsystemd-shared-257.so size increases 32 bytes from
> >    4012152 to 4012184 bytes, 0.0008%
> > 
> >  * systemd package size increase from 9857529 to 10226508, 3.7%, with
> >    added files:
> > 
> > +drwxr-xr-x root       root             4096 ./usr/lib/systemd/boot
> > +drwxr-xr-x root       root             4096 ./usr/lib/systemd/boot/efi
> > +-rw-r--r-- root       root             6144 ./usr/lib/systemd/boot/efi/addonaa64.efi.stub
> > +-rw-r--r-- root       root           101376 ./usr/lib/systemd/boot/efi/linuxaa64.efi.stub
> > +-rw-r--r-- root       root           120832 ./usr/lib/systemd/boot/efi/systemd-bootaa64.efi
> > +-rwxr-xr-x -          -               67656 ./usr/lib/systemd/systemd-bless-boot
> > +-rwxr-xr-x -          -               67456 ./usr/lib/systemd/system-generators/systemd-bless-boot-generator
> > +lrwxrwxrwx -          -                  25 ./usr/lib/systemd/system/sockets.target.wants/systemd-bootctl.socket -> ../systemd-bootctl.socket
> > +lrwxrwxrwx -          -                  35 ./usr/lib/systemd/system/sysinit.target.wants/systemd-boot-random-seed.service -> ../systemd-boot-random-seed.service
> > +lrwxrwxrwx -          -                  34 ./usr/lib/systemd/system/sysinit.target.wants/systemd-hibernate-clear.service -> ../systemd-hibernate-clear.service
> > +-rw-r--r-- -          -                 690 ./usr/lib/systemd/system/systemd-bless-boot.service
> > +-rw-r--r-- -          -                 532 ./usr/lib/systemd/system/systemd-bootctl@.service
> > +-rw-r--r-- -          -                 596 ./usr/lib/systemd/system/systemd-bootctl.socket
> > +-rw-r--r-- -          -                1029 ./usr/lib/systemd/system/systemd-boot-random-seed.service
> > +-rw-r--r-- -          -                 733 ./usr/lib/systemd/system/systemd-boot-update.service
> > +-rw-r--r-- -          -                 782 ./usr/lib/systemd/system/systemd-hibernate-clear.service
> > +-rw-r--r-- -          -                 779 ./usr/lib/tmpfiles.d/20-systemd-stub.conf
> > 
> >   This shows a bug in the config between systemd and systemd-boot, the EFI binaries are
> >   provided by both. Sadly systemd-boot doesn't work so well and doesn't install all
> >   the services etc which systemd does with "efi" and bootloader enabled. Not sure
> >   if the overlap should be fixed or ignored. Using meson to install systemd-boot
> >   binaries does fix deployment of the EFI binaries but does not install the
> >   random-seed etc services. With this workaround to avoid the EFI file duplication
> >   in systemd recipe:
> > 
> > --- a/meta/recipes-core/systemd/systemd_257.5.bb
> > +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> > @@ -149,7 +149,7 @@ PACKAGECONFIG[default-compression-lz4] = "-Dlz4=true -Ddefault-compression=lz4,,
> >  PACKAGECONFIG[default-compression-xz] = "-Dxz=true -Ddefault-compression=xz,,xz"
> >  PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zstd,,zstd"
> >  PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
> > -PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=enabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native"
> > +PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=disabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native systemd-boot"
> > 
> >   size without "efi" is 9857529 bytes and with "efi" 9859196, or size increase
> >   of 0.016% which is tiny. To stay closer to systemd upstream, I don't think
> >   removing the duplication is worth the effort for now. systemd-boot
> >   recipe could maybe be replaced by systemd recipe and a systemd-boot binary
> >   package. Otherwise the configurations don't match. FWIW, it tried following
> >   changes to systemd-boot:
> > 
> > --- a/meta/recipes-core/systemd/systemd-boot_257.5.bb
> > +++ b/meta/recipes-core/systemd/systemd-boot_257.5.bb
> > @@ -24,6 +24,7 @@ EOF
> >  MESON_CROSS_FILE:append = " --cross-file ${WORKDIR}/meson-${PN}.cross"
> > 
> >  MESON_TARGET = "systemd-boot"
> > +MESON_INSTALL_TAGS = "systemd-boot"
> > 
> >  EXTRA_OEMESON += "-Defi=true \
> >                    -Dbootloader=true \
> > @@ -43,7 +44,7 @@ python __anonymous () {
> >      d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
> >  }
> > 
> > -FILES:${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
> > +FILES:${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE} ${libdir}"
> > 
> >  RDEPENDS:${PN} += "virtual-systemd-bootconf"
> > 
> > @@ -53,6 +54,7 @@ COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*|riscv.*)-linux"
> >  COMPATIBLE_HOST:x86-x32 = "null"
> > 
> >  do_install() {
> > +       meson_do_install
> >         install -d ${D}${EFI_FILES_PATH}
> >         install ${B}/src/boot/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
> >  }
> > 
> > Cheers,
> > 
> > -Mikko
> 
> //Peter
> 

