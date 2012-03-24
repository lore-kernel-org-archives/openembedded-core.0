Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBOTR-0001Xo-SY
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 11:45:30 +0100
Received: by wibhj13 with SMTP id hj13so2593012wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 03:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kSljYibepNNLH5mV+WYyqf8zXVzMLG7fRgvuNdHtQHA=;
	b=Nc4OQxWzmP8fsom2tFmWaOJrTxcdznTqNxV7k+HTYW0o4OY/mwImCkeg9e6qgiqPGs
	7I9t5omKeH9IvbbZFuw/i7NIJre1cIXfdBLpkcO8kF8IdcAlw7TwvmtQCFPAY8Vkizw7
	dExur1dJkSD8BiEROm9AILeyyYyYv67n8t1bFtXLxhDL7Zecv/R3lKqmlPICRHs90Abr
	lcvUXtPSQvsinjPNfvfOly9vwUtg17LVqFV84pOIXFLY3OfptSw5mMwGhn4VpI7LZzXN
	h7wTwd16thhU5dBo7lEFP/nWh1OCG5Q35BuIJmpIxi6iNiWoymrr5+Jf89e9hwkssZUX
	JXAQ==
Received: by 10.180.95.34 with SMTP id dh2mr4091350wib.15.1332585392649;
	Sat, 24 Mar 2012 03:36:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm35903514wib.0.2012.03.24.03.36.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 03:36:32 -0700 (PDT)
Date: Sat, 24 Mar 2012 11:36:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120324103634.GH4604@jama.jama.net>
References: <alpine.DEB.2.02.1203240420500.19324@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1203240420500.19324@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: confusion between += and =+ and _append and _prepend ...
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Mar 2012 10:45:30 -0000
X-Groupsio-MsgNum: 19673
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QwZB9vYiNIzNXIj"
Content-Disposition: inline

--+QwZB9vYiNIzNXIj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 24, 2012 at 04:34:40AM -0400, Robert P. J. Day wrote:
>=20
>   when perusing the source for oe-core, it's going to be easy for a
> beginner to get confused about the right time(s) to use +=3D versus =3D+
> versus _append versus _prepend because the source simply bounces
> around between them all arbitrarily.
>=20
>   here's a single example.  the file bitbake.conf defines the default
> for PACKAGES:
>=20
> PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN} ${PN}-doc ${PN}-dev ${PN}-l=
ocale"
>=20
> now it would seem that, if a recipe wanted to extend that list (as
> many do), the obvious approach is to augment the list with more
> entries.  and in the occasional situation where that default needs to
> be overridden, then a straight assignment can be used.
>=20
>   but searching the source shows every possible combination of adding
> to the PACKAGES variable:
>=20
> ...
> meta/recipes-devtools/perl/perl_5.14.2.bb:PACKAGES_append =3D " perl-modu=
les "
> meta/recipes-qt/qt4/qt-4.8.0.inc:PACKAGES_append =3D " ${QT_BASE_NAME}-te=
sts-dbg ${QT_BASE_NAME}-tests"
> ...
> meta/recipes-connectivity/bind/bind_9.8.1.bb:PACKAGES_prepend =3D "${PN}-=
utils "
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc:PACKAGES_=
prepend =3D "wpa-supplicant-passphrase wpa-supplicant-cli "
> meta/recipes-extended/newt/libnewt_0.52.14.bb:PACKAGES_prepend =3D "whipt=
ail "
> ...
>=20
>   and there are, of course, many, many uses of "PACKAGES +=3D" and
> "PACKAGES =3D+".  and, sure, they'll all work but the variety is
> definitely going to confuse someone trying to figure out best
> practices.
>=20
>   and occasionally, there is a direct assignment when a simple
> appending would work fine, like with rpm:
>=20
> meta/recipes-devtools/rpm/rpm_5.4.0.bb:PACKAGES =3D "${PN}-dbg ${PN}
> ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common
> ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm
> perl-module-rpm perl-module-rpm-dev ${PN}-locale"
>=20
>   i realize this is all annoyingly picky pedantry but there should be
> some sort of standard for things like this, just for consistency.

order of items in PACKAGES variable is important (FILES_foo) are picked
in PACKAGES order so it's different if foo is before bar or after (if
their FILES_ mask has some overlap).

So sometimes you have to prepend, sometimes append.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+QwZB9vYiNIzNXIj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9to7IACgkQN1Ujt2V2gBwMLgCgg/3vECUzEK4QbSluwxMJsjk3
/HcAn12QdazW2kYPdeq2RRl48bq2hCrA
=5pcb
-----END PGP SIGNATURE-----

--+QwZB9vYiNIzNXIj--
