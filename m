Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfw95-0000hv-6r
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:18:59 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2341341eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 09:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TYYAAKC/H8Uh/5z0mHS9moVNpoWC1rm6cFRixTVzoME=;
	b=UgVvSsn5TyawrEC8f4xLoTS2fC2utCP3VxwnG9Ih4bluE3TBUGASq8VSqaICai0/z7
	b3TRZiZBe1wm1qr0yn4Ab1NrjTInEIIr+GBpg4UDq6BbRnPtpjKb6FarSN/3sJVQKkxu
	lBWkjIVd/moiV6CR/2mDrGKv/SrFHVsiBCd+BAYZHK3oqP4Syw+BYWGt9Fn2Z8q2udvi
	c9cKz6DBkJL7axdWzKxdP++smbI9IIwGIYY7rNvSddC0Yd2+scQlFL4LovLt30fGD3m6
	P1QNL7oFgW0KHp0NlJfk0vdMNBVoywlXcDUu7bx4ACKXbyNbnjjjEtqJ5V6bzgbnOl4x
	T06Q==
Received: by 10.14.0.71 with SMTP id 47mr50025680eea.19.1354640676515;
	Tue, 04 Dec 2012 09:04:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f49sm3602008eep.12.2012.12.04.09.04.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 09:04:35 -0800 (PST)
Date: Tue, 4 Dec 2012 18:04:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20121204170432.GH14870@jama.jama.net>
References: <cover.1354641032.git.mark.hatle@windriver.com>
	<13c1d96727b678dc95430f1144b3017c9e62948f.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <13c1d96727b678dc95430f1144b3017c9e62948f.1354641032.git.mark.hatle@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/22] update-alternatives.bbclass: Add missing runtime dependency
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
X-List-Received-Date: Tue, 04 Dec 2012 17:18:59 -0000
X-Groupsio-MsgNum: 32191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Uu2n37VG4rOBDVuR"
Content-Disposition: inline

--Uu2n37VG4rOBDVuR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2012 at 11:14:35AM -0600, Mark Hatle wrote:
> When using update-alternatives, there should be a runtime dependency on
> update-alternatives.  Without this, it's possible to get into a situation
> where the package is not installable.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/update-alternatives.bbclass |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/upda=
te-alternatives.bbclass
> index 4e1ff27..e432506 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -304,6 +304,12 @@ python populate_packages_prepend () {
>              alt_remove_links +=3D '\tupdate-alternatives --remove  %s %s=
\n' % (alt_name, alt_target)
> =20
>          if alt_setup_links:
> +            # RDEPENDS setup
> +            bb.note('adding runtime requirement for update-alternatives =
for %s' % pkg)
> +            rdepends =3D d.getVar('RDEPENDS_%s' % pkg, True) or ""
> +            rdepends +=3D ' ' + d.getVar('MLPREFIX') + 'update-alternati=
ves'
> +            d.setVar("RDEPENDS_%s" % pkg, rdepends)
> +

I guess you should use VIRTUAL-RUNTIME_update-alternatives here

Cheers,

>              bb.note('adding update-alternatives calls to postinst/postrm=
 for %s' % pkg)
>              bb.note('%s' % alt_setup_links)
>              postinst =3D (d.getVar('pkg_postinst_%s' % pkg, True) or d.g=
etVar('pkg_postinst', True)) or '#!/bin/sh\n'
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Uu2n37VG4rOBDVuR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC+LSAACgkQN1Ujt2V2gBzFjQCfc/kwQjI9ACqAH0VPs2OaiWnN
lUEAoLTQwNnq73ypYKJ2Nnp3Bb9jRgEc
=UZte
-----END PGP SIGNATURE-----

--Uu2n37VG4rOBDVuR--
