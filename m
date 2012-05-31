Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SaDDT-0003IZ-DD
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 23:47:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4VLbEum026556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 14:37:14 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 31 May 2012 14:37:13 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2012 16:42:02 -0500
Message-ID: <5b95b3f8662103eeb547221915ee09a6c2c57b1e.1338500281.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338500281.git.mark.hatle@windriver.com>
References: <cover.1338500281.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/5 v3] rpm: Upgrade RPM to 5.4.8 (db to 5.3.15)
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
X-List-Received-Date: Thu, 31 May 2012 21:47:36 -0000
Content-Type: text/plain

RPM 5.4.8 requires db 5.3.x, so both are upgraded together.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass                    |   22 +-
 .../rpm/rpm/fix_for_automake_1.11.2.patch          |   54 ---
 .../rpm/rpm/fprint-pointer-fix.patch               |   35 --
 .../rpm/rpm/remove-compiled-tests.patch            |  443 --------------------
 meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch   |   22 -
 meta/recipes-devtools/rpm/rpm/rpm-autogen.patch    |   41 +--
 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch  |   16 +-
 .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |   12 +-
 .../rpm/rpm/rpm-no-perl-urpm.patch                 |   43 ++
 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch    |   36 --
 .../rpm/{rpm_5.4.0.bb => rpm_5.4.8.bb}             |   44 ++-
 .../db/{db_5.1.19.bb => db_5.3.15.bb}              |    8 +-
 12 files changed, 106 insertions(+), 670 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/fprint-pointer-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
 rename meta/recipes-devtools/rpm/{rpm_5.4.0.bb => rpm_5.4.8.bb} (91%)
 rename meta/recipes-support/db/{db_5.1.19.bb => db_5.3.15.bb} (93%)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 9039b21..703fa15 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -66,24 +66,26 @@ fakeroot rootfs_rpm_do_rootfs () {
 	touch ${INSTALL_ROOTFS_RPM}${rpmlibdir}/log/log.0000000001
 	cat > ${INSTALL_ROOTFS_RPM}${rpmlibdir}/DB_CONFIG << EOF
 # ================ Environment
-set_data_dir            .
-set_create_dir          .
-set_lg_dir              ./log
-set_tmp_dir             ./tmp
+set_data_dir .
+set_create_dir .
+set_lg_dir ./log
+set_tmp_dir ./tmp
+set_flags db_log_autoremove on
 
 # -- thread_count must be >= 8
-set_thread_count        64
+set_thread_count 64
 
 # ================ Logging
 
 # ================ Memory Pool
-set_mp_mmapsize         268435456
+set_cachesize 0 1048576 0
+set_mp_mmapsize 268435456
 
 # ================ Locking
-set_lk_max_locks        16384
-set_lk_max_lockers      16384
-set_lk_max_objects      16384
-mutex_set_max           163840
+set_lk_max_locks 16384
+set_lk_max_lockers 16384
+set_lk_max_objects 16384
+mutex_set_max 163840
 
 # ================ Replication
 EOF
diff --git a/meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch b/meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch
deleted file mode 100644
index bb0f7eb..0000000
--- a/meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream-Status: Pending
-
-automake version 1.11.2 has made use of dir variables more strict.
-the use of pkglibdir with SCRIPTS & DATA vars results in automake
-errors.
-  This commits uses pkgdatadir & pkgbindir vars instead of pkglibdir
-to avoid the strict check errors.
-
-  This change also works with automake-1.11.1
-
-Errors fixed:
-Makefile.am:103: error: `pkglibdir' is not a legitimate directory for `DATA'
-scripts/Makefile.am:47: error: `pkglibdir' is not a legitimate directory for `SCRIPTS'
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2011/12/27
-
-Index: rpm-5.4.0/Makefile.am
-===================================================================
---- rpm-5.4.0.orig/Makefile.am
-+++ rpm-5.4.0/Makefile.am
-@@ -103,13 +103,13 @@ if WITH_PATH_VERSIONED
- 	done
- endif
- 
--pkglibdir =		@USRLIBRPM@
--pkglib_DATA = rpmpopt macros/macros macros/macros.rpmbuild cpuinfo.yaml
-+pkgdatadir =		@USRLIBRPM@
-+pkgdata_DATA = rpmpopt macros/macros macros/macros.rpmbuild cpuinfo.yaml
- 
--pkgbindir =	$(pkglibdir)/bin
-+pkgbindir =	$(pkgdatadir)/bin
- pkgbin_SCRIPTS = install-sh mkinstalldirs
- 
--pkgcfgdir =	$(pkglibdir)/macros.d
-+pkgcfgdir =	$(pkgdatadir)/macros.d
- pkgcfg_DATA = \
- 	macros/cmake macros/java macros/libtool macros/mandriva macros/mono \
- 	macros/perl macros/pkgconfig macros/php macros/python macros/ruby \
-Index: rpm-5.4.0/scripts/Makefile.am
-===================================================================
---- rpm-5.4.0.orig/scripts/Makefile.am
-+++ rpm-5.4.0/scripts/Makefile.am
-@@ -45,8 +45,8 @@ all:
- 
- bin_SCRIPTS = gendiff
- 
--pkglibdir =		@USRLIBRPM@
--pkglib_SCRIPTS = \
-+pkgbindir =		@USRLIBRPM@
-+pkgbin_SCRIPTS = \
- 	brp-compress brp-python-bytecompile brp-java-gcjcompile \
- 	brp-strip brp-strip-comment-note brp-nobuildrootpath \
- 	brp-strip-shared brp-strip-static-archive brp-sparc64-linux \
diff --git a/meta/recipes-devtools/rpm/rpm/fprint-pointer-fix.patch b/meta/recipes-devtools/rpm/rpm/fprint-pointer-fix.patch
deleted file mode 100644
index 87a92eb..0000000
--- a/meta/recipes-devtools/rpm/rpm/fprint-pointer-fix.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Submitted
-
-From: Qing He <qing.he@intel.com>
-Subject: [PATCH] rpm 5.4.0: Fix pointer mishandling
-
-In fpLookupSubdir, data returned by hash should be of type
-"struct rpmffi_s **" instead of "struct rpmffi_s *" to avoid
-segfault.
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/rpmdb/fprint.c b/rpmdb/fprint.c
-index 0e76148..82b8f45 100644
---- a/rpmdb/fprint.c
-+++ b/rpmdb/fprint.c
-@@ -333,7 +333,7 @@ restart:
-     *te = '\0';
- 
-     while (te < se) {
--	struct rpmffi_s * recs;
-+	struct rpmffi_s ** recs;
- 	int numRecs;
- 	int i;
- 
-@@ -346,8 +346,8 @@ restart:
- 	    const char * link;
- 	    int fx;
- 
--	    fx = recs[i].fileno;
--	    fi =  recs[i].p->fi;
-+	    fx = recs[i]->fileno;
-+	    fi =  recs[i]->p->fi;
- 	    flink = fi->flinks[fx];
- 	    if (!(flink && *flink != '\0'))
- 		continue;
diff --git a/meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch b/meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch
deleted file mode 100644
index 3663692..0000000
--- a/meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch
+++ /dev/null
@@ -1,443 +0,0 @@
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: rpm-5.1.9/configure.ac
-===================================================================
---- rpm-5.1.9.orig/configure.ac	2009-04-18 17:47:02.000000000 +0100
-+++ rpm-5.1.9/configure.ac	2010-07-06 14:47:28.985462456 +0100
-@@ -643,38 +643,22 @@
- dnl look for libc features
- PROVIDES_ERRNO=no
- AC_MSG_CHECKING(if <netdb.h> defines h_errno)
--AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <netdb.h>]], [[printf("%d",h_errno)]])],[PROVIDES_ERRNO=yes],[])
--AC_MSG_RESULT($PROVIDES_ERRNO)
--if test $PROVIDES_ERRNO = yes; then
--	AC_DEFINE(HAVE_HERRNO, 1, [ Define as 1 if <netdb.h> defines h_errno])
--fi
-+AC_DEFINE(HAVE_HERRNO, 1, [ Define as 1 if <netdb.h> defines h_errno])
- 
- dnl If a system doesn't have S_IFSOCK, define it as 0 which will
- dnl make S_ISSOCK always return false (nice, eh?)
- AC_MSG_CHECKING(if <sys/stat.h> defines S_IFSOCK)
--AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <sys/stat.h>]], [[printf("%d", S_IFSOCK)]])],[HAS_S_IFSOCK=yes],[HAS_S_IFSOCK=no])
--AC_MSG_RESULT($HAS_S_IFSOCK)
--if test $HAS_S_IFSOCK = yes; then
--	AC_DEFINE(HAVE_S_IFSOCK, 1, [Define as 1 if <sys/stat.h> defines S_IFSOCK])
--fi
-+AC_DEFINE(HAVE_S_IFSOCK, 1, [Define as 1 if <sys/stat.h> defines S_IFSOCK])
- 
- dnl Some Unix's are missing S_ISLNK, S_ISSOCK
- AC_MSG_CHECKING(if <sys/stat.h> defines S_ISLNK)
--AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <sys/stat.h>]], [[printf("%d", S_ISLNK(0755))]])],[HAS_S_ISLNK=yes],[HAS_S_ISLNK=no])
--AC_MSG_RESULT($HAS_S_ISLNK)
--if test $HAS_S_ISLNK = yes; then
--	AC_DEFINE(HAVE_S_ISLNK, 1, [Define as 1 if <sys/stat.h> defines S_ISLNK])
--fi
-+AC_DEFINE(HAVE_S_ISLNK, 1, [Define as 1 if <sys/stat.h> defines S_ISLNK])
- 
- AC_MSG_CHECKING(if <sys/stat.h> defines S_ISSOCK)
--AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <sys/stat.h>]], [[printf("%d", S_ISSOCK(0755))]])],[HAS_S_ISSOCK=yes],[HAS_S_ISSOCK=no])
--AC_MSG_RESULT($HAS_S_ISSOCK)
--if test $HAS_S_ISSOCK = yes; then
--	AC_DEFINE(HAVE_S_ISSOCK, 1, [Define as 1 if <sys/stat.h> defines S_ISSOCK])
--fi
-+AC_DEFINE(HAVE_S_ISSOCK, 1, [Define as 1 if <sys/stat.h> defines S_ISSOCK])
- 
- AC_MSG_CHECKING(if timezone is defined)
--AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <time.h>]], [[printf("%ld", timezone)]])],[HAS_TIMEZONE=yes],[HAS_TIMEZONE=no])
-+$HAS_TIMEZONE=yes
- AC_MSG_RESULT($HAS_TIMEZONE)
- 
- dnl check for missing typedefs
-@@ -726,53 +710,12 @@
-         AC_MSG_RESULT(yes)
-         AC_CHECK_HEADERS([libelf.h gelf.h])
-         if test ".$ac_cv_header_libelf_h" = .no; then
--            dnl # <libelf.h> on Solaris is incompatible with LFS. If we couldn't
--            dnl # include <libelf.h>, see if we can when _FILE_OFFSET_BITS is
--            dnl # set for non-LFS. Same applies for <gelf.h>, since it probably
--            dnl # includes <libelf.h>
--            AC_MSG_CHECKING([if libelf.h conflicts with _LARGEFILE_SOURCE])
--            AC_COMPILE_IFELSE([
--                AC_LANG_PROGRAM([[
--#undef _LARGEFILE64_SOURCE
--#undef _LARGEFILE_SOURCE
--#if !defined(_LP64)
--# undef _FILE_OFFSET_BITS
--# define _FILE_OFFSET_BITS 32
--#endif
--#include <libelf.h>
--                ]], [[
--                    Elf_Data foo;
--                ]])
--            ], [
--                AC_DEFINE(HAVE_LIBELF_H, 1, [Define to 1 if you have libelf.h])
--                ac_cv_header_libelf_h=yes
--                AC_DEFINE(LIBELF_H_LFS_CONFLICT, 1, [Define to 1 if libelf.h is incompatible with LFS API])
--                AC_MSG_RESULT(yes)
--            ], [
--                AC_MSG_RESULT(no)
--            ])
-+            AC_DEFINE(HAVE_LIBELF_H, 1, [Define to 1 if you have libelf.h])
-+            ac_cv_header_libelf_h=yes
-         fi
-         if test ".$ac_cv_header_gelf_h" = .no; then
--            AC_MSG_CHECKING([if gelf.h conflicts with _LARGEFILE_SOURCE])
--            AC_COMPILE_IFELSE([
--                AC_LANG_PROGRAM([[
--#undef _LARGEFILE64_SOURCE
--#undef _LARGEFILE_SOURCE
--#if !defined(_LP64)
--# undef _FILE_OFFSET_BITS
--# define _FILE_OFFSET_BITS 32
--#endif
--#include <gelf.h>
--                ]], [[
--                    Elf32_Verdef foo;
--                ]])
--            ], [
--                AC_DEFINE(HAVE_GELF_H, 1, [Define to 1 if you have gelf.h])
--                ac_cv_header_gelf_h=yes
--                AC_MSG_RESULT(yes)
--            ], [
--                AC_MSG_RESULT(no)
--          ])
-+            AC_DEFINE(HAVE_GELF_H, 1, [Define to 1 if you have gelf.h])
-+            ac_cv_header_gelf_h=yes
-         fi
-         if test ".$ac_cv_header_gelf_h" = .yes; then
-             AC_CHECK_LIB([elf], [elf_version], [
-@@ -854,78 +797,9 @@
-                   python_version=""
-                   ;;
-         esac
--	for python_ver in $python_version ; do
--             if test "$python_ver" != "2.x" ; then
--                  AC_MSG_CHECKING([for Python ${python_ver} API])
--                  save_CFLAGS="${CFLAGS}"
--                  for i in "$prefix" "/usr/local" "/usr"; do
--                  CFLAGS="${save_CFLAGS} -I$i/include/python${python_ver}"
--                  AC_RUN_IFELSE([AC_LANG_SOURCE(
--                  [[#include "Python.h"
--                     main() { exit(strncmp("${python_ver}", PY_VERSION, 3)); } ]])
--                  ], [
--                     PYTHON_VERSION="${python_ver}"
--                     AC_MSG_RESULT(yes)
--                     PYTHON_PREFIX="${i}"
--                     break
--                  ], [ 
--                  ], [
--                     dnl if we're cross compiling, assume the user has a clue
--                     if test "$withval" = "$python_ver"; then
--                         PYTHON_VERSION="${python_ver}"
--                         AC_MSG_RESULT(yes)
--                         break
--                     fi
--                  ])
--                  done
--                  CFLAGS="${save_CFLAGS}"
--                  if test ".$PYTHON_VERSION" == "."; then
--                     dnl check Mac OS X framework
--                     save_CFLAGS="${CFLAGS}"
--                     for f in "~" "" "/System" "/Network"; do
--                     CFLAGS="${save_CFLAGS} -I$f/Library/Frameworks/Python.framework/Versions/${python_ver}/include/python${python_ver}"
--                     AC_RUN_IFELSE([AC_LANG_SOURCE(
--                     [[#include "Python.h"
--                        main() { exit(strncmp("${python_ver}", PY_VERSION, 3)); } ]])
--                     ], [
--                        PYTHON_VERSION="${python_ver}"
--                        AC_MSG_RESULT([yes (using Python.framework)])
--                        PYTHON_PREFIX="$f/Library/Frameworks/Python.framework/Versions/${python_ver}"
--                        break
--                     ], [
--                     ])
--                     done
--                     CFLAGS="${save_CFLAGS}"
--                  fi
--                  if test ".$PYTHON_VERSION" == "."; then
--                     AC_MSG_RESULT(no)
--                  fi
--             else
--                  AC_MSG_CHECKING([for Python 2.x API])
--                  AC_RUN_IFELSE([AC_LANG_SOURCE(
--                  [[#include <python/Python.h>
--                     main() { exit(strncmp("2.", PY_VERSION, 2)); } ]])
--                  ], [
--                     PYTHON_VERSION=""
--                     AC_MSG_RESULT(yes)
--                  ], [ 
--                     AC_MSG_RESULT(no)
--                  ], [
--                     dnl if we're cross compiling, assume the user has a clue
--                     if test "$withval" = "$python_ver"; then
--                         PYTHON_VERSION="${python_ver}"
--                         AC_MSG_RESULT(yes)
--                     else
--                         AC_MSG_RESULT(no)
--                     fi
--                  ])
--             fi
--             if test ".$PYTHON_VERSION" != "."; then
--                  WITH_PYTHON_SUBDIR=python
--                  WITH_PYTHON_SUBPACKAGE=1
--                  break
--             fi
--	done
-+	PYTHON_VERSION="${python_ver}"
-+	WITH_PYTHON_SUBDIR=python
-+	WITH_PYTHON_SUBPACKAGE=1
-     fi
-     AC_ARG_WITH(python-inc-dir, AS_HELP_STRING([--with-python-inc-dir=DIR], [directory with Python include files]),
- 	    [WITH_PYTHON_INCDIR="$withval"], [WITH_PYTHON_INCDIR="`(python -c 'from distutils.sysconfig import get_python_inc; print get_python_inc()') 2>/dev/null`"])
-@@ -1157,15 +1031,8 @@
- 	  AC_SUBST(WITH_PCRE_LIBS)
-       else
- 	dnl # make sure PCRE POSIX API can be really _USED_ by RPM
--	LIBS_SAVED="$LIBS"
- 	LIBS="-lpcreposix $LIBS"
--	AC_LINK_IFELSE([
--          AC_LANG_PROGRAM([#include <pcreposix.h>], [(void)regcomp(0, 0, 0)])
--	], [
--          AC_DEFINE(WITH_PCRE_POSIX, 1, [Define as 1 if PCRE's POSIX API is available])
--	], [
--          LIBS="$LIBS_SAVED"
--	])
-+        AC_DEFINE(WITH_PCRE_POSIX, 1, [Define as 1 if PCRE's POSIX API is available])
-       fi
-       dnl # enable PCRE native API support for embedded Lua
-       if test ".$WITH_LUA" = .yes; then
-@@ -1234,30 +1101,7 @@
- 
- dnl # figure out what root's primary group is
- AC_MSG_CHECKING([root's primary group])
--AC_RUN_IFELSE([AC_LANG_SOURCE([[#include <stdio.h>
--#include <sys/types.h>
--#include <pwd.h>
--#include <grp.h>
--int main()
--{
--	struct passwd *root = NULL;
--	struct group *roots_group = NULL;
--	FILE * tempfile = NULL;
--	root = getpwuid( (uid_t) 0 );
--	if (root != NULL) {
--		roots_group = getgrgid(root->pw_gid);
--		if (roots_group != NULL) {
--			tempfile = fopen("conftest_rootg", "w");
--			if (tempfile != NULL) {
--				fprintf(tempfile, "%s\n", roots_group->gr_name);
--				fclose(tempfile);
--				exit(0);
--			}
--		}
--	}
--	exit(1);
--}]])],[ROOT_GROUP=`cat conftest_rootg`; rm -f conftest_rootg],[ROOT_GROUP="root"],[ROOT_GROUP="root"
--])
-+$ROOT_GROUP="root"
- AC_MSG_RESULT([$ROOT_GROUP])
- AC_SUBST(ROOT_GROUP)
- 
-Index: rpm-5.1.9/pcre/configure.ac
-===================================================================
---- rpm-5.1.9.orig/pcre/configure.ac	2009-01-14 20:19:31.000000000 +0000
-+++ rpm-5.1.9/pcre/configure.ac	2010-07-06 14:51:50.769586089 +0100
-@@ -278,34 +278,6 @@
- # The files below are C++ header files.
- pcre_have_type_traits="0"
- pcre_have_bits_type_traits="0"
--if test "x$enable_cpp" = "xyes" -a -n "$CXX"
--then
--AC_LANG_PUSH(C++)
--
--# Older versions of pcre defined pcrecpp::no_arg, but in new versions
--# it's called pcrecpp::RE::no_arg.  For backwards ABI compatibility,
--# we want to make one an alias for the other.  Different systems do
--# this in different ways.  Some systems, for instance, can do it via
--# a linker flag: -alias (for os x 10.5) or -i (for os x <=10.4).
--OLD_LDFLAGS="$LDFLAGS"
--for flag in "-alias,__ZN7pcrecpp2RE6no_argE,__ZN7pcrecpp6no_argE" \
--            "-i__ZN7pcrecpp6no_argE:__ZN7pcrecpp2RE6no_argE"; do
--  AC_MSG_CHECKING([for alias support in the linker])
--  LDFLAGS="$OLD_LDFLAGS -Wl,$flag"
--  # We try to run the linker with this new ld flag.  If the link fails,
--  # we give up and remove the new flag from LDFLAGS.
--  AC_LINK_IFELSE(AC_LANG_PROGRAM([namespace pcrecpp {
--                                    class RE { static int no_arg; };
--                                    int RE::no_arg;
--                                  }],
--                                 []),
--                 [AC_MSG_RESULT([yes]);
--                  EXTRA_LIBPCRECPP_LDFLAGS="$EXTRA_LIBPCRECPP_LDFLAGS -Wl,$flag";
--                  break;],
--                 AC_MSG_RESULT([no]))
--done
--LDFLAGS="$OLD_LDFLAGS"
--
- # We could be more clever here, given we're doing AC_SUBST with this
- # (eg set a var to be the name of the include file we want). But we're not
- # so it's easy to change back to 'regular' autoconf vars if we needed to.
-@@ -316,7 +288,6 @@
- AC_CHECK_HEADERS(type_traits.h, [pcre_have_type_traits="1"],
-                                 [pcre_have_type_traits="0"])
- 
--AC_LANG_POP
- fi
- # Using AC_SUBST eliminates the need to include config.h in a public .h file
- AC_SUBST(pcre_have_type_traits)
-Index: rpm-5.1.9/db/dist/configure.ac
-===================================================================
---- rpm-5.1.9.orig/db/dist/configure.ac	2008-06-15 08:16:21.000000000 +0100
-+++ rpm-5.1.9/db/dist/configure.ac	2010-07-06 15:36:39.262461127 +0100
-@@ -602,24 +602,6 @@
- aux*)	AC_LIBOBJ([getopt]);;
- esac
- 
--# Linux has a broken O_DIRECT flag, but you can't detect it at configure time.
--# Linux and SGI require buffer alignment we may not match, otherwise writes
--# will fail.  Default to not using the O_DIRECT flag.
--if test "$db_cv_o_direct" = "yes"; then
--	AC_CACHE_CHECK([for open/O_DIRECT], db_cv_open_o_direct, [
--	AC_TRY_LINK([
--	#include <sys/types.h>
--	#include <fcntl.h>], [
--		open("a", O_RDONLY | O_DIRECT, 0);
--	], [db_cv_open_o_direct=yes], [db_cv_open_o_direct=no])])
--	if test \
--	    "$db_cv_o_direct" = "yes" -a "$db_cv_open_o_direct" = "yes"; then
--		AC_DEFINE(HAVE_O_DIRECT)
--		AH_TEMPLATE(HAVE_O_DIRECT,
--		    [Define to 1 if you have the O_DIRECT flag.])
--	fi
--fi
--
- # Check for largefile support.
- AC_SYS_LARGEFILE
- 
-Index: rpm-5.1.9/xz/configure.ac
-===================================================================
---- rpm-5.1.9.orig/xz/configure.ac	2009-02-16 17:07:46.000000000 +0000
-+++ rpm-5.1.9/xz/configure.ac	2010-07-06 15:41:22.632467951 +0100
-@@ -457,26 +457,9 @@
- #endif
- ])
- 
--# Even if we have byteswap.h, we may lack the specific macros/functions.
--if test x$ac_cv_header_byteswap_h = xyes ; then
--	m4_foreach([FUNC], [bswap_16,bswap_32,bswap_64], [
--		AC_MSG_CHECKING([if FUNC is available])
--		AC_LINK_IFELSE([AC_LANG_SOURCE([
--#include <byteswap.h>
--int
--main(void)
--{
--	FUNC[](42);
--	return 0;
--}
--		])], [
--			AC_DEFINE(HAVE_[]m4_toupper(FUNC), [1],
--					[Define to 1 if] FUNC [is available.])
--			AC_MSG_RESULT([yes])
--		], [AC_MSG_RESULT([no])])
--
--	])dnl
--fi
-+AC_DEFINE(HAVE_BSWAP_16, 1)
-+AC_DEFINE(HAVE_BSWAP_32, 1)
-+AC_DEFINE(HAVE_BSWAP_64, 1)
- 
- 
- ###############################################################################
-@@ -527,90 +510,16 @@
- # xz command line tool uses this to automatically limit its memory usage.
- # - sysconf() gives all the needed info on GNU+Linux and Solaris.
- # - BSDs use sysctl().
--AC_MSG_CHECKING([how to detect the amount of physical memory])
--AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
--#include <unistd.h>
--int
--main()
--{
--	long i;
--	i = sysconf(_SC_PAGESIZE);
--	i = sysconf(_SC_PHYS_PAGES);
--	return 0;
--}
--]])], [
--	AC_DEFINE([HAVE_PHYSMEM_SYSCONF], [1],
-+AC_DEFINE([HAVE_PHYSMEM_SYSCONF], [1],
- 		[Define to 1 if the amount of physical memory can be detected
- 		with sysconf(_SC_PAGESIZE) and sysconf(_SC_PHYS_PAGES).])
--	AC_MSG_RESULT([sysconf])
--], [
--AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
--#include <sys/types.h>
--#ifdef HAVE_SYS_PARAM_H
--#	include <sys/param.h>
--#endif
--#include <sys/sysctl.h>
--int
--main()
--{
--	int name[2] = { CTL_HW, HW_PHYSMEM };
--	unsigned long mem;
--	size_t mem_ptr_size = sizeof(mem);
--	sysctl(name, 2, &mem, &mem_ptr_size, NULL, NULL);
--	return 0;
--}
--]])], [
--	AC_DEFINE([HAVE_PHYSMEM_SYSCTL], [1],
--		[Define to 1 if the amount of physical memory can be detected
--		with sysctl().])
--	AC_MSG_RESULT([sysctl])
--], [
--	AC_MSG_RESULT([unknown])
--])])
- 
- # Check how to find out the number of available CPU cores in the system.
- # sysconf(_SC_NPROCESSORS_ONLN) works on most systems, except that BSDs
- # use sysctl().
--AC_MSG_CHECKING([how to detect the number of available CPU cores])
--AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
--#include <unistd.h>
--int
--main()
--{
--	long i;
--	i = sysconf(_SC_NPROCESSORS_ONLN);
--	return 0;
--}
--]])], [
--	AC_DEFINE([HAVE_NCPU_SYSCONF], [1],
-+AC_DEFINE([HAVE_NCPU_SYSCONF], [1],
- 		[Define to 1 if the number of available CPU cores can be
- 		detected with sysconf(_SC_NPROCESSORS_ONLN).])
--	AC_MSG_RESULT([sysconf])
--], [
--AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
--#include <sys/types.h>
--#ifdef HAVE_SYS_PARAM_H
--#	include <sys/param.h>
--#endif
--#include <sys/sysctl.h>
--int
--main()
--{
--	int name[2] = { CTL_HW, HW_NCPU };
--	int cpus;
--	size_t cpus_size = sizeof(cpus);
--	sysctl(name, 2, &cpus, &cpus_size, NULL, NULL);
--	return 0;
--}
--]])], [
--	AC_DEFINE([HAVE_NCPU_SYSCTL], [1],
--		[Define to 1 if the number of available CPU cores can be
--		detected with sysctl().])
--	AC_MSG_RESULT([sysctl])
--], [
--	AC_MSG_RESULT([unknown])
--])])
--
- 
- ###############################################################################
- # If using GCC, set some additional CFLAGS:
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch b/meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch
deleted file mode 100644
index 5e93517..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Using the version of autoconf in poky results in:
-
-configure.ac:11: error: m4_divert_push: cannot change diversion to `GROW' inside m4_expand
-
-without this patch.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur rpm-5.1.10.orig/configure.ac rpm-5.1.10/configure.ac
---- rpm-5.1.10.orig/configure.ac	2010-08-20 17:12:16.000000000 -0500
-+++ rpm-5.1.10/configure.ac	2010-09-03 11:34:44.722097327 -0500
-@@ -8,7 +8,7 @@
- 
- AC_PREREQ(2.60)
- AC_DEFUN([PACKAGE_BUGREPORT_DEFAULT], [rpm-devel@rpm5.org])
--AC_INIT(rpm, [5.1.10], [PACKAGE_BUGREPORT_DEFAULT])
-+AC_INIT(rpm, [5.1.10])
- PACKAGE_TIMESTAMP="2008" dnl # YYYY[-MM[-DD[ HH[:MM]]]]
- AC_MSG_TITLE([RPM Package Manager (RPM)], [$PACKAGE_VERSION])
- 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch b/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch
index 5fe6ded..5129833 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch
@@ -6,42 +6,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur rpm-5.4.0.orig/autogen.sh rpm-5.4.0/autogen.sh
---- rpm-5.4.0.orig/autogen.sh	2010-11-02 11:55:53.000000000 -0500
-+++ rpm-5.4.0/autogen.sh	2011-01-06 00:15:05.158946295 -0600
-@@ -34,12 +34,6 @@
-     eval $_libtoolize $_libtoolize_args
- }
- 
--#   requirements sanity check
--[ "`automake   --version | head -1`" != "$AMV" ] && echo "$USAGE" # && exit 1
--[ "`autoconf   --version | head -1`" != "$ACV" ] && echo "$USAGE" # && exit 1
--[ "`libtoolize --version | head -1`" != "$LTV" ] && echo "$USAGE" # && exit 1
--[ "`gettextize --version | head -1 | sed -e 's;^.*/\\(gettextize\\);\\1;'`" != "$GTT" ] && echo "$USAGE" # && exit 1
--
- for dir in bash beecrypt file neon pcre popt rc syck xar xz; do
- 
-   if [ -d $dir ]; then
-diff -ur rpm-5.4.0.orig/neon/autogen.sh rpm-5.4.0/neon/autogen.sh
---- rpm-5.4.0.orig/neon/autogen.sh	2010-10-30 19:11:33.000000000 -0500
-+++ rpm-5.4.0/neon/autogen.sh	2011-01-06 00:15:17.863962139 -0600
-@@ -34,12 +34,6 @@
-     eval $_libtoolize $_libtoolize_args
- }
- 
--#   requirements sanity check
--[ "`automake   --version | head -1`" != "$AMV" ] && echo "$USAGE" # && exit 1
--[ "`autoconf   --version | head -1`" != "$ACV" ] && echo "$USAGE" # && exit 1
--[ "`libtoolize --version | head -1`" != "$LTV" ] && echo "$USAGE" # && exit 1
--[ "`gettextize --version | head -1 | sed -e 's;^.*/\\(gettextize\\);\\1;'`" != "$GTT" ] && echo "$USAGE" # && exit 1
--
- echo "---> generate files via GNU libtool (libtoolize)"
- libtoolize --quiet --copy --force --install
- echo "---> generate files via GNU autoconf (aclocal, autoheader)"
-diff -ur rpm-5.4.0.orig/syck/autogen.sh rpm-5.4.0/syck/autogen.sh
---- rpm-5.4.0.orig/syck/autogen.sh	2010-11-02 11:55:56.000000000 -0500
-+++ rpm-5.4.0/syck/autogen.sh	2011-01-06 00:15:27.103949601 -0600
-@@ -34,12 +34,6 @@
+Index: rpm-5.4.8/syck/autogen.sh
+===================================================================
+--- rpm-5.4.8.orig/syck/autogen.sh
++++ rpm-5.4.8/syck/autogen.sh
+@@ -34,12 +34,6 @@ libtoolize () {
      eval $_libtoolize $_libtoolize_args
  }
  
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch b/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
index e063e86..d9b4e33 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
@@ -4,16 +4,16 @@ Change cache size to reduce the usage of disk space from 62MB to 26MB.
 
 Signed-off-by: Mei Lei <lei.mei@intel.com>
 
-diff --git a/rpmdb/DB_CONFIG.in b/rpmdb/DB_CONFIG.in
-index e0b4689..b64e3a9 100644
---- a/rpmdb/DB_CONFIG.in
-+++ b/rpmdb/DB_CONFIG.in
-@@ -29,7 +29,7 @@ set_thread_count	64
+Index: rpm-5.4.8/rpmdb/DB_CONFIG.in
+===================================================================
+--- rpm-5.4.8.orig/rpmdb/DB_CONFIG.in
++++ rpm-5.4.8/rpmdb/DB_CONFIG.in
+@@ -29,7 +29,7 @@ set_thread_count 64
  
  # ================ Memory Pool
  #XXX initializing dbenv with set_cachesize has unimplemented prerequsites
--#set_cachesize		0 1048576 0 
-+set_cachesize		0 1048576 0 
- set_mp_mmapsize		268435456
+-#set_cachesize 0 1048576 0 
++set_cachesize 0 1048576 0 
+ set_mp_mmapsize 268435456
  
  # ================ Locking
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch b/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
index babafb3..4f484c4 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
@@ -5,11 +5,11 @@ diff --git a/rpmdb/DB_CONFIG.in b/rpmdb/DB_CONFIG.in
 index 8b94c94..e0b4689 100644
 --- a/rpmdb/DB_CONFIG.in
 +++ b/rpmdb/DB_CONFIG.in
-@@ -4,6 +4,7 @@ set_data_dir		.
- set_create_dir		.
- set_lg_dir		./log
- set_tmp_dir		./tmp
-+set_flags 		db_log_autoremove on
+@@ -4,6 +4,7 @@
+ set_create_dir .
+ set_lg_dir ./log
+ set_tmp_dir ./tmp
++set_flags db_log_autoremove on
  
  # -- thread_count must be >= 8
- set_thread_count	64
+ set_thread_count 64
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch b/meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch
new file mode 100644
index 0000000..90fee35
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch
@@ -0,0 +1,43 @@
+Disable perl-URPM support
+
+This causes a configure failure when perl-URPM is not used.
+
+| configure.ac:1159: required file `perl-URPM/Makefile.PL.in' not found
+| configure.ac:1159: required file `perl-URPM/Makefile.in' not found
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+--- rpm-5.4.8/configure.ac.orig	2012-04-24 09:10:01.856749153 -0500
++++ rpm-5.4.8/configure.ac	2012-04-24 09:10:35.198731504 -0500
+@@ -1149,30 +1149,10 @@
+ AC_SUBST(WITH_PERL_SUBPACKAGE)
+ AC_SUBST(WITH_PERL_LIBS)
+ 
+-dnl # optional Perl-URPM language bindings
++dnl # disable Perl-URPM language bindings
+ WITH_PERL_URPM_SUBDIR=""
+ WITH_PERL_URPM_SUBPACKAGE=0
+ WITH_PERL_URPM_LIBS=""
+-if test ".$WITH_PTHREADS" = .yes; then
+-    WITH_PERL_URPM_LIBS="$LIBS"
+-fi
+-AC_ARG_WITH(perl-urpm, AS_HELP_STRING([--with-perl-urpm], [build with Perl URPM language bindings]), [
+-    if test ".$withval" != .no; then
+-	PERL_URPM_INSTALLDIRS=""
+-	   if test "$withval" == "vendor"; then
+-		    PERL_URPM_INSTALLDIRS="'INSTALLDIRS'	=> 'vendor',"
+-	    fi
+-	    if test "$withval" == "site"; then
+-		    PERL_URPM_INSTALLDIRS="'INSTALLDIRS'     => 'site',"
+-	    fi
+-	    AC_DEFINE_UNQUOTED([PERL_URPM_INSTALLDIRS], [$PERL_URPM_INSTALLDIRS], [Perl install directory (vendor/site)])
+-	    AC_SUBST(PERL_URPM_INSTALLDIRS)
+-        WITH_PERL_URPM_SUBDIR=perl-URPM
+-        WITH_PERL_URPM_SUBPACKAGE=1
+-        AC_CONFIG_FILES([perl-URPM/Makefile.PL])
+-        AC_CONFIG_FILES([perl-URPM/Makefile])
+-    fi
+-])
+ AC_SUBST(WITH_PERL_URPM_SUBDIR)
+ AC_SUBST(WITH_PERL_URPM_SUBPACKAGE)
+ AC_SUBST(WITH_PERL_URPM_LIBS)
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch b/meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
deleted file mode 100644
index f6e5828..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Backport from RPM 5.4.1 CVS, disabled fsync.
-
-Upstream-Status: Backport
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur rpm-5.4.0.orig/CHANGES rpm-5.4.0/CHANGES
---- rpm-5.4.0.orig/CHANGES	2010-12-29 07:51:38.000000000 -0600
-+++ rpm-5.4.0/CHANGES	2011-02-15 20:54:27.021926840 -0600
-@@ -1,4 +1,5 @@
- 5.4.0 -> 5.4.1:
-+    - jbj: remove fsync(2) after file install, its intolerably slow.
- 
- 5.3.7 -> 5.4.0:
-     - jbj: remove markReplacedFiles.
-diff -ur rpm-5.4.0.orig/lib/fsm.c rpm-5.4.0/lib/fsm.c
---- rpm-5.4.0.orig/lib/fsm.c	2009-12-10 12:52:18.000000000 -0600
-+++ rpm-5.4.0/lib/fsm.c	2011-02-15 20:55:04.372938221 -0600
-@@ -1017,7 +1017,17 @@
- 	    (void) fsmNext(fsm, IOSM_NOTIFY);
-     }
- 
-+#ifdef DYING
-+/* Measurements from installing kernel-source package:
-+ * +fsync
-+ *     total:               1      0.000000 MB    640.854524 secs
-+ * +fdatasync
-+ *     total:               1      0.000000 MB    419.983200 secs
-+ * w/o fsync/fdsatasync:
-+ *     total:               1      0.000000 MB     12.492918 secs
-+ */
-     xx = fsync(Fileno(fsm->wfd));
-+#endif
- 
-     if (st->st_size > 0 && (fsm->fdigest || fsm->digest)) {
- 	void * digest = NULL;
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.8.bb
similarity index 91%
rename from meta/recipes-devtools/rpm/rpm_5.4.0.bb
rename to meta/recipes-devtools/rpm/rpm_5.4.8.bb
index 43999e5..9c8189c 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.8.bb
@@ -42,14 +42,14 @@ HOMEPAGE = "http://rpm5.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
+DEPENDS = "beecrypt bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl file"
 extrarpmdeps_virtclass-native = "python-native file-native"
-PR = "r38"
+PR = "r39"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
-SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;extract=rpm-5.4.0.tar.gz \
+SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.8-0.20120401.src.rpm;extract=rpm-5.4.8.tar.gz \
 	   file://rpm-log-auto-rm.patch \
 	   file://rpm-db-reduce.patch \
 	   file://perfile_rpmdeps.sh \
@@ -58,28 +58,21 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://header-include-fix.patch \
 	   file://rpm-platform.patch \
 	   file://rpm-showrc.patch \
-	   file://rpm-nofsync.patch \
 	   file://rpm-solvedb.patch \
 	   file://rpm-tools-mtree-LDFLAGS.patch \
-	   file://fprint-pointer-fix.patch \
 	   file://rpm-fileclass.patch \
 	   file://rpm-canonarch.patch \
 	   file://rpm-no-loopmsg.patch \
 	   file://rpm-scriptletexechelper.patch \
-	   file://fix_for_automake_1.11.2.patch \
 	   file://pythondeps.sh \
 	   file://rpmdeps-oecore.patch \
 	   file://rpm-resolvedep.patch \
 	   file://rpm-respect-arch.patch \
-	   file://rpm_fix_for_automake-1.12.patch \
+	   file://rpm-no-perl-urpm.patch \
 	  "
 
-#	   file://rpm-autoconf.patch \
-#	   file://remove-compiled-tests.patch;apply=no \
-#	  "
-
-SRC_URI[md5sum] = "19c1a7f68d7765eeb7615c9c4e54e380"
-SRC_URI[sha256sum] = "887e76218308b570c33c8c2fb10b5298b3afd5d602860d281befc85357b3b923"
+SRC_URI[md5sum] = "424b60bf2e0a624a218440d943861644"
+SRC_URI[sha256sum] = "56eb5033d4de98c217475fb34d466d551f8912959389e7854a806e2bd9e13380"
 
 inherit autotools gettext
 
@@ -106,13 +99,13 @@ WITH_PYTHON = "	--with-python=${PYTHON_BASEVERSION} \
 # the perl module creation and installation would need to be patched.
 # (currently has host perl contamination issues)
 #WITH_PERL = "	--with-perl --without-perlembed"
-WITH_PERL = "	--without-perl"
+WITH_PERL = "	--without-perl --without-perl-urpm"
 
-WITH_PERL_virtclass-native = " --without-perl"
+WITH_PERL_virtclass-native = " --without-perl --without-perl-urpm"
 
 WITH_DB = "--with-db --with-dbsql --without-db-tools-integrated --without-sqlite"
 
-WITH_CRYPTO = "--with-beecrypt=internal --with-openssl --without-nss --without-gcrypt"
+WITH_CRYPTO = "--with-beecrypt --with-openssl --without-nss --without-gcrypt"
 
 WITH_KEYUTILS = "--without-keyutils"
 WITH_LIBELF = "--with-libelf"
@@ -411,6 +404,25 @@ do_install_append() {
 	rm -f ${D}/${libdir}/rpm/dbconvert.sh
 
 	rm -f ${D}/${libdir}/rpm/libsqldb.*
+
+	# We don't want, nor need the Mandriva multiarch items
+	rm -f ${D}/${bindir}/multiarch-dispatch
+	rm -f ${D}/${bindir}/multiarch-platform
+	rm -f ${D}/${libdir}/rpm/check-multiarch-files
+	rm -f ${D}/${libdir}/rpm/mkmultiarch
+	rm -f ${D}/${includedir}/multiarch-dispatch.h
+
+	rm -f ${D}/${libdir}/rpm/gstreamer.sh
+	rm -f ${D}/${libdir}/rpm/gem_helper.rb
+	rm -f ${D}/${libdir}/rpm/rubygems.rb
+	rm -f ${D}/${libdir}/rpm/kmod-deps.sh
+	rm -f ${D}/${libdir}/rpm/pythoneggs.py
+	rm -f ${D}/${libdir}/rpm/macros.d/kernel
+	rm -f ${D}/${libdir}/rpm/macros.d/gstreamer
+	rm -f ${D}/${libdir}/rpm/bin/mgo
+	rm -f ${D}/${libdir}/rpm/bin/dbconvert
+	rm -f ${D}/${libdir}/rpm/bin/pom2spec
+
 }
 
 do_install_append_virtclass-native() {
diff --git a/meta/recipes-support/db/db_5.1.19.bb b/meta/recipes-support/db/db_5.3.15.bb
similarity index 93%
rename from meta/recipes-support/db/db_5.1.19.bb
rename to meta/recipes-support/db/db_5.3.15.bb
index 7e84646..9d2bbe5 100644
--- a/meta/recipes-support/db/db_5.1.19.bb
+++ b/meta/recipes-support/db/db_5.3.15.bb
@@ -14,15 +14,15 @@ HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
 LICENSE = "Sleepycat"
 VIRTUAL_NAME ?= "virtual/db"
 CONFLICTS = "db3"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.."
 
-SRC_URI[md5sum] = "76fcbfeebfcd09ba0b4d96bfdf8d884d"
-SRC_URI[sha256sum] = "0194d4ca9266ba1a1c0bfbc233b18bfd05f63163453c81ebcdfdc7112d5ac850"
+SRC_URI[md5sum] = "5493fb5f7cc3915887c836b096f18773"
+SRC_URI[sha256sum] = "4f4f7d548984dde3584fcda0e4f96901cb8bafb08033a7781aec64ef2ea1f579"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=86f9294f39f38ef9e89690bcd2320e7a"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=12cc3ff983ed4ecc6cc091370ee4dbc3"
 
 inherit autotools
 
-- 
1.7.3.4



