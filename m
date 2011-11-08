Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RNltI-00040e-Kk
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 14:39:04 +0100
Received: by wwf4 with SMTP id 4so600675wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 05:32:50 -0800 (PST)
Received: by 10.181.13.82 with SMTP id ew18mr12854280wid.16.1320759170500;
	Tue, 08 Nov 2011 05:32:50 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o8sm860531wiz.12.2011.11.08.05.32.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 05:32:49 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 8 Nov 2011 14:32:43 +0100
In-Reply-To: <1320758312.10843.27.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320750179.git.xiaofeng.yan@windriver.com>
	<9d9675eee33b1f77242db3ecd556c82470696f61.1320750179.git.xiaofeng.yan@windriver.com>
	<1320758312.10843.27.camel@ted>
Message-Id: <A61A980F-D367-4F98-98F8-E413B0F20EA5@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/7] gtk+: Fix bug 1674
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
X-List-Received-Date: Tue, 08 Nov 2011 13:39:04 -0000
X-Groupsio-MsgNum: 12087
Content-Type: multipart/signed;
	boundary="Apple-Mail=_994838E8-F895-43A4-945E-A6CD58136258";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_994838E8-F895-43A4-945E-A6CD58136258
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 8 nov. 2011, om 14:18 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-11-08 at 19:15 +0800, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>>=20
>> [YOCTO #1674]
>> Image "gtk+ over directfb" doesn't need "x11".
>> So I add "directfb" on configuration and gtk-demo to image for check =
\
>> whether image based on gtk+-directfb work successfully.
>>=20
>> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>> ---
>> meta/recipes-gnome/gtk+/gtk+.inc       |   18 ++++++++++++++----
>> meta/recipes-gnome/gtk+/gtk+_2.24.6.bb |   17 ++++++++++++-----
>> 2 files changed, 26 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc =
b/meta/recipes-gnome/gtk+/gtk+.inc
>> index 0e5c45c..6ec5906 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+.inc
>> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
>> @@ -9,13 +9,18 @@ LICENSE =3D "LGPLv2 & LGPLv2+ & LGPLv2.1+"
>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f7e7"
>>=20
>> SECTION =3D "libs"
>> -DEPENDS =3D "glib-2.0 pango atk jpeg libpng libxext libxcursor \
>> -           gtk-doc-native docbook-utils-native libxrandr libgcrypt \
>> -           libxdamage libxrender libxcomposite cairo gdk-pixbuf"
>> +X11DEPENDS =3D "virtual/libx11 libxext libxcursor libxrandr =
libxdamage libxrender libxcomposite"
>> +DIRECTFBDEPENDS =3D "directfb"
>> +
>> +DEPENDS =3D "glib-2.0 pango atk jpeg libpng gtk-doc-native =
gdk-pixbuf-native docbook-utils-native \
>> +           libgcrypt cairo gdk-pixbuf \
>> +           ${@base_contains('DISTRO_FEATURES', 'x11', '', '', d)} \
>> +           ${@base_contains('DISTRO_FEATURES', 'directfb', =
'${DIRECTFBDEPENDS}', '', d)}"
>> +
>>=20
>> inherit autotools pkgconfig
>>=20
>> -PACKAGES +=3D "libgail"
>> +PACKAGES +=3D "libgail gtk+-demo"
>>=20
>> FILES_${PN} =3D "${bindir}/gtk-update-icon-cache \
>> 	${bindir}/gtk-query-immodules-2.0 \
>> @@ -40,6 +45,11 @@ FILES_${PN}-dbg +=3D " \
>> 	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
>> 	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
>>=20
>> +FILES_gtk+-demo =3D " \
>> +        ${datadir}/gtk-2.0/demo/* \
>> +        ${bindir}/gtk-demo \
>> +        "
>> +
>> FILES_libgail =3D " \
>> 	${libdir}/gtk-2.0/modules/libgail.so \
>> 	${libdir}/gtk-2.0/modules/libferret.so \
>> diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb =
b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
>> index 01f4a11..5a9dc5e 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
>> +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
>> @@ -8,7 +8,6 @@ SRC_URI =3D =
"http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
>>            file://xsettings.patch \
>>            file://run-iconcache.patch \
>>            file://hardcoded_libtool.patch \
>> -           file://no-demos.patch \
>>            file://cellrenderer-cairo.patch;striplevel=3D0 \
>>            file://toggle-font.diff;striplevel=3D0 \
>>            =
file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
>> @@ -25,13 +24,21 @@ SRC_URI =3D =
"http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
>> #           file://menu-deactivate.patch
>> #        file://combo-arrow-size.patch;striplevel=3D0
>> #            file://configurefix.patch
>> +#           file://no-demos.patch=20
>>=20
>> -PR =3D "r1"
>> +PR =3D "r2"
>>=20
>> -SRC_URI[md5sum] =3D "421100f6597e613234f8dead6091a9fe"
>> -SRC_URI[sha256sum] =3D =
"6f45bdbf9ea27eb3b5f977d7ee2365dede0d0ce454985680c26e5210163bbf37"
>> +SRC_URI[md5sum] =3D "4e977cb6a4530e9d4fe54d6ba70831c4"
>> +SRC_URI[sha256sum] =3D =
"9aade52339dca563780bca5c83b0fb02284393221bda4f55cb9ec7eae1661a1d"
>> +
>> +CONF_directfb=3D" --with-x=3Dno --with-gdktarget=3Ddirectfb"
>> +CONF_xorg=3D" --with-x=3Dyes --with-gdktarget=3Dx11"
>> +
>> +EXTRA_OECONF =3D "${@base_contains('DISTRO_FEATURES', 'directfb', \
>> + '${CONF_directfb}', '${CONF_xorg}', d)} \
>> + --without-libtiff --without-libjasper --enable-xkb \
>> + --disable-glibtest --disable-cups --disable-xinerama"
>>=20
>> -EXTRA_OECONF =3D "--without-libtiff --without-libjasper --enable-xkb =
--disable-glibtest --disable-cups --disable-xinerama"
>=20
> This is a horrible mess and its just going to get worse. We started
> adding PACKAGECONFIG to try and help with things like this problem.
> Instead of the above you should be able to do something like:
>=20
> PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'directfb', =
'directfb', '', d)} \
>                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', =
'', d)}"
> PACKAGECONFIG[directfb] =3D "--with-gdktarget=3Ddirectfb,,directfb"
> PACKAGECONFIG[x11] =3D "--with-x=3Dyes =
--with-gdktarget=3Dx11,--with-x=3Dno,${X11DEPENDS}"

What happens when I have both directfb and x11 in DISTRO_FEATURES?

regards,

Koen=

--Apple-Mail=_994838E8-F895-43A4-945E-A6CD58136258
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk65L3sACgkQMkyGM64RGpHSQQCfbXMiEq4A6UAG1AGPRIAInwpX
RBAAni4uFObDt/EHBMmM4+Ga+GiQfHb3
=rOYF
-----END PGP SIGNATURE-----

--Apple-Mail=_994838E8-F895-43A4-945E-A6CD58136258--
