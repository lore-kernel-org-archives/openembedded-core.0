Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87B2C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 11:16:42 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.18420.1752837396997062403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 04:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VbsHqXBl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a54700a463so1122024f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752837395; x=1753442195; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4u3le4LPlJDwIzKg2JMQ/ok01cCXJVaAKbLXd/qQo7Q=;
        b=VbsHqXBl0o/ZVoOZeMKfxkPQX5A18Cvu97/NNHX7HR6IbJE5o47pe+1tuwpO9MOv6p
         kJVsp9Fq5NBTGb9MoxxYTc/Tc4iqSMbSDe5p01TaekOkk8NVopjm61eZD3DNEOv/81pI
         TeDz4dlZzG4Afh1ENpBBShiQi4+dRnxV5w00o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752837395; x=1753442195;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4u3le4LPlJDwIzKg2JMQ/ok01cCXJVaAKbLXd/qQo7Q=;
        b=se20MnTwYHuEOKBtX7l0HjEdyXKJXFILPwVF9PquRjaGvP9dFjwVwux+3LukG58vc5
         BpqycZrXE5EmQa9ckTgzqyr99vnZ6roN6UFX+oPvZjY53sRfGTk5Dri4HnKOcUcaVn76
         e+1G+Pnh8b1NjxejeQdPRk/XwOXFWGLXu3m4rCHIbgXhcFe894wbw7pJHbhMT6vQ1AtV
         EP8JZOK7nsrYS/zB2YXyEWT0O64wjgJsBdgzm8NInF5D/ZutGa69IS/xVspRJc7rf50q
         +549LtP7O7/z31j20UWFMLxGvoPurA5ynoLFSAfWfFW3MVffN0Hx9398PNI31Zq+TEdt
         fU6w==
X-Forwarded-Encrypted: i=1; AJvYcCX7uV1xV6QzC21SkEV5g3cUWZN+7SWQVEnEvIqqmcuAhyebm+CG5j6tpuTDXFCjFdsYGSh4QsQWjbdKihUb8A83tw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxakSIyg4k7J1n9DkOV90bqP5or6QVJljMbdGDna3Qi6yVb8Lk1
	xBPvpLcPWwItuwdbqhvzL2b453BroANrDNTGfZjjRVMVDeHdcvklCC4CjeEb8LKQF70=
X-Gm-Gg: ASbGncu4HLeAjUjjzNjdCRbDayUw5JxRWubBdIVhg3upPl5fFpzo+rLa0S0AVfbj7cK
	8LpQIWftseqOGdwl4+4zdWyy4X6yoDp5aLCEd1gE1AF2MvjDGXPDZ8sw8xylw+NK8R1Mg8j7lXq
	767rkWfrmW2r3rFYetYj9kxVOkD9Tjx1E9hzAIyUTTbzFYFTToP8FFi7/tm/o4sii5q3Yg18HbH
	lzPOk8QyHHG7LCFd61YtNi57GrfW3R/n7tC/Xgi/Y/Vv9SQL3Bd0loE5TNLDCBiDIqin9SLhgsk
	VKETj24rSzhGsd1KeMLjh4hdjU9SDxA1nZ6uqCRAZhm32HP6hj6fL4KVY311UIvFCw9FY2EQbGa
	brSzYvI+UrPnIf5+Jnnf71BaGwCZUuFCev7I/dFtXJQvr04xRfXBZiWYTqTbUJ5EkISJ5o7zr1I
	0hatqAzg==
X-Google-Smtp-Source: AGHT+IFnoHvmiShI3+qh4iw8CDWUgLKEvz0KgSnsZNT2gIrt5edBMpBof+DwIBobJKkyxytyHZRz5w==
X-Received: by 2002:a05:6000:250c:b0:3b5:e275:75a2 with SMTP id ffacd0b85a97d-3b613aa22bfmr5767617f8f.4.1752837395098;
        Fri, 18 Jul 2025 04:16:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b19:5c6:27ed:a530? ([2001:8b0:aba:5f3c:b19:5c6:27ed:a530])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c952sm1545024f8f.86.2025.07.18.04.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 04:16:34 -0700 (PDT)
Message-ID: <77118a0af988bd108a3aa3e9d663926b8b2987ec.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] u-boot: upgrade 2025.04 -> 2025.07
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, mikko.rapeli@linaro.org, 
	openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Fri, 18 Jul 2025 12:16:33 +0100
In-Reply-To: <7b5f99cb-55d3-4765-a0a6-be3393559082@cherry.de>
References: <20250718090123.420399-1-mikko.rapeli@linaro.org>
	 <ab6ce5a5fc2d8a4f10926d10438156b687e98747.camel@linuxfoundation.org>
	 <7b5f99cb-55d3-4765-a0a6-be3393559082@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 11:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220596

On Fri, 2025-07-18 at 12:34 +0200, Quentin Schulz wrote:
> Hi Richard,
>=20
> On 7/18/25 12:28 PM, Richard Purdie via lists.openembedded.org wrote:
> > On Fri, 2025-07-18 at 12:01 +0300, Mikko Rapeli via
> > lists.openembedded.org wrote:
> > > From: Fabio Estevam <festevam@gmail.com>
> > >=20
> > > Upgrade to U-Boot 2025.07. Added patches for build race
> > > conditions.
> > > Removed qemu KVM USB workaround since issue is fixed upstream.
> > >=20
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > > =C2=A0=C2=A0.../u-boot/files/disable_CONFIG_USB.cfg=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> > > =C2=A0=C2=A0...pts-Makefile.lib-fix-_efi.so-depende.patch | 136
> > > ++++++++++++++++++
> > > =C2=A0=C2=A0...kefile-change-apps-from-always-to-ta.patch |=C2=A0 57 =
++++++++
> > > =C2=A0=C2=A0meta/recipes-bsp/u-boot/u-boot-common.inc=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > > =C2=A0=C2=A0...ols_2025.04.bb =3D> u-boot-tools_2025.07.bb} |=C2=A0=
=C2=A0 0
> > > =C2=A0=C2=A0.../{u-boot_2025.04.bb =3D> u-boot_2025.07.bb}=C2=A0 |=C2=
=A0=C2=A0 4 +-
> > > =C2=A0=C2=A06 files changed, 201 insertions(+), 5 deletions(-)
> > > =C2=A0=C2=A0delete mode 100644 meta/recipes-bsp/u-
> > > boot/files/disable_CONFIG_USB.cfg
> > > =C2=A0=C2=A0create mode 100644 meta/recipes-bsp/u-boot/files/v3-0001-
> > > Makefile-scripts-Makefile.lib-fix-_efi.so-depende.patch
> > > =C2=A0=C2=A0create mode 100644 meta/recipes-bsp/u-boot/files/v3-0002-
> > > efi_loader-Makefile-change-apps-from-always-to-ta.patch
> > > =C2=A0=C2=A0rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb =
=3D> u-
> > > boot-tools_2025.07.bb} (100%)
> > > =C2=A0=C2=A0rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb =3D> u-
> > > boot_2025.07.bb} (64%)
> > >=20
> > > v3: Did not manage to reproduce AB build failures but added
> > > delays to more
> > > =C2=A0=C2=A0=C2=A0=C2=A0 linker calls which exposed similar issues. F=
ixed failures
> > > with patches
> > > =C2=A0=C2=A0=C2=A0=C2=A0 which are also submitted upstream.
> > >=20
> > > v2: added upstreamed patch to fix build race conditon, removed
> > > qemu kvm workaround
> > > =C2=A0=C2=A0=C2=A0=C2=A0 fixed upstream. Would be nice to check if bu=
ilds now pass.
> > > =C2=A0=C2=A0=C2=A0=C2=A0
> > > https://lists.openembedded.org/g/openembedded-core/message/220436
> > >=20
> > > v1:
> > > https://lists.openembedded.org/g/openembedded-core/message/220004
> > >=20
> > > diff --git a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
> > > b/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
> > > deleted file mode 100644
> > > index 1d2509982be1..000000000000
> > > --- a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
> > > +++ /dev/null
> > > @@ -1 +0,0 @@
> > > -# CONFIG_USB is not set
> > > diff --git a/meta/recipes-bsp/u-boot/files/v3-0001-Makefile-
> > > scripts-Makefile.lib-fix-_efi.so-depende.patch b/meta/recipes-
> > > bsp/u-boot/files/v3-0001-Makefile-scripts-Makefile.lib-fix-
> > > _efi.so-depende.patch
> > > new file mode 100644
> > > index 000000000000..e8253a67b211
> > > --- /dev/null
> > > +++ b/meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-
> > > Makefile.lib-fix-_efi.so-depende.patch
> > > @@ -0,0 +1,136 @@
> > > +From 2e7c1321bb44cc6af4ee4b1026a52e1a0aa7e336 Mon Sep 17
> > > 00:00:00 2001
> > > +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > +Date: Thu, 10 Jul 2025 14:24:07 +0000
> > > +Subject: [PATCH v3 1/2] Makefile scripts/Makefile.lib: fix
> > > *_efi.so dependency
> > > + to PLATFORM_LIBGCC
> > > +
> > > +When PLATFORM_LIBGCC was added to linker command it was not
> > > +added to the dependency of the .so and other rules. Thus a build
> > > can
> > > +try to link *_efi.so files before lib.a from PLATFORM_LIBGCC is
> > > available.
> > > +This was seen in yocto autobuilder builds with u-boot 2025.07
> > > +update, see
> > > https://lists.openembedded.org/g/openembedded-core/message/220004
> > > +
> > > +
> > > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2914600/
> > > raw_inline
> > > +
> > > +|=C2=A0=C2=A0=C2=A0 rm -f lib/efi_loader/built-in.o; arm-poky-linux-=
gnueabi-ar
> > > cDPrsT lib/efi_loader/built-in.o lib/efi_loader/efi_bootmgr.o
> > > lib/efi_loader/efi_bootbin.o lib/efi_loader/efi_boottime.o
> > > lib/efi_loader/efi_helper.o lib/efi_loader/efi_console.o
> > > lib/efi_loader/efi_device_path.o
> > > lib/efi_loader/efi_device_path_to_text.o
> > > lib/efi_loader/efi_device_path_utilities.o
> > > lib/efi_loader/efi_dt_fixup.o lib/efi_loader/efi_fdt.o
> > > lib/efi_loader/efi_file.o lib/efi_loader/efi_hii.o
> > > lib/efi_loader/efi_hii_config.o lib/efi_loader/efi_image_loader.o
> > > lib/efi_loader/efi_load_options.o lib/efi_loader/efi_memory.o
> > > lib/efi_loader/efi_root_node.o lib/efi_loader/efi_runtime.o
> > > lib/efi_loader/efi_setup.o lib/efi_loader/efi_string.o
> > > lib/efi_loader/efi_unicode_collation.o
> > > lib/efi_loader/efi_var_common.o lib/efi_loader/efi_var_mem.o
> > > lib/efi_loader/efi_variable.o lib/efi_loader/efi_var_file.o
> > > lib/efi_loader/efi_watchdog.o lib/efi_loader/efi_disk.o
> > > lib/efi_loader/efi_net.o lib/efi_loader/efi_smbios.o
> > > lib/efi_loader/efi_load_initrd.o lib/efi_loader/efi_conformance.o
> > > +|=C2=A0=C2=A0 arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -
> > > znocombreloc -znorelro --no-warn-rwx-segments -L
> > > /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-
> > > 3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-
> > > boot/2025.07/sources/u-boot-2025.07 -T
> > > arch/arm/lib/elf_arm_efi.lds -shared -Bsymbolic -s
> > > lib/efi_loader/helloworld.o lib/efi_loader/efi_crt0.o
> > > lib/efi_loader/efi_reloc.o lib/efi_loader/efi_freestanding.o
> > > arch/arm/lib/lib.a -o lib/efi_loader/helloworld_efi.so
> > > +| arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a:
> > > No such file or directory
> > > +| make[3]: *** [scripts/Makefile.lib:512:
> > > lib/efi_loader/helloworld_efi.so] Error 1
> > > +
> > > +The issue is hard to reproduce but this change can artificially
> > > trigger it:
> > > +
> > > +=C2=A0 a/scripts/Makefile.build
> > > +=C2=A0 b/scripts/Makefile.build
> > > +@@ -353,7 +353,7 @@ $(modorder-target): $(subdir-ym) FORCE
> > > + #
> > > + ifdef lib-target
> > > + quiet_cmd_link_l_target =3D AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $@
> > > +-cmd_link_l_target =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@
> > > $(lib-y)
> > > ++cmd_link_l_target =3D rm -f $@ && echo "HACK, delaying build!" &&
> > > sleep 60 && $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
> > > +
> >=20
> > This is not how you solve build races and I've very reluctant to
> > take
> > patches that look like that, whether submitted to upstream or
> > otherwise.
> >=20
>=20
> If I'm not mistaken, this is not the actual patch (code) content but=20
> rather how to reproduce the race issue reliably in a patch format=20
> contained in the commit log but the actual code doesn't add sleep as far=
=20
> as I could tell? But it's hard to distinguish a patch in a patch in a
> patch's commit log from a patch in a patch :)

That makes much more sense, thanks. I was thinking it was a very
unusual upstream submission!

Cheers,

Richard


