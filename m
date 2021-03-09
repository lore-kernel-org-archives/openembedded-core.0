Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.7190.1615288743760178665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 03:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 78.113.208.92
Received: from kmaincent-XPS-13-7390 (92.208.113.78.rev.sfr.net [78.113.208.92])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6FC2FC0006;
	Tue,  9 Mar 2021 11:19:00 +0000 (UTC)
Date: Tue, 9 Mar 2021 12:18:59 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 bluelightning@bluelightning.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v7] util-linux: split uuid in separate recipe to allow bootstrapping
Message-ID: <20210309121859.053dbeb1@kmaincent-XPS-13-7390>
In-Reply-To: <58bcb66c9e15d4121defef93cb6b34266fd89037.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	<20210305110218.24635-1-luca.boccassi@gmail.com>
	<58bcb66c9e15d4121defef93cb6b34266fd89037.camel@linuxfoundation.org>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 08 Mar 2021 19:29:20 +0000
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-03-05 at 11:02 +0000, luca.boccassi@gmail.com wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > Recently util-linux gained an (optional) build dependency on libcryptse=
tup.
> > But libcryptsetup build-depends on util-linux for blkid (optional, can =
be
> > disabled) and uuid (mandatory).
> > Split out util-linux-uuid in a different recipe to break the cycle.
> >=20
> > https://github.com/karelzak/util-linux/pull/898
> >=20
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory=
 work
> > =C2=A0=C2=A0=C2=A0=C2=A0underway as I'm not sure if this is the best ap=
proach or if there are
> > =C2=A0=C2=A0=C2=A0=C2=A0alternatives. Suggestions and comments very wel=
come. Thanks!
> > v2: changed packages names to reflect old ones (eg: libuuid1 ->
> > util-linux-libuuid) and leave uuid build enable in main recipe to allow=
 for
> > uuidgen build to happen, as it does not have its own autoconf switch.
> > Delete the library manualy from the main recipe after build instead, and
> > add dependency. Might help to break loop python3 -> util-linux ->
> > libselinux -> python3, as it's only libuuid that is needed, see
> > https://lists.yoctoproject.org/g/yocto/message/47570 v3: rebased and
> > refactored to have a common util-linux.inc file v4: added RDEPENDS on
> > util-linux-libuuid on various packages to fix QA warnings v5: remove
> > RDEPENDS and instead have util-linux RDEPEND on util-linux-uuid. Removed
> > PACKAGES_remove and instead filter out libuuid via the package generati=
on
> > regex. Rebased on util-linux 2.36.2.
> > v6: install libuuid.a in libuuid-dev
> > =C2=A0=C2=A0=C2=A0=C2=A0change rdepends on uuid to use binary package r=
ather than source
> > =C2=A0=C2=A0=C2=A0=C2=A0add rdepends on uuid-dev to libuuid-dev
> > =C2=A0=C2=A0=C2=A0=C2=A0remove rprovides of libuuid-dev from uuid-dev
> > v7: do not use '_append' for RDEPENDS, as it is not supported by
> > BBCLASSEXTEND, use simply '+=3D' =20
>=20
> This is looking closer but not there yet I'm afraid. Testing showed:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/3152
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/3188
>=20

It miss also the Maintainer description for linux-util-uuid recipe:
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1901/step=
s/14/logs/stdio

Regards,=20

K=C3=B6ry
