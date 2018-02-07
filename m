Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 68CFB78093
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 21:34:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w17LY3IJ007123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Feb 2018 13:34:03 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.24.27) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 7 Feb 2018 13:33:57 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Feb 2018 16:34:00 -0500
Message-ID: <3144211.9qXzQgCZpO@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <20180202173815.9500-1-alexander.kanavin@linux.intel.com>
References: <20180202173815.9500-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] gtk-doc: update to 1.27
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
X-List-Received-Date: Wed, 07 Feb 2018 21:34:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, February 2, 2018 12:38:14 PM EST Alexander Kanavin wrote:
> Gtk-doc has been rewritten in Python, so drop perl dependencies (good
> riddance!), and adjust patches to reflect that.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---

Alexander. When things move to python you can almost always bet on them 
requiring additional libraries and as such the lack of RDEPENDS here is a bit 
surprising. As you can see from the top of some of the py files in gtk-doc we 
have:

import logging
import os
import re
import subprocess
import sys
import six
import codecs

Some of which are python stdlibs but others are external modules, such as 
'six'. As such I am now getting a build failure:

     -- Installing ../../../libunique-1.1.6/doc/reference/html/up.png
     Traceback (most recent call last):
      File "/home/mark/build/overc/tmp/work/core2-64-overc-linux/libunique/
      1.1.6-r7/recipe-sysroot-native/usr/bin/gtkdoc-rebase", line 28, in 
       <module>
     from gtkdoc import common, config, rebase
     File "/home/mark/build/overc/tmp/work/core2-64-overc-linux/libunique/
     1.1.6-r7/recipe-sysroot-native/usr/share/gtk-doc/python/gtkdoc/
     common.py", line 31, in <module>
     import six
 ImportError: No module named 'six'

So we need to RDEPENDS on "python-six" here for starters. We do have a recipe 
for python-six but it is in meta-openembedded. So we either need to move this 
recipe there or the python-six recipe to oe-core or...

I have added Derek to the CC as he is being a good sport and working hard on 
python recipes and might have thoughts on the best solution here.

Mark Asselstine

>  ...r-out-if-perl-is-not-found-or-its-version.patch |  40 ------
>  ...hardocode-paths-to-perl-python-in-scripts.patch | 155
> +++++++++++---------- .../gtk-doc/files/conditionaltests.patch           | 
> 26 +++-
>  .../gtk-doc/files/pkg-config-native.patch          |  22 ++-
>  .../gtk-doc/{gtk-doc_1.25.bb => gtk-doc_1.27.bb}   |  15 +-
>  5 files changed, 119 insertions(+), 139 deletions(-)
>  delete mode 100644
> meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-perl-is-not-found
> -or-its-version.patch rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.25.bb =>
> gtk-doc_1.27.bb} (81%)
> 
> diff --git
> a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-perl-is-not-fou
> nd-or-its-version.patch
> b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-perl-is-not-fou
> nd-or-its-version.patch deleted file mode 100644
> index 4a9028742ca..00000000000
> ---
> a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-perl-is-not-fou
> nd-or-its-version.patch +++ /dev/null
> @@ -1,40 +0,0 @@
> -From e733241fb580f032efbbe684ec35d4c9d27f1595 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Thu, 8 Sep 2016 13:38:39 +0300
> -Subject: [PATCH] Do not error out if perl is not found or its version is
> too - old.
> -
> -This allows use to avoid depending on perl-native if we're not going
> -to use it (when api-docs are disabled).
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - configure.ac | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 2a61d6e..29415bd 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -36,7 +36,7 @@ dnl Check for Perl.
> - dnl
> - AC_PATH_PROG([PERL], [perl])
> - if test -z "$PERL"; then
> --	AC_MSG_ERROR([perl not found])
> -+	AC_MSG_WARN([perl not found])
> - fi
> -
> - AC_MSG_CHECKING([if Perl version >= 5.18.0])
> -@@ -44,7 +44,7 @@ if "$PERL" -e "require v5.18.0"; then
> - 	AC_MSG_RESULT([yes])
> - else
> - 	AC_MSG_RESULT([no])
> --	AC_MSG_ERROR([perl >= 5.18.0 is required for gtk-doc])
> -+	AC_MSG_WARN([perl >= 5.18.0 is required for gtk-doc])
> - fi
> -
> - dnl
> ---
> -2.9.3
> -
> diff --git
> a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-pyth
> on-in-scripts.patch
> b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-pyth
> on-in-scripts.patch index 477fc9ae8c1..2fe3ab9221f 100644
> ---
> a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-pyth
> on-in-scripts.patch +++
> b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-pyth
> on-in-scripts.patch @@ -1,7 +1,7 @@
> -From 6fab82b93c7bd301eb42448515b02f7cb3306897 Mon Sep 17 00:00:00 2001
> +From 928102874bc2339a1d57c6b178877e0c6002cb3a Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 31 Aug 2016 16:44:46 +0300
> -Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
> +Subject: [PATCH 1/3] Do not hardocode paths to perl/python in scripts.
> 
>  Doing so when the interpreters are somewhere deep in a sysroot directory
>  can reach the shebang line limit, and resulting scripts wouldn't work
> @@ -9,131 +9,134 @@ on targets either.
> 
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
> - gtkdoc-check.in     | 2 +-
> - gtkdoc-common.pl.in | 2 +-
> - gtkdoc-depscan.in   | 2 +-
> - gtkdoc-fixxref.in   | 2 +-
> - gtkdoc-mkdb.in      | 2 +-
> - gtkdoc-mktmpl.in    | 2 +-
> - gtkdoc-rebase.in    | 2 +-
> - gtkdoc-scan.in      | 2 +-
> - gtkdoc-scangobj.in  | 2 +-
> - tests/tools.sh.in   | 4 ++--
> - 10 files changed, 11 insertions(+), 11 deletions(-)
> + gtkdoc-check.in    | 2 +-
> + gtkdoc-depscan.in  | 2 +-
> + gtkdoc-fixxref.in  | 2 +-
> + gtkdoc-mkdb.in     | 2 +-
> + gtkdoc-mkhtml.in   | 2 +-
> + gtkdoc-mkman.in    | 2 +-
> + gtkdoc-mkpdf.in    | 2 +-
> + gtkdoc-rebase.in   | 2 +-
> + gtkdoc-scan.in     | 2 +-
> + gtkdoc-scangobj.in | 2 +-
> + tests/tools.sh.in  | 2 +-
> + 11 files changed, 11 insertions(+), 11 deletions(-)
> 
>  diff --git a/gtkdoc-check.in b/gtkdoc-check.in
> -index 560d69b..b60857f 100755
> +index 8c8e917..f6a25f6 100755
>  --- a/gtkdoc-check.in
>  +++ b/gtkdoc-check.in
>  @@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!/usr/bin/env perl
> - # -*- cperl -*-
> - #
> - # gtk-doc - GTK DocBook documentation generator.
> -diff --git a/gtkdoc-common.pl.in b/gtkdoc-common.pl.in
> -index 4747396..cfadb78 100644
> ---- a/gtkdoc-common.pl.in
> -+++ b/gtkdoc-common.pl.in
> -@@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!/usr/bin/env perl
> - # -*- cperl -*-
> +-#!@PYTHON@
> ++#!/usr/bin/env python3
> + # -*- python; coding: utf-8 -*-
>   #
>   # gtk-doc - GTK DocBook documentation generator.
>  diff --git a/gtkdoc-depscan.in b/gtkdoc-depscan.in
> -index 83af01b..917e247 100644
> +index 9bfaf30..aadc952 100644
>  --- a/gtkdoc-depscan.in
>  +++ b/gtkdoc-depscan.in
>  @@ -1,4 +1,4 @@
>  -#!@PYTHON@
> -+#!/usr/bin/env python
> ++#!/usr/bin/env python3
> 
> - import gzip, os.path, re
> + from __future__ import print_function
> 
>  diff --git a/gtkdoc-fixxref.in b/gtkdoc-fixxref.in
> -index 3d9e8d0..d55190b 100755
> +index 0ea02d4..bdd443a 100755
>  --- a/gtkdoc-fixxref.in
>  +++ b/gtkdoc-fixxref.in
>  @@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!/usr/bin/env perl
> - # -*- cperl -*-
> +-#!@PYTHON@
> ++#!/usr/bin/env python3
> + # -*- python -*-
>   #
>   # gtk-doc - GTK DocBook documentation generator.
>  diff --git a/gtkdoc-mkdb.in b/gtkdoc-mkdb.in
> -index 8dd6d5e..d808750 100755
> +index 42d5731..3a56d56 100755
>  --- a/gtkdoc-mkdb.in
>  +++ b/gtkdoc-mkdb.in
>  @@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!/usr/bin/env perl
> - # -*- cperl -*-
> +-#!@PYTHON@
> ++#!/usr/bin/env python3
> + # -*- python; coding: utf-8 -*-
> + #
> + # gtk-doc - GTK DocBook documentation generator.
> +diff --git a/gtkdoc-mkhtml.in b/gtkdoc-mkhtml.in
> +index 0d0a15d..914ff55 100644
> +--- a/gtkdoc-mkhtml.in
> ++++ b/gtkdoc-mkhtml.in
> +@@ -1,4 +1,4 @@
> +-#!@PYTHON@
> ++#!/usr/bin/env python3
> + # -*- python; coding: utf-8 -*-
>   #
>   # gtk-doc - GTK DocBook documentation generator.
> -diff --git a/gtkdoc-mktmpl.in b/gtkdoc-mktmpl.in
> -index c64dfd3..2f46c18 100755
> ---- a/gtkdoc-mktmpl.in
> -+++ b/gtkdoc-mktmpl.in
> +diff --git a/gtkdoc-mkman.in b/gtkdoc-mkman.in
> +index c5445cd..65db71a 100644
> +--- a/gtkdoc-mkman.in
> ++++ b/gtkdoc-mkman.in
>  @@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!/usr/bin/env perl
> - # -*- cperl -*-
> +-#!@PYTHON@
> ++#!/usr/bin/env python3
> + # -*- python; coding: utf-8 -*-
> + #
> + # gtk-doc - GTK DocBook documentation generator.
> +diff --git a/gtkdoc-mkpdf.in b/gtkdoc-mkpdf.in
> +index e8c0c03..f807236 100755
> +--- a/gtkdoc-mkpdf.in
> ++++ b/gtkdoc-mkpdf.in
> +@@ -1,4 +1,4 @@
> +-#!@PYTHON@
> ++#!/usr/bin/env python3
> + # -*- python; coding: utf-8 -*-
>   #
>   # gtk-doc - GTK DocBook documentation generator.
>  diff --git a/gtkdoc-rebase.in b/gtkdoc-rebase.in
> -index 375482d..cf05b45 100644
> +index 17a71c2..ec3fd28 100755
>  --- a/gtkdoc-rebase.in
>  +++ b/gtkdoc-rebase.in
>  @@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!/usr/bin/env perl
> - # -*- cperl -*-
> +-#!@PYTHON@
> ++#!/usr/bin/env python3
> + # -*- python -*-
>   #
>   # gtk-doc - GTK DocBook documentation generator.
>  diff --git a/gtkdoc-scan.in b/gtkdoc-scan.in
> -index 048e5c9..78c6136 100755
> +index 954c811..f461504 100755
>  --- a/gtkdoc-scan.in
>  +++ b/gtkdoc-scan.in
>  @@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!/usr/bin/env perl
> - # -*- cperl -*-
> +-#!@PYTHON@
> ++#!/usr/bin/env python3
> + # -*- python -*-
>   #
>   # gtk-doc - GTK DocBook documentation generator.
>  diff --git a/gtkdoc-scangobj.in b/gtkdoc-scangobj.in
> -index fb66b76..67ee8f7 100644
> +index 4cbe130..52c2c24 100644
>  --- a/gtkdoc-scangobj.in
>  +++ b/gtkdoc-scangobj.in
>  @@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!/usr/bin/env perl
> - # -*- cperl -*-
> +-#!@PYTHON@
> ++#!/usr/bin/env python3
> + # -*- python -*-
>   #
>   # gtk-doc - GTK DocBook documentation generator.
>  diff --git a/tests/tools.sh.in b/tests/tools.sh.in
> -index a114a42..7073883 100644
> +index 4d301d0..565fc1e 100644
>  --- a/tests/tools.sh.in
>  +++ b/tests/tools.sh.in
> -@@ -11,7 +11,7 @@ echo "Running suite(s): gtk-doc-$suite";
> -
> - # test perl scripts
> - for file in gtkdoc-check gtkdoc-fixxref gtkdoc-mkdb gtkdoc-mktmpl
> gtkdoc-rebase gtkdoc-scan gtkdoc-scangobj ; do --  @PERL@ -cwT `which
> $file`
> -+  perl -cwT `which $file`
> -   if test $? = 1 ; then failed=`expr $failed + 1`; fi
> -   tested=`expr $tested + 1`
> +@@ -31,7 +31,7 @@ done
> + # TODO: test python 2 and 3 (python3 -mcompileall gtkdoc/*.py)
> + for file in gtkdoc-check gtkdoc-depscan gtkdoc-fixxref gtkdoc-mkdb
> gtkdoc-mkhtml gtkdoc-mkman gtkdoc-mkpdf gtkdoc-rebase gtkdoc-scangobj; do +
>     fullfile=`which $file`
> +-    @PYTHON@ -m py_compile $fullfile
> ++    python3 -m py_compile $fullfile
> +     if test $? != 0 ; then failed=`expr $failed + 1`; fi
> +     tested=`expr $tested + 1`
>   done
> -@@ -34,7 +34,7 @@ done
> -
> -
> - # test python scripts
> --@PYTHON@ -m py_compile `which gtkdoc-depscan`
> -+python -m py_compile `which gtkdoc-depscan`
> - if test $? != 0 ; then failed=`expr $failed + 1`; fi
> - tested=`expr $tested + 1`
> -
> -2.9.3
> +2.14.1
> 
> diff --git a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
> b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch index
> 0c180f2605e..21c2db7826f 100644
> --- a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
> +++ b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
> @@ -1,14 +1,23 @@
> +From 78bbf185934147a69ceb4b617d424e12e70997bf Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Tue, 27 Jun 2017 21:00:58 +0100
> +Subject: [PATCH 3/3] gtk-doc: Handle floating gtk-doc dependency
> +
>  Allow the tests to be explicitly disabled to avoid floating dependnecy
>  issues. This is not really an issue with RSS but is on previous releases.
> 
>  RP 2017/6/27
>  Upstream-Status: Pending
> 
> -Index: gtk-doc-1.25/configure.ac
> -===================================================================
> ---- gtk-doc-1.25.orig/configure.ac
> -+++ gtk-doc-1.25/configure.ac
> -@@ -161,6 +161,11 @@ if test "x$GCC" = "xyes"; then
> +---
> + configure.ac | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 684e2d1..e5e3aab 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -146,6 +146,11 @@ if test "x$GCC" = "xyes"; then
>   	fi
>   fi
> 
> @@ -20,7 +29,7 @@ Index: gtk-doc-1.25/configure.ac
>   dnl if glib is available we can enable the tests
>   PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
>   	[	glib_prefix="`$PKG_CONFIG --variable=prefix glib-2.0`"
> -@@ -171,6 +176,11 @@ PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >
> +@@ -156,6 +161,11 @@ PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0
> gobject-2.0 >= 2.6.0], build_tests="no"
>   	]
>   )
> @@ -30,5 +39,8 @@ Index: gtk-doc-1.25/configure.ac
>  +fi
>  +
>   AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL" -a
> x$gtk_doc_use_libtool = xyes ) - dnl this enable the rule in
> test/Makefile.am
> + dnl this enables the rule in test/Makefile.am
>   AM_CONDITIONAL(BUILD_TESTS, test x$build_tests = xyes)
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
> b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch index
> c7688704eb6..bf03c8f6134 100644
> --- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
> +++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
> @@ -1,24 +1,31 @@
> -Use native pkg-config when looking for gtk-doc.
> +From 5f145621b4780cfd6a5632fcc97c45f572938efc Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Mon, 5 Sep 2016 22:25:44 +0100
> +Subject: [PATCH 5/5] Use native pkg-config when looking for gtk-doc.
> 
>  Upstream-Status: Inappropriate
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> +---
> + gtk-doc.m4 | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
>  diff --git a/gtk-doc.m4 b/gtk-doc.m4
> -index 3675543..94881ae 100644
> +index 3675543..2590e2a 100644
>  --- a/gtk-doc.m4
>  +++ b/gtk-doc.m4
>  @@ -1,6 +1,6 @@
>   dnl -*- mode: autoconf -*-
> -
> +
>  -# serial 2
>  +# serial 2.1
> -
> +
>   dnl Usage:
>   dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
>  @@ -10,11 +10,16 @@ AC_DEFUN([GTK_DOC_CHECK],
>     AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
>     AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
> -
> +
>  +  gtkdoc_pkgconfig_save=$PKG_CONFIG
>  +  PKG_CONFIG=pkg-config-native
>  +
> @@ -26,9 +33,12 @@ index 3675543..94881ae 100644
>     AC_MSG_CHECKING([for gtk-doc])
>    
> PKG_CHECK_EXISTS([$gtk_doc_requires],[have_gtk_doc=yes],[have_gtk_doc=no])
> AC_MSG_RESULT($have_gtk_doc)
> -
> +
>  +  PKG_CONFIG=$gtkdoc_pkgconfig_save
>  +
>     if test "$have_gtk_doc" = "no"; then
>         AC_MSG_WARN([
>     You will not be able to create source packages with 'make dist'
> +--
> +2.15.1
> +
> diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
> b/meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb similarity index 81%
> rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
> rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb
> index e0eb994e259..b907bae1478 100644
> --- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
> +++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb
> @@ -15,22 +15,17 @@ PACKAGECONFIG ??=
> "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation", # into its
> scripts. This means that target gtk-doc package is broken; # hopefully no
> one minds because its scripts are not used for anything during build # and
> shouldn't be used on targets.
> -PACKAGECONFIG[working-scripts] =
> "--with-highlight=source-highlight,--with-highlight=no,libxslt-native
> xmlto-native source-highlight-native perl-native"
> +PACKAGECONFIG[working-scripts] =
> "--with-highlight=source-highlight,--with-highlight=no,libxslt-native
> xmlto-native source-highlight-native python3-six" PACKAGECONFIG[tests] =
> "--enable-tests,--disable-tests,glib-2.0"
> 
> -# We cannot use host perl, because it may be too old for gtk-doc
> -EXTRANATIVEPATH += "perl-native"
> -
> +SRC_URI[archive.md5sum] = "b29949e0964762e474b706ce22171602"
> +SRC_URI[archive.sha256sum] =
> "e26bd3f7080c749b1cb66c46c6bf8239e2f320a949964fb9c6d56e1b0c6d9a6f" SRC_URI
> += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \ - 
>           file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \ -  
>         
> file://0001-Do-not-error-out-if-perl-is-not-found-or-its-version.patch \ - 
>           file://conditionaltests.patch \
> +           file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
> +           file://conditionaltests.patch \
>             "
>  SRC_URI_append_class-native = " file://pkg-config-native.patch"
> 
> -SRC_URI[archive.md5sum] = "0dc6570953112a464a409fb99258ccbc"
> -SRC_URI[archive.sha256sum] =
> "1ea46ed400e6501f975acaafea31479cea8f32f911dca4dff036f59e6464fd42" -
>  BBCLASSEXTEND = "native nativesdk"
> 
>  # Do not check for XML catalogs when building because that



