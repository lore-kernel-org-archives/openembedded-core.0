Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7014865D1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 08:31:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4N8VZIf009812
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 01:31:35 -0700 (PDT)
Received: from PEK-WKANG-D1.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 23 May 2014 01:31:35 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 May 2014 16:31:08 +0800
Message-ID: <1400833868-27473-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] bash: fixed bash build error
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
X-List-Received-Date: Fri, 23 May 2014 08:31:38 -0000
Content-Type: text/plain

When build bash, a error occurs, the log follow:
make[1]: *** No rule to make target `/config.status',
needed by `Makefile'. Stop.
make: [installdirs] Error 2 (ignored)

The cause is that some variable,PACKAGE and VERSION don't be defined,
and others don't get correct value, eg, top_builddir in po/Makevar,
GETTEXT_MACRO_VERSION and MKDIR_P in po/Makefile.in.in and so on.

The patch fixed above problem.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 .../bash/bash/fix-build-error.patch                |   83 ++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.bb             |    1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/fix-build-error.patch

diff --git a/meta/recipes-extended/bash/bash/fix-build-error.patch b/meta/recipes-extended/bash/bash/fix-build-error.patch
new file mode 100644
index 0000000..9db6fe2
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/fix-build-error.patch
@@ -0,0 +1,83 @@
+diff -aurN bash-4.3-org/aclocal.m4 bash-4.3/aclocal.m4
+--- bash-4.3-org/aclocal.m4	2014-05-23 15:28:54.252565146 +0800
++++ bash-4.3/aclocal.m4	2014-05-23 15:33:19.924570133 +0800
+@@ -3710,6 +3710,14 @@
+   AC_REQUIRE([AC_PROG_INSTALL])dnl
+   AC_REQUIRE([AM_MKINSTALLDIRS])dnl
+   AC_REQUIRE([AM_NLS])dnl
++  AC_REQUIRE([AC_PROG_MKDIR_P])dnl
++  AC_REQUIRE([AC_PROG_SED])dnl
++
++  AC_SUBST([mkdir_p], ['$(MKDIR_P)'])
++
++  dnl Release version of the gettext macros. This is used to ensure that
++  dnl the gettext macros and po/Makefile.in.in are in sync.
++  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
+ 
+   dnl Perform the following tests also if --disable-nls has been given,
+   dnl because they are needed for "make dist" to work.
+@@ -3723,6 +3731,22 @@
+     :)
+   AC_PATH_PROG(GMSGFMT, gmsgfmt, $MSGFMT)
+ 
++ dnl Test whether it is GNU msgfmt >= 0.15.
++changequote(,)dnl
++  case `$MSGFMT --version | sed 1q | sed -e 's,^[^0-9]*,,'` in
++    '' | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].*) MSGFMT_015=: ;;
++    *) MSGFMT_015=$MSGFMT ;;
++  esac
++changequote([,])dnl
++  AC_SUBST([MSGFMT_015])
++changequote(,)dnl
++  case `$GMSGFMT --version | sed 1q | sed -e 's,^[^0-9]*,,'` in
++    '' | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].*) GMSGFMT_015=: ;;
++    *) GMSGFMT_015=$GMSGFMT ;;
++  esac
++changequote([,])dnl
++  AC_SUBST([GMSGFMT_015])
++
+   dnl Search for GNU xgettext 0.12 or newer in the PATH.
+   dnl The first test excludes Solaris xgettext and early GNU xgettext versions.
+   dnl The second test excludes FreeBSD xgettext.
+@@ -3733,6 +3757,15 @@
+   dnl Remove leftover from FreeBSD xgettext call.
+   rm -f messages.po
+ 
++  dnl Test whether it is GNU xgettext >= 0.15.
++changequote(,)dnl
++  case `$XGETTEXT --version | sed 1q | sed -e 's,^[^0-9]*,,'` in
++    '' | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].*) XGETTEXT_015=: ;;
++    *) XGETTEXT_015=$XGETTEXT ;;
++  esac
++changequote([,])dnl
++  AC_SUBST([XGETTEXT_015])
++
+   dnl Search for GNU msgmerge 0.11 or newer in the PATH.
+   AM_PATH_PROG_WITH_TEST(MSGMERGE, msgmerge,
+     [$ac_dir/$ac_word --update -q /dev/null /dev/null >/dev/null 2>&1], :)
+diff -aurN bash-4.3-org/configure.ac bash-4.3/configure.ac
+--- bash-4.3-org/configure.ac	2014-05-23 15:28:54.208565145 +0800
++++ bash-4.3/configure.ac	2014-05-23 15:29:35.640565923 +0800
+@@ -1201,6 +1201,10 @@
+ #AC_SUBST(ALLOCA_SOURCE)
+ #AC_SUBST(ALLOCA_OBJECT)
+ 
++# Define the identity of the package.
++AC_SUBST([PACKAGE], ['AC_PACKAGE_TARNAME'])dnl
++AC_SUBST([VERSION], ['AC_PACKAGE_VERSION'])dnl
++
+ AC_OUTPUT([Makefile builtins/Makefile lib/readline/Makefile lib/glob/Makefile \
+ 	  lib/intl/Makefile \
+ 	  lib/malloc/Makefile lib/sh/Makefile lib/termcap/Makefile \
+diff -aurN bash-4.3-org/po/Makevars bash-4.3/po/Makevars
+--- bash-4.3-org/po/Makevars	2014-05-23 15:28:54.204565145 +0800
++++ bash-4.3/po/Makevars	2014-05-23 15:30:04.772566469 +0800
+@@ -5,7 +5,7 @@
+ 
+ # These two variables depend on the location of this directory.
+ subdir = po
+-top_builddir = $(BUILD_DIR)
++top_builddir = ..
+ 
+ # These options get passed to xgettext.
+ XGETTEXT_OPTIONS = --keyword=_ --keyword=N_ -C
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
index 25b7410..3ddf145 100644
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://build-tests.patch \
            file://test-output.patch \
            file://run-ptest \
+           file://fix-build-error.patch \
            "
 
 SRC_URI[tarball.md5sum] = "81348932d5da294953e15d4814c74dd1"
-- 
1.7.9.5


