Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2F4C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 16:48:45 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.75939.1698598116591414588
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 09:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id 7E88A6F29
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 17:48:34 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.58]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qx8xk-15y6VN0; Sun, 29 Oct 2023 17:48:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libcroco: drop recipe
Date: Sun, 29 Oct 2023 17:48:49 +0100
Message-ID: <20231029164849.856435-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1698598112-E9D22D5E-FC69C8CC/0/0 CLEAN NORMAL
X-TOI-MSGID: 534b86d7-27ae-4097-aa66-4d0b6bcfb9b4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 16:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189777

libcroco has been deprecated and was archived by the gnome-project

https://gitlab.gnome.org/Archive/libcroco

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../gettext/gettext/use-pkgconfig.patch       | 319 +-----------------
 meta/recipes-core/gettext/gettext_0.22.bb     |   6 +-
 .../libcroco/files/CVE-2020-12825.patch       | 192 -----------
 .../libcroco/libcroco_0.6.13.bb               |  26 --
 5 files changed, 3 insertions(+), 541 deletions(-)
 delete mode 100644 meta/recipes-support/libcroco/files/CVE-2020-12825.pa=
tch
 delete mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index b2579fc44c..35f8a72fa4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -320,7 +320,6 @@ RECIPE_MAINTAINER:pn-libcgroup =3D "Alexander Kanavin=
 <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libcheck =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcomps =3D "Alexander Kanavin <alex.kanavin@gmail=
.com>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl =3D "Tim Orling <tim.orling@ko=
nsulko.com>"
-RECIPE_MAINTAINER:pn-libcroco =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libdaemon =3D "Alexander Kanavin <alex.kanavin@gmai=
l.com>"
 RECIPE_MAINTAINER:pn-libdazzle =3D "Alexander Kanavin <alex.kanavin@gmai=
l.com>"
 RECIPE_MAINTAINER:pn-libdnf =3D "Alexander Kanavin <alex.kanavin@gmail.c=
om>"
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta=
/recipes-core/gettext/gettext/use-pkgconfig.patch
index c12e0d3b88..f1fb61de4e 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -15,14 +15,9 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
=20
 ---
  gettext-tools/gnulib-m4/libxml.m4             | 105 +----------------
- .../gnulib-local/lib/term-styled-ostream.oo.c |  12 +-
- libtextstyle/gnulib-local/m4/libcroco.m4      |  98 +++-------------
  libtextstyle/gnulib-local/m4/libglib.m4       | 106 +++---------------
- libtextstyle/gnulib-m4/libcroco.m4            |  98 +++-------------
  libtextstyle/gnulib-m4/libglib.m4             | 106 +++---------------
- libtextstyle/lib/term-styled-ostream.c        |  12 +-
- libtextstyle/lib/term-styled-ostream.oo.c     |  12 +-
- 8 files changed, 79 insertions(+), 470 deletions(-)
+ 3 files changed, 79 insertions(+), 470 deletions(-)
=20
 diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4=
/libxml.m4
 index 0340490..0355388 100644
@@ -147,149 +142,6 @@ index 0340490..0355388 100644
      fi
    ])
    AC_SUBST([LIBXML])
-diff --git a/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c b/li=
btextstyle/gnulib-local/lib/term-styled-ostream.oo.c
-index 2ff978f..5ffb17a 100644
---- a/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
-+++ b/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
-@@ -22,15 +22,15 @@
-=20
- #include <stdlib.h>
-=20
--#include <cr-om-parser.h>
--#include <cr-sel-eng.h>
--#include <cr-style.h>
--#include <cr-rgb.h>
-+#include <libcroco/cr-om-parser.h>
-+#include <libcroco/cr-sel-eng.h>
-+#include <libcroco/cr-style.h>
-+#include <libcroco/cr-rgb.h>
- /* <cr-fonts.h> has a broken double-inclusion guard in libcroco-0.6.1. =
 */
- #ifndef __CR_FONTS_H__
--# include <cr-fonts.h>
-+# include <libcroco/cr-fonts.h>
- #endif
--#include <cr-string.h>
-+#include <libcroco/cr-string.h>
-=20
- #include "term-ostream.h"
- #include "mem-hash-map.h"
-diff --git a/libtextstyle/gnulib-local/m4/libcroco.m4 b/libtextstyle/gnu=
lib-local/m4/libcroco.m4
-index 39e72b1..042915a 100644
---- a/libtextstyle/gnulib-local/m4/libcroco.m4
-+++ b/libtextstyle/gnulib-local/m4/libcroco.m4
-@@ -6,97 +6,29 @@ dnl with or without modifications, as long as this not=
ice is preserved.
-=20
- dnl From Bruno Haible.
-=20
--dnl gl_LIBCROCO
--dnl   gives the user the option to decide whether to use the included o=
r
--dnl   an external libcroco.
--dnl gl_LIBCROCO(FORCE-INCLUDED)
--dnl   forces the use of the included or an external libcroco.
- AC_DEFUN([gl_LIBCROCO],
- [
--  ifelse([$1], [yes], , [
--    dnl libcroco depends on libglib.
--    AC_REQUIRE([gl_LIBGLIB])
--  ])
-+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
-+  dnl libcroco depends on libglib.
-+  AC_REQUIRE([gl_LIBGLIB])
-=20
--  ifelse([$1], , [
--    AC_MSG_CHECKING([whether included libcroco is requested])
--    AC_ARG_WITH([included-libcroco],
--      [  --with-included-libcroco  use the libcroco included here],
--      [gl_cv_libcroco_force_included=3D$withval],
--      [gl_cv_libcroco_force_included=3Dno])
--    AC_MSG_RESULT([$gl_cv_libcroco_force_included])
--  ], [gl_cv_libcroco_force_included=3D$1])
-+  AC_MSG_CHECKING([whether included libcroco is requested])
-+  AC_ARG_WITH([included-libcroco],
-+    [  --with-included-libcroco  use the libcroco included here],
-+    [gl_cv_libcroco_force_included=3D$withval],
-+    [gl_cv_libcroco_force_included=3Dno])
-+  AC_MSG_RESULT([$gl_cv_libcroco_force_included])
-=20
-   gl_cv_libcroco_use_included=3D"$gl_cv_libcroco_force_included"
-   LIBCROCO=3D
-   LTLIBCROCO=3D
-   INCCROCO=3D
--  ifelse([$1], [yes], , [
--    if test "$gl_cv_libcroco_use_included" !=3D yes; then
--      dnl Figure out whether we can use a preinstalled libcroco-0.6, or=
 have to
--      dnl use the included one.
--      AC_CACHE_VAL([gl_cv_libcroco], [
--        gl_cv_libcroco=3Dno
--        gl_cv_LIBCROCO=3D
--        gl_cv_LTLIBCROCO=3D
--        gl_cv_INCCROCO=3D
--        gl_save_LIBS=3D"$LIBS"
--        dnl Search for libcroco and define LIBCROCO_0_6, LTLIBCROCO_0_6=
 and
--        dnl INCCROCO_0_6 accordingly.
--        dnl Don't use croco-0.6-config nor pkg-config, since it doesn't=
 work when
--        dnl cross-compiling or when the C compiler in use is different =
from the
--        dnl one that built the library.
--        AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])
--        LIBS=3D"$gl_save_LIBS $LIBCROCO_0_6"
--        AC_LINK_IFELSE(
--          [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
--            [[const char *version =3D LIBCROCO_VERSION; return !version=
;]])],
--          [gl_cv_libcroco=3Dyes
--           gl_cv_LIBCROCO=3D"$LIBCROCO_0_6"
--           gl_cv_LTLIBCROCO=3D"$LTLIBCROCO_0_6"
--          ])
--        if test "$gl_cv_libcroco" !=3D yes; then
--          gl_save_CPPFLAGS=3D"$CPPFLAGS"
--          CPPFLAGS=3D"$CPPFLAGS $INCCROCO_0_6"
--          AC_LINK_IFELSE(
--            [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
--              [[const char *version =3D LIBCROCO_VERSION; return !versi=
on;]])],
--            [gl_cv_libcroco=3Dyes
--             gl_cv_LIBCROCO=3D"$LIBCROCO_0_6"
--             gl_cv_LTLIBCROCO=3D"$LTLIBCROCO_0_6"
--             gl_cv_INCCROCO=3D"$INCCROCO_0_6"
--            ])
--          if test "$gl_cv_libcroco" !=3D yes; then
--            dnl Often the include files are installed in
--            dnl /usr/include/libcroco-0.6/libcroco.
--            AC_LINK_IFELSE(
--              [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
--                [[const char *version =3D LIBCROCO_VERSION; return !ver=
sion;]])],
--              [gl_ABSOLUTE_HEADER([libcroco-0.6/libcroco/libcroco-confi=
g.h])
--               libcroco_include_dir=3D`echo "$gl_cv_absolute_libcroco_0=
_6_libcroco_libcroco_config_h" | sed -e 's,.libcroco-config\.h$,,'`
--               if test -d "$libcroco_include_dir"; then
--                 gl_cv_libcroco=3Dyes
--                 gl_cv_LIBCROCO=3D"$LIBCROCO_0_6"
--                 gl_cv_LTLIBCROCO=3D"$LTLIBCROCO_0_6"
--                 gl_cv_INCCROCO=3D"-I$libcroco_include_dir"
--               fi
--              ])
--          fi
--          CPPFLAGS=3D"$gl_save_CPPFLAGS"
--        fi
--        LIBS=3D"$gl_save_LIBS"
--      ])
--      AC_MSG_CHECKING([for libcroco])
--      AC_MSG_RESULT([$gl_cv_libcroco])
--      if test $gl_cv_libcroco =3D yes; then
--        LIBCROCO=3D"$gl_cv_LIBCROCO"
--        LTLIBCROCO=3D"$gl_cv_LTLIBCROCO"
--        INCCROCO=3D"$gl_cv_INCCROCO"
--      else
--        gl_cv_libcroco_use_included=3Dyes
--      fi
--    fi
--  ])
-+  if test "$gl_cv_libcroco_use_included" !=3D yes; then
-+    PKG_CHECK_MODULES([CROCO], [libcroco-0.6])
-+    LIBCROCO=3D$CROCO_LIBS
-+    LTLIBCROCO=3D$CROCO_LIBS
-+    INCCROCO=3D$CROCO_CFLAGS
-+  fi
-   AC_SUBST([LIBCROCO])
-   AC_SUBST([LTLIBCROCO])
-   AC_SUBST([INCCROCO])
 diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnul=
ib-local/m4/libglib.m4
 index 7ee5029..bb1e5e4 100644
 --- a/libtextstyle/gnulib-local/m4/libglib.m4
@@ -414,123 +266,6 @@ index 7ee5029..bb1e5e4 100644
    AC_SUBST([LIBGLIB])
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
-diff --git a/libtextstyle/gnulib-m4/libcroco.m4 b/libtextstyle/gnulib-m4=
/libcroco.m4
-index 39e72b1..042915a 100644
---- a/libtextstyle/gnulib-m4/libcroco.m4
-+++ b/libtextstyle/gnulib-m4/libcroco.m4
-@@ -6,97 +6,29 @@ dnl with or without modifications, as long as this not=
ice is preserved.
-=20
- dnl From Bruno Haible.
-=20
--dnl gl_LIBCROCO
--dnl   gives the user the option to decide whether to use the included o=
r
--dnl   an external libcroco.
--dnl gl_LIBCROCO(FORCE-INCLUDED)
--dnl   forces the use of the included or an external libcroco.
- AC_DEFUN([gl_LIBCROCO],
- [
--  ifelse([$1], [yes], , [
--    dnl libcroco depends on libglib.
--    AC_REQUIRE([gl_LIBGLIB])
--  ])
-+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
-+  dnl libcroco depends on libglib.
-+  AC_REQUIRE([gl_LIBGLIB])
-=20
--  ifelse([$1], , [
--    AC_MSG_CHECKING([whether included libcroco is requested])
--    AC_ARG_WITH([included-libcroco],
--      [  --with-included-libcroco  use the libcroco included here],
--      [gl_cv_libcroco_force_included=3D$withval],
--      [gl_cv_libcroco_force_included=3Dno])
--    AC_MSG_RESULT([$gl_cv_libcroco_force_included])
--  ], [gl_cv_libcroco_force_included=3D$1])
-+  AC_MSG_CHECKING([whether included libcroco is requested])
-+  AC_ARG_WITH([included-libcroco],
-+    [  --with-included-libcroco  use the libcroco included here],
-+    [gl_cv_libcroco_force_included=3D$withval],
-+    [gl_cv_libcroco_force_included=3Dno])
-+  AC_MSG_RESULT([$gl_cv_libcroco_force_included])
-=20
-   gl_cv_libcroco_use_included=3D"$gl_cv_libcroco_force_included"
-   LIBCROCO=3D
-   LTLIBCROCO=3D
-   INCCROCO=3D
--  ifelse([$1], [yes], , [
--    if test "$gl_cv_libcroco_use_included" !=3D yes; then
--      dnl Figure out whether we can use a preinstalled libcroco-0.6, or=
 have to
--      dnl use the included one.
--      AC_CACHE_VAL([gl_cv_libcroco], [
--        gl_cv_libcroco=3Dno
--        gl_cv_LIBCROCO=3D
--        gl_cv_LTLIBCROCO=3D
--        gl_cv_INCCROCO=3D
--        gl_save_LIBS=3D"$LIBS"
--        dnl Search for libcroco and define LIBCROCO_0_6, LTLIBCROCO_0_6=
 and
--        dnl INCCROCO_0_6 accordingly.
--        dnl Don't use croco-0.6-config nor pkg-config, since it doesn't=
 work when
--        dnl cross-compiling or when the C compiler in use is different =
from the
--        dnl one that built the library.
--        AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])
--        LIBS=3D"$gl_save_LIBS $LIBCROCO_0_6"
--        AC_LINK_IFELSE(
--          [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
--            [[const char *version =3D LIBCROCO_VERSION; return !version=
;]])],
--          [gl_cv_libcroco=3Dyes
--           gl_cv_LIBCROCO=3D"$LIBCROCO_0_6"
--           gl_cv_LTLIBCROCO=3D"$LTLIBCROCO_0_6"
--          ])
--        if test "$gl_cv_libcroco" !=3D yes; then
--          gl_save_CPPFLAGS=3D"$CPPFLAGS"
--          CPPFLAGS=3D"$CPPFLAGS $INCCROCO_0_6"
--          AC_LINK_IFELSE(
--            [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
--              [[const char *version =3D LIBCROCO_VERSION; return !versi=
on;]])],
--            [gl_cv_libcroco=3Dyes
--             gl_cv_LIBCROCO=3D"$LIBCROCO_0_6"
--             gl_cv_LTLIBCROCO=3D"$LTLIBCROCO_0_6"
--             gl_cv_INCCROCO=3D"$INCCROCO_0_6"
--            ])
--          if test "$gl_cv_libcroco" !=3D yes; then
--            dnl Often the include files are installed in
--            dnl /usr/include/libcroco-0.6/libcroco.
--            AC_LINK_IFELSE(
--              [AC_LANG_PROGRAM([[#include <libcroco-config.h>]],
--                [[const char *version =3D LIBCROCO_VERSION; return !ver=
sion;]])],
--              [gl_ABSOLUTE_HEADER([libcroco-0.6/libcroco/libcroco-confi=
g.h])
--               libcroco_include_dir=3D`echo "$gl_cv_absolute_libcroco_0=
_6_libcroco_libcroco_config_h" | sed -e 's,.libcroco-config\.h$,,'`
--               if test -d "$libcroco_include_dir"; then
--                 gl_cv_libcroco=3Dyes
--                 gl_cv_LIBCROCO=3D"$LIBCROCO_0_6"
--                 gl_cv_LTLIBCROCO=3D"$LTLIBCROCO_0_6"
--                 gl_cv_INCCROCO=3D"-I$libcroco_include_dir"
--               fi
--              ])
--          fi
--          CPPFLAGS=3D"$gl_save_CPPFLAGS"
--        fi
--        LIBS=3D"$gl_save_LIBS"
--      ])
--      AC_MSG_CHECKING([for libcroco])
--      AC_MSG_RESULT([$gl_cv_libcroco])
--      if test $gl_cv_libcroco =3D yes; then
--        LIBCROCO=3D"$gl_cv_LIBCROCO"
--        LTLIBCROCO=3D"$gl_cv_LTLIBCROCO"
--        INCCROCO=3D"$gl_cv_INCCROCO"
--      else
--        gl_cv_libcroco_use_included=3Dyes
--      fi
--    fi
--  ])
-+  if test "$gl_cv_libcroco_use_included" !=3D yes; then
-+    PKG_CHECK_MODULES([CROCO], [libcroco-0.6])
-+    LIBCROCO=3D$CROCO_LIBS
-+    LTLIBCROCO=3D$CROCO_LIBS
-+    INCCROCO=3D$CROCO_CFLAGS
-+  fi
-   AC_SUBST([LIBCROCO])
-   AC_SUBST([LTLIBCROCO])
-   AC_SUBST([INCCROCO])
 diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/=
libglib.m4
 index 7ee5029..bb1e5e4 100644
 --- a/libtextstyle/gnulib-m4/libglib.m4
@@ -655,55 +390,3 @@ index 7ee5029..bb1e5e4 100644
    AC_SUBST([LIBGLIB])
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
-diff --git a/libtextstyle/lib/term-styled-ostream.c b/libtextstyle/lib/t=
erm-styled-ostream.c
-index 5484800..16793fa 100644
---- a/libtextstyle/lib/term-styled-ostream.c
-+++ b/libtextstyle/lib/term-styled-ostream.c
-@@ -28,15 +28,15 @@
-=20
- #include <stdlib.h>
-=20
--#include <cr-om-parser.h>
--#include <cr-sel-eng.h>
--#include <cr-style.h>
--#include <cr-rgb.h>
-+#include <libcroco/cr-om-parser.h>
-+#include <libcroco/cr-sel-eng.h>
-+#include <libcroco/cr-style.h>
-+#include <libcroco/cr-rgb.h>
- /* <cr-fonts.h> has a broken double-inclusion guard in libcroco-0.6.1. =
 */
- #ifndef __CR_FONTS_H__
--# include <cr-fonts.h>
-+# include <libcroco/cr-fonts.h>
- #endif
--#include <cr-string.h>
-+#include <libcroco/cr-string.h>
-=20
- #include "term-ostream.h"
- #include "mem-hash-map.h"
-diff --git a/libtextstyle/lib/term-styled-ostream.oo.c b/libtextstyle/li=
b/term-styled-ostream.oo.c
-index 2ff978f..5ffb17a 100644
---- a/libtextstyle/lib/term-styled-ostream.oo.c
-+++ b/libtextstyle/lib/term-styled-ostream.oo.c
-@@ -22,15 +22,15 @@
-=20
- #include <stdlib.h>
-=20
--#include <cr-om-parser.h>
--#include <cr-sel-eng.h>
--#include <cr-style.h>
--#include <cr-rgb.h>
-+#include <libcroco/cr-om-parser.h>
-+#include <libcroco/cr-sel-eng.h>
-+#include <libcroco/cr-style.h>
-+#include <libcroco/cr-rgb.h>
- /* <cr-fonts.h> has a broken double-inclusion guard in libcroco-0.6.1. =
 */
- #ifndef __CR_FONTS_H__
--# include <cr-fonts.h>
-+# include <libcroco/cr-fonts.h>
- #endif
--#include <cr-string.h>
-+#include <libcroco/cr-string.h>
-=20
- #include "term-ostream.h"
- #include "mem-hash-map.h"
diff --git a/meta/recipes-core/gettext/gettext_0.22.bb b/meta/recipes-cor=
e/gettext/gettext_0.22.bb
index f5290ac0e4..75474c8c30 100644
--- a/meta/recipes-core/gettext/gettext_0.22.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.bb
@@ -10,8 +10,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e=
964aa6c70fd77641a71e"
 # without libxml in PACKAGECONFIG vendor copy of the lib will be used
 LICENSE:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'libxml', '',=
 '& MIT', d)}"
 LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'lib=
xml', '', 'file://libtextstyle/lib/libxml/COPYING;md5=3D2044417e2e5006b65=
a8b9067b683fcf1', d)}"
-# without croco in PACKAGECONFIG vendor copy of the lib will be used
-LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'cro=
co', '', 'file://libtextstyle/lib/libcroco/libcroco.h;md5=3D424013a9ed540=
1aa58cf83f3188c6865;beginline=3D10;endline=3D28', d)}"
 # without glib in PACKAGECONFIG vendor copy of the lib will be used
 LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'gli=
b', '', 'file://libtextstyle/lib/glib/ghash.c;md5=3De3159f5ac38dfe77af5cc=
0ee104dab2d;beginline=3D10;endline=3D27', d)}"
=20
@@ -44,6 +42,7 @@ EXTRA_OECONF +=3D "--without-lispdir \
                  --without-emacs \
                  --without-cvs \
                  --without-git \
+                 --without-included-libcroco \
                  --cache-file=3D${B}/config.cache \
                 "
 EXTRA_OECONF:append:class-target =3D " \
@@ -54,11 +53,10 @@ EXTRA_OECONF:append:class-target =3D " \
                  gt_cv_locale_de=3Dde_DE.ISO-8859-1 \
 "
=20
-PACKAGECONFIG ??=3D "croco glib libxml"
+PACKAGECONFIG ??=3D "glib libxml"
 PACKAGECONFIG:class-native =3D ""
 PACKAGECONFIG:class-nativesdk =3D ""
=20
-PACKAGECONFIG[croco] =3D "--without-included-libcroco,--with-included-li=
bcroco,libcroco"
 PACKAGECONFIG[glib] =3D "--without-included-glib,--with-included-glib,gl=
ib-2.0"
 PACKAGECONFIG[libxml] =3D "--without-included-libxml,--with-included-lib=
xml,libxml2"
 # Need paths here to avoid host contamination but this can cause RPATH w=
arnings
diff --git a/meta/recipes-support/libcroco/files/CVE-2020-12825.patch b/m=
eta/recipes-support/libcroco/files/CVE-2020-12825.patch
deleted file mode 100644
index 42f92e3607..0000000000
--- a/meta/recipes-support/libcroco/files/CVE-2020-12825.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From fdf78a4877afa987ba646a8779b513f258e6d04c Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@gnome.org>
-Date: Fri, 31 Jul 2020 15:21:53 -0500
-Subject: [PATCH] libcroco: Limit recursion in block and any productions
-
- (CVE-2020-12825)
-
-If we don't have any limits, we can recurse forever and overflow the
-stack.
-
-Fixes #8
-This is per https://gitlab.gnome.org/Archive/libcroco/-/issues/8
-
-https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/1404
-
-CVE: CVE-2020-12825
-Upstream-Status: Backport [https://gitlab.gnome.org/Archive/libcroco/-/c=
ommit/6eb257e5c731c691eb137fca94e916ca73941a5a]
-Comment: No refreshing changes done.
-Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
-
----
- src/cr-parser.c | 44 +++++++++++++++++++++++++++++---------------
- 1 file changed, 29 insertions(+), 15 deletions(-)
-
-diff --git a/src/cr-parser.c b/src/cr-parser.c
-index 18c9a01..f4a62e3 100644
---- a/src/cr-parser.c
-+++ b/src/cr-parser.c
-@@ -136,6 +136,8 @@ struct _CRParserPriv {
-=20
- #define CHARS_TAB_SIZE 12
-=20
-+#define RECURSIVE_CALLERS_LIMIT 100
-+
- /**
-  * IS_NUM:
-  *@a_char: the char to test.
-@@ -344,9 +346,11 @@ static enum CRStatus cr_parser_parse_selector_core =
(CRParser * a_this);
-=20
- static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_thi=
s);
-=20
--static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);
-+static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,
-+                                               guint      n_calls);
-=20
--static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);
-+static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,
-+                                                 guint      n_calls);
-=20
- static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);
-=20
-@@ -784,7 +788,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
-         cr_parser_try_to_skip_spaces_and_comments (a_this);
-=20
-         do {
--                status =3D cr_parser_parse_any_core (a_this);
-+                status =3D cr_parser_parse_any_core (a_this, 0);
-         } while (status =3D=3D CR_OK);
-=20
-         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
-@@ -795,7 +799,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
-                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,=20
-                                       token);
-                 token =3D NULL;
--                status =3D cr_parser_parse_block_core (a_this);
-+                status =3D cr_parser_parse_block_core (a_this, 0);
-                 CHECK_PARSING_STATUS (status,
-                                       FALSE);
-                 goto done;
-@@ -930,11 +934,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
-=20
-         RECORD_INITIAL_POS (a_this, &init_pos);
-=20
--        status =3D cr_parser_parse_any_core (a_this);
-+        status =3D cr_parser_parse_any_core (a_this, 0);
-         CHECK_PARSING_STATUS (status, FALSE);
-=20
-         do {
--                status =3D cr_parser_parse_any_core (a_this);
-+                status =3D cr_parser_parse_any_core (a_this, 0);
-=20
-         } while (status =3D=3D CR_OK);
-=20
-@@ -956,10 +960,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
-  *in chapter 4.1 of the css2 spec.
-  *block ::=3D '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
-  *@param a_this the current instance of #CRParser.
-+ *@param n_calls used to limit recursion depth
-  *FIXME: code this function.
-  */
- static enum CRStatus
--cr_parser_parse_block_core (CRParser * a_this)
-+cr_parser_parse_block_core (CRParser * a_this,
-+                            guint      n_calls)
- {
-         CRToken *token =3D NULL;
-         CRInputPos init_pos;
-@@ -967,6 +973,9 @@ cr_parser_parse_block_core (CRParser * a_this)
-=20
-         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_=
ERROR);
-=20
-+        if (n_calls > RECURSIVE_CALLERS_LIMIT)
-+                return CR_ERROR;
-+
-         RECORD_INITIAL_POS (a_this, &init_pos);
-=20
-         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &t=
oken);
-@@ -996,13 +1005,13 @@ cr_parser_parse_block_core (CRParser * a_this)
-         } else if (token->type =3D=3D CBO_TK) {
-                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
-                 token =3D NULL;
--                status =3D cr_parser_parse_block_core (a_this);
-+                status =3D cr_parser_parse_block_core (a_this, n_calls =
+ 1);
-                 CHECK_PARSING_STATUS (status, FALSE);
-                 goto parse_block_content;
-         } else {
-                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
-                 token =3D NULL;
--                status =3D cr_parser_parse_any_core (a_this);
-+                status =3D cr_parser_parse_any_core (a_this, n_calls + =
1);
-                 CHECK_PARSING_STATUS (status, FALSE);
-                 goto parse_block_content;
-         }
-@@ -1109,7 +1118,7 @@ cr_parser_parse_value_core (CRParser * a_this)
-                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknz=
r,
-                                                token);
-                 token =3D NULL;
--                status =3D cr_parser_parse_block_core (a_this);
-+                status =3D cr_parser_parse_block_core (a_this, 0);
-                 CHECK_PARSING_STATUS (status, FALSE);
-                 ref++;
-                 goto continue_parsing;
-@@ -1123,7 +1132,7 @@ cr_parser_parse_value_core (CRParser * a_this)
-                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknz=
r,
-                                                token);
-                 token =3D NULL;
--                status =3D cr_parser_parse_any_core (a_this);
-+                status =3D cr_parser_parse_any_core (a_this, 0);
-                 if (status =3D=3D CR_OK) {
-                         ref++;
-                         goto continue_parsing;
-@@ -1162,10 +1171,12 @@ cr_parser_parse_value_core (CRParser * a_this)
-  *        | FUNCTION | DASHMATCH | '(' any* ')' | '[' any* ']' ] S*;
-  *
-  *@param a_this the current instance of #CRParser.
-+ *@param n_calls used to limit recursion depth
-  *@return CR_OK upon successfull completion, an error code otherwise.
-  */
- static enum CRStatus
--cr_parser_parse_any_core (CRParser * a_this)
-+cr_parser_parse_any_core (CRParser * a_this,
-+                          guint      n_calls)
- {
-         CRToken *token1 =3D NULL,
-                 *token2 =3D NULL;
-@@ -1174,6 +1185,9 @@ cr_parser_parse_any_core (CRParser * a_this)
-=20
-         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
-=20
-+        if (n_calls > RECURSIVE_CALLERS_LIMIT)
-+                return CR_ERROR;
-+
-         RECORD_INITIAL_POS (a_this, &init_pos);
-=20
-         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &t=
oken1);
-@@ -1212,7 +1226,7 @@ cr_parser_parse_any_core (CRParser * a_this)
-                  *We consider parameter as being an "any*" production.
-                  */
-                 do {
--                        status =3D cr_parser_parse_any_core (a_this);
-+                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
-                 } while (status =3D=3D CR_OK);
-=20
-                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
-@@ -1237,7 +1251,7 @@ cr_parser_parse_any_core (CRParser * a_this)
-                 }
-=20
-                 do {
--                        status =3D cr_parser_parse_any_core (a_this);
-+                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
-                 } while (status =3D=3D CR_OK);
-=20
-                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
-@@ -1265,7 +1279,7 @@ cr_parser_parse_any_core (CRParser * a_this)
-                 }
-=20
-                 do {
--                        status =3D cr_parser_parse_any_core (a_this);
-+                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
-                 } while (status =3D=3D CR_OK);
-=20
-                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/reci=
pes-support/libcroco/libcroco_0.6.13.bb
deleted file mode 100644
index 419c962657..0000000000
--- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY =3D "Cascading Style Sheet (CSS) parsing and manipulation toolki=
t"
-DESCRIPTION =3D "The Libcroco project is an effort to build a generic \
-Cascading Style Sheet (CSS) parsing and manipulation toolkit that can be=
 \
-used by GNOME applications in need of CSS support."
-HOMEPAGE =3D "http://www.gnome.org/"
-BUGTRACKER =3D "https://bugzilla.gnome.org/"
-
-LICENSE =3D "LGPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605 \
-                    file://src/cr-rgb.c;endline=3D22;md5=3D31d5f0944d556=
c8589d04ea6055fcc66 \
-                    file://tests/cr-test-utils.c;endline=3D21;md5=3D2382=
c27934cae1d3792fcb17a6142c4e"
-
-SECTION =3D "x11/utils"
-DEPENDS =3D "glib-2.0 libxml2 zlib"
-BBCLASSEXTEND =3D "native nativesdk"
-EXTRA_OECONF +=3D "--enable-Bsymbolic=3Dauto"
-
-BINCONFIG =3D "${bindir}/croco-0.6-config"
-
-inherit gnomebase gtk-doc binconfig-disabled
-
-SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
-SRC_URI[archive.sha256sum] =3D "767ec234ae7aa684695b3a735548224888132e06=
3f92db585759b422570621d4"
-
-SRC_URI +=3D"file://CVE-2020-12825.patch \
-"
--=20
2.42.0


