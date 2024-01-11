Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C3AC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 07:59:29 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.6945.1704959966961706735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 23:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=xZrv5VCB;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=To:Date:Message-Id:Subject:Mime-Version:
	Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=YgAYurwUe+/OjslK/Yf7S1yb/29Q058Duo6GFMVqpKA=; b=xZrv5VCBl2I23HbOLkE4rhDmwk
	CmHy2cSCn0i3AEPXDhujHc92hXn4CPUcesg9tucZbLA6oqSlRdThRxqJBC1s7cA9vpM/ECbjpF+BF
	wnZTYhdK2LuiLjm8UPyC84sV4O5b56A6jPoCOiYYgSN07SXyz2mH80PAOhohjF2llHcuDQrvCuOff
	7JAbhkctDnIO9ymHekeXrRJ/2TUFGF/5tOg9Sz+FMgDaHzCT/vcdmpFXY7MqDx3BTntATc6y026N5
	VEJJUGQnTFEaIxEt1zR3KMA6vrbiZCfylbW4YR64NU14ODCzIlmloDJhlKm8WhSh/fWc2DkTPfgSe
	p3RKQIZQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1rNpyF-000KdN-Uu; Thu, 11 Jan 2024 08:59:24 +0100
Received: from [185.17.218.86] (helo=smtpclient.apple)
	by sslproxy02.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1rNpyF-000P7a-QX; Thu, 11 Jan 2024 08:59:23 +0100
From: Sean Nyekjaer <sean@geanix.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: [OE-core] runqemu: ahci option
Message-Id: <06A8365A-FC0D-43FC-A3A3-D3BC54B1E72B@geanix.com>
Date: Thu, 11 Jan 2024 08:59:12 +0100
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 martin.jansa@gmail.com,
 alex.kanavin@gmail.com
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27150/Wed Jan 10 10:40:48 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 07:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193534

Hi,

We have an x86_64 machine that we create an wic image for.
For bootloader we are using UEFI boot with u-boot as a EFI payload.

U-boot doesn=E2=80=99t have support for virtio-scsi-pci, so it=E2=80=99s =
can=E2=80=99t detect a disk.
U-boot however does some tests with the ahci driver:
=
https://source.denx.de/u-boot/u-boot/-/blob/master/scripts/build-efi.sh#L1=
16
It also works for our case.

But since the runqemu script checks for drivetype by =E2=80=9C/dev/sd=E2=80=
=9D I can=E2=80=99t easily add something like what u-boot uses.

Any idea=E2=80=99s?

For now I use in machine conf:
QB_DEFAULT_FSTYPE =3D "wic"
QB_ROOTFS =3D "none"
QB_OPT_APPEND =3D "-drive =
id=3Ddisk,file=3D@DEPLOY_DIR_IMAGE@/image-qemux86-64.rootfs.wic,if=3Dnone,=
format=3Draw -device ahci,id=3Dahci -device =
ide-hd,drive=3Ddisk,bus=3Dahci.0=E2=80=9D

But it would be nice to have the ROOTFS env var expanded instead of =
declaring it explicitly here.

Best regards
Sean Nyekj=C3=A6r=

