Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3F3CCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 09:29:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.28042.1761557334108161100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 02:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VkRCEZ+U;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BED47C0CDF9;
	Mon, 27 Oct 2025 09:28:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7EAD6062C;
	Mon, 27 Oct 2025 09:28:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE7B4102F24E3;
	Mon, 27 Oct 2025 10:28:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761557331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uNRUaypTJ2J64RcMzECK0qFFh0Lujl+4AAFlRabGeI0=;
	b=VkRCEZ+UFZz40eqhZHBkLey5M5Wm/n9ILkcyvWLcEZGeX0Y3588A1XH7OGcXD4N3oBIqxr
	SwF0B6K2L/bPZP5BaHK+7X47lasobtzx9y+il8FNsJ3NOGOXpA9itOAJbmNpJHT6SR3SJp
	3F0q+au212aI4ciP+7zn2wEHGwNWc5hGM0XJEwuZYc0IabmgiqEHltWSqLiJtn4nLKwKeY
	7iPQ1fZ9TnEKoXE19taxCt/kHqgFx14WdEnywXruP4JXBCVFs+2yiK4y18bS6n1WLHRxlp
	NCh6iwr2ssiw/oqIuwYEnBtWrIaZTghuDDFawAwyGFABYZKhwHShSFizjhPdQw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 10:28:44 +0100
Message-Id: <DDSZYF5TWBO9.2Z5Y4SR4SE5D8@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] linux-yocto: introduce 6.17 reference
 kernels
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1761360245.git.bruce.ashfield@gmail.com>
 <65b6f4cb57e6738e48560539cf2c0485e0469b65.1761360245.git.bruce.ashfield@gmail.com>
In-Reply-To: <65b6f4cb57e6738e48560539cf2c0485e0469b65.1761360245.git.bruce.ashfield@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 09:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225326

On Sat Oct 25, 2025 at 4:48 AM CEST, Bruce Ashfield via lists.openembedded.=
org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> The 6.17 kernel went through quite a bit of testing via
> linux-yocto-dev, so it is a relatively well understood release.
>
> These recipes introduce it as a fully tested reference with the
> potential to replace the EOL 6.16 refs.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---

Hi Bruce,

Thanks for your patch. It looks like we do have some issue with qemu
images failing to boot on ARM:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm-oecore/build/layers/openembedde=
d-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm-oecore/build/layers/openembedde=
d-core/meta/lib/oeqa/runtime/cases/parselogs.py", line 185, in test_parselo=
gs
    self.assertEqual(errcount, 0, msg=3Dself.msg)
AssertionError: 2 !=3D 0 : Log: /srv/pokybuild/yocto-worker/qemuarm-oecore/=
build/build/tmp/work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0/target_lo=
gs/dmesg
-----------------------
Central error: [    2.782604] check access for rdinit=3D/init failed: -2, i=
gnoring
***********************
[    2.708951] Key type fscrypt-provisioning registered
[    2.716922] Btrfs loaded, zoned=3Dno, fsverity=3Dno
[    2.719780] Key type encrypted registered
[    2.722461] netconsole: network logging started
[    2.763480] IP-Config: Complete:
[    2.764617]      device=3Deth0, hwaddr=3D52:54:00:12:34:02, ipaddr=3D192=
.168.7.2, mask=3D255.255.255.0, gw=3D192.168.7.1
[    2.767176]      host=3D192.168.7.2, domain=3D, nis-domain=3D(none)
[    2.768653]      bootserver=3D255.255.255.255, rootserver=3D255.255.255.=
255, rootpath=3D
[    2.768746]      nameserver0=3D8.8.8.8
[    2.773746] clk: Disabling unused clocks
[    2.782604] check access for rdinit=3D/init failed: -2, ignoring
[    2.784414] md: Waiting for all devices to be available before autodetec=
t
[    2.786070] md: If you don't use raid, use raid=3Dnoautodetect
[    2.787605] md: Autodetecting RAID arrays.
[    2.788689] md: autorun ...
[    2.788965] md: ... autorun DONE.
[    2.863628] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    2.881074] EXT4-fs (vda): mounted filesystem 49485ab8-9460-46e8-bf1c-42=
3f2c03e0bb r/w with ordered data mode. Quota mode: disabled.
[    2.887371] VFS: Mounted root (ext4 filesystem) on device 253:0.
[    2.892345] devtmpfs: mounted
[    3.045885] input: QEMU QEMU USB Tablet as /devices/platform/3f000000.pc=
ie/pci0000:00/0000:00:02.0/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input=
0

https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2629

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


