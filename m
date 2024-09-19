Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1750CE8D68
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 09:47:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.15626.1726739267016526797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 02:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1srDlJ-0000j8-0h; Thu, 19 Sep 2024 11:47:45 +0200
Message-ID: <18772a64adbbe183912d25388f8979ab0f26965d.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v6 0/7] Add barebox bootloader support (and
 testing)
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Sep 2024 11:47:44 +0200
In-Reply-To: <d86507587d62b184c1b111cd64519bae6dd375bb.camel@linuxfoundation.org>
References: <20240912091857.2631678-1-ejo@pengutronix.de>
	 <fe63f607a4f3f521e51c6ff2724bbd537977a5b1.camel@linuxfoundation.org>
	 <b7e336daaa8aeeec62bf43da2ce4abccea3e15cd.camel@pengutronix.de>
	 <1729b516f6afc04a83158f59f473a668860137b4.camel@linuxfoundation.org>
	 <fd3fff67a52a117485497a3e4ca6f098c298dfc3.camel@pengutronix.de>
	 <d86507587d62b184c1b111cd64519bae6dd375bb.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 09:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204661

Am Mittwoch, dem 18.09.2024 um 22:37 +0100 schrieb Richard Purdie:
> On Wed, 2024-09-18 at 13:45 +0200, Enrico J=C3=B6rns wrote:
> > Am Mittwoch, dem 18.09.2024 um 12:21 +0100 schrieb Richard Purdie:
> > > On Wed, 2024-09-18 at 12:39 +0200, Enrico J=C3=B6rns wrote:
> > > > Hi Richard,
> > > >=20
> > > > Am Mittwoch, dem 18.09.2024 um 11:11 +0100 schrieb Richard
> > > > Purdie:
> > > > > On Thu, 2024-09-12 at 11:18 +0200, Enrico J=C3=B6rns via
> > > > > lists.openembedded.org wrote:
> > > > > > This adds support for the barebox bootloader (and tools) to
> > > > > > oe-
> > > > > > core.
> > > > > >=20
> > > > > > In order to have proper testing, this extends oe-selftest to
> > > > > > allow
> > > > > > basic testing of bootloaders. While at it, cover both u-boot
> > > > > > and
> > > > > > barebox.
> > > > > >=20
> > > > > > v6:
> > > > > > * replace barebox.inc by barebox.bbclass (move content of
> > > > > > =C2=A0 barebox-common.inc into .bbclass and .bb files)
> > > > > > * support for UNPACKDIR
> > > > > >=20
> > > > > > Enrico Jorns (5):
> > > > > > =C2=A0 barebox: set default BAREBOX_CONFIG for qemu machines
> > > > > > =C2=A0 oeqa/utils/qemurunner: support ignoring vt100 escape
> > > > > > sequences
> > > > > > =C2=A0 oeqa: support passing custom boot patterns to runqemu
> > > > > > =C2=A0 oeqa/selftest/cases: add basic u-boot test
> > > > > > =C2=A0 oeqa/selftest/cases: add basic barebox tests
> > > > > >=20
> > > > > > Marco Felsch (2):
> > > > > > =C2=A0 barebox: add initial support
> > > > > > =C2=A0 barebox-tools: add initial barebox tools support
> > > > >=20
> > > > > We had some testing capacity so I ran this through automated
> > > > > testing.
> > > > > The one issue that showed up so far was:
> > > > >=20
> > > > > https://valkyrie.yoctoproject.org/#/builders/29/builds/174/steps/=
13/logs/warnings
> > > > >=20
> > > > > which is at least easily fixed! The rest of the build is still
> > > > > going.
> > > >=20
> > > > thanks for the test run and the first result.
> > > >=20
> > > > Indeed, looks easily fixable =F0=9F=98=89
> > > > Is it worth a v7 or should I wait for other results to show up?
> > >=20
> > > Most of the tests have run and there were other issues in the build
> > > but
> > > there was one other issue I noticed:
> > >=20
> > > https://valkyrie.yoctoproject.org/#/builders/54/builds/149/steps/14/l=
ogs/stdio
> > >=20
> > > which is a missing maintainers entry. Probably worth a v7 with
> > > those
> > > two things fixed.
> >=20
> > The test output says
> >=20
> > > Unable to find recipes for the following entries in
> > > maintainers.inc:
> > > barebox
> >=20
> > Could you give me a hint what that means? The barebox_2024.08.0.bb
> > and the change in maintainers.inc
> > are in the same commit. So I am unsure why it does not find the
> > recipe.
>=20
> It means the recipe is being skipped in the context of the QA test.
> This means there is a maintainers entry but the test can't see any
> recipe to match against it due to the skip.

Thanks. I was not sure if the recipes are just evaluated and skipped based =
on normal bitbake parsing
or if there is a special mechanism that just looks for .bb files.

> The test is there to ensure when we delete recipes, we don't have stale
> entries in the file.
>=20
> Can we provide a config that makes sense for qemux86-64?

The reason it is skipped from default parsing is

  PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"

I put in meta/conf/machine/qemux86-64.conf since we have two competing prov=
iders of
virtaul/bootloader now (and that's what the mechanism is actually made for =
I guess =F0=9F=98=89).

Not sure if there is a way to remove the provider for just that check?

Or should I add it to the exception list in distrodata.py like its done for=
 similar other recipes
that have competing providers (e.g. musl, newlib for virtual/libc; linux-yo=
cto, linux-dummy for
virtual/kernel)?.

Regards, Enrico

> Cheers,
>=20
> Richard
>=20
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

