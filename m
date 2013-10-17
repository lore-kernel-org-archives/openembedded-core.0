Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 143CE6CF1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 09:40:48 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so926289eaj.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4UeWd4PoCL2ALyrzSq9KBNBukkeMbHkXwaC8oGLoW/o=;
	b=r1Zkqmjt9wZzgBBP9RZC4EBZ0vOU+sH8BHkXGriUbxKSUIOCZl+ewdT38pwC4SLHJZ
	bwoIX/xHpaL/5HIe3Z/ClnDz/ryECGijL63r9n+HshMLpk7qcbgFL0YmNV3LM7dqafm9
	fihPmM3eVpVJm8bsXm2A4zldpZalC+sxWl5Ic9E321Lr8IVppI6aWWbiasCDy74cUiYF
	G758ehKtd+B2sUHBLqNjI2JruCQGUd/rP220ejYVQiwItaJO10FPkH/+GyqHOzaIOMwu
	nq4g6lWMAmlnspbBNTBXb/nHM+WBFJorhOwsnf+lnwwENWZnoDkOftDGmWXXGgaDE3xN
	tnFg==
X-Received: by 10.15.22.138 with SMTP id f10mr76187eeu.126.1382002850107;
	Thu, 17 Oct 2013 02:40:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm190700287eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 02:40:49 -0700 (PDT)
Date: Thu, 17 Oct 2013 11:40:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Message-ID: <20131017094054.GA3930@jama>
References: <1381975446-25671-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1381975446-25671-1-git-send-email-ming.liu@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V1 1/2] base-files: move shells generating process to pkg_postinst
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
X-List-Received-Date: Thu, 17 Oct 2013 09:40:51 -0000
X-Groupsio-MsgNum: 45949
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2013 at 10:04:05AM +0800, Ming Liu wrote:
> The "shells" file lists several valid login shells, of which some might be
> not present in a particular rootfs, this is unreasonable.
>=20
> Fix it by moving "shells" file generating process to pkg_postinst, for ot=
her
> shells must do the same thing to register themselves to this file.
>=20
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/recipes-core/base-files/base-files/shells    | 8 --------
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 8 ++++++--
>  2 files changed, 6 insertions(+), 10 deletions(-)
>  delete mode 100644 meta/recipes-core/base-files/base-files/shells
>=20
> diff --git a/meta/recipes-core/base-files/base-files/shells b/meta/recipe=
s-core/base-files/base-files/shells
> deleted file mode 100644
> index ce39b3d..0000000
> --- a/meta/recipes-core/base-files/base-files/shells
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -# /etc/shells: valid login shells
> -/bin/sh
> -/bin/ash
> -/bin/bash
> -/bin/dash
> -/bin/ksh
> -/usr/bin/ksh
> -/usr/bin/screen
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb
> index 054fefa..47c7ebe 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "file://rotation \
>             file://inputrc \
>             file://host.conf \
>             file://profile \
> -           file://shells \
>             file://fstab \
>             file://filesystems \
>             file://issue.net \
> @@ -92,7 +91,6 @@ do_install () {
>  	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
>  	sed -i "s#ROOTHOME#${ROOT_HOME}#" ${WORKDIR}/profile
>  	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
> -	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
>  	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.pr=
ofile
>  	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bas=
hrc
>  	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
> @@ -137,6 +135,12 @@ do_install_append_linuxstdbase() {
>          done
>  }
> =20
> +pkg_postinst_${PN} () {
> +        touch $D${sysconfdir}/shells
> +        grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${s=
ysconfdir}/shells

What it someone installs component providing /usr/bin/shell? Use at
least ^/bin/sh$ in grep.

> +}
> +
> +
>  PACKAGES =3D "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
>  FILES_${PN} =3D "/"
>  FILES_${PN}-doc =3D "${docdir} ${datadir}/common-licenses"
> --=20
> 1.8.3.3
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJfsKYACgkQN1Ujt2V2gBz98wCeJ2gEIP0gKpOcvr5tKDo3mbJz
TokAoIinnnXNM9stU7aMqTzBdrJBgnfP
=MUQK
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
