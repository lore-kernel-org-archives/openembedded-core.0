Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RnPho-0004Ii-7v
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 08:13:12 +0100
Received: by eaao13 with SMTP id o13so1421470eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 23:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BHbMiOtln1xCkjXh0CzQJbn5QUICUqBbvwoOPbCS+rQ=;
	b=Fu6E6ZH3b+T8NEnlysDsL6AokPOt03Su296wIeC47WqZE8iIoTL+I8BVlGqf+q/o+Y
	vVPn1SEf58Pj8pOCqezthXUtf0xtqCF3zOMX+coosI6lgd1UB6tPU+H7Ihe5nI1WaSU+
	NCuFrUEhbVntW+VKFshkSthyWJ8XN2YoALK1E=
Received: by 10.213.36.11 with SMTP id r11mr5850783ebd.69.1326870334325;
	Tue, 17 Jan 2012 23:05:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x4sm1296214eeb.4.2012.01.17.23.05.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 23:05:33 -0800 (PST)
Date: Wed, 18 Jan 2012 08:05:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120118070527.GA3652@jama.jama.net>
References: <20120117130948.GB3503@jama.jama.net>
	<CAMKF1srCUPF2+yRTQn7PxKT=FPD2i=rs5BG-o-_2xnj=fUsJ3w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srCUPF2+yRTQn7PxKT=FPD2i=rs5BG-o-_2xnj=fUsJ3w@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Jan 2012 07:13:12 -0000
X-Groupsio-MsgNum: 16217
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 02:29:46PM -0800, Khem Raj wrote:
> On Tue, Jan 17, 2012 at 5:09 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > After fixing gnutls pulling system libs to every EFL build I ended with=
 only
> > difference - libdir in libstdc++.la
> >
> > OE @ ~/shr-core/tmp-eglibc/sysroots $ grep libdir */usr/lib/libstdc*la
> > nokia900/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
> > om-gta02/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
> > qemux86-64/usr/lib/libstdc++.la:libdir=3D'/usr/lib/../lib'
> > spitz/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
> >
> > Which results in added -Wl,-rpath -Wl,/usr/lib/../lib while building for
> > qemux86-64 (see logs below).
> >
> > Is there any reason to have different libdir (pointing to the same dire=
ctory
> > actually)? Or is it bug in libtool or how it's used from eve? Can we ch=
ange
> > it in gcc-runtime?
> >
> > smaller test-case:
> > OE @ ~/shr-core/tmp-eglibc $ sysroots/qemux86-64/usr/bin/crossscripts/x=
86_64-oe-linux-libtool -n --tag=3DCC --mode=3Dlink x86_64-oe-linux-gcc -m64=
 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -o test -lstdc++
> > x86_64-oe-linux-libtool: link: x86_64-oe-linux-gcc -m64 --sysroot=3D/OE=
/shr-core/tmp-eglibc/sysroots/qemux86-64 -o test =A0/OE/shr-core/tmp-eglibc=
/sysroots/qemux86-64/usr/lib/../lib/libstdc++.so -lm -Wl,-rpath -Wl,/usr/li=
b/../lib
> >
> > OE @ ~/shr-core/tmp-eglibc $ sysroots/nokia900/usr/bin/crossscripts/arm=
-oe-linux-gnueabi-libtool -n --tag=3DCC --mode=3Dlink arm-oe-linux-gnueabi-=
gcc -march=3Darmv7-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 =
-o test -lstdc++
> > arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=3Da=
rmv7-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o test =A0/OE=
/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libstdc++.so -lm
> >
> > I can confirm that manually changing /usr/lib/../lib to just /usr/lib
> > in libstdc++.la works for eve build - -rpath is gone (and IIRC I had
> > similar issue for openssh or openssl).
>=20
> Can you confirm the converse ? i.e. change /usr/lib to /usr/lib/../lib
> in say for arm
> build and check what happens ?

Sure:
OE @ ~/shr-core/tmp-eglibc $ cat sysroots/nokia900/usr/lib/libstdc++.la | g=
rep libdir
libdir=3D'/usr/lib'
OE @ ~/shr-core/tmp-eglibc $ sysroots/nokia900/usr/bin/crossscripts/arm-oe-=
linux-gnueabi-libtool -n --tag=3DCC --mode=3Dlink arm-oe-linux-gnueabi-gcc =
-march=3Darmv7-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o t=
est -lstdc++
arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=3Darmv7=
-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o test  /OE/shr-c=
ore/tmp-eglibc/sysroots/nokia900/usr/lib/libstdc++.so -lm

OE @ ~/shr-core/tmp-eglibc $ sed -i "s#libdir=3D'/usr/lib'#libdir=3D'/usr/l=
ib/../lib'#g" sysroots/nokia900/usr/lib/libstdc++.la
OE @ ~/shr-core/tmp-eglibc $ cat sysroots/nokia900/usr/lib/libstdc++.la | g=
rep libdir
libdir=3D'/usr/lib/../lib'
OE @ ~/shr-core/tmp-eglibc $ sysroots/nokia900/usr/bin/crossscripts/arm-oe-=
linux-gnueabi-libtool -n --tag=3DCC --mode=3Dlink arm-oe-linux-gnueabi-gcc =
-march=3Darmv7-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o t=
est -lstdc++
arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=3Darmv7=
-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o test  /OE/shr-c=
ore/tmp-eglibc/sysroots/nokia900/usr/lib/../lib/libstdc++.so -lm -Wl,-rpath=
 -Wl,/usr/lib/../lib

So -rpath is here now.. lets see eve build:

OE @ ~/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/eve-0.3.0.=
0+svnr67278-r2/eve/src/bin $ ../../arm-oe-linux-gnueabi-libtool --debug -v =
-n --tag=3DCC   --mode=3Dlink arm-oe-linux-gnueabi-gcc  -march=3Darmv7-a -f=
no-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
-mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -s=
td=3Dgnu99  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash=
-style=3Dgnu -Wl,--as-needed -o eve main.o view.o chrome.o eve_state.o -pth=
read -lelementary -lm -leet -lefreet -lefreet_mime -lefreet_trash -lethumb_=
client -lethumb -ledbus -ldbus-1 -lpthread -lrt -leina -lecore_evas -lecore=
_file -ledje -lemotion -lepdf -lexif -lpoppler -lecore -levas -lecore_imf -=
lecore_con   -lewebkit -lcairo -levas -lecore -lecore_file   -ledbus -ldbus=
-1 -lpthread -lrt   -lm 2> eve.link.libtool
arm-oe-linux-gnueabi-libtool: enabling shell trace mode
arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=3Darmv7=
-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
-mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -s=
td=3Dgnu99 -O2 -pipe -g -feliminate-unused-debug-types -Wl,-O1 -Wl,--hash-s=
tyle=3Dgnu -Wl,--as-needed -o eve main.o view.o chrome.o eve_state.o -pthre=
ad  /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libelementary.so -L=
=3D/usr/lib -L=3D/usr/lib/..//lib /OE/shr-core/tmp-eglibc/sysroots/nokia900=
/usr/lib/libefreet_mime.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/li=
b/libefreet_trash.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libe=
freet.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libethumb_client=
=2Eso /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libethumb.so /OE/sh=
r-core/tmp-eglibc/sysroots/nokia900/usr/lib/libedje.so /OE/shr-core/tmp-egl=
ibc/sysroots/nokia900/usr/lib/libecore_evas.so /OE/shr-core/tmp-eglibc/sysr=
oots/nokia900/usr/lib/libecore_x.so /OE/shr-core/tmp-eglibc/sysroots/nokia9=
00/usr/lib/libXcursor.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/=
libXdamage.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libXcomposi=
te.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libXfixes.so /OE/sh=
r-core/tmp-eglibc/sysroots/nokia900/usr/lib/libXinerama.so /OE/shr-core/tmp=
-eglibc/sysroots/nokia900/usr/lib/libXp.so /OE/shr-core/tmp-eglibc/sysroots=
/nokia900/usr/lib/libXrandr.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/us=
r/lib/libXss.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libXtst.s=
o /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libXi.so /OE/shr-core/t=
mp-eglibc/sysroots/nokia900/usr/lib/libXext.so /OE/shr-core/tmp-eglibc/sysr=
oots/nokia900/usr/lib/libecore_fb.so /OE/shr-core/tmp-eglibc/sysroots/nokia=
900/usr/lib/libts.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libe=
core_ipc.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libecore_inpu=
t_evas.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libecore_input.=
so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libembryo.so -llua /OE=
/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libecore_imf_evas.so /OE/shr=
-core/tmp-eglibc/sysroots/nokia900/usr/lib/libsndfile.so /OE/shr-core/tmp-e=
glibc/sysroots/nokia900/usr/lib/libemotion.so /OE/shr-core/tmp-eglibc/sysro=
ots/nokia900/usr/lib/libeeze.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/u=
sr/lib/libudev.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libmoun=
t.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libblkid.so /OE/shr-=
core/tmp-eglibc/sysroots/nokia900/usr/lib/libuuid.so /OE/shr-core/tmp-eglib=
c/sysroots/nokia900/usr/lib/libepdf.so /OE/shr-core/tmp-eglibc/sysroots/nok=
ia900/usr/lib/libexif.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/=
libpoppler.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/liblcms.so =
/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/../lib/libstdc++.so /OE/s=
hr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libecore_imf.so -lewebkit /OE/=
shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libcairo.so /OE/shr-core/tmp-=
eglibc/sysroots/nokia900/usr/lib/libpixman-1.so /OE/shr-core/tmp-eglibc/sys=
roots/nokia900/usr/lib/libpng12.so /OE/shr-core/tmp-eglibc/sysroots/nokia90=
0/usr/lib/libXrender.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/l=
ibX11.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libxcb.so /OE/sh=
r-core/tmp-eglibc/sysroots/nokia900/usr/lib/libXau.so /OE/shr-core/tmp-egli=
bc/sysroots/nokia900/usr/lib/libXdmcp.so /OE/shr-core/tmp-eglibc/sysroots/n=
okia900/usr/lib/libevas.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/li=
b/libfribidi.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libfontco=
nfig.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libfreetype.so /O=
E/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libexpat.so /OE/shr-core/tm=
p-eglibc/sysroots/nokia900/usr/lib/libeet.so /OE/shr-core/tmp-eglibc/sysroo=
ts/nokia900/usr/lib/libjpeg.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/us=
r/lib/libecore_file.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/li=
becore_con.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libcurl.so =
/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libgnutls.so /OE/shr-core=
/tmp-eglibc/sysroots/nokia900/usr/lib/libtasn1.so /OE/shr-core/tmp-eglibc/s=
ysroots/nokia900/usr/lib/libz.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/=
usr/lib/libgcrypt.so -lcap /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/li=
b/libgpg-error.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libedbu=
s.so /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libecore.so /OE/shr-=
core/tmp-eglibc/sysroots/nokia900/usr/lib/libglib-2.0.so /OE/shr-core/tmp-e=
glibc/sysroots/nokia900/usr/lib/libeina.so -ldl /OE/shr-core/tmp-eglibc/sys=
roots/nokia900/usr/lib/libdbus-1.so -lpthread -lrt -lm -pthread -Wl,-rpath =
-Wl,/usr/lib/../lib
OE @ ~/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/eve-0.3.0.=
0+svnr67278-r2/eve/src/bin $ ls -lah eve.link.libtool=20
-rw-r--r-- 1 bitbake bitbake 57M Jan 18 08:03 eve.link.libtool

but doesn't fail like qemux86-64 does.

I'm uploading eve.link.libtool debug output to
http://build.shr-project.org/tests/jama/gcc-issue/eve.link.libtool
but it will take few more minutes..

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8WbzcACgkQN1Ujt2V2gBzLMQCfamM0KtADMQP862krLb41lrIj
wakAn0Jc4MhVWpOoVWT9hsLtlysMnuEI
=RpiV
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
