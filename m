Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFPHV-0003Dt-Kz
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 14:30:18 +0100
Received: by mail-pb0-f44.google.com with SMTP id wz12so4987273pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GHSKsoeDoOgQLixaI9xwfMrEAcMDZWmx57kf4mpeEjg=;
	b=h4ODTy8IQcRUbHUx2uut6wGtmcZzxPx7KznZo4wuxd9o7WK22KCE4qiBN1hle5w6Hd
	k5uP9kuBarHx0bm59mWN3oNm4u276/j1/icPlypNbQObeREldQth4g+HIa7kYz1oiulU
	bR+FewdxAVCLbWwxev+ghPgWEti25u+BK/5X4VcSxTlRoioUUc2xMAFIzCB9K6Ni6AcN
	No/AE+ipBtNV+gch5bvNOHEob0A3BObe+gbqR0Rhvii6J9nEB7MvcWlPJtfDcmtUKOtg
	Ps0gdWob4bb9gTuPspw7H8gBsICew9auf2+mlXduDqNTEC5F8x62adVkBRIWeitOMPVu
	gVFw==
X-Received: by 10.68.252.134 with SMTP id zs6mr30685477pbc.66.1363094017470;
	Tue, 12 Mar 2013 06:13:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id tm1sm25027056pbc.11.2013.03.12.06.13.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 06:13:36 -0700 (PDT)
Date: Tue, 12 Mar 2013 14:13:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20130312131336.GK9724@jama.dyndns-home.com>
References: <1363090807-23944-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <1363090807-23944-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins-package: set ALLOW_EMPTY_${PN}
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
X-List-Received-Date: Tue, 12 Mar 2013 13:30:20 -0000
X-Groupsio-MsgNum: 36515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUvfsPTz/SzOZDdw"
Content-Disposition: inline

--fUvfsPTz/SzOZDdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2013 at 01:20:07PM +0100, Enrico Scholz wrote:
> Every subpackage has a dependency on '${PN}' because
> populate_packages_prepend() specifies "extra_depends=3Dd.expand('${PN}')"
> when splitting the subpackages.
>=20
> Hence, '${PN}' must be always created
>=20
> Although creation of -plugin-dev and -plugin-staticdev is flawed imo
> (.la files are not for development purposes but useless resp. required
> for module loading on non GNU/linux platforms, and .a files are not
> created for plugins), patch sets ALLOW_EMPTY for -dev and -staticdev
> packages for consistency reasons.

I've sent the same a week ago:
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/036752.ht=
ml

>=20
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/=
meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> index 3e9ef92..2f2be34 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> @@ -24,6 +24,10 @@ python populate_packages_prepend () {
>      d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
>  }
> =20
> +ALLOW_EMPTY_${PN} =3D "1"
> +ALLOW_EMPTY_${PN}-dev =3D "1"
> +ALLOW_EMPTY_${PN}-staticdev =3D "1"
> +
>  PACKAGES +=3D "${PN}-apps ${PN}-meta ${PN}-glib"
>  FILES_${PN}-apps =3D "${bindir}"
> =20
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fUvfsPTz/SzOZDdw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE/KgAACgkQN1Ujt2V2gBxOwwCfRMLNuDIV8Hf1BUlQ7Rn5SrRN
7zoAnRt3DWDAS0zqGuLowE6u4ZKgxIjq
=H+z1
-----END PGP SIGNATURE-----

--fUvfsPTz/SzOZDdw--
