Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.1253.1612467840898374962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 11:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=awawVNEq;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1612467841;
  x=1644003841;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=r8nVXGZ7aBAavo6v0LnblwITCHr5yE1tg8GKJpM6jj4=;
  b=awawVNEqOdpWrUo3t/qY+fUxLoo7QUxANuwYquEnCY7pIzRASy5wMyDN
   7wF0F8M6oyfY6YJQDTZRPiCrMmOpDgWcPlYB/ZSE4c58OGAqFX2HBR4gH
   RatMqo9HJ9Kt/ShoUf8Ky21gdoOEDAi2DW4YdVaflJepzMdbVYUR2GYRI
   l3hTGctG2peK7KPmdvfHHbWbdxt6nPRi0CmlfLpdOTwvraG61QeaEu1tp
   AtaLnoyXxfX0ln/4ILYgup5WSTmY4+ve2Gn4TNxQbEilixC4zH8a93k0o
   zO2bxOLKs3iDvpJS0ffgrhITE9/Dd8huqHLKLEV/2V18wuthqqpv1nVP5
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
Thread-Topic: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
Thread-Index: AQHW9NHY825Iww0Iv0OXP6ZzRmB8MqpIcGNw
Date: Thu, 4 Feb 2021 19:43:58 +0000
Message-ID: <19078ab047664bb995906baf0a36a54c@XBOX03.axis.com>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
 <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 27 januari 2021 18:28
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
>=20
> Native recipes have been special and they don't have packages generated
> from them. The RDEPENDS/RPROVIDES and other runtime package specific
> variables can contain important data about dependencies recipes need
> though and currently it is required to write this information explicitly
> in the native case.
>=20
> We now delete the packaging tasks for native recipes which removes the
> need to clear PACKAGES. The next step to improve the metadata is to
> stop clearing it and ensure any entries in these variables are remapped
> appropriately. The R* variables were already being processed by the class
> extension code but the implementation was suboptimal.
>=20
> This patch stops clearing PACKAGES and PACKAGES_DYNAMIC and fixes the
> places
> where that caused issues in OE-Core, for example PACKAGES additions in
> anonymous
> python without the "-native" suffix and a case where the included classes
> caused a self reference in DEPENDS which would once have been removed by
> the previous code.
>=20
> The implementation uses datastore/parser parameters to ensure that the
> variable overrides are not overwritten when calling setVar which is
> appropriate
> for a function as close to the core as this one is.
>=20
> Some now unneeded code in python3-setuptools is dropped, there are
> further
> changes like this which can follow.
>=20
> This change was verified with OE-Core by comparing task-depends.dot
> generated
> by "bitbake world -g" before and after the change, the files were
> identical.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/native.bbclass                   | 23 ++++++++-----------
>  .../python/python3-setuptools_51.0.0.bb       |  5 ----
>  .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |  1 +
>  meta/recipes-support/boost/boost.inc          |  3 +++
>  4 files changed, 13 insertions(+), 19 deletions(-)
>=20

[cut]

> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/re=
cipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> index 16708fd581d..226e1c7b89f 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c \
>  SECTION =3D "libs"
>=20
>  DEPENDS =3D "glib-2.0 gdk-pixbuf-native shared-mime-info"
> +DEPENDS_remove_class-native =3D "gdk-pixbuf-native"

Given that I know you want to avoid using _remove in OE-Core, is there=20
any reason to not write this as:

DEPENDS =3D "glib-2.0 shared-mime-info"
DEPENDS_append_class-target =3D " gdk-pixbuf-native"
DEPENDS_append_class-nativesdk =3D " gdk-pixbuf-native"

(I'm not sure the append for nativesdk should be there, but I added it=20
to match the original code.)

>=20
>  MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>=20

//Peter

