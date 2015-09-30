Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id D452577027
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:42:11 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so65351944wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IWfMvF5ebRd4TG/ok0jcdgr9No9rym2i7GS85byp8jE=;
	b=E4KKjSldLZr3QqC4wtM9xRebkNqmcoOEBFpcRkVLv1hkYAsuX7zulWPOlRW0ksZWg6
	tltyEnssbcnLKuJbHDkBkbYChy10GPs1HkwqYmLW86LnFTewMRiHCB9eDSJsoik1a1NH
	WxfjTtCNnvZYdOW5uor+hCL5yJYs3HlhBolE1UWqDmlUm8ICE6Q4cxu3exmLfkAxUx3X
	r13Co8GsGtyB3ECyDfXuSTiboQwWypK+JGVZQNCHGXmIsxcSAx/EKfGFdaPjOug+D4Lf
	hkpyZNyKTirbNlKs9Sg6ptDyTMs7nSK0RqfEBIUaN08wpb3PkDVppKpyxfldtyHmu6LU
	VUng==
X-Received: by 10.180.198.180 with SMTP id jd20mr5640510wic.70.1443624131154; 
	Wed, 30 Sep 2015 07:42:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl4sm1016773wjb.29.2015.09.30.07.42.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Sep 2015 07:42:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Sep 2015 16:43:03 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150930144303.GC2405@jama>
References: <1443621275.5162.95.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1443621275.5162.95.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils3: Avoid MACHINE specific checksums
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
X-List-Received-Date: Wed, 30 Sep 2015 14:42:12 -0000
X-Groupsio-MsgNum: 71813
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 02:54:35PM +0100, Richard Purdie wrote:
> The MACHINE variable is used to handle sysroot paths within one of the
> patches to python3-native. In this context, it is relocation safe and
> the resulting packages should not have MACHINE specific checksums,
> therefore excluding MACHINE in this context is safe.
>=20
> This whole setup is ugly and ideally we should come up with a better
> way of handling this but at least allow a stop gap solution for now.

There was some short discussion about this long time ago:
http://patchwork.openembedded.org/patch/74129/

I'm still using that patch and still haven't found any issues caused by
that, but I'm not using python3 recipes (except building them in world),
so it's possible I've just overlooked them.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bb=
class
> index e909ef4..443bf3a 100644
> --- a/meta/classes/distutils3.bbclass
> +++ b/meta/classes/distutils3.bbclass
> @@ -21,6 +21,7 @@ distutils3_do_compile() {
>          build ${DISTUTILS_BUILD_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
>  }
> +distutils3_do_compile[vardepsexclude] =3D "MACHINE"
> =20
>  distutils3_stage_headers() {
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
> @@ -33,6 +34,7 @@ distutils3_stage_headers() {
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
>  }
> +distutils3_stage_headers[vardepsexclude] =3D "MACHINE"
> =20
>  distutils3_stage_all() {
>          if [ ${BUILD_SYS} !=3D ${HOST_SYS} ]; then
> @@ -48,6 +50,7 @@ distutils3_stage_all() {
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install ${DISTUTILS_STAGE_ALL_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
>  }
> +distutils3_stage_all[vardepsexclude] =3D "MACHINE"
> =20
>  distutils3_do_install() {
>          install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> @@ -90,6 +93,7 @@ distutils3_do_install() {
>              rmdir ${D}${datadir}/share
>          fi
>  }
> +distutils3_do_install[vardepsexclude] =3D "MACHINE"
> =20
>  EXPORT_FUNCTIONS do_compile do_install
> =20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYL9PcACgkQN1Ujt2V2gByXwgCbBwhnlUJ/bSKNoGvZp9V/aEiR
t2wAnRV8FrVQStOXfxEnMuGuIw3WyiHN
=qb1H
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
