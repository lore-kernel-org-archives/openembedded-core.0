Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0R2z-0007xD-Bu
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 06:16:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Feb 2012 21:08:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128454608"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2012 21:08:30 -0800
Message-ID: <4F45C9CE.3040407@linux.intel.com>
Date: Wed, 22 Feb 2012 21:08:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328613884-19288-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1328613884-19288-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH 2/3] js: Update to v1.8.5
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
X-List-Received-Date: Thu, 23 Feb 2012 05:16:55 -0000
X-Groupsio-MsgNum: 17750
Content-Type: multipart/mixed; boundary="------------060709050405000509030504"

--------------060709050405000509030504
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2012 03:24 AM, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> Signed-off-by: Sergey 'Jin' Bostandzhyan<jin@mediatomb.cc>
> ---
>   meta/recipes-support/js/files/buildcc.patch       |   22 ------
>   meta/recipes-support/js/files/configure.ac        |   28 --------
>   meta/recipes-support/js/files/jsautocfg.h         |   74 ---------------------
>   meta/recipes-support/js/files/link_with_gcc.patch |   15 ----
>   meta/recipes-support/js/files/usepic.patch        |   26 -------
>   meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb      |   50 --------------
>   meta/recipes-support/js/js_1.8.5.bb               |   50 ++++++++++++++
>   7 files changed, 50 insertions(+), 215 deletions(-)
>   delete mode 100644 meta/recipes-support/js/files/buildcc.patch
>   delete mode 100644 meta/recipes-support/js/files/configure.ac
>   delete mode 100644 meta/recipes-support/js/files/jsautocfg.h
>   delete mode 100644 meta/recipes-support/js/files/link_with_gcc.patch
>   delete mode 100644 meta/recipes-support/js/files/usepic.patch
>   delete mode 100644 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
>   create mode 100644 meta/recipes-support/js/js_1.8.5.bb
>

I still seem to be getting a compile failure with js.  See the attached
failure log.


Sau!



> diff --git a/meta/recipes-support/js/files/buildcc.patch b/meta/recipes-support/js/files/buildcc.patch
> deleted file mode 100644
> index 19daf72..0000000
> --- a/meta/recipes-support/js/files/buildcc.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Upstream-Status: Pending
> -
> -jskwgen should be built by BUILD_CC in cross environment
> -
> -7/23/2010 - created by Qing He<qing.he@intel.com>
> -
> -diff -uNr js.orig//src/Makefile.ref js/src/Makefile.ref
> ---- js.orig//src/Makefile.ref	2009-02-25 21:24:29.000000000 +0800
> -+++ js/src/Makefile.ref	2010-07-23 13:26:51.000000000 +0800
> -@@ -303,10 +303,10 @@
> -
> - $(OBJDIR)/jskwgen.o: jskwgen.c jskeyword.tbl
> - 	@$(MAKE_OBJDIR)
> --	$(CC) -o $@ -c $(CFLAGS) $<
> -+	$(BUILD_CC) -o $@ -c $(BUILD_CFLAGS) $<
> -
> - $(OBJDIR)/jskwgen$(HOST_BIN_SUFFIX): $(OBJDIR)/jskwgen.$(OBJ_SUFFIX)
> --	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
> -+	$(BUILD_CC) -o $@ $(BUILD_CFLAGS) $(BUILD_LDFLAGS) $^
> -
> - endif
> -
> diff --git a/meta/recipes-support/js/files/configure.ac b/meta/recipes-support/js/files/configure.ac
> deleted file mode 100644
> index 41af298..0000000
> --- a/meta/recipes-support/js/files/configure.ac
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -AC_INIT
> -
> -AC_CHECK_SIZEOF([char])
> -AC_CHECK_SIZEOF([short])
> -AC_CHECK_SIZEOF([int])
> -AC_CHECK_SIZEOF([int64_t])
> -AC_CHECK_SIZEOF([long])
> -AC_CHECK_SIZEOF([long long])
> -AC_CHECK_SIZEOF([int *])
> -AC_CHECK_SIZEOF([float])
> -AC_CHECK_SIZEOF([double])
> -
> -AC_CHECK_ALIGNOF([char])
> -AC_CHECK_ALIGNOF([short])
> -AC_CHECK_ALIGNOF([int])
> -AC_CHECK_ALIGNOF([int64_t])
> -AC_CHECK_ALIGNOF([long])
> -AC_CHECK_ALIGNOF([long long])
> -AC_CHECK_ALIGNOF([int *])
> -AC_CHECK_ALIGNOF([float])
> -AC_CHECK_ALIGNOF([double])
> -
> -AC_C_BIGENDIAN
> -
> -AC_TYPE_LONG_LONG_INT
> -
> -AC_CONFIG_HEADER([conf.h])
> -AC_OUTPUT
> diff --git a/meta/recipes-support/js/files/jsautocfg.h b/meta/recipes-support/js/files/jsautocfg.h
> deleted file mode 100644
> index 295e491..0000000
> --- a/meta/recipes-support/js/files/jsautocfg.h
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -#ifndef js_cpucfg___
> -#define js_cpucfg___
> -
> -/* AUTOMATICALLY GENERATED - DO NOT EDIT */
> -
> -#include "conf.h"
> -
> -#ifdef WORDS_BIGENDIAN
> -# undef  IS_LITTLE_ENDIAN
> -# define IS_BIG_ENDIAN 1
> -#else
> -# define IS_LITTLE_ENDIAN 1
> -# undef  IS_BIG_ENDIAN
> -#endif
> -
> -#define __I_LOG2(n) (    \
> -        ((n) == 1)?   0: \
> -        ((n) == 2)?   1: \
> -        ((n) == 4)?   2: \
> -        ((n) == 8)?   3: \
> -        ((n) == 16)?  4: \
> -        ((n) == 32)?  5: \
> -        ((n) == 64)?  6: \
> -        ((n) == 128)? 7: \
> -            -1)
> -
> -#define JS_BYTES_PER_BYTE   SIZEOF_CHAR
> -#define JS_BYTES_PER_SHORT  SIZEOF_SHORT
> -#define JS_BYTES_PER_INT    SIZEOF_INT
> -#define JS_BYTES_PER_INT64  SIZEOF_INT64_T
> -#define JS_BYTES_PER_LONG   SIZEOF_LONG
> -#define JS_BYTES_PER_FLOAT  SIZEOF_FLOAT
> -#define JS_BYTES_PER_DOUBLE SIZEOF_DOUBLE
> -#define JS_BYTES_PER_WORD   SIZEOF_LONG
> -#define JS_BYTES_PER_DWORD  SIZEOF_LONG_LONG
> -
> -#define JS_BITS_PER_BYTE    8L
> -#define JS_BITS_PER_SHORT   (JS_BITS_PER_BYTE * JS_BYTES_PER_SHORT)
> -#define JS_BITS_PER_INT     (JS_BITS_PER_BYTE * JS_BYTES_PER_INT)
> -#define JS_BITS_PER_INT64   (JS_BITS_PER_BYTE * JS_BYTES_PER_INT64)
> -#define JS_BITS_PER_LONG    (JS_BITS_PER_BYTE * JS_BYTES_PER_LONG)
> -#define JS_BITS_PER_FLOAT   (JS_BITS_PER_BYTE * JS_BYTES_PER_GLOAT)
> -#define JS_BITS_PER_DOUBLE  (JS_BITS_PER_BYTE * JS_BYTES_PER_DOUBLE)
> -#define JS_BITS_PER_WORD    (JS_BITS_PER_BYTE * JS_BYTES_PER_WORD)
> -
> -#define JS_BITS_PER_BYTE_LOG2   __I_LOG2(JS_BITS_PER_BYTE)
> -#define JS_BITS_PER_SHORT_LOG2  __I_LOG2(JS_BITS_PER_BYTE)
> -#define JS_BITS_PER_INT_LOG2    __I_LOG2(JS_BITS_PER_BYTE)
> -#define JS_BITS_PER_INT64_LOG2  __I_LOG2(JS_BITS_PER_BYTE)
> -#define JS_BITS_PER_LONG_LOG2   __I_LOG2(JS_BITS_PER_BYTE)
> -#define JS_BITS_PER_FLOAT_LOG2  __I_LOG2(JS_BITS_PER_BYTE)
> -#define JS_BITS_PER_DOUBLE_LOG2 __I_LOG2(JS_BITS_PER_BYTE)
> -#define JS_BITS_PER_WORD_LOG2   __I_LOG2(JS_BITS_PER_BYTE)
> -
> -#define JS_ALIGN_OF_SHORT   ALIGNOF_SHORT
> -#define JS_ALIGN_OF_INT     ALIGNOF_INT
> -#define JS_ALIGN_OF_LONG    ALIGNOF_LONG
> -#define JS_ALIGN_OF_INT64   ALIGNOF_INT64_T
> -#define JS_ALIGN_OF_FLOAT   ALIGNOF_FLOAT
> -#define JS_ALIGN_OF_DOUBLE  ALIGNOF_DOUBLE
> -#define JS_ALIGN_OF_POINTER ALIGNOF_INT_P
> -#define JS_ALIGN_OF_WORD    ALIGNOF_LONG
> -
> -#define JS_BYTES_PER_WORD_LOG2   __I_LOG2(JS_BYTES_PER_WORD)
> -#define JS_BYTES_PER_DWORD_LOG2  __I_LOG2(JS_BYTES_PER_DWORDS)
> -#define JS_WORDS_PER_DWORD_LOG2  __I_LOG2(JS_BYTES_PER_DWORDS / JS_BYTES_PER_WORD)
> -
> -#define JS_STACK_GROWTH_DIRECTION (-1)
> -
> -#ifdef HAVE_LONG_LONG_INT
> -# define JS_HAVE_LONG_LONG
> -#endif
> -
> -#endif /* js_cpucfg___ */
> diff --git a/meta/recipes-support/js/files/link_with_gcc.patch b/meta/recipes-support/js/files/link_with_gcc.patch
> deleted file mode 100644
> index 988df61..0000000
> --- a/meta/recipes-support/js/files/link_with_gcc.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: src/config/Linux_All.mk
> -===================================================================
> ---- src.orig/config/Linux_All.mk	2005-05-10 19:53:44.000000000 +0000
> -+++ src/config/Linux_All.mk	2007-06-18 17:20:05.000000000 +0000
> -@@ -47,7 +47,7 @@
> - OS_CFLAGS = -DXP_UNIX -DSVR4 -DSYSV -D_BSD_SOURCE -DPOSIX_SOURCE -DHAVE_LOCALTIME_R
> -
> - RANLIB = echo
> --MKSHLIB = $(LD) -shared $(XMKSHLIBOPTS)
> -+MKSHLIB = $(CC) -shared $(XMKSHLIBOPTS)
> -
> - #.c.o:
> - #      $(CC) -c -MD $*.d $(CFLAGS) $<
> diff --git a/meta/recipes-support/js/files/usepic.patch b/meta/recipes-support/js/files/usepic.patch
> deleted file mode 100644
> index 91b0923..0000000
> --- a/meta/recipes-support/js/files/usepic.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Mips needs -fPIC to compile properly. These tests are broken anyway as they test
> -the build system architecture, not the target. This is a hack.
> -
> -RP 10/6/2010
> -
> -Index: src/config/Linux_All.mk
> -===================================================================
> ---- src.orig/config/Linux_All.mk	2010-06-10 22:09:43.000000000 +0100
> -+++ src/config/Linux_All.mk	2010-06-10 22:09:55.000000000 +0100
> -@@ -90,14 +90,10 @@
> - # Use the editline library to provide line-editing support.
> - JS_EDITLINE = 1
> -
> --ifeq ($(CPU_ARCH),x86_64)
> - # Use VA_COPY() standard macro on x86-64
> - # FIXME: better use it everywhere
> - OS_CFLAGS += -DHAVE_VA_COPY -DVA_COPY=va_copy
> --endif
> -
> --ifeq ($(CPU_ARCH),x86_64)
> - # We need PIC code for shared libraries
> - # FIXME: better patch rules.mk&  fdlibm/Makefile*
> - OS_CFLAGS += -DPIC -fPIC
> --endif
> diff --git a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
> deleted file mode 100644
> index adca44e..0000000
> --- a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -DESCRIPTION = "Spidermonkey: a javascript engine written in C"
> -HOMEPAGE = "http://www.mozilla.org/js/spidermonkey/"
> -SECTION = "libs"
> -
> -# the package is licensed under either of the following
> -LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://jsapi.c;beginline=4;endline=39;md5=347c6bbf4fb4547de1fa5ad830030063"
> -PR = "r3"
> -
> -SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/js-1.8.0-rc1.tar.gz \
> -           file://link_with_gcc.patch \
> -           file://usepic.patch \
> -           file://buildcc.patch;striplevel=2 \
> -           file://jsautocfg.h \
> -           file://configure.ac"
> -
> -SRC_URI[md5sum] = "eaad8815dcc66a717ddb87e9724d964e"
> -SRC_URI[sha256sum] = "374398699ac3fd802d98d642486cf6b0edc082a119c9c9c499945a0bc73e3413"
> -
> -S = "${WORKDIR}/js/src"
> -
> -# use local autoconf script to generate a usable jsautocfg.h
> -# don't bother with automake
> -inherit autotools
> -
> -do_configure_prepend() {
> -	cp -f ${WORKDIR}/configure.ac ${S}
> -	cp -f ${WORKDIR}/jsautocfg.h ${S}
> -}
> -
> -EXTRA_OEMAKE = "'CC=${CC}' 'LD=${LD}' 'XCFLAGS=${CFLAGS}' 'XLDFLAGS=${LDFLAGS} -Wl,-soname=libjs' \
> -                'BUILD_CC=${BUILD_CC}' 'BUILD_CFLAGS=${BUILD_CFLAGS}' 'BUILD_LDFLAGS=${BUILD_LDFLAGS}'"
> -
> -PARALLEL_MAKE = ""
> -
> -do_compile() {
> -	oe_runmake -f Makefile.ref JS_EDITLINE=1 PREBUILT_CPUCFG=1 BUILD_OPT=1
> -}
> -
> -do_install() {
> -	install -d ${D}${libdir}
> -	install -d ${D}${includedir}
> -	install -d ${D}${includedir}/js
> -	oe_libinstall -so -C Linux_All_OPT.OBJ libjs ${D}${libdir}
> -	install -m 0644 ${S}/*.h ${D}${includedir}/js
> -	install -m 0644 ${S}/jsproto.tbl ${D}${includedir}/js
> -}
> -
> -FILES_${PN} = "${libdir}/lib*.so"
> -
> diff --git a/meta/recipes-support/js/js_1.8.5.bb b/meta/recipes-support/js/js_1.8.5.bb
> new file mode 100644
> index 0000000..b2dc654
> --- /dev/null
> +++ b/meta/recipes-support/js/js_1.8.5.bb
> @@ -0,0 +1,50 @@
> +DESCRIPTION = "Spidermonkey: a javascript engine written in C"
> +HOMEPAGE = "http://www.mozilla.org/js/spidermonkey/"
> +SECTION = "libs/network"
> +
> +# The package is licensed under either of the following
> +LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://jsapi.cpp;beginline=4;endline=39;md5=347c6bbf4fb4547de1fa5ad830030063"
> +PR = "r0"
> +
> +DEPENDS = "nspr readline zip-native"
> +
> +SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/js185-1.0.0.tar.gz   \
> +	    "
> +
> +SRC_URI[md5sum] = "a4574365938222adca0a6bd33329cb32"
> +SRC_URI[sha256sum] = "5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687"
> +
> +S = "${WORKDIR}/js-${PV}/js/src"
> +
> +inherit autotools
> +
> +NSPR_LIBS = "-lnspr4 -lplc4 -lpjds4"
> +
> +EXTRA_OEMAKE = "'CC=${CC}' \
> +		'LD=${LD}' \
> +		'XCFLAGS=${CFLAGS}' \
> +		'XLDFLAGS=${LDFLAGS} -Wl' \
> +                'BUILD_CC=${BUILD_CC}' \
> +                'BUILD_CFLAGS=${BUILD_CFLAGS}' \
> +                'BUILD_LDFLAGS=${BUILD_LDFLAGS}' \
> +                "
> +
> +do_configure() {
> +    ./configure --prefix=/usr --enable-threadsafe --enable-cpp-rtti --enable-cpp-exceptions --without-x --disable-xterm-updates --with-nspr-libs="-lnspr4 -lplc4 -lplds4"
> +}
> +
> +do_install_append() {
> +	install -d ${D}${bindir}
> +	install ${S}/shell/js ${D}${bindir}
> +	# js produces links to work dir we need to recreate these symlinks
> +	rm -f ${D}${libdir}/libmozjs185.so ${D}${libdir}/libmozjs185.so.1.0
> +	ln -s libmozjs185.so.1.0.0 ${D}${libdir}/libmozjs185.so
> +	ln -s libmozjs185.so.1.0.0 ${D}${libdir}/libmozjs185.so.1.0
> +	# We create a symlink in order to avoid failures of older packages that use -ljs
> +	ln -s libmozjs185.so.1.0.0 ${D}${libdir}/libjs.so
> +}
> +
> +FILES_${PN} = "${bindir}/js ${libdir}/lib*${SOLIBS}"
> +FILES_${PN}-dev += "${bindir}/js-config"
> +FILES_${PN}-staticdev = "${libdir}/*.a"

--------------060709050405000509030504
Content-Type: text/plain;
 name="js.compile_fail"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="js.compile_fail"

DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
NOTE: make -j 12 CC=3Di586-poky-linux-gcc  -m32   -march=3Di586 --sysroot=
=3D/intel/poky/builds/world/tmp/sysroots/qemux86 LD=3Di586-poky-linux-ld --=
sysroot=3D/intel/poky/builds/world/tmp/sysroots/qemux86   XCFLAGS=3D -O2 -p=
ipe -g -feliminate-unused-debug-types XLDFLAGS=3D-Wl,-O1 -Wl,--hash-style=
=3Dgnu -Wl,--as-needed -Wl BUILD_CC=3Dgcc  BUILD_CFLAGS=3D-isystem/intel/po=
ky/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe BUILD_LDFLA=
GS=3D-L/intel/poky/builds/world/tmp/sysroots/x86_64-linux/usr/lib -L/intel/=
poky/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/intel/poky=
/builds/world/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/intel/poky=
/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/intel/poky/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/intel/poky/builds/world/=
tmp/sysroots/x86_64-linux/lib -Wl,-O1
make export
make[1]: Entering directory `/intel/poky/builds/world/tmp/work/i586-poky-li=
nux/js-1.8.5-r0/js-1.8.5/js/src'
make[2]: Entering directory `/intel/poky/builds/world/tmp/work/i586-poky-li=
nux/js-1.8.5-r0/js-1.8.5/js/src/config'
/intel/poky/builds/world/tmp/work/i586-poky-linux/js-1.8.5-r0/js-1.8.5/js/s=
rc/config/nsinstall -R nsinstall ../dist/bin
if test ! -d system_wrappers_js; then mkdir system_wrappers_js; fi
/usr/bin/perl ./preprocessor.pl -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -D=
X_DISPLAY_MISSING=3D1 -DD_INO=3Dd_ino -DJS_CPU_X64=3D1 -DJS_PUNBOX64=3D1 -D=
JS_METHODJIT=3D1 -DJS_MONOIC=3D1 -DJS_POLYIC=3D1 -DJS_POLYIC_TYPED_ARRAY=3D=
1 -DFEATURE_NANOJIT=3D1 -DJS_TRACER=3D1 -DAVMPLUS_AMD64=3D1 -DAVMPLUS_64BIT=
=3D1 -DAVMPLUS_UNIX=3D1 -DAVMPLUS_LINUX=3D1 -DSTDC_HEADERS=3D1 -DHAVE_SSIZE=
_T=3D1 -DHAVE_ST_BLKSIZE=3D1 -DHAVE_SIGINFO_T=3D1 -DJS_HAVE_STDINT_H=3D1 -D=
JS_BYTES_PER_WORD=3D4 -DJS_BITS_PER_WORD_LOG2=3D5 -DJS_ALIGN_OF_POINTER=3D4=
 -DJS_BYTES_PER_DOUBLE=3D8 -DHAVE_INT16_T=3D1 -DHAVE_INT32_T=3D1 -DHAVE_INT=
64_T=3D1 -DHAVE_UNAME_DOMAINNAME_FIELD=3D1 -DHAVE_VISIBILITY_HIDDEN_ATTRIBU=
TE=3D1 -DHAVE_VISIBILITY_ATTRIBUTE=3D1 -DHAVE_DIRENT_H=3D1 -DHAVE_GETOPT_H=
=3D1 -DHAVE_SYS_BITYPES_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAV=
E_GNU_LIBC_VERSION_H=3D1 -DHAVE_NL_TYPES_H=3D1 -DHAVE_MALLOC_H=3D1 -DHAVE_X=
11_XKBLIB_H=3D1 -DHAVE_SYS_STATVFS_H=3D1 -DHAVE_SYS_STATFS_H=3D1 -DHAVE_SYS=
_VFS_H=3D1 -DHAVE_SYS_MOUNT_H=3D1 -DHAVE_SYS_QUOTA_H=3D1 -DHAVE_LINUX_QUOTA=
_H=3D1 -DNEW_H=3D\<new\> -DHAVE_SYS_CDEFS_H=3D1 -DHAVE_DLOPEN=3D1 -DHAVE_DL=
ADDR=3D1 -D_REENTRANT=3D1 -DHAVE_FCHMOD=3D1 -DHAVE_FLOCKFILE=3D1 -DHAVE_GET=
C_UNLOCKED=3D1 -DHAVE_GETPAGESIZE=3D1 -DHAVE_LCHOWN=3D1 -DHAVE_LOCALTIME_R=
=3D1 -DHAVE_LSTAT64=3D1 -DHAVE_MEMMOVE=3D1 -DHAVE_RANDOM=3D1 -DHAVE_SBRK=3D=
1 -DHAVE_SNPRINTF=3D1 -DHAVE_STAT64=3D1 -DHAVE_STATVFS=3D1 -DHAVE_STATVFS64=
=3D1 -DHAVE_STRERROR=3D1 -DHAVE_STRTOK_R=3D1 -DHAVE_TRUNCATE64=3D1 -DHAVE_W=
CRTOMB=3D1 -DHAVE_MBRTOWC=3D1 -DHAVE_RES_NINIT=3D1 -DHAVE_GNU_GET_LIBC_VERS=
ION=3D1 -DHAVE_ICONV=3D1 -DHAVE_ICONV_WITH_CONST_INPUT=3D1 -DVA_COPY=3Dva_c=
opy -DHAVE_VA_COPY=3D1 -DHAVE_CPP_EXPLICIT=3D1 -DHAVE_CPP_TYPENAME=3D1 -DHA=
VE_CPP_MODERN_SPECIALIZE_TEMPLATE_SYNTAX=3D1 -DHAVE_CPP_PARTIAL_SPECIALIZAT=
ION=3D1 -DHAVE_CPP_ACCESS_CHANGING_USING=3D1 -DHAVE_CPP_AMBIGUITY_RESOLVING=
_USING=3D1 -DHAVE_CPP_NAMESPACE_STD=3D1 -DHAVE_CPP_UNAMBIGUOUS_STD_NOTEQUAL=
=3D1 -DHAVE_CPP_NEW_CASTS=3D1 -DHAVE_CPP_DYNAMIC_CAST_TO_VOID_PTR=3D1 -DHAV=
E_THREAD_TLS_KEYWORD=3D1 -DMALLOC_H=3D\<malloc.h\> -DHAVE_STRNDUP=3D1 -DHAV=
E_POSIX_MEMALIGN=3D1 -DHAVE_MEMALIGN=3D1 -DHAVE_VALLOC=3D1 -DHAVE_I18N_LC_M=
ESSAGES=3D1 -DHAVE_LOCALECONV=3D1 -DNS_ALWAYS_INLINE=3D__attribute__\(\(alw=
ays_inline\)\) -DNS_ATTR_MALLOC=3D__attribute__\(\(malloc\)\) -DNS_WARN_UNU=
SED_RESULT=3D__attribute__\(\(warn_unused_result\)\) -DNS_NORETURN=3D__attr=
ibute__\(\(noreturn\)\) -DHAVE___CXA_DEMANGLE=3D1 -DHAVE__UNWIND_BACKTRACE=
=3D1 -DHAVE_TM_ZONE_TM_GMTOFF=3D1 -DMOZ_CPP_EXCEPTIONS=3D1 -DCPP_THROW_NEW=
=3Dthrow\(\) -DEDITLINE=3D1 -DMOZ_DLL_SUFFIX=3D\".so\" -DHAVE_POSIX_FALLOCA=
TE=3D1 -DXP_UNIX=3D1 -DUNIX_ASYNC_DNS=3D1 -DJS_THREADSAFE=3D1 -DHAVE_SETLOC=
ALE=3D1 -DHAVE_LOCALECONV=3D1  \
		-DBUILD_STATIC_LIBS=3D \
		./system-headers | /usr/bin/perl ./make-system-wrappers.pl system_wrapper=
s_js
/intel/poky/builds/world/tmp/work/i586-poky-linux/js-1.8.5-r0/js-1.8.5/js/s=
rc/config/nsinstall -R system_wrappers_js ../dist
make[2]: Leaving directory `/intel/poky/builds/world/tmp/work/i586-poky-lin=
ux/js-1.8.5-r0/js-1.8.5/js/src/config'
make[2]: Entering directory `/intel/poky/builds/world/tmp/work/i586-poky-li=
nux/js-1.8.5-r0/js-1.8.5/js/src/editline'
make[2]: Nothing to be done for `export'.
make[2]: Leaving directory `/intel/poky/builds/world/tmp/work/i586-poky-lin=
ux/js-1.8.5-r0/js-1.8.5/js/src/editline'
make[2]: Entering directory `/intel/poky/builds/world/tmp/work/i586-poky-li=
nux/js-1.8.5-r0/js-1.8.5/js/src/shell'
make[2]: Nothing to be done for `export'.
make[2]: Leaving directory `/intel/poky/builds/world/tmp/work/i586-poky-lin=
ux/js-1.8.5-r0/js-1.8.5/js/src/shell'
make[2]: Entering directory `/intel/poky/builds/world/tmp/work/i586-poky-li=
nux/js-1.8.5-r0/js-1.8.5/js/src/jsapi-tests'
make[2]: Nothing to be done for `export'.
make[2]: Leaving directory `/intel/poky/builds/world/tmp/work/i586-poky-lin=
ux/js-1.8.5-r0/js-1.8.5/js/src/jsapi-tests'
make[2]: Entering directory `/intel/poky/builds/world/tmp/work/i586-poky-li=
nux/js-1.8.5-r0/js-1.8.5/js/src/tests'
make[2]: Nothing to be done for `export'.
make[2]: Leaving directory `/intel/poky/builds/world/tmp/work/i586-poky-lin=
ux/js-1.8.5-r0/js-1.8.5/js/src/tests'
/intel/poky/builds/world/tmp/work/i586-poky-linux/js-1.8.5-r0/js-1.8.5/js/s=
rc/config/nsinstall -R -m 644 js-config.h jsautocfg.h /intel/poky/builds/wo=
rld/tmp/work/i586-poky-linux/js-1.8.5-r0/js-1.8.5/js/src/jsautokw.h js.msg =
jsanalyze.h jsapi.h jsarray.h jsarena.h jsatom.h jsbit.h jsbool.h jsclist.h=
 jsclone.h jscntxt.h jscompat.h jsdate.h jsdbgapi.h jsdhash.h jsdtoa.h jsem=
it.h jsfun.h jsfriendapi.h jsgc.h jscell.h jsgcchunk.h jsgcstats.h jscompar=
tment.h jshash.h jsinterp.h jsinttypes.h jsiter.h jslock.h jslong.h jsmath.=
h jsobj.h jsobjinlines.h json.h jsopcode.tbl jsopcode.h jsopcodeinlines.h j=
sotypes.h jsparse.h jsproxy.h jsprf.h jsprobes.h jspropertycache.h jsproper=
tycacheinlines.h jspropertytree.h jsproto.tbl jsprvtd.h jspubtd.h jsreflect=
.h jsregexp.h jsscan.h jsscope.h jsscript.h jsscriptinlines.h jsstaticcheck=
.h jsstdint.h jsstr.h jstracer.h jshotloop.h jstypedarray.h jstypes.h jsuti=
l.h jsvector.h jstl.h jshashtable.h jsversion.h jswrapper.h jsxdrapi.h jsxm=
l.h jsval.h jsvalue.h prmjtime.h jsbuiltins.h ./nanojit/Assembler.h ./nanoj=
it/Allocator.h ./nanojit/CodeAlloc.h ./nanojit/Containers.h ./nanojit/LIR.h=
 ./nanojit/LIRopcode.tbl ./nanojit/avmplus.h ./nanojit/Fragmento.h ./nanoji=
t/Native.h ./nanojit/NativeCommon.h ./nanojit/NativeX64.h ./nanojit/njconfi=
g.h ./nanojit/njcpudetect.h ./nanojit/RegAlloc.h ./nanojit/nanojit.h ./nano=
jit/VMPI.h ./tracejit/Writer.h ./perf/jsperf.h ./dist/include
mkdir -p nanojit
make[1]: Leaving directory `/intel/poky/builds/world/tmp/work/i586-poky-lin=
ux/js-1.8.5-r0/js-1.8.5/js/src'
make libs
make[1]: Entering directory `/intel/poky/builds/world/tmp/work/i586-poky-li=
nux/js-1.8.5-r0/js-1.8.5/js/src'
jscompartment.cpp
jsdbgapi.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jscompartment.o -c  -I./dist/system_wrappers_js=
 -include ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -D=
EXPORT_JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/incl=
ude/nsprpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wal=
l -Wpointer-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-=
non-virtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -W=
error=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unuse=
d-debug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing=
 -pthread -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-poin=
ter -DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZ=
ILLA_CLIENT -include ./js-confdefs.h -MD -MF .deps/jscompartment.pp jscompa=
rtment.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsdbgapi.o -c  -I./dist/system_wrappers_js -inc=
lude ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPOR=
T_JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/n=
sprpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wp=
ointer-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-v=
irtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=
=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-deb=
ug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pth=
read -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -=
DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_=
CLIENT -include ./js-confdefs.h -MD -MF .deps/jsdbgapi.pp jsdbgapi.cpp
jsgc.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsgc.o -c  -I./dist/system_wrappers_js -include=
 ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPORT_JS=
_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/nsprp=
ub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wpoint=
er-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-virtu=
al-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=3Dr=
eturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-debug-t=
ypes -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pthread=
 -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -DUSE=
_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_CLIE=
NT -include ./js-confdefs.h -MD -MF .deps/jsgc.pp jsgc.cpp
jsgcchunk.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsgcchunk.o -c  -I./dist/system_wrappers_js -in=
clude ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPO=
RT_JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/=
nsprpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -W=
pointer-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-=
virtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werro=
r=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-de=
bug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pt=
hread -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer =
-DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA=
_CLIENT -include ./js-confdefs.h -MD -MF .deps/jsgcchunk.pp jsgcchunk.cpp
jsgcstats.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsgcstats.o -c  -I./dist/system_wrappers_js -in=
clude ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPO=
RT_JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/=
nsprpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -W=
pointer-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-=
virtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werro=
r=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-de=
bug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pt=
hread -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer =
-DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA=
_CLIENT -include ./js-confdefs.h -MD -MF .deps/jsgcstats.pp jsgcstats.cpp
jshash.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jshash.o -c  -I./dist/system_wrappers_js -inclu=
de ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPORT_=
JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/nsp=
rpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wpoi=
nter-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-vir=
tual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=
=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-deb=
ug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pth=
read -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -=
DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_=
CLIENT -include ./js-confdefs.h -MD -MF .deps/jshash.pp jshash.cpp
jsinterp.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsinterp.o -c  -I./dist/system_wrappers_js -inc=
lude ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPOR=
T_JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/n=
sprpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wp=
ointer-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-v=
irtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=
=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-deb=
ug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pth=
read -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -=
DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_=
CLIENT -include ./js-confdefs.h -MD -MF .deps/jsinterp.pp jsinterp.cpp
jsinvoke.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsinvoke.o -c  -I./dist/system_wrappers_js -inc=
lude ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPOR=
T_JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/n=
sprpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wp=
ointer-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-v=
irtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=
=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-deb=
ug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pth=
read -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -=
DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_=
CLIENT -include ./js-confdefs.h -MD -MF .deps/jsinvoke.pp jsinvoke.cpp
jsiter.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsiter.o -c  -I./dist/system_wrappers_js -inclu=
de ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPORT_=
JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/nsp=
rpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wpoi=
nter-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-vir=
tual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=
=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-deb=
ug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pth=
read -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -=
DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_=
CLIENT -include ./js-confdefs.h -MD -MF .deps/jsiter.pp jsiter.cpp
jslock.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jslock.o -c  -I./dist/system_wrappers_js -inclu=
de ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPORT_=
JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/nsp=
rpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wpoi=
nter-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-vir=
tual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=
=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-deb=
ug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pth=
read -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -=
DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_=
CLIENT -include ./js-confdefs.h -MD -MF .deps/jslock.pp jslock.cpp
jslog2.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jslog2.o -c  -I./dist/system_wrappers_js -inclu=
de ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPORT_=
JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/nsp=
rpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wpoi=
nter-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-vir=
tual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=
=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-deb=
ug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pth=
read -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -=
DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_=
CLIENT -include ./js-confdefs.h -MD -MF .deps/jslog2.pp jslog2.cpp
jsmath.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsmath.o -c  -I./dist/system_wrappers_js -inclu=
de ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPORT_=
JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/nsp=
rpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wpoi=
nter-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-vir=
tual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=
=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-deb=
ug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pth=
read -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -=
DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_=
CLIENT -include ./js-confdefs.h -MD -MF .deps/jsmath.pp jsmath.cpp
jsnativestack.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsnativestack.o -c  -I./dist/system_wrappers_js=
 -include ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -D=
EXPORT_JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/incl=
ude/nsprpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wal=
l -Wpointer-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-=
non-virtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -W=
error=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unuse=
d-debug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing=
 -pthread -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-poin=
ter -DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZ=
ILLA_CLIENT -include ./js-confdefs.h -MD -MF .deps/jsnativestack.pp jsnativ=
estack.cpp
jsnum.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsnum.o -c  -I./dist/system_wrappers_js -includ=
e ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPORT_J=
S_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/nspr=
pub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wpoin=
ter-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-virt=
ual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=3D=
return-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-debug-=
types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pthrea=
d -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -DUS=
E_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_CLI=
ENT -include ./js-confdefs.h -MD -MF .deps/jsnum.pp jsnum.cpp
jsobj.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsobj.o -c  -I./dist/system_wrappers_js -includ=
e ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPORT_J=
S_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/nspr=
pub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wpoin=
ter-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-virt=
ual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=3D=
return-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-debug-=
types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pthrea=
d -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -DUS=
E_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_CLI=
ENT -include ./js-confdefs.h -MD -MF .deps/jsobj.pp jsobj.cpp
json.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o json.o -c  -I./dist/system_wrappers_js -include=
 ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPORT_JS=
_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/nsprp=
ub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wpoint=
er-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-virtu=
al-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=3Dr=
eturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-debug-t=
ypes -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pthread=
 -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -DUSE=
_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_CLIE=
NT -include ./js-confdefs.h -MD -MF .deps/json.pp json.cpp
jslock.cpp: In function 'int js_SuspendThread(JSThinLock*)':
jslock.cpp:585:14: warning: variable 'stat' set but not used [-Wunused-but-=
set-variable]
jslock.cpp: In function 'void js_ResumeThread(JSThinLock*)':
jslock.cpp:615:14: warning: variable 'stat' set but not used [-Wunused-but-=
set-variable]
jsopcode.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsopcode.o -c  -I./dist/system_wrappers_js -inc=
lude ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPOR=
T_JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/n=
sprpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wp=
ointer-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-v=
irtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=
=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-deb=
ug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pth=
read -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -=
DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_=
CLIENT -include ./js-confdefs.h -MD -MF .deps/jsopcode.pp jsopcode.cpp
In file included from methodjit/PunboxAssembler.h:44:0,
                 from methodjit/CodeGenIncludes.h:58,
                 from methodjit/Compiler.h:47,
                 from methodjit/Retcon.h:52,
                 from jsdbgapi.cpp:79:
./methodjit/MachineRegs.h:60:43: error: 'r13' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:61:46: error: 'r14' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:62:40: error: 'r10' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:112:17: error: 'r8' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:113:17: error: 'r9' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:124:17: error: 'r12' is not a member of 'JSC::X86=
Registers'
./methodjit/MachineRegs.h:127:17: error: 'r15' is not a member of 'JSC::X86=
Registers'
./methodjit/MachineRegs.h: In static member function 'static bool js::mjit:=
:Registers::regForArg(js::mjit::Registers::CallConvention, uint32, js::mjit=
::Registers::RegisterID*)':
./methodjit/MachineRegs.h:228:13: error: 'r8' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:229:13: error: 'r9' is not a member of 'JSC::X86R=
egisters'
In file included from methodjit/CodeGenIncludes.h:58:0,
                 from methodjit/Compiler.h:47,
                 from methodjit/Retcon.h:52,
                 from jsdbgapi.cpp:79:
methodjit/PunboxAssembler.h: At global scope:
methodjit/PunboxAssembler.h:61:30: error: expected ')' before 'shtag'
methodjit/PunboxAssembler.h: In constructor 'js::mjit::ImmType::ImmType(JSV=
alueType)':
methodjit/PunboxAssembler.h:69:64: error: 'JSVAL_TYPE_TO_SHIFTED_TAG' was n=
ot declared in this scope
methodjit/PunboxAssembler.h:69:65: error: 'JSValueShiftedTag' was not decla=
red in this scope
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::loadValueAsComponents(const js::Value&, JSC::AbstractMacroAssembler<J=
SC::X86Assembler>::RegisterID, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:130:38: error: 'JSVAL_TAG_MASK' was not declare=
d in this scope
methodjit/PunboxAssembler.h:131:38: error: 'JSVAL_PAYLOAD_MASK' was not dec=
lared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testNull(JSC::MacroAs=
semblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembler>=
::RegisterID)':
methodjit/PunboxAssembler.h:280:44: error: 'JSVAL_SHIFTED_TAG_NULL' was not=
 declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testUndefined(JSC::Ma=
croAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assem=
bler>::RegisterID)':
methodjit/PunboxAssembler.h:289:44: error: 'JSVAL_SHIFTED_TAG_UNDEFINED' wa=
s not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testInt32(JSC::MacroA=
ssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembler=
>::RegisterID)':
methodjit/PunboxAssembler.h:298:44: error: 'JSVAL_SHIFTED_TAG_INT32' was no=
t declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testNumber(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:309:33: error: 'JSVAL_UPPER_EXCL_SHIFTED_TAG_OF=
_NUMBER_SET' was not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testPrimitive(JSC::Ma=
croAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assem=
bler>::RegisterID)':
methodjit/PunboxAssembler.h:320:33: error: 'JSVAL_UPPER_EXCL_SHIFTED_TAG_OF=
_PRIMITIVE_SET' was not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testObject(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:330:44: error: 'JSVAL_SHIFTED_TAG_OBJECT' was n=
ot declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testDouble(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:340:44: error: 'JSVAL_SHIFTED_TAG_MAX_DOUBLE' w=
as not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testBoolean(JSC::Macr=
oAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembl=
er>::RegisterID)':
methodjit/PunboxAssembler.h:349:44: error: 'JSVAL_SHIFTED_TAG_BOOLEAN' was =
not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testString(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:358:44: error: 'JSVAL_SHIFTED_TAG_STRING' was n=
ot declared in this scope
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::breakDouble(JSC::AbstractMacroAssembler<JSC::X86Assembler>::FPRegiste=
rID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::RegisterID, JSC::Abstr=
actMacroAssembler<JSC::X86Assembler>::RegisterID)':
methodjit/PunboxAssembler.h:367:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::fastLoadDouble(JSC::AbstractMacroAssembler<JSC::X86Assembler>::Regist=
erID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::RegisterID, JSC::Abst=
ractMacroAssembler<JSC::X86Assembler>::FPRegisterID)':
methodjit/PunboxAssembler.h:376:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::loadStaticDouble(const double*, JSC::AbstractMacroAssembler<JSC::X86A=
ssembler>::FPRegisterID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::Re=
gisterID)':
methodjit/PunboxAssembler.h:383:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
In file included from ./methodjit/FrameState.h:45:0,
                 from methodjit/StubCompiler.h:47,
                 from methodjit/Compiler.h:49,
                 from methodjit/Retcon.h:52,
                 from jsdbgapi.cpp:79:
./methodjit/FrameEntry.h: At global scope:
./methodjit/FrameEntry.h:86:5: error: 'JSValueShiftedTag' does not name a t=
ype
./methodjit/FrameEntry.h: In member function 'uint64 js::mjit::FrameEntry::=
getPayload() const':
./methodjit/FrameEntry.h:114:28: error: 'JSVAL_PAYLOAD_MASK' was not declar=
ed in this scope
./methodjit/FrameEntry.h: In member function 'void js::mjit::FrameEntry::se=
tType(JSValueType)':
./methodjit/FrameEntry.h:143:22: error: 'JSVAL_PAYLOAD_MASK' was not declar=
ed in this scope
./methodjit/FrameEntry.h:144:53: error: 'JSVAL_TYPE_TO_SHIFTED_TAG' was not=
 declared in this scope
jsparse.cpp
i586-poky-linux-g++  -m32   -march=3Di586 --sysroot=3D/intel/poky/builds/wo=
rld/tmp/sysroots/qemux86 -o jsparse.o -c  -I./dist/system_wrappers_js -incl=
ude ./config/gcc_hidden.h -DOSTYPE=3D\"Linux3.0\" -DOSARCH=3DLinux -DEXPORT=
_JS_API -D__STDC_LIMIT_MACROS  -I. -I. -I./dist/include -I./dist/include/ns=
prpub     -I. -I./assembler -I./yarr  -fPIC  -frtti -fexceptions -Wall -Wpo=
inter-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-vi=
rtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=
=3Dreturn-type -pedantic -Wno-long-long -O2 -pipe -g -feliminate-unused-deb=
ug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -pth=
read -pipe  -DNDEBUG -DTRIMMED -O3 -fstrict-aliasing -fomit-frame-pointer -=
DUSE_SYSTEM_MALLOC=3D1 -DENABLE_ASSEMBLER=3D1 -DENABLE_JIT=3D1   -DMOZILLA_=
CLIENT -include ./js-confdefs.h -MD -MF .deps/jsparse.pp jsparse.cpp
In file included from methodjit/PunboxAssembler.h:44:0,
                 from methodjit/CodeGenIncludes.h:58,
                 from methodjit/MonoIC.h:48,
                 from jsinterp.cpp:100,
                 from jsinvoke.cpp:42:
./methodjit/MachineRegs.h:60:43: error: 'r13' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:61:46: error: 'r14' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:62:40: error: 'r10' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:112:17: error: 'r8' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:113:17: error: 'r9' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:124:17: error: 'r12' is not a member of 'JSC::X86=
Registers'
./methodjit/MachineRegs.h:127:17: error: 'r15' is not a member of 'JSC::X86=
Registers'
./methodjit/MachineRegs.h: In static member function 'static bool js::mjit:=
:Registers::regForArg(js::mjit::Registers::CallConvention, uint32, js::mjit=
::Registers::RegisterID*)':
./methodjit/MachineRegs.h:228:13: error: 'r8' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:229:13: error: 'r9' is not a member of 'JSC::X86R=
egisters'
In file included from methodjit/CodeGenIncludes.h:58:0,
                 from methodjit/MonoIC.h:48,
                 from jsinterp.cpp:100,
                 from jsinvoke.cpp:42:
methodjit/PunboxAssembler.h: At global scope:
methodjit/PunboxAssembler.h:61:30: error: expected ')' before 'shtag'
methodjit/PunboxAssembler.h: In constructor 'js::mjit::ImmType::ImmType(JSV=
alueType)':
methodjit/PunboxAssembler.h:69:64: error: 'JSVAL_TYPE_TO_SHIFTED_TAG' was n=
ot declared in this scope
methodjit/PunboxAssembler.h:69:65: error: 'JSValueShiftedTag' was not decla=
red in this scope
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::loadValueAsComponents(const js::Value&, JSC::AbstractMacroAssembler<J=
SC::X86Assembler>::RegisterID, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:130:38: error: 'JSVAL_TAG_MASK' was not declare=
d in this scope
methodjit/PunboxAssembler.h:131:38: error: 'JSVAL_PAYLOAD_MASK' was not dec=
lared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testNull(JSC::MacroAs=
semblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembler>=
::RegisterID)':
methodjit/PunboxAssembler.h:280:44: error: 'JSVAL_SHIFTED_TAG_NULL' was not=
 declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testUndefined(JSC::Ma=
croAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assem=
bler>::RegisterID)':
methodjit/PunboxAssembler.h:289:44: error: 'JSVAL_SHIFTED_TAG_UNDEFINED' wa=
s not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testInt32(JSC::MacroA=
ssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembler=
>::RegisterID)':
methodjit/PunboxAssembler.h:298:44: error: 'JSVAL_SHIFTED_TAG_INT32' was no=
t declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testNumber(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:309:33: error: 'JSVAL_UPPER_EXCL_SHIFTED_TAG_OF=
_NUMBER_SET' was not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testPrimitive(JSC::Ma=
croAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assem=
bler>::RegisterID)':
methodjit/PunboxAssembler.h:320:33: error: 'JSVAL_UPPER_EXCL_SHIFTED_TAG_OF=
_PRIMITIVE_SET' was not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testObject(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:330:44: error: 'JSVAL_SHIFTED_TAG_OBJECT' was n=
ot declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testDouble(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:340:44: error: 'JSVAL_SHIFTED_TAG_MAX_DOUBLE' w=
as not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testBoolean(JSC::Macr=
oAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembl=
er>::RegisterID)':
methodjit/PunboxAssembler.h:349:44: error: 'JSVAL_SHIFTED_TAG_BOOLEAN' was =
not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testString(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:358:44: error: 'JSVAL_SHIFTED_TAG_STRING' was n=
ot declared in this scope
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::breakDouble(JSC::AbstractMacroAssembler<JSC::X86Assembler>::FPRegiste=
rID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::RegisterID, JSC::Abstr=
actMacroAssembler<JSC::X86Assembler>::RegisterID)':
methodjit/PunboxAssembler.h:367:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::fastLoadDouble(JSC::AbstractMacroAssembler<JSC::X86Assembler>::Regist=
erID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::RegisterID, JSC::Abst=
ractMacroAssembler<JSC::X86Assembler>::FPRegisterID)':
methodjit/PunboxAssembler.h:376:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::loadStaticDouble(const double*, JSC::AbstractMacroAssembler<JSC::X86A=
ssembler>::FPRegisterID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::Re=
gisterID)':
methodjit/PunboxAssembler.h:383:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
In file included from methodjit/PunboxAssembler.h:44:0,
                 from methodjit/CodeGenIncludes.h:58,
                 from methodjit/MonoIC.h:48,
                 from jsinterp.cpp:100:
./methodjit/MachineRegs.h:60:43: error: 'r13' is not a member of 'JSC::X86R=
egisters'make[1]: *** [jsdbgapi.o] Error 1
make[1]: *** Waiting for unfinished jobs....

./methodjit/MachineRegs.h:61:46: error: 'r14' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:62:40: error: 'r10' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:112:17: error: 'r8' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:113:17: error: 'r9' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:124:17: error: 'r12' is not a member of 'JSC::X86=
Registers'
./methodjit/MachineRegs.h:127:17: error: 'r15' is not a member of 'JSC::X86=
Registers'
./methodjit/MachineRegs.h: In static member function 'static bool js::mjit:=
:Registers::regForArg(js::mjit::Registers::CallConvention, uint32, js::mjit=
::Registers::RegisterID*)':
./methodjit/MachineRegs.h:228:13: error: 'r8' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:229:13: error: 'r9' is not a member of 'JSC::X86R=
egisters'
In file included from methodjit/CodeGenIncludes.h:58:0,
                 from methodjit/MonoIC.h:48,
                 from jsinterp.cpp:100:
methodjit/PunboxAssembler.h: At global scope:
methodjit/PunboxAssembler.h:61:30: error: expected ')' before 'shtag'
methodjit/PunboxAssembler.h: In constructor 'js::mjit::ImmType::ImmType(JSV=
alueType)':
methodjit/PunboxAssembler.h:69:64: error: 'JSVAL_TYPE_TO_SHIFTED_TAG' was n=
ot declared in this scope
methodjit/PunboxAssembler.h:69:65: error: 'JSValueShiftedTag' was not decla=
red in this scope
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::loadValueAsComponents(const js::Value&, JSC::AbstractMacroAssembler<J=
SC::X86Assembler>::RegisterID, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:130:38: error: 'JSVAL_TAG_MASK' was not declare=
d in this scope
methodjit/PunboxAssembler.h:131:38: error: 'JSVAL_PAYLOAD_MASK' was not dec=
lared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testNull(JSC::MacroAs=
semblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembler>=
::RegisterID)':
methodjit/PunboxAssembler.h:280:44: error: 'JSVAL_SHIFTED_TAG_NULL' was not=
 declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testUndefined(JSC::Ma=
croAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assem=
bler>::RegisterID)':
methodjit/PunboxAssembler.h:289:44: error: 'JSVAL_SHIFTED_TAG_UNDEFINED' wa=
s not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testInt32(JSC::MacroA=
ssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembler=
>::RegisterID)':
methodjit/PunboxAssembler.h:298:44: error: 'JSVAL_SHIFTED_TAG_INT32' was no=
t declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testNumber(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:309:33: error: 'JSVAL_UPPER_EXCL_SHIFTED_TAG_OF=
_NUMBER_SET' was not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testPrimitive(JSC::Ma=
croAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assem=
bler>::RegisterID)':
methodjit/PunboxAssembler.h:320:33: error: 'JSVAL_UPPER_EXCL_SHIFTED_TAG_OF=
_PRIMITIVE_SET' was not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testObject(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:330:44: error: 'JSVAL_SHIFTED_TAG_OBJECT' was n=
ot declared in this scope
In file included from jsinvoke.cpp:42:0:
nanojit/NativeX64.h: At global scope:
nanojit/NativeX64.h:346:31: warning: 'nanojit::SavedRegs' defined but not u=
sed [-Wunused-variable]
nanojit/NativeX64.h:354:31: warning: 'nanojit::SingleByteStoreRegs' defined=
 but not used [-Wunused-variable]
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testDouble(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:340:44: error: 'JSVAL_SHIFTED_TAG_MAX_DOUBLE' w=
as not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testBoolean(JSC::Macr=
oAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembl=
er>::RegisterID)':
methodjit/PunboxAssembler.h:349:44: error: 'JSVAL_SHIFTED_TAG_BOOLEAN' was =
not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testString(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:358:44: error: 'JSVAL_SHIFTED_TAG_STRING' was n=
ot declared in this scope
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::breakDouble(JSC::AbstractMacroAssembler<JSC::X86Assembler>::FPRegiste=
rID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::RegisterID, JSC::Abstr=
actMacroAssembler<JSC::X86Assembler>::RegisterID)':
methodjit/PunboxAssembler.h:367:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::fastLoadDouble(JSC::AbstractMacroAssembler<JSC::X86Assembler>::Regist=
erID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::RegisterID, JSC::Abst=
ractMacroAssembler<JSC::X86Assembler>::FPRegisterID)':
methodjit/PunboxAssembler.h:376:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::loadStaticDouble(const double*, JSC::AbstractMacroAssembler<JSC::X86A=
ssembler>::FPRegisterID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::Re=
gisterID)':
methodjit/PunboxAssembler.h:383:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
make[1]: *** [jsinvoke.o] Error 1
In file included from methodjit/BaseAssembler.h:51:0,
                 from methodjit/PolyIC.h:50,
                 from jscompartment.cpp:51:
./methodjit/MachineRegs.h:60:43: error: 'r13' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:61:46: error: 'r14' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:62:40: error: 'r10' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:112:17: error: 'r8' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:113:17: error: 'r9' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:124:17: error: 'r12' is not a member of 'JSC::X86=
Registers'
./methodjit/MachineRegs.h:127:17: error: 'r15' is not a member of 'JSC::X86=
Registers'
./methodjit/MachineRegs.h: In static member function 'static bool js::mjit:=
:Registers::regForArg(js::mjit::Registers::CallConvention, uint32, js::mjit=
::Registers::RegisterID*)':
./methodjit/MachineRegs.h:228:13: error: 'r8' is not a member of 'JSC::X86R=
egisters'
./methodjit/MachineRegs.h:229:13: error: 'r9' is not a member of 'JSC::X86R=
egisters'
In file included from methodjit/CodeGenIncludes.h:58:0,
                 from methodjit/BaseAssembler.h:52,
                 from methodjit/PolyIC.h:50,
                 from jscompartment.cpp:51:
methodjit/PunboxAssembler.h: At global scope:
methodjit/PunboxAssembler.h:61:30: error: expected ')' before 'shtag'
methodjit/PunboxAssembler.h: In constructor 'js::mjit::ImmType::ImmType(JSV=
alueType)':
methodjit/PunboxAssembler.h:69:64: error: 'JSVAL_TYPE_TO_SHIFTED_TAG' was n=
ot declared in this scope
methodjit/PunboxAssembler.h:69:65: error: 'JSValueShiftedTag' was not decla=
red in this scope
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::loadValueAsComponents(const js::Value&, JSC::AbstractMacroAssembler<J=
SC::X86Assembler>::RegisterID, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:130:38: error: 'JSVAL_TAG_MASK' was not declare=
d in this scope
methodjit/PunboxAssembler.h:131:38: error: 'JSVAL_PAYLOAD_MASK' was not dec=
lared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testNull(JSC::MacroAs=
semblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembler>=
::RegisterID)':
methodjit/PunboxAssembler.h:280:44: error: 'JSVAL_SHIFTED_TAG_NULL' was not=
 declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testUndefined(JSC::Ma=
croAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assem=
bler>::RegisterID)':
methodjit/PunboxAssembler.h:289:44: error: 'JSVAL_SHIFTED_TAG_UNDEFINED' wa=
s not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testInt32(JSC::MacroA=
ssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembler=
>::RegisterID)':
methodjit/PunboxAssembler.h:298:44: error: 'JSVAL_SHIFTED_TAG_INT32' was no=
t declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testNumber(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:309:33: error: 'JSVAL_UPPER_EXCL_SHIFTED_TAG_OF=
_NUMBER_SET' was not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testPrimitive(JSC::Ma=
croAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assem=
bler>::RegisterID)':
methodjit/PunboxAssembler.h:320:33: error: 'JSVAL_UPPER_EXCL_SHIFTED_TAG_OF=
_PRIMITIVE_SET' was not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testObject(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:330:44: error: 'JSVAL_SHIFTED_TAG_OBJECT' was n=
ot declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testDouble(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:340:44: error: 'JSVAL_SHIFTED_TAG_MAX_DOUBLE' w=
as not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testBoolean(JSC::Macr=
oAssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assembl=
er>::RegisterID)':
methodjit/PunboxAssembler.h:349:44: error: 'JSVAL_SHIFTED_TAG_BOOLEAN' was =
not declared in this scope
methodjit/PunboxAssembler.h: In member function 'JSC::AbstractMacroAssemble=
r<JSC::X86Assembler>::Jump js::mjit::PunboxAssembler::testString(JSC::Macro=
AssemblerX86Common::Condition, JSC::AbstractMacroAssembler<JSC::X86Assemble=
r>::RegisterID)':
methodjit/PunboxAssembler.h:358:44: error: 'JSVAL_SHIFTED_TAG_STRING' was n=
ot declared in this scope
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::breakDouble(JSC::AbstractMacroAssembler<JSC::X86Assembler>::FPRegiste=
rID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::RegisterID, JSC::Abstr=
actMacroAssembler<JSC::X86Assembler>::RegisterID)':
methodjit/PuERROR: Function failed: do_compile (see /intel/poky/builds/worl=
d/tmp/work/i586-poky-linux/js-1.8.5-r0/temp/log.do_compile.20036 for furthe=
r information)
nboxAssembler.h:367:21: error: 'class JSC::X86Assembler' has no member name=
d 'movq_rr'
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::fastLoadDouble(JSC::AbstractMacroAssembler<JSC::X86Assembler>::Regist=
erID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::RegisterID, JSC::Abst=
ractMacroAssembler<JSC::X86Assembler>::FPRegisterID)':
methodjit/PunboxAssembler.h:376:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
methodjit/PunboxAssembler.h: In member function 'void js::mjit::PunboxAssem=
bler::loadStaticDouble(const double*, JSC::AbstractMacroAssembler<JSC::X86A=
ssembler>::FPRegisterID, JSC::AbstractMacroAssembler<JSC::X86Assembler>::Re=
gisterID)':
methodjit/PunboxAssembler.h:383:21: error: 'class JSC::X86Assembler' has no=
 member named 'movq_rr'
nanojit/NativeX64.h: At global scope:
nanojit/NativeX64.h:346:31: warning: 'nanojit::SavedRegs' defined but not u=
sed [-Wunused-variable]
nanojit/NativeX64.h:354:31: warning: 'nanojit::SingleByteStoreRegs' defined=
 but not used [-Wunused-variable]
make[1]: *** [jsinterp.o] Error 1
nanojit/NativeX64.h: At global scope:
nanojit/NativeX64.h:346:31: warning: 'nanojit::SavedRegs' defined but not u=
sed [-Wunused-variable]
nanojit/NativeX64.h:354:31: warning: 'nanojit::SingleByteStoreRegs' defined=
 but not used [-Wunused-variable]
make[1]: *** [jscompartment.o] Error 1
jsopcode.cpp: In function 'jsbytecode* DecompileDestructuring(SprintStack*,=
 jsbytecode*, jsbytecode*)':
jsopcode.cpp:1572:14: warning: variable 'saveop' set but not used [-Wunused=
-but-set-variable]
jsparse.cpp: In member function 'JSParseNode* js::Parser::primaryExpr(js::T=
okenKind, JSBool)':
jsparse.cpp:8540:16: warning: variable 'afterComma' set but not used [-Wunu=
sed-but-set-variable]
jscntxt.h: In function 'bool RunLastDitchGC(JSContext*)':
jscntxt.h:2666:50: warning: 'unlockAtomsCompartmenIf.js::AutoUnlockAtomsCom=
partment::cx' may be used uninitialized in this function [-Wuninitialized]
jsgc.cpp:1109:9: note: 'unlockAtomsCompartmenIf.js::AutoUnlockAtomsCompartm=
ent::cx' was declared here
make[1]: Leaving directory `/intel/poky/builds/world/tmp/work/i586-poky-lin=
ux/js-1.8.5-r0/js-1.8.5/js/src'
make: *** [default] Error 2
ERROR: oe_runmake failed


--------------060709050405000509030504--
