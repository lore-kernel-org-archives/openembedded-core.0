Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQFhg-0005cR-Tg
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 12:57:52 +0200
Received: by mail-ea0-f175.google.com with SMTP id c1so743334eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 03:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=117/LHOA8beYloTEsazvD80PD445BLGPS9PpFLM8Pnk=;
	b=ayKCay94xsAl8d2t9qnhseiHUbk+KYYUGa967RiJ9jR8ksfnCGrsoijC6rUY0fHNQb
	/+RZX17h6v/cMwc/Qn274Ve/neKhKRTYgoFR/BdNeU7q0OY5wSx8WtIJDnbyG288Mz7L
	UTx1EvgXEd++KXsgOs2YB5+voqssdG27DtmS1New48IiayjVio8sZajmJEDXvCxqlXn4
	OfaFDKMntXguYSGloWP+6FExdl6JuTCX6cQSwFU83pN1DkU90VoTVbzjRutkW8DwBN2w
	KDt0STaWzYpuJZGlITJ8rnJ+XUbZfjFdeZmh/mn/jS6qKYi5pAItfTGUvZloFzAr1NOB
	Giqg==
Received: by 10.14.0.68 with SMTP id 44mr11586590eea.1.1350902668281;
	Mon, 22 Oct 2012 03:44:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 7sm15354061eeg.5.2012.10.22.03.44.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 03:44:27 -0700 (PDT)
Date: Mon, 22 Oct 2012 12:44:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121022104442.GD3269@jama.jama.net>
References: <1350658135.2520.29.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1350658135.2520.29.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Improve handling of machine specific manifests
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
X-List-Received-Date: Mon, 22 Oct 2012 10:57:53 -0000
X-Groupsio-MsgNum: 30790
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Content-Disposition: inline

--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 03:48:55PM +0100, Richard Purdie wrote:
> Now do_package isn't machine specific, we're only left with do_populate_s=
ysroot as a
> machine specific task. This change marks only the machine specific manife=
sts as machine
> specific, defaulting to PACKAGE_ARCH for everything else.
>=20
> This means we do less work where there are multiple machines using the sa=
me
> core package architecture and we can start to clean up the sstate duplica=
te files
> whitelist.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index d2a120b..dee84bf 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -17,10 +17,7 @@ SSTATE_EXTRAPATH   =3D ""
>  SSTATE_EXTRAPATHWILDCARD =3D ""
>  SSTATE_PATHSPEC   =3D "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTA=
TE_PKGSPEC}"
> =20
> -# In theory we should be using:
> -# SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ =
${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/all/ ${TMPDI=
R}/pkgdata/all${TARGET_VENDOR}-${TARGET_OS}"
> -# However until do_package is not machine specific, we'll have to make d=
o with all of deploy/pkgdata.
> -SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR}/ ${TMPDIR}/pkgdata/"
> +SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/"

Looks like warnings are back :/

WARNING: The recipe attr is trying to install files into a shared area when=
 those files already exist. Those files are:
   /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-local=
e-de_2.4.46-r4_armv7a-vfp-neon.ipk
   /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-dbg_2=
=2E4.46-r4_armv7a-vfp-neon.ipk
   /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-local=
e-sv_2.4.46-r4_armv7a-vfp-neon.ipk
=2E..

and new warnings from pkgdata
WARNING: The recipe bison is trying to install files into a shared area whe=
n those files already exist. Those files are:
   /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnue=
abi/bison
   /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnue=
abi/runtime/bison-locale-nl.packaged
   /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnue=
abi/runtime/bison-dbg.packaged
   /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnue=
abi/runtime/bison-doc
   /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnue=
abi/runtime/bison-locale-th.packaged
=2E..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFI5oACgkQN1Ujt2V2gBw6BgCfTu1jwGIJhfvBsJlAHbdgp1na
9XYAmgOt0/eoz5rEfqsbaPd3L206Sh51
=OQMG
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--
