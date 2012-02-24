Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0uSS-0000in-6A
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 13:41:08 +0100
Received: by eaal10 with SMTP id l10so1094409eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 04:32:45 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.97.131 as permitted sender) client-ip=10.14.97.131; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.97.131 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.97.131])
	by 10.14.97.131 with SMTP id t3mr1442295eef.3.1330086765937 (num_hops =
	1); Fri, 24 Feb 2012 04:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P8cn2BasESQlADD8HyOhA3V1FRaBQdz7O+skMRCW6Tk=;
	b=QZ1ZwNO6VPBR/Mpqi6EaZkInKK783ili3cq2aEvUTrRYd95ZNJ9TQtyzTo5hm4xY7V
	2XJzot9qeB3pQnMd2P+ahlhXXH3RUexKgwLjEH/8mTvwUSAvMXZW36I02TevOp4Kp09o
	2e/JFkb0+dYcjULSm+76FJqjenRS0BZwWB4Gw=
Received: by 10.14.97.131 with SMTP id t3mr1093593eef.3.1330086765831;
	Fri, 24 Feb 2012 04:32:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm17703052eea.5.2012.02.24.04.32.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 04:32:44 -0800 (PST)
Date: Fri, 24 Feb 2012 13:32:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120224123243.GJ3769@jama.jama.net>
References: <20120214230044.GB3914@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120214230044.GB3914@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: DEPENDS not extended to -native for BBCLASSEXTENDS when added by PACKAGECONFIG
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
X-List-Received-Date: Fri, 24 Feb 2012 12:41:08 -0000
X-Groupsio-MsgNum: 17898
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jcZk2Ix8j3PVOBnV"
Content-Disposition: inline

--jcZk2Ix8j3PVOBnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2012 at 12:00:44AM +0100, Martin Jansa wrote:
> oe-core gtk+ has:
>=20
> X11DEPENDS =3D "virtual/libx11 libxext libxcursor libxrandr libxdamage li=
bxrender libxcomposite"
> DEPENDS =3D "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-nat=
ive docbook-utils-native \
>  libgcrypt cairo gdk-pixbuf"
> PACKAGECONFIG[x11] =3D "--with-x=3Dyes --with-gdktarget=3Dx11,--with-x=3D=
no,${X11DEPENDS}"
>=20
> meta-oe adds BBCLASSEXTEND =3D "native"
> because gtk+-native-2* is needed for gtk+3 to build:
> http://git.openembedded.org/meta-openembedded/commit/?id=3Da4155ac38dce21=
4cbb59f6243b29ca3df76e0d29
>=20
> I would expect that all dependencies added by x11 PACKAGECONFIG will be e=
xpanded=20
> to -native variants like for every other dependency, but it's not true:
>=20
> gtk-native.env:X11DEPENDS=3D"virtual/libx11 libxext libxcursor libxrandr =
libxdamage libxrender libxcomposite"
> gtk-native.env:# DEPENDS=3Dpkgconfig-native ${@autotools_dep_prepend(d)}$=
{BASEDEPENDS} glib-2.0-native pango-native atk-native jpeg-native libpng-na=
tive gtk-doc-native gdk-pixbuf-native docbook-utils-native libgcrypt-native=
 cairo-native gdk-pixbuf-native ${X11DEPENDS}
> gtk-gative.env:DEPENDS=3D"pkgconfig-native autoconf-native automake-nativ=
e libtool-native gnu-config-native  glib-2.0-native pango-native atk-native=
 jpeg-native libpng-native gtk-doc-native gdk-pixbuf-native docbook-utils-n=
ative libgcrypt-native cairo-native gdk-pixbuf-native virtual/libx11 libxex=
t libxcursor libxrandr libxdamage libxrender libxcomposite"
>=20
> gtk-target.env:X11DEPENDS=3D"virtual/libx11 libxext libxcursor libxrandr =
libxdamage libxrender libxcomposite"
> gtk-target.env:# DEPENDS=3Dpkgconfig-native ${@autotools_dep_prepend(d)}$=
{BASEDEPENDS} glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-nati=
ve docbook-utils-native  libgcrypt cairo gdk-pixbuf ${X11DEPENDS}
> gtk-target.env:DEPENDS=3D"pkgconfig-native autoconf-native automake-nativ=
e libtool-native libtool-cross gnu-config-native  virtual/arm-oe-linux-gnue=
abi-gcc virtual/arm-oe-linux-gnueabi-compilerlibs virtual/libc  glib-2.0 pa=
ngo atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native  =
libgcrypt cairo gdk-pixbuf virtual/libx11 libxext libxcursor libxrandr libx=
damage libxrender libxcomposite"
>=20
> And gtk+-native builds fails to configure because of missing libxrender-n=
ative (libx11-native is built by something else probably).
>=20
> configure:23318: checking for XOpenDisplay
> configure:23318: gcc -o conftest -DGDK_PIXBUF_DISABLE_DEPRECATED -isystem=
/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/include -O2 -pipe -Wall -isystem/var/lib/jenkins/jobs/shr-core/=
workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include -DG_DISABLE=
_SINGLE_INCLUDES -DATK_DISABLE_SINGLE_INCLUDES -DGDK_PIXBUF_DISABLE_SINGLE_=
INCLUDES -DGTK_DISABLE_SINGLE_INCLUDES  -L/var/lib/jenkins/jobs/shr-core/wo=
rkspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -L/var/lib/jenkin=
s/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl=
,-rpath-link,/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/s=
ysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/var/lib/jenkins/jobs/shr-core=
/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-rpath,/var/li=
b/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux=
/usr/lib -Wl,-rpath,/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-e=
glibc/sysroots/x86_64-linux/lib -Wl,-O1 conftest.c  -lXext -lXrender -lX11 =
   >&5
> /usr/bin/ld: cannot find -lXrender
> collect2: ld returned 1 exit status
> configure:23318: $? =3D 1
> configure: failed program was:
> ...
> configure:23318: result: no
> configure:23322: error: *** libX11 not found. Check 'config.log' for more=
 details.
>=20
> Regards,

any idea about this? I'm tired of building virtual/libx11-native and
libxrender-native manually after each gtk+-native build error :/.

Yes I can fix it in gtk+ bbappend by repeating
PACKAGECONFIG/DISTRO_FEATURES logic fog DEPENDS_virtclass-native, but
this seems like bug in PACKAGECONFIG handling and could be in more
recipes.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jcZk2Ix8j3PVOBnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9Hg2sACgkQN1Ujt2V2gBwJwQCfVGmSGV9XgSBURCU0arGhPZTG
tHgAnjTTHULdwLtG7q5XdmZ++b5xGR8F
=rSyD
-----END PGP SIGNATURE-----

--jcZk2Ix8j3PVOBnV--
