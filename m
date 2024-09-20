Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22878C78822
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 10:37:29 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.14949.1726828644703862718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 03:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1srb0s-0004n6-FP; Fri, 20 Sep 2024 12:37:22 +0200
Message-ID: <ee536d88a5b6468b20e37f3daabe4aa63047d1ad.camel@pengutronix.de>
Subject: Re: [PATCH v7 0/7] Add barebox bootloader support (and testing)
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Sep 2024 12:37:21 +0200
In-Reply-To: <b77f2c6737c330ef9ecce325d50a4aaa25b3e536.camel@linuxfoundation.org>
References: <20240919120640.19714-1-ejo@pengutronix.de>
	 <b77f2c6737c330ef9ecce325d50a4aaa25b3e536.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 10:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204735

Am Donnerstag, dem 19.09.2024 um 21:56 +0100 schrieb Richard Purdie:
> On Thu, 2024-09-19 at 14:06 +0200, Enrico J=C3=B6rns wrote:
> > This adds support for the barebox bootloader (and tools) to oe-core.
> >=20
> > In order to have proper testing, this extends oe-selftest to allow
> > basic testing of bootloaders. While at it, cover both u-boot and
> > barebox.
> >=20
> > v7:
> > * add missing HOMEPAGE to barebox recipe
> > * ignore barebox for maintainers check since the recipe is skipped
> > =C2=A0 during parsing (because of PREFERRED_PROVIDER mechanism).
> >=20
> > Enrico Jorns (5):
> > =C2=A0 barebox: set default BAREBOX_CONFIG for qemu machines
> > =C2=A0 oeqa/utils/qemurunner: support ignoring vt100 escape sequences
> > =C2=A0 oeqa: support passing custom boot patterns to runqemu
> > =C2=A0 oeqa/selftest/cases: add basic u-boot test
> > =C2=A0 oeqa/selftest/cases: add basic barebox tests
> >=20
> > Marco Felsch (2):
> > =C2=A0 barebox: add initial support
> > =C2=A0 barebox-tools: add initial barebox tools support
>=20
> This looked better in testing, thanks. There was:
>=20
> https://valkyrie.yoctoproject.org/#/builders/23/builds/168/steps/14/logs/=
stdio
>=20
> which is from oe-selftest on an ARM server though :/

Thank you for the test log!

I'll try to figure out why it works in my test setup but doesn't in the aut=
obuilder..
Not sure if I'll have the chance to reproduce it on an ARM host.

Barebox doesn't seem to boot at all (or output is missing) and U-Boot got s=
tuck.


U-Boot log in the failed test says

> U-Boot 2024.07 (Jul 01 2024 - 18:07:18 +0000)
> DRAM:  256 MiB
> Core:  51 devices, 14 uclasses, devicetree: board
> Flash: 64 MiB
> Loading Environment from Flash... *** Warning - bad CRC, using default en=
vironment
> In:    serial,usbkbd
> Out:   serial,vidconsole
> Err:   serial,vidconsole
> Bus xhci_pci: Register 8001040 NbrPorts 8
> Starting the controller

While my successful run goes further:

> [...]
> Starting the controller
> USB XHCI 1.00
> scanning bus xhci_pci for devices... 3 USB Device(s) found
> Net:   eth0: virtio-net#32
> ESC[?25h
> Hit any key to stop autoboot:  2

But not sure if this is an issue with USB emulation or something else...


Regards, Enrico


> Cheers,
>=20
> Richard
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

