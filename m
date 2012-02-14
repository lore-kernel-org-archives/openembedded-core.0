Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RxRUY-0005M0-Ax
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Feb 2012 00:08:58 +0100
Received: by eaal10 with SMTP id l10so139091eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 15:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=cdcYtXpRHXvoI/7VgAjSN/UaCoCJ31Sc51RUid0C4XM=;
	b=n1NWuuj7Dk5tJ9OpnonX2XnS83/4SdAurK30a3QMHauDhFKembcrLEcmBOpIqbeapV
	usqvo1bQuNqO2Zp4qbRgAUeZceub16PJt/y29KqyOjHorKoxzsua9fhV/xYZ8H+D96sj
	W2dzE3aAq8lgG6WAEdL/fC/dNGIIT/tmu4+kQ=
Received: by 10.14.33.212 with SMTP id q60mr7331089eea.114.1329260447288;
	Tue, 14 Feb 2012 15:00:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm3930422eeb.4.2012.02.14.15.00.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Feb 2012 15:00:46 -0800 (PST)
Date: Wed, 15 Feb 2012 00:00:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120214230044.GB3914@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: DEPENDS not extended to -native for BBCLASSEXTENDS when added by PACKAGECONFIG
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
X-List-Received-Date: Tue, 14 Feb 2012 23:08:58 -0000
X-Groupsio-MsgNum: 17520
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline

--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

oe-core gtk+ has:

X11DEPENDS =3D "virtual/libx11 libxext libxcursor libxrandr libxdamage libx=
render libxcomposite"
DEPENDS =3D "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-nativ=
e docbook-utils-native \
 libgcrypt cairo gdk-pixbuf"
PACKAGECONFIG[x11] =3D "--with-x=3Dyes --with-gdktarget=3Dx11,--with-x=3Dno=
,${X11DEPENDS}"

meta-oe adds BBCLASSEXTEND =3D "native"
because gtk+-native-2* is needed for gtk+3 to build:
http://git.openembedded.org/meta-openembedded/commit/?id=3Da4155ac38dce214c=
bb59f6243b29ca3df76e0d29

I would expect that all dependencies added by x11 PACKAGECONFIG will be exp=
anded=20
to -native variants like for every other dependency, but it's not true:

gtk-native.env:X11DEPENDS=3D"virtual/libx11 libxext libxcursor libxrandr li=
bxdamage libxrender libxcomposite"
gtk-native.env:# DEPENDS=3Dpkgconfig-native ${@autotools_dep_prepend(d)}${B=
ASEDEPENDS} glib-2.0-native pango-native atk-native jpeg-native libpng-nati=
ve gtk-doc-native gdk-pixbuf-native docbook-utils-native libgcrypt-native c=
airo-native gdk-pixbuf-native ${X11DEPENDS}
gtk-gative.env:DEPENDS=3D"pkgconfig-native autoconf-native automake-native =
libtool-native gnu-config-native  glib-2.0-native pango-native atk-native j=
peg-native libpng-native gtk-doc-native gdk-pixbuf-native docbook-utils-nat=
ive libgcrypt-native cairo-native gdk-pixbuf-native virtual/libx11 libxext =
libxcursor libxrandr libxdamage libxrender libxcomposite"

gtk-target.env:X11DEPENDS=3D"virtual/libx11 libxext libxcursor libxrandr li=
bxdamage libxrender libxcomposite"
gtk-target.env:# DEPENDS=3Dpkgconfig-native ${@autotools_dep_prepend(d)}${B=
ASEDEPENDS} glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native=
 docbook-utils-native  libgcrypt cairo gdk-pixbuf ${X11DEPENDS}
gtk-target.env:DEPENDS=3D"pkgconfig-native autoconf-native automake-native =
libtool-native libtool-cross gnu-config-native  virtual/arm-oe-linux-gnueab=
i-gcc virtual/arm-oe-linux-gnueabi-compilerlibs virtual/libc  glib-2.0 pang=
o atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native  li=
bgcrypt cairo gdk-pixbuf virtual/libx11 libxext libxcursor libxrandr libxda=
mage libxrender libxcomposite"

And gtk+-native builds fails to configure because of missing libxrender-nat=
ive (libx11-native is built by something else probably).

configure:23318: checking for XOpenDisplay
configure:23318: gcc -o conftest -DGDK_PIXBUF_DISABLE_DEPRECATED -isystem/v=
ar/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-=
linux/usr/include -O2 -pipe -Wall -isystem/var/lib/jenkins/jobs/shr-core/wo=
rkspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include -DG_DISABLE_S=
INGLE_INCLUDES -DATK_DISABLE_SINGLE_INCLUDES -DGDK_PIXBUF_DISABLE_SINGLE_IN=
CLUDES -DGTK_DISABLE_SINGLE_INCLUDES  -L/var/lib/jenkins/jobs/shr-core/work=
space/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -L/var/lib/jenkins/=
jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-=
rpath-link,/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib -Wl,-rpath-link,/var/lib/jenkins/jobs/shr-core/w=
orkspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-rpath,/var/lib/=
jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/u=
sr/lib -Wl,-rpath,/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/lib -Wl,-O1 conftest.c  -lXext -lXrender -lX11   =
 >&5
/usr/bin/ld: cannot find -lXrender
collect2: ld returned 1 exit status
configure:23318: $? =3D 1
configure: failed program was:
=2E..
configure:23318: result: no
configure:23322: error: *** libX11 not found. Check 'config.log' for more d=
etails.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8655wACgkQN1Ujt2V2gBy18gCfQnLH6KWUD0CfA4msJHpvhxUj
wlsAoIzaHeuvYUcFIR0COcKYqZnjI8uj
=jfoi
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
