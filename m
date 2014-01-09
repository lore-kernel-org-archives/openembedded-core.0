Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 10DFB60D03;
	Thu,  9 Jan 2014 11:54:08 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id a15so1430310eae.13
	for <multiple recipients>; Thu, 09 Jan 2014 03:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Xxi/1vsy6jGqWUGUuI+pjRo0G3AdX/6Yr4fnB6RG7Wc=;
	b=iBXCK2FgNirQtQrSWtuVdSTRTnNG38S2FZMrgNP+CpvZXN4a+ObnkcFy8LR9O+lPZl
	OUvJNauylr7BN6WdTm41JNKwgwzkv/dim1bJqlfbLGuh2hlEducItFJVzzp3iexcARsM
	q9mUetIB7J3Pd4UJPbzRUHs+mA6KFfS6S6NL3080qmjSXiJAwqpDyx8mBt2q6ZvE6Suz
	Z3/429jDprhxmvuf6cpK9ZtedkQ8agCUnwfVht0sXlkJghkeQrN1cZVGoqtWI0xEwM1u
	NxFmQ0lCSfMyVR8Jvpw8roJVx6GlhKvUaDdXNgz8jAPCzdn+M/DWUvtV3vy+C/6JpTDZ
	mSVg==
X-Received: by 10.14.199.197 with SMTP id x45mr3000247een.8.1389268449173;
	Thu, 09 Jan 2014 03:54:09 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm4855109eel.2.2014.01.09.03.54.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 03:54:08 -0800 (PST)
Date: Thu, 9 Jan 2014 12:54:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20140109115419.GE3709@jama>
References: <20140106221511.568935049A@opal>
MIME-Version: 1.0
In-Reply-To: <20140106221511.568935049A@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : initscripts: split the functions script into a separate package
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
X-List-Received-Date: Thu, 09 Jan 2014 11:54:09 -0000
X-Groupsio-MsgNum: 48757
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xGZLEhdrcEmdnWHc"
Content-Disposition: inline

--xGZLEhdrcEmdnWHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 10:15:11PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 736dd8380f41d6ff1d3d0e4fe33cc01e2e873ef6
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D736dd8380f41d6ff1d3d0e4fe33cc01e2e873ef6
>=20
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Mon Jan  6 15:27:34 2014 +0800
>=20
> initscripts: split the functions script into a separate package
>=20
> Many SysV init scripts need the /etc/init.d/functions script. But
> this script is part of the initscripts package. As a result, the
> initscripts package should always be installed into the system to
> avoid errors when starting daemons. However, it makes no sense to
> install the initscripts package into a systemd based image, because
> what the init scripts provide has already been provided by the systemd.
> On the other hand, the functions script might be still needed in a
> systemd based image because other init scripts such as distcc might need
> it.
>=20
> The above situation leads to a natural separation of the functions script
> from the initscripts package. And this patch does so. It separates the
> functions script into initscripts-functions packages.

FYI: In cases where alternative initscripts are used (and
VIRTUAL-RUNTIME_initscripts) respected, these alternatives also need to
rprovide initscripts-functions (or at least u-a for functions), otherwise
u-a fails in do_rootfs which is fatal for read-only:

| ERROR: The following packages could not be configured offline and
rootfs is read-only: initscripts-functions


>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/initscripts/initscripts_1.0.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/reci=
pes-core/initscripts/initscripts_1.0.bb
> index 5951e0c..d1644a3 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -42,8 +42,12 @@ KERNEL_VERSION =3D ""
>  inherit update-alternatives
>  DEPENDS_append =3D " update-rc.d-native"
> =20
> -ALTERNATIVE_PRIORITY =3D "90"
> -ALTERNATIVE_${PN} =3D "functions"
> +PACKAGES =3D+ "${PN}-functions"
> +RDEPENDS_${PN} =3D "${PN}-functions"
> +FILES_${PN}-functions =3D "${sysconfdir}/init.d/functions*"
> +
> +ALTERNATIVE_PRIORITY_${PN}-functions =3D "90"
> +ALTERNATIVE_${PN}-functions =3D "functions"
>  ALTERNATIVE_LINK_NAME[functions] =3D "${sysconfdir}/init.d/functions"
> =20
>  HALTARGS ?=3D "-d -f"
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xGZLEhdrcEmdnWHc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLOjesACgkQN1Ujt2V2gBz6RwCaAl6bX07qhZayJt1vA1mBQ54S
oK0Anis0vJEJBjftRSnf8J60uBaFu/WG
=lpay
-----END PGP SIGNATURE-----

--xGZLEhdrcEmdnWHc--
