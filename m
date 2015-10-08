Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id BE0C265D6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 17:22:38 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so35319852wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UNjOx1gBmwXQ0wihbxSz7wvf9dLDir+xl6taA1llhuQ=;
	b=c3WOh3YGSF26ztLUoHgzrcgGu2NhzWTO4pl4eEISdYyJcoLKQwSxBB1ds+/ns6MRrK
	awgY8DlwGQgJSk+r6Rc8pks+4ropjON4x35OFk7ujoiNpHsRY8Yxx98uwEUkysh5LI7u
	nA4fVjgm/C8QETJijusuz+5ySwnoQVbcV4ir/OZiJnG9uwPHGd89JeqUnJNkZ4kkvMkO
	hDIN0/N3/CI0uHlEEXehUfU2uzZPocrrwODGKaHldMZHDV3MKL3tgxnNiaOzdwpRBDdK
	otVVW6Vs30q7oNnCPHcYZGPuR+ZQNHbeKuJLQhlcTT3yCGg5JoXgcg8RCW6iSNtTKkCx
	wlvQ==
X-Received: by 10.180.105.138 with SMTP id gm10mr5095451wib.37.1444324958988; 
	Thu, 08 Oct 2015 10:22:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kr10sm47402620wjc.25.2015.10.08.10.22.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 10:22:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 19:22:50 +0200
To: Jens Rehsack <rehsack@gmail.com>
Message-ID: <20151008172250.GM2385@jama>
References: <2D0D4F06-AB53-4200-B729-AB982B4CBB46@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2D0D4F06-AB53-4200-B729-AB982B4CBB46@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] udev: Don't introduce pci dependencies without pci being featured
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
X-List-Received-Date: Thu, 08 Oct 2015 17:22:41 -0000
X-Groupsio-MsgNum: 72018
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QqzFzR/RUlLahzby"
Content-Disposition: inline

--QqzFzR/RUlLahzby
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2015 at 05:26:11PM +0200, Jens Rehsack wrote:
> Fixes that udev always requires PCI, idenpendently from machine or distro=
 features.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-core/udev/udev.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/ude=
v.inc
> index c378ae3..573ecca 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -12,7 +12,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
> =20
>  LDFLAGS +=3D "-lrt"
> =20
> -DEPENDS =3D "glib-2.0 libusb usbutils pciutils glib-2.0-native gperf-nat=
ive libxslt-native util-linux"
> +DEPENDS =3D "glib-2.0 glib-2.0-native gperf-native libxslt-native util-l=
inux"
> +DEPENDS +=3D " ${@base_contains('MACHINE_FEATURES', 'usbhost', 'libusb u=
sbutils', '', d)}"
> +DEPENDS +=3D " ${@base_contains('MACHINE_FEATURES', 'pci', 'pciutils', '=
', d)}"

NAK

udev isn't (and shouldn't be) MACHINE_ARCH, so it cannot use
MACHINE_FEATURES variable.

Please change them to PACKAGECONFIG options and distro can decide to
disable them for all MACHINEs (or at least for whole set of MACHINEs
sharing the same TUNE_PKGARCH)

>  RPROVIDES_${PN} =3D "hotplug"
> =20
>  PROVIDES =3D "libgudev"
> @@ -39,10 +41,6 @@ RDEPENDS_${PN}-ptest +=3D "make perl python"
>  libexecdir =3D "${base_libdir}"
>  EXTRA_OECONF =3D "--disable-introspection \
>                  --with-rootlibdir=3D${base_libdir} \
> -                --with-pci-ids-path=3D${datadir}/pci.ids \
> -                ac_cv_file__usr_share_pci_ids=3Dno \
> -                ac_cv_file__usr_share_hwdata_pci_ids=3Dno \
> -                ac_cv_file__usr_share_misc_pci_ids=3Dyes \
>                  --sbindir=3D${base_sbindir} \
>                  --libexecdir=3D${nonarch_base_libdir} \
>                  --with-rootlibdir=3D${base_libdir} \
> @@ -50,6 +48,8 @@ EXTRA_OECONF =3D "--disable-introspection \
>                  --without-systemdsystemunitdir \
>                 "
> =20
> +EXTRA_OECONF +=3D " ${@base_contains('MACHINE_FEATURES', 'pci', '--with-=
pci-ids-path=3D${datadir}/pci.ids ac_cv_file__usr_share_pci_ids=3Dno ac_cv_=
file__usr_share_hwdata_pci_ids=3Dno ac_cv_file__usr_share_misc_pci_ids=3Dye=
s', '--without-pci-ids-path', d)}"
> +
>  PACKAGES =3D+ "udev-cache"
>  PACKAGES =3D+ "libudev"
>  PACKAGES =3D+ "libgudev"
> --=20
> 2.4.3
>=20
> --=20
> Jens Rehsack - rehsack@gmail.com
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QqzFzR/RUlLahzby
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWpmkACgkQN1Ujt2V2gBy7gACdEsOtM49G8yoQIjonf05y8lsO
zwcAmgOpolRFraN5/nok0l1RiveUvhWL
=w+mT
-----END PGP SIGNATURE-----

--QqzFzR/RUlLahzby--
