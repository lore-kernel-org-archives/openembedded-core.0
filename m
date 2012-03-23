Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1SB19u-0006KD-65
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 10:51:47 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Fri, 23 Mar 2012 17:42:33 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Fri, 23 Mar 2012
	17:42:20 +0800
Message-ID: <1332495617.11882.42.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: "mark.hatle@windriver.com" <mark.hatle@windriver.com>
Date: Fri, 23 Mar 2012 17:40:17 +0800
In-Reply-To: <1332491527.11882.40.camel@localhost.localdomain>
References: <1331799506.1041.55.camel@localhost.localdomain>
	<4F621801.4000308@windriver.com>
	<1331875115.1041.67.camel@localhost.localdomain>
	<4F635E14.7000707@windriver.com>
	<1332235259.1041.92.camel@localhost.localdomain>
	<1332319539.11882.11.camel@localhost.localdomain>
	<1332491527.11882.40.camel@localhost.localdomain>
Organization: Insigma
X-Mailer: Evolution 3.2.3 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: gconf build error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 23 Mar 2012 09:51:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

and find some info may related:
http://sourceware.org/bugzilla/show_bug.cgi?id=3D10340


On Fri, 2012-03-23 at 16:32 +0800, =E5=80=AA=E5=BA=86=E4=BA=AE wrote:
> Hello,
>=20
> I have made some progress after struggled a few days on it. found that
> the reason is located in the 'ld'.
> following is my investigation (focused on the IMPLICIT depended
> library):
>=20
> 1. call ld with sysroot and rpath
> $ld --sysroot=3D/media/pangu/lsbt/tmp/sysroots/qemux86-64 ...
> -rpath /usr/lib/../lib
>=20
> then it will find the lib needed in the host's rootfs, that will result
> error.
>=20
> 2. call ld with sysroot and without rpath
> $ld --sysroot=3D/media/pangu/lsbt/tmp/sysroots/qemux86-64 ...
>=20
> then it will find the lib needed in the directory sysroot arg specified.
> that is expected.
>=20
> I found that using the --verbose argument. Is the behaviour expected? or
> a bug?
>=20
> On Wed, 2012-03-21 at 16:45 +0800, =E5=80=AA=E5=BA=86=E4=BA=AE wrote:
> > I'm building core-image-lsb (qemux86-64 with poky-lsb), and got error
> > when do_compile gconf. my host is ArchLinux x86-64.
> >
> > the error is occured when doing sanity-check, error like:
> > /usr/lib/../lib/libXrandr.so.2: undefined reference to
> > `memcpy@GLIBC_2.14'
> >
> > the build dir is "/media/pangu/lsbt", following step can reproduce the
> > error, my question is: why the libtool try to link with the lib on host
> > rootfs? because I have tried to remove the host's libXrandr.so.2, then
> > the error changed to another lib, so I ensure it linked to the host lib
> > wrongly.
> >
> > 1.
> > cd /media/pangu/lsbt/tmp/work/x86_64-poky-linux/gconf-3.2.3-r8/GConf-3.=
2.3/gconf
> >
> > 2. export
> > PATH=3D"/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky=
-linux:/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/bin/crossscripts:/medi=
a/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/sbin:/media/pangu/lsbt/tmp/sysro=
ots/x86_64-linux/usr/bin:/media/pangu/lsbt/tmp/sysroots/x86_64-linux/sbin:/=
media/pangu/lsbt/tmp/sysroots/x86_64-linux//bin:/media/pangu/lsbt:/media/pa=
ngu/optimus/scripts:/media/pangu/optimus/bitbake/bin/:/usr/local/bin:/usr/b=
in:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:/media/pangu/opt=
imus/scripts"
> >
> > 3. ../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink
> > x86_64-poky-linux-gcc    -m64
> > --sysroot=3D/media/pangu/lsbt/tmp/sysroots/qemux86-64  -O2 -pipe -g
> > -feliminate-unused-debug-types -Wall -DGCONF_ENABLE_DEBUG=3D1  -Wl,-O1
> > -Wl,--hash-style=3Dgnu -Wl,--as-needed -o gconf-sanity-check-2
> > gconf-sanity-check.o libgconf-2.la   -pthread -Wl,--export-dynamic
> > -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0
> > -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype
> > -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0
> > -lxml2
> >
> >
> > 4. and then I can get the error, after add '-t -v' in the step 2, I got=
:
> > x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64
> > --sysroot=3D/media/pangu/lsbt/tmp/sysroots/qemux86-64 -O2 -pipe -g
> > -feliminate-unused-debug-types -Wall -DGCONF_ENABLE_DEBUG=3D1 -Wl,-O1
> > -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/gconf-sanity-check-2
> > gconf-sanity-check.o -pthread -Wl,--export-dynamic -t
> > -v  ./.libs/libgconf-2.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr=
/lib/libdbus-glib-1.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/li=
bdbus-1.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgtk-x11-2.0=
.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgdk-x11-2.0.so /me=
dia/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libatk-1.0.so /media/pangu/l=
sbt/tmp/sysroots/qemux86-64/usr/lib/libpangocairo-1.0.so /media/pangu/lsbt/=
tmp/sysroots/qemux86-64/usr/lib/libpangoft2-1.0.so /media/pangu/lsbt/tmp/sy=
sroots/qemux86-64/usr/lib/../lib/libstdc++.so /media/pangu/lsbt/tmp/sysroot=
s/qemux86-64/usr/lib/libgdk_pixbuf-2.0.so /media/pangu/lsbt/tmp/sysroots/qe=
mux86-64/usr/lib/libgio-2.0.so -lresolv /media/pangu/lsbt/tmp/sysroots/qemu=
x86-64/usr/lib/libcairo.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/li=
b/libpixman-1.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpng12=
.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libXrender.so /media/=
pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libX11.so /media/pangu/lsbt/tmp/=
sysroots/qemux86-64/usr/lib/libxcb.so /media/pangu/lsbt/tmp/sysroots/qemux8=
6-64/usr/lib/libXau.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/li=
bXdmcp.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpango-1.0.so=
 /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libfontconfig.so /media/=
pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libfreetype.so /media/pangu/lsbt=
/tmp/sysroots/qemux86-64/usr/lib/libexpat.so /media/pangu/lsbt/tmp/sysroots=
/qemux86-64/usr/lib/libgobject-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux8=
6-64/usr/lib/libffi.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/li=
bgmodule-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgthrea=
d-2.0.so -lpthread /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgli=
b-2.0.so -lrt /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libxml2.so =
-ldl -lz -lm -pthread -Wl,-rpath -Wl,/usr/lib/../lib
> > Using built-in specs.
> > COLLECT_GCC=3Dx86_64-poky-linux-gcc
> > COLLECT_LTO_WRAPPER=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/l=
ibexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.6.4/lto-wrapper
> > Target: x86_64-poky-linux
> > Configured with: /media/pangu/lsbt/tmp/work-shared/gcc-4.6.3
> > +svnr184847-r23/gcc-4_6-branch/configure --build=3Dx86_64-linux
> > --host=3Dx86_64-linux --target=3Dx86_64-poky-linux
> > --prefix=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr
> > --exec_prefix=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr
> > --bindir=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/bin/x86_64-p=
oky-linux --sbindir=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/bin/x=
86_64-poky-linux --libexecdir=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux=
/usr/libexec/x86_64-poky-linux --datadir=3D/media/pangu/lsbt/tmp/sysroots/x=
86_64-linux/usr/share --sysconfdir=3D/media/pangu/lsbt/tmp/sysroots/x86_64-=
linux/etc --sharedstatedir=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/co=
m --localstatedir=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/var --libdi=
r=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/lib/x86_64-poky-linux -=
-includedir=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/include --old=
includedir=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/include --info=
dir=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/share/info --mandir=
=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/share/man --disable-sile=
nt-rules --disable-dependency-tracking --with-libtool-sysroot=3D/media/pang=
u/lsbt/tmp/sysroots/x86_64-linux --with-gnu-ld --enable-shared --enable-lan=
guages=3Dc,c++ --enable-threads=3Dposix --disable-multilib --enable-c99 --e=
nable-long-long --enable-symvers=3Dgnu --enable-libstdcxx-pch --program-pre=
fix=3Dx86_64-poky-linux- --enable-target-optspace --enable-lto --enable-lib=
ssp --disable-bootstrap --disable-libgomp --disable-libmudflap --with-syste=
m-zlib --with-linker-hash-style=3Dgnu --enable-cheaders=3Dc_global --with-l=
ocal-prefix=3D/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr --with-gxx-incl=
ude-dir=3D/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/include/c++ --with-=
sysroot=3D/media/pangu/lsbt/tmp/sysroots/qemux86-64 --with-build-sysroot=3D=
/media/pangu/lsbt/tmp/sysroots/qemux86-64 --enable-poison-system-directorie=
s --with-headers=3D/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/include --=
disable-libunwind-exceptions --with-mpfr=3D/media/pangu/lsbt/tmp/sysroots/x=
86_64-linux/usr --with-system-zlib --disable-nls --enable-__cxa_atexit
> > Thread model: posix
> > gcc version 4.6.4 20120303 (prerelease) (GCC)
> > COMPILER_PATH=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/libexec=
/x86_64-poky-linux/gcc/x86_64-poky-linux/4.6.4/:/media/pangu/lsbt/tmp/sysro=
ots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.6.4/=
:/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/=
gcc/x86_64-poky-linux/:/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/lib/=
x86_64-poky-linux/gcc/x86_64-poky-linux/4.6.4/:/media/pangu/lsbt/tmp/sysroo=
ts/x86_64-linux/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/
> > LIBRARY_PATH=3D/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/lib/x86_=
64-poky-linux/gcc/x86_64-poky-linux/4.6.4/:/media/pangu/lsbt/tmp/sysroots/x=
86_64-linux/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/4.6.4/../../../=
../../x86_64-poky-linux/lib/../lib/:/media/pangu/lsbt/tmp/sysroots/qemux86-=
64/lib/../lib/:/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/x86_64-pok=
y-linux/4.6.4/:/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/:/m=
edia/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/lib/x86_64-poky-linux/gcc/x86=
_64-poky-linux/4.6.4/../../../../../x86_64-poky-linux/lib/:/media/pangu/lsb=
t/tmp/sysroots/qemux86-64/lib/:/media/pangu/lsbt/tmp/sysroots/qemux86-64/us=
r/lib/
> > COLLECT_GCC_OPTIONS=3D'--sysroot=3D/media/pangu/lsbt/tmp/sysroots/qemux=
86-64' '-m64' '-O2' '-pipe' '-g' '-feliminate-unused-debug-types' '-Wall' '=
-D' 'GCONF_ENABLE_DEBUG=3D1' '-o' '.libs/gconf-sanity-check-2' '-pthread' '=
-t' '-v' '-pthread' '-mtune=3Dgeneric' '-march=3Dx86-64'
> >  /media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-li=
nux/gcc/x86_64-poky-linux/4.6.4/collect2 --sysroot=3D/media/pangu/lsbt/tmp/=
sysroots/qemux86-64 --eh-frame-hdr --hash-style=3Dgnu -m elf_x86_64 -dynami=
c-linker /lib/ld-linux-x86-64.so.2 -o .libs/gconf-sanity-check-2 -t /media/=
pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/crt1.o /media/pangu/lsbt/=
tmp/sysroots/qemux86-64/usr/lib/../lib/crti.o /media/pangu/lsbt/tmp/sysroot=
s/qemux86-64/usr/lib/x86_64-poky-linux/4.6.4/crtbegin.o -L/media/pangu/lsbt=
/tmp/sysroots/x86_64-linux/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/=
4.6.4 -L/media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/lib/x86_64-poky-lin=
ux/gcc/x86_64-poky-linux/4.6.4/../../../../../x86_64-poky-linux/lib/../lib =
-L/media/pangu/lsbt/tmp/sysroots/qemux86-64/lib/../lib -L/media/pangu/lsbt/=
tmp/sysroots/qemux86-64/usr/lib/x86_64-poky-linux/4.6.4 -L/media/pangu/lsbt=
/tmp/sysroots/qemux86-64/usr/lib/../lib -L/media/pangu/lsbt/tmp/sysroots/x8=
6_64-linux/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/4.6.4/../../../.=
./../x86_64-poky-linux/lib -L/media/pangu/lsbt/tmp/sysroots/qemux86-64/lib =
-L/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib -O1 --hash-style=3Dgnu =
--as-needed gconf-sanity-check.o --export-dynamic ./.libs/libgconf-2.so /me=
dia/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libdbus-glib-1.so /media/pan=
gu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libdbus-1.so /media/pangu/lsbt/tmp/=
sysroots/qemux86-64/usr/lib/libgtk-x11-2.0.so /media/pangu/lsbt/tmp/sysroot=
s/qemux86-64/usr/lib/libgdk-x11-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux=
86-64/usr/lib/libatk-1.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/l=
ib/libpangocairo-1.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/l=
ibpangoft2-1.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/=
libstdc++.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgdk_pixbu=
f-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgio-2.0.so -l=
resolv /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libcairo.so /media=
/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpixman-1.so /media/pangu/lsb=
t/tmp/sysroots/qemux86-64/usr/lib/libpng12.so /media/pangu/lsbt/tmp/sysroot=
s/qemux86-64/usr/lib/libXrender.so /media/pangu/lsbt/tmp/sysroots/qemux86-6=
4/usr/lib/libX11.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libxc=
b.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libXau.so /media/pan=
gu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libXdmcp.so /media/pangu/lsbt/tmp/s=
ysroots/qemux86-64/usr/lib/libpango-1.0.so /media/pangu/lsbt/tmp/sysroots/q=
emux86-64/usr/lib/libfontconfig.so /media/pangu/lsbt/tmp/sysroots/qemux86-6=
4/usr/lib/libfreetype.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/=
libexpat.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgobject-2.=
0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libffi.so /media/pan=
gu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgmodule-2.0.so /media/pangu/lsbt=
/tmp/sysroots/qemux86-64/usr/lib/libgthread-2.0.so -lpthread /media/pangu/l=
sbt/tmp/sysroots/qemux86-64/usr/lib/libglib-2.0.so -lrt /media/pangu/lsbt/t=
mp/sysroots/qemux86-64/usr/lib/libxml2.so -ldl -lz -lm -rpath /usr/lib/../l=
ib -lgcc --as-needed -lgcc_s --no-as-needed -lpthread -lc -lgcc --as-needed=
 -lgcc_s --no-as-needed /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/x=
86_64-poky-linux/4.6.4/crtend.o /media/pangu/lsbt/tmp/sysroots/qemux86-64/u=
sr/lib/../lib/crtn.o
> > /media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-lin=
ux/gcc/x86_64-poky-linux/4.6.4/ld: mode elf_x86_64
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/crt1.o
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/crti.o
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/x86_64-poky-linux/4.6=
.4/crtbegin.o
> > gconf-sanity-check.o
> > ./.libs/libgconf-2.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libdbus-glib-1.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libdbus-1.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgtk-x11-2.0.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgdk-x11-2.0.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libatk-1.0.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpangocairo-1.0.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpangoft2-1.0.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/libstdc++.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgdk_pixbuf-2.0.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgio-2.0.so
> > -lresolv
> > (/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/libresolv.so)
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libcairo.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpixman-1.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpng12.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libXrender.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libX11.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libxcb.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libXau.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libXdmcp.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpango-1.0.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libfontconfig.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libfreetype.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libexpat.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgobject-2.0.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libffi.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgmodule-2.0.so
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgthread-2.0.so
> > /lib/libpthread.so.0
> > (/media/pangu/lsbt/tmp/sysroots/qemux86-64/lib/libpthread.so.0)
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libglib-2.0.so
> > -lrt (/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/librt.so=
)
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libxml2.so
> > -ldl (/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/libdl.so=
)
> > -lz (/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/libz.so)
> > -lm (/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/libm.so)
> > -lgcc_s
> > (/media/pangu/lsbt/tmp/sysroots/qemux86-64/lib/../lib/libgcc_s.so)
> > /lib/libpthread.so.0
> > (/media/pangu/lsbt/tmp/sysroots/qemux86-64/lib/libpthread.so.0)
> > /lib/libc.so.6 (/media/pangu/lsbt/tmp/sysroots/qemux86-64/lib/libc.so.6=
)
> > (/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libc_nonshared.a)elf=
-init.oS
> > /lib/ld-linux-x86-64.so.2
> > (/media/pangu/lsbt/tmp/sysroots/qemux86-64/lib/ld-linux-x86-64.so.2)
> > -lgcc_s
> > (/media/pangu/lsbt/tmp/sysroots/qemux86-64/lib/../lib/libgcc_s.so)
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/x86_64-poky-linux/4.6=
.4/crtend.o
> > /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/crtn.o
> > /usr/lib/../lib/libXrandr.so.2: undefined reference to
> > `memcpy@GLIBC_2.14'
> > /media/pangu/lsbt/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-lin=
ux/gcc/x86_64-poky-linux/4.6.4/ld: link errors found, deleting executable `=
.libs/gconf-sanity-check-2'
> > collect2: ld returned 1 exit status
> >
> >
> > On Tue, 2012-03-20 at 17:20 +0800, =E5=80=AA=E5=BA=86=E4=BA=AE wrote:
> > > I do a clean building with the same error. I have not touched the
> > > specific glibc version.
> > >
> > > as I said, the do_compile should use the libXrandr in build_sysroot
> > > directory, but it used it in host system. and I have checked that, th=
ere
> > > IS the lib in build_sysroot directory.
> > >
> > > you can build it successfully, only because your host's lib is using
> > > glibc 2.13, but I'm using archlinux, all package is the newest.
> > >
> > > the gconf used host's libXrandr, but want check its dependency in
> > > build_sysroot, that is the reason, MAYBE.
> > >
> > > I will do a clean building again, and I don't think it will change
> > > anything.
> > >
> > > On Fri, 2012-03-16 at 23:36 +0800, Mark Hatle wrote:
> > > > On 3/16/12 12:18 AM, Ni Qingliang wrote:
> > > > > when building qemux86-64 arch core-image-lsb (distro is poky-lsb)=
, I got
> > > > > /usr/lib/../lib/libXrandr.so.2: undefined reference to
> > > > > `memcpy@GLIBC_2.14' when 'do_compile' gconf 3.2.3.
> > > > >
> > > > > the default eglibc is 2.13, why it needs 2.14?
> > > >
> > > > Without anything further, the only guess I can make is that either =
you aren't
> > > > using the version of glibc you think you are, it's gotten some host
> > > > contamination, an explicit reference was added to libXrandr (doubtf=
ul), or you
> > > > are using something that was built/cached from a previous build.  (=
i.e. did you
> > > > build w/ eglibc 2.14/2.15 -- and then switch back to eglibc 2.13 fo=
r some reason?)
> > > >
> > > > On 3/15/12 9:38 PM, Ni Qingliang wrote:
> > > >  > first, thanks your reply.
> > > >  >
> > > >  > Because I can't use task-core-lsb on my device (flash space is n=
ot
> > > >  > enough), I have to make a custom lsb-base image (without
> > > >  > perl/python/graphics).
> > > >  >
> > > >  > I have checked the "linuxstdbase", and it will change the config=
ure
> > > >  > option of some packages.
> > > >  >
> > > >  > Indeed, I think the daemon/failure/warning fuctions should be co=
nsidered
> > > >  > in package lsb's RDEPENDS.
> > > >  >
> > > >  > what I want to know is the rdepends or where is the
> > > >  > daemon/failure/warning.
> > > >
> > > > It certainly looks like a component is missing somewhere in the she=
ll scrips
> > > > that are provided by the LSB functions.  I would assume that the
> > > > depends/provides is setup properly to point to whatever should be p=
roviding the
> > > > missing daemon, failure, warning commands.  If it's not (or if by d=
efault -- non
> > > > lsb mode) they're not being built, it's a definite bug.  You should=
n't be able
> > > > to build a non-functional systems.
> > > >
> > > > Please file a defect on bugzilla.yoctoproject.org.  I will attempt =
to
> > > > investigate it (or someone else can).  Hopefully it's just as a sim=
ple as a
> > > > missing dependency.
> > > >
> > > > --Mark
> > > >
> > > > > On Fri, 2012-03-16 at 00:25 +0800, Mark Hatle wrote:
> > > > >> On 3/15/12 3:18 AM, Ni Qingliang wrote:
> > > > >>> Hello, I'm working on custom lsb-base image using oe-core.
> > > > >>>
> > > > >>> and when using the lsb script, found error:
> > > > >>>
> > > > >>> lsb_start_daemon line 44: daemon command not found.
> > > > >>>
> > > > >>> similar thing happend on lsb_log_message: failure and warning c=
ommand
> > > > >>> not found.
> > > > >>>
> > > > >>> maybe these function should be defined in /etc/init.d/functions=
?
> > > > >>>
> > > > >>> but there are not these function in this file (belongs to inits=
cripts).
> > > > >>
> > > > >> Did you enable the LSB distribution settings?  Without this, var=
ious components
> > > > >> may not be available.
> > > > >>
> > > > >> In Poky, there is a "poky-lsb" distribution type:
> > > > >>
> > > > >> DISTRO =3D "poky-lsb"
> > > > >> DISTROOVERRIDES =3D "poky:linuxstdbase"
> > > > >>
> > > > >> DISTRO_FEATURES_append =3D " pam largefile opengl"
> > > > >> PREFERRED_PROVIDER_virtual/libx11 =3D "libx11"
> > > > >>
> > > > >> (as well as using the core-image-lsb and/or task-core-lsb compon=
ents.)
> > > > >>
> > > > >> If you've tried this and those items are still broken, let me kn=
ow and I can
> > > > >> help investigate further.  (One final note, only LSB 1.4 is curr=
ently supported.)
> > > > >>
> > > > >> --Mark
> > > > >>
> > > > >>> Any idea?
> > > > >>>
> > > > >>> thanks!
> > > > >>>
> > > > >>>
> > > > >>
> > > > >>
> > > > >> _______________________________________________
> > > > >> Openembedded-core mailing list
> > > > >> Openembedded-core@lists.openembedded.org
> > > > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core
> > > > >
> > > >
> > > >
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re
> > >
> > > --
> > > Yi Qingliang
> > > niqingliang@insigma.com.cn
> > > https://niqingliang2003.wordpress.com
> > >
> >
> > --
> > Yi Qingliang
> > niqingliang@insigma.com.cn
> > https://niqingliang2003.wordpress.com
> >
>=20
> --
> Yi Qingliang
> niqingliang@insigma.com.cn
> https://niqingliang2003.wordpress.com
>=20

--=20
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



