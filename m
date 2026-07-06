Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995F3C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 21:34:04 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.160789.1783373635042074683
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 14:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=FpwSYlkZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.177, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4960fb63c75so2429414b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 14:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783373634; cv=none;
        d=google.com; s=arc-20260327;
        b=UEd9SNLWG6E79scGUYEExpDaMrsB5nI9bprfWv9BUCBE61iNEJL1rGBjZ7nQGCe/m2
         UjIPHCY3WEz5xMxRIp/IBwt0fZFPCA07nkqZ0zSl9ClpZm0kzPQisAYd9863A53eZNSe
         Apyh/hP8wJvBYhKTH2/Cxqz0EY7Pu+vIPCtHzRGZcjVc53IEkIY49NfH8aKHJ4UNZBZO
         yhKzpm3vg7B/4VZohYvCToY6Q6QOBVYeIxjS8Kq8p7jOqzoUwSQHQIrnHrxp2nh0yl7u
         hNRXLFWcGNYV11CUf3NWAcTJIWx0mlEtqDEBYWSjSwfDLkh/1BcsEDzZRU4PX+GXohOb
         QpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q4NPhbBHioYJT8ElwM7WB3cw+yLm2wLLGXvynp+Cm7E=;
        fh=MUgFGduq7DcLFa/sH5G6T7JfWtPDieMYB1jWZ6LzgLA=;
        b=qFQ1sIWCsQmLa6Ljke7HwuvNLg2RKMkMdMbjc3gRIgWzeHP2WyUXMPTYL/yJQ4riY6
         RoQt2QdN/NShRO9B8HdLeRJXhnxp/eYks4rpfoff/4AG2jXbNCpCH6AvQxvTjLQMUfFc
         hRZ7ncvYAFLuY1WVQTl7Wa37mOgVSY5MJlZKxWJdlYnsR+E43JXPNeq3XlwgvhhpV2wT
         JgA4bPhicnEEONbo3RqL9t+F358EUuhoPj3nqlP8YeKnW0Bd7G1lIsfJE24Uv+lxLEnc
         xcxuh3z2cf8xsXDbcqTlefMwvWpoulYcA06icUM7JjT3nvTAeyn0DGEfBRnIEfQxMTgg
         NXRA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1783373634; x=1783978434; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4NPhbBHioYJT8ElwM7WB3cw+yLm2wLLGXvynp+Cm7E=;
        b=FpwSYlkZkf+uUU8lysmMfgrGLiLvQHM8+xNkCtLzERcZh6zUk3hUUWvnjoB487FISg
         UdvGI/LctpIlV4EWqWJsGGUHXAl1PZi5CZgrWmKYMDgEZI2mbTiFmx9eQbteXLlJR/X7
         zEzgqzeNDs1ET3t/GMlca9+ucg5DADS65QyBosnwmHo1FfOmTa67Kw7zwVIyZzKdRE1j
         FDp0Mqb5jY+zW77E2p4GHqn5ifaFlxOXHLzb36T4dumdZtvTh42zgNEKNnEF/BYIzUq5
         uYd7WGgUZkTjhL/7nDNsMeepX+VSO/f0eyGd/vlQIX/zKCGJp366xd6dIyEAS4bxLv+P
         ivpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373634; x=1783978434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4NPhbBHioYJT8ElwM7WB3cw+yLm2wLLGXvynp+Cm7E=;
        b=dG7HDmfjG/vgDkLcGXdmpN0oAB0TNLA5ozhvhpDYq3MciZZUqZ4/I/UqXpLeApic1y
         YBObcrebloq4q9hmuYKdb0wxuZl5VAMHyHnoINIyGVhcbdo35YbxyGSkpO3fRI6xiq3j
         eIVMzJuFBgclAaSWThw2hdhOqgaCzQJSrDMVn4FoIyubqx/pQYwxEtpFpD95AVIio1qI
         0OJ0O4/FcB6twrd55xE6LSSkM1uzCFB4whyFYaJifiyukXAJzBnD6E+SBwzZES39MZG/
         tCLAYo/2dn2oDmvN5wbK6NEEjchTLyzNuaHos1SW0zvUcCcWgPJWY3yrAOaE/jHiLCc0
         2+eA==
X-Gm-Message-State: AOJu0YzpzC3IHhInZEMdT+/4bEEE/CMpS/G2Qzo9Nnq38ABWxH6tMR0R
	A2hvXSz+pP3zeawushBuICU4cc0C/eC0bSPfSrDsPrKJXK4P02L7rLVZ5ZovEHb+5dd6iueIlei
	KftqrSC7pLmY8VjLj7/+prZ1yO7UI5tuX7KmxymDt
X-Gm-Gg: AfdE7ckSA8xQ5asJnB1SfNasxb9TJT6jlTsyXHA/vtp6vnAPQOWjpqKFpeDcu1YMFwF
	aYspBj6oCx6QmtG6Z+0IyqVFyPkmHvhfx9jL0AtdbxxWiazwuA9NauOpH/KCI/RHaJNnh0hxpu1
	cPjw9iSxC5T6Da+E86QcbTOjVYVZbXuiyXKdrdkQ2eavboXxKHoUALuKHCtjviZe/R3fvzJN4XM
	Mo5XWJezSMTkLo5rTVnil2VDSI/DjXMSEnZozMwEMfZ2RsvVHphRnREBI3aVrZchoFxJ2h0
X-Received: by 2002:a05:6808:1b24:b0:49a:9631:9b81 with SMTP id
 5614622812f47-49fde3e3917mr1674991b6e.21.1783373632012; Mon, 06 Jul 2026
 14:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-tune-a32-v1-0-a43f28b1d7a4@gmail.com> <20260701-tune-a32-v1-3-a43f28b1d7a4@gmail.com>
In-Reply-To: <20260701-tune-a32-v1-3-a43f28b1d7a4@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 6 Jul 2026 17:33:41 -0400
X-Gm-Features: AVVi8CdjPpnlgt3nKFRV1Sbmv599ZpwP9peR9VDEbz2q-Bkje8To70oaGBMtuT0
Message-ID: <CAPoiz9xUkXsbJN7N4xB7uPaQ3XW-akpmcEB5JY=pBZ7oAddHcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] qemuarmv8a32: add QEMU machine for AArch32 ARMv8-A
To: alex.kiernan@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alexk@a-squared-projects.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 21:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240343

On Wed, Jul 1, 2026 at 7:58=E2=80=AFAM Alex Kiernan via lists.openembedded.=
org
<alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
>
> Add a QEMU machine for exercising an AArch32-only ARMv8-A target
> (Cortex-A32) under emulation, defaulting to the cortexa32-crypto tune.
> QEMU has no Cortex-A32 model, so it runs on the 'virt' machine with
> qemu-system-arm and -cpu max, which provides the ARMv8-A AArch32 feature
> set including the crypto extensions needed by the crypto tune. The kernel
> is built as a zImage and u-boot uses qemu_arm_defconfig, matching the
> other 32-bit ARM QEMU machines.
>
> Map KMACHINE to qemuarma15 so the existing linux-yocto BSP is reused, and
> add qemuarmv8a32 to linux-yocto's COMPATIBLE_MACHINE so a kernel can be
> built for it.
>
> AI-Generated: Claude Code (Claude Opus 4.8)
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
> ---
>  meta/conf/machine/qemuarmv8a32.conf           | 36 +++++++++++++++++++++=
++++++
>  meta/recipes-kernel/linux/linux-yocto_6.18.bb |  2 +-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/qemuarmv8a32.conf b/meta/conf/machine/qemu=
armv8a32.conf
> new file mode 100644
> index 000000000000..8e49a56ae720
> --- /dev/null
> +++ b/meta/conf/machine/qemuarmv8a32.conf
> @@ -0,0 +1,36 @@
> +#@TYPE: Machine
> +#@NAME: QEMU ARMv8 AArch32 machine on Cortex-A32
> +#@DESCRIPTION: Machine configuration for running an AArch32 system on QE=
MU
> +
> +DEFAULTTUNE =3D "cortexa32-crypto"
> +
> +require conf/machine/include/arm/armv8a/tune-cortexa32.inc
> +require conf/machine/include/qemu.inc
> +
> +KERNEL_IMAGETYPE =3D "zImage"
> +
> +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> +UBOOT_MACHINE ?=3D "qemu_arm_defconfig"
> +
> +SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
> +
> +# For runqemu
> +QB_SYSTEM_NAME =3D "qemu-system-arm"
> +QB_MACHINE =3D "-machine virt"
> +# QEMU doesn't know about Cortex-A32
> +QB_CPU =3D "-cpu max"

I have concerns that this isn't doing what is expected.  Looking at
qemu-system-arm -machine virt -cpu
I'm seeing
...
  cortex-a15
  cortex-a7
  cortex-a8
  cortex-a9
...
and not any of the armv8 cores.  So, I think that you aren't going to
get any of the ARMv8 features with 'max', despite them possibly being
in the tune referenced above, which might cause crashes or other
unintended issues.
You might be okay on qemu-system-aarch64, given the ARMv8 cores there.
Maybe you can try emulating the cortex-a35 core and running it in
32bit mode

If I'm wrong, please provide a link to the documentation stating that
max on qemu-system-arm does what you say, because I'm not seeing it on
https://www.qemu.org/docs/master/system/arm/virt.html

Thanks,
Jon

> +QB_SMP ?=3D "-smp 4"
> +QB_CPU_KVM =3D "-cpu host -machine gic-version=3D3"
> +# For graphics to work we need to define the VGA device as well as the n=
ecessary USB devices
> +QB_GRAPHICS =3D "-device virtio-gpu-pci"
> +QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
> +# Virtio Networking support
> +QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscr=
ipt=3Dno"
> +QB_NETWORK_DEVICE =3D "-device virtio-net-pci,netdev=3Dnet0,mac=3D@MAC@"
> +# Virtio block device
> +QB_ROOTFS_OPT =3D "-drive id=3Ddisk0,file=3D@ROOTFS@,if=3Dnone,format=3D=
raw -device virtio-blk-pci,drive=3Ddisk0"
> +# Virtio serial console
> +QB_SERIAL_OPT =3D "-device virtio-serial-pci -chardev null,id=3Dvirtcon =
-device virtconsole,chardev=3Dvirtcon"
> +QB_TCPSERIAL_OPT =3D "-device virtio-serial-pci -chardev socket,id=3Dvir=
tcon,port=3D@PORT@,host=3D127.0.0.1,nodelay=3Don -device virtconsole,charde=
v=3Dvirtcon"
> +
> +KMACHINE:qemuarmv8a32 =3D "qemuarma15"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes=
-kernel/linux/linux-yocto_6.18.bb
> index 2b1298dedf9c..a818506bb6f3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> @@ -52,7 +52,7 @@ KCONF_BSP_AUDIT_LEVEL =3D "1"
>
>  KERNEL_DEVICETREE:qemuarmv5 =3D "arm/versatile-pb.dtb"
>
> -COMPATIBLE_MACHINE =3D "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qe=
muppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarc=
h64)$"
> +COMPATIBLE_MACHINE =3D "^(qemuarm|qemuarmv5|qemuarmv8a32|qemuarm64|qemux=
86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32=
|qemuloongarch64)$"
>
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239980): https://lists.openembedded.org/g/openembedde=
d-core/message/239980
> Mute This Topic: https://lists.openembedded.org/mt/120062731/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jd=
mason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

