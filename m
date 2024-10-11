Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA77CFD352
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 11:22:59 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.9220.1728645776324633054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1szDjS-0000iY-5F; Fri, 11 Oct 2024 13:22:54 +0200
Message-ID: <163fa25b979e93b006e9aac99d64c17d903707e1.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v6 3/7] barebox: set default BAREBOX_CONFIG
 for qemu machines
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Oct 2024 13:22:53 +0200
In-Reply-To: <e5673b2af275dd6bddde40223581c3cdbb310968.camel@linuxfoundation.org>
References: <20240912091857.2631678-1-ejo@pengutronix.de>
	 <20240912091857.2631678-4-ejo@pengutronix.de>
	 <e5673b2af275dd6bddde40223581c3cdbb310968.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 11:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205674

Am Freitag, dem 11.10.2024 um 12:08 +0100 schrieb Richard Purdie:
> On Thu, 2024-09-12 at 11:18 +0200, Enrico J=C3=B6rns via lists.openembedd=
ed.org wrote:
> > From: Enrico Jorns <ejo@pengutronix.de>
> >=20
> > These are set in the barebox recipe rather in the corresponding machine=
s
> > (where they would belong otherwise) to keep the impact of barebox to
> > oe-core minimal for now.
> >=20
> > "multi_v7_defconfig" is used for qemuarm since this is the default
> > barebox armv7 config that just enables all supported platforms.
> >=20
> > "multi_v8_defconfig" is used for qemuarm64 sine this is the default
> > barebox armv8 config that just enables all supported platforms.
> >=20
> > "efi_defconfig" is used for qemux86-64 which is the primary platform
> > where barebox will not be the first stage bootloader but an EFI payload=
.
> >=20
> > Since these changes make barebox a provider for virtual/bootloader,
> > explicitly default to u-boot in the corresponding MACHINE configs to no=
t
> > unnecessarily surprise users.
> >=20
> > Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/conf/machine/qemuarm.conf=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A0meta/conf/machine/qemuarm64.conf=C2=A0 | 1 +
> > =C2=A0meta/conf/machine/qemux86-64.conf | 1 +
> > =C2=A03 files changed, 3 insertions(+)
>=20
> This patch needs the commit message updating as it no longer matches
> the changes below!

Indeed. This hunk accidentally moved to "barebox: add initial support"
when merging the .inc and the .bb file.
I'd simply restore the original split so that the commit messages matches
again and we preserve the explicit explanation of defconfigs that Alex
requested.

> Things did pass in automated testing so I think we're close with this.

This sounds really, really great!


Thanks a lot for your effort!

Regards, Enrico

> Cheers,
>=20
> Richard
>=20
> > diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm=
.conf
> > index 943ce7c16a..af76a53b8e 100644
> > --- a/meta/conf/machine/qemuarm.conf
> > +++ b/meta/conf/machine/qemuarm.conf
> > @@ -7,6 +7,7 @@ require conf/machine/include/qemu.inc
> > =C2=A0
> > =C2=A0KERNEL_IMAGETYPE =3D "zImage"
> > =C2=A0
> > +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> > =C2=A0UBOOT_MACHINE ?=3D "qemu_arm_defconfig"
> > =C2=A0
> > =C2=A0SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
> > diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemua=
rm64.conf
> > index a096d964db..d310445a34 100644
> > --- a/meta/conf/machine/qemuarm64.conf
> > +++ b/meta/conf/machine/qemuarm64.conf
> > @@ -7,6 +7,7 @@ require conf/machine/include/qemu.inc
> > =C2=A0
> > =C2=A0KERNEL_IMAGETYPE =3D "Image"
> > =C2=A0
> > +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> > =C2=A0UBOOT_MACHINE ?=3D "qemu_arm64_defconfig"
> > =C2=A0
> > =C2=A0SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
> > diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemu=
x86-64.conf
> > index 14873a3b4f..4a9c6d364b 100644
> > --- a/meta/conf/machine/qemux86-64.conf
> > +++ b/meta/conf/machine/qemux86-64.conf
> > @@ -13,6 +13,7 @@ DEFAULTTUNE ?=3D "core2-64"
> > =C2=A0require conf/machine/include/x86/tune-x86-64-v3.inc
> > =C2=A0require conf/machine/include/x86/qemuboot-x86.inc
> > =C2=A0
> > +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> > =C2=A0UBOOT_MACHINE ?=3D "qemu-x86_64_defconfig"
> > =C2=A0
> > =C2=A0KERNEL_IMAGETYPE =3D "bzImage"
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#204432): https://lists.openembedded.org/g/openembed=
ded-core/message/204432
> > Mute This Topic: https://lists.openembedded.org/mt/108410146/1686473
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[richard.=
purdie@linuxfoundation.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

