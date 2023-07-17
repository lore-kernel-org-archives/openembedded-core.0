Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077B4EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 12:50:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.7222.1689598236510755628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 05:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o7u4+L9O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A94CC0011;
	Mon, 17 Jul 2023 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689598234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9yZTXH6Z3gwsjcMAh5PjnVE9qXYaG6CBNw5eENOYQzs=;
	b=o7u4+L9OdB6uhWtPXpr32pBf99eGO3gXuBvw65Hb2q/gY+IoAFtEQVFZHRwi+qfyDCbJt9
	PUB1u/8wEtc+7NG6FBPnmTD4IC1kZ83BxLTQwVXxP9bsVdg6FNPysquURZpMOzKliHbCZe
	xXmd8f+ucH08N5Hu82njNQqNK+stV1ULyGaQbxl8NngrcE+CSqDVB1qFh2hmX8+35d6ZlV
	IbXiu/6rVaCwfEu2zjSOHW7Tnc4UUI39/AMcsbbeS8DOIbfXywUkfxaCr2jq66yLBcv02f
	ZT80e385mcGHnhy+gMvZgwHtiiPx7oZzEkx/+8aHKjB27xokELxfrVnARIXoew==
Date: Mon, 17 Jul 2023 14:50:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] autoconf: Test 2.72c
Message-ID: <20230717125033a8cb025c@mail.local>
References: <20230711234117.2924622-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230711234117.2924622-1-raj.khem@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 12:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184464

I believe this is the cause of:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/7337/step=
s/11/logs/stdio


ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemux86-6=
4-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/tem=
p/log.do_compile.1852799
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-=
32', 'ix86-common', 'x32-linux', 'x86_64-linux-gnux32', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52
| Making all in src
| make[1]: Entering directory '/home/pokybuild/yocto-worker/qemux86-64-x32/=
build/build/tmp/work/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/build/src'
| x86_64-poky-linux-gnux32-gcc  -mx32 -fstack-protector-strong  -O2 -D_FORT=
IFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysro=
ot=3D/home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_6=
4_x32-poky-linux-gnux32/gpgme/1.20.0-r0/recipe-sysroot -DHAVE_CONFIG_H -I. =
-I../../gpgme-1.20.0/src -I../conf     -O2 -pipe -g -feliminate-unused-debu=
g-types -fcanon-prefix-map  -fmacro-prefix-map=3D/home/pokybuild/yocto-work=
er/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/gpgme/1=
=2E20.0-r0/gpgme-1.20.0=3D/usr/src/debug/gpgme/1.20.0-r0  -fdebug-prefix-ma=
p=3D/home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64=
_x32-poky-linux-gnux32/gpgme/1.20.0-r0/gpgme-1.20.0=3D/usr/src/debug/gpgme/=
1.20.0-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/qemux86-64-x32=
/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/build=3D=
/usr/src/debug/gpgme/1.20.0-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-=
worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/gpg=
me/1.20.0-r0/build=3D/usr/src/debug/gpgme/1.20.0-r0  -fdebug-prefix-map=3D/=
home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-=
poky-linux-gnux32/gpgme/1.20.0-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/=
home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-=
poky-linux-gnux32/gpgme/1.20.0-r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/=
home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-=
poky-linux-gnux32/gpgme/1.20.0-r0/recipe-sysroot-native=3D  -Wall -Wcast-al=
ign -Wshadow -Wstrict-prototypes -Wno-format-y2k -Wno-missing-field-initial=
izers -Wno-sign-compare -Wno-format-zero-length -Wno-format-truncation -Wno=
-sizeof-pointer-div -c -o gpgme-tool.o ../../gpgme-1.20.0/src/gpgme-tool.c
| In file included from ../../gpgme-1.20.0/src/gpgme-tool.c:40:
| ./gpgme.h:111:2: error: #error GPGME was compiled with _FILE_OFFSET_BITS =
=3D 64, please see the section "Largefile support (LFS)" in the GPGME manua=
l.
|   111 | #error GPGME was compiled with _FILE_OFFSET_BITS =3D 64, please s=
ee the section "Largefile support (LFS)" in the GPGME manual.
|       |  ^~~~~
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/qemux86-64-x32/b=
uild/build/tmp/work/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/build/src'
| make[1]: *** [Makefile:983: gpgme-tool.o] Error 1
| make: *** [Makefile:531: all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work=
/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/temp/run.do_compile.1852799:2=
01 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build=
/tmp/work/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/temp/run.do_compile.=
1852799, line 201
| 	#2: die, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/wor=
k/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/temp/run.do_compile.1852799,=
 line 185
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/=
tmp/work/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/temp/run.do_compile.1=
852799, line 180
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/qemux86-64-x32/bu=
ild/build/tmp/work/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/temp/run.do=
_compile.1852799, line 168
| 	#5: do_compile, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/=
tmp/work/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/temp/run.do_compile.1=
852799, line 163
| 	#6: main, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/wo=
rk/x86_64_x32-poky-linux-gnux32/gpgme/1.20.0-r0/temp/run.do_compile.1852799=
, line 214
NOTE: recipe gpgme-1.20.0-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/qemux86-64-x32/build/meta/recipes=
-support/gpgme/gpgme_1.20.0.bb:do_compile) failed with exit code '1'


On 11/07/2023 16:41:13-0700, Khem Raj wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gettext-0.21.1/autoconf-2.73.patch        |  41 ++++++
>  meta/recipes-core/gettext/gettext_0.21.1.bb   |   1 +
>  ...ilers-that-moan-about-K-R-func-decls.patch | 138 ------------------
>  .../{autoconf_2.71.bb =3D> autoconf_2.72c.bb}   |   6 +-
>  .../bison/bison/autoconf-2.73.patch           |  15 ++
>  meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
>  meta/recipes-extended/findutils/findutils.inc |   1 +
>  .../findutils/findutils/autoconf-2.73.patch   |  15 ++
>  .../gzip/gzip-1.12/autoconf-2.73.patch        |  15 ++
>  meta/recipes-extended/gzip/gzip_1.12.bb       |   1 +
>  .../libarchive/libarchive/configurehack.patch |  45 ++++++
>  .../libarchive/libarchive_3.6.2.bb            |   1 +
>  .../libpipeline/autoconf-2.73.patch           |  15 ++
>  .../libpipeline/libpipeline_1.5.7.bb          |   1 +
>  .../man-db/files/autoconf-2.73.patch          |  15 ++
>  meta/recipes-extended/man-db/man-db_2.11.2.bb |   1 +
>  .../parted/files/autoconf-2.73.patch          |  13 ++
>  meta/recipes-extended/parted/parted_3.6.bb    |   1 +
>  .../apr/apr/autoconf-2.73.patch               |  23 +++
>  meta/recipes-support/apr/apr_1.7.4.bb         |   1 +
>  20 files changed, 209 insertions(+), 141 deletions(-)
>  create mode 100644 meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.7=
3.patch
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Port-to-=
compilers-that-moan-about-K-R-func-decls.patch
>  rename meta/recipes-devtools/autoconf/{autoconf_2.71.bb =3D> autoconf_2.=
72c.bb} (92%)
>  create mode 100644 meta/recipes-devtools/bison/bison/autoconf-2.73.patch
>  create mode 100644 meta/recipes-extended/findutils/findutils/autoconf-2.=
73.patch
>  create mode 100644 meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.pa=
tch
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/configure=
hack.patch
>  create mode 100644 meta/recipes-extended/libpipeline/libpipeline/autocon=
f-2.73.patch
>  create mode 100644 meta/recipes-extended/man-db/files/autoconf-2.73.patch
>  create mode 100644 meta/recipes-extended/parted/files/autoconf-2.73.patch
>  create mode 100644 meta/recipes-support/apr/apr/autoconf-2.73.patch
>=20
> diff --git a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch=
 b/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
> new file mode 100644
> index 00000000000..9b3ed336a4b
> --- /dev/null
> +++ b/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
> @@ -0,0 +1,41 @@
> +Upstream-Status: Inappropriate
> +
> +Index: gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gettext-0.21.1.orig/gettext-runtime/gnulib-m4/largefile.m4
> ++++ gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
> +@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> + # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> + # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
> + # or configures them incorrectly in some cases.
> +-m4_version_prereq([2.70], [], [
> ++m4_version_prereq([2.73], [], [
> +=20
> + # _AC_SYS_LARGEFILE_TEST_INCLUDES
> + # -------------------------------
> +Index: gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gettext-0.21.1.orig/gettext-tools/gnulib-m4/largefile.m4
> ++++ gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
> +@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> + # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> + # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
> + # or configures them incorrectly in some cases.
> +-m4_version_prereq([2.70], [], [
> ++m4_version_prereq([2.73], [], [
> +=20
> + # _AC_SYS_LARGEFILE_TEST_INCLUDES
> + # -------------------------------
> +Index: gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gettext-0.21.1.orig/libtextstyle/gnulib-m4/largefile.m4
> ++++ gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
> +@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> + # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> + # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
> + # or configures them incorrectly in some cases.
> +-m4_version_prereq([2.70], [], [
> ++m4_version_prereq([2.73], [], [
> +=20
> + # _AC_SYS_LARGEFILE_TEST_INCLUDES
> + # -------------------------------
> diff --git a/meta/recipes-core/gettext/gettext_0.21.1.bb b/meta/recipes-c=
ore/gettext/gettext_0.21.1.bb
> index b80ea9276ef..2f030a2df9d 100644
> --- a/meta/recipes-core/gettext/gettext_0.21.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.21.1.bb
> @@ -29,6 +29,7 @@ SRC_URI =3D "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz=
 \
>             file://serial-tests-config.patch \
>             file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
>             file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
> +           file://autoconf-2.73.patch \
>             "
>  SRC_URI[sha256sum] =3D "e8c3650e1d8cee875c4f355642382c1df83058bd5a11ee85=
55c0cf276d646d45"
> =20
> diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compile=
rs-that-moan-about-K-R-func-decls.patch b/meta/recipes-devtools/autoconf/au=
toconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch
> deleted file mode 100644
> index 4f15bf96c3b..00000000000
> --- a/meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that=
-moan-about-K-R-func-decls.patch
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -From 7a3bbca81b803ba116b83c82de378e840cc35f81 Mon Sep 17 00:00:00 2001
> -From: Paul Eggert <eggert@cs.ucla.edu>
> -Date: Thu, 1 Sep 2022 16:19:50 -0500
> -Subject: [PATCH] Port to compilers that moan about K&R func decls
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -* lib/autoconf/c.m4 (AC_LANG_CALL, AC_LANG_FUNC_LINK_TRY):
> -Use '(void)' rather than '()' in function prototypes, as the latter
> -provokes fatal errors in some compilers nowadays.
> -* lib/autoconf/functions.m4 (AC_FUNC_STRTOD):
> -* tests/fortran.at (AC_F77_DUMMY_MAIN usage):
> -* tests/semantics.at (AC_CHECK_DECLS):
> -Don=E2=80=99t use () in a function decl.
> -
> -Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/autoconf.gi=
t/commit/?id=3D8b5e2016c7ed2d67f31b03a3d2e361858ff5299b]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - doc/autoconf.texi         | 7 +++----
> - lib/autoconf/c.m4         | 6 +++---
> - lib/autoconf/functions.m4 | 3 ---
> - tests/fortran.at          | 8 ++++----
> - tests/semantics.at        | 2 +-
> - 5 files changed, 11 insertions(+), 15 deletions(-)
> -
> ---- a/doc/autoconf.texi
> -+++ b/doc/autoconf.texi
> -@@ -5465,9 +5465,7 @@ the @samp{#undef malloc}):
> - #include <config.h>
> - #undef malloc
> -=20
> --#include <sys/types.h>
> --
> --void *malloc ();
> -+#include <stdlib.h>
> -=20
> - /* Allocate an N-byte block of memory from the heap.
> -    If N is zero, allocate a 1-byte block.  */
> -@@ -8295,7 +8293,7 @@ needed:
> - #  ifdef __cplusplus
> -      extern "C"
> - #  endif
> --   int F77_DUMMY_MAIN () @{ return 1; @}
> -+   int F77_DUMMY_MAIN (void) @{ return 1; @}
> - #endif
> - @end example
> -=20
> ---- a/lib/autoconf/c.m4
> -+++ b/lib/autoconf/c.m4
> -@@ -127,7 +127,7 @@ m4_if([$2], [main], ,
> - [/* Override any GCC internal prototype to avoid an error.
> -    Use char because int might match the return type of a GCC
> -    builtin and then its argument prototype would still apply.  */
> --char $2 ();])], [return $2 ();])])
> -+char $2 (void);])], [return $2 ();])])
> -=20
> -=20
> - # AC_LANG_FUNC_LINK_TRY(C)(FUNCTION)
> -@@ -151,7 +151,7 @@ m4_define([AC_LANG_FUNC_LINK_TRY(C)],
> - #define $1 innocuous_$1
> -=20
> - /* System header to define __stub macros and hopefully few prototypes,
> --   which can conflict with char $1 (); below.  */
> -+   which can conflict with char $1 (void); below.  */
> -=20
> - #include <limits.h>
> - #undef $1
> -@@ -162,7 +162,7 @@ m4_define([AC_LANG_FUNC_LINK_TRY(C)],
> - #ifdef __cplusplus
> - extern "C"
> - #endif
> --char $1 ();
> -+char $1 (void);
> - /* The GNU C library defines this for functions which it implements
> -     to always fail with ENOSYS.  Some functions are actually named
> -     something starting with __ and the normal name is an alias.  */
> ---- a/lib/autoconf/functions.m4
> -+++ b/lib/autoconf/functions.m4
> -@@ -1601,9 +1601,6 @@ AC_DEFUN([AC_FUNC_STRTOD],
> - AC_CACHE_CHECK(for working strtod, ac_cv_func_strtod,
> - [AC_RUN_IFELSE([AC_LANG_SOURCE([[
> - ]AC_INCLUDES_DEFAULT[
> --#ifndef strtod
> --double strtod ();
> --#endif
> - int
> - main (void)
> - {
> ---- a/tests/fortran.at
> -+++ b/tests/fortran.at
> -@@ -233,7 +233,7 @@ void FOOBAR_F77 (double *x, double *y);
> - #  ifdef __cplusplus
> -      extern "C"
> - #  endif
> --   int F77_DUMMY_MAIN () { return 1; }
> -+   int F77_DUMMY_MAIN (void) { return 1; }
> - #endif
> -=20
> - int main(int argc, char *argv[])
> -@@ -315,7 +315,7 @@ void FOOBAR_FC(double *x, double *y);
> - #  ifdef __cplusplus
> -      extern "C"
> - #  endif
> --   int FC_DUMMY_MAIN () { return 1; }
> -+   int FC_DUMMY_MAIN (void) { return 1; }
> - #endif
> -=20
> - int main (int argc, char *argv[])
> -@@ -561,7 +561,7 @@ void @foobar@ (int *x);
> - #  ifdef __cplusplus
> -      extern "C"
> - #  endif
> --   int F77_DUMMY_MAIN () { return 1; }
> -+   int F77_DUMMY_MAIN (void) { return 1; }
> - #endif
> -=20
> - int main(int argc, char *argv[])
> -@@ -637,7 +637,7 @@ void @foobar@ (int *x);
> - #  ifdef __cplusplus
> -      extern "C"
> - #  endif
> --   int FC_DUMMY_MAIN () { return 1; }
> -+   int FC_DUMMY_MAIN (void) { return 1; }
> - #endif
> -=20
> - int main(int argc, char *argv[])
> ---- a/tests/semantics.at
> -+++ b/tests/semantics.at
> -@@ -207,7 +207,7 @@ AT_CHECK_MACRO([AC_CHECK_DECLS],
> - 		 [[extern int yes;
> - 		   enum { myenum };
> - 		   extern struct mystruct_s { int x[20]; } mystruct;
> --		   extern int myfunc();
> -+		   extern int myfunc (int);
> - 		   #define mymacro1(arg) arg
> - 		   #define mymacro2]])
> -   # Ensure we can detect missing declarations of functions whose
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.71.bb b/meta/recip=
es-devtools/autoconf/autoconf_2.72c.bb
> similarity index 92%
> rename from meta/recipes-devtools/autoconf/autoconf_2.71.bb
> rename to meta/recipes-devtools/autoconf/autoconf_2.72c.bb
> index 97c241a3f5f..fe9779e4ddb 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.71.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.72c.bb
> @@ -11,18 +11,18 @@ DEPENDS:remove:class-native =3D "autoconf-native auto=
make-native help2man-native"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcc3f3a7596cb558bbd9eb7fbaa3ef=
16c \
>  		    file://COPYINGv3;md5=3D1ebbd3e34237af26da5dc08a4e440464"
> =20
> -SRC_URI =3D "${GNU_MIRROR}/autoconf/${BP}.tar.gz \
> +SRC_URI =3D " \
> +           https://alpha.gnu.org/gnu/autoconf/autoconf-2.72c.tar.gz \
>             file://program_prefix.patch \
>             file://autoreconf-exclude.patch \
>             file://remove-usr-local-lib-from-m4.patch \
>             file://preferbash.patch \
>             file://autotest-automake-result-format.patch \
>             file://man-host-perl.patch \
> -           file://0001-Port-to-compilers-that-moan-about-K-R-func-decls.=
patch \
>             "
>  SRC_URI:append:class-native =3D " file://no-man.patch"
> =20
> -SRC_URI[sha256sum] =3D "431075ad0bf529ef13cb41e9042c542381103e8001568622=
2b8a9d4abef42a1c"
> +SRC_URI[sha256sum] =3D "21b64169c820c6cdf27fc981ca9c2fb615546e5dead92bcc=
f8d92d0784cdd364"
> =20
>  RDEPENDS:${PN} =3D "m4 gnu-config \
>  		  perl \
> diff --git a/meta/recipes-devtools/bison/bison/autoconf-2.73.patch b/meta=
/recipes-devtools/bison/bison/autoconf-2.73.patch
> new file mode 100644
> index 00000000000..8c77d50e0a6
> --- /dev/null
> +++ b/meta/recipes-devtools/bison/bison/autoconf-2.73.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Inappropriate
> +
> +Index: findutils-4.9.0/gl/m4/largefile.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- findutils-4.9.0.orig/m4/largefile.m4
> ++++ findutils-4.9.0/m4/largefile.m4
> +@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> + # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> + # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
> + # or configures them incorrectly in some cases.
> +-m4_version_prereq([2.70], [], [
> ++m4_version_prereq([2.73], [], [
> +=20
> + # _AC_SYS_LARGEFILE_TEST_INCLUDES
> + # -------------------------------
> diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-de=
vtools/bison/bison_3.8.2.bb
> index c95f321244f..da138e35874 100644
> --- a/meta/recipes-devtools/bison/bison_3.8.2.bb
> +++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
> @@ -10,6 +10,7 @@ SECTION =3D "devel"
>  DEPENDS =3D "bison-native flex-native"
> =20
>  SRC_URI =3D "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
> +           file://autoconf-2.73.patch \
>             file://add-with-bisonlocaledir.patch \
>             "
>  SRC_URI[sha256sum] =3D "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa8=
0cd3849cff5a5bf2"
> diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes=
-extended/findutils/findutils.inc
> index ddcc05750b8..03cf2a8d72b 100644
> --- a/meta/recipes-extended/findutils/findutils.inc
> +++ b/meta/recipes-extended/findutils/findutils.inc
> @@ -7,6 +7,7 @@ BUGTRACKER =3D "http://savannah.gnu.org/bugs/?group=3Dfin=
dutils"
>  SECTION =3D "console/utils"
> =20
>  SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
> +          file://autoconf-2.73.patch \
>            file://run-ptest \
>            "
> =20
> diff --git a/meta/recipes-extended/findutils/findutils/autoconf-2.73.patc=
h b/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
> new file mode 100644
> index 00000000000..2247ebe5b2b
> --- /dev/null
> +++ b/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Inappropriate
> +
> +Index: findutils-4.9.0/gl/m4/largefile.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- findutils-4.9.0.orig/gl/m4/largefile.m4
> ++++ findutils-4.9.0/gl/m4/largefile.m4
> +@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> + # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> + # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
> + # or configures them incorrectly in some cases.
> +-m4_version_prereq([2.70], [], [
> ++m4_version_prereq([2.73], [], [
> +=20
> + # _AC_SYS_LARGEFILE_TEST_INCLUDES
> + # -------------------------------
> diff --git a/meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch b/m=
eta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch
> new file mode 100644
> index 00000000000..8c77d50e0a6
> --- /dev/null
> +++ b/meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Inappropriate
> +
> +Index: findutils-4.9.0/gl/m4/largefile.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- findutils-4.9.0.orig/m4/largefile.m4
> ++++ findutils-4.9.0/m4/largefile.m4
> +@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> + # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> + # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
> + # or configures them incorrectly in some cases.
> +-m4_version_prereq([2.70], [], [
> ++m4_version_prereq([2.73], [], [
> +=20
> + # _AC_SYS_LARGEFILE_TEST_INCLUDES
> + # -------------------------------
> diff --git a/meta/recipes-extended/gzip/gzip_1.12.bb b/meta/recipes-exten=
ded/gzip/gzip_1.12.bb
> index 14de50b2305..35eb7c4da23 100644
> --- a/meta/recipes-extended/gzip/gzip_1.12.bb
> +++ b/meta/recipes-extended/gzip/gzip_1.12.bb
> @@ -5,6 +5,7 @@ require gzip.inc
>  LICENSE =3D "GPL-3.0-or-later"
> =20
>  SRC_URI =3D "${GNU_MIRROR}/gzip/${BP}.tar.gz \
> +           file://autoconf-2.73.patch \
>             file://run-ptest \
>            "
>  SRC_URI:append:class-target =3D " file://wrong-path-fix.patch"
> diff --git a/meta/recipes-extended/libarchive/libarchive/configurehack.pa=
tch b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
> new file mode 100644
> index 00000000000..991ec92f053
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
> @@ -0,0 +1,45 @@
> +Upstream-Status: Pending
> +Index: libarchive-3.6.2/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libarchive-3.6.2.orig/configure.ac
> ++++ libarchive-3.6.2/configure.ac
> +@@ -357,6 +357,19 @@ if test "x$with_bz2lib" !=3D "xno"; then
> +   esac
> + fi
> +=20
> ++# Checks for typedefs, structures, and compiler characteristics.
> ++AC_C_CONST
> ++# la_TYPE_UID_T defaults to "int", which is incorrect for MinGW
> ++# and MSVC. Use a customized version.
> ++la_TYPE_UID_T
> ++AC_TYPE_MODE_T
> ++# AC_TYPE_OFF_T defaults to "long", which limits us to 4GB files on
> ++# most systems... default to "long long" instead.
> ++AC_CHECK_TYPE(off_t, [long long])
> ++AC_TYPE_SIZE_T
> ++AC_CHECK_TYPE(id_t, [unsigned long])
> ++AC_CHECK_TYPE(uintptr_t, [unsigned int])
> ++
> + AC_ARG_WITH([libb2],
> +   AS_HELP_STRING([--without-libb2], [Don't build support for BLAKE2 thr=
ough libb2]))
> +=20
> +@@ -558,19 +571,6 @@ LDFLAGS=3D$save_LDFLAGS
> +=20
> + AC_SUBST(GC_SECTIONS)
> +=20
> +-# Checks for typedefs, structures, and compiler characteristics.
> +-AC_C_CONST
> +-# la_TYPE_UID_T defaults to "int", which is incorrect for MinGW
> +-# and MSVC. Use a customized version.
> +-la_TYPE_UID_T
> +-AC_TYPE_MODE_T
> +-# AC_TYPE_OFF_T defaults to "long", which limits us to 4GB files on
> +-# most systems... default to "long long" instead.
> +-AC_CHECK_TYPE(off_t, [long long])
> +-AC_TYPE_SIZE_T
> +-AC_CHECK_TYPE(id_t, [unsigned long])
> +-AC_CHECK_TYPE(uintptr_t, [unsigned int])
> +-
> + # Check for tm_gmtoff in struct tm
> + AC_CHECK_MEMBERS([struct tm.tm_gmtoff, struct tm.__tm_gmtoff],,,
> + [
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/=
recipes-extended/libarchive/libarchive_3.6.2.bb
> index aafede3da8c..bf14725dc18 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
> @@ -29,6 +29,7 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zst=
d,"
>  EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
> =20
>  SRC_URI =3D "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
> +SRC_URI +=3D "file://configurehack.patch"
>  UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
> =20
>  SRC_URI[sha256sum] =3D "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4=
df85c44d5f19b9b3"
> diff --git a/meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.=
patch b/meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch
> new file mode 100644
> index 00000000000..2247ebe5b2b
> --- /dev/null
> +++ b/meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Inappropriate
> +
> +Index: findutils-4.9.0/gl/m4/largefile.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- findutils-4.9.0.orig/gl/m4/largefile.m4
> ++++ findutils-4.9.0/gl/m4/largefile.m4
> +@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> + # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> + # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
> + # or configures them incorrectly in some cases.
> +-m4_version_prereq([2.70], [], [
> ++m4_version_prereq([2.73], [], [
> +=20
> + # _AC_SYS_LARGEFILE_TEST_INCLUDES
> + # -------------------------------
> diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb b/met=
a/recipes-extended/libpipeline/libpipeline_1.5.7.bb
> index 73c7aaaa914..7e3f13ebde0 100644
> --- a/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb
> +++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb
> @@ -7,6 +7,7 @@ LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
> =20
>  SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
> +SRC_URI +=3D "file://autoconf-2.73.patch"
>  SRC_URI[sha256sum] =3D "b8b45194989022a79ec1317f64a2a75b1551b2a55bea06f6=
7704cb2a2e4690b0"
> =20
>  inherit pkgconfig autotools
> diff --git a/meta/recipes-extended/man-db/files/autoconf-2.73.patch b/met=
a/recipes-extended/man-db/files/autoconf-2.73.patch
> new file mode 100644
> index 00000000000..2247ebe5b2b
> --- /dev/null
> +++ b/meta/recipes-extended/man-db/files/autoconf-2.73.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Inappropriate
> +
> +Index: findutils-4.9.0/gl/m4/largefile.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- findutils-4.9.0.orig/gl/m4/largefile.m4
> ++++ findutils-4.9.0/gl/m4/largefile.m4
> +@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> + # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> + # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
> + # or configures them incorrectly in some cases.
> +-m4_version_prereq([2.70], [], [
> ++m4_version_prereq([2.73], [], [
> +=20
> + # _AC_SYS_LARGEFILE_TEST_INCLUDES
> + # -------------------------------
> diff --git a/meta/recipes-extended/man-db/man-db_2.11.2.bb b/meta/recipes=
-extended/man-db/man-db_2.11.2.bb
> index ca0cb1a0e12..3884a531a6a 100644
> --- a/meta/recipes-extended/man-db/man-db_2.11.2.bb
> +++ b/meta/recipes-extended/man-db/man-db_2.11.2.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237=
af26da5dc08a4e440464 \
>  SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
>             file://99_mandb \
>             file://0001-man-Move-local-variable-declaration-to-function-s=
cop.patch \
> +           file://autoconf-2.73.patch \
>             file://man_db.conf-avoid-multilib-install-file-conflict.patch"
>  SRC_URI[sha256sum] =3D "cffa1ee4e974be78646c46508e6dd2f37e7c589aaab2938c=
c1064f058fef9f8d"
> =20
> diff --git a/meta/recipes-extended/parted/files/autoconf-2.73.patch b/met=
a/recipes-extended/parted/files/autoconf-2.73.patch
> new file mode 100644
> index 00000000000..23abc2fc6b6
> --- /dev/null
> +++ b/meta/recipes-extended/parted/files/autoconf-2.73.patch
> @@ -0,0 +1,13 @@
> +Upstream-Status: Inappropriate
> +
> +--- a/m4/largefile.m4
> ++++ b/m4/largefile.m4
> +@@ -27,7 +27,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> + # Work around a problem in autoconf <=3D 2.69:
> + # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
> + # or configures them incorrectly in some cases.
> +-m4_version_prereq([2.70], [], [
> ++m4_version_prereq([2.73], [], [
> +=20
> + # _AC_SYS_LARGEFILE_TEST_INCLUDES
> + # -------------------------------
> diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-ex=
tended/parted/parted_3.6.bb
> index a755e1c148b..a537ef74dba 100644
> --- a/meta/recipes-extended/parted/parted_3.6.bb
> +++ b/meta/recipes-extended/parted/parted_3.6.bb
> @@ -9,6 +9,7 @@ DEPENDS =3D "ncurses util-linux virtual/libiconv"
>  SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
>             file://fix-doc-mandir.patch \
>             file://0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-r=
esi.patch \
> +           file://autoconf-2.73.patch \
>             file://run-ptest \
>             "
> =20
> diff --git a/meta/recipes-support/apr/apr/autoconf-2.73.patch b/meta/reci=
pes-support/apr/apr/autoconf-2.73.patch
> new file mode 100644
> index 00000000000..7ddb7668bd0
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr/autoconf-2.73.patch
> @@ -0,0 +1,23 @@
> +Upstream-Status: Pending
> +
> +Index: apr-1.7.2/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- apr-1.7.2.orig/configure.in
> ++++ apr-1.7.2/configure.in
> +@@ -430,6 +430,8 @@ if test "$host" =3D "i586-pc-beos"; then
> +   ) dnl
> + fi
> +=20
> ++APR_CHECK_DEFINE(LOCK_EX, sys/file.h)
> ++
> + # this is the place to put specific options for platform/compiler
> + # combinations
> + case "$host:$CC" in
> +@@ -2384,7 +2386,6 @@ AC_MSG_RESULT([$msg])
> + AC_SUBST(have_union_semun)
> +=20
> + dnl Checks for libraries.
> +-APR_CHECK_DEFINE(LOCK_EX, sys/file.h)
> + APR_CHECK_DEFINE(F_SETLK, fcntl.h)
> + APR_CHECK_DEFINE(SEM_UNDO, sys/sem.h)
> +=20
> diff --git a/meta/recipes-support/apr/apr_1.7.4.bb b/meta/recipes-support=
/apr/apr_1.7.4.bb
> index e5714693416..5ac7f4b93f7 100644
> --- a/meta/recipes-support/apr/apr_1.7.4.bb
> +++ b/meta/recipes-support/apr/apr_1.7.4.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
>             file://libtoolize_check.patch \
>             file://0001-Add-option-to-disable-timed-dependant-tests.patch=
 \
>             file://0001-configure-Remove-runtime-test-for-mmap-that-can-m=
ap-.patch \
> +           file://autoconf-2.73.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4=
367a701fe5c35577"
> --=20
> 2.41.0
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184163): https://lists.openembedded.org/g/openembedde=
d-core/message/184163
> Mute This Topic: https://lists.openembedded.org/mt/100090408/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

