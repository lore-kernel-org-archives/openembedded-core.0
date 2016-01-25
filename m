Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D001476F8C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 09:40:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2016 01:40:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,343,1449561600"; d="scan'208";a="897717376"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2016 01:40:50 -0800
Date: Mon, 25 Jan 2016 11:43:04 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20160125094303.GA25619@mbabyjoh-mobl.fi.intel.com>
References: <1452681963-25495-1-git-send-email-maxin.john@intel.com>
	<CAJ86T=Uc5XTZu5UGPZfck9Vt6V-c=dBTD9mXdq+ZaT_0qsz7mw@mail.gmail.com>
	<CAJ86T=Vk8ztbp-Sos0U1X7JtgJ+TqUV6mMs9c7B6rUPDW-gkfg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Vk8ztbp-Sos0U1X7JtgJ+TqUV6mMs9c7B6rUPDW-gkfg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sqlite3: upgrade to version 3.10.0
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
X-List-Received-Date: Mon, 25 Jan 2016 09:40:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 22, 2016 at 11:02:59AM -0800, Andre McCurdy wrote:
> On Thu, Jan 21, 2016 at 11:08 PM, Andre McCurdy <armccurdy@gmail.com> wro=
te:
> > On Wed, Jan 13, 2016 at 2:46 AM, Maxin B. John <maxin.john@intel.com> w=
rote:
> >> 3.9.2 -> 3.10.0
> >>
> >> 1. Fixed a parallel build problem
> >> 2. Added a PACKAGECONFIG for readline
> >>
> >> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >> ---
> >>  meta/recipes-support/sqlite/sqlite3.inc            |  2 ++
> >>  meta/recipes-support/sqlite/sqlite3/parallel.patch | 24 +++++++++++++=
+++++++++
> >>  .../sqlite/{sqlite3_3.9.2.bb =3D> sqlite3_3.10.0.bb} |  8 +++++---
> >>  3 files changed, 31 insertions(+), 3 deletions(-)
> >>  create mode 100644 meta/recipes-support/sqlite/sqlite3/parallel.patch
> >>  rename meta/recipes-support/sqlite/{sqlite3_3.9.2.bb =3D> sqlite3_3.1=
0.0.bb} (71%)
> >>
> >> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-su=
pport/sqlite/sqlite3.inc
> >> index 2e3791b..5eb5de3 100644
> >> --- a/meta/recipes-support/sqlite/sqlite3.inc
> >> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> >> @@ -9,6 +9,8 @@ inherit autotools pkgconfig
> >>
> >>  EXTRA_OECONF =3D "--enable-shared --enable-threadsafe"
> >>  EXTRA_OECONF_class-native =3D "--enable-shared --enable-threadsafe --=
disable-readline"
> >> +PACKAGECONFIG[readline] =3D "--enable-readline,--disable-readline,rea=
dline"
> >
> > Adding this without also adding PACKAGECONFIG ?=3D "readline" or similar
> > means target sqlite3 will now build with readline support disabled.
> >
> > Was that the intention?

I think it was a mistake from my side. Sorry about that.

> >>  export config_BUILD_CC =3D "${BUILD_CC}"
> >>  export config_BUILD_CFLAGS =3D "${BUILD_CFLAGS}"
> >>  export config_BUILD_LIBS =3D "${BUILD_LDFLAGS}"
> >> diff --git a/meta/recipes-support/sqlite/sqlite3/parallel.patch b/meta=
/recipes-support/sqlite/sqlite3/parallel.patch
> >> new file mode 100644
> >> index 0000000..87471f0
> >> --- /dev/null
> >> +++ b/meta/recipes-support/sqlite/sqlite3/parallel.patch
> >> @@ -0,0 +1,24 @@
> >> +build: Fix parallel build problems
> >> +
> >> +Avoid parallel build errors related to sqlite3.o target.
> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >> +---
> >> +diff -Naur sqlite-autoconf-3100000-orig/Makefile.am sqlite-autoconf-3=
100000/Makefile.am
> >> +--- sqlite-autoconf-3100000-orig/Makefile.am  2016-01-06 14:03:00.000=
000000 +0200
> >> ++++ sqlite-autoconf-3100000/Makefile.am       2016-01-12 13:14:03.620=
117514 +0200
> >> +@@ -6,10 +6,8 @@
> >> + libsqlite3_la_LDFLAGS =3D -no-undefined -version-info 8:6:8
> >> +
> >> + bin_PROGRAMS =3D sqlite3
> >> +-sqlite3_SOURCES =3D shell.c sqlite3.h
> >> +-EXTRA_sqlite3_SOURCES =3D sqlite3.c
> >> +-sqlite3_LDADD =3D @EXTRA_SHELL_OBJ@ @READLINE_LIBS@
> >> +-sqlite3_DEPENDENCIES =3D @EXTRA_SHELL_OBJ@
> >> ++sqlite3_SOURCES =3D shell.c sqlite3.c sqlite3.h
> >> ++sqlite3_LDADD =3D @READLINE_LIBS@
> >> + sqlite3_CFLAGS =3D $(AM_CFLAGS)
>=20
> This change is wrong. If you unconditionally add sqlite3.c to
> sqlite3_SOURCES you break the option of dynamically linking sqlite3
> with libsqlite3.so (ie the configure option --disable-static-shell).
>=20
> (For building in OE we should probably be configuring with
> --disable-static-shell by default).
>=20
> What was the original parallel build issue you were seeing?
>

Here is the error message without this patch:

ERROR: oe_runmake failed
ERROR: Function failed: do_compile (log file is located at /home/maxin/poky=
/build/tmp/work/x86_64-linux/sqlite3-native/3_3.10.0-r0/temp/log.do_compile=
=2E31853)
ERROR: Logfile of failure stored in: /home/maxin/poky/build/tmp/work/x86_64=
-linux/sqlite3-native/3_3.10.0-r0/temp/log.do_compile.31853
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16
| ./x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc  -DPACKAGE_NAME=
=3D\"sqlite\" -DPACKAGE_TARNAME=3D\"sqlite\" -DPACKAGE_VERSION=3D\"3.10.0\"=
 -DPACKAGE_STRING=3D\"sqlite\ 3.10.0\" -DPACKAGE_BUGREPORT=3D\"http://www.s=
qlite.org\" -DPACKAGE_URL=3D\"\" -DPACKAGE=3D\"sqlite\" -DVERSION=3D\"3.10.=
0\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_=
STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -=
DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=
=3D1 -DLT_OBJDIR=3D\".libs/\" -DHAVE_FDATASYNC=3D1 -DHAVE_USLEEP=3D1 -DHAVE=
_LOCALTIME_R=3D1 -DHAVE_GMTIME_R=3D1 -DHAVE_DECL_STRERROR_R=3D1 -DHAVE_STRE=
RROR_R=3D1 -DHAVE_POSIX_FALLOCATE=3D1 -I. -I../sqlite-autoconf-3100000   -i=
system/home/maxin/poky/build/tmp/sysroots/x86_64-linux/usr/include -D_REENT=
RANT=3D1 -DSQLITE_THREADSAFE=3D1    -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_RT=
REE -isystem/home/maxin/poky/build/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -DUSE_PREAD -DSQLITE_ENABLE_COLUMN_METADATA -c -o sqlite3.lo ../sql=
ite-autoconf-3100000/sqlite3.c
| gcc  -DPACKAGE_NAME=3D\"sqlite\" -DPACKAGE_TARNAME=3D\"sqlite\" -DPACKAGE=
_VERSION=3D\"3.10.0\" -DPACKAGE_STRING=3D\"sqlite\ 3.10.0\" -DPACKAGE_BUGRE=
PORT=3D\"http://www.sqlite.org\" -DPACKAGE_URL=3D\"\" -DPACKAGE=3D\"sqlite\=
" -DVERSION=3D\"3.10.0\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPES_H=3D1 -DHAVE_S=
YS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -=
DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD=
_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".libs/\" -DHAVE_FDATASYNC=3D1 -DH=
AVE_USLEEP=3D1 -DHAVE_LOCALTIME_R=3D1 -DHAVE_GMTIME_R=3D1 -DHAVE_DECL_STRER=
ROR_R=3D1 -DHAVE_STRERROR_R=3D1 -DHAVE_POSIX_FALLOCATE=3D1 -I. -I../sqlite-=
autoconf-3100000   -isystem/home/maxin/poky/build/tmp/sysroots/x86_64-linux=
/usr/include -D_REENTRANT=3D1 -DSQLITE_THREADSAFE=3D1    -DSQLITE_ENABLE_FT=
S3 -DSQLITE_ENABLE_RTREE -isystem/home/maxin/poky/build/tmp/sysroots/x86_64=
-linux/usr/include -O2 -pipe -DUSE_PREAD -DSQLITE_ENABLE_COLUMN_METADATA -c=
 -o sqlite3-shell.o `test -f 'shell.c' || echo '../sqlite-autoconf-3100000/=
'`shell.c
| gcc  -DPACKAGE_NAME=3D\"sqlite\" -DPACKAGE_TARNAME=3D\"sqlite\" -DPACKAGE=
_VERSION=3D\"3.10.0\" -DPACKAGE_STRING=3D\"sqlite\ 3.10.0\" -DPACKAGE_BUGRE=
PORT=3D\"http://www.sqlite.org\" -DPACKAGE_URL=3D\"\" -DPACKAGE=3D\"sqlite\=
" -DVERSION=3D\"3.10.0\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPES_H=3D1 -DHAVE_S=
YS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -=
DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD=
_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".libs/\" -DHAVE_FDATASYNC=3D1 -DH=
AVE_USLEEP=3D1 -DHAVE_LOCALTIME_R=3D1 -DHAVE_GMTIME_R=3D1 -DHAVE_DECL_STRER=
ROR_R=3D1 -DHAVE_STRERROR_R=3D1 -DHAVE_POSIX_FALLOCATE=3D1 -I. -I../sqlite-=
autoconf-3100000   -isystem/home/maxin/poky/build/tmp/sysroots/x86_64-linux=
/usr/include -D_REENTRANT=3D1 -DSQLITE_THREADSAFE=3D1    -DSQLITE_ENABLE_FT=
S3 -DSQLITE_ENABLE_RTREE -isystem/home/maxin/poky/build/tmp/sysroots/x86_64=
-linux/usr/include -O2 -pipe -DUSE_PREAD -DSQLITE_ENABLE_COLUMN_METADATA -c=
 -o sqlite3.o ../sqlite-autoconf-3100000/sqlite3.c
| x86_64-linux-libtool: compile:  gcc -DPACKAGE_NAME=3D\"sqlite\" -DPACKAGE=
_TARNAME=3D\"sqlite\" -DPACKAGE_VERSION=3D\"3.10.0\" "-DPACKAGE_STRING=3D\"=
sqlite 3.10.0\"" -DPACKAGE_BUGREPORT=3D\"http://www.sqlite.org\" -DPACKAGE_=
URL=3D\"\" -DPACKAGE=3D\"sqlite\" -DVERSION=3D\"3.10.0\" -DSTDC_HEADERS=3D1=
 -DHAVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_ST=
RING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -=
DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".=
libs/\" -DHAVE_FDATASYNC=3D1 -DHAVE_USLEEP=3D1 -DHAVE_LOCALTIME_R=3D1 -DHAV=
E_GMTIME_R=3D1 -DHAVE_DECL_STRERROR_R=3D1 -DHAVE_STRERROR_R=3D1 -DHAVE_POSI=
X_FALLOCATE=3D1 -I. -I../sqlite-autoconf-3100000 -isystem/home/maxin/poky/b=
uild/tmp/sysroots/x86_64-linux/usr/include -D_REENTRANT=3D1 -DSQLITE_THREAD=
SAFE=3D1 -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_RTREE -isystem/home/maxin/pok=
y/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DUSE_PREAD -DSQLIT=
E_ENABLE_COLUMN_METADATA -c ../sqlite-autoconf-3100000/sqlite3.c  -fPIC -DP=
IC -o .libs/sqlite3.o
| x86_64-linux-libtool: compile:  gcc -DPACKAGE_NAME=3D\"sqlite\" -DPACKAGE=
_TARNAME=3D\"sqlite\" -DPACKAGE_VERSION=3D\"3.10.0\" "-DPACKAGE_STRING=3D\"=
sqlite 3.10.0\"" -DPACKAGE_BUGREPORT=3D\"http://www.sqlite.org\" -DPACKAGE_=
URL=3D\"\" -DPACKAGE=3D\"sqlite\" -DVERSION=3D\"3.10.0\" -DSTDC_HEADERS=3D1=
 -DHAVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_ST=
RING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -=
DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".=
libs/\" -DHAVE_FDATASYNC=3D1 -DHAVE_USLEEP=3D1 -DHAVE_LOCALTIME_R=3D1 -DHAV=
E_GMTIME_R=3D1 -DHAVE_DECL_STRERROR_R=3D1 -DHAVE_STRERROR_R=3D1 -DHAVE_POSI=
X_FALLOCATE=3D1 -I. -I../sqlite-autoconf-3100000 -isystem/home/maxin/poky/b=
uild/tmp/sysroots/x86_64-linux/usr/include -D_REENTRANT=3D1 -DSQLITE_THREAD=
SAFE=3D1 -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_RTREE -isystem/home/maxin/pok=
y/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DUSE_PREAD -DSQLIT=
E_ENABLE_COLUMN_METADATA -c ../sqlite-autoconf-3100000/sqlite3.c -o sqlite3=
=2Eo >/dev/null 2>&1
| ./x86_64-linux-libtool  --tag=3DCC   --mode=3Dlink gcc  -D_REENTRANT=3D1 =
-DSQLITE_THREADSAFE=3D1    -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_RTREE -isys=
tem/home/maxin/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -=
DUSE_PREAD -DSQLITE_ENABLE_COLUMN_METADATA  -L/home/maxin/poky/build/tmp/sy=
sroots/x86_64-linux/usr/lib -L/home/maxin/poky/build/tmp/sysroots/x86_64-li=
nux/lib -Wl,-rpath-link,/home/maxin/poky/build/tmp/sysroots/x86_64-linux/us=
r/lib -Wl,-rpath-link,/home/maxin/poky/build/tmp/sysroots/x86_64-linux/lib =
-Wl,-rpath,/home/maxin/poky/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rp=
ath,/home/maxin/poky/build/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o sqlite3=
 sqlite3-shell.o sqlite3.o  -ldl -lpthread
| x86_64-linux-libtool: link: gcc -D_REENTRANT=3D1 -DSQLITE_THREADSAFE=3D1 =
-DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_RTREE -isystem/home/maxin/poky/build/t=
mp/sysroots/x86_64-linux/usr/include -O2 -pipe -DUSE_PREAD -DSQLITE_ENABLE_=
COLUMN_METADATA -Wl,-rpath-link -Wl,/home/maxin/poky/build/tmp/sysroots/x86=
_64-linux/usr/lib -Wl,-rpath-link -Wl,/home/maxin/poky/build/tmp/sysroots/x=
86_64-linux/lib -Wl,-rpath -Wl,/home/maxin/poky/build/tmp/sysroots/x86_64-l=
inux/usr/lib -Wl,-rpath -Wl,/home/maxin/poky/build/tmp/sysroots/x86_64-linu=
x/lib -Wl,-O1 -o sqlite3 sqlite3-shell.o sqlite3.o  -L/home/maxin/poky/buil=
d/tmp/sysroots/x86_64-linux/usr/lib -L/home/maxin/poky/build/tmp/sysroots/x=
86_64-linux/lib -ldl -lpthread
| sqlite3.o: file not recognized: File truncated
| collect2: error: ld returned 1 exit status
| Makefile:507: recipe for target 'sqlite3' failed
| make: *** [sqlite3] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at /home/maxin/po=
ky/build/tmp/work/x86_64-linux/sqlite3-native/3_3.10.0-r0/temp/log.do_compi=
le.31853)

ERROR: Task 142 (virtual:native:/home/maxin/poky/meta/recipes-support/sqlit=
e/sqlite3_3.10.0.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 354 tasks of which 340 didn't need to be rer=
un and 1 failed.
No currently running tasks (354 of 518)

Summary: 1 task failed:
  virtual:native:/home/maxin/poky/meta/recipes-support/sqlite/sqlite3_3.10.=
0.bb, do_compile
  Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.


> >> + include_HEADERS =3D sqlite3.h sqlite3ext.h
> >> diff --git a/meta/recipes-support/sqlite/sqlite3_3.9.2.bb b/meta/recip=
es-support/sqlite/sqlite3_3.10.0.bb
> >> similarity index 71%
> >> rename from meta/recipes-support/sqlite/sqlite3_3.9.2.bb
> >> rename to meta/recipes-support/sqlite/sqlite3_3.10.0.bb
> >> index 18b1a2b..092f782 100644
> >> --- a/meta/recipes-support/sqlite/sqlite3_3.9.2.bb
> >> +++ b/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
> >> @@ -10,10 +10,12 @@ def sqlite_download_version(d):
> >>
> >>  PE =3D "3"
> >>  SQLITE_PV =3D "${@sqlite_download_version(d)}"
> >> -SRC_URI =3D "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.=
tar.gz"
> >> +SRC_URI =3D "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.=
tar.gz \
> >> +           file://parallel.patch \
> >> +          "
> >>
> >> -SRC_URI[md5sum] =3D "bc4eb5b3fc5cfcb6e059794306cac1ca"
> >> -SRC_URI[sha256sum] =3D "064c0abe9c9177534d4c770bca7a5902f9924b629ac88=
6b4c08956be6dfbc36b"
> >> +SRC_URI[md5sum] =3D "274364e6ca5c1104d42912f11e61ed26"
> >> +SRC_URI[sha256sum] =3D "43cc292d70711fa7580250c8a1cd7c64813a4a0a479db=
d502cce5f10b5d91042"
> >>
> >>  UPSTREAM_CHECK_URI =3D "http://www.sqlite.org/"
> >>  UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
> >> --
> >> 2.4.0
> >>

Best Regards,
Maxin


