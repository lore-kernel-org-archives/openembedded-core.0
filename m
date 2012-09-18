Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TDzpI-0001UQ-OU
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 17:35:04 +0200
Received: by bkcik5 with SMTP id ik5so3042230bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=n49YCM1zWc9tT63R7rjKek6WFh/cNlH5YOsl66P1pCs=;
	b=pfidDHe4Mo+S6ms/MY+d6UwMmJC1RC0BrvXjqWAxiZsHSxcHKwcal9JKGhc85VDsg8
	RHXIO3fqEg+7x+oxwtCwufNwRqqDmwbYS85cKntX9jnef++zuMBByE/ZJVX70Werphe9
	XAkHytjohC3r3xEiK9fK58II3a2zkTUFhtjwczufWU7ci99pbBon7CzrNG92fR8r4KjQ
	drCXtR6C69W+Yq/d8K7SUOJBFuWHaOM8a7TMEgJrW0WVB4h8jTVzlFXf+kCLX6gPNWW1
	fjkgAhanKTi7Tgc+KYGFD7nQN9UG2X3OEgE2nBw3HOkCYSYUyZemfX0fwgcqcHJpL+2B
	B3YQ==
Received: by 10.204.130.131 with SMTP id t3mr105009bks.79.1347981744632;
	Tue, 18 Sep 2012 08:22:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm8201469bks.6.2012.09.18.08.22.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 08:22:23 -0700 (PDT)
Date: Tue, 18 Sep 2012 17:22:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120918152216.GD3498@jama.jama.net>
References: <1347962498-756-1-git-send-email-constantinx.musca@intel.com>
	<4D914278-5082-4B59-9162-CE561159AAF7@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <4D914278-5082-4B59-9162-CE561159AAF7@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Constantin Musca <constantinx.musca@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] netbase: split up in netbase and init-ifupdown
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 15:35:04 -0000
X-Groupsio-MsgNum: 29453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Content-Disposition: inline

--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 02:40:04PM +0200, Koen Kooi wrote:
>=20
> Op 18 sep. 2012, om 12:01 heeft Constantin Musca <constantinx.musca@intel=
=2Ecom> het volgende geschreven:
>=20
> > - netbase should only include etc-rpc, etc-protocols, etc-services
> > and the hosts file
> > - the init script/configuration files should be in another package
> > (init-ifupdown)
> >=20
> > [YOCTO #2486]
> >=20
> > Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> >=20
> > --- /dev/null
> > +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> > @@ -0,0 +1,41 @@
> > +SUMMARY =3D "Basic TCP/IP networking init scripts and configuration fi=
les"
> > +DESCRIPTION =3D "This package provides high level tools to configure n=
etwork interfaces"
> > +HOMEPAGE =3D "http://packages.debian.org/ifupdown"
> > +SECTION =3D "base"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/copyright;md5=3D3dd6192d306f58=
2dee7687da3d8748ab"
> > +RDEPENDS_${PN} =3D "netbase"
> > +RCONFLICTS_${PN} =3D "netbase (< 5.0-r1)"
>=20
> Since R* is for packaging they should live below do_install to mimic the =
order of task execution in the recipe

And I guess that layers changing machine specific parts of netbase did
that with PRINC so e.g. for me, I've

SHR root@gjama ~ $ opkg info netbase
Package: netbase
Version: 5.0-r8

So I guess I'll have to change this RCONFLICTS too in such layer, but
problem is that in BSP you don't know how many other layers someone is
using so PR of netbase (before this patch) is just lucky guess in this one.

Cheers,

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBYkagACgkQN1Ujt2V2gBwvpQCeNcQmAFWlurI3xi3aRloUUX6A
zh0AoIWrh5WCqJdhn0EZvCi9mA4pm2vr
=geG8
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
