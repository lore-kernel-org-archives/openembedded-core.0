Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.695.1614274514941238009
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 09:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4Dmg0c0ZlFz5tlB;
	Thu, 25 Feb 2021 18:35:12 +0100 (CET)
Date: Thu, 25 Feb 2021 18:35:10 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Drew Moseley <drew.moseley@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] DTC_FLAGS with devshell
Message-ID: <20210225173510.27uhyrgteq56kdcb@qschulz>
References: <be6caeb7-3822-a710-be04-9b57f658331e@moseleynet.net>
MIME-Version: 1.0
In-Reply-To: <be6caeb7-3822-a710-be04-9b57f658331e@moseleynet.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Thu, Feb 25, 2021 at 12:00:47PM -0500, Drew Moseley wrote:
> Hello,
>=20
> I'm having difficulty using "bitbake -c devshell virtual/kernel" to
> build dtb files properly. In our case, we set "DTC_FLAGS=3D-@" in recip=
e
> metadata to ensure device tree overlay support is available. It all
> works fine when run as a standard build.=A0 In the devshell, that varia=
ble
> is not respected by default. I do see that there is an EXTRA_OEMAKE
> environment variable with HOSTCC, HOSTCPP and DTC_FLAGS set but when I
> try to invoke "make ${EXTRA_OEMAKE} dtbs" it gets a weird argument
> parsing error presumably due to shell globbing, quotation mark
> processing etc:
>=20
>     # make ${EXTRA_OEMAKE} dtbs
>     make: invalid option -- 'y'
>     make: invalid option -- '/'
>     make: invalid option -- '/'
>     make: invalid option -- '/'
>     make: invalid option -- 'E'
>     make: invalid option -- '"'
>     Usage: make [options] [target] ...
>=20
> If I manually copy/paste the value of EXTRA_OEMAKE onto my make
> invocation it works. If I just add the DTC_FLAGS it also works (ie "mak=
e
> DTC_FLAGS=3D-@ dtbs").
>=20
> Is there a better mechanism for handling this?
>=20

There's a recent patch for this:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/classes/kerne=
l-devicetree.bbclass?id=3Dff036cbb77124867a6c6f97ca206b4fd3ee00c70

Reading the commit log, it seems you could use KERNEL_EXTRA_ARGS right
now.

Cheers,
Quentin
--=20
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
Fax: +43 1 667 20 02 4401
quentin.schulz@streamunlimited.com, www.streamunlimited.com
