Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RugEf-0006aF-DA
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 09:17:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Feb 2012 00:08:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="104812322"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by orsmga001.jf.intel.com with ESMTP; 07 Feb 2012 00:08:54 -0800
Message-ID: <4F30DC16.1050506@linux.intel.com>
Date: Tue, 07 Feb 2012 00:08:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
In-Reply-To: <c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Tue, 07 Feb 2012 08:17:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2012 10:40 PM, Khem Raj wrote:
> Dont use autotools, it really not so autoconf like.
> the configure script gets updated with every release of zlib
> and we overwrite that. Instead use the upstream provided
> configure
>
> copyright year was changed in zlib.h which caused change in
> LIC_FILE_CHECKSUM
>
> fix.inverted.LFS.logic.patch is already applied upstream so drop it
>
> Drop the configure.ac and Makefile.am scripts since we do not
> autoreconf anymore and do not inherit autotools anymore
>
Not sure what's up with this patch, but it is causing failures in other 
recipes that depend on libz, it seems like the libz.la is not getting 
installed correctly.

| /bin/grep: 
/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la: No such 
file or directory
| /bin/sed: can't read 
/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la: No such 
file or directory
| i586-poky-linux-libtool: link: 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' is not a 
valid libtool archive


Sau!

> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-core/zlib/files/Makefile.am           |    9 ----
>   meta/recipes-core/zlib/files/configure.ac          |   48 --------------------
>   .../zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch   |   20 --------
>   meta/recipes-core/zlib/zlib_1.2.5.bb               |   41 -----------------
>   meta/recipes-core/zlib/zlib_1.2.6.bb               |   26 +++++++++++
>   5 files changed, 26 insertions(+), 118 deletions(-)
>   delete mode 100644 meta/recipes-core/zlib/files/Makefile.am
>   delete mode 100644 meta/recipes-core/zlib/files/configure.ac
>   delete mode 100644 meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
>   delete mode 100644 meta/recipes-core/zlib/zlib_1.2.5.bb
>   create mode 100644 meta/recipes-core/zlib/zlib_1.2.6.bb
>
> diff --git a/meta/recipes-core/zlib/files/Makefile.am b/meta/recipes-core/zlib/files/Makefile.am
> deleted file mode 100644
> index b66d299..0000000
> --- a/meta/recipes-core/zlib/files/Makefile.am
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -lib_LTLIBRARIES = libz.la
> -
> -libz_la_SOURCES = adler32.c compress.c crc32.c gzlib.c gzclose.c gzread.c \
> -                  gzwrite.c uncompr.c deflate.c trees.c zutil.c inflate.c \
> -                  infback.c inftrees.c inffast.c
> -
> -libz_la_LDFLAGS = -version-number 1:2:5 --version-script zlib.map
> -
> -include_HEADERS = zconf.h zlib.h zlibdefs.h
> diff --git a/meta/recipes-core/zlib/files/configure.ac b/meta/recipes-core/zlib/files/configure.ac
> deleted file mode 100644
> index 4761b7e..0000000
> --- a/meta/recipes-core/zlib/files/configure.ac
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -AC_INIT(zlib,1.2.5)
> -AC_CONFIG_SRCDIR(adler32.c)
> -AM_INIT_AUTOMAKE(zlibs,1.2.5)
> -
> -AC_PREREQ([2.59])
> -
> -AC_PROG_CC([gcc])
> -AC_PROG_LIBTOOL
> -
> -AC_HEADER_STDC
> -
> -zlib_save_CPPFLAGS=$CPPFLAGS
> -CPPFLAGS="$CPPFLAGS -D_LARGEFILE64_SOURCE"
> -AC_CHECK_TYPES(off64_t)
> -CPPFLAGS=$zlib_save_CPPFLAGS
> -
> -AC_CACHE_CHECK([whether to enable -D_LARGEFILE64_SOURCE], [zlib_cv_use_lfs64], [
> -    zlib_cv_use_lfs64=no
> -    if test "$ac_cv_type_off64_t" = "yes"; then
> -        zlib_cv_use_lfs64=yes
> -    fi
> -])
> -
> -if test "$zlib_cv_use_lfs64" = "yes"; then
> -    CPPFLAGS="$CPPFLAGS -D_LARGEFILE64_SOURCE"
> -
> -    #APR_ADDTO(CPPFLAGS, [-D_LARGEFILE64_SOURCE])
> -fi
> -
> -cat>  zlibdefs.h<<  EOF
> -/* zlibdefs.h -- compile-time definitions for the zlib compression library
> - * Copyright (C) 1995-2006 Jean-loup Gailly.
> - * For conditions of distribution and use, see copyright notice in zlib.h
> - */
> -
> -#include<sys/types.h>	/* for off_t */
> -#include<unistd.h>	/* for SEEK_* and off_t */
> -#ifdef VMS
> -#  include<unixio.h>	/* for off_t */
> -#endif
> -#ifndef z_off_t
> -#  define z_off_t off_t
> -#endif
> -EOF
> -
> -AC_CONFIG_FILES([Makefile])
> -
> -AC_OUTPUT
> diff --git a/meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch b/meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
> deleted file mode 100644
> index 038c1a2..0000000
> --- a/meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Upstream-Status: Pending
> -
> -see
> -https://bugs.gentoo.org/316377?id=316377
> -https://bugs.freedesktop.org/show_bug.cgi?id=33710
> -http://lists.freedesktop.org/archives/poppler-bugs/2011-January/006014.html
> -for details
> -
> -diff -up zlib-1.2.5/zlib.h.pom zlib-1.2.5/zlib.h
> ---- zlib-1.2.5/zlib.h.pom	2010-04-20 06:12:48.000000000 +0200
> -+++ zlib-1.2.5/zlib.h	2010-06-16 13:08:59.000000000 +0200
> -@@ -1578,7 +1578,7 @@ ZEXTERN int ZEXPORT inflateBackInit_ OF(
> - #  define gzoffset gzoffset64
> - #  define adler32_combine adler32_combine64
> - #  define crc32_combine crc32_combine64
> --#  ifdef _LARGEFILE64_SOURCE
> -+#  ifndef _LARGEFILE64_SOURCE
> -      ZEXTERN gzFile ZEXPORT gzopen64 OF((const char *, const char *));
> -      ZEXTERN z_off_t ZEXPORT gzseek64 OF((gzFile, z_off_t, int));
> -      ZEXTERN z_off_t ZEXPORT gztell64 OF((gzFile));
> diff --git a/meta/recipes-core/zlib/zlib_1.2.5.bb b/meta/recipes-core/zlib/zlib_1.2.5.bb
> deleted file mode 100644
> index b5756d9..0000000
> --- a/meta/recipes-core/zlib/zlib_1.2.5.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -SUMMARY = "Zlib Compression Library"
> -DESCRIPTION = "Zlib is a general-purpose, patent-free, lossless data compression \
> -library which is used by many different programs."
> -HOMEPAGE = "http://zlib.net/"
> -SECTION = "libs"
> -LICENSE = "Zlib"
> -LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=084e9c30e4e6272c3b057b13c6467f3d"
> -
> -DEPENDS = "libtool-cross"
> -PR = "r3"
> -
> -SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
> -           file://configure.ac \
> -           file://Makefile.am \
> -           file://fix.inverted.LFS.logic.patch"
> -
> -SRC_URI[md5sum] = "be1e89810e66150f5b0327984d8625a0"
> -SRC_URI[sha256sum] = "239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b5769ea014120b307"
> -
> -inherit autotools
> -
> -do_configure_prepend () {
> -	cp ${WORKDIR}/configure.ac ${S}/
> -	cp ${WORKDIR}/Makefile.am ${S}/
> -}
> -
> -do_install_append () {
> -	sed \
> -		-e 's:@prefix@:${prefix}:' \
> -		-e 's:@exec_prefix@:${exec_prefix}:' \
> -		-e 's:@libdir@:${libdir}:' \
> -		-e 's:@sharedlibdir@:${libdir}:' \
> -		-e 's:@includedir@:${includedir}:' \
> -		-e 's:@VERSION@:${PV}:' \
> -		zlib.pc.in>  zlib.pc
> -
> -	install -d ${D}${libdir}/pkgconfig
> -	install -m 0644 zlib.pc ${D}${libdir}/pkgconfig/
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/zlib/zlib_1.2.6.bb
> new file mode 100644
> index 0000000..a220773
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib_1.2.6.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Zlib Compression Library"
> +DESCRIPTION = "Zlib is a general-purpose, patent-free, lossless data compression \
> +library which is used by many different programs."
> +HOMEPAGE = "http://zlib.net/"
> +SECTION = "libs"
> +LICENSE = "Zlib"
> +LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=94d1b5a40dadd127f3351471727e66a9"
> +
> +SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
> +           "
> +SRC_URI[md5sum] = "dc2cfa0d2313ca77224b4d932b2911e9"
> +SRC_URI[sha256sum] = "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f0438021c4bbb5db1b918c8e"
> +
> +do_configure (){
> +	./configure --prefix=${prefix} --shared --libdir=${libdir}
> +}
> +
> +do_compile (){
> +	oe_runmake
> +}
> +
> +do_install() {
> +	oe_runmake DESTDIR=${D} install
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"


