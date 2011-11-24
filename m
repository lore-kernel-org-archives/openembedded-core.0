Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTT3E-0001e4-4P
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 07:44:52 +0100
Received: by wwo1 with SMTP id 1so2685695wwo.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 22:38:19 -0800 (PST)
Received: by 10.180.5.234 with SMTP id v10mr27204923wiv.44.1322116699243;
	Wed, 23 Nov 2011 22:38:19 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bl10sm9034389wib.15.2011.11.23.22.38.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 22:38:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 24 Nov 2011 07:38:13 +0100
In-Reply-To: <20d46c74e1c1de68ca86b5b7eded5ae66a142e85.1322102636.git.xiaofeng.yan@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322102636.git.xiaofeng.yan@windriver.com>
	<20d46c74e1c1de68ca86b5b7eded5ae66a142e85.1322102636.git.xiaofeng.yan@windriver.com>
Message-Id: <2C6A2DBB-2756-4475-9BBF-16A2496EB4A3@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 3/9] gtk.inc: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Thu, 24 Nov 2011 06:44:52 -0000
X-Groupsio-MsgNum: 12866
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1416C3C2-AE56-45F0-B34E-35A371ADA20E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1416C3C2-AE56-45F0-B34E-35A371ADA20E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 24 nov. 2011, om 04:06 heeft Xiaofeng Yan het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> gtk run over x11 at current OE-core. If gtk want to run over directfb, =
then \
> the configuration related to x11 should be disabled and directfb =
should be enabled.

Apart from this patch is messing with PACKAGES as well, I still don't =
believe it's true that x11 must be disabled for directfb to work



>=20
> [YOCTO #1674]
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> meta/recipes-gnome/gtk+/gtk+.inc |   20 ++++++++++++++++----
> 1 files changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc =
b/meta/recipes-gnome/gtk+/gtk+.inc
> index 0e5c45c..926f7dd 100644
> --- a/meta/recipes-gnome/gtk+/gtk+.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
> @@ -9,13 +9,20 @@ LICENSE =3D "LGPLv2 & LGPLv2+ & LGPLv2.1+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f7e7"
>=20
> SECTION =3D "libs"
> -DEPENDS =3D "glib-2.0 pango atk jpeg libpng libxext libxcursor \
> -           gtk-doc-native docbook-utils-native libxrandr libgcrypt \
> -           libxdamage libxrender libxcomposite cairo gdk-pixbuf"
> +X11DEPENDS =3D "virtual/libx11 libxext libxcursor libxrandr =
libxdamage libxrender libxcomposite"
> +
> +DEPENDS =3D "glib-2.0 pango atk jpeg libpng gtk-doc-native =
gdk-pixbuf-native docbook-utils-native \
> +           libgcrypt cairo gdk-pixbuf"
> +
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', =
'x11', '', d)} \
> +           ${@base_contains('DISTRO_FEATURES', 'directfb', =
'directfb', '', d)}"
> +
> +PACKAGECONFIG[x11] =3D "--with-x=3Dyes =
--with-gdktarget=3Dx11,--with-x=3Dno,${X11DEPENDS}"
> +PACKAGECONFIG[directfb] =3D "--with-gdktarget=3Ddirectfb,,directfb"
>=20
> inherit autotools pkgconfig
>=20
> -PACKAGES +=3D "libgail"
> +PACKAGES +=3D "libgail gtk-demo"
>=20
> FILES_${PN} =3D "${bindir}/gtk-update-icon-cache \
> 	${bindir}/gtk-query-immodules-2.0 \
> @@ -40,6 +47,11 @@ FILES_${PN}-dbg +=3D " \
> 	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
> 	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
>=20
> +FILES_gtk-demo =3D " \
> +        ${datadir}/gtk-2.0/demo/* \
> +        ${bindir}/gtk-demo \
> +        "
> +
> FILES_libgail =3D " \
> 	${libdir}/gtk-2.0/modules/libgail.so \
> 	${libdir}/gtk-2.0/modules/libferret.so \
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_1416C3C2-AE56-45F0-B34E-35A371ADA20E
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7N5lgACgkQMkyGM64RGpFpegCglqcTxGvnvXyLQbPCG2tvP7gW
cEkAn0f5eSHLgubW7Lfr3Q+WxyvOYkdU
=dadH
-----END PGP SIGNATURE-----

--Apple-Mail=_1416C3C2-AE56-45F0-B34E-35A371ADA20E--
