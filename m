Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RR0Bg-00060x-Db
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 12:31:24 +0100
Received: by bkbzs2 with SMTP id zs2so1819384bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 03:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+QfbP98JttscwuLWzhCR5vHDOcgXYJIukrEgszyal8Q=;
	b=GNgZTNYEUFBte79E78sN10Ij//cuV84q/QsFyRfaKOSGMwIuIxny3LKYUm4UHIC4LU
	EIRDVPAFZ+UMFnHpans/9rponQwxE5EGTmO4tK/HkprdrEvkPilx4qQM0KnmmqRPEUut
	S9AOLL9fR0Y9EDthTk5lfd5iJ3MIOnMA41W1U=
Received: by 10.205.133.137 with SMTP id hy9mr11563240bkc.134.1321529096767;
	Thu, 17 Nov 2011 03:24:56 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a21sm1814736fao.18.2011.11.17.03.24.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Nov 2011 03:24:55 -0800 (PST)
Date: Thu, 17 Nov 2011 12:24:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111117112444.GC23959@jama.jama.net>
References: <cover.1321527367.git.xiaofeng.yan@windriver.com>
	<782bff85e0ca0cdaa8f4d443719c08f449cfbae8.1321527367.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <782bff85e0ca0cdaa8f4d443719c08f449cfbae8.1321527367.git.xiaofeng.yan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] libx11-trim: update to 1.4.4
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
X-List-Received-Date: Thu, 17 Nov 2011 11:31:24 -0000
X-Groupsio-MsgNum: 12577
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline

--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2011 at 07:00:08PM +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> I remove patch "nodolt.patch" because it is no use in the new version \
> and change patch "include_fix.patch" to "keysymdef_include.patch" from li=
bx11-1.4.4.

Did you forget to add
FILESDIR like libx11-diet does or even FILESEXTRAPATHS, or how should it fi=
nd=20
those files in libx11-1.4.4?

and BTW why is there
libx11-diet-1.4.4/keysymdef_include.patch
libx11-diet-1.4.4/x11_disable_makekeys.patch
when your commit dbb86f8445512f95d9dc3cbbdf935901fe2e04b9
says:
    I remove patch "nodolt.patch" because it is no use in the new version \
    and change patch "include_fix.patch" to "keysymdef_include.patch" from =
libx11-1.4.4.
?

And I would prefer to keep them in libx11-diet-1.4.4/libx11-trim-1.4.4
even when they are the same as libx11-1.4.4 to be able to upgrade libx11
easier then last time.

And last pun to this whole -diet -trim mess:

libx11-diet:
DESCRIPTION +=3D " Support for XCB, UDC, XCMS and XLOCALE is disabled in th=
is version."
EXTRA_OECONF +=3D "--without-xcb --disable-udc --disable-xcms --disable-xlo=
cale --with-keysymdefdir=3D${STAGING_INCDIR}/X11"

libx11-trim:
DESCRIPTION +=3D " Support for XCB, and XCMS is disabled in this version."
EXTRA_OECONF +=3D "--with-keysymdef=3D${STAGING_INCDIR}/X11/keysymdef.h --d=
isable-xcms --with-xcb"

And --without-xcb/--with-xcb doesn't work since 1.4.0:
http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=3D15e5eaf62897b3179d=
1fbe457cb19f886f0449f8
http://git.openembedded.org/openembedded/commit/recipes/xorg-lib/libx11_1.4=
=2E0.bb?id=3Dd28cdb2d2e6c910afbaa14b17bd2c0003052df7d

So it would be better to consolidate -diet -trim versions and don't tell
lies in DESCRIPTION..

Cheers,

>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  .../xorg-lib/libx11-trim-1.3.4/include_fix.patch   |   21 ---------
>  .../libx11-trim-1.3.4/makekeys_crosscompile.patch  |   45 --------------=
------
>  .../xorg-lib/libx11-trim-1.3.4/nodolt.patch        |   12 -----
>  .../libx11-trim-1.3.4/x11_disable_makekeys.patch   |   33 --------------
>  .../{libx11-trim_1.3.4.bb =3D> libx11-trim_1.4.4.bb} |    7 +--
>  5 files changed, 3 insertions(+), 115 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/incl=
ude_fix.patch
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/make=
keys_crosscompile.patch
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodo=
lt.patch
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_=
disable_makekeys.patch
>  rename meta/recipes-graphics/xorg-lib/{libx11-trim_1.3.4.bb =3D> libx11-=
trim_1.4.4.bb} (78%)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix=
=2Epatch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.pat=
ch
> deleted file mode 100644
> index eeb4175..0000000
> --- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ----
> - configure.ac |    6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> ---- libX11-1.3.4.orig/configure.ac
> -+++ libX11-1.3.4/configure.ac
> -@@ -353,9 +353,9 @@
> - #
> - # Find keysymdef.h
> - #
> --AC_MSG_CHECKING([keysymdef.h])
> --dir=3D`$PKG_CONFIG --variable=3Dincludedir xproto`
> --KEYSYMDEF=3D"$dir/X11/keysymdef.h"
> -+AC_ARG_WITH(keysymdef,
> -+	AC_HELP_STRING([--with-keysymdef=3DDIR/keysymdef.h], [The location of =
keysymdef.h]),
> -+	KEYSYMDEF=3D$withval, KEYSYMDEF=3D"")
> - if test -f "$KEYSYMDEF"; then
> -         AC_MSG_RESULT([$KEYSYMDEF])
> - else
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/makekeys_cr=
osscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/makekey=
s_crosscompile.patch
> deleted file mode 100644
> index e5eacf0..0000000
> --- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/makekeys_crosscomp=
ile.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Because the size of "unsigned long" is different between 32-bit
> -and 64-bit, judge whether target is 32-bit or 64-bit and tell
> -"makekey".=20
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: dbuitenh@windriver.com
> -
> ---- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.000000000 =
+0800
> -+++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0800
> -@@ -33,6 +33,7 @@
> - #include <X11/keysymdef.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> -+#include <stdint.h>
> -=20
> - typedef unsigned long Signature;
> -=20
> -@@ -124,7 +125,12 @@
> - 	    name =3D info[i].name;
> - 	    sig =3D 0;
> - 	    while ((c =3D *name++))
> --		sig =3D (sig << 1) + c;
> -+#ifdef USE32
> -+		sig =3D (uint32_t)(sig << 1) + c;
> -+#else
> -+		sig =3D (uint64_t)(sig << 1) + c;
> -+#endif
> -+	=09
> - 	    first =3D j =3D sig % z;
> - 	    for (k =3D 0; tab[j]; k++) {
> - 		j +=3D first + 1;
> -@@ -163,7 +169,11 @@
> - 	name =3D info[i].name;
> - 	sig =3D 0;
> - 	while ((c =3D *name++))
> --	    sig =3D (sig << 1) + c;
> -+#ifdef USE32
> -+	    sig =3D (uint32_t)(sig << 1) + c;
> -+#else
> -+	    sig =3D (uint64_t)(sig << 1) + c;
> -+#endif
> - 	first =3D j =3D sig % z;
> - 	while (offsets[j]) {
> - 	    j +=3D first + 1;
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodolt.patc=
h b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodolt.patch
> deleted file mode 100644
> index bf6c7d5..0000000
> --- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodolt.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- libX11-1.3.4.orig/configure.ac
> -+++ libX11-1.3.4/configure.ac
> -@@ -32,7 +32,6 @@
> -=20
> - # Checks for programs.
> - AC_PROG_LIBTOOL
> --DOLT
> - AC_PROG_CC
> - PKG_PROG_PKG_CONFIG
> -=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_disable=
_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_disa=
ble_makekeys.patch
> deleted file mode 100644
> index 561b577..0000000
> --- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_disable_makeke=
ys.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ----
> - src/util/Makefile.am |   21 -----------------
> - 1 file changed, 21 deletions(-)
> -
> ---- libX11-1.3.4.orig/src/util/Makefile.am
> -+++ libX11-1.3.4/src/util/Makefile.am
> -@@ -1,24 +1,3 @@
> -=20
> --noinst_PROGRAMS=3Dmakekeys
> --
> --makekeys_CFLAGS =3D \
> --	$(X11_CFLAGS) \
> --	$(CWARNFLAGS)
> --
> --CC =3D @CC_FOR_BUILD@
> --CPPFLAGS =3D @CPPFLAGS_FOR_BUILD@
> --CFLAGS =3D @CFLAGS_FOR_BUILD@
> --LDFLAGS =3D @LDFLAGS_FOR_BUILD@
> --
> - EXTRA_DIST =3D mkks.sh
> -=20
> --if LINT
> --# Check source code with tools like lint & sparse
> --
> --ALL_LINT_FLAGS=3D$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
> --		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
> --
> --lint:
> --	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
> --
> --endif LINT
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb b/meta/r=
ecipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
> similarity index 78%
> rename from meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
> rename to meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
> index 3a8f2c4..81fb63b 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
> @@ -3,15 +3,14 @@ require libx11.inc
>  DESCRIPTION +=3D " Support for XCB, and XCMS is disabled in this version=
=2E"
> =20
>  LICENSE =3D "MIT & MIT-style & BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbf75bfe4d05068311b5e6862d4b5f=
2c5"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D172255dee66bb0151435b2d5d709f=
cf7"
> =20
> -PR =3D "r2"
> +PR =3D "r0"
> =20
>  DEPENDS +=3D "libxcb xproto xextproto xtrans libxau kbproto inputproto x=
f86bigfontproto xproto-native"
> =20
>  SRC_URI +=3D "file://x11_disable_makekeys.patch \
> -            file://include_fix.patch \
> -            file://nodolt.patch \
> +            file://keysymdef_include.patch \
>              file://makekeys_crosscompile.patch"
> =20
>  SRC_URI[md5sum] =3D "f65c9c7ecbfb64c19dbd7927160d63fd"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7E7vwACgkQN1Ujt2V2gByqkgCfS3BJSz340g8MiDAbZYDw+0IT
5UYAnA8+CoT6yF1Ep/70EdpmNbQ34X5o
=LAQa
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
