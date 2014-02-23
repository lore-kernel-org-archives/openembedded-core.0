Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD01605F8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2014 09:07:16 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id q10so2456405ead.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2014 01:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JAJtDKgeJu8x6Wf0yIJ0M4bUPx1QtBSONp1fEIESt6s=;
	b=vAM7UiJrW67sNpNNPBA0sWnENZWD715FS1YY3YZPfFjBB8PIEPqESSogZAscx7pOoC
	LOAyfPVhgOxkQDVCISa2YCcohvVYoa04lmf6X0wEjhfYBIBWb+1QCkiS3gdIWxXUfVfy
	JPvDd8NOW/SKVbxXcwQr48WpPuMLjxStSis7IQIKEZq40DYmk1TL04AEbnHfYx6xW7oF
	E6tFsytjQzbT+y9Grvgbg63HvuKytNEfRBb/37R3obD0C7hG4d895SWPuI9AKuNaNc+L
	+s8IbfPaFXTLrVTvqv0QTcUkGW9n1plFM3swo9LuX/LyK22yTjTuAejwWZn8OZPe/EIT
	Ny2A==
X-Received: by 10.15.111.130 with SMTP id cj2mr18319829eeb.102.1393146437513; 
	Sun, 23 Feb 2014 01:07:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x2sm48754003eeo.8.2014.02.23.01.07.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Feb 2014 01:07:16 -0800 (PST)
Date: Sun, 23 Feb 2014 10:07:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140223090753.GS3854@jama>
References: <1392726422-6634-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1392726422-6634-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH] package.py: log rpmdeps call
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
X-List-Received-Date: Sun, 23 Feb 2014 09:07:19 -0000
X-Groupsio-MsgNum: 50457
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEk28Nl/eckWL8CC"
Content-Disposition: inline

--vEk28Nl/eckWL8CC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2014 at 01:27:02PM +0100, Martin Jansa wrote:
> * I've noticed errors like this in log.do_package:
>=20
>   DEBUG: Executing python function package_do_filedeps
>   sh: 1: Syntax error: "(" unexpected
>   sh: 1: Syntax error: "(" unexpected
>   DEBUG: Python function package_do_filedeps finished
>=20
>   which are actually caused by some filenames included in package
>   containing '()' characters
>=20
>   Maybe we should change meta/classes/package.bbclass to
>   fail when some filedeprunner call fails like this and fix
>   filedeprunner to escape '()' and other possibly dangerous chars
>   it's called like this:
>   processed =3D list(pool.imap(oe.package.filedeprunner, pkglist))

Please don't merge this one yet, It's possible that it's causing
ValueError: insecure string pickle:
http://lists.openembedded.org/pipermail/openembedded-core/2014-February/089=
805.html

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/lib/oe/package.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 9a0ddb8..1f78a8d 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -89,7 +89,9 @@ def filedeprunner(arg):
> =20
>          return provides, requires
> =20
> -    dep_pipe =3D os.popen(rpmdeps + " " + " ".join(pkgfiles))
> +    rpmdepscmd =3D rpmdeps + " " + " ".join(pkgfiles)
> +    bb.debug(1, "runrpmdeps: %s" % rpmdepscmd)
> +    dep_pipe =3D os.popen(rpmdepscmd)
> =20
>      provides, requires =3D process_deps(dep_pipe, pkg, pkgdest, provides=
, requires)
> =20
> --=20
> 1.8.5.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vEk28Nl/eckWL8CC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMJumkACgkQN1Ujt2V2gBzVcACePEo4dGvBhMs5D+QOUD++q0iz
9DEAn2CCxlDMJXPoKdnthuDhIT3oQKBQ
=or3i
-----END PGP SIGNATURE-----

--vEk28Nl/eckWL8CC--
