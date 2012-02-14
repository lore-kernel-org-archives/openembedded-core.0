Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RxMlf-0005dO-U0
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 19:06:20 +0100
Received: by eaal10 with SMTP id l10so70405eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 09:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=+2z9HEiaTY94TuE8Z4oUk48CS6grREJQ/buccs0drxA=;
	b=pQHPvXsrvRvwk90HdNHVs7myV3S/OL6WusDObYVoKPtruF5tf/YnNi8uYWar3zdzXH
	EXX1j0ITxnPxxLxbuQIhz/D8llgUaq6/ONRyeMtFiyQlcDeO7LrrUyl8dknl3juv4VSD
	ybeOyWlI+zx6PgLNWkIKp5o7OZx/ox27vGVSs=
Received: by 10.213.30.10 with SMTP id s10mr3682680ebc.53.1329242289055;
	Tue, 14 Feb 2012 09:58:09 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm772939eea.5.2012.02.14.09.58.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Feb 2012 09:58:07 -0800 (PST)
Date: Tue, 14 Feb 2012 18:58:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Message-ID: <20120214175804.GB23843@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNe2iXiaG+=je65zNAY10Bf4PqrbJfLuJtMhzwcGttUQXA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: [yocto] Trying to re-use sstate.
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
X-List-Received-Date: Tue, 14 Feb 2012 18:06:20 -0000
X-Groupsio-MsgNum: 17515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline

--+nBD6E3TurpgldQp
Content-Type: multipart/mixed; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2012 at 02:59:54PM +0000, McClintock Matthew-B29882 wrote:
> The paths issue your are speculating on was fixed by myself and Richard l=
ast November.
>=20
> I would suggest running bitbake-diffsig to determine the actual sstate di=
fferences.
>=20

Usually I'm complaining that sstate cache is not used enough, but today
I got pretty decent percentage of reuse while building from scratch 2
similar machines (nokia900 and om-gta04) but also few wrong sysroot
references which slipped in (I thought those were fixed).

First I've built my image for nokia900, then for om-gta04 (with rm_work
disabled to reuse sstate).

OE @ ~/shr-core/tmp-eglibc/sysroots/om-gta04 $ grep -R nokia900 . 2>/dev/nu=
ll >nokia900.log

$ wc -l nokia900.log
1673 nokia900.log

now lot's of binaries have some reference to nokia900 sysroot, grep
shows e.g. "Binary file ./lib/ld-2.15.so matches"
$ grep "^Binary file " nokia900.log | wc -l
1637

which is maybe fine..

An then there is few crossscripts and headers some are already in=20
SSTATE_SCAN_FILES some are missing I guess:

$ grep -v "^Binary file " nokia900.log | wc -l
36
$ grep -v "^Binary file " nokia900.log | sed 's/:.*//g' | sort -u
=2E/usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool
=2E/usr/bin/crossscripts/curl-config
=2E/usr/bin/crossscripts/libgcrypt-config
=2E/usr/bin/crossscripts/libtoolize
=2E/usr/include/gmp.h
=2E/usr/lib/gcc/arm-oe-linux-gnueabi/4.6.3/plugin/include/configargs.h
=2E/usr/lib/python2.7/config/Makefile

Complete output attached

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="wrong.sysroot.txt"
Content-Transfer-Encoding: quoted-printable

./usr/bin/crossscripts/libgcrypt-config:gpg_error_libs=3D"-L/OE/shr-core/tm=
p-eglibc/sysroots/nokia900/usr/lib -lgpg-error"
./usr/bin/crossscripts/libgcrypt-config:gpg_error_cflags=3D"-I/OE/shr-core/=
tmp-eglibc/sysroots/nokia900/usr/include"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:LTCC=3D"arm-oe-linux-gn=
ueabi-gcc  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork -mfl=
oat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/t=
mp-eglibc/sysroots/nokia900"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:lt_sysroot=3D/OE/shr-co=
re/tmp-eglibc/sysroots/nokia900
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:sys_lib_search_path_spe=
c=3D"/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-=
oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3 /OE/shr-core/tmp-eglibc/sys=
roots/x86_64-linux/usr/arm-oe-linux-gnueabi/lib /OE/shr-core/tmp-eglibc/sys=
roots/nokia900/lib /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/arm-oe=
-linux-gnueabi/4.6.3 /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib "
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:LD=3D"arm-oe-linux-gnue=
abi-ld --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:CC=3D"arm-oe-linux-gnue=
abi-gcc  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp=
-eglibc/sysroots/nokia900"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:LD=3D"arm-oe-linux-gnue=
abi-ld --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:CC=3D"arm-oe-linux-gnue=
abi-g++  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp=
-eglibc/sysroots/nokia900"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:compiler_lib_search_dir=
s=3D"/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-=
oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3 /OE/shr-core/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/armv7a-vfp-neon-oe-linux-gnueabi/gcc/arm-oe-linu=
x-gnueabi/4.6.3/../../../../../arm-oe-linux-gnueabi/lib /OE/shr-core/tmp-eg=
libc/sysroots/nokia900/lib /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/li=
b/arm-oe-linux-gnueabi/4.6.3 /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/=
lib"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:predep_objects=3D"/OE/s=
hr-core/tmp-eglibc/sysroots/nokia900/usr/lib/crti.o /OE/shr-core/tmp-eglibc=
/sysroots/nokia900/usr/lib/arm-oe-linux-gnueabi/4.6.3/crtbeginS.o"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:postdep_objects=3D"/OE/=
shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/arm-oe-linux-gnueabi/4.6.3/cr=
tendS.o /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/crtn.o"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:compiler_lib_search_pat=
h=3D"-L/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neo=
n-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3 -L/OE/shr-core/tmp-eglibc=
/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-oe-linux-gnueabi/gcc/arm-oe-=
linux-gnueabi/4.6.3/../../../../../arm-oe-linux-gnueabi/lib -L/OE/shr-core/=
tmp-eglibc/sysroots/nokia900/lib -L/OE/shr-core/tmp-eglibc/sysroots/nokia90=
0/usr/lib/arm-oe-linux-gnueabi/4.6.3 -L/OE/shr-core/tmp-eglibc/sysroots/nok=
ia900/usr/lib"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:LD=3D"arm-oe-linux-gnue=
abi-ld --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:CC=3D"arm-oe-linux-gnue=
abi-g77  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp=
-eglibc/sysroots/nokia900"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:LD=3D"arm-oe-linux-gnue=
abi-ld --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:LD=3D"arm-oe-linux-gnue=
abi-ld --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900"
./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool:LD=3D"arm-oe-linux-gnue=
abi-ld --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900"
./usr/bin/crossscripts/curl-config:     echo "arm-oe-linux-gnueabi-gcc  -ma=
rch=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoft=
fp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysr=
oots/nokia900"
./usr/bin/crossscripts/curl-config:       echo ${CURLLIBDIR}-lcurl -Wl,-O1 =
-Wl,--hash-style=3Dgnu -Wl,--as-needed -L/OE/shr-core/tmp-eglibc/sysroots/n=
okia900/usr/lib/..//lib -L/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib=
/..//lib -lgcrypt -lrt -lz -lgnutls
./usr/bin/crossscripts/curl-config:       echo ${CURLLIBDIR}-lcurl -Wl,-O1 =
-Wl,--hash-style=3Dgnu -Wl,--as-needed -L/OE/shr-core/tmp-eglibc/sysroots/n=
okia900/usr/lib/..//lib -L/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib=
/..//lib
./usr/bin/crossscripts/curl-config:     echo /usr/lib/libcurl.a -Wl,-O1 -Wl=
,--hash-style=3Dgnu -Wl,--as-needed -L/OE/shr-core/tmp-eglibc/sysroots/noki=
a900/usr/lib/..//lib -L/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/..=
//lib -lgcrypt -lrt -lz -lgnutls
./usr/bin/crossscripts/curl-config:      echo " '--build=3Dx86_64-linux' '-=
-host=3Darm-oe-linux-gnueabi' '--target=3Darm-oe-linux-gnueabi' '--prefix=
=3D/usr' '--exec_prefix=3D/usr' '--bindir=3D/OE/shr-core/tmp-eglibc/sysroot=
s/om-gta04/usr/bin' '--sbindir=3D/OE/shr-core/tmp-eglibc/sysroots/om-gta04/=
usr/sbin' '--libexecdir=3D/OE/shr-core/tmp-eglibc/sysroots/om-gta04/usr/lib=
exec' '--datadir=3D/OE/shr-core/tmp-eglibc/sysroots/om-gta04/usr/share' '--=
sysconfdir=3D/etc' '--sharedstatedir=3D/com' '--localstatedir=3D/var' '--li=
bdir=3D/usr/lib' '--includedir=3D/OE/shr-core/tmp-eglibc/sysroots/om-gta04/=
usr/include' '--oldincludedir=3D/usr/include' '--infodir=3D/usr/share/info'=
 '--mandir=3D/usr/share/man' '--disable-silent-rules' '--disable-dependency=
-tracking' '--with-libtool-sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia=
900' '--with-zlib=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/../' =
'--without-ssl' '--without-libssh2' '--with-random=3D/dev/urandom' '--witho=
ut-libidn' '--enable-crypto-auth' '--with-gnutls=3D/OE/shr-core/tmp-eglibc/=
sysroots/nokia900/usr/lib/../' 'build_alias=3Dx86_64-linux' 'host_alias=3Da=
rm-oe-linux-gnueabi' 'target_alias=3Darm-oe-linux-gnueabi' 'CC=3Darm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork=
 -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-c=
ore/tmp-eglibc/sysroots/nokia900' 'CFLAGS=3D-O2 -pipe -g -feliminate-unused=
-debug-types' 'LDFLAGS=3D-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed' 'C=
PPFLAGS=3D' 'CPP=3Darm-oe-linux-gnueabi-gcc -E --sysroot=3D/OE/shr-core/tmp=
-eglibc/sysroots/nokia900  -march=3Darmv7-a -fno-tree-vectorize      -mthum=
b-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8'"
./usr/bin/crossscripts/libtoolize:  datadir=3D/OE/shr-core/tmp-eglibc/sysro=
ots/nokia900/usr/share
./usr/bin/crossscripts/libtoolize:  pkgdatadir=3D/OE/shr-core/tmp-eglibc/sy=
sroots/nokia900/usr/share/libtool
./usr/bin/crossscripts/libtoolize:  pkgltdldir=3D/OE/shr-core/tmp-eglibc/sy=
sroots/nokia900/usr/share/libtool
./usr/bin/crossscripts/libtoolize:  aclocaldir=3D/OE/shr-core/tmp-eglibc/sy=
sroots/nokia900/usr/share/aclocal
./usr/lib/python2.7/config/Makefile:CC=3D         arm-oe-linux-gnueabi-gcc =
 -march=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3D=
softfp -mfpu=3Dneon -mtune=3Dcortex-a8 -D__SOFTFP__ --sysroot=3D/OE/shr-cor=
e/tmp-eglibc/sysroots/nokia900
./usr/lib/python2.7/config/Makefile:CXX=3D                arm-oe-linux-gnue=
abi-g++  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -D__SOFTFP__ --sysroot=3D/OE=
/shr-core/tmp-eglibc/sysroots/nokia900
./usr/lib/python2.7/config/Makefile:LDFLAGS=3D-L. -L/OE/shr-core/tmp-eglibc=
/sysroots/nokia900/usr/lib     -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-need=
ed
./usr/lib/python2.7/config/Makefile:LIBDIR=3D             /OE/shr-core/tmp-=
eglibc/sysroots/nokia900/usr/lib
./usr/lib/python2.7/config/Makefile:INCLUDEDIR=3D /OE/shr-core/tmp-eglibc/s=
ysroots/nokia900/usr/include
./usr/lib/python2.7/config/Makefile:CONFIG_ARGS=3D         '--build=3Dx86_6=
4-linux' '--host=3Darm-oe-linux-gnueabi' '--target=3Darm-oe-linux-gnueabi' =
'--prefix=3D/usr' '--exec_prefix=3D/usr' '--bindir=3D/usr/bin' '--sbindir=
=3D/usr/sbin' '--libexecdir=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr=
/libexec' '--datadir=3D/usr/share' '--sysconfdir=3D/etc' '--sharedstatedir=
=3D/com' '--localstatedir=3D/var' '--libdir=3D/usr/lib' '--includedir=3D/OE=
/shr-core/tmp-eglibc/sysroots/nokia900/usr/include' '--oldincludedir=3D/usr=
/include' '--infodir=3D/usr/share/info' '--mandir=3D/usr/share/man' '--disa=
ble-silent-rules' '--disable-dependency-tracking' '--with-libtool-sysroot=
=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900' '--with-threads' '--with-pyma=
lloc' '--with-cyclic-gc' '--without-cxx' '--with-signal-module' '--with-wct=
ype-functions' '--enable-shared' 'build_alias=3Dx86_64-linux' 'host_alias=
=3Darm-oe-linux-gnueabi' 'target_alias=3Darm-oe-linux-gnueabi' 'CC=3Darm-oe=
-linux-gnueabi-gcc  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-inter=
work -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -D__SOFTFP__ --sy=
sroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900' 'CFLAGS=3D-O2 -pipe -g -=
feliminate-unused-debug-types' 'LDFLAGS=3D-L. -L/OE/shr-core/tmp-eglibc/sys=
roots/nokia900/usr/lib-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed' 'CPPF=
LAGS=3D' 'CPP=3Darm-oe-linux-gnueabi-gcc -E --sysroot=3D/OE/shr-core/tmp-eg=
libc/sysroots/nokia900  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-i=
nterwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -D__SOFTFP__'
./usr/lib/python2.7/config/Makefile:            $(RUNSHARED) /OE/shr-core/t=
mp-eglibc/sysroots/nokia900/usr/libexec/oah/translate ./$(BUILDPYTHON) -E -=
tt $(TESTPROG) -uall $(TESTOPTS)
./usr/lib/gcc/arm-oe-linux-gnueabi/4.6.3/plugin/include/configargs.h:static=
 const char configuration_arguments[] =3D "/OE/shr-core/tmp-eglibc/work-sha=
red/gcc-4.6.2+svnr181430-r27/gcc-4_6-branch/configure --build=3Dx86_64-linu=
x --host=3Darm-oe-linux-gnueabi --target=3Darm-oe-linux-gnueabi --prefix=3D=
/usr --exec_prefix=3D/usr --bindir=3D/usr/bin --sbindir=3D/usr/sbin --libex=
ecdir=3D/usr/libexec --datadir=3D/usr/share --sysconfdir=3D/etc --sharedsta=
tedir=3D/com --localstatedir=3D/var --libdir=3D/usr/lib --includedir=3D/usr=
/include --oldincludedir=3D/usr/include --infodir=3D/usr/share/info --mandi=
r=3D/usr/share/man --disable-silent-rules --disable-dependency-tracking --w=
ith-libtool-sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 --with-gnu-=
ld --enable-shared --enable-languages=3Dc,c++ --enable-threads=3Dposix --di=
sable-multilib --enable-c99 --enable-long-long --enable-symvers=3Dgnu --ena=
ble-libstdcxx-pch --program-prefix=3Darm-oe-linux-gnueabi- --enable-target-=
optspace --enable-lto --enable-libssp --disable-bootstrap --disable-libgomp=
 --disable-libmudflap --with-system-zlib --with-linker-hash-style=3Dgnu --e=
nable-cheaders=3Dc_global --with-local-prefix=3D/OE/shr-core/tmp-eglibc/sys=
roots/nokia900/usr --with-gxx-include-dir=3D/usr/include/c++/ --enable-nls =
--enable-__cxa_atexit";
./usr/include/gmp.h:#define __GMP_CC "arm-oe-linux-gnueabi-gcc  -march=3Dar=
mv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nok=
ia900 -std=3Dgnu99"

--GID0FwUMdk1T2AWN--

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk86oKwACgkQN1Ujt2V2gBzFtgCglOcm/8QCsE/q5RwmXzzFRgvb
h/EAninSfDvRd6mdyzHeN6cqe1xBgxil
=Vli7
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
