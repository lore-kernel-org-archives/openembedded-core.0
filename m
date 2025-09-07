Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE0ACA1017
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 14:02:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.19261.1757253731445434693
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 07:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=srWO2jxs;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4CDCF4E40C48;
	Sun,  7 Sep 2025 14:02:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0ED726061A;
	Sun,  7 Sep 2025 14:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD7D2102F1C7E;
	Sun,  7 Sep 2025 16:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757253727; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mm5PDvdFPycfFaBR6TJaJpUz4K6I6/GnXRYYAnQFR+0=;
	b=srWO2jxsqlfHAETN5TJ6iKKMOWXVg5XOJ88zB8ATFYcS/SEBoXc7UtKArlIbh+xIHwmAPc
	OSix1yqKCNZSC8M3E2qB6Z7bOs6r3ksVMuoog/3nOplEsVJ0ZkD1pFTHZy0y1zXsUB8v+L
	1mA8LbGn1x37a0G9oFSglMWfxiT85LfEEFMqL5E/xJtZU6hUyPJ2K8R+fPcD3y2PFc08Oo
	SERpkgVLTJwJYt16ACacYOQpGsJwY0o7HsaA9/2yLeEPQBAcFfnvJQhWJj5fzOi1g6pOHF
	/z6Yn2DLZXzBglvKSfn0LAITlv+MMFg2DGnufy6baHIQNxY9Eup+8DGaBpiX1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Sep 2025 16:02:02 +0200
Message-Id: <DCMMGFDTYJD0.3EMQPQ884OGL2@bootlin.com>
To: "Vincent Davis Jr" <vince@underview.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3 1/8] bootimg_pcbios: support grub hybrid
 boot
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250905164136.2896809-1-vince@underview.tech>
In-Reply-To: <20250905164136.2896809-1-vince@underview.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 14:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223052

On Fri Sep 5, 2025 at 6:41 PM CEST, Vincent Davis Jr wrote:
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

We still have the same failure as on v2. Still happening with selftests
running on debian host, so there might be something related to the host
configuration.

ERROR: Qemu log output from /srv/pokybuild/yocto-worker/oe-selftest-debian/=
build/build-st-2287526/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.=
0/testimage/qemu_boot_log.20250907083922:
SeaBIOS (version rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org)
...
iPXE (http://ipxe.org) 00:02.0 CA00 PCI2.10 PnP PMM+0EFC6560+0EF26560 CA00
Press Ctrl-B to configure iPXE (PCI 00:02.0)...
...
Booting from Hard Disk..
2025-09-07 08:56:24,256 - oe-selftest - INFO - 9: 79/94 577/639 (1085.73s) =
(0 failed) (wic.Wic2.test_grub_install_biosplusefi_qemu)
2025-09-07 08:56:24,265 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
utils/commands.py", line 390, in runqemu
    qemu.start(params=3Dqemuparams, ssh=3Dssh, runqemuparams=3Drunqemuparam=
s, launch_cmd=3Dlaunch_cmd, discard_writes=3Ddiscard_writes)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
targetcontrol.py", line 179, in start
    raise RuntimeError("%s - FAILED to start qemu - check the task log and =
the boot log" % self.pn)
RuntimeError: core-image-minimal - FAILED to start qemu - check the task lo=
g and the boot log

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2280

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


