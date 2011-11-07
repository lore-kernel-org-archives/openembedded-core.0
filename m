Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNMcw-0007SW-3R
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 11:40:30 +0100
Received: by faat2 with SMTP id t2so2313730faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 02:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=cBcBUEUu8LKC4jEkkBvs+legXJsB9VCWTU9OMiiqHUg=;
	b=EK5yn7LlUTWCm/tb+1Vwv17SaNtpBufWPrGwRwchTWLo0cox45pIlaOJd1lj2YAN4I
	yqkR0GXZM4UGZlLHx8QjvPc1Fx0RM2reHbP+3ma79bQNshtI9TMXhZXtWxBK92YpGUpt
	PrqjbYj9/iMR3aYMcE2czB6CFjpnKdN3SHwcw=
Received: by 10.152.106.130 with SMTP id gu2mr6215245lab.37.1320662056966;
	Mon, 07 Nov 2011 02:34:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ps2sm8130760lab.12.2011.11.07.02.34.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 02:34:16 -0800 (PST)
Date: Mon, 7 Nov 2011 10:34:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111107093403.GA4237@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: python: wrong config/Makefile when reused sstate from other machine build
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
X-List-Received-Date: Mon, 07 Nov 2011 10:40:30 -0000
X-Groupsio-MsgNum: 11979
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

While testing basichash signature generator and multimachine builds (qemuar=
m and qemuarmcopy as MACHINE) I got few errors like:

| arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mthumb -mthumb-interwork -mtun=
e=3Darm926ej-s --sysroot=3D/OE/shr-core/tmp/sysroots/qemuarm -DNDEBUG -g -O=
3 -Wall -Wstrict-prototypes -O2 -pipe -g -feliminate-unused-debug-types -fP=
IC -I/OE/shr-core/tmp/sysroots/arm-oe-linux-gnueabi/usr/include/python2.7 -=
I/OE/shr-core/tmp/sysroots/qemuarm/usr/include/python2.7 -c alsaaudio.c -o =
build/temp.linux-x86_64-2.7/alsaaudio.o
| alsaaudio.c:19:0: warning: "PyUnicode_FromString" redefined [enabled by d=
efault]
| /OE/shr-core/tmp/sysroots/qemuarm/usr/include/python2.7/unicodeobject.h:1=
94:0: note: this is the location of the previous definition
| alsaaudio.c: In function 'initalsaaudio':
| alsaaudio.c:1929:5: warning: dereferencing type-punned pointer will break=
 strict-aliasing rules [-Wstrict-aliasing]
| alsaaudio.c:1932:5: warning: dereferencing type-punned pointer will break=
 strict-aliasing rules [-Wstrict-aliasing]
| creating build/lib.linux-x86_64-2.7
| arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mthumb -mthumb-interwork -mtun=
e=3Darm926ej-s --sysroot=3D/OE/shr-core/tmp/sysroots/qemuarmcopy -shared -L=
=2E -L/OE/shr-core/tmp/sysroots/qemuarmcopy/usr/lib -Wl,-O1 -Wl,--hash-styl=
e=3Dgnu -Wl,--as-needed -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -O2 =
-pipe -g -feliminate-unused-debug-types build/temp.linux-x86_64-2.7/alsaaud=
io.o -L/OE/shr-core/tmp/sysroots/qemuarmcopy/usr/lib -lasound -lpython2.7 -=
o build/lib.linux-x86_64-2.7/alsaaudio.so
| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnuea=
bi/gcc/arm-oe-linux-gnueabi/4.6.2/ld: cannot find -lasound
| collect2: ld returned 1 exit status
| error: command 'arm-oe-linux-gnueabi-gcc' failed with exit status 1
| + bbfatal 'python setup.py build_ext execution failed.'
| + echo 'ERROR: python setup.py build_ext execution failed.'
| ERROR: python setup.py build_ext execution failed.
| + exit 1
NOTE: package python-pyalsaaudio-0.4-ml1: task do_compile: Failed
ERROR: Task 7853 (/OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/p=
ython/python-pyalsaaudio_0.4.bb, do_compile) failed with exit code '1'
NOTE: Running task 7164 of 8028 (ID: 7857, /OE/shr-core/meta-openembedded/m=
eta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb, do_populate_lic)

And that's caused by machine specific sysroot while reusing python's config=
/Makefile=20
which points to wrong sysroot (ie to qemuarmcopy's sysroot while building f=
or qemuarm).

What's even worse is that if I did build alsa for qemuarmcopy=20
before building python-pyalsaaudio I wouldn't get this error at all
and qemuarm python-pyalsaaudio will be linked agains (possibly different)
libasound from qemuarmcopy sysroot..

OE @ ~/shr-core $ diff tmp/sysroots/qemuarmcopy/usr/lib/python2.7/config/Ma=
kefile tmp/sysroots/qemuarm/usr/lib/python2.7/config/Makefile

OE @ ~/shr-core $ grep qemuarmcopy tmp/sysroots/qemuarm/usr/lib/python2.7/c=
onfig/Makefile
CC=3D             arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthu=
mb-interwork  -mtune=3Darm926ej-s --sysroot=3D/OE/shr-core/tmp/sysroots/qem=
uarmcopy
CXX=3D            arm-oe-linux-gnueabi-g++  -march=3Darmv5te  -mthumb -mthu=
mb-interwork  -mtune=3Darm926ej-s --sysroot=3D/OE/shr-core/tmp/sysroots/qem=
uarmcopy
LDFLAGS=3D-L. -L/OE/shr-core/tmp/sysroots/qemuarmcopy/usr/lib     -Wl,-O1 -=
Wl,--hash-style=3Dgnu -Wl,--as-needed
LIBDIR=3D         /OE/shr-core/tmp/sysroots/qemuarmcopy/usr/lib
INCLUDEDIR=3D     /OE/shr-core/tmp/sysroots/qemuarmcopy/usr/include
CONFIG_ARGS=3D     '--build=3Dx86_64-linux' '--host=3Darm-oe-linux-gnueabi'=
 '--target=3Darm-oe-linux-gnueabi' '--prefix=3D/usr' '--exec_prefix=3D/usr'=
 '--bindir=3D/usr/bin' '--sbindir=3D/usr/sbin' '--libexecdir=3D/OE/shr-core=
/tmp/sysroots/qemuarmcopy/usr/libexec' '--datadir=3D/usr/share' '--sysconfd=
ir=3D/etc' '--sharedstatedir=3D/com' '--localstatedir=3D/var' '--libdir=3D/=
usr/lib' '--includedir=3D/OE/shr-core/tmp/sysroots/qemuarmcopy/usr/include'=
 '--oldincludedir=3D/usr/include' '--infodir=3D/usr/share/info' '--mandir=
=3D/usr/share/man' '--disable-silent-rules' '--disable-dependency-tracking'=
 '--with-libtool-sysroot=3D/OE/shr-core/tmp/sysroots/qemuarmcopy' '--with-t=
hreads' '--with-pymalloc' '--with-cyclic-gc' '--without-cxx' '--with-signal=
-module' '--with-wctype-functions' '--enable-shared' 'build_alias=3Dx86_64-=
linux' 'host_alias=3Darm-oe-linux-gnueabi' 'target_alias=3Darm-oe-linux-gnu=
eabi' 'CC=3Darm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthumb-int=
erwork  -mtune=3Darm926ej-s --sysroot=3D/OE/shr-core/tmp/sysroots/qemuarmco=
py' 'CFLAGS=3D-O2 -pipe -g -feliminate-unused-debug-types' 'LDFLAGS=3D-L. -=
L/OE/shr-core/tmp/sysroots/qemuarmcopy/usr/lib-Wl,-O1 -Wl,--hash-style=3Dgn=
u -Wl,--as-needed' 'CPPFLAGS=3D' 'CPP=3Darm-oe-linux-gnueabi-gcc -E --sysro=
ot=3D/OE/shr-core/tmp/sysroots/qemuarmcopy  -march=3Darmv5te  -mthumb -mthu=
mb-interwork  -mtune=3Darm926ej-s'
                $(RUNSHARED) /OE/shr-core/tmp/sysroots/qemuarmcopy/usr/libe=
xec/oah/translate ./$(BUILDPYTHON) -E -tt $(TESTPROG) -uall $(TESTOPTS)

What's proper fix? Make python machine specific so it's never reused from s=
state?

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk63pgsACgkQN1Ujt2V2gBzeWgCdHbh2I1pFIwqXV5URqNf0cc+J
4/sAoIUzMKQ5rrKmDxvl9nlkf0nAIcGH
=s0fw
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
