Return-Path: <paulg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E07C5478B
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:30:02 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by mx.groups.io with SMTP id smtpd.web11.200.1708543794991242790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kernel.org header.s=k20201202 header.b=LxaTbuwO;
 spf=pass (domain: kernel.org, ip: 145.40.73.55, mailfrom: paulg@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 134CDCE1E98;
	Wed, 21 Feb 2024 19:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2F9C433C7;
	Wed, 21 Feb 2024 19:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708543791;
	bh=OJXPWmIAxR6o1PDE16Qn/3xHrOgAueBqL7hjRHG5ses=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LxaTbuwOnEXU3TVcnuMTRxHT6reCUmtJrq1zs/JlamG6v36EeJuJIYXg0H/+Otf4e
	 DPexBiLrryrt/PLvyn/FXXu6YDphDKuUyptuZy93KgaoWBLW4g+mdYdDhMrK1FXTO8
	 tSaWGTPGssvbHvWYVlplzE3GGfEVr/AZkDzBhHLBolMN3j/NhQYk1yrvWVhXcTmmBi
	 tA0rX8uvHMMVLbEdG4ao8bdnkNVYsAdyQl6Ft0wzbYpfnzzEipv657PcSqjlRHLLls
	 9GbXaMKbmbbrRvfLdjX4kQcnH7+DUUa1d9OANnOCAuwjNEHU3COuslf4yfnC6Tm/1u
	 ucdWAJXjZWKRg==
From: paulg@kernel.org
To: ross.burton@arm.com
Cc: poky@lists.yoctoproject.org,
	openembedded-core@lists.openembedded.org,
	openembedded-architecture@lists.openembedded.org,
	Paul Gortmaker <paulg@kernel.org>
Subject: Re: [RFC PATCH] Add genericarm64 MACHINE using upstream defconfig
Date: Wed, 21 Feb 2024 14:29:11 -0500
Message-Id: <ZdZHldfVCU8v2V/x@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221105723.1501833-1-ross.burton@arm.com>
References: <20240221105723.1501833-1-ross.burton@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195983

From: Paul Gortmaker <paulg@kernel.org>

[[RFC PATCH] Add genericarm64 MACHINE using upstream defconfig] On 21/02/=
2024 (Wed 10:57) ross.burton@arm.com wrote:

> From: Ross Burton <ross.burton@arm.com>
>=20
> This is a new 64-bit "generic" Arm machine, that expects the hardware t=
o
> be SystemReady IR compatible. This is slightly forward-leaning as there=
's
> not a _lot_ of SystemReady hardware in the wild, but most modern boards
> are and the number will only grow.  Also, this is the only way to have =
a
> 'generic' machine as without standardised bootloaders and firmware it
> would be impossible.
>=20
> The base machine configuration isn't that exciting: it's a fully featur=
ed
> machine that supports most things, booting via UEFI and an initramfs.
>=20
> However, the kernel is more interesting.  This RFC uses the upstream de=
fconfig
> because unlike some other platforms, the arm64 defconfig is actively
> maintained with the goal of being a 'boots on most hardware' configurat=
ion.
> My argument is: why would we duplicate that effort?

I have no problem with the idea of a genericarm64, but the defconfig
approach is not the way to go.

> The "linux-yocto way" is configuration fragments and after a week of
> hair-pulling I do actually have fragments that boot on a BeaglePlay, bu=
t
> to say this was a tiresome and frustrating exercise would be understati=
ng it.

Yes, if you start with a giant "defconfig" file and try and slowly chip
away at it, it can be frustrating and time consuming.  I never do that.

It is the same problem space as trying to turn core-image-full-cmdline
into core-image-minimal by removing one package at a time.  Always
easier to start with the bare minimum and then add stuff.

> So, a request for comments: is it acceptable to use the upstream defcon=
fig in
> a reference BSP?  Personally I'm torn: the Yocto way is fragments not m=
onolithic

In a word, the answer is "no".

Let me insert a bit of history here - darn near 20y ago now - when we
were just starting out with linux, we had BSPs on different kernel
versions, and worse - the use of flat monolithic "defconfig" type files
on a per BSP basis.  The latter was to be blunt, just crap.  There was
no uniformity across BSPs in the same "family" - where family would be
something like CGL back in the 2005 era.

One BSP might have built iso9660 fs, another one not. Or one enabled
some debug option and another one didn't.  The inconsistency was just
horrible and unbearable.  BSPs were screwing with options they had no
business touching.

After a couple years of that mess, I believe several of us (which
included Bruce and myself) had just about enough.  What we came up with
was isolating the board config to a select subset of hardware/driver
Kconfig options and the "platform" would handle "non-harware" options.

That largely is still what exists in Yocto today, even though we were
not using Yocto waaay back then.  It immediately brought consistency
across platforms, and a stark clarity to exactly what the board required
for Kconfig settings - typically less than a screen full - choose the
CPU and the driver for video and disk/flash and USB chip etc.  Compare
that to the unreadable 10,000+ lines in a defconfig now.

So, yes I'll grant you that making that one screen full of core hardware
settings can be frustrating.  But at the same time, it has also served
as a valuable filter.  If a person can't distill a BSP down into the
core options it *really* needs, then they typically either don't
understand the hardware, or are just not invested enough to go that
extra mile.  I'm not saying either is the case here - just in general.

On top of all that - we've had similar discussions before along similar
lines - where Yocto/OE are not RedHat or Ubuntu - where we try and
deliver a distro with "one config works everywhere" kind of stuff.

I'm fine with genericarm64 - but please please don't encourage the chaos
and madness associated with random unmaintainable defconfigs!  Just
because it exists upstream doesn't mean it is good.

Thanks,
Paul.

> configs, but repeating the effort to fragmentise the configuration and =
then
> also have it sufficiently modular that it can be used in pieces - inste=
ad of
> just being a large file split up into smaller files - is a lot of effor=
t for
> what might end up being minimal gain.  My fear is we end up with a frag=
mented
> configuration that can't be easily modified without breaking some platf=
orms,
> and badly copies what the defconfig already does.
>=20
> Ross
> ---
>  meta-yocto-bsp/README.hardware.md             |  7 +++++
>  meta-yocto-bsp/conf/machine/genericarm64.conf | 26 +++++++++++++++++++
>  .../linux/linux-yocto_6.6.bbappend            |  9 +++++++
>  meta-yocto-bsp/wic/genericarm64.wks.in        | 11 ++++++++
>  4 files changed, 53 insertions(+)
>  create mode 100644 meta-yocto-bsp/conf/machine/genericarm64.conf
>  create mode 100644 meta-yocto-bsp/wic/genericarm64.wks.in
>=20
> diff --git a/meta-yocto-bsp/README.hardware.md b/meta-yocto-bsp/README.=
hardware.md
> index a8f38cb21a6..58ebc328b56 100644
> --- a/meta-yocto-bsp/README.hardware.md
> +++ b/meta-yocto-bsp/README.hardware.md
> @@ -29,6 +29,7 @@ The following boards are supported by the meta-yocto-=
bsp layer:
> =20
>    * Texas Instruments Beaglebone (beaglebone-yocto)
>    * General IA platforms (genericx86 and genericx86-64)
> +  * General 64-bit Arm SystemReady platforms (genericarm64)
> =20
>  For more information see the board's section below. The appropriate MA=
CHINE
>  variable value corresponding to the board is given in brackets.
> @@ -126,6 +127,12 @@ USB Device:
>         dd command to write the image to a USB stick.
> =20
> =20
> +SystemReady Arm Platforms
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +TODO
> +
> +
>  Texas Instruments Beaglebone (beaglebone-yocto)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> diff --git a/meta-yocto-bsp/conf/machine/genericarm64.conf b/meta-yocto=
-bsp/conf/machine/genericarm64.conf
> new file mode 100644
> index 00000000000..2ea270d8b06
> --- /dev/null
> +++ b/meta-yocto-bsp/conf/machine/genericarm64.conf
> @@ -0,0 +1,26 @@
> +#@TYPE: Machine
> +#@NAME: genericarm64
> +#@DESCRIPTION: Generic Arm64 machine for typical SystemReady platforms=
, which
> +#have working firmware and boot via EFI.
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +# Arm Base System Architecture says v8.0+ is allowed, but FEAT_CRC32 i=
s required
> +DEFAULTTUNE =3D "armv8a-crc"
> +
> +MACHINE_FEATURES =3D "acpi alsa bluetooth efi keyboard pci qemu-usermo=
de rtc screen usbhost vfat wifi"
> +
> +# Install all the kernel modules and all the firmware
> +MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-modules linux-firmware"
> +
> +KERNEL_IMAGETYPE =3D "Image"
> +PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
> +INITRAMFS_IMAGE ?=3D "core-image-initramfs-boot"
> +
> +IMAGE_FSTYPES ?=3D "wic"
> +WKS_FILE ?=3D "genericarm64.wks.in"
> +
> +EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", =
"systemd-boot", "grub-efi", d)}"
> +
> +# Try to bring up one physical serial console, or a virtualized serial=
 console
> +SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
> diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappe=
nd b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> index 8e465c241e8..18f95de348f 100644
> --- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> @@ -1,19 +1,28 @@
>  KBRANCH:genericx86  =3D "v6.6/standard/base"
> +KBRANCH:genericarm64  =3D "v6.6/standard/base"
>  KBRANCH:genericx86-64  =3D "v6.6/standard/base"
>  KBRANCH:beaglebone-yocto =3D "v6.6/standard/beaglebone"
> =20
> +KMACHINE:genericarm64 ?=3D "genericarm64"
>  KMACHINE:genericx86 ?=3D "common-pc"
>  KMACHINE:genericx86-64 ?=3D "common-pc-64"
>  KMACHINE:beaglebone-yocto ?=3D "beaglebone"
> =20
> +SRCREV_machine:genericarm64 ?=3D "332d4668fcc32826907d4f3c493884520600=
6089"
>  SRCREV_machine:genericx86 ?=3D "332d4668fcc32826907d4f3c49388452060060=
89"
>  SRCREV_machine:genericx86-64 ?=3D "332d4668fcc32826907d4f3c49388452060=
06089"
>  SRCREV_machine:beaglebone-yocto ?=3D "332d4668fcc32826907d4f3c49388452=
06006089"
> =20
> +COMPATIBLE_MACHINE:genericarm64 =3D "genericarm64"
>  COMPATIBLE_MACHINE:genericx86 =3D "genericx86"
>  COMPATIBLE_MACHINE:genericx86-64 =3D "genericx86-64"
>  COMPATIBLE_MACHINE:beaglebone-yocto =3D "beaglebone-yocto"
> =20
> +LINUX_VERSION:genericarm64 =3D "6.6.15"
>  LINUX_VERSION:genericx86 =3D "6.6.15"
>  LINUX_VERSION:genericx86-64 =3D "6.6.15"
>  LINUX_VERSION:beaglebone-yocto =3D "6.6.15"
> +
> +# Use upstream defconfig for genericarm64
> +KBUILD_DEFCONFIG:genericarm64 =3D "defconfig"
> +KCONFIG_MODE:genericarm64 =3D "--alldefconfig"
> diff --git a/meta-yocto-bsp/wic/genericarm64.wks.in b/meta-yocto-bsp/wi=
c/genericarm64.wks.in
> new file mode 100644
> index 00000000000..417d4d88104
> --- /dev/null
> +++ b/meta-yocto-bsp/wic/genericarm64.wks.in
> @@ -0,0 +1,11 @@
> +# short-description: Create an EFI disk image
> +# long-description: Creates a partitioned EFI disk image that the user
> +# can directly dd to boot media.
> +
> +part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVI=
DER},initrd=3D${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}" --label=
 boot --active --align 1024 --use-uuid
> +
> +part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use=
-uuid
> +
> +part swap --size 44 --label swap --fstype=3Dswap --use-uuid
> +
> +bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4"
> --=20
> 2.34.1
>=20
>=20


