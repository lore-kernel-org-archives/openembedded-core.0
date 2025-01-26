Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF81EC0218D
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 20:30:25 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.37272.1737923419126605558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 12:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tc9Gq-0003Jv-Oz; Sun, 26 Jan 2025 21:30:16 +0100
Message-ID: <0653df9c29975d272096a6eb5ced3f724de50942.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH] busybox: drop net-tools from defconfig
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Andrej Valek <andrej.v@skyrain.eu>
Date: Sun, 26 Jan 2025 21:30:14 +0100
In-Reply-To: <f62ca5e64bb174608d33f2f88c45da1c70830c93.camel@linuxfoundation.org>
References: <20250126115104.1148761-1-ejo@pengutronix.de>
	 <f62ca5e64bb174608d33f2f88c45da1c70830c93.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 20:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210293

Hi Richard,

Am Sonntag, dem 26.01.2025 um 12:58 +0000 schrieb Richard Purdie:
> On Sun, 2025-01-26 at 12:51 +0100, Enrico J=C3=B6rns via
> lists.openembedded.org wrote:
> > The 'net-tools' have been deprecated 15 years ago! [1]
> > Let's remove their busybox pendants from the defconfig to prevent
> > people
> > from accidentally starting projects with ancient technology.
> >=20
> > [1] https://lists.debian.org/debian-devel/2009/03/msg00780.html
> >=20
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/recipes-core/busybox/busybox/defconfig | 10 +++++-----
> > =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>=20
> I did a quick grep of OE-Core and we still have a handful of sites
> using this on target, particularly but not limited to our QA, the ones
> that caught my eye:

thank you for looking into this!

Well, not that I hadn't done a grep before. =F0=9F=98=89
I looked through the occurrences of 'ifconfig' but concluded that starting =
with disabling it for
busybox could be an initial step that should not break most setups. But not=
 sure if I was too
optimistic..

I started working on a few patches to address occurrences of ifconfig, but =
I ran into challenges
with testing my changes. I decided to send this patch on its own, hoping it=
 doesn=E2=80=99t break the
autobuilder, and also to check if there are any objections to removing net-=
tools in general.


I've now had a second look to see what could be affected by the busybox con=
fig change.

> meta/recipes-core/udev/udev-extraconf/network.sh:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0ifconfig | grep -q "^$INTERFACE" || ifup $INTERFACE

Wasn't sure about this one but it seems to be used by the initramfs framewo=
rk and thus probably with
busybox.

-> Probably affected. Might make sense to replace it with ip anyway.

> meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.=
txt:=C2=A0=C2=A0=C2=A0 $ ifconfig
> meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.=
txt:=C2=A0=C2=A0=C2=A0 $ ifconfig

Documentation that hasn't been touched since 2016.
Also, the commands mentioned there are for the host machine commands.

-> Unrelated. ifconfig could be easily removed here, though.

> meta/recipes-core/busybox/files/simple.script:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /SBIN_DIR/ifconfig $interface 0.0.0.0
> meta/recipes-core/busybox/files/simple.script:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /SBIN_DIR/ifconfig $interface $ip $BRO=
ADCAST $NETMASK

Both are guarded by 'if [ $have_bin_ip -eq 1 ]; then' and should also work =
with iproute2 equivalents
though.

-> Related but no need to fix. Fallback could be removed maybe.

> meta/lib/oeqa/selftest/cases/devtool.py:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D runCmd('PATH=3D"$PATH:/sbin:/u=
sr/sbin" ifconfig -a', ignore_status=3DTrue)
> meta/lib/oeqa/selftest/cases/devtool.py:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.skipTest('Fa=
iled to determine if tap devices exist with ifconfig or ip: %s' % result.ou=
tput)

This is fallback handling for missing 'ip' on the host.

-> Unrelated. Could be removed anyway maybe (already had a patch for this).

> meta/lib/oeqa/utils/qemurunner.py:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 cmd =3D "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)

This I had overseen and it actually seems to be called on the target.

-> Probably affected and should be changed.

> meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D self.target.run("ifconfig eth0 |=
 grep 'inet ' | awk '{print $2}'")
> meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D self.target.run("ifconfig eth0:1=
 %s netmask 255.255.255.0 && sleep 2 && ping -c 5 %s && ifconfig eth0:1 dow=
n" % (virtual_ip,virtual_ip))

I had made a patch for this but did not figure out how to run this test or =
if it is actually used by
CI.

-> Probably affected and needs more research.

> but there are others too. We probably need to finish resolving these to
> other commands before we can turn this off.
>=20
> If you aren't able to help with that, we should at least have an open
> bug to sort it out.

I'd try to address the potential issues first.

Another challenge would be to remove the actual 'net-tools' package because=
 ltp still seems to rely
on it (with explicit RDEPENDS).
But we could start with removing it from packagegroup-core-{base-utils,full=
-cmdline}.bb IMHO.

Do you have an opinion about the host tooling? Could we drop net-tools here=
, too?


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

