Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DC2CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 05:56:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.32581.1756965405950700600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 22:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CKC41Q2d;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0A3364E40C66
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Sep 2025 05:56:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4F3C606C4;
	Thu,  4 Sep 2025 05:56:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6669A1C22DD13;
	Thu,  4 Sep 2025 07:56:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756965403; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t7pKHWvu+F0QcNEWtospcMksfP/AOpKgi8TgZlgr+Cs=;
	b=CKC41Q2dWI4uVnNYpA3BoDytbDLgAEZzFoXx5rE+Xg3by4rid0SF0I3RyVBjK4wWfUUgLh
	G4xe+UWWmaSXqJft5kS0Throhp7iC/QNdAV+GoyGi+wddCzirKjkQ/axZwHQXViovlzOlj
	+K3Hcpq+lGKHm0KGrdQTim3S2P+jSV0/k678KvoKsSyphWeGtXxs38JjpJQ4EMTkFHkv2I
	R48hKVANCMjE5qqKFaXR0EzBmpzO1Tl7nud+leNG3Jg4mQ13Xvcp7MSjTZ1BmKm4xiePHe
	VB+M4rMz0jOHmv+OpXgmKasF3GwUUFEMlCVhQsS5h+lVkBl8NtfKnWXATr6K3A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 07:56:38 +0200
Message-Id: <DCJS959WAB1Q.3S6VHMKD12CQ5@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Vincent Davis Jr" <vince@underview.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/7] bootimg_pcbios: support grub hybrid boot
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250902015825.2785789-1-vince@underview.tech>
In-Reply-To: <20250902015825.2785789-1-vince@underview.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 05:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222902

On Tue Sep 2, 2025 at 3:58 AM CEST, Vincent Davis Jr wrote:
> If caller wants to primarily leverage
> grub as the primary boot loader current
> oe-core doesn't support booting grub when
> the boot firmware is legacy BIOS based and
> the partition table format is GPT based.
>
> Issue GPT header reside where core.img
> should be located (at byte 512).
>
> To navigate around issue core.img was
> moved to a seperate partition.
>
> If disk is a GPT disk caller must specify
> the file system type as none and set the
> partition type as BIOS boot. No filesystem
> will be created on partition. This also
> allows wic plugin to know where to dd
> core.img.
>
> Unfortunately No deep dive into grub-install
> was perform to know the exact bytes changed
> in hybrid boot case. To see the change in
> bytes generated boot.img + core.img was compared
> to boot.img + core.img after grub-install was
> executed using the xxd command.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---

Hi Vincent,

It looks like this tends to fail some selftest. Autobuilder logs are not
really verbose here, but I can relaunch a build and extract more log
files if you now were you want to look.

runqemu - INFO - Running /srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/build-st-2799227/tmp/work/x86_64-linux/qemu-helper-native/1.0/recipe-sys=
root-native/usr/bin/qemu-system-x86_64 -device virtio-net-pci,netdev=3Dnet0=
,mac=3D52:54:00:12:34:02 -netdev tap,id=3Dnet0,ifname=3Dtap0,script=3Dno,do=
wnscript=3Dno -object rng-random,filename=3D/dev/urandom,id=3Drng0 -device =
virtio-rng-pci,rng=3Drng0 -drive if=3Dnone,id=3Dhd,file=3D/home/pokybuild/t=
mp/core-image-minimal-qemux86-64.rootfs.wic.510160,format=3Draw -device vir=
tio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd -usb -device usb-tablet -=
usb -device usb-kbd   -cpu Skylake-Client -machine q35,i8042=3Doff -smp 4 -=
enable-kvm -m 256 -serial tcp:127.0.0.1:42697,nodelay=3Don -serial tcp:127.=
0.0.1:54201,nodelay=3Don  -pidfile /srv/pokybuild/yocto-worker/oe-selftest-=
debian/build/build-st-2799227/pidfile_2799227  -S -qmp unix:./.6pnxdkdq,ser=
ver,wait -qmp unix:./.p0gm_1m0,server,nowait -nographic
...
Target didn't reach login banner in 1000 seconds (09/02/25 18:40:59)
Last 25 lines of all logging (308):
c[?7l[2J[0mSeaBIOS (version rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org)


iPXE (http://ipxe.org) 00:02.0 CA00 PCI2.10 PnP PMM+0EFC6560+0EF26560 CA00
Press Ctrl-B to configure iPXE (PCI 00:02.0)...



Booting from Hard Disk..
...
RuntimeError: core-image-minimal - FAILED to start qemu - check the task lo=
g and the boot log
...
2025-09-03 00:41:04,380 - oe-selftest - INFO - ERROR: wic.Wic2.test_grub_in=
stall_biosplusefi_qemu (subunit.RemotedTestCase)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2256

Can you have a look at the issue please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


