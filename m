Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48B8C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 11:21:50 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.44165.1744024905601761433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 04:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1u1kXv-0002Nk-EZ; Mon, 07 Apr 2025 13:21:43 +0200
Message-ID: <edabd61185beb000ab3f851c47a69b9525254daa.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH] barebox-tools: fix host contamination on
 libyaml
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, Ahmad Fatoum
 <afa@pengutronix.de>,  Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 07 Apr 2025 13:21:42 +0200
In-Reply-To: <CANNYZj_6nTK+y23kjjyDgzXgfxwim8ppSoRNC5mPPnRPg9+myg@mail.gmail.com>
References: <20250407080931.3926302-1-hongxu.jia@windriver.com>
	 <CANNYZj_6nTK+y23kjjyDgzXgfxwim8ppSoRNC5mPPnRPg9+myg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 11:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214451

Am Montag, dem 07.04.2025 um 12:27 +0200 schrieb Alexander Kanavin:
> On Mon, 7 Apr 2025 at 10:09, hongxu via lists.openembedded.org
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
> > +Subject: [PATCH] fix host contamination on libyaml
> > +
> > +The barebox-tools uses host gcc to build dtc tools, and test the exist=
ence
> > +of /usr/include/yaml.h to build with/without libyaml
> > +
> > +It caused host contamination if /usr/include/yaml.h existed on host.
> > +| tmp/work/core2-64-wrs-linux/barebox-tools/2025.02.0/barebox-2025.02.=
0/scripts/
> > +dtc/yamltree.c:9:10: fatal error: yaml.h: No such file or directory
> > +|=C2=A0=C2=A0=C2=A0=C2=A0 9 | #include <yaml.h>
> > +
> > +Explicitly define NO_YAML =3D 1 to disable libyaml for host dtc
> > +
> > +Upstream-Status: Inappropriate [Yocto specific]

I had a quick chat with the maintainers. Since barebox actually doesn't do =
any dtb binding checks at
the moment, it would be fine to just hard-code the -DNO_YAML (and omit the =
check).

(If that should be needed later one can use .dtb files directly without the=
 dts->yaml conversion,
just like the kernel does: https://github.com/torvalds/linux/commit/ef8795f=
3f1ce )

> Please report this to upstream, rather than just make a new patch and
> mark it Inappropriate without engaging. We have barebox maintainer
> present and active right here, actually.

Thank you Alex for CC'ing me!

Regards, Enrico

> Alex
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

