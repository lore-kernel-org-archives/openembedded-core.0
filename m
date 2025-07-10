Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAB3C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 14:51:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.10740.1752159057649423711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 07:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pVr3u4TD;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-558fa0b2cc8so921978e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 07:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752159056; x=1752763856; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPaWwBJrqUoJjxdoWLIwQti3K2CdSL4fHaLlzEP6BWY=;
        b=pVr3u4TDsNgw5BZZka4sBxziaaj6sNj7OptDvlMGwBOBWfY9fv0Z+1q4xq13o0XFju
         EZzrJFrjo1lBQ1C9htnoijYQ8L0CkidN0kXCQQFHKynnXrlOfDIOa1wpamTX1r5IrGRf
         p1QfUrzL+kSblBVhDknFnhfO9tnbTaiE2LgueHF8YlD8Shoi6SwLNvxH+dpx9GkpdfPr
         Q7eAnthFQAg2/LYdZlvrAT0YejasO/U3ElJte4e9wRYOv98NO4eLFYN9kLMMAFKJg65/
         7EbjCoA7locvXTSkikzovtQkiJ+N86VeZaigv4RleuAX9qd2jLhgw8ZUJeYxfwcIwhAh
         IANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752159056; x=1752763856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPaWwBJrqUoJjxdoWLIwQti3K2CdSL4fHaLlzEP6BWY=;
        b=O6+wowHTzk7t5jgzK3ajjYisN5QPSG5TFWL0xzAIdJaTDRzXHUMbQ4hB+0LVpOnSnj
         o86yvXCJYCpo1B1+UmhR6FlU/PQqlPbMa60oL9HchQoEOFI+wk3QVwkdVqavi71HEMlu
         FnITIG4LC9kIQBNJ8XTdKAA8N+2S4A/pawUrY/oLHEAq7piFYgKJWFFqpjChr2aZ4K3Q
         8DirBHzCCgSoyZzo3dAWJMxsVfmvSwofrih3tyYGluJkj1668VwqyMG29tLhqxl6Uv1W
         10eQxGxJUAB+OCAPNBuCKx3W3PeeNqDWz45+X8OKBVNV6bPxK/wO/VXmBj3zJZmGNcrN
         xsIg==
X-Forwarded-Encrypted: i=1; AJvYcCXdZnmUA/0nHmDj+vBGF0YxGsK2vknPcJul/8ufldenNFWhcmPcu3o0uiOkJwUefvi57GCjosoE/hrwo1yaXZXGtg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyz//CqOI5NSKlcV4EuoTcrZaruuNvR7hd43PWZ0U1/XDSttOej
	y1xH2gOz9SthgrAhG0IDgodWzke883XUAj8eUuQYsahbRlH5EVGoA9cYoZNkmCwxWUo=
X-Gm-Gg: ASbGncvrtW9EkF18xyHXgxKHVgVBWUfmCVtFH4BCHK0FUbAwByJYliSm/dcVHOyGexi
	YcsshnLJFFkww1MbQSQUq2R5IUJAjtD3YnmnUyK1x93gyL2cOhnQP7nAo398IPPDeqm/odW5zFK
	JfshFhgT49+yCrrTOcpQRjxMcTWnxhkMxNrwMwJ4iLY7/Dl2EYATr5rK9aV4/pkfbC4a33hmkwX
	EKgP1C6eFbDYCFWn/JXz2DE95kKo4FbNLCjXpC1qRE12pRcanFKNTUvhX4P+KwzENAqH676gHjD
	Kao5PAP+TDWD8DWGk7sETogG3VWlLqOtmOauDuEnM2/IJTl7zyqAc9lSFDBlJzGz3rwY3o5vWhQ
	GGT7oszbOQFyaVKUtbug=
X-Google-Smtp-Source: AGHT+IEFG1Uq0+bJnTD2Z7rb6EY59UDakZmJIHTsqLqvgzbJFkRWrOHgW2ZAW7SzTWbJh8VRdtM5Dg==
X-Received: by 2002:a05:6512:1104:b0:553:abe9:c321 with SMTP id 2adb3069b0e04-55935b35c7fmr1038992e87.44.1752159055600;
        Thu, 10 Jul 2025 07:50:55 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbd3fsm393877e87.17.2025.07.10.07.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:50:55 -0700 (PDT)
Date: Thu, 10 Jul 2025 17:50:53 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: trini@konsulko.com,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Fabio Estevam <festevam@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	adrian.freihofer@siemens.com, Marek Vasut <marek.vasut@mailbox.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.04 -> 2025.07
Message-ID: <aG_TTWzkD215ATpq@nuoska>
References: <20250708012959.77522-1-festevam@gmail.com>
 <DB6OGLNWBEVN.2V2F24LHIZ4C4@bootlin.com>
 <CAOMZO5BJBc0E0EfejEPmVdGBZiQrrvRWsHhy0Bxgi+jx6WiYRQ@mail.gmail.com>
 <20250708175732.GU6424@bill-the-cat>
 <DB7DN2I98ZYX.3V9C86PS14M9B@bootlin.com>
 <20250709142932.GW6424@bill-the-cat>
 <1850E573A97965CE.21176@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1850E573A97965CE.21176@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 14:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220122

Hi,

On Thu, Jul 10, 2025 at 04:02:14PM +0300, Mikko Rapeli via lists.openembedd=
ed.org wrote:
> Adding Ilias,
>=20
> On Wed, Jul 09, 2025 at 08:29:32AM -0600, Tom Rini via lists.openembedded=
=2Eorg wrote:
> > On Wed, Jul 09, 2025 at 10:21:34AM +0200, Mathieu Dubois-Briand wrote:
> > > On Tue Jul 8, 2025 at 7:57 PM CEST, Tom Rini wrote:
> > > > On Tue, Jul 08, 2025 at 02:04:15PM -0300, Fabio Estevam wrote:
> > > >> Hi Mathieu,
> > > >>=20
> > > >> On Tue, Jul 8, 2025 at 9:37=E2=80=AFAM Mathieu Dubois-Briand
> > > >> <mathieu.dubois-briand@bootlin.com> wrote:
> > > >> >
> > > >> > On Tue Jul 8, 2025 at 3:29 AM CEST, Fabio Estevam via lists.open=
embedded.org wrote:
> > > >> > > Upgrade to U-Boot 2025.07.
> > > >> > >
> > > >> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > >> > > ---
> > > >> >
> > > >> > Hi Fabio,
> > > >> >
> > > >> > Thanks for your patch.
> > > >> >
> > > >> > It looks like this is breaking selftests on the autobuilder:
> > > >> >
> > > >> > 2025-07-08 07:43:52,116 - oe-selftest - INFO - fitimage.UBootFit=
ImageTests.test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
> > > >> > 2025-07-08 07:43:52,118 - oe-selftest - INFO -  ... FAIL
> > > >> > ...
> > > >> > ERROR: u-boot-1_2025.07-r0 do_compile: oe_runmake failed
> > > >> > ...
> > > >> > | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a:=
 No such file or directory
> > > >> >
> > > >> >
> > > >> > Both on debian and armhost:
> > > >> >
> > > >> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/1923
> > > >> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/2077
> > > >> >
> > > >> > Can you have a look at these failures please?
> > > >>=20
> > > >> Thanks for the report.
> > > >>=20
> > > >> I am adding some folks on CC in case they have some ideas.
> > > >
> > > > Interesting. How can we trigger that outside of the autobuilder?
> > >=20
> > > Hi,
> > >=20
> > > It's not so easy to reproduce, as it looks like it is somehow linked
> > > with the host environment: this have been failing on debian workers b=
ut
> > > not on the fedora ones.
> > > So basic instructions are below, but this was not enough to reproduce=
 it
> > > in the ubuntu 24.4 docker I've been using so far.
> > >=20
> > > git clone git://git.yoctoproject.org/poky-ci-archive -b autobuilder.y=
octoproject.org/valkyrie/a-full-1972
> > > cd poky-ci-archive
> > > . oe-init-build-env
> > >=20
> > > Add following lines in conf/local.conf (I bet only the last one is
> > > really needed, but let's try to be as close as possible as the
> > > autobuilder configuration):
> > > MACHINE =3D "qemux86-64"
> > > DISTRO =3D "poky"
> > > SDKMACHINE =3D "x86_64"
> > > PACKAGE_CLASSES =3D "package_rpm"
> > > RPM_GPG_SIGN_CHUNK =3D '1'
> > > IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
> > > SANITY_TESTED_DISTROS =3D ''
> > >=20
> > > Add poky-ci-archive/meta-selftest in conf/bblayers.conf.
> > >=20
> > > And finally, run the tests:
> > > oe-selftest -r fitimage.UBootFitImageTests.test_sign_cascaded_uboot_f=
it_image
> > > oe-selftest -r fitimage.UBootFitImageTests.test_sign_standalone_uboot=
_atf_tee_fit_image
> >=20
> > Yeah, looking at the logs it's not even Debian, it's Ubuntu 22.04, which
> > is what we use for our CI too. I guess I would suggest bisect'ing with
> > the autobuilder until finding out what commit breaks and then someone
> > from the U-Boot side of things can chime in.
>=20
> I've tried to reproduce this on x86_64 Ubuntu 22.04 build machine
> targeting qemuarm and arm64 Ubuntu 24.04 build machine targeting
> beaglebone. No luck so far. In my builds, lib.a has always been
> created in before any other linking steps happens. I presume this is a
> race condition where linking step of lib/efi_loader/testapp_efi.so
> does not actually have a dependency to the lib.a creating linking step.
>=20
> I'm not familiar enough with u-boot/Kconfig build setups to see where this
> dependency should be added.
>=20
> From do_compile log in passing case:
>=20
> set -e; mkdir -p include/generated/;    (echo \#define PLAIN_VERSION \"20=
25.07\"; echo \#define U_BOOT_VERSION \"U-Boot \" PLAIN_VERSION; echo \#def=
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
> ...
>   rm -f arch/arm/lib/lib.a; arm-poky-linux-gnueabi-ar cDPrsT arch/arm/lib=
/lib.a arch/arm/lib/ashldi3.o arch/arm/lib/ashrdi3.o arch/arm/lib/div0.o ar=
ch/arm/lib/div64.o arch/arm/lib/lib1funcs.o arch/arm/lib/lshrdi3.o arch/arm=
/lib/muldi3.o arch/arm/lib/uldivmod.o
> ...
>   arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -znor=
elro --no-warn-rwx-segments -L /home/mcfrisk/src/base/repo/poky/build_beagl=
ebone/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/sources/u=
-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared -Bsymbolic -s lib/efi=
_loader/testapp.o lib/efi_loader/efi_crt0.o lib/efi_loader/efi_reloc.o lib/=
efi_loader/efi_freestanding.o arch/arm/lib/lib.a -o lib/efi_loader/testapp_=
efi.so
>=20
> Looks like testapp_efi.so linking step is the first one using
> arm-poky-linux-gnueabi-ld.bfd.
>=20
> Failing case:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2914600/raw_inl=
ine
>=20
> | set -e; mkdir -p include/generated/; 	(echo \#define PLAIN_VERSION \"20=
25.07\"; echo \#define U_BOOT_VERSION \"U-Boot \" PLAIN_VERSION; echo \#def=
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
> ...
> |    rm -f lib/efi_loader/built-in.o; arm-poky-linux-gnueabi-ar cDPrsT li=
b/efi_loader/built-in.o lib/efi_loader/efi_bootmgr.o lib/efi_loader/efi_boo=
tbin.o lib/efi_loader/efi_boottime.o lib/efi_loader/efi_helper.o lib/efi_lo=
ader/efi_console.o lib/efi_loader/efi_device_path.o lib/efi_loader/efi_devi=
ce_path_to_text.o lib/efi_loader/efi_device_path_utilities.o lib/efi_loader=
/efi_dt_fixup.o lib/efi_loader/efi_fdt.o lib/efi_loader/efi_file.o lib/efi_=
loader/efi_hii.o lib/efi_loader/efi_hii_config.o lib/efi_loader/efi_image_l=
oader.o lib/efi_loader/efi_load_options.o lib/efi_loader/efi_memory.o lib/e=
fi_loader/efi_root_node.o lib/efi_loader/efi_runtime.o lib/efi_loader/efi_s=
etup.o lib/efi_loader/efi_string.o lib/efi_loader/efi_unicode_collation.o l=
ib/efi_loader/efi_var_common.o lib/efi_loader/efi_var_mem.o lib/efi_loader/=
efi_variable.o lib/efi_loader/efi_var_file.o lib/efi_loader/efi_watchdog.o =
lib/efi_loader/efi_disk.o lib/efi_loader/efi_net.o lib/efi_loader/efi_smbio=
s.o lib/efi_loader/efi_load_initrd.o lib/efi_loader/efi_conformance.o
> |   arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -zn=
orelro --no-warn-rwx-segments -L /srv/pokybuild/yocto-worker/oe-selftest-ar=
mhost/build/build-st-3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u=
-boot/2025.07/sources/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -share=
d -Bsymbolic -s lib/efi_loader/helloworld.o lib/efi_loader/efi_crt0.o lib/e=
fi_loader/efi_reloc.o lib/efi_loader/efi_freestanding.o arch/arm/lib/lib.a =
-o lib/efi_loader/helloworld_efi.so
> | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such =
file or directory
> | make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi.s=
o] Error 1
>=20
> In this failing log, nothing created lib.a before lib/efi_loader/hellowor=
ld_efi.so
> link step started.

I managed to reproduce the problem with an artificial delay:

--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -353,7 +353,7 @@ $(modorder-target): $(subdir-ym) FORCE
 #
 ifdef lib-target
 quiet_cmd_link_l_target =3D AR      $@
-cmd_link_l_target =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
+cmd_link_l_target =3D rm -f $@ && echo "HACK, delaying build!" && sleep 60=
 && $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)

 $(lib-target): $(lib-y) FORCE
        $(call if_changed,link_l_target)


and fix for this seems to be:

--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -508,7 +508,7 @@ $(obj)/efi_reloc.o: $(srctree)/arch/$(ARCH)/lib/$(EFI_R=
ELOC:.o=3D.c) $(recordmcoun
        $(call cmd,force_checksrc)
        $(call if_changed_rule,cc_o_c)
=20
-$(obj)/%_efi.so: $(obj)/%.o $(obj)/efi_crt0.o $(obj)/efi_reloc.o $(obj)/ef=
i_freestanding.o
+$(obj)/%_efi.so: $(PLATFORM_LIBGCC) $(obj)/%.o $(obj)/efi_crt0.o $(obj)/ef=
i_reloc.o $(obj)/efi_freestanding.o
        $(call cmd,efi_ld)
=20
 targets +=3D $(obj)/efi_crt0.o $(obj)/efi_reloc.o $(obj)/efi_freestanding.o

I sent this to u-boot list but it seems my message is in moderator queue.
Fabio was on Cc: so maybe you can pick this up for a new revision of u-boot
update to oe-core. It should fix the race condition.
=20
Cheers,

-Mikko

