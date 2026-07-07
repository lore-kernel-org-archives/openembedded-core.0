Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F14C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 08:40:18 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.168977.1783413607056490196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 01:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qUsR6+JV;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39af6402933so32242501fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 01:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783413605; cv=none;
        d=google.com; s=arc-20260327;
        b=n5q1Gi73MY9A02F6OYTul4mZa3iDt8f2Qd8YDl6klfaCHQm8vMz6usJlFZ54IZuFHa
         mQ2aDtb6rqcT42aCLqEeXomucc1iC4rR7/ks5daDQrvnXO20tR/RBa3VsYFe3z9ON1kH
         cYRl2FS5Vo8IicCBCqH6Dq7cRAejskvw4CwuoPE0JzNeLD5B3EeWQmSQ6hwQhFVhVZbx
         nN7M5Tj2aB17K60Uf/Abj9SFjahYQ4QWkO9NYcWWXKSj9e3YQf79cH10xJt9iIrv+ggv
         ilcCkTBuN2ExYgR/j1JyyLFtdu0BPhYnbQNFdLAX0J4PB7M+iWCU1mJzNKmkpBZySt1l
         kXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6bqfJGNd9g7OGlSlI8PzSUzFJ0LXg6YA+W5T4gi/HZw=;
        fh=mgthSpsUGsLDTxrpKiNJt8Eq3L6W4Ada1QHtZF6j/hk=;
        b=Uj5Bck7lKpaApBXkhtD0TUeS68zT9Kpx8EZraqIgWlgg3bcXc6tzZyQjz2ekIimOFn
         r3zBI0X5vqK6zRtWTxx59pPEyde8hoP0pTOtuXdccY8wQ43oREkHzQOFtHbGafUMrNyW
         hmnB0Af4v9WeL41RKYLS68cdvBrLd48kLJ9bZcCDM7roi0v30fPol4+WNt4NgwlSWXAF
         pTLlXhi1aeA/26NL97jEukKqECegZxe4gUX5Nbv69mM/T9L/k6TxbfG2DTmMdgiFFFAs
         YSG2z00faC74bMoogcjtt6MUdmmMnaC2YaaysVjpRWHYWBOFR9DoYvtdcpJQkXkIvNjw
         zRUw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783413605; x=1784018405; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6bqfJGNd9g7OGlSlI8PzSUzFJ0LXg6YA+W5T4gi/HZw=;
        b=qUsR6+JVDVykljx0aC+ielFCQapbIoDQKQX6tr1UV0/jrL57hsETtWQyb+6Gb1+F/A
         cvd6bVKc/ioDWIlruI/6wmoExJgDKoIRQuUjYg7jCob9/N0a556vXbb8pHifgDeO1st4
         hTUygTxJoFaWpP9oIkwpDaD/Wi/nbshFHrni3jt429lxFqMNyDf6RtiRZzt+KVMhzCSn
         mekcCtXC+yPtea09tzs44OS0AacXb1TAVz2ToOGWHPBstvhQPIV2t5eET628vy10sKyi
         e+7YDtd1Hu6tA7ZqBXIufef1D4eLsF1fRVYGLC3tc9vMzI2xdpyySz9cdaclFICRAeSE
         MgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413605; x=1784018405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bqfJGNd9g7OGlSlI8PzSUzFJ0LXg6YA+W5T4gi/HZw=;
        b=gLAL7w6SU0FElHfY6ckK34T8x4HiWB1lvdpUP/iNEbRIOPkrEJ6rKl1TwxaCXpJ+fQ
         HBX5MjFdLmn9J38Fwj5seLd7t5fp6I5hssqoCZ50w2WCC0AFjmupo+5e6ZOgIu1TsVSE
         AjoEnHj+0uhlJKGJ9D43mIkWFWe0TPx/knkeoVwuFRMlzc5Fn2DKr9nRuxpnsEHSujbK
         qY5KlNMhUskoixpec9I/qKxfM/0UjpeLrcxNETKg9wMp+tZsN07gEh0sr4b7w0AVmDKr
         4apeV7zZWPOV6DbJBoTagCpTSrUPu6PjUl2Nd5q0C2NmyKJQVE0X+1OwjBwBaCP4Jeqp
         NFgQ==
X-Gm-Message-State: AOJu0Yy4R7FJYyaEkhtpsBDgg/CoHy+pYt7R+h9ssb3w4CgWp23/fRO5
	AlxRyJe6iZFUO2LUtUC6b5BFmtv3eF5weL+L53ZbTZaqdAU8RtCITX69iakjYnmoTVTw4HOu+QU
	c4BzZzz9b3CVP9MZhUrcgKmt1fhazZ8U=
X-Gm-Gg: AfdE7clZi5hSv82I2gjl7RAsw0yf/2Y3PHgHEGRIAsbZ1g08lydug/XuoCQBPLo0ryX
	ZFM2zpB0d5QGomN6XF0r/8oIYLfF1GqXs4yrEpb4hCC8HuJ/rccWy5MpIHOAQDCQuo059uellx2
	0M6z5lXWCMqd1uCtbu9xoMFottiUFUt6VSzD//xnC73xuXZnCBiZ51KN7cEtPo3m+AU6coqe33e
	Dyk/WQQJ/72NiVJJ2scn+pdS9kFr5EriEWpL1Vn5LwrYtkG9iDbDIjCMXeKXlKDazq3IVaME2oJ
	vorNMl4XYoaARRYVARaV9om4NUU6ZvcFO0EW
X-Received: by 2002:a2e:2ac4:0:b0:39b:3082:cfe4 with SMTP id
 38308e7fff4ca-39c60050411mr7811981fa.38.1783413604509; Tue, 07 Jul 2026
 01:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-tune-a32-v1-0-a43f28b1d7a4@gmail.com>
 <20260701-tune-a32-v1-3-a43f28b1d7a4@gmail.com> <CAPoiz9xUkXsbJN7N4xB7uPaQ3XW-akpmcEB5JY=pBZ7oAddHcw@mail.gmail.com>
In-Reply-To: <CAPoiz9xUkXsbJN7N4xB7uPaQ3XW-akpmcEB5JY=pBZ7oAddHcw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 7 Jul 2026 09:39:53 +0100
X-Gm-Features: AVVi8CcuEYA7LIgw7bCSAoFPe-lIBngBfEStftTHBqSxvYA4-ZyhhdLg92mYXj8
Message-ID: <CAO5Uq5SK=bObAsCOxodCVyuD=KQ8xuGTmYWY8LRALFbrMzRxBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] qemuarmv8a32: add QEMU machine for AArch32 ARMv8-A
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alexk@a-squared-projects.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 08:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240368

On Mon, Jul 6, 2026 at 10:33=E2=80=AFPM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Wed, Jul 1, 2026 at 7:58=E2=80=AFAM Alex Kiernan via lists.openembedde=
d.org
> <alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Add a QEMU machine for exercising an AArch32-only ARMv8-A target
> > (Cortex-A32) under emulation, defaulting to the cortexa32-crypto tune.
> > QEMU has no Cortex-A32 model, so it runs on the 'virt' machine with
> > qemu-system-arm and -cpu max, which provides the ARMv8-A AArch32 featur=
e
> > set including the crypto extensions needed by the crypto tune. The kern=
el
> > is built as a zImage and u-boot uses qemu_arm_defconfig, matching the
> > other 32-bit ARM QEMU machines.
> >
> > Map KMACHINE to qemuarma15 so the existing linux-yocto BSP is reused, a=
nd
> > add qemuarmv8a32 to linux-yocto's COMPATIBLE_MACHINE so a kernel can be
> > built for it.
> >
> > AI-Generated: Claude Code (Claude Opus 4.8)
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
> > ---
> >  meta/conf/machine/qemuarmv8a32.conf           | 36 +++++++++++++++++++=
++++++++
> >  meta/recipes-kernel/linux/linux-yocto_6.18.bb |  2 +-
> >  2 files changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/machine/qemuarmv8a32.conf b/meta/conf/machine/qe=
muarmv8a32.conf
> > new file mode 100644
> > index 000000000000..8e49a56ae720
> > --- /dev/null
> > +++ b/meta/conf/machine/qemuarmv8a32.conf
> > @@ -0,0 +1,36 @@
> > +#@TYPE: Machine
> > +#@NAME: QEMU ARMv8 AArch32 machine on Cortex-A32
> > +#@DESCRIPTION: Machine configuration for running an AArch32 system on =
QEMU
> > +
> > +DEFAULTTUNE =3D "cortexa32-crypto"
> > +
> > +require conf/machine/include/arm/armv8a/tune-cortexa32.inc
> > +require conf/machine/include/qemu.inc
> > +
> > +KERNEL_IMAGETYPE =3D "zImage"
> > +
> > +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> > +UBOOT_MACHINE ?=3D "qemu_arm_defconfig"
> > +
> > +SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
> > +
> > +# For runqemu
> > +QB_SYSTEM_NAME =3D "qemu-system-arm"
> > +QB_MACHINE =3D "-machine virt"
> > +# QEMU doesn't know about Cortex-A32
> > +QB_CPU =3D "-cpu max"
>
> I have concerns that this isn't doing what is expected.  Looking at
> qemu-system-arm -machine virt -cpu
> I'm seeing
> ...
>   cortex-a15
>   cortex-a7
>   cortex-a8
>   cortex-a9
> ...
> and not any of the armv8 cores.  So, I think that you aren't going to
> get any of the ARMv8 features with 'max', despite them possibly being
> in the tune referenced above, which might cause crashes or other
> unintended issues.

Totally agree... this is the part I really wasn't happy with.

> You might be okay on qemu-system-aarch64, given the ARMv8 cores there.
> Maybe you can try emulating the cortex-a35 core and running it in
> 32bit mode
>

At some point I had this working, but I went around it repeatedly and
failed to get it to work again :(

The commented out pieces I have (which I'm 99% sure I had working):

QB_SYSTEM_NAME =3D "qemu-system-aarch64"
QB_CPU =3D "-cpu cortex-a32"
QB_CPU_KVM =3D "-cpu host,aarch64=3Doff -machine gic-version=3D3"

Any pointers on what I might be missing?

> If I'm wrong, please provide a link to the documentation stating that
> max on qemu-system-arm does what you say, because I'm not seeing it on
> https://www.qemu.org/docs/master/system/arm/virt.html
>
> Thanks,
> Jon
>
> > +QB_SMP ?=3D "-smp 4"
> > +QB_CPU_KVM =3D "-cpu host -machine gic-version=3D3"
> > +# For graphics to work we need to define the VGA device as well as the=
 necessary USB devices
> > +QB_GRAPHICS =3D "-device virtio-gpu-pci"
> > +QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kb=
d"
> > +# Virtio Networking support
> > +QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downs=
cript=3Dno"
> > +QB_NETWORK_DEVICE =3D "-device virtio-net-pci,netdev=3Dnet0,mac=3D@MAC=
@"
> > +# Virtio block device
> > +QB_ROOTFS_OPT =3D "-drive id=3Ddisk0,file=3D@ROOTFS@,if=3Dnone,format=
=3Draw -device virtio-blk-pci,drive=3Ddisk0"
> > +# Virtio serial console
> > +QB_SERIAL_OPT =3D "-device virtio-serial-pci -chardev null,id=3Dvirtco=
n -device virtconsole,chardev=3Dvirtcon"
> > +QB_TCPSERIAL_OPT =3D "-device virtio-serial-pci -chardev socket,id=3Dv=
irtcon,port=3D@PORT@,host=3D127.0.0.1,nodelay=3Don -device virtconsole,char=
dev=3Dvirtcon"
> > +
> > +KMACHINE:qemuarmv8a32 =3D "qemuarma15"
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recip=
es-kernel/linux/linux-yocto_6.18.bb
> > index 2b1298dedf9c..a818506bb6f3 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> > @@ -52,7 +52,7 @@ KCONF_BSP_AUDIT_LEVEL =3D "1"
> >
> >  KERNEL_DEVICETREE:qemuarmv5 =3D "arm/versatile-pb.dtb"
> >
> > -COMPATIBLE_MACHINE =3D "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|=
qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloonga=
rch64)$"
> > +COMPATIBLE_MACHINE =3D "^(qemuarm|qemuarmv5|qemuarmv8a32|qemuarm64|qem=
ux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv=
32|qemuloongarch64)$"
> >
> >  # Functionality flags
> >  KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
> >
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#239980): https://lists.openembedded.org/g/openembed=
ded-core/message/239980
> > Mute This Topic: https://lists.openembedded.org/mt/120062731/3616920
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
jdmason@kudzu.us]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Alex Kiernan

