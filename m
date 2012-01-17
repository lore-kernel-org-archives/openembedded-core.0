Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rn8um-0005sE-Th
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 14:17:29 +0100
Received: by eekd17 with SMTP id d17so1827227eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 05:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=DzfuS0nndRhlQpmfxg5Lo0XI/IRPHL2mAwlDLq1c5qs=;
	b=vPXXOJ+JQ2S13gmhEjGZErOOOYp9ETN2ejntE6nUvuMWQb6cbRicqjy6zG7dUq3LCQ
	dGLjT81nqvB6YqSVEedxRBFaFovLfCn6Ja9uOsYmRRs8OEGEIEOnrlGM7uOrtxD5Q0uz
	jjVuYoJu938tkFTP1WAnggZOzz0fOPEBwSuLc=
Received: by 10.213.108.145 with SMTP id f17mr4764776ebp.1.1326805791905;
	Tue, 17 Jan 2012 05:09:51 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x43sm85786931eef.8.2012.01.17.05.09.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 05:09:51 -0800 (PST)
Date: Tue, 17 Jan 2012 14:09:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120117130948.GB3503@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Different libdir in libstdc++.la for qemux86-64 causing issues
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
X-List-Received-Date: Tue, 17 Jan 2012 13:17:29 -0000
X-Groupsio-MsgNum: 16124
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I was wondering why eve (elementary+webkit based browser) always fails
to link when building for qemux86-64 (works for other MACHINEs I'm
using).

After fixing gnutls pulling system libs to every EFL build I ended with onl=
y=20
difference - libdir in libstdc++.la

OE @ ~/shr-core/tmp-eglibc/sysroots $ grep libdir */usr/lib/libstdc*la
nokia900/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
om-gta02/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
qemux86-64/usr/lib/libstdc++.la:libdir=3D'/usr/lib/../lib'
spitz/usr/lib/libstdc++.la:libdir=3D'/usr/lib'

Which results in added -Wl,-rpath -Wl,/usr/lib/../lib while building for=20
qemux86-64 (see logs below).

Is there any reason to have different libdir (pointing to the same director=
y=20
actually)? Or is it bug in libtool or how it's used from eve? Can we change=
=20
it in gcc-runtime?

smaller test-case:
OE @ ~/shr-core/tmp-eglibc $ sysroots/qemux86-64/usr/bin/crossscripts/x86_6=
4-oe-linux-libtool -n --tag=3DCC --mode=3Dlink x86_64-oe-linux-gcc -m64 --s=
ysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -o test -lstdc++
x86_64-oe-linux-libtool: link: x86_64-oe-linux-gcc -m64 --sysroot=3D/OE/shr=
-core/tmp-eglibc/sysroots/qemux86-64 -o test  /OE/shr-core/tmp-eglibc/sysro=
ots/qemux86-64/usr/lib/../lib/libstdc++.so -lm -Wl,-rpath -Wl,/usr/lib/../l=
ib

OE @ ~/shr-core/tmp-eglibc $ sysroots/nokia900/usr/bin/crossscripts/arm-oe-=
linux-gnueabi-libtool -n --tag=3DCC --mode=3Dlink arm-oe-linux-gnueabi-gcc =
-march=3Darmv7-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o t=
est -lstdc++
arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=3Darmv7=
-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o test  /OE/shr-c=
ore/tmp-eglibc/sysroots/nokia900/usr/lib/libstdc++.so -lm

I can confirm that manually changing /usr/lib/../lib to just /usr/lib=20
in libstdc++.la works for eve build - -rpath is gone (and IIRC I had=20
similar issue for openssh or openssl).

Only difference in logs is sysroot param/path (correct) and order of=20
libtasn/libz (not important).

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
Log for qemux86-64:
OE @ ~/shr-core/tmp-eglibc/work/x86_64-oe-linux/eve-0.3.0.0+svnr67246-r2/ev=
e/src/bin $ ../../x86_64-oe-linux-libtool  --tag=3DCC   --mode=3Dlink x86_6=
4-oe-linux-gcc    -m64 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qemux86=
-64 -std=3Dgnu99  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,=
--hash-style=3Dgnu -Wl,--as-needed -o eve main.o view.o chrome.o eve_state.=
o -pthread -lelementary -lm -leet -lefreet -lefreet_mime -lefreet_trash -le=
thumb_client -lethumb -ledbus -ldbus-1 -lpthread -lrt -leina -lecore_evas -=
lecore_file -ledje -lemotion -lepdf -lexif -lpoppler -lecore -levas -lecore=
_imf -lecore_con   -lewebkit -lcairo -levas -lecore -lecore_file   -ledbus =
-ldbus-1 -lpthread -lrt   -lm

x86_64-oe-linux-libtool: link: x86_64-oe-linux-gcc -m64 --sysroot=3D/OE/shr=
-core/tmp-eglibc/sysroots/qemux86-64 -std=3Dgnu99 -O2 -pipe -g -feliminate-=
unused-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o eve ma=
in.o view.o chrome.o eve_state.o -pthread  /OE/shr-core/tmp-eglibc/sysroots=
/qemux86-64/usr/lib/libelementary.so -L=3D/usr/lib -L=3D/usr/lib/..//lib /O=
E/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libefreet_mime.so /OE/shr=
-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libefreet_trash.so /OE/shr-cor=
e/tmp-eglibc/sysroots/qemux86-64/usr/lib/libefreet.so /OE/shr-core/tmp-egli=
bc/sysroots/qemux86-64/usr/lib/libethumb_client.so /OE/shr-core/tmp-eglibc/=
sysroots/qemux86-64/usr/lib/libethumb.so /OE/shr-core/tmp-eglibc/sysroots/q=
emux86-64/usr/lib/libedje.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/us=
r/lib/libecore_evas.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/=
libecore_x.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libXcurso=
r.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libXdamage.so /OE/=
shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libXcomposite.so /OE/shr-co=
re/tmp-eglibc/sysroots/qemux86-64/usr/lib/libXfixes.so /OE/shr-core/tmp-egl=
ibc/sysroots/qemux86-64/usr/lib/libXinerama.so /OE/shr-core/tmp-eglibc/sysr=
oots/qemux86-64/usr/lib/libXp.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-6=
4/usr/lib/libXrandr.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/=
libXss.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libXtst.so /O=
E/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libXi.so /OE/shr-core/tmp=
-eglibc/sysroots/qemux86-64/usr/lib/libXext.so /OE/shr-core/tmp-eglibc/sysr=
oots/qemux86-64/usr/lib/libecore_fb.so /OE/shr-core/tmp-eglibc/sysroots/qem=
ux86-64/usr/lib/libts.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/li=
b/libecore_ipc.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libec=
ore_input_evas.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libec=
ore_input.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libembryo.=
so -llua /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libecore_imf_e=
vas.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libsndfile.so /O=
E/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libemotion.so /OE/shr-cor=
e/tmp-eglibc/sysroots/qemux86-64/usr/lib/libeeze.so /OE/shr-core/tmp-eglibc=
/sysroots/qemux86-64/usr/lib/libudev.so /OE/shr-core/tmp-eglibc/sysroots/qe=
mux86-64/usr/lib/libmount.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/us=
r/lib/libblkid.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libuu=
id.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libepdf.so /OE/sh=
r-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libexif.so /OE/shr-core/tmp-e=
glibc/sysroots/qemux86-64/usr/lib/libpoppler.so /OE/shr-core/tmp-eglibc/sys=
roots/qemux86-64/usr/lib/liblcms.so /OE/shr-core/tmp-eglibc/sysroots/qemux8=
6-64/usr/lib/../lib/libstdc++.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-6=
4/usr/lib/libecore_imf.so -lewebkit /OE/shr-core/tmp-eglibc/sysroots/qemux8=
6-64/usr/lib/libcairo.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/li=
b/libpixman-1.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libpng=
12.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libXrender.so /OE=
/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libX11.so /OE/shr-core/tmp=
-eglibc/sysroots/qemux86-64/usr/lib/libxcb.so /OE/shr-core/tmp-eglibc/sysro=
ots/qemux86-64/usr/lib/libXau.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-6=
4/usr/lib/libXdmcp.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/l=
ibevas.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libfribidi.so=
 /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libfontconfig.so /OE/s=
hr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libfreetype.so /OE/shr-core/=
tmp-eglibc/sysroots/qemux86-64/usr/lib/libexpat.so /OE/shr-core/tmp-eglibc/=
sysroots/qemux86-64/usr/lib/libeet.so /OE/shr-core/tmp-eglibc/sysroots/qemu=
x86-64/usr/lib/libjpeg.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/l=
ib/libecore_file.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/lib=
ecore_con.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libcurl.so=
 /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgnutls.so /OE/shr-c=
ore/tmp-eglibc/sysroots/qemux86-64/usr/lib/libtasn1.so /OE/shr-core/tmp-egl=
ibc/sysroots/qemux86-64/usr/lib/libz.so /OE/shr-core/tmp-eglibc/sysroots/qe=
mux86-64/usr/lib/libgcrypt.so -lcap /OE/shr-core/tmp-eglibc/sysroots/qemux8=
6-64/usr/lib/libgpg-error.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/us=
r/lib/libedbus.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libec=
ore.so /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libglib-2.0.so /=
OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libeina.so -ldl /OE/shr-=
core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libdbus-1.so -lpthread -lrt -lm=
 -pthread -Wl,-rpath -Wl,/usr/lib/../lib
/usr/lib/../lib/libgio-2.0.so.0: undefined reference to `deflateSetHeader@Z=
LIB_1.2.2'
/usr/lib/../lib/libgio-2.0.so.0: undefined reference to `inflateGetHeader@Z=
LIB_1.2.2'
/usr/lib/../lib/libxml2.so.2: undefined reference to `gzopen64@ZLIB_1.2.3.3'
/usr/lib/../lib/libxml2.so.2: undefined reference to `gzdirect@ZLIB_1.2.2.3'
collect2: ld returned 1 exit status
make: *** [eve] Error 1

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8VcxwACgkQN1Ujt2V2gBxjDwCffcOU1YKGuQbYL6eHD50cSaUn
sc0AnAnjz6KYi6L/fOwT3Deim03vcENb
=kJeK
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
