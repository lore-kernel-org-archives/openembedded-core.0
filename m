Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web10.9996.1594386095920914698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 06:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4B3Cq10Nbrz5tlF;
	Fri, 10 Jul 2020 15:01:32 +0200 (CEST)
Date: Fri, 10 Jul 2020 15:01:31 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: =?utf-8?Q?=C5=81ukasz?= Dywicki <luke@code-house.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Wireguard and wg-quick systemd unit location
Message-ID: <20200710130131.qlmwqq4hwrrnsbeq@qschulz>
References: <096144b2-ab6d-9abc-ca9d-0ada7b52237c@code-house.org>
MIME-Version: 1.0
In-Reply-To: <096144b2-ab6d-9abc-ca9d-0ada7b52237c@code-house.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi =C5=81ukasz,

On Fri, Jul 10, 2020 at 02:11:51PM +0200, =C5=81ukasz Dywicki wrote:
> Hi all,
> I been learning how to run things lately and I think I've found a bug o=
r
> at least an unintended trap for new comers.
>=20
> I've ran into exactly same issue as described here:
> https://stackoverflow.com/questions/54197951/yocto-systemd-service-to-i=
nstall-a-parameterized-service-service
>=20
> After looking on how to work around the problem I also looked why it
> given answer fails and why the heck it works for openvpn. The answer is
> simple - wireguard leaves wq-quick@.service in /lib/systemd and not in
> /lib/systemd/system. The end result is that any service which uses
> SYSTEMD_SERVICE_${PN}=3Dwireguard-tools + wg-quick@aaa.service doesn't =
work.
>=20

Can't comment on that, not familiar with systemd and the recipes
providing service units.

> I've looked at other distros. In ubuntu and arch unit file is
> /usr/lib/systemd/system hence it works as expected there. I've checked
> rpm spec and unit is placed in invalid place:
> %dir "/lib/systemd"
> "/lib/systemd/wg-quick@.service"
>=20
> I had a look on the wireguard makefile and it seems fine. Can someone
> point me where issue comes from and give a tip how to patch this issue?
>=20

If the path is the only issue
http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recip=
es-kernel/wireguard/wireguard-tools_1.0.20200319.bb?h=3Dmaster#n12
should probably be systemd_system_unitdir instead, c.f.:
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/bitbake.conf#n39

If this fixes it and there's no better answer in the next days, please
send a patch for that :)

Thanks,

Quentin
