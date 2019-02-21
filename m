Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2DFA71BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 23:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4960418606;
	Fri, 22 Feb 2019 00:46:05 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id mOKxDkeyKx9a; Fri, 22 Feb 2019 00:46:03 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id B464D1832D;
	Fri, 22 Feb 2019 00:46:03 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 950361A067;
	Fri, 22 Feb 2019 00:46:03 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89CDC1A062;
	Fri, 22 Feb 2019 00:46:03 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 22 Feb 2019 00:46:03 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 7DCB51EDE;
	Fri, 22 Feb 2019 00:46:03 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 22 Feb 2019 00:46:03 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Fri, 22 Feb 2019 00:46:03 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Anuj Mittal <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] glib-networking: upgrade 2.54.1 -> 2.58.0
Thread-Index: AQHUyOvCCR4DDBy3dE+snywzQFT/VKXq1vsw
Date: Thu, 21 Feb 2019 23:46:03 +0000
Message-ID: <0414b3b6a2c7404883f691c4198b8007@XBOX04.axis.com>
References: <20190220071247.3758-1-anuj.mittal@intel.com>
	<20190220071247.3758-2-anuj.mittal@intel.com>
In-Reply-To: <20190220071247.3758-2-anuj.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 2/2] glib-networking: upgrade 2.54.1 -> 2.58.0
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
X-List-Received-Date: Thu, 21 Feb 2019 23:46:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This does not build any more if USE_NLS =3D "no" is used. Has anyone=20
looked at making this work together with meson? Otherwise I guess=20
there is trouble ahead now that more and more packages are being=20
converted to use meson, since the code in gettext.bbclass currently=20
only supports autotools. A quick look at meson's i18n.py module does=20
not indicate that there is any easy way to disable the gettext=20
support, corresponding to autotools' --disable-nls. Apparently it=20
was discussed in https://github.com/mesonbuild/meson/issues/821, but=20
it seems they only added detection of the gettext tools without=20
adding support for disabling gettext and then closed the issue.

Looking at 1d6648102 (json-glib: fix native build), it seems Ross=20
encountered a similar problem for json-glib and opted to workaround=20
the problem by overriding USE_NLS. However, that does not seem like=20
a long term solution...

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Anuj Mittal
> Sent: den 20 februari 2019 08:13
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/2] glib-networking: upgrade 2.54.1 ->
> 2.58.0
>=20
> * Autotools support has been removed upstream, so migrate recipe to
> meson. For changes, see:
> https://gitlab.gnome.org/GNOME/glib-networking/blob/glib-2-58/NEWS
>=20
> * Remove unsupported configure options: pkcs11, ca-certificates. See:
> https://bugzilla.gnome.org/show_bug.cgi?id=3D793281
> https://bugzilla.gnome.org/show_bug.cgi?id=3D753260
>=20
> License-Update: Change to LGPLv2.1
>=20
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  ...ng_2.54.1.bb =3D> glib-networking_2.58.0.bb} | 26 ++++++++++---------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>  rename meta/recipes-core/glib-networking/{glib-networking_2.54.1.bb =3D>
> glib-networking_2.58.0.bb} (40%)
>=20
> diff --git a/meta/recipes-core/glib-networking/glib-
> networking_2.54.1.bb b/meta/recipes-core/glib-networking/glib-
> networking_2.58.0.bb
> similarity index 40%
> rename from meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
> rename to meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> index 5d17a824f0..f3190e1cae 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> @@ -3,27 +3,29 @@ DESCRIPTION =3D "glib-networking contains the
> implementations of certain GLib netw
>  HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/glib-networking/"
>  BUGTRACKER =3D "http://bugzilla.gnome.org"
>=20
> -LICENSE =3D "LGPLv2"
> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c"
>=20
>  SECTION =3D "libs"
>  DEPENDS =3D "glib-2.0"
>=20
> -SRC_URI[archive.md5sum] =3D "99867463f182c2767bce0c74bc9cc981"
> -SRC_URI[archive.sha256sum] =3D
> "eaa787b653015a0de31c928e9a17eb57b4ce23c8cf6f277afaec0d685335012f"
> +SRC_URI[archive.md5sum] =3D "75b14b7e73a67753be9ce307751c661d"
> +SRC_URI[archive.sha256sum] =3D
> "bdfa0255e031b8ee003cc283002536b77ee76450105f1dc6ab066b9bf4330068"
>=20
> -PACKAGECONFIG ??=3D "ca-certificates gnutls"
> +PACKAGECONFIG ??=3D "gnutls"
>=20
> -# No explicit dependency as it works without ca-certificates installed
> -PACKAGECONFIG[ca-certificates] =3D "--with-ca-
> certificates=3D${sysconfdir}/ssl/certs/ca-certificates.crt,--without-ca-
> certificates"
> -PACKAGECONFIG[gnutls] =3D "--with-gnutls,--without-gnutls,gnutls"
> -PACKAGECONFIG[libproxy] =3D "--with-libproxy,--without-
> libproxy,libproxy"
> -PACKAGECONFIG[pkcs11] =3D "--with-pkcs11,--without-pkcs11,p11-kit"
> +PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
> +PACKAGECONFIG[libproxy] =3D "-Dlibproxy_support=3Dtrue,-
> Dlibproxy_support=3Dfalse,libproxy"
>=20
> -EXTRA_OECONF =3D "--without-gnome-proxy"
> +EXTRA_OEMESON =3D "-Dgnome_proxy_support=3Dfalse"
>=20
> +GNOMEBASEBUILDCLASS =3D "meson"
>  inherit gnomebase gettext upstream-version-is-even gio-module-cache
>=20
> -FILES_${PN} +=3D "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-
> 1/services/"
> +FILES_${PN} +=3D "\
> +                ${libdir}/gio/modules/libgio*.so \
> +                ${datadir}/dbus-1/services/ \
> +                ${systemd_user_unitdir} \
> +                "
>  FILES_${PN}-dev +=3D "${libdir}/gio/modules/libgio*.la"
>  FILES_${PN}-staticdev +=3D "${libdir}/gio/modules/libgio*.a"
> --
> 2.17.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

