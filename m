Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URi1o-0002t4-Eo
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:57:16 +0200
Received: by mail-pa0-f42.google.com with SMTP id kq13so2498742pab.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 04:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=dPrVH7W0DSg7zi2cuiFNWZsRL66rJpF8PXoCykJga8o=;
	b=JXExgZTPep7hYRzfcNerlOn3TVx4HNRPjIvku/OEyr9pXvAxu3rTN4Du53Rc/Iwzq+
	POtt+gXR3+6dNAL12EMqdSevtMN+UopwBxcizV7OLD03B3wGqozo3sNStbtc5Cl6p8eR
	Cyg1Be1CU7Ww67HVwjmC4n4lWXL8aRr2F2/WUFa0rMiQo3l7mA1LgVoApgKJFNazFxsr
	wAsNsN5gvksig4eoXzF3ZkfNBcgyTvNn3LXEbZOit05u+icesm4DmaHA0pPGxhr7zO05
	y0c53VxmPBLM8K9UoCSfk7N/4fblATUVvaZrjzmL1xKXSNDEZwnnPIoNs8b7KpGUH1G/
	v/HA==
X-Received: by 10.68.236.134 with SMTP id uu6mr28466269pbc.55.1366025937144;
	Mon, 15 Apr 2013 04:38:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ce16sm21755126pac.5.2013.04.15.04.38.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 04:38:56 -0700 (PDT)
Date: Mon, 15 Apr 2013 13:38:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130415113853.GO2475@jama>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] kernel.bbclass: Ensure we have correct version information in deploy data
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
X-List-Received-Date: Mon, 15 Apr 2013 11:57:17 -0000
X-Groupsio-MsgNum: 37934
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XMHqbYJb993HXwLR"
Content-Disposition: inline

--XMHqbYJb993HXwLR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 12:07:01PM +0100, Richard Purdie wrote:
> Currently the names used for the kernel in deploy will contain "AUTOREV"

Here it shows "AUTOINC"

> instead of the final incremental numbering. This fixes the problem by
> ensuring data is obtained from the PR service and using the PKG* variables
> instead of PE/PV/PR directly.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/kernel.bbclass |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 8c8c95b..00e27ef 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -200,6 +200,7 @@ kernel_do_install() {
>  		sed -i 's#-I/usr/include/slang#-I=3D/usr/include/slang#g' $kerneldir/t=
ools/perf/Makefile
>  	fi
>  }
> +do_install[prefuncs] +=3D "package_get_auto_pr"
> =20
>  sysroot_stage_all_append() {
>  	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC=
_PATH}
> @@ -333,11 +334,11 @@ do_sizecheck[dirs] =3D "${B}"
> =20
>  addtask sizecheck before do_install after do_strip
> =20
> -KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MAC=
HINE}-${DATETIME}"
> +KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}=
-${MACHINE}-${DATETIME}"
>  # Don't include the DATETIME variable in the sstate package signatures
>  KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
>  KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${MACHINE}"
> -MODULE_IMAGE_BASE_NAME ?=3D "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATE=
TIME}"
> +MODULE_IMAGE_BASE_NAME ?=3D "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-=
${DATETIME}"
>  MODULE_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
>  MODULE_TARBALL_BASE_NAME ?=3D "${MODULE_IMAGE_BASE_NAME}.tgz"
>  # Don't include the DATETIME variable in the sstate package signatures
> @@ -386,6 +387,7 @@ kernel_do_deploy() {
>  	cd -
>  }
>  do_deploy[dirs] =3D "${DEPLOYDIR} ${B}"
> +do_deploy[prefuncs] +=3D "package_get_auto_pr"
> =20
>  addtask deploy before do_build after do_install
> =20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XMHqbYJb993HXwLR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFr5s0ACgkQN1Ujt2V2gBwPogCfbeVvEt+UXfSsYHArieSfaUGg
X90AmwfNPSpKFCpIv2w2yECURodNkwQl
=Iy7O
-----END PGP SIGNATURE-----

--XMHqbYJb993HXwLR--
