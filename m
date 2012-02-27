Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1S1y1Q-00043O-Vu; Mon, 27 Feb 2012 11:41:37 +0100
Received: by eaae1 with SMTP id e1so484185eaa.6
	for <multiple recipients>; Mon, 27 Feb 2012 02:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AFdQL+3AORPol+DvkjEb3G80h7js/lJjfhEMEhxeke0=;
	b=aII366TCJKRkKbMTFjjjzv2WxTeWKkbT53An07lF6axqyyR1a2Bqz6au23vYaAVYdi
	hXmAfsk0xeA7g9GyYsFHFh0tY8cy0KgICPHT3M+n8oCS0jt1f+ecRLlwXXsoVC+M95E7
	PR/frCVx7g1ZA2P/7uotWfqMWvbj9ilGOAp6A=
Received: by 10.213.110.17 with SMTP id l17mr2890217ebp.112.1330338791055;
	Mon, 27 Feb 2012 02:33:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm9765285eef.9.2012.02.27.02.33.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 02:33:08 -0800 (PST)
Date: Mon, 27 Feb 2012 11:33:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120227103306.GG3859@jama.jama.net>
References: <20120222221309.69BFD10336@opal>
MIME-Version: 1.0
In-Reply-To: <20120222221309.69BFD10336@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Joshua Lock : netbase: remove redundant assignments
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
X-List-Received-Date: Mon, 27 Feb 2012 10:41:37 -0000
X-Groupsio-MsgNum: 18016
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tMbDGjvJuJijemkf"
Content-Disposition: inline

--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 10:13:09PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: c3d5800d2850a186f91b5a0db642aa5d1c20156b
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dc3d5800d2850a186f91b5a0db642aa5d1c20156b
>=20
> Author: Joshua Lock <josh@linux.intel.com>
> Date:   Tue Feb 21 17:46:44 2012 -0800
>=20
> netbase: remove redundant assignments
>=20
> There's no need to explicitly set PACKAGE_ARCH =3D MACHINE_ARCH, base.bbc=
lass
> takes care of setting this value for us based on the interfaces for those
> machines being an OVERRIDE.

do_install () {
=2E..
        # Disable network manager on machines that commonly do NFS booting
        case "${MACHINE}" in
                "qemuarm" | "qemux86" | "qemux86-64" | "qemumips" | "qemupp=
c" )

This causes do_install hash to depend on MACHINE variable for all MACHINEs,=
=20
so making whole recipe MACHINE_ARCH would be more effective then rebuilding=
=20
TARGET_ARCH package after every MACHINE switch.

Cheers,

>=20
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/netbase/netbase_4.47.bb |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/netbase/netbase_4.47.bb b/meta/recipes-cor=
e/netbase/netbase_4.47.bb
> index ddfa8ad..3aa4915 100644
> --- a/meta/recipes-core/netbase/netbase_4.47.bb
> +++ b/meta/recipes-core/netbase/netbase_4.47.bb
> @@ -47,7 +47,3 @@ do_install () {
>  }
> =20
>  CONFFILES_${PN} =3D "${sysconfdir}/hosts ${sysconfdir}/network/interface=
s"
> -
> -PACKAGE_ARCH_qemuarm =3D "${MACHINE_ARCH}"
> -PACKAGE_ARCH_qemux86 =3D "${MACHINE_ARCH}"
> -PACKAGE_ARCH_qemux86-64 =3D "${MACHINE_ARCH}"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tMbDGjvJuJijemkf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9LW+IACgkQN1Ujt2V2gBy+aACgqntprhfbnOs78vMdGWo82eEh
GwMAn1tiUO9e8AqBQHPG6ZSJu71nHk4x
=225R
-----END PGP SIGNATURE-----

--tMbDGjvJuJijemkf--
