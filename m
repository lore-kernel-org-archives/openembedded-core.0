Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Ra1pU-00025Y-9Y; Mon, 12 Dec 2011 10:05:49 +0100
Received: by eekb15 with SMTP id b15so2442374eek.6
	for <multiple recipients>; Mon, 12 Dec 2011 00:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gw6p7AEuoSqw6uSzFQuz+OnDLbgceORVXGzVczYbqYA=;
	b=wLOkqJswKEgEZwLGyh/rJovoiJ513+qEyOwg5yCdKmMpKOYYL84UAWmCV9rCygkP8L
	hUUatf0LJuzQVKdzDZuUHj4tGMTpId7NnT0t3a2KVyyyyvI/9Oku0sFlp4uLxmYDuMpU
	GTLjeeWMjc5fjDj1cDnN79F6DgM7G+s3xdJRY=
Received: by 10.14.10.93 with SMTP id 69mr2434332eeu.201.1323680333706;
	Mon, 12 Dec 2011 00:58:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 58sm72842072eet.11.2011.12.12.00.58.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 00:58:52 -0800 (PST)
Date: Mon, 12 Dec 2011 09:58:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111212085851.GE3783@jama.jama.net>
References: <20111212084206.608CB10332@opal>
	<20111212084731.GD3783@jama.jama.net>
	<3658FA4C-A757-40C6-B6CC-CB4A925103A4@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <3658FA4C-A757-40C6-B6CC-CB4A925103A4@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel version has extra '+' when kernel is built from git
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
X-List-Received-Date: Mon, 12 Dec 2011 09:05:49 -0000
X-Groupsio-MsgNum: 14082
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M/SuVGWktc5uNpra"
Content-Disposition: inline

--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2011 at 09:53:47AM +0100, Koen Kooi wrote:
>=20
> Op 12 dec. 2011, om 09:47 heeft Martin Jansa het volgende geschreven:
>=20
> > On Mon, Dec 12, 2011 at 08:42:06AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: meta-openembedded.git
> >> Branch: master
> >> Commit: c486dfa4013b37972c1a1e4df8616eb6f49de498
> >> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcom=
mit;h=3Dc486dfa4013b37972c1a1e4df8616eb6f49de498
> >>=20
> >> Author: Koen Kooi <koen@dominion.thruhere.net>
> >> Date:   Sun Dec 11 09:46:28 2011 +0100
> >>=20
> >> kernel bbclass: sync with OE-core
> >>=20
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >=20
> > If you're working on shared linux.inc in meta-oe, could you please
> > integrate this:
> >=20
> > do_configure_prepend() {
> > #otherwise it gets extra '+' "2.6.37+"
> > #because:
> > #$ scripts/setlocalversion . =3D> +
> > #$ make kernelversion =3D> 2.6.37
> > #$ make kernelrelease =3D> 2.6.37+
> >  rm -rf ${S}/.git
> > }
>=20
> That would break the following:
>=20
> koen@dominion:/OE/tentacle$ tail conf/local.conf -n15 | head -n4
> ASSUME_PROVIDED +=3D "gitam-native"
> PATCHTOOL_pn-linux-ti33x-psp =3D "gitam"
> PATCHTOOL_pn-linux =3D "gitam"
> PATCHTOOL_pn-u-boot =3D "gitam"
>=20
>=20
> > I have to do this in every git recipe as I don't like dirs like
> > /lib/modules/2.6.37+
>=20
>=20
> > Maybe it should be fixed on kernel.bbclass level, because linux-yocto
> > suffers the same ie /lib/modules/3.0.12-yocto-standard+
> >=20
> > Ccing oe-core for that..
>=20
>=20
> I had a patch for scripts/setlocalversion that got rid of the '+', but I =
stopped caring after a while. We could just run sed in kernel.bbclass to fi=
x the script.

Even better than removing .git.

Regards,

>=20
> regards,
>=20
> Koen



> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--M/SuVGWktc5uNpra
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7lwksACgkQN1Ujt2V2gBwNFQCfamuaPGYADmbZEXAaD4AGSxI/
0iAAn3pDpHrPQeTly1mLm8uRM1dGqg7V
=QNHr
-----END PGP SIGNATURE-----

--M/SuVGWktc5uNpra--
