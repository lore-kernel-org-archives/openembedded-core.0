Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8848C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 13:02:23 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.8269.1752152539475705299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 06:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Swx2QLcC;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b31afa781so7231131fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752152538; x=1752757338; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UyzO7n5h1rhKqOmyAcNlFMI/00/sgOcYcafgRdkcURI=;
        b=Swx2QLcCnYuvxY6PV5cFm5F75W2ZO35cUs8AkYwaF31JfRbDByV49Ax/B7nR9WZ7LH
         cXB+X9vDRbuH7Dd7Uc0JxY4Wi6WqqZVAM6Sn2+UuBTLUnWfP/xrYAea0vc0oDQq9HOw/
         UmCXyu+NXcEK0Deft1mU89DaN0JYaztDY9U4+WEvQCbEes0o+DWWuEEpN5PB3ulHCOHs
         /3LZAAVlAZ4E/K7OiaDSKYKoJLsCev2+sXBmRW8hqWCauG6WTruqbh3BZYaAzuXBPP1M
         WFtDsdxDmOQ7B759yCNcrvN6404nXzUlkY18j/x4IBhEka8hTfXmsI/8RK4GlB7cmFYn
         3kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752152538; x=1752757338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UyzO7n5h1rhKqOmyAcNlFMI/00/sgOcYcafgRdkcURI=;
        b=VMaa+kUC7vgBG57byP07rb3g+TgM7HQv0qbgix2pmUni6hWjtQsqWMLVZi0Ws5r6Zw
         R7fcOHdxFXWnt/C+enQRzyeEZxjjdTURRX/srrOjzX6kDIe2i+KUTIMhxfYrHyYLAKBb
         eA7RIZA3YzeiY+6D3COtan6qGNlpkqwHbZdHm01n5rSAYA/gtHYBZMSNhFxB5YnulLaa
         x3cAjEOXt+fNQelOi0TCi3h6VeVHyQsFgDdFy7rKmp0BnHTX4vxlpLQcN8I/1q0Z8f16
         9pdhcY5A0H7iPTBPY5OuyCz+R1YNmy0ODO8XS40WEjT2YSLpLCPHrrSjczGCcW+9Uy/9
         FTmg==
X-Forwarded-Encrypted: i=1; AJvYcCVeMoO6kiIeJjiJBn1Du9SL81gY5n7gKJzR2y3eR77Z8fEcnYhI3BrpSUjQwiVMy3UDJeL9xBxAKf8F54ADviD3Bg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy9mMKrtgceNPguplBORdHyTUa4yhizj0zbu62LbKU3vqJyDu0s
	XWD3I83PwizvneGDC5UNLLLOfQhhbvFoT+lOJ4Qq/KcC2Tm49YElNX+Ai8hTuZOzAr0=
X-Gm-Gg: ASbGnctNxVO5VXhqYOA4cJC7v203ThRPF/GjDon+fhRWBS/DQ7Ep7a4zBabbzEhHauI
	InV1DBCL8LwISs7/Yk9hSLHOB+It+bfSIw3n6l0gYQOD4vnbrgvXa31WitBngFzU1+Fj5aJWzou
	G9m8INj06NEWbDCrekGFthqnCK1YZOGTevbe3I8FO+wWJJiMBUWSGZ8q9dY40GSs/MqhIFxuWmi
	C0UIPy2cFeilylV3twOyo2ikwYbHa27QzlUZ0gNqF/PVq3C08nTSsOHBa06bx8Zmavw5hdJhRr5
	drVJG1dE9S8uRycggNjVsxtJUKn6VGZqXJpaqi6fCACTTJdL8+clamfMVDSu/hBVHAq8OFCmBGj
	zzBkkqkyYkNqzpcMAHp4=
X-Google-Smtp-Source: AGHT+IGOYEs5xBSXiLkWtgS6MvHCpt+Ce0ZgZwmHL2bVp1d+ilhDzovnsZ3UtH2To8nyh0XfJQsWFg==
X-Received: by 2002:a05:651c:4119:b0:32b:72c8:9a5e with SMTP id 38308e7fff4ca-32f5002088cmr7741411fa.3.1752152537103;
        Thu, 10 Jul 2025 06:02:17 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab91a64csm2664551fa.111.2025.07.10.06.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 06:02:16 -0700 (PDT)
Date: Thu, 10 Jul 2025 16:02:14 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: trini@konsulko.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Fabio Estevam <festevam@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	adrian.freihofer@siemens.com, Marek Vasut <marek.vasut@mailbox.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.04 -> 2025.07
Message-ID: <aG-51oSyAsEeiAHd@nuoska>
References: <20250708012959.77522-1-festevam@gmail.com>
 <DB6OGLNWBEVN.2V2F24LHIZ4C4@bootlin.com>
 <CAOMZO5BJBc0E0EfejEPmVdGBZiQrrvRWsHhy0Bxgi+jx6WiYRQ@mail.gmail.com>
 <20250708175732.GU6424@bill-the-cat>
 <DB7DN2I98ZYX.3V9C86PS14M9B@bootlin.com>
 <20250709142932.GW6424@bill-the-cat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250709142932.GW6424@bill-the-cat>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 13:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220120

Hi,

Adding Ilias,

On Wed, Jul 09, 2025 at 08:29:32AM -0600, Tom Rini via lists.openembedded.o=
rg wrote:
> On Wed, Jul 09, 2025 at 10:21:34AM +0200, Mathieu Dubois-Briand wrote:
> > On Tue Jul 8, 2025 at 7:57 PM CEST, Tom Rini wrote:
> > > On Tue, Jul 08, 2025 at 02:04:15PM -0300, Fabio Estevam wrote:
> > >> Hi Mathieu,
> > >>=20
> > >> On Tue, Jul 8, 2025 at 9:37=E2=80=AFAM Mathieu Dubois-Briand
> > >> <mathieu.dubois-briand@bootlin.com> wrote:
> > >> >
> > >> > On Tue Jul 8, 2025 at 3:29 AM CEST, Fabio Estevam via lists.openem=
bedded.org wrote:
> > >> > > Upgrade to U-Boot 2025.07.
> > >> > >
> > >> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > >> > > ---
> > >> >
> > >> > Hi Fabio,
> > >> >
> > >> > Thanks for your patch.
> > >> >
> > >> > It looks like this is breaking selftests on the autobuilder:
> > >> >
> > >> > 2025-07-08 07:43:52,116 - oe-selftest - INFO - fitimage.UBootFitIm=
ageTests.test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
> > >> > 2025-07-08 07:43:52,118 - oe-selftest - INFO -  ... FAIL
> > >> > ...
> > >> > ERROR: u-boot-1_2025.07-r0 do_compile: oe_runmake failed
> > >> > ...
> > >> > | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: N=
o such file or directory
> > >> >
> > >> >
> > >> > Both on debian and armhost:
> > >> >
> > >> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds=
/1923
> > >> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds=
/2077
> > >> >
> > >> > Can you have a look at these failures please?
> > >>=20
> > >> Thanks for the report.
> > >>=20
> > >> I am adding some folks on CC in case they have some ideas.
> > >
> > > Interesting. How can we trigger that outside of the autobuilder?
> >=20
> > Hi,
> >=20
> > It's not so easy to reproduce, as it looks like it is somehow linked
> > with the host environment: this have been failing on debian workers but
> > not on the fedora ones.
> > So basic instructions are below, but this was not enough to reproduce it
> > in the ubuntu 24.4 docker I've been using so far.
> >=20
> > git clone git://git.yoctoproject.org/poky-ci-archive -b autobuilder.yoc=
toproject.org/valkyrie/a-full-1972
> > cd poky-ci-archive
> > . oe-init-build-env
> >=20
> > Add following lines in conf/local.conf (I bet only the last one is
> > really needed, but let's try to be as close as possible as the
> > autobuilder configuration):
> > MACHINE =3D "qemux86-64"
> > DISTRO =3D "poky"
> > SDKMACHINE =3D "x86_64"
> > PACKAGE_CLASSES =3D "package_rpm"
> > RPM_GPG_SIGN_CHUNK =3D '1'
> > IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
> > SANITY_TESTED_DISTROS =3D ''
> >=20
> > Add poky-ci-archive/meta-selftest in conf/bblayers.conf.
> >=20
> > And finally, run the tests:
> > oe-selftest -r fitimage.UBootFitImageTests.test_sign_cascaded_uboot_fit=
_image
> > oe-selftest -r fitimage.UBootFitImageTests.test_sign_standalone_uboot_a=
tf_tee_fit_image
>=20
> Yeah, looking at the logs it's not even Debian, it's Ubuntu 22.04, which
> is what we use for our CI too. I guess I would suggest bisect'ing with
> the autobuilder until finding out what commit breaks and then someone
> from the U-Boot side of things can chime in.

I've tried to reproduce this on x86_64 Ubuntu 22.04 build machine
targeting qemuarm and arm64 Ubuntu 24.04 build machine targeting
beaglebone. No luck so far. In my builds, lib.a has always been
created in before any other linking steps happens. I presume this is a
race condition where linking step of lib/efi_loader/testapp_efi.so
does not actually have a dependency to the lib.a creating linking step.

I'm not familiar enough with u-boot/Kconfig build setups to see where this
dependency should be added.

=46rom do_compile log in passing case:

set -e; mkdir -p include/generated/;    (echo \#define PLAIN_VERSION \"2025=
=2E07\"; echo \#define U_BOOT_VERSION \"U-Boot \" PLAIN_VERSION; echo \#def=
ine U_BOOT_VERSION_NUM 2025; echo \#define U_BOOT_VERSION_NUM_PATCH $(echo =
07 | sed -e "s/^0*//"); echo \#define HOST_ARCH 0x00a7; echo \#define CC_VE=
RSION_STRING \"$(LC_ALL=3DC arm-poky-linux-gnueabi-gcc  --sysroot=3D/home/m=
cfrisk/src/base/repo/poky/build_beaglebone/tmp/work/beaglebone_yocto-poky-l=
inux-gnueabi/u-boot/2025.07/recipe-sysroot  -ffile-prefix-map=3D/home/mcfri=
sk/src/base/repo/poky/build_beaglebone/tmp/work/beaglebone_yocto-poky-linux=
-gnueabi/u-boot/2025.07/sources/u-boot-2025.07=3D/usr/src/debug/u-boot/2025=
=2E07  -ffile-prefix-map=3D/home/mcfrisk/src/base/repo/poky/build_beaglebon=
e/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/build=3D/usr/=
src/debug/u-boot/2025.07  -ffile-prefix-map=3D/home/mcfrisk/src/base/repo/p=
oky/build_beaglebone/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/20=
25.07/recipe-sysroot=3D  -ffile-prefix-map=3D/home/mcfrisk/src/base/repo/po=
ky/build_beaglebone/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/202=
5.07/recipe-sysroot-native=3D  --version | head -n 1)\"; echo \#define LD_V=
ERSION_STRING \"$(LC_ALL=3DC arm-poky-linux-gnueabi-ld.bfd --version | head=
 -n 1)\"; ) < include/config/uboot.release > include/generated/version_auto=
generated.h.tmp; if [ -r include/generated/version_autogenerated.h ] && cmp=
 -s include/generated/version_autogenerated.h include/generated/version_aut=
ogenerated.h.tmp; then rm -f include/generated/version_autogenerated.h.tmp;=
 else : '  UPD     include/generated/version_autogenerated.h'; mv -f includ=
e/generated/version_autogenerated.h.tmp include/generated/version_autogener=
ated.h; fi
=2E..
  rm -f arch/arm/lib/lib.a; arm-poky-linux-gnueabi-ar cDPrsT arch/arm/lib/l=
ib.a arch/arm/lib/ashldi3.o arch/arm/lib/ashrdi3.o arch/arm/lib/div0.o arch=
/arm/lib/div64.o arch/arm/lib/lib1funcs.o arch/arm/lib/lshrdi3.o arch/arm/l=
ib/muldi3.o arch/arm/lib/uldivmod.o
=2E..
  arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -znorel=
ro --no-warn-rwx-segments -L /home/mcfrisk/src/base/repo/poky/build_beagleb=
one/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/sources/u-b=
oot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared -Bsymbolic -s lib/efi_l=
oader/testapp.o lib/efi_loader/efi_crt0.o lib/efi_loader/efi_reloc.o lib/ef=
i_loader/efi_freestanding.o arch/arm/lib/lib.a -o lib/efi_loader/testapp_ef=
i.so

Looks like testapp_efi.so linking step is the first one using
arm-poky-linux-gnueabi-ld.bfd.

Failing case:

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2914600/raw_inline

| set -e; mkdir -p include/generated/; 	(echo \#define PLAIN_VERSION \"2025=
=2E07\"; echo \#define U_BOOT_VERSION \"U-Boot \" PLAIN_VERSION; echo \#def=
ine U_BOOT_VERSION_NUM 2025; echo \#define U_BOOT_VERSION_NUM_PATCH $(echo =
07 | sed -e "s/^0*//"); echo \#define HOST_ARCH 0x00a7; echo \#define CC_VE=
RSION_STRING \"$(LC_ALL=3DC arm-poky-linux-gnueabi-gcc  --sysroot=3D/srv/po=
kybuild/yocto-worker/oe-selftest-armhost/build/build-st-3119200/tmp/work/be=
aglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/recipe-sysroot  -ffile-pre=
fix-map=3D/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-31=
19200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/sources/u=
-boot-2025.07=3D/usr/src/debug/u-boot/2025.07  -ffile-prefix-map=3D/srv/pok=
ybuild/yocto-worker/oe-selftest-armhost/build/build-st-3119200/tmp/work/bea=
glebone_yocto-poky-linux-gnueabi/u-boot/2025.07/build=3D/usr/src/debug/u-bo=
ot/2025.07  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/oe-selftest-arm=
host/build/build-st-3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-=
boot/2025.07/recipe-sysroot=3D  -ffile-prefix-map=3D/srv/pokybuild/yocto-wo=
rker/oe-selftest-armhost/build/build-st-3119200/tmp/work/beaglebone_yocto-p=
oky-linux-gnueabi/u-boot/2025.07/recipe-sysroot-native=3D  --version | head=
 -n 1)\"; echo \#define LD_VERSION_STRING \"$(LC_ALL=3DC arm-poky-linux-gnu=
eabi-ld.bfd --version | head -n 1)\"; ) < include/config/uboot.release > in=
clude/generated/version_autogenerated.h.tmp; if [ -r include/generated/vers=
ion_autogenerated.h ] && cmp -s include/generated/version_autogenerated.h i=
nclude/generated/version_autogenerated.h.tmp; then rm -f include/generated/=
version_autogenerated.h.tmp; else : '  UPD     include/generated/version_au=
togenerated.h'; mv -f include/generated/version_autogenerated.h.tmp include=
/generated/version_autogenerated.h; fi
=2E..
|    rm -f lib/efi_loader/built-in.o; arm-poky-linux-gnueabi-ar cDPrsT lib/=
efi_loader/built-in.o lib/efi_loader/efi_bootmgr.o lib/efi_loader/efi_bootb=
in.o lib/efi_loader/efi_boottime.o lib/efi_loader/efi_helper.o lib/efi_load=
er/efi_console.o lib/efi_loader/efi_device_path.o lib/efi_loader/efi_device=
_path_to_text.o lib/efi_loader/efi_device_path_utilities.o lib/efi_loader/e=
fi_dt_fixup.o lib/efi_loader/efi_fdt.o lib/efi_loader/efi_file.o lib/efi_lo=
ader/efi_hii.o lib/efi_loader/efi_hii_config.o lib/efi_loader/efi_image_loa=
der.o lib/efi_loader/efi_load_options.o lib/efi_loader/efi_memory.o lib/efi=
_loader/efi_root_node.o lib/efi_loader/efi_runtime.o lib/efi_loader/efi_set=
up.o lib/efi_loader/efi_string.o lib/efi_loader/efi_unicode_collation.o lib=
/efi_loader/efi_var_common.o lib/efi_loader/efi_var_mem.o lib/efi_loader/ef=
i_variable.o lib/efi_loader/efi_var_file.o lib/efi_loader/efi_watchdog.o li=
b/efi_loader/efi_disk.o lib/efi_loader/efi_net.o lib/efi_loader/efi_smbios.=
o lib/efi_loader/efi_load_initrd.o lib/efi_loader/efi_conformance.o
|   arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -znor=
elro --no-warn-rwx-segments -L /srv/pokybuild/yocto-worker/oe-selftest-armh=
ost/build/build-st-3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-b=
oot/2025.07/sources/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared =
-Bsymbolic -s lib/efi_loader/helloworld.o lib/efi_loader/efi_crt0.o lib/efi=
_loader/efi_reloc.o lib/efi_loader/efi_freestanding.o arch/arm/lib/lib.a -o=
 lib/efi_loader/helloworld_efi.so
| arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such fi=
le or directory
| make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi.so]=
 Error 1

In this failing log, nothing created lib.a before lib/efi_loader/helloworld=
_efi.so
link step started.

Cheers,

-Mikko

