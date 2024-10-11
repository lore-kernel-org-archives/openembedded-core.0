Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F95CFD34A
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 11:08:59 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web10.9007.1728644931238907476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 04:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rpsys.net header.s=default header.b=WUWZ2st3;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1728644928; bh=mSOX2sfEJ3EUFUUuzkG29EV/btC4628YDWqgIXdDcvc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WUWZ2st3Kh1gplbqnpGjbqrnK8Kgi/iChVi8jlDnMJUzTls8Ia/pXO9oX2BDEy9ew
	 jLwncx6jUl+p1ExHDtmcrTIK8vHPZy9XJUTLylgedIFCvccLMS0gotgXSp2j6v59kM
	 KmxCyDLuKkdrg+JkM9ysshZKF0tRbIgMKO+Fptb8KTROIz+w2xasEfcdAf0SVj44kO
	 4HPpCr3kNgrnJnM9TRZCxGLYpeTBZpmGBdXkJkFOq21A9bxJDwDMW+OsR/IAasZEFs
	 ZnbsL8Aoaf1riK/3xZi8NLHCfHtMTEk7HaNdSerK96L3FG4MfD5mYiFePsc+kVwvjX
	 Ak5l0/58YBl7w==
Received: from [192.168.1.7] (dan.rpsys.net [217.169.23.61] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id 49BB8kFp1518973
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 12:08:48 +0100
Message-ID: <19b70153a2a149301464b725a75ee3a9fbb66abc.camel@rpsys.net>
Subject: Re: [OE-core] [PATCH v6 3/7] barebox: set default BAREBOX_CONFIG
 for qemu machines
From: Richard Purdie <rpurdie@rpsys.net>
To: ejo@pengutronix.de, openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Oct 2024 12:08:41 +0100
In-Reply-To: <20240912091857.2631678-4-ejo@pengutronix.de>
References: <20240912091857.2631678-1-ejo@pengutronix.de>
	 <20240912091857.2631678-4-ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.11 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 11:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205670

On Thu, 2024-09-12 at 11:18 +0200, Enrico J=C3=B6rns via lists.openembedded=
.org wrote:
> From: Enrico Jorns <ejo@pengutronix.de>
>=20
> These are set in the barebox recipe rather in the corresponding machines
> (where they would belong otherwise) to keep the impact of barebox to
> oe-core minimal for now.
>=20
> "multi_v7_defconfig" is used for qemuarm since this is the default
> barebox armv7 config that just enables all supported platforms.
>=20
> "multi_v8_defconfig" is used for qemuarm64 sine this is the default
> barebox armv8 config that just enables all supported platforms.
>=20
> "efi_defconfig" is used for qemux86-64 which is the primary platform
> where barebox will not be the first stage bootloader but an EFI payload.
>=20
> Since these changes make barebox a provider for virtual/bootloader,
> explicitly default to u-boot in the corresponding MACHINE configs to not
> unnecessarily surprise users.
>=20
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> ---
> =C2=A0meta/conf/machine/qemuarm.conf=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0meta/conf/machine/qemuarm64.conf=C2=A0 | 1 +
> =C2=A0meta/conf/machine/qemux86-64.conf | 1 +
> =C2=A03 files changed, 3 insertions(+)

This patch needs the commit message updating as it no longer matches
the changes below!

Things did pass in automated testing so I think we're close with this.

Cheers,

Richard

> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.c=
onf
> index 943ce7c16a..af76a53b8e 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -7,6 +7,7 @@ require conf/machine/include/qemu.inc
> =C2=A0
> =C2=A0KERNEL_IMAGETYPE =3D "zImage"
> =C2=A0
> +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> =C2=A0UBOOT_MACHINE ?=3D "qemu_arm_defconfig"
> =C2=A0
> =C2=A0SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm=
64.conf
> index a096d964db..d310445a34 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -7,6 +7,7 @@ require conf/machine/include/qemu.inc
> =C2=A0
> =C2=A0KERNEL_IMAGETYPE =3D "Image"
> =C2=A0
> +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> =C2=A0UBOOT_MACHINE ?=3D "qemu_arm64_defconfig"
> =C2=A0
> =C2=A0SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux8=
6-64.conf
> index 14873a3b4f..4a9c6d364b 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -13,6 +13,7 @@ DEFAULTTUNE ?=3D "core2-64"
> =C2=A0require conf/machine/include/x86/tune-x86-64-v3.inc
> =C2=A0require conf/machine/include/x86/qemuboot-x86.inc
> =C2=A0
> +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> =C2=A0UBOOT_MACHINE ?=3D "qemu-x86_64_defconfig"
> =C2=A0
> =C2=A0KERNEL_IMAGETYPE =3D "bzImage"
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204432): https://lists.openembedded.org/g/openembedde=
d-core/message/204432
> Mute This Topic: https://lists.openembedded.org/mt/108410146/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=C2=
=A0[richard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


