Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 49A2671547
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Oct 2014 02:29:41 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id em10so400369wid.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Oct 2014 19:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tUB2hHuaJOUeBZAncoW/ERuwKq+d4zg2705SHmr7m8I=;
	b=lc3oltSVJTX/w373jYK3oODGmXkqExId73M1cn0ssDxaZ8PfGL/4cLxWJZe9TwauGg
	7YLxbt/PmcyXo3Jw9vlt1bGECi9zOAgG3Ur33nxA8vHt7T7Di7eo/+m4NOn8DPQ0yC1I
	GPGq+j/2afRyH4YvlZ9M+Q2IKrTa412EE8qd+3QMqjfKm2+BLjCegCLHyOaAgGmlfba7
	vs0rfq2LRgZw9Z00K15Ui9Ov4gYOrRSGno9FbiqvEmAiF7+fX+Haa2PS138O+eV++Etm
	nZTAqOcT41tulghlaQ1XzzJqkogI8NujHiuiIXtK2HpSZOSinKmf0hy0OdGJTRN8zusU
	Vgkg==
X-Received: by 10.180.96.71 with SMTP id dq7mr2524594wib.66.1412389782803;
	Fri, 03 Oct 2014 19:29:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ny6sm3696934wic.22.2014.10.03.19.29.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 19:29:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 4 Oct 2014 04:30:40 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20141004023040.GO25706@jama>
References: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [WIP][PATCH] systemd: don't move libgudev around, it breaks libgudev-1.0.la
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
X-List-Received-Date: Sat, 04 Oct 2014 02:29:45 -0000
X-Groupsio-MsgNum: 58360
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yyDlEBSQJ3H1meLT"
Content-Disposition: inline

--yyDlEBSQJ3H1meLT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 04, 2014 at 04:27:55AM +0200, Martin Jansa wrote:
> * libgudev-1.0.la still references /usr/lib and this change was breaking =
gypsy (detected in navit) and
>   network-manager-applet

sending as WIP mostly because I don't know what "backward compatibility"
issues required this move to be added when upgrading to 216

only issue I've noticed was unpacked libgudev files, so I've added the
libgudev package manually (instead of expecting split-package to create
it dynamically).

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_216.bb | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core=
/systemd/systemd_216.bb
> index ebf9395..2779823 100644
> --- a/meta/recipes-core/systemd/systemd_216.bb
> +++ b/meta/recipes-core/systemd/systemd_216.bb
> @@ -129,9 +129,6 @@ do_install() {
>  		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${syscon=
fdir}/init.d/systemd-udevd
>  	fi
> =20
> -	# Move libgudev back to ${rootlibdir} to keep backward compatibility
> -	[ ${rootlibdir} !=3D ${libdir} ] && mv -t ${D}${rootlibdir} ${D}${libdi=
r}/libgudev*
> -
>          # Delete journal README, as log can be symlinked inside volatile.
>          rm -f ${D}/${localstatedir}/log/README
> =20
> @@ -171,10 +168,10 @@ python populate_packages_prepend (){
>      systemdlibdir =3D d.getVar("rootlibdir", True)
>      do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Sys=
temd %s library', extra_depends=3D'', allow_links=3DTrue)
>  }
> -PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
> +PACKAGES_DYNAMIC +=3D "^lib(udev|systemd).*"
> =20
>  PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-anal=
yze ${PN}-kernel-install \
> -             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh"
> +             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh libgudev"
> =20
>  SYSTEMD_PACKAGES =3D "${PN}-binfmt"
>  SYSTEMD_SERVICE_${PN}-binfmt =3D "systemd-binfmt.service"
> @@ -188,6 +185,8 @@ FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"
>  FILES_${PN}-initramfs =3D "/init"
>  RDEPENDS_${PN}-initramfs =3D "${PN}"
> =20
> +FILES_libgudev =3D "${libdir}/libgudev*${SOLIBS}"
> +
>  # The test cases need perl and bash to run correctly.
>  RDEPENDS_${PN}-ptest +=3D "perl bash"
>  FILES_${PN}-ptest +=3D "${libdir}/udev/rules.d"
> --=20
> 2.1.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yyDlEBSQJ3H1meLT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQvW9AACgkQN1Ujt2V2gBwjfQCdEQhC4O7qlL/ZYZG6DdDsRibF
yAgAmweRmviLIiwL9rbyrwClU6zYjs/I
=MyAq
-----END PGP SIGNATURE-----

--yyDlEBSQJ3H1meLT--
