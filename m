Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 89BC9610DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 12:33:14 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so1034197eaj.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 04:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tJUcnvG37WvwXBbL3xzpfT3J/eiOJw3mkmtUWEI978E=;
	b=eNUzYWcv2rbU2MAdKRLOMRzg8dcfj8+UzzZl/rwEUB6Xy92oUx2O/XqUVP4uaE4i0g
	V7ukCtZCC5aCeBa01DlzSrecdzqsy9dZPCEgeLcjGeywhFbD0J+rEcZWCfpyWBue2dqb
	IxfpaKwQeDqm+gh+IjA0r0SxAngzuOrxHry2j8BJLq+7fwZA3S+gjR+Y6YL0l/Ey6tGA
	b+ZBJ+ODH1m7qNBQnAD5+ZZJojZB3XSOx1WCfDJe4kENLW1sB99Vr4R17bkMSePYVT5w
	mgyRR18KFzQFLIpUuvuS8Tlm99d1EOUl1D346RSiGqA8shBwtME8eKMef69/ZjrJ3Qch
	A+TQ==
X-Received: by 10.14.5.12 with SMTP id 12mr5650481eek.9.1387542795068;
	Fri, 20 Dec 2013 04:33:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 44sm18222038eek.5.2013.12.20.04.33.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Dec 2013 04:33:14 -0800 (PST)
Date: Fri, 20 Dec 2013 13:33:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131220123348.GV3706@jama>
References: <1387541162.6402.91.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1387541162.6402.91.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Convert to use ':' as a filename sperator and use SSTATE_SWSPEC globally
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
X-List-Received-Date: Fri, 20 Dec 2013 12:33:14 -0000
X-Groupsio-MsgNum: 48363
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NXxBKFTfdeXlAk+N"
Content-Disposition: inline

--NXxBKFTfdeXlAk+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2013 at 12:06:02PM +0000, Richard Purdie wrote:
> Currently the code has problems differentiating between "gcc-cross" and "=
gcc-cross-initial"
> sstate files. We could add in a ton of special casing but tests show this=
 isn't scaling
> well. Using a more unique separator resolves the issue.
>=20
> The choice of which separator to use is a hard one. We need something whi=
ch isn't commonly
> used in PN, PV, PR, *_OS and *_ARCH which rules out '-', '_' and it needs=
 to work ok with
> webservers/http which makes ';' and '%' harder.
>=20
> The change also sets SSTATE_SWSPEC globally since writing out differently=
 named siginfo
> files for the fetch/unpack/patch tasks is a waste of diskspace, the hashe=
s match for
> all PN in the majority of cases and if they don't, its not a big issue as=
 the hash is
> different. This makes the results from sstate debugging more understandab=
le.

Can you mention why :: is sometimes used in SWSPEC?

I guess it's again just for easier differentianting, but maybe it should
be mentioned in commit message.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 199a5b3..324d1c1 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -9,8 +9,8 @@ def generate_sstatefn(spec, hash, d):
>      return hash[:2] + "/" + spec + hash
> =20
>  SSTATE_PKGARCH    =3D "${PACKAGE_ARCH}"
> -SSTATE_PKGSPEC    =3D "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TA=
RGET_OS}-${PV}-${PR}-${SSTATE_PKGARCH}-${SSTATE_VERSION}-"
> -SSTATE_SWSPEC     =3D ""
> +SSTATE_PKGSPEC    =3D "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TA=
RGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
> +SSTATE_SWSPEC     =3D "sstate:${BPN}::${PV}:${PR}::${SSTATE_VERSION}:"
>  SSTATE_PKGNAME    =3D "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar(=
'SSTATE_PKGSPEC', True), d.getVar('BB_TASKHASH', True), d)}"
>  SSTATE_PKG        =3D "${SSTATE_DIR}/${SSTATE_PKGNAME}"
>  SSTATE_EXTRAPATH   =3D ""
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
> index e49d724..112e8ce 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -95,7 +95,7 @@ do_patch[stamp-base-clean] =3D "${SSCLEAN}"
> =20
>  # SW means Shared Work directory
>  SW =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
> -SSTATE_SWSPEC =3D "sstate-gcc-${PV}-${PR}-${SSTATE_VERSION}-"
> +SSTATE_SWSPEC =3D "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
>  WORKDIR_task-unpack =3D "${SW}"
>  WORKDIR_task-patch =3D "${SW}"
> =20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NXxBKFTfdeXlAk+N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlK0OSwACgkQN1Ujt2V2gBzzdwCgn9aolR815ta/CqTpRbqrTo4d
VqIAn2wGswF7bxO+0tmUfmVJLSJD6iVv
=Lv0T
-----END PGP SIGNATURE-----

--NXxBKFTfdeXlAk+N--
