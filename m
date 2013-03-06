Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UD8Ad-0005IQ-Jw; Wed, 06 Mar 2013 07:49:48 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so5497980pbc.21
	for <multiple recipients>; Tue, 05 Mar 2013 22:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ZMHRe2wtejoy5aOrm4oaTZ0EOkoR3sSVewYwecasUqA=;
	b=cqCyJbyhpZEQhF1dCFtT0Ig1EvuYaJJf9nHD247739Ak2ixABnpj/JJfCJMo+fR/SL
	avYlwB+3jndSSHRWPKvGLAtoCQP9sbVdmfOUA+CULGrUPgNvjrg6ZVmBboCNBb338N7l
	fTu78AOwuZEOkWwlLC8fZJNOVS4oareIyOvCkm/jnjZ7Pnhvi/LAZ0ldKcLhixnSpJlh
	vCWrKsBeY7n7FFwu7CQEpubKkP4zQv9oqRjj9IlkGNQr/NsPmb1AEiNqZnkzdRdxuhnw
	UwbiZi336cU1fy+lGROxFSU7JLMzVqU1fRVpGwrkSqbzMlPVROaEGjSsaQu0+rGuSwYy
	gRAA==
X-Received: by 10.68.232.162 with SMTP id tp2mr3505962pbc.192.1362551596362;
	Tue, 05 Mar 2013 22:33:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pn9sm29954911pbb.22.2013.03.05.22.33.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Mar 2013 22:33:15 -0800 (PST)
Date: Wed, 6 Mar 2013 07:33:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Message-ID: <20130306063306.GA32228@jama.dyndns-home.com>
References: <20130211144549.D91302057@opal>
MIME-Version: 1.0
In-Reply-To: <20130211144549.D91302057@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : update-rc.d: don't do anything if systemd. bbclass is inherited
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
X-List-Received-Date: Wed, 06 Mar 2013 06:49:49 -0000
X-Groupsio-MsgNum: 36276
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2013 at 02:45:49PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 0273a22fec3c9360df2510b759c5bf9af610551f
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D0273a22fec3c9360df2510b759c5bf9af610551f
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Fri Feb  8 22:43:16 2013 +0000
>=20
> update-rc.d: don't do anything if systemd.bbclass is inherited
>=20
> We need the update-rc.d class to work when systemd is being used so that
> packages that only have SysV init scripts still work.  However if a recipe
> supports both we don't want to install SysV and systemd files under syste=
md.
>=20
> To solve this, before doing real work in update-rc.d check if the systemd=
 class
> has been inherited and don't do anything if it has.

Does not work very well in current dbus recipe:

Configuring dbus-1.
update-rc.d: /etc/init.d/dbus-1: file does not exist
Collected errors:
 * pkg_run_script: package "dbus-1" postinst script returned status 1.
 * opkg_configure: dbus-1.postinst returned 1.

dbus installs sysvinit script only when sysvinit is in DISTRO_FEATURES
but update-rc.d is kept enabled because dbus does not inherit systemd

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/update-rc.d.bbclass |   19 +++++++++++--------
>  1 files changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.=
bbclass
> index f9d55fb..51ad8b1 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -75,12 +75,15 @@ python populate_packages_updatercd () {
>          postrm +=3D d.getVar('updatercd_postrm', True)
>          d.setVar('pkg_postrm_%s' % pkg, postrm)
> =20
> -    pkgs =3D d.getVar('INITSCRIPT_PACKAGES', True)
> -    if pkgs =3D=3D None:
> -        pkgs =3D d.getVar('UPDATERCPN', True)
> -        packages =3D (d.getVar('PACKAGES', True) or "").split()
> -        if not pkgs in packages and packages !=3D []:
> -            pkgs =3D packages[0]
> -    for pkg in pkgs.split():
> -        update_rcd_package(pkg)
> +    # If the systemd class has also been inherited, then don't do anythi=
ng as
> +    # the systemd units will override anything created by update-rc.d.
> +    if not d.getVar("SYSTEMD_BBCLASS_ENABLED", True):
> +        pkgs =3D d.getVar('INITSCRIPT_PACKAGES', True)
> +        if pkgs =3D=3D None:
> +            pkgs =3D d.getVar('UPDATERCPN', True)
> +            packages =3D (d.getVar('PACKAGES', True) or "").split()
> +            if not pkgs in packages and packages !=3D []:
> +                pkgs =3D packages[0]
> +        for pkg in pkgs.split():
> +            update_rcd_package(pkg)
>  }
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE24yIACgkQN1Ujt2V2gBwhCACfeJhyTPG991F9jppUPTxMvW38
vSgAn1Nqc4VgbBpst5B5eZH88uYB+uEH
=A9Au
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
