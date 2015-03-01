Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3E13272D77;
	Sun,  1 Mar 2015 07:36:46 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so8348408wiw.3;
	Sat, 28 Feb 2015 23:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HI9/kt0c4MtsoDrAnBS5mHNTKmZvkG8R8HJpqti+blQ=;
	b=CAv7Rh1zPn0V0GoyTBmGjk5Y7fk9lG7ZjIiVJmUTTj/sitR9vwRADR9yJcVAM+6VNw
	XBs+OrhY1DAg3kkglDxCoNSblFSW1iIa5YOpCTsrVrbUCObBMH3O14lNvaZxi1ONeFwZ
	XN5icykASkpsgv2HHVB0ma6VvOv2oiKSH8Ga7AbOaU3BCwlBCrfQ4FNKYZBu/BZq6dix
	hXm8C8s58exW7sCxOVE25RDG16WsAM2+n9cFETp7jPtkjHc+JSBpIiJgZGOFHh3cEEUK
	EU9r3pjS9fZozrAVQdpGonfHGreKybAp8e4EdZeXjF6qUlVZ4FE4WEwx2KaA8dntFK+4
	yX8g==
X-Received: by 10.180.208.49 with SMTP id mb17mr6210204wic.13.1425195407643;
	Sat, 28 Feb 2015 23:36:47 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g1sm10508852wjy.24.2015.02.28.23.36.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 Feb 2015 23:36:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 1 Mar 2015 08:37:08 +0100
To: openembedded-core@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>
Message-ID: <20150301073708.GS2309@jama>
References: <20150301073455.1C4FA502DD@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150301073455.1C4FA502DD@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Joe MacDonald : libpcap: add pkg-config support
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
X-List-Received-Date: Sun, 01 Mar 2015 07:36:49 -0000
X-Groupsio-MsgNum: 62839
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jesV4P1FjH8FXPjZ"
Content-Disposition: inline

--jesV4P1FjH8FXPjZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 01, 2015 at 07:34:55AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: 0f51c1260ac53aa4843e29b00cd600eb64074260
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D0f51c1260ac53aa4843e29b00cd600eb64074260
>=20
> Author: Joe MacDonald <joe_macdonald@mentor.com>
> Date:   Tue Feb 24 23:39:01 2015 -0500
>=20
> libpcap: add pkg-config support
>=20
> libpcap was not previously installing a pkg-config file.  Add a basic one
> that will allow using 'pkg-config --libs libpcap', for example, in recipes
> rather than 'pcap-config', which frequently returns incorrect information.
>=20
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-connectivity/libpcap/libpcap.inc      |  2 +-
>  .../libpcap/libpcap-pkgconfig-support.patch        | 71 ++++++++++++++++=
++++++
>  meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb |  6 +-
>  3 files changed, 77 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes=
-connectivity/libpcap/libpcap.inc
> index 979665c..0c608b5 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1d4b03665579=
51c84a94fabe3529f867 \
>                      file://pcap.h;beginline=3D1;endline=3D32;md5=3D39af3=
510e011f34b8872f120b1dc31d2"
>  DEPENDS =3D "flex-native bison-native"
> =20
> -inherit bluetooth
> +inherit bluetooth pkgconfig
> =20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, '${BLUEZ}', '', d)}"
>  PACKAGECONFIG[bluez4] =3D "--enable-bluetooth,--disable-bluetooth,bluez4"
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-=
support.patch b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig=
-support.patch
> new file mode 100644
> index 0000000..9cfb9df
> --- /dev/null
> +++ b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support=
=2Epatch
> @@ -0,0 +1,71 @@
> +From 8887132e85892a72a84ca3878e60f254ad2ce939 Mon Sep 17 00:00:00 2001
> +From: Joe MacDonald <joe_macdonald@mentor.com>
> +Date: Tue, 24 Feb 2015 15:56:06 -0500
> +Subject: [PATCH] libpcap: pkgconfig support
> +
> +Adding basic structure to support pkg-config.
> +
> +Upstream-status: Inappropriate [embedded specific]

Is this really embedded specific? It looks like useful patch for
upstream.

> +
> +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> +---
> + Makefile.in   |  5 +++++
> + configure.in  |  1 +
> + libpcap.pc.in | 10 ++++++++++
> + 3 files changed, 16 insertions(+)
> + create mode 100644 libpcap.pc.in
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 1c2d745..1f25faf 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -60,6 +60,10 @@ V_RPATH_OPT =3D @V_RPATH_OPT@
> + DEPENDENCY_CFLAG =3D @DEPENDENCY_CFLAG@
> + PROG=3Dlibpcap
> +=20
> ++# pkgconfig support
> ++pkgconfigdir =3D $(libdir)/pkgconfig
> ++pkgconfig_DATA =3D libpcap.pc
> ++
> + # Standard CFLAGS
> + FULL_CFLAGS =3D $(CCOPT) $(INCLS) $(DEFS) $(CFLAGS)
> +=20
> +@@ -275,6 +279,7 @@ EXTRA_DIST =3D \
> + 	lbl/os-solaris2.h \
> + 	lbl/os-sunos4.h \
> + 	lbl/os-ultrix4.h \
> ++	libpcap.pc \
> + 	missing/snprintf.c \
> + 	mkdep \
> + 	msdos/bin2c.c \
> +diff --git a/configure.in b/configure.in
> +index 8f5c86b..fb51b35 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1700,6 +1700,7 @@ esac
> + AC_PROG_INSTALL
> +=20
> + AC_CONFIG_HEADER(config.h)
> ++AC_CONFIG_FILES([libpcap.pc])
> +=20
> + AC_OUTPUT_COMMANDS([if test -f .devel; then
> + 	echo timestamp > stamp-h
> +diff --git a/libpcap.pc.in b/libpcap.pc.in
> +new file mode 100644
> +index 0000000..4f78ad8
> +--- /dev/null
> ++++ b/libpcap.pc.in
> +@@ -0,0 +1,10 @@
> ++prefix=3D@prefix@
> ++exec_prefix=3D@exec_prefix@
> ++libdir=3D@libdir@
> ++includedir=3D@includedir@
> ++
> ++Name: libpcap
> ++Description: System-independent interface for user-level packet capture.
> ++Version: @VERSION@
> ++Libs: -L${libdir} -lpcap
> ++Cflags: -I${includedir}
> +--=20
> +1.9.1
> +
> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb b/meta/re=
cipes-connectivity/libpcap/libpcap_1.6.2.bb
> index a2d5ef4..611543e 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb
> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb
> @@ -1,6 +1,8 @@
>  require libpcap.inc
> =20
> -SRC_URI +=3D "file://aclocal.patch"
> +SRC_URI +=3D "file://aclocal.patch \
> +            file://libpcap-pkgconfig-support.patch \
> +           "
>  SRC_URI[md5sum] =3D "5f14191c1a684a75532c739c2c4059fa"
>  SRC_URI[sha256sum] =3D "5db3e2998f1eeba2c76da55da5d474248fe19c44f49e15ca=
c8a796a2c7e19690"
> =20
> @@ -19,4 +21,6 @@ do_install_prepend () {
>      install -d ${D}${bindir}
>      oe_runmake install-shared DESTDIR=3D${D}
>      oe_libinstall -a -so libpcap ${D}${libdir}
> +    sed "s|@VERSION@|${PV}|" -i ${B}/libpcap.pc
> +    install -D -m 0644 libpcap.pc ${D}${libdir}/pkgconfig/libpcap.pc
>  }
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jesV4P1FjH8FXPjZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTywaQACgkQN1Ujt2V2gBwZ2wCeLyh5ikrQcVb2ZdSawla7QDEF
rcwAoIoaNh8W12W6twyM5Yq8D4Gl1boM
=Z0Fl
-----END PGP SIGNATURE-----

--jesV4P1FjH8FXPjZ--
