Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 521046E446
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 10:14:54 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x12so3233563wgg.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 03:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HwqhwrQXUOJ9nqKV5fSm+aIc9w5djvUcAZkJ3hE5rHc=;
	b=Li/WjwDQ5qV9fNsqoQOHdw7kpJzClnTqizRpMSvYWbVMhz650QWa2VKqUI8CoPU4Y/
	H2NRANcU4qPTAiAA0nmjkd23vZN4/oRL1DfS8Pxt0zaxqh+MuEXIEqaHz1PKnWaX43ue
	ryy+v7VXc0OeWY2xLmR5W/8iH7Y8p6RaCgOiJisueq5h7Ym7IUSise22zq1X4rQ3CklX
	sybEKUwyDrdYYr2wfngp1epMayoPgafU3BhSNqnh8Ych+s9Sm/5sqj4AbSKJL6T+zllY
	gbRiLdMD4tltSXzdFoXlYK6+uqyXd1CybNbXG4GTJTsjiEBRhq/I3WRYtmWaUPGNtb5X
	1S0w==
X-Received: by 10.194.119.168 with SMTP id kv8mr18476649wjb.41.1396606495002; 
	Fri, 04 Apr 2014 03:14:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm18539737eeg.8.2014.04.04.03.14.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Apr 2014 03:14:53 -0700 (PDT)
Date: Fri, 4 Apr 2014 12:14:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
Message-ID: <20140404101456.GI2132@jama>
References: <1396601617-29638-1-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1396601617-29638-1-git-send-email-koen.kooi@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] dbus: split dbus-launch out into its own package (again)
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
X-List-Received-Date: Fri, 04 Apr 2014 10:14:58 -0000
X-Groupsio-MsgNum: 52152
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h22Fi9ANawrtbNPX"
Content-Disposition: inline

--h22Fi9ANawrtbNPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2014 at 10:53:37AM +0200, Koen Kooi wrote:
> When installing 'dbus-1' it will drag in X11 libs due to ${bindir}/dbus-l=
aunch being in ${PN}. Move it to a seperate package to be able to generate =
a small filesystem (e.g. initrd) without X11 libs without needed a seperate=
 DISTRO.conf.
>=20
> There will be no functional changes for existing image and packagegroup r=
ecipes since ${PN} has 'dbus-launch' in RRECOMMENDS. So to filter out dbus-=
launch you need to add it to BAD_RECOMMENDATIONS in the image recipe.
>=20
> This is in essence a revert of:
>=20
> 	commit c02364f36e228835ea5d7fd4e1d347fd451f8544
> 	Author: Radu Moisan <radu.moisan@intel.com>
> 	Date:   Tue Jul 31 09:23:23 2012 +0300
>=20
> 	    dbus: include dbus-launch in the main dbus package
>=20
> But as pointed out above, ${bindir}/dbus-launch will end up in the rootfs=
 as before, so the issue behind c02364f36e228835ea5d7fd4e1d347fd451f8544 of=
 a missing ${bindir}/dbus-launch won't suddenly pop up.
>=20
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>=20
> I've boot tested this both with BAD_RECOMMENDATIONS and without and it se=
ems to work as intended. The big question is how to address the dbus-x11 (R=
)PROVIDE entries. I feel 'dbus-launch' is a much better name than 'dbus-x11=
', but I don't mind respinning this patch with 'dbus-x11'.
>=20
>=20
>  meta/recipes-core/dbus/dbus.inc | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbu=
s.inc
> index 677ff78..28074be 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -37,7 +37,7 @@ CONFFILES_${PN} =3D "${sysconfdir}/dbus-1/system.conf $=
{sysconfdir}/dbus-1/session
> =20
>  DEBIANNAME_${PN} =3D "dbus-1"
> =20
> -PACKAGES =3D+ "${PN}-lib"
> +PACKAGES =3D+ "${PN}-lib dbus-launch"
> =20
>  OLDPKGNAME =3D "dbus-x11"
>  OLDPKGNAME_class-nativesdk =3D ""
> @@ -51,15 +51,20 @@ FILES_${PN} =3D "${bindir}/dbus-daemon* \
>                 ${bindir}/dbus-cleanup-sockets \
>                 ${bindir}/dbus-send \
>                 ${bindir}/dbus-monitor \
> -               ${bindir}/dbus-launch \
>                 ${libexecdir}/dbus* \
>                 ${sysconfdir} \
>                 ${localstatedir} \
>                 ${datadir}/dbus-1/services \
>                 ${datadir}/dbus-1/system-services \
>                 ${systemd_unitdir}/system/"
> +
>  FILES_${PN}-lib =3D "${libdir}/lib*.so.*"
>  RRECOMMENDS_${PN}-lib =3D "${PN}"
> +
> +FILES_dbus-launch =3D "${bindir}/dbus-launch"
> +RDEPENDS__dbus-launch =3D "${PN}"
> +RRECOMMENDS_${PN} +=3D "dbus-launch"

Is there special reason for not using ${PN}-launch?

There is extra underscore in RDEPENDS.

> +
>  FILES_${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-too=
l"
> =20
>  pkg_postinst_dbus() {
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h22Fi9ANawrtbNPX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM+hiAACgkQN1Ujt2V2gBxATACgibW1H/ljsEWgP5pLNBdQWVyd
bxQAnjathtsLNWEgnpaOPUEWOBCec0bn
=aDTr
-----END PGP SIGNATURE-----

--h22Fi9ANawrtbNPX--
