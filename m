Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpKsu-00059T-C9
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 15:28:36 +0100
Received: by eaal12 with SMTP id l12so366955eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 06:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6+Qx+6zfV/9B6SBFo8guvgnFoB93apL3DB8kJNpFVFM=;
	b=ezTqMzBWFTehE/K560zRNvygHiYEK/QfvmGM1W1u0ATaY4/a7PhdQos2jDYMvCXPj9
	F/GnygwcFqE2vPxw3t3ErmqAgFisvqOVM8vQfbVkADpUIlzKPUPx7S2U7hRBS1L1e7KW
	hsZ4jp174A62der0s96HQLhrHt2ojJtQ9r4MM=
Received: by 10.213.98.81 with SMTP id p17mr1639722ebn.26.1327328452309;
	Mon, 23 Jan 2012 06:20:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n56sm10739349eeh.6.2012.01.23.06.20.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 06:20:51 -0800 (PST)
Date: Mon, 23 Jan 2012 15:20:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120123142049.GD3701@jama.jama.net>
References: <20120117130948.GB3503@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120117130948.GB3503@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Different libdir in libstdc++.la for qemux86-64 causing issues
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
X-List-Received-Date: Mon, 23 Jan 2012 14:28:36 -0000
X-Groupsio-MsgNum: 16447
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline

--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 02:09:48PM +0100, Martin Jansa wrote:
> Hi,
>=20
> I was wondering why eve (elementary+webkit based browser) always fails
> to link when building for qemux86-64 (works for other MACHINEs I'm
> using).
>=20
> After fixing gnutls pulling system libs to every EFL build I ended with o=
nly=20
> difference - libdir in libstdc++.la
>=20
> OE @ ~/shr-core/tmp-eglibc/sysroots $ grep libdir */usr/lib/libstdc*la
> nokia900/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
> om-gta02/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
> qemux86-64/usr/lib/libstdc++.la:libdir=3D'/usr/lib/../lib'
> spitz/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
>=20
> Which results in added -Wl,-rpath -Wl,/usr/lib/../lib while building for=
=20
> qemux86-64 (see logs below).
>=20
> Is there any reason to have different libdir (pointing to the same direct=
ory=20
> actually)? Or is it bug in libtool or how it's used from eve? Can we chan=
ge=20
> it in gcc-runtime?
>=20
> smaller test-case:
> OE @ ~/shr-core/tmp-eglibc $ sysroots/qemux86-64/usr/bin/crossscripts/x86=
_64-oe-linux-libtool -n --tag=3DCC --mode=3Dlink x86_64-oe-linux-gcc -m64 -=
-sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -o test -lstdc++
> x86_64-oe-linux-libtool: link: x86_64-oe-linux-gcc -m64 --sysroot=3D/OE/s=
hr-core/tmp-eglibc/sysroots/qemux86-64 -o test  /OE/shr-core/tmp-eglibc/sys=
roots/qemux86-64/usr/lib/../lib/libstdc++.so -lm -Wl,-rpath -Wl,/usr/lib/..=
/lib
>=20
> OE @ ~/shr-core/tmp-eglibc $ sysroots/nokia900/usr/bin/crossscripts/arm-o=
e-linux-gnueabi-libtool -n --tag=3DCC --mode=3Dlink arm-oe-linux-gnueabi-gc=
c -march=3Darmv7-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o=
 test -lstdc++
> arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=3Darm=
v7-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o test  /OE/shr=
-core/tmp-eglibc/sysroots/nokia900/usr/lib/libstdc++.so -lm
>=20

same issue while building gconf:

| x86_64-oe-linux-libtool: link: x86_64-oe-linux-gcc -m64 --sysroot=3D/OE/o=
e-core/tmp-eglibc/sysroots/qemux86-64 -I.. -I.. -pthread -I/OE/oe-core/tmp-=
eglibc/sysroots/qemux86-64/usr/include/glib-2.0 -I/OE/oe-core/tmp-eglibc/sy=
sroots/qemux86-64/usr/lib/glib-2.0/include -I/OE/oe-core/tmp-eglibc/sysroot=
s/qemux86-64/usr/include/gtk-2.0 -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-=
64/usr/lib/gtk-2.0/include -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr=
/include/atk-1.0 -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/include/c=
airo -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/include/gdk-pixbuf-2.=
0 -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/include/pango-1.0 -I/OE/=
oe-core/tmp-eglibc/sysroots/qemux86-64/usr/include/pixman-1 -I/OE/oe-core/t=
mp-eglibc/sysroots/qemux86-64/usr/include/freetype2 -I/OE/oe-core/tmp-eglib=
c/sysroots/qemux86-64/usr/include/libpng12 -I/OE/oe-core/tmp-eglibc/sysroot=
s/qemux86-64/usr/include/libxml2 -pthread -I/OE/oe-core/tmp-eglibc/sysroots=
/qemux86-64/usr/include/dbus-1.0 -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-=
64/usr/lib/dbus-1.0/include -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/us=
r/include/glib-2.0 -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/gli=
b-2.0/include -DG_LOG_DOMAIN=3D\"GConf\" -DPREFIX=3D\"/usr\" -DGCONF_LOCALE=
_DIR=3D\"/usr/share/locale\" -DGCONF_SRCDIR=3D\"/OE/oe-core/tmp-eglibc/work=
/x86_64-oe-linux/gconf-3.2.3-r5/GConf-3.2.3\" -DGCONF_CONFDIR=3D\"/etc/gcon=
f/2\" -DGCONF_ETCDIR=3D\"/etc/gconf\" -DGCONF_BINDIR=3D\"/usr/bin\" -DGCONF=
_SERVERDIR=3D\"/usr/libexec\" -DGCONF_BUILDDIR=3D\"..\" -DGCONF_BACKEND_DIR=
=3D\"/usr/lib/GConf/2\" -DVERSION=3D\"3.2.3\" -DGCONF_ENABLE_INTERNALS=3D1 =
-DGCONFD=3D\"gconfd-2\" -pthread -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-=
64/usr/include/dbus-1.0 -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/li=
b/dbus-1.0/include -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/include=
/glib-2.0 -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/glib-2.0/inc=
lude -O2 -pipe -g -feliminate-unused-debug-types -Wall -DGCONF_ENABLE_DEBUG=
=3D1 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/gconfd-2 gconf=
d_2-gconf-database.o gconfd_2-gconfd.o gconfd_2-gconfd-dbus.o gconfd_2-gcon=
f-database-dbus.o -pthread -Wl,--export-dynamic -pthread  ./.libs/libgconf-=
2.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgio-2.0.so /OE/o=
e-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libz.so -lresolv /OE/oe-core/=
tmp-eglibc/sysroots/qemux86-64/usr/lib/libgmodule-2.0.so -ldl /OE/oe-core/t=
mp-eglibc/sysroots/qemux86-64/usr/lib/libdbus-glib-1.so /OE/oe-core/tmp-egl=
ibc/sysroots/qemux86-64/usr/lib/libdbus-1.so /OE/oe-core/tmp-eglibc/sysroot=
s/qemux86-64/usr/lib/libgobject-2.0.so /OE/oe-core/tmp-eglibc/sysroots/qemu=
x86-64/usr/lib/libffi.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib=
/libgthread-2.0.so -lpthread /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr=
/lib/libglib-2.0.so -lrt -pthread
| x86_64-oe-linux-libtool: link: x86_64-oe-linux-gcc -m64 --sysroot=3D/OE/o=
e-core/tmp-eglibc/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused-debug=
-types -Wall -DGCONF_ENABLE_DEBUG=3D1 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--=
as-needed -o .libs/gconf-sanity-check-2 gconf-sanity-check.o -pthread -Wl,-=
-export-dynamic  ./.libs/libgconf-2.so /OE/oe-core/tmp-eglibc/sysroots/qemu=
x86-64/usr/lib/libdbus-glib-1.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64=
/usr/lib/libdbus-1.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/li=
bgtk-x11-2.0.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgdk-x=
11-2.0.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libatk-1.0.so =
/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libpangocairo-1.0.so -L=
=3D/usr/lib /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libpangoft2-=
1.0.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libstdc++.=
so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgdk_pixbuf-2.0.so =
/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgio-2.0.so -lresolv /=
OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libcairo.so /OE/oe-core/t=
mp-eglibc/sysroots/qemux86-64/usr/lib/libpixman-1.so /OE/oe-core/tmp-eglibc=
/sysroots/qemux86-64/usr/lib/libpng12.so /OE/oe-core/tmp-eglibc/sysroots/qe=
mux86-64/usr/lib/libXrender.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/u=
sr/lib/libX11.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libxcb.=
so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libXau.so /OE/oe-core=
/tmp-eglibc/sysroots/qemux86-64/usr/lib/libXdmcp.so /OE/oe-core/tmp-eglibc/=
sysroots/qemux86-64/usr/lib/libpango-1.0.so /OE/oe-core/tmp-eglibc/sysroots=
/qemux86-64/usr/lib/libfontconfig.so /OE/oe-core/tmp-eglibc/sysroots/qemux8=
6-64/usr/lib/libfreetype.so /OE/oe-core/tmp-eglibc/sysroots/qemux8ERROR: Fu=
nction failed: do_compile (see /OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/=
gconf-3.2.3-r5/temp/log.do_compile.22789 for further information)
| 6-64/usr/lib/libexpat.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/l=
ib/libgobject-2.0.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/lib=
ffi.so /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgmodule-2.0.so=
 /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgthread-2.0.so -lpth=
read /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libglib-2.0.so -lrt=
 /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libxml2.so -ldl /OE/oe-=
core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libz.so -lm -pthread -Wl,-rpath=
 -Wl,/usr/lib/../lib
| /usr/lib/../lib/libXext.so.6: undefined reference to `memcpy@GLIBC_2.14'
| collect2: ld returned 1 exit status
| make[3]: *** [gconf-sanity-check-2] Error 1
| make[3]: Leaving directory `/OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/g=
conf-3.2.3-r5/GConf-3.2.3/gconf'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory `/OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/g=
conf-3.2.3-r5/GConf-3.2.3/gconf'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/g=
conf-3.2.3-r5/GConf-3.2.3'

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8dbMAACgkQN1Ujt2V2gBz9jQCfaYX/ceO/JY9k8Qm0fwD2moBd
8xgAnjvzyLSdA0O+s2NxgHos19Xn3B8a
=lgjN
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--
