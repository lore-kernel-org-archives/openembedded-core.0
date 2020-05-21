Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2597.1590024549780707983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 18:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,416,1583164800"; 
   d="scan'208";a="92669238"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 May 2020 09:28:29 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 6E77046B5FAE
	for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 09:28:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 21 May 2020 09:28:24 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] gettext: upgrade 0.20.1 -> 0.20.2
Date: Thu, 21 May 2020 18:28:21 +0800
Message-ID: <1590056901-40755-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 6E77046B5FAE.A515B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

rename gettext-0.20.1 to gettext-0.20.2

0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
cr-statement.c-timsort.h-fix-formatting-issues.patch
removed since they are included in 0.20.2

refresh use-pkgconfig.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...aviour-of-for-msgfmt-on-PO-files-wit.patch | 87 -------------------
 ...nt.c-timsort.h-fix-formatting-issues.patch | 71 ---------------
 ...t-env.in-do-not-add-C-CXX-parameters.patch |  0
 ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  0
 .../add-with-bisonlocaledir.patch             |  0
 .../parallel.patch                            |  0
 .../run-ptest                                 |  0
 .../serial-tests-config.patch                 |  0
 .../use-pkgconfig.patch                       | 36 +++++---
 .../{gettext_0.20.1.bb => gettext_0.20.2.bb}  |  6 +-
 10 files changed, 24 insertions(+), 176 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/0001-init-env.in-do-not-add-C-CXX-parameters.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/add-with-bisonlocaledir.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/run-ptest (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/serial-tests-config.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.20.1 => gettext-0.20.2}/use-pkgconfig.patch (98%)
 rename meta/recipes-core/gettext/{gettext_0.20.1.bb => gettext_0.20.2.bb} (96%)

diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch b/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
deleted file mode 100644
index 2245889386..0000000000
--- a/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 75e315fdec82d1a17ebcd9e0712d109323578d68 Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Sun, 19 May 2019 11:10:06 +0200
-Subject: [PATCH] msgmerge: Fix behaviour of --for-msgfmt on PO files with no
- translations.
-
-msgmerge: Fix behaviour of --for-msgfmt on PO files with no translations.
-
-Reported by Don Lawrence <dlawrence@iecok.com>
-in <https://lists.freedesktop.org/archives/p11-glue/2019-May/000700.html>
-via Daiki Ueno
-in <https://lists.gnu.org/archive/html/bug-gettext/2019-05/msg00124.html>.
-
-* gettext-tools/src/msgmerge.c (main): Treat force_po like true if for_msgfmt
-is true.
-* gettext-tools/tests/msgmerge-26: Add test of PO file with no translations.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=2336451ed68d91ff4b5ae1acbc1eca30e47a86a9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gettext-tools/src/msgmerge.c    |  4 ++--
- gettext-tools/tests/msgmerge-26 | 36 ++++++++++++++++++++++++++++++---
- 2 files changed, 35 insertions(+), 5 deletions(-)
-
-diff --git a/gettext-tools/src/msgmerge.c b/gettext-tools/src/msgmerge.c
-index cd762c0..92c9b7a 100644
---- a/gettext-tools/src/msgmerge.c
-+++ b/gettext-tools/src/msgmerge.c
-@@ -520,8 +520,8 @@ There is NO WARRANTY, to the extent permitted by law.\n\
-   else
-     {
-       /* Write the merged message list out.  */
--      msgdomain_list_print (result, output_file, output_syntax, force_po,
--                            false);
-+      msgdomain_list_print (result, output_file, output_syntax,
-+                            for_msgfmt || force_po, false);
-     }
- 
-   exit (EXIT_SUCCESS);
-diff --git a/gettext-tools/tests/msgmerge-26 b/gettext-tools/tests/msgmerge-26
-index cd3862e..b86f7a0 100755
---- a/gettext-tools/tests/msgmerge-26
-+++ b/gettext-tools/tests/msgmerge-26
-@@ -73,7 +73,37 @@ msgstr "Papaya"
- EOF
- 
- : ${DIFF=diff}
--${DIFF} mm-test26.ok mm-test26.out
--result=$?
-+${DIFF} mm-test26.ok mm-test26.out || Exit 1
- 
--exit $result
-+# Test with a PO file that has no translated messages.
-+
-+cat <<\EOF > mm-test26a.in1
-+msgid ""
-+msgstr ""
-+"Content-Type: text/plain; charset=UTF-8\n"
-+
-+msgid "Hello world"
-+msgstr "Hallo Welt"
-+EOF
-+
-+cat <<\EOF > mm-test26a.in2
-+msgid ""
-+msgstr ""
-+"Content-Type: text/plain; charset=ASCII\n"
-+
-+msgid "Hello, world!"
-+msgstr ""
-+EOF
-+
-+: ${MSGMERGE=msgmerge}
-+${MSGMERGE} --for-msgfmt -o mm-test26a.tmp mm-test26a.in1 mm-test26a.in2 \
-+    || Exit 1
-+LC_ALL=C tr -d '\r' < mm-test26a.tmp > mm-test26a.out || Exit 1
-+
-+cat <<\EOF > mm-test26a.ok
-+msgid ""
-+msgstr "Content-Type: text/plain; charset=UTF-8\n"
-+EOF
-+
-+: ${DIFF=diff}
-+${DIFF} mm-test26a.ok mm-test26a.out || Exit 1
--- 
-2.24.1
-
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch b/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
deleted file mode 100644
index 0561ed7d32..0000000000
--- a/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From f6245ef5530fc37a6243e798df34162fbbeab6f0 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 19 Feb 2017 23:32:46 -0800
-Subject: [PATCH] cr-statement.c/timsort.h: fix formatting issues
-
-Fixed when compile with "-Wformat -Wformat-security -Werror=format-security":
-| gettext-tools/gnulib-lib/libcroco/cr-statement.c: In function 'cr_statement_dump_charset':
-| gettext-tools/gnulib-lib/libcroco/cr-statement.c:2661:17: error: format not a string literal and no format arguments [-Werror=format-security]
-|                  fprintf (a_fp, str) ;
-
-And:
-gettext-tools/gnulib-lib/libxml/timsort.h:326:80: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
-       fprintf(stderr, "Error allocating temporary storage for tim sort: need %lu bytes", sizeof(SORT_TYPE) * new_size);
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- libtextstyle/lib/libcroco/cr-statement.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/libtextstyle/lib/libcroco/cr-statement.c b/libtextstyle/lib/libcroco/cr-statement.c
-index 617520f..100104b 100644
---- a/libtextstyle/lib/libcroco/cr-statement.c
-+++ b/libtextstyle/lib/libcroco/cr-statement.c
-@@ -2607,7 +2607,7 @@ cr_statement_dump_ruleset (CRStatement * a_this, FILE * a_fp, glong a_indent)
-         g_return_if_fail (a_fp && a_this);
-         str = cr_statement_ruleset_to_string (a_this, a_indent);
-         if (str) {
--                fprintf (a_fp, str);
-+                fprintf (a_fp, "%s", str);
-                 g_free (str);
-                 str = NULL;
-         }
-@@ -2658,7 +2658,7 @@ cr_statement_dump_charset (CRStatement * a_this, FILE * a_fp, gulong a_indent)
-         str = cr_statement_charset_to_string (a_this,
-                                               a_indent) ;
-         if (str) {
--                fprintf (a_fp, str) ;
-+                fprintf (a_fp, "%s", str) ;
-                 g_free (str) ;
-                 str = NULL ;
-         }
-@@ -2685,7 +2685,7 @@ cr_statement_dump_page (CRStatement * a_this, FILE * a_fp, gulong a_indent)
- 
-         str = cr_statement_at_page_rule_to_string (a_this, a_indent) ;
-         if (str) {
--                fprintf (a_fp, str);
-+                fprintf (a_fp, "%s", str);
-                 g_free (str) ;
-                 str = NULL ; 
-         }
-@@ -2711,7 +2711,7 @@ cr_statement_dump_media_rule (CRStatement * a_this,
- 
-         str = cr_statement_media_rule_to_string (a_this, a_indent) ;
-         if (str) {
--                fprintf (a_fp, str) ;
-+                fprintf (a_fp, "%s", str) ;
-                 g_free (str) ;
-                 str = NULL ;
-         }
-@@ -2737,7 +2737,7 @@ cr_statement_dump_import_rule (CRStatement * a_this, FILE * a_fp,
- 
-         str = cr_statement_import_rule_to_string (a_this, a_indent) ;
-         if (str) {
--                fprintf (a_fp, str) ;
-+                fprintf (a_fp, "%s", str) ;
-                 g_free (str) ;
-                 str = NULL ;
-         }
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext-0.20.2/0001-init-env.in-do-not-add-C-CXX-parameters.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/0001-init-env.in-do-not-add-C-CXX-parameters.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext-0.20.2/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaledir.patch b/meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaledir.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch b/meta/recipes-core/gettext/gettext-0.20.2/parallel.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/parallel.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/run-ptest b/meta/recipes-core/gettext/gettext-0.20.2/run-ptest
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/run-ptest
rename to meta/recipes-core/gettext/gettext-0.20.2/run-ptest
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch b/meta/recipes-core/gettext/gettext-0.20.2/serial-tests-config.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/serial-tests-config.patch
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
similarity index 98%
rename from meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
rename to meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
index d3f3fe8e2f..64e680cb89 100644
--- a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
@@ -3,26 +3,30 @@ From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 23 Jan 2018 00:54:13 +0000
 Subject: [PATCH] gettext: beat library detection into shape
 
-For reasons which I just can't fathom gnulib doesn't use the expected tools to
-find libraries but badly reinvents the wheel.  This will trivially lead to host
+For reasons which I just can't fathom gnulib doesn't use the expected
+tools to
+find libraries but badly reinvents the wheel.  This will trivially lead
+to host
 contamination (explicit searches of /usr/lib) or incorrect RPATHs (bad
 canonicalisation resulting in relative paths).
 
-Simply delete all the crazy, and replace with a single call to pkg-config.
+Simply delete all the crazy, and replace with a single call to
+pkg-config.
 
-Upstream-Status: Inappropriate [upstream still refuse to consider pkg-config]
+Upstream-Status: Inappropriate [upstream still refuse to consider
+pkg-config]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
  gettext-tools/gnulib-m4/libxml.m4             |  99 +----------------
  .../gnulib-local/lib/term-styled-ostream.oo.c |  12 +-
- libtextstyle/gnulib-local/m4/libcroco.m4      |  99 +++--------------
+ libtextstyle/gnulib-local/m4/libcroco.m4      | 101 +++--------------
  libtextstyle/gnulib-local/m4/libglib.m4       | 104 +++---------------
  libtextstyle/gnulib-m4/libcroco.m4            |  99 +++--------------
  libtextstyle/gnulib-m4/libglib.m4             | 104 +++---------------
  libtextstyle/lib/term-styled-ostream.c        |  12 +-
  libtextstyle/lib/term-styled-ostream.oo.c     |  12 +-
- 8 files changed, 87 insertions(+), 454 deletions(-)
+ 8 files changed, 87 insertions(+), 456 deletions(-)
 
 diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.m4
 index 05b9550..031ee65 100644
@@ -168,10 +172,10 @@ index 2cfd4a8..d42c8b4 100644
  #include "term-ostream.h"
  #include "hash.h"
 diff --git a/libtextstyle/gnulib-local/m4/libcroco.m4 b/libtextstyle/gnulib-local/m4/libcroco.m4
-index bc53cc6..10b2455 100644
+index bc53cc6..b3580ff 100644
 --- a/libtextstyle/gnulib-local/m4/libcroco.m4
 +++ b/libtextstyle/gnulib-local/m4/libcroco.m4
-@@ -1,99 +1,34 @@
+@@ -1,100 +1,33 @@
 -# libcroco.m4 serial 3
 -dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
 +# libcroco.m4 serial 2 (gettext-0.17)
@@ -215,7 +219,7 @@ index bc53cc6..10b2455 100644
    gl_cv_libcroco_use_included="$gl_cv_libcroco_force_included"
    LIBCROCO=
    LTLIBCROCO=
-   INCCROCO=
+-  INCCROCO=
 -  ifelse([$1], [yes], , [
 -    if test "$gl_cv_libcroco_use_included" != yes; then
 -      dnl Figure out whether we can use a preinstalled libcroco-0.6, or have to
@@ -279,21 +283,22 @@ index bc53cc6..10b2455 100644
 -      fi
 -    fi
 -  ])
+-  AC_SUBST([LIBCROCO])
 +  if test "$gl_cv_libcroco_use_included" != yes; then
 +    PKG_CHECK_MODULES([CROCO], [libcroco-0.6])
 +    LIBCROCO=$CROCO_LIBS
 +    LTLIBCROCO=$CROCO_LIBS
 +    INCCROCO=$CROCO_CFLAGS
 +  fi
-   AC_SUBST([LIBCROCO])
    AC_SUBST([LTLIBCROCO])
    AC_SUBST([INCCROCO])
+   AC_MSG_CHECKING([whether to use the included libcroco])
 diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnulib-local/m4/libglib.m4
-index bef6fa3..8841755 100644
+index 5853772..b360bdf 100644
 --- a/libtextstyle/gnulib-local/m4/libglib.m4
 +++ b/libtextstyle/gnulib-local/m4/libglib.m4
 @@ -1,105 +1,31 @@
--# libglib.m4 serial 4
+-# libglib.m4 serial 5
 -dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
 +# libglib.m4 serial 3 (gettext-0.17)
 +dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc.
@@ -535,11 +540,11 @@ index bc53cc6..10b2455 100644
    AC_SUBST([LTLIBCROCO])
    AC_SUBST([INCCROCO])
 diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/libglib.m4
-index bef6fa3..8841755 100644
+index 5853772..b360bdf 100644
 --- a/libtextstyle/gnulib-m4/libglib.m4
 +++ b/libtextstyle/gnulib-m4/libglib.m4
 @@ -1,105 +1,31 @@
--# libglib.m4 serial 4
+-# libglib.m4 serial 5
 -dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
 +# libglib.m4 serial 3 (gettext-0.17)
 +dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc.
@@ -711,3 +716,6 @@ index 2cfd4a8..d42c8b4 100644
  
  #include "term-ostream.h"
  #include "hash.h"
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/gettext/gettext_0.20.1.bb b/meta/recipes-core/gettext/gettext_0.20.2.bb
similarity index 96%
rename from meta/recipes-core/gettext/gettext_0.20.1.bb
rename to meta/recipes-core/gettext/gettext_0.20.2.bb
index 85493e7595..85c50d43e2 100644
--- a/meta/recipes-core/gettext/gettext_0.20.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.20.2.bb
@@ -19,16 +19,14 @@ RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://parallel.patch \
            file://add-with-bisonlocaledir.patch \
-           file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
            file://use-pkgconfig.patch \
            file://run-ptest \
            file://serial-tests-config.patch \
-           file://0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
            "
-SRC_URI[md5sum] = "bb5b0c0caa028105f3ca1905ddc306e2"
-SRC_URI[sha256sum] = "66415634c6e8c3fa8b71362879ec7575e27da43da562c798a8a2f223e6e47f5c"
+SRC_URI[md5sum] = "30fec34a895fab4c02584449c500aac2"
+SRC_URI[sha256sum] = "ecb9d0908ca41d5ca5fef974323b3bba6bec19eebba0b44f396de98cfcc089f1"
 
 inherit autotools texinfo pkgconfig ptest
 
-- 
2.17.1



