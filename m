Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7B90F6DDA8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 13:13:02 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so2911737eek.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 05:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8qzKU684//fET4kM+hPVpNMiqpsHqfggS+iM6+uZQqA=;
	b=QcOPCYvzZNK+qK2tT/bxzXMdr/aWn7QuDtQTGBoL5v6rNOnYP8FY1pdaWl69vqd3AX
	NxSD9fVLvuE7PEa8deABZWVwhGXrovj96/dNUyTMY4iud2w28rp4+zdFlxbOlgQmgDXa
	2q5cXKYAvCkPuGUkFoo33GvSO3H/shDb7iNuakTqqTR1KTWQ468KIl5UinNZM5B0J6dU
	9cPZfHSQRGSatdcbCQr4KNGWUlKZ8OwUHp/a9D1RnEH7EDnko4EIZfv9DydxcqtphbS/
	7lxOZN3HjAw7iOzXue5efEkDPD4LFS//lgDqO0LHKQ6d+iaCmTNDXDAgkkXaBll4OiaA
	dz7w==
X-Received: by 10.15.50.129 with SMTP id l1mr45982eew.114.1390137182207;
	Sun, 19 Jan 2014 05:13:02 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m47sm43574506eey.7.2014.01.19.05.13.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jan 2014 05:13:01 -0800 (PST)
Date: Sun, 19 Jan 2014 14:13:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140119131300.GA5565@jama>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
	<c121197f51f33bbfe6a4322597205d51287bc261.1390052636.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c121197f51f33bbfe6a4322597205d51287bc261.1390052636.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH 2/5] package.bbclass: show warning when package is trying to provide already provided shlib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Jan 2014 13:13:03 -0000
X-Groupsio-MsgNum: 49183
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2014 at 03:02:07PM +0100, Martin Jansa wrote:
> * move read_shlib_providers before registering package as provider
>   and don't change provider if it already exists, show warning instead
>=20
> [YOCTO #4628]
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/package.bbclass | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 7dcec5e..aa8156d 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1356,6 +1356,7 @@ python package_do_shlibs() {
>          list_re =3D re.compile('^(.*)\.list$')
>          # Go from least to most specific since the last one found wins
>          for dir in reversed(shlibs_dirs):
> +            bb.debug(2, "Reading shlib providers in %s" % (dir))
>              if not os.path.exists(dir):
>                  continue
>              for file in os.listdir(dir):
> @@ -1471,6 +1472,8 @@ python package_do_shlibs() {
> =20
>      needed =3D {}
>      shlib_provider =3D {}
> +    read_shlib_providers()
> +
>      for pkg in packages.split():
>          private_libs =3D d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getV=
ar('PRIVATE_LIBS', True)
>          needs_ldconfig =3D False
> @@ -1504,6 +1507,12 @@ python package_do_shlibs() {
>          if len(sonames):
>              fd =3D open(shlibs_file, 'w')
>              for s in sonames:
> +                if s in shlib_provider:
> +                    (old_pkg, old_pkgver) =3D shlib_provider[s]
> +                    if old_pkg !=3D pkg:
> +                        bb.warn('%s-%s is already registered as shlib pr=
ovider for %s, ignoring %s-%s trying to register the same' % (old_pkg, old_=
pkgver, s, pkg, pkgver))
> +                        continue

I'll drop continue and update warning message, changing registered
provider for last built is still undeterministic but slightly better
e.g. when changing packaging and the shlib is moved between packages
(I've run into this in efl, when moving to split packages and they were
still getting runtime dependency on old efl package).

> +                bb.debug(1, 'registering %s-%s as shlib provider for %s'=
 % (pkg, pkgver, s))
>                  fd.write(s + '\n')
>                  shlib_provider[s] =3D (pkg, pkgver)
>              fd.close()
> @@ -1517,8 +1526,7 @@ python package_do_shlibs() {
>                  postinst =3D '#!/bin/sh\n'
>              postinst +=3D d.getVar('ldconfig_postinst_fragment', True)
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
> -
> -    read_shlib_providers()
> +        bb.debug(1, 'LIBNAMES: pkg %s sonames %s' % (pkg, sonames))
> =20
>      bb.utils.unlockfile(lf)
> =20
> --=20
> 1.8.5.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLbz1wACgkQN1Ujt2V2gBzh7QCfaPukp/6l9n66a/u6nrqtATfm
NCQAoI+SNiBujDLhvdJgjpr2h1F0MOpX
=nJGB
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
