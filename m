Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCCBE77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 11:31:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.20338.1735212654407341036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 03:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VVD8WAwN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3AA0E0002;
	Thu, 26 Dec 2024 11:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735212652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRMUAn4cMBPcTO5VTY0piIhhrEJahdoJRrlrA0zlRq0=;
	b=VVD8WAwNzhanaulxubUpI8f2deYdrr/oYdlbNuFLcQjJexOAg2TKpWj3FfscIucYMuI8x8
	9WEdYtHfzkOLA4oC/0XuPLEB2/3itq0RKcLKJgDwV77NAM8A0O1RNlVJjRlpiYLB3GeS1i
	Vjhp4V2qpFHpU/BTRhhG34swHMhgBnkmKb+AoBgn4Fwdw0VdU8IUR5wtw44CZr0FbdRxcq
	6C59JAvEpMRHSNjwKA1ZnZI6qqEmnlYe3/DwLIUZ6ElfiEKDIxyB0Rs6tpnhj0IGjhxeU7
	bfnqo4Tn3rfq1A2TzlWQRHO0Z7X69RMWptL1YKwVOLa4Qeo4aTmMgZNakTKCWg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Dec 2024 12:30:51 +0100
Message-Id: <D6LLJRE9T1VK.3R4VDY6FXE0TJ@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] gettext: upgrade 0.22.5 -> 0.23
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241225103244.3514559-1-marcel@ziswiler.com>
In-Reply-To: <20241225103244.3514559-1-marcel@ziswiler.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Dec 2024 11:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209091

On Wed Dec 25, 2024 at 11:32 AM CET, Marcel Ziswiler wrote:
> Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
> ---
>
> Changes in v2:
> - Fix malformed diff lines by reverting to using patman for sending.
> - Do not revert the rename of remove-potcdate.sin to remove-potcdate.sed
>   as suggested by Alex.
>
>  ...22.5.bb =3D> gettext-minimal-native_0.23.bb} |  2 +-
>  meta/recipes-core/gettext/gettext-sources.inc |  2 +-
>  ...t-env.in-do-not-add-C-CXX-parameters.patch |  4 +--
>  ...1-intl-Fix-build-failure-with-make-j.patch | 35 -------------------
>  ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  4 +--
>  .../gettext/gettext/parallel.patch            | 10 +++---
>  .../gettext/gettext/serial-tests-config.patch |  8 ++---
>  .../gettext/gettext/use-pkgconfig.patch       | 16 ++++-----
>  .../{gettext_0.22.5.bb =3D> gettext_0.23.bb}    |  3 +-
>  9 files changed, 24 insertions(+), 60 deletions(-)
>  rename meta/recipes-core/gettext/{gettext-minimal-native_0.22.5.bb =3D> =
gettext-minimal-native_0.23.bb} (96%)
>  delete mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build=
-failure-with-make-j.patch
>  rename meta/recipes-core/gettext/{gettext_0.22.5.bb =3D> gettext_0.23.bb=
} (98%)
>
> diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb b=
/meta/recipes-core/gettext/gettext-minimal-native_0.23.bb
> similarity index 96%
> rename from meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
> rename to meta/recipes-core/gettext/gettext-minimal-native_0.23.bb
> index 96acf9bb9fc6..e443b6b34fa0 100644
> --- a/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
> +++ b/meta/recipes-core/gettext/gettext-minimal-native_0.23.bb
> @@ -42,5 +42,5 @@ do_install () {
>  	install -d ${D}${datadir}/gettext/po/
>  	cp ${S}/build-aux/config.rpath ${D}${datadir}/gettext/
>  	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
> -	cp ${S}/gettext-runtime/po/remove-potcdate.sin ${D}${datadir}/gettext/p=
o/
> +	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/p=
o/
>  }
> diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes=
-core/gettext/gettext-sources.inc
> index fd05837528c8..9805b1d9074c 100644
> --- a/meta/recipes-core/gettext/gettext-sources.inc
> +++ b/meta/recipes-core/gettext/gettext-sources.inc
> @@ -1,4 +1,4 @@
>  HOMEPAGE =3D "http://www.gnu.org/software/gettext/gettext.html"
>  SRC_URI =3D "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>             "
> -SRC_URI[sha256sum] =3D "ec1705b1e969b83a9f073144ec806151db88127f5e40fe5a=
94cb6c8fa48996a0"
> +SRC_URI[sha256sum] =3D "945dd7002a02dd7108ad0510602e13416b41d327898cf852=
2201bc6af10907a6"
> diff --git a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-ad=
d-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext/0001-init-env.=
in-do-not-add-C-CXX-parameters.patch
> index 33d45a038cff..e7cb93d6e201 100644
> --- a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX=
-parameters.patch
> +++ b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX=
-parameters.patch
> @@ -24,6 +24,6 @@ index cc84ffd..b69c990 100644
>  -CFLAGS=3D"@CFLAGS@"
>  -CXX=3D"@CXX@"
>  -CXXFLAGS=3D"@CXXFLAGS@"
> + OBJC=3D"@OBJC@"
> + OBJCFLAGS=3D"@OBJCFLAGS@"
>   CPPFLAGS=3D"@CPPFLAGS@"
> - LDFLAGS=3D"@LDFLAGS@"
> - LTLIBINTL=3D"@LTLIBINTL@"
> diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failur=
e-with-make-j.patch b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build=
-failure-with-make-j.patch
> deleted file mode 100644
> index 144259dd3f2f..000000000000
> --- a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-=
make-j.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 97a6a63ad61949663283f5fad68c9d5fb9be1f15 Mon Sep 17 00:00:00 2001
> -From: Bruno Haible <bruno@clisp.org>
> -Date: Tue, 12 Sep 2023 11:33:41 +0200
> -Subject: [PATCH] intl: Fix build failure with "make -j".
> -
> -Reported by Christian Weisgerber <naddy@mips.inka.de> at
> -<https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html>.
> -
> -* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on get=
textP.h
> -and its subordinate includes.
> -
> -Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=3Dgett=
ext.git;a=3Dcommit;h=3D97a6a63ad61949663283f5fad68c9d5fb9be1f15]
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - gettext-runtime/intl/Makefile.am | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Mak=
efile.am
> -index da7abb758..9e56978bc 100644
> ---- a/gettext-runtime/intl/Makefile.am
> -+++ b/gettext-runtime/intl/Makefile.am
> -@@ -387,8 +387,8 @@ dngettext.lo:        ../config.h $(srcdir)/gettextP.=
h libgnuintl.h $(srcdir)/gmo
> - ngettext.lo:         ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> - plural.lo:           ../config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
> - plural-exp.lo:       ../config.h $(srcdir)/plural-exp.h
> --langprefs.lo:        ../config.h
> --log.lo:              ../config.h
> -+langprefs.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> -+log.lo:              ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> - printf.lo:           ../config.h
> - setlocale.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> - version.lo:          ../config.h libgnuintl.h
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-uns=
et-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-tests-autopoint=
-3-unset-MAKEFLAGS.patch
> index 94afb255c385..6aa1b7d8519b 100644
> --- a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKE=
FLAGS.patch
> +++ b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKE=
FLAGS.patch
> @@ -16,10 +16,10 @@ diff --git a/gettext-tools/tests/autopoint-3 b/gettex=
t-tools/tests/autopoint-3
>  index bd3fbf3..380eaac 100755
>  --- a/gettext-tools/tests/autopoint-3
>  +++ b/gettext-tools/tests/autopoint-3
> -@@ -131,6 +131,7 @@ test $? =3D 0 || { cat autopoint.err; Exit 1; }
> - ${CONFIG_SHELL} ./configure >/dev/null 2>autpoint.err
> +@@ -137,6 +137,7 @@ ${CONFIG_SHELL} ./configure >/dev/null 2>autopoint.e=
rr
>   test $? =3D 0 || { cat autopoint.err; Exit 1; }
>
> + : ${MAKE=3Dmake}
>  +unset MAKEFLAGS
>   ${MAKE} >/dev/null 2>autopoint.err
>   test $? =3D 0 || { cat autopoint.err; Exit 1; }
> diff --git a/meta/recipes-core/gettext/gettext/parallel.patch b/meta/reci=
pes-core/gettext/gettext/parallel.patch
> index 8ecba46fd0ac..22515c24ac4e 100644
> --- a/meta/recipes-core/gettext/gettext/parallel.patch
> +++ b/meta/recipes-core/gettext/gettext/parallel.patch
> @@ -1,4 +1,4 @@
> -From 83333bc873c2655ff1de161f6b7db930f22f1cea Mon Sep 17 00:00:00 2001
> +From f2455b7ab3826875d09eb3a11fbb830dd856f974 Mon Sep 17 00:00:00 2001
>  From: Joe Slater <jslater@windriver.com>
>  Date: Thu, 7 Jun 2012 16:37:01 -0700
>  Subject: [PATCH] instal libgettextlib.a before removing it
> @@ -15,12 +15,12 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
>   1 file changed, 4 insertions(+)
>
>  diff --git a/gettext-tools/gnulib-lib/Makefile.am b/gettext-tools/gnulib=
-lib/Makefile.am
> -index ab729cd..a0d713e 100644
> +index a7fa494..4d0536a 100644
>  --- a/gettext-tools/gnulib-lib/Makefile.am
>  +++ b/gettext-tools/gnulib-lib/Makefile.am
> -@@ -58,6 +58,10 @@ AM_CFLAGS =3D @WARN_CFLAGS@
> - # Rules generated and collected by gnulib-tool.
> - include Makefile.gnulib
> +@@ -88,6 +88,10 @@ endif
> + libgettextlib_la_LIBADD       +=3D $(WOE32_LIBADD)
> + libgettextlib_la_DEPENDENCIES +=3D $(WOE32_LIBADD)
>
>  +# defined in Makefile.gnulib but missing this dependency
>  +#
> diff --git a/meta/recipes-core/gettext/gettext/serial-tests-config.patch =
b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
> index 7d39d6086abc..3c354c21ff5b 100644
> --- a/meta/recipes-core/gettext/gettext/serial-tests-config.patch
> +++ b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
> @@ -1,4 +1,4 @@
> -From aa8dfe0aafd0b53a6c5bac61b356ca92e1430a36 Mon Sep 17 00:00:00 2001
> +From 111376001f75209d9342c8f2c6495c99a443da7f Mon Sep 17 00:00:00 2001
>  From: "Hongjun.Yang" <hongjun.yang@windriver.com>
>  Date: Thu, 28 Jul 2016 12:36:15 +0800
>  Subject: [PATCH] fix for ptest
> @@ -15,7 +15,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com=
>
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index f4e54ea..a47ff14 100644
> +index 5106676..3114998 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -22,7 +22,7 @@ AC_INIT([gettext],
> @@ -28,7 +28,7 @@ index f4e54ea..a47ff14 100644
>   dnl Override automake's tar command used for creating distributions.
>   am__tar=3D'${AMTAR} chf - --format=3Dustar --owner=3Droot --group=3Droo=
t "$$tardir"'
>  diff --git a/gettext-runtime/configure.ac b/gettext-runtime/configure.ac
> -index 126d069..aa23232 100644
> +index e128f5b..9f7447c 100644
>  --- a/gettext-runtime/configure.ac
>  +++ b/gettext-runtime/configure.ac
>  @@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
> @@ -41,7 +41,7 @@ index 126d069..aa23232 100644
>
>   dnl Installation directories.
>  diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
> -index 3610ee3..6f56a23 100644
> +index 034936c..d31decf 100644
>  --- a/gettext-tools/configure.ac
>  +++ b/gettext-tools/configure.ac
>  @@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
> diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta=
/recipes-core/gettext/gettext/use-pkgconfig.patch
> index ceb1856118a5..796b70005672 100644
> --- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
> +++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
> @@ -1,4 +1,4 @@
> -From 6aa1338b916fe72c200b6f160b934be15b6ff590 Mon Sep 17 00:00:00 2001
> +From 54ae005d0258d1e2041304c5568de768ad8c3248 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Tue, 23 Jan 2018 00:54:13 +0000
>  Subject: [PATCH] gettext: beat library detection into shape
> @@ -19,10 +19,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>   3 files changed, 31 insertions(+), 286 deletions(-)
>
>  diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4=
/libxml.m4
> -index 0340490..0355388 100644
> +index c7160d7..8e46cc7 100644
>  --- a/gettext-tools/gnulib-m4/libxml.m4
>  +++ b/gettext-tools/gnulib-m4/libxml.m4
> -@@ -13,6 +13,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
> +@@ -14,6 +14,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
>   dnl   forces the use of the included or an external libxml.
>   AC_DEFUN([gl_LIBXML],
>   [
> @@ -30,7 +30,7 @@ index 0340490..0355388 100644
>     AC_REQUIRE([AM_ICONV_LINK])
>
>     ifelse([$1], , [
> -@@ -30,106 +31,10 @@ AC_DEFUN([gl_LIBXML],
> +@@ -31,106 +32,10 @@ AC_DEFUN([gl_LIBXML],
>     INCXML=3D
>     ifelse([$1], [yes], , [
>       if test "$gl_cv_libxml_use_included" !=3D yes; then
> @@ -142,10 +142,10 @@ index 0340490..0355388 100644
>     ])
>     AC_SUBST([LIBXML])
>  diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnul=
ib-local/m4/libglib.m4
> -index dbc9eb8..136e512 100644
> +index baa2cf4..b287c5b 100644
>  --- a/libtextstyle/gnulib-local/m4/libglib.m4
>  +++ b/libtextstyle/gnulib-local/m4/libglib.m4
> -@@ -6,106 +6,26 @@ dnl with or without modifications, as long as this no=
tice is preserved.
> +@@ -7,106 +7,26 @@ dnl with or without modifications, as long as this no=
tice is preserved.
>
>   dnl From Bruno Haible.
>
> @@ -266,10 +266,10 @@ index dbc9eb8..136e512 100644
>     AC_SUBST([LTLIBGLIB])
>     AC_SUBST([INCGLIB])
>  diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/=
libglib.m4
> -index dbc9eb8..136e512 100644
> +index baa2cf4..b287c5b 100644
>  --- a/libtextstyle/gnulib-m4/libglib.m4
>  +++ b/libtextstyle/gnulib-m4/libglib.m4
> -@@ -6,106 +6,26 @@ dnl with or without modifications, as long as this no=
tice is preserved.
> +@@ -7,106 +7,26 @@ dnl with or without modifications, as long as this no=
tice is preserved.
>
>   dnl From Bruno Haible.
>
> diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-c=
ore/gettext/gettext_0.23.bb
> similarity index 98%
> rename from meta/recipes-core/gettext/gettext_0.22.5.bb
> rename to meta/recipes-core/gettext/gettext_0.23.bb
> index 0bf2a56e5fcf..181457f7716c 100644
> --- a/meta/recipes-core/gettext/gettext_0.22.5.bb
> +++ b/meta/recipes-core/gettext/gettext_0.23.bb
> @@ -28,7 +28,6 @@ SRC_URI +=3D " \
>             file://serial-tests-config.patch \
>             file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
>             file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
> -           file://0001-intl-Fix-build-failure-with-make-j.patch \
>             "
>
>  inherit autotools texinfo pkgconfig ptest
> @@ -130,7 +129,7 @@ do_install:append:class-native () {
>  	rm ${D}${datadir}/aclocal/*
>  	rm ${D}${datadir}/gettext/config.rpath
>  	rm ${D}${datadir}/gettext/po/Makefile.in.in
> -	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
> +	rm ${D}${datadir}/gettext/po/remove-potcdate.sed
>
>          create_wrapper ${D}${bindir}/msgfmt \
>                  GETTEXTDATADIR=3D"${STAGING_DATADIR_NATIVE}/gettext-${PV=
}/"
> --
> 2.47.1

Hi Marcel,

It looks like this patch is breaking some builds on the autobuilder:

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qemuppc-al=
t/build/build/tmp/work/x86_64-linux/dpkg-native/1.22.11/temp/log.do_configu=
re.1137196
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/qemuppc-alt/b=
uild/meta/recipes-core/gettext/gettext-minimal-native_0.23.bb:do_populate_s=
ysroot', '/srv/pokybuild/yocto-worker/qemuppc-alt/build/meta/recipes-devtoo=
ls/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yo=
cto-worker/qemuppc-alt/build/meta/recipes-devtools/quilt/quilt-native_0.68.=
bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/qemupp=
c-alt/build/meta/recipes-core/gettext/gettext_0.23.bb:do_populate_sysroot',=
 'virtual:native:/srv/pokybuild/yocto-worker/qemuppc-alt/build/meta/recipes=
-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybui=
ld/yocto-worker/qemuppc-alt/build/meta/recipes-devtools/autoconf/autoconf_2=
.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/q=
emuppc-alt/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populat=
e_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/qemuppc-alt/build/m=
eta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', '=
virtual:native:/srv/pokybuild/yocto-worker/qemuppc-alt/build/meta/recipes-d=
evtools/perl/perl_5.40.0.bb:do_populate_sysroot', 'virtual:native:/srv/poky=
build/yocto-worker/qemuppc-alt/build/meta/recipes-devtools/pkgconfig/pkgcon=
fig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worke=
r/qemuppc-alt/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_=
sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/qemuppc-alt/build/met=
a/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot', 'virtual:native:/sr=
v/pokybuild/yocto-worker/qemuppc-alt/build/meta/recipes-support/libmd/libmd=
_1.1.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', '=
libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'gett=
ext-native', 'zlib-native', 'autoconf-native', 'automake-native', 'gnu-conf=
ig-native', 'make-native', 'opkg-utils-native', 'perl-native', 'pkgconfig-n=
ative', 'bzip2-native', 'xz-native', 'gdbm-native', 'libmd-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-=
64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.17
| Features: subsecond-mtime
|
| Copyright (C) 2024 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
|   <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1
| cp: cannot stat '/srv/pokybuild/yocto-worker/qemuppc-alt/build/build/tmp/=
work/x86_64-linux/dpkg-native/1.22.11/recipe-sysroot-native/usr/share/gette=
xt/po/remove-potcdate.sin': No such file or directory
| WARNING: exit code 1 from a shell command.

https://valkyrie.yoctoproject.org/#/builders/64/builds/630/steps/12/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/99/builds/705/steps/11/logs/st=
dio


Looking at the sources, it looks like it might come from
remove-potcdate.sin reference in meta/classes-recipe/autotools.bbclass.

Can you fix this issue please ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


