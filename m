Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4B3C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 13:34:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.12936.1708522441307589225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 05:34:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZPanmy9I;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d934c8f8f7so62222205ad.2;
        Wed, 21 Feb 2024 05:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708522441; x=1709127241; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyafnRtKvRGMauS1CKn8M6UEys8UxioJpaxfGsrqjWE=;
        b=ZPanmy9Ip5sTiLlHMslm4imMclirRyIuqRvYU+eSZHfNiz9rfbpYO+KNzbO1r3Tcq8
         cxv6NGDUwxBM/h/4/u/bN87j9sESdEacJQvWjfRCHEmrQ9awlTLOAZD2s8wWR4scYMGU
         T73196IYxjF6jaoHHqBBQ0fbM1GmTRDgPTyTQ1ZEQmT2GtWT6o1h0VTk7fsvjOKvb2Bb
         NBMJO1iUeFoTRJfLiW1qSJXZevQAQZT1zyl3+Qn7K9zKYhA9GT+AFvcoUNo2PMO/T39k
         /jqTpSelNILVMmd04xBXP/bKMPuiGk3qAwVKhcMNGULlqog1KJWldh+0na9so6CSyiPW
         gqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522441; x=1709127241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyafnRtKvRGMauS1CKn8M6UEys8UxioJpaxfGsrqjWE=;
        b=UWiqyBLG0FvwT+TePQa9mk1adkqhOe3ihuoVUObZig+tbNkAxZPa2DIp7VEPTlahab
         YW0qDcHto60h4VZDNv/5p+uZcm3zP8Qf6isQSnR0G7H33cNQh+agSuaUvLTuyPOOovS0
         /9cXQWD6oVnq0QUcEsrqsC8wgVHx36u5NeeOnEYGxIMy5iU4NMcu6BP3XTSmvUCu4L8t
         Xe2hW2utjo6bOLD5orI905i5tgC4glu4I7qZdOxxcMbcoVKcrvQbulR7pdn61jCly0E2
         P5IT3I8Isd6YQQPyXRvmqFpMDwj80+YatPNfZouO3C+ksPoPnukC6nM24fURuNRgsn18
         0osg==
X-Forwarded-Encrypted: i=1; AJvYcCXybImVknR8uvXLiM1AzoA2wJCTwkt1HyKcOGFa1tr3mNd+pKNiSWnnJEkIq7xpWohY4kwATjUnAU+s+ettBx0XP3cwRXSfHgAOHX/K53SjTz3VNpKGTwbIw8J9C3gKMzzrEJN5Hd9EYTsU7bX2CJjvOxqJ7ijwMNgA6VaNa6WOKN2+6nMbsy37va4=
X-Gm-Message-State: AOJu0YyCFfLM1g0tPHietZ36a22ftEUhLpU9AqONs1biKGqxr95VKQIp
	doLrQaW2NtEm3AimBeIKEm7HwveGsO5haZyHKgsGMrrJ/y6NN4y6xa6BMROENuU885ThGeWJxj7
	DnBV2UzwvpexdELayuNmBJ3r47mg=
X-Google-Smtp-Source: AGHT+IHWtD1e/uwtzYJeUQOqF1MblhuQXbANysxAeu6V4gTJktUQnx3MrreNzHq4NTu7vYHI7p1rAk9r9qvjY9Mec28=
X-Received: by 2002:a17:90b:80d:b0:299:755f:877 with SMTP id
 bk13-20020a17090b080d00b00299755f0877mr8411593pjb.27.1708522440421; Wed, 21
 Feb 2024 05:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20240221105723.1501833-1-ross.burton@arm.com>
In-Reply-To: <20240221105723.1501833-1-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Feb 2024 08:33:49 -0500
Message-ID: <CADkTA4N21avve1TdzPrzGVUxn7WHKokooK=yiFND8RUJ-zJnTg@mail.gmail.com>
Subject: Re: [Openembedded-architecture] [RFC PATCH] Add genericarm64 MACHINE
 using upstream defconfig
To: Ross Burton <ross.burton@arm.com>
Cc: poky@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	openembedded-architecture@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 13:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195972

I'm quite simply a hard NACK on this.

Everyone can feel free to overrule me here, but I won't be able to
maintain this along with the other board that I test each -dev,
variant and -stable bump with.

There are tools, etc, that while gathering dust can help chop up a
config, and that's where we can spend the time, along with making sure
the fragments make sense and are usable.

We all agreed to hold the reference boards to a higher standard, and
now I see this. So as tired and frustrated as you say you are,
multiply that by two with me.

Cheers,

Bruce


On Wed, Feb 21, 2024 at 5:57=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> This is a new 64-bit "generic" Arm machine, that expects the hardware to
> be SystemReady IR compatible. This is slightly forward-leaning as there's
> not a _lot_ of SystemReady hardware in the wild, but most modern boards
> are and the number will only grow.  Also, this is the only way to have a
> 'generic' machine as without standardised bootloaders and firmware it
> would be impossible.
>
> The base machine configuration isn't that exciting: it's a fully featured
> machine that supports most things, booting via UEFI and an initramfs.
>
> However, the kernel is more interesting.  This RFC uses the upstream defc=
onfig
> because unlike some other platforms, the arm64 defconfig is actively
> maintained with the goal of being a 'boots on most hardware' configuratio=
n.
> My argument is: why would we duplicate that effort?
>
> The "linux-yocto way" is configuration fragments and after a week of
> hair-pulling I do actually have fragments that boot on a BeaglePlay, but
> to say this was a tiresome and frustrating exercise would be understating=
 it.
>
> So, a request for comments: is it acceptable to use the upstream defconfi=
g in
> a reference BSP?  Personally I'm torn: the Yocto way is fragments not mon=
olithic
> configs, but repeating the effort to fragmentise the configuration and th=
en
> also have it sufficiently modular that it can be used in pieces - instead=
 of
> just being a large file split up into smaller files - is a lot of effort =
for
> what might end up being minimal gain.  My fear is we end up with a fragme=
nted
> configuration that can't be easily modified without breaking some platfor=
ms,
> and badly copies what the defconfig already does.
>
> Ross
> ---
>  meta-yocto-bsp/README.hardware.md             |  7 +++++
>  meta-yocto-bsp/conf/machine/genericarm64.conf | 26 +++++++++++++++++++
>  .../linux/linux-yocto_6.6.bbappend            |  9 +++++++
>  meta-yocto-bsp/wic/genericarm64.wks.in        | 11 ++++++++
>  4 files changed, 53 insertions(+)
>  create mode 100644 meta-yocto-bsp/conf/machine/genericarm64.conf
>  create mode 100644 meta-yocto-bsp/wic/genericarm64.wks.in
>
> diff --git a/meta-yocto-bsp/README.hardware.md b/meta-yocto-bsp/README.ha=
rdware.md
> index a8f38cb21a6..58ebc328b56 100644
> --- a/meta-yocto-bsp/README.hardware.md
> +++ b/meta-yocto-bsp/README.hardware.md
> @@ -29,6 +29,7 @@ The following boards are supported by the meta-yocto-bs=
p layer:
>
>    * Texas Instruments Beaglebone (beaglebone-yocto)
>    * General IA platforms (genericx86 and genericx86-64)
> +  * General 64-bit Arm SystemReady platforms (genericarm64)
>
>  For more information see the board's section below. The appropriate MACH=
INE
>  variable value corresponding to the board is given in brackets.
> @@ -126,6 +127,12 @@ USB Device:
>         dd command to write the image to a USB stick.
>
>
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
>
> diff --git a/meta-yocto-bsp/conf/machine/genericarm64.conf b/meta-yocto-b=
sp/conf/machine/genericarm64.conf
> new file mode 100644
> index 00000000000..2ea270d8b06
> --- /dev/null
> +++ b/meta-yocto-bsp/conf/machine/genericarm64.conf
> @@ -0,0 +1,26 @@
> +#@TYPE: Machine
> +#@NAME: genericarm64
> +#@DESCRIPTION: Generic Arm64 machine for typical SystemReady platforms, =
which
> +#have working firmware and boot via EFI.
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +# Arm Base System Architecture says v8.0+ is allowed, but FEAT_CRC32 is =
required
> +DEFAULTTUNE =3D "armv8a-crc"
> +
> +MACHINE_FEATURES =3D "acpi alsa bluetooth efi keyboard pci qemu-usermode=
 rtc screen usbhost vfat wifi"
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
> +EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
> +
> +# Try to bring up one physical serial console, or a virtualized serial c=
onsole
> +SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
> diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend=
 b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> index 8e465c241e8..18f95de348f 100644
> --- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> @@ -1,19 +1,28 @@
>  KBRANCH:genericx86  =3D "v6.6/standard/base"
> +KBRANCH:genericarm64  =3D "v6.6/standard/base"
>  KBRANCH:genericx86-64  =3D "v6.6/standard/base"
>  KBRANCH:beaglebone-yocto =3D "v6.6/standard/beaglebone"
>
> +KMACHINE:genericarm64 ?=3D "genericarm64"
>  KMACHINE:genericx86 ?=3D "common-pc"
>  KMACHINE:genericx86-64 ?=3D "common-pc-64"
>  KMACHINE:beaglebone-yocto ?=3D "beaglebone"
>
> +SRCREV_machine:genericarm64 ?=3D "332d4668fcc32826907d4f3c49388452060060=
89"
>  SRCREV_machine:genericx86 ?=3D "332d4668fcc32826907d4f3c4938845206006089=
"
>  SRCREV_machine:genericx86-64 ?=3D "332d4668fcc32826907d4f3c4938845206006=
089"
>  SRCREV_machine:beaglebone-yocto ?=3D "332d4668fcc32826907d4f3c4938845206=
006089"
>
> +COMPATIBLE_MACHINE:genericarm64 =3D "genericarm64"
>  COMPATIBLE_MACHINE:genericx86 =3D "genericx86"
>  COMPATIBLE_MACHINE:genericx86-64 =3D "genericx86-64"
>  COMPATIBLE_MACHINE:beaglebone-yocto =3D "beaglebone-yocto"
>
> +LINUX_VERSION:genericarm64 =3D "6.6.15"
>  LINUX_VERSION:genericx86 =3D "6.6.15"
>  LINUX_VERSION:genericx86-64 =3D "6.6.15"
>  LINUX_VERSION:beaglebone-yocto =3D "6.6.15"
> +
> +# Use upstream defconfig for genericarm64
> +KBUILD_DEFCONFIG:genericarm64 =3D "defconfig"
> +KCONFIG_MODE:genericarm64 =3D "--alldefconfig"
> diff --git a/meta-yocto-bsp/wic/genericarm64.wks.in b/meta-yocto-bsp/wic/=
genericarm64.wks.in
> new file mode 100644
> index 00000000000..417d4d88104
> --- /dev/null
> +++ b/meta-yocto-bsp/wic/genericarm64.wks.in
> @@ -0,0 +1,11 @@
> +# short-description: Create an EFI disk image
> +# long-description: Creates a partitioned EFI disk image that the user
> +# can directly dd to boot media.
> +
> +part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R},initrd=3D${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}" --label boo=
t --active --align 1024 --use-uuid
> +
> +part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
> +
> +part swap --size 44 --label swap --fstype=3Dswap --use-uuid
> +
> +bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1966): https://lists.openembedded.org/g/openembedded-=
architecture/message/1966
> Mute This Topic: https://lists.openembedded.org/mt/104485828/1050810
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/u=
nsub [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

