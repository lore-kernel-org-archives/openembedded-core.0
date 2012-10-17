Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TOUfw-0001vl-Kd for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 16:32:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HEJUAJ006584
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:19:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05807-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:19:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HEJIMS006578
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:19:19 +0100
Message-ID: <1350483566.2185.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2012 15:19:26 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] console-tools: Clean up recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 14:32:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This cleans up various bits of nastiness in this recipe:
  * Drop unneeded m4 macros
  * Update to a recent version of gettext (needs addition of Makevars file)
  * Drop split do_compile and SUBDIRS hacks, just patch out the docs
  * Remove some of the configure.in hacks since they seem unneeded now
    and break gettext (the AC_OUTPUT change).
  * Wipe out acinclude.m4 since it has corrosive contents

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/Makevars b/meta/recipes-core/console-tools/console-tools-0.3.2/Makevars
new file mode 100644
index 0000000..32692ab
--- a/dev/null
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/Makevars
@@ -0,0 +1,41 @@
+# Makefile variables for PO directory in any package using GNU gettext.
+
+# Usually the message domain is the same as the package name.
+DOMAIN = $(PACKAGE)
+
+# These two variables depend on the location of this directory.
+subdir = po
+top_builddir = ..
+
+# These options get passed to xgettext.
+XGETTEXT_OPTIONS = --keyword=_ --keyword=N_
+
+# This is the copyright holder that gets inserted into the header of the
+# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
+# package.  (Note that the msgstr strings, extracted from the package's
+# sources, belong to the copyright holder of the package.)  Translators are
+# expected to transfer the copyright for their translations to this person
+# or entity, or to disclaim their copyright.  The empty string stands for
+# the public domain; in this case the translators are expected to disclaim
+# their copyright.
+COPYRIGHT_HOLDER = Free Software Foundation, Inc.
+
+# This is the email address or URL to which the translators shall report
+# bugs in the untranslated strings:
+# - Strings which are not entire sentences, see the maintainer guidelines
+#   in the GNU gettext documentation, section 'Preparing Strings'.
+# - Strings which use unclear terms or require additional context to be
+#   understood.
+# - Strings which make invalid assumptions about notation of date, time or
+#   money.
+# - Pluralisation problems.
+# - Incorrect English spelling.
+# - Incorrect formatting.
+# It can be your email address, or a mailing list address where translators
+# can write to without being subscribed, or the URL of a web page through
+# which the translators can contact you.
+MSGID_BUGS_ADDRESS =
+
+# This is the list of locale categories, beyond LC_MESSAGES, for which the
+# message catalogs shall be used.  It is usually empty.
+EXTRA_LOCALE_CATEGORIES =
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/config/codeset.m4 b/meta/recipes-core/console-tools/console-tools-0.3.2/config/codeset.m4
deleted file mode 100644
index 863c9cf..0000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/config/codeset.m4
+++ b/dev/null
@@ -1,17 +0,0 @@
-#serial AM1
-
-dnl From Bruno Haible.
-
-AC_DEFUN([AM_LANGINFO_CODESET],
-[
-  AC_CACHE_CHECK([for nl_langinfo and CODESET], am_cv_langinfo_codeset,
-    [AC_TRY_LINK([#include <langinfo.h>],
-      [char* cs = nl_langinfo(CODESET);],
-      am_cv_langinfo_codeset=yes,
-      am_cv_langinfo_codeset=no)
-    ])
-  if test $am_cv_langinfo_codeset = yes; then
-    AC_DEFINE(HAVE_LANGINFO_CODESET, 1,
-      [Define if you have <langinfo.h> and nl_langinfo(CODESET).])
-  fi
-])
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/config/gettext.m4 b/meta/recipes-core/console-tools/console-tools-0.3.2/config/gettext.m4
deleted file mode 100644
index e4d524c..0000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/config/gettext.m4
+++ b/dev/null
@@ -1,370 +0,0 @@
-# Macro to add for using GNU gettext.
-# Ulrich Drepper <drepper@cygnus.com>, 1995.
-#
-# This file can be copied and used freely without restrictions.  It can
-# be used in projects which are not available under the GNU General Public
-# License or the GNU Library General Public License but which still want
-# to provide support for the GNU gettext functionality.
-# Please note that the actual code of the GNU gettext library is covered
-# by the GNU Library General Public License, and the rest of the GNU
-# gettext package package is covered by the GNU General Public License.
-# They are *not* in the public domain.
-
-# serial 10
-
-dnl Usage: AM_WITH_NLS([TOOLSYMBOL], [NEEDSYMBOL], [LIBDIR]).
-dnl If TOOLSYMBOL is specified and is 'use-libtool', then a libtool library
-dnl    $(top_builddir)/intl/libintl.la will be created (shared and/or static,
-dnl    depending on --{enable,disable}-{shared,static} and on the presence of
-dnl    AM-DISABLE-SHARED). Otherwise, a static library
-dnl    $(top_builddir)/intl/libintl.a will be created.
-dnl If NEEDSYMBOL is specified and is 'need-ngettext', then GNU gettext
-dnl    implementations (in libc or libintl) without the ngettext() function
-dnl    will be ignored.
-dnl LIBDIR is used to find the intl libraries.  If empty,
-dnl    the value `$(top_builddir)/intl/' is used.
-dnl
-dnl The result of the configuration is one of three cases:
-dnl 1) GNU gettext, as included in the intl subdirectory, will be compiled
-dnl    and used.
-dnl    Catalog format: GNU --> install in $(datadir)
-dnl    Catalog extension: .mo after installation, .gmo in source tree
-dnl 2) GNU gettext has been found in the system's C library.
-dnl    Catalog format: GNU --> install in $(datadir)
-dnl    Catalog extension: .mo after installation, .gmo in source tree
-dnl 3) No internationalization, always use English msgid.
-dnl    Catalog format: none
-dnl    Catalog extension: none
-dnl The use of .gmo is historical (it was needed to avoid overwriting the
-dnl GNU format catalogs when building on a platform with an X/Open gettext),
-dnl but we keep it in order not to force irrelevant filename changes on the
-dnl maintainers.
-dnl
-AC_DEFUN([AM_WITH_NLS],
-  [AC_MSG_CHECKING([whether NLS is requested])
-    dnl Default is enabled NLS
-    AC_ARG_ENABLE(nls,
-      [  --disable-nls           do not use Native Language Support],
-      USE_NLS=$enableval, USE_NLS=yes)
-    AC_MSG_RESULT($USE_NLS)
-    AC_SUBST(USE_NLS)
-
-    BUILD_INCLUDED_LIBINTL=no
-    USE_INCLUDED_LIBINTL=no
-    INTLLIBS=
-
-    dnl If we use NLS figure out what method
-    if test "$USE_NLS" = "yes"; then
-      AC_DEFINE(ENABLE_NLS, 1,
-        [Define to 1 if translation of program messages to the user's native language
-   is requested.])
-      AC_MSG_CHECKING([whether included gettext is requested])
-      AC_ARG_WITH(included-gettext,
-        [  --with-included-gettext use the GNU gettext library included here],
-        nls_cv_force_use_gnu_gettext=$withval,
-        nls_cv_force_use_gnu_gettext=no)
-      AC_MSG_RESULT($nls_cv_force_use_gnu_gettext)
-
-      nls_cv_use_gnu_gettext="$nls_cv_force_use_gnu_gettext"
-      if test "$nls_cv_force_use_gnu_gettext" != "yes"; then
-        dnl User does not insist on using GNU NLS library.  Figure out what
-        dnl to use.  If GNU gettext is available we use this.  Else we have
-        dnl to fall back to GNU NLS library.
-	CATOBJEXT=NONE
-
-        dnl Add a version number to the cache macros.
-        define(gt_cv_func_gnugettext_libc, [gt_cv_func_gnugettext]ifelse([$2], need-ngettext, 2, 1)[_libc])
-        define(gt_cv_func_gnugettext_libintl, [gt_cv_func_gnugettext]ifelse([$2], need-ngettext, 2, 1)[_libintl])
-
-	AC_CHECK_HEADER(libintl.h,
-	  [AC_CACHE_CHECK([for GNU gettext in libc], gt_cv_func_gnugettext_libc,
-	    [AC_TRY_LINK([#include <libintl.h>
-extern int _nl_msg_cat_cntr;],
-	       [bindtextdomain ("", "");
-return (int) gettext ("")]ifelse([$2], need-ngettext, [ + (int) ngettext ("", "", 0)], [])[ + _nl_msg_cat_cntr],
-	       gt_cv_func_gnugettext_libc=yes,
-	       gt_cv_func_gnugettext_libc=no)])
-
-	   if test "$gt_cv_func_gnugettext_libc" != "yes"; then
-	     AC_CACHE_CHECK([for GNU gettext in libintl],
-	       gt_cv_func_gnugettext_libintl,
-	       [gt_save_LIBS="$LIBS"
-		LIBS="$LIBS -lintl $LIBICONV"
-		AC_TRY_LINK([#include <libintl.h>
-extern int _nl_msg_cat_cntr;],
-		  [bindtextdomain ("", "");
-return (int) gettext ("")]ifelse([$2], need-ngettext, [ + (int) ngettext ("", "", 0)], [])[ + _nl_msg_cat_cntr],
-		  gt_cv_func_gnugettext_libintl=yes,
-		  gt_cv_func_gnugettext_libintl=no)
-		LIBS="$gt_save_LIBS"])
-	   fi
-
-	   dnl If an already present or preinstalled GNU gettext() is found,
-	   dnl use it.  But if this macro is used in GNU gettext, and GNU
-	   dnl gettext is already preinstalled in libintl, we update this
-	   dnl libintl.  (Cf. the install rule in intl/Makefile.in.)
-	   if test "$gt_cv_func_gnugettext_libc" = "yes" \
-	      || { test "$gt_cv_func_gnugettext_libintl" = "yes" \
-		   && test "$PACKAGE" != gettext; }; then
-	     AC_DEFINE(HAVE_GETTEXT, 1,
-               [Define if the GNU gettext() function is already present or preinstalled.])
-
-	     if test "$gt_cv_func_gnugettext_libintl" = "yes"; then
-	       dnl If iconv() is in a separate libiconv library, then anyone
-	       dnl linking with libintl{.a,.so} also needs to link with
-	       dnl libiconv.
-	       INTLLIBS="-lintl $LIBICONV"
-	     fi
-
-	     gt_save_LIBS="$LIBS"
-	     LIBS="$LIBS $INTLLIBS"
-	     AC_CHECK_FUNCS(dcgettext)
-	     LIBS="$gt_save_LIBS"
-
-	     dnl Search for GNU msgfmt in the PATH.
-	     AM_PATH_PROG_WITH_TEST(MSGFMT, msgfmt,
-	       [$ac_dir/$ac_word --statistics /dev/null >/dev/null 2>&1], :)
-	     AC_PATH_PROG(GMSGFMT, gmsgfmt, $MSGFMT)
-
-	     dnl Search for GNU xgettext in the PATH.
-	     AM_PATH_PROG_WITH_TEST(XGETTEXT, xgettext,
-	       [$ac_dir/$ac_word --omit-header /dev/null >/dev/null 2>&1], :)
-
-	     CATOBJEXT=.gmo
-	   fi
-	])
-
-        if test "$CATOBJEXT" = "NONE"; then
-	  dnl GNU gettext is not found in the C library.
-	  dnl Fall back on GNU gettext library.
-	  nls_cv_use_gnu_gettext=yes
-        fi
-      fi
-
-      if test "$nls_cv_use_gnu_gettext" = "yes"; then
-        dnl Mark actions used to generate GNU NLS library.
-        INTLOBJS="\$(GETTOBJS)"
-        AM_PATH_PROG_WITH_TEST(MSGFMT, msgfmt,
-	  [$ac_dir/$ac_word --statistics /dev/null >/dev/null 2>&1], :)
-        AC_PATH_PROG(GMSGFMT, gmsgfmt, $MSGFMT)
-        AM_PATH_PROG_WITH_TEST(XGETTEXT, xgettext,
-	  [$ac_dir/$ac_word --omit-header /dev/null >/dev/null 2>&1], :)
-        AC_SUBST(MSGFMT)
-	BUILD_INCLUDED_LIBINTL=yes
-	USE_INCLUDED_LIBINTL=yes
-        CATOBJEXT=.gmo
-	INTLLIBS="ifelse([$3],[],\$(top_builddir)/intl,[$3])/libintl.ifelse([$1], use-libtool, [l], [])a $LIBICONV"
-	LIBS=`echo " $LIBS " | sed -e 's/ -lintl / /' -e 's/^ //' -e 's/ $//'`
-      fi
-
-      dnl This could go away some day; the PATH_PROG_WITH_TEST already does it.
-      dnl Test whether we really found GNU msgfmt.
-      if test "$GMSGFMT" != ":"; then
-	dnl If it is no GNU msgfmt we define it as : so that the
-	dnl Makefiles still can work.
-	if $GMSGFMT --statistics /dev/null >/dev/null 2>&1; then
-	  : ;
-	else
-	  AC_MSG_RESULT(
-	    [found msgfmt program is not GNU msgfmt; ignore it])
-	  GMSGFMT=":"
-	fi
-      fi
-
-      dnl This could go away some day; the PATH_PROG_WITH_TEST already does it.
-      dnl Test whether we really found GNU xgettext.
-      if test "$XGETTEXT" != ":"; then
-	dnl If it is no GNU xgettext we define it as : so that the
-	dnl Makefiles still can work.
-	if $XGETTEXT --omit-header /dev/null >/dev/null 2>&1; then
-	  : ;
-	else
-	  AC_MSG_RESULT(
-	    [found xgettext program is not GNU xgettext; ignore it])
-	  XGETTEXT=":"
-	fi
-      fi
-
-      dnl We need to process the po/ directory.
-      POSUB=po
-    fi
-    AC_OUTPUT_COMMANDS(
-     [for ac_file in $CONFIG_FILES; do
-        # Support "outfile[:infile[:infile...]]"
-        case "$ac_file" in
-          *:*) ac_file=`echo "$ac_file"|sed 's%:.*%%'` ;;
-        esac
-        # PO directories have a Makefile.in generated from Makefile.in.in.
-        case "$ac_file" in */Makefile.in)
-          # Adjust a relative srcdir.
-          ac_dir=`echo "$ac_file"|sed 's%/[^/][^/]*$%%'`
-          ac_dir_suffix="/`echo "$ac_dir"|sed 's%^\./%%'`"
-          ac_dots=`echo "$ac_dir_suffix"|sed 's%/[^/]*%../%g'`
-          # In autoconf-2.13 it is called $ac_given_srcdir.
-          # In autoconf-2.50 it is called $srcdir.
-          test -n "$ac_given_srcdir" || ac_given_srcdir="$srcdir"
-          case "$ac_given_srcdir" in
-            .)  top_srcdir=`echo $ac_dots|sed 's%/$%%'` ;;
-            /*) top_srcdir="$ac_given_srcdir" ;;
-            *)  top_srcdir="$ac_dots$ac_given_srcdir" ;;
-          esac
-          if test -f "$ac_given_srcdir/$ac_dir/POTFILES.in"; then
-            rm -f "$ac_dir/POTFILES"
-            test -n "$as_me" && echo "$as_me: creating $ac_dir/POTFILES" || echo "creating $ac_dir/POTFILES"
-            sed -e "/^#/d" -e "/^[ 	]*\$/d" -e "s,.*,     $top_srcdir/& \\\\," -e "\$s/\(.*\) \\\\/\1/" < "$ac_given_srcdir/$ac_dir/POTFILES.in" > "$ac_dir/POTFILES"
-            test -n "$as_me" && echo "$as_me: creating $ac_dir/Makefile" || echo "creating $ac_dir/Makefile"
-            sed -e "/POTFILES =/r $ac_dir/POTFILES" "$ac_dir/Makefile.in" > "$ac_dir/Makefile"
-          fi
-          ;;
-        esac
-      done])
-
-
-    dnl If this is used in GNU gettext we have to set BUILD_INCLUDED_LIBINTL
-    dnl to 'yes' because some of the testsuite requires it.
-    if test "$PACKAGE" = gettext; then
-      BUILD_INCLUDED_LIBINTL=yes
-    fi
-
-    dnl intl/plural.c is generated from intl/plural.y. It requires bison,
-    dnl because plural.y uses bison specific features. It requires at least
-    dnl bison-1.26 because earlier versions generate a plural.c that doesn't
-    dnl compile.
-    dnl bison is only needed for the maintainer (who touches plural.y). But in
-    dnl order to avoid separate Makefiles or --enable-maintainer-mode, we put
-    dnl the rule in general Makefile. Now, some people carelessly touch the
-    dnl files or have a broken "make" program, hence the plural.c rule will
-    dnl sometimes fire. To avoid an error, defines BISON to ":" if it is not
-    dnl present or too old.
-    AC_CHECK_PROGS([INTLBISON], [bison])
-    if test -z "$INTLBISON"; then
-      ac_verc_fail=yes
-    else
-      dnl Found it, now check the version.
-      AC_MSG_CHECKING([version of bison])
-changequote(<<,>>)dnl
-      ac_prog_version=`$INTLBISON --version 2>&1 | sed -n 's/^.*GNU Bison.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
-      case $ac_prog_version in
-        '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
-        1.2[6-9]* | 1.[3-9][0-9]* | [2-9].*)
-changequote([,])dnl
-           ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
-        *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
-      esac
-      AC_MSG_RESULT([$ac_prog_version])
-    fi
-    if test $ac_verc_fail = yes; then
-      INTLBISON=:
-    fi
-
-    dnl These rules are solely for the distribution goal.  While doing this
-    dnl we only have to keep exactly one list of the available catalogs
-    dnl in configure.in.
-    for lang in $ALL_LINGUAS; do
-      GMOFILES="$GMOFILES $lang.gmo"
-      POFILES="$POFILES $lang.po"
-    done
-
-    dnl Make all variables we use known to autoconf.
-    AC_SUBST(BUILD_INCLUDED_LIBINTL)
-    AC_SUBST(USE_INCLUDED_LIBINTL)
-    AC_SUBST(CATALOGS)
-    AC_SUBST(CATOBJEXT)
-    AC_SUBST(GMOFILES)
-    AC_SUBST(INTLLIBS)
-    AC_SUBST(INTLOBJS)
-    AC_SUBST(POFILES)
-    AC_SUBST(POSUB)
-
-    dnl For backward compatibility. Some configure.ins may be using this.
-    nls_cv_header_intl=
-    nls_cv_header_libgt=
-
-    dnl For backward compatibility. Some Makefiles may be using this.
-    DATADIRNAME=share
-    AC_SUBST(DATADIRNAME)
-
-    dnl For backward compatibility. Some Makefiles may be using this.
-    INSTOBJEXT=.mo
-    AC_SUBST(INSTOBJEXT)
-
-    dnl For backward compatibility. Some Makefiles may be using this.
-    GENCAT=gencat
-    AC_SUBST(GENCAT)
-  ])
-
-dnl Usage: Just like AM_WITH_NLS, which see.
-AC_DEFUN([AM_GNU_GETTEXT],
-  [AC_REQUIRE([AC_PROG_MAKE_SET])dnl
-   AC_REQUIRE([AC_PROG_CC])dnl
-   AC_REQUIRE([AC_CANONICAL_HOST])dnl
-   AC_REQUIRE([AC_PROG_RANLIB])dnl
-   AC_REQUIRE([AC_ISC_POSIX])dnl
-   AC_REQUIRE([AC_HEADER_STDC])dnl
-   AC_REQUIRE([AC_C_CONST])dnl
-   AC_REQUIRE([AC_C_INLINE])dnl
-   AC_REQUIRE([AC_TYPE_OFF_T])dnl
-   AC_REQUIRE([AC_TYPE_SIZE_T])dnl
-   AC_REQUIRE([AC_FUNC_ALLOCA])dnl
-   AC_REQUIRE([AC_FUNC_MMAP])dnl
-   AC_REQUIRE([jm_GLIBC21])dnl
-
-   AC_CHECK_HEADERS([argz.h limits.h locale.h nl_types.h malloc.h stddef.h \
-stdlib.h string.h unistd.h sys/param.h])
-   AC_CHECK_FUNCS([feof_unlocked fgets_unlocked getcwd getegid geteuid \
-getgid getuid mempcpy munmap putenv setenv setlocale stpcpy strchr strcasecmp \
-strdup strtoul tsearch __argz_count __argz_stringify __argz_next])
-
-   AM_ICONV
-   AM_LANGINFO_CODESET
-   AM_LC_MESSAGES
-   AM_WITH_NLS([$1],[$2],[$3])
-
-   if test "x$CATOBJEXT" != "x"; then
-     if test "x$ALL_LINGUAS" = "x"; then
-       LINGUAS=
-     else
-       AC_MSG_CHECKING(for catalogs to be installed)
-       NEW_LINGUAS=
-       for presentlang in $ALL_LINGUAS; do
-         useit=no
-         for desiredlang in ${LINGUAS-$ALL_LINGUAS}; do
-           # Use the presentlang catalog if desiredlang is
-           #   a. equal to presentlang, or
-           #   b. a variant of presentlang (because in this case,
-           #      presentlang can be used as a fallback for messages
-           #      which are not translated in the desiredlang catalog).
-           case "$desiredlang" in
-             "$presentlang"*) useit=yes;;
-           esac
-         done
-         if test $useit = yes; then
-           NEW_LINGUAS="$NEW_LINGUAS $presentlang"
-         fi
-       done
-       LINGUAS=$NEW_LINGUAS
-       AC_MSG_RESULT($LINGUAS)
-     fi
-
-     dnl Construct list of names of catalog files to be constructed.
-     if test -n "$LINGUAS"; then
-       for lang in $LINGUAS; do CATALOGS="$CATALOGS $lang$CATOBJEXT"; done
-     fi
-   fi
-
-   dnl If the AC_CONFIG_AUX_DIR macro for autoconf is used we possibly
-   dnl find the mkinstalldirs script in another subdir but $(top_srcdir).
-   dnl Try to locate is.
-   MKINSTALLDIRS=
-   if test -n "$ac_aux_dir"; then
-     MKINSTALLDIRS="$ac_aux_dir/mkinstalldirs"
-   fi
-   if test -z "$MKINSTALLDIRS"; then
-     MKINSTALLDIRS="\$(top_srcdir)/mkinstalldirs"
-   fi
-   AC_SUBST(MKINSTALLDIRS)
-
-   dnl Enable libtool support if the surrounding package wishes it.
-   INTL_LIBTOOL_SUFFIX_PREFIX=ifelse([$1], use-libtool, [l], [])
-   AC_SUBST(INTL_LIBTOOL_SUFFIX_PREFIX)
-  ])
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/config/glibc21.m4 b/meta/recipes-core/console-tools/console-tools-0.3.2/config/glibc21.m4
deleted file mode 100644
index 5b88ef2..0000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/config/glibc21.m4
+++ b/dev/null
@@ -1,26 +0,0 @@
-#serial 2
-
-# Test for the GNU C Library, version 2.1 or newer.
-# From Bruno Haible.
-
-AC_DEFUN([jm_GLIBC21],
-  [
-    AC_CACHE_CHECK(whether we are using the GNU C Library 2.1 or newer,
-      ac_cv_gnu_library_2_1,
-      [AC_EGREP_CPP([Lucky GNU user],
-	[
-#include <features.h>
-#ifdef __GNU_LIBRARY__
- #if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1) || (__GLIBC__ > 2)
-  Lucky GNU user
- #endif
-#endif
-	],
-	ac_cv_gnu_library_2_1=yes,
-	ac_cv_gnu_library_2_1=no)
-      ]
-    )
-    AC_SUBST(GLIBC21)
-    GLIBC21="$ac_cv_gnu_library_2_1"
-  ]
-)
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/config/iconv.m4 b/meta/recipes-core/console-tools/console-tools-0.3.2/config/iconv.m4
deleted file mode 100644
index 1723734..0000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/config/iconv.m4
+++ b/dev/null
@@ -1,69 +0,0 @@
-#serial AM2
-
-dnl From Bruno Haible.
-
-AC_DEFUN([AM_ICONV],
-[
-  dnl Some systems have iconv in libc, some have it in libiconv (OSF/1 and
-  dnl those with the standalone portable GNU libiconv installed).
-
-  AC_ARG_WITH([libiconv-prefix],
-[  --with-libiconv-prefix=DIR  search for libiconv in DIR/include and DIR/lib], [
-    for dir in `echo "$withval" | tr : ' '`; do
-      if test -d $dir/include; then CPPFLAGS="$CPPFLAGS -I$dir/include"; fi
-      if test -d $dir/lib; then LDFLAGS="$LDFLAGS -L$dir/lib"; fi
-    done
-   ])
-
-  AC_CACHE_CHECK(for iconv, am_cv_func_iconv, [
-    am_cv_func_iconv="no, consider installing GNU libiconv"
-    am_cv_lib_iconv=no
-    AC_TRY_LINK([#include <stdlib.h>
-#include <iconv.h>],
-      [iconv_t cd = iconv_open("","");
-       iconv(cd,NULL,NULL,NULL,NULL);
-       iconv_close(cd);],
-      am_cv_func_iconv=yes)
-    if test "$am_cv_func_iconv" != yes; then
-      am_save_LIBS="$LIBS"
-      LIBS="$LIBS -liconv"
-      AC_TRY_LINK([#include <stdlib.h>
-#include <iconv.h>],
-        [iconv_t cd = iconv_open("","");
-         iconv(cd,NULL,NULL,NULL,NULL);
-         iconv_close(cd);],
-        am_cv_lib_iconv=yes
-        am_cv_func_iconv=yes)
-      LIBS="$am_save_LIBS"
-    fi
-  ])
-  if test "$am_cv_func_iconv" = yes; then
-    AC_DEFINE(HAVE_ICONV, 1, [Define if you have the iconv() function.])
-    AC_MSG_CHECKING([for iconv declaration])
-    AC_CACHE_VAL(am_cv_proto_iconv, [
-      AC_TRY_COMPILE([
-#include <stdlib.h>
-#include <iconv.h>
-extern
-#ifdef __cplusplus
-"C"
-#endif
-#if defined(__STDC__) || defined(__cplusplus)
-size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
-#else
-size_t iconv();
-#endif
-], [], am_cv_proto_iconv_arg1="", am_cv_proto_iconv_arg1="const")
-      am_cv_proto_iconv="extern size_t iconv (iconv_t cd, $am_cv_proto_iconv_arg1 char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);"])
-    am_cv_proto_iconv=`echo "[$]am_cv_proto_iconv" | tr -s ' ' | sed -e 's/( /(/'`
-    AC_MSG_RESULT([$]{ac_t:-
-         }[$]am_cv_proto_iconv)
-    AC_DEFINE_UNQUOTED(ICONV_CONST, $am_cv_proto_iconv_arg1,
-      [Define as const if the declaration of iconv() needs const.])
-  fi
-  LIBICONV=
-  if test "$am_cv_lib_iconv" = yes; then
-    LIBICONV="-liconv"
-  fi
-  AC_SUBST(LIBICONV)
-])
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/config/progtest.m4 b/meta/recipes-core/console-tools/console-tools-0.3.2/config/progtest.m4
deleted file mode 100644
index 35dc3da..0000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/config/progtest.m4
+++ b/dev/null
@@ -1,51 +0,0 @@
-# Search path for a program which passes the given test.
-# Ulrich Drepper <drepper@cygnus.com>, 1996.
-#
-# This file can be copied and used freely without restrictions.  It can
-# be used in projects which are not available under the GNU General Public
-# License or the GNU Library General Public License but which still want
-# to provide support for the GNU gettext functionality.
-# Please note that the actual code of the GNU gettext library is covered
-# by the GNU Library General Public License, and the rest of the GNU
-# gettext package package is covered by the GNU General Public License.
-# They are *not* in the public domain.
-
-# serial 2
-
-dnl AM_PATH_PROG_WITH_TEST(VARIABLE, PROG-TO-CHECK-FOR,
-dnl   TEST-PERFORMED-ON-FOUND_PROGRAM [, VALUE-IF-NOT-FOUND [, PATH]])
-AC_DEFUN([AM_PATH_PROG_WITH_TEST],
-[# Extract the first word of "$2", so it can be a program name with args.
-set dummy $2; ac_word=[$]2
-AC_MSG_CHECKING([for $ac_word])
-AC_CACHE_VAL(ac_cv_path_$1,
-[case "[$]$1" in
-  /*)
-  ac_cv_path_$1="[$]$1" # Let the user override the test with a path.
-  ;;
-  *)
-  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:"
-  for ac_dir in ifelse([$5], , $PATH, [$5]); do
-    test -z "$ac_dir" && ac_dir=.
-    if test -f $ac_dir/$ac_word; then
-      if [$3]; then
-	ac_cv_path_$1="$ac_dir/$ac_word"
-	break
-      fi
-    fi
-  done
-  IFS="$ac_save_ifs"
-dnl If no 4th arg is given, leave the cache variable unset,
-dnl so AC_PATH_PROGS will keep looking.
-ifelse([$4], , , [  test -z "[$]ac_cv_path_$1" && ac_cv_path_$1="$4"
-])dnl
-  ;;
-esac])dnl
-$1="$ac_cv_path_$1"
-if test ifelse([$4], , [-n "[$]$1"], ["[$]$1" != "$4"]); then
-  AC_MSG_RESULT([$]$1)
-else
-  AC_MSG_RESULT(no)
-fi
-AC_SUBST($1)dnl
-])
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch
index 60ee8ff..15c100c 100644
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch
@@ -1,9 +1,5 @@
 Upstream-Status: Pending
 
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
 --- console-tools-0.3.2/configure.in~configure
 +++ console-tools-0.3.2/configure.in
 @@ -2,13 +2,14 @@
@@ -23,25 +19,11 @@ Upstream-Status: Pending
  AM_INIT_AUTOMAKE(console-tools, 0.3.2)
  
  # Defaults
-@@ -25,7 +26,7 @@
+@@ -25,7 +26,6 @@
  # i18n stuff
  ALL_LINGUAS="cs de ru ga fr"
  AM_GNU_GETTEXT
 -AC_OUTPUT_COMMANDS([sed -e "/POTFILES =/r po/POTFILES" po/Makefile.in > po/Makefile])
-+AC_CONFIG_COMMANDS([default-1],[[sed -e "/POTFILES =/r po/POTFILES" po/Makefile.in > po/Makefile]],[[]])
  
  AC_DEFINE_UNQUOTED(LOCALEDIR, "/usr/share/locale")
  
-@@ -172,10 +173,11 @@
- AC_SUBST(CHARMAPDIR)
- 
- # Output
--AC_OUTPUT([Makefile lib/Makefile lib/console/Makefile lib/cfont/Makefile
-+AC_CONFIG_FILES([Makefile lib/Makefile lib/console/Makefile lib/cfont/Makefile
-   lib/ctutils/Makefile lib/ctlocal/Makefile lib/generic/Makefile
-   fontfiletools/Makefile vttools/Makefile
-   kbdtools/Makefile screenfonttools/Makefile contrib/Makefile
-   include/Makefile include/lct/Makefile compat/Makefile
-   doc/Makefile doc/man/Makefile examples/Makefile
-   po/Makefile.in intl/Makefile])
-+AC_OUTPUT
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/config/lcmessage.m4 b/meta/recipes-core/console-tools/console-tools-0.3.2/lcmessage.m4
index 18d47a9..18d47a9 100644
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/config/lcmessage.m4
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/lcmessage.m4
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/nodocs.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/nodocs.patch
new file mode 100644
index 0000000..60b5ffd
--- a/dev/null
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/nodocs.patch
@@ -0,0 +1,19 @@
+The docs need tools we don't have to build so disable them.
+
+Upstream-Status: Inappropriate [configuration]
+RP 2012/10/17
+
+Index: console-tools-0.3.2/Makefile.am
+===================================================================
+--- console-tools-0.3.2.orig/Makefile.am	1999-04-15 01:33:24.000000000 +0000
++++ console-tools-0.3.2/Makefile.am	2012-10-17 11:48:14.107069145 +0000
+@@ -1,7 +1,7 @@
+ # -*- makefile -*-
+ AUTOMAKE_OPTIONS = foreign
+ 
+-SUBDIRS = lib fontfiletools vttools kbdtools screenfonttools contrib doc \
+-	compat include examples po intl
++SUBDIRS = lib fontfiletools vttools kbdtools screenfonttools contrib \
++	compat include examples po intl
+ 
+ EXTRA_DIST = BUGS RELEASE CREDITS COPYING.kbd local-scripts/* debian/* *.lsm
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 8bcc90a..d62c0bd 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -11,23 +11,18 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://compile.patch \
            file://kbdrate.patch \
            file://uclibc-fileno.patch \
-           file://config"
+           file://nodocs.patch \
+           file://lcmessage.m4 \
+           file://Makevars"
 
 SRC_URI[md5sum] = "bf21564fc38b3af853ef724babddbacd"
 SRC_URI[sha256sum] = "eea6b441672dacd251079fc85ed322e196282e0e66c16303ec64c3a2b1c126c2"
 
-export SUBDIRS = "fontfiletools vttools kbdtools screenfonttools contrib \
-		  examples po intl compat"
-
-acpaths = "-I config"
 do_configure_prepend () {
-	mkdir -p config
-	cp ${WORKDIR}/config/*.m4 config/
-}
-
-do_compile () {
-	oe_runmake -C lib
-	oe_runmake 'SUBDIRS=${SUBDIRS}'
+	mkdir -p ${S}/m4
+	cp ${WORKDIR}/lcmessage.m4 ${S}/m4/
+	rm -f ${S}/acinclude.m4
+	cp ${WORKDIR}/Makevars ${S}/po/
 }
 
 inherit autotools gettext update-alternatives




