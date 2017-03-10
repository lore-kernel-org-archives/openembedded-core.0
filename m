Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 802017773B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:26:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988232"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:59 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:09 +0200
Message-Id: <b6d2b654a601d53ea4168c2f8d6438ac7be5e10d.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 30/44] byacc: remove the recipe
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:59 -0000

It was used only by rpm5 and will be moved to meta-oe

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/byacc/byacc.inc              |  22 ---
 .../0001-byacc-do-not-reorder-CC-and-CFLAGS.patch  | 161 ---------------------
 meta/recipes-extended/byacc/byacc/byacc-open.patch |  25 ----
 meta/recipes-extended/byacc/byacc_20161202.bb      |  12 --
 .../packagegroup-core-full-cmdline.bb              |   1 -
 5 files changed, 221 deletions(-)
 delete mode 100644 meta/recipes-extended/byacc/byacc.inc
 delete mode 100644 meta/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
 delete mode 100644 meta/recipes-extended/byacc/byacc/byacc-open.patch
 delete mode 100644 meta/recipes-extended/byacc/byacc_20161202.bb

diff --git a/meta/recipes-extended/byacc/byacc.inc b/meta/recipes-extended/byacc/byacc.inc
deleted file mode 100644
index adb07193d73..00000000000
--- a/meta/recipes-extended/byacc/byacc.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Berkeley LALR Yacc parser generator"
-DESCRIPTION = "A parser generator utility that reads a grammar specification from a file and generates an LR(1) \
-parser for it.  The parsers consist of a set of LALR(1) parsing tables and a driver routine written in the C \
-programming language."
-SECTION = "devel"
-LICENSE = "PD"
-
-SRC_URI = "ftp://invisible-island.net/byacc/byacc-${PV}.tgz \
-           file://byacc-open.patch \
-           file://0001-byacc-do-not-reorder-CC-and-CFLAGS.patch"
-
-EXTRA_OECONF += "--program-transform-name='s,^,b,'"
-
-BBCLASSEXTEND = "native"
-
-inherit autotools
-
-do_configure() {
-	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
-	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-	oe_runconf
-}
diff --git a/meta/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch b/meta/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
deleted file mode 100644
index 7cd2510c8ed..00000000000
--- a/meta/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-Subject: byacc: do not reorder $CC and $CFLAGS
-
-byacc tries to process $CC and decide which part should belong to CC and which
-part should below to CFLAGS and then do reordering. It doesn't make much sense
-for OE. And it doesn't do its work correctly. Some options are dropped.
-
-Delete all these stuff so that we could have all options we need.
-
-Upstream-Status: Inappropriate [OE Specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- aclocal.m4 |   1 -
- configure  | 119 -------------------------------------------------------------
- 2 files changed, 120 deletions(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index 917a848..62ef241 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -1021,7 +1021,6 @@ CF_GCC_VERSION
- CF_ACVERSION_CHECK(2.52,
- 	[AC_PROG_CC_STDC],
- 	[CF_ANSI_CC_REQD])
--CF_CC_ENV_FLAGS
- ])dnl
- dnl ---------------------------------------------------------------------------
- dnl CF_PROG_GROFF version: 2 updated: 2015/07/04 11:16:27
-diff --git a/configure b/configure
-index 9707e50..4f0497c 100755
---- a/configure
-+++ b/configure
-@@ -1946,125 +1946,6 @@ esac
- # This should have been defined by AC_PROG_CC
- : ${CC:=cc}
- 
--echo "$as_me:1949: checking \$CC variable" >&5
--echo $ECHO_N "checking \$CC variable... $ECHO_C" >&6
--case "$CC" in
--(*[\ \	]-*)
--	echo "$as_me:1953: result: broken" >&5
--echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:1955: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
--echo "$as_me: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
--	# humor him...
--	cf_flags=`echo "$CC" | sed -e 's/^.*[ 	]\(-[^ 	]\)/\1/'`
--	CC=`echo "$CC " | sed -e 's/[ 	]-[^ 	].*$//' -e 's/[ 	]*$//'`
--	for cf_arg in $cf_flags
--	do
--		case "x$cf_arg" in
--		(x-[IUDfgOW]*)
--
--cf_fix_cppflags=no
--cf_new_cflags=
--cf_new_cppflags=
--cf_new_extra_cppflags=
--
--for cf_add_cflags in $cf_flags
--do
--case $cf_fix_cppflags in
--(no)
--	case $cf_add_cflags in
--	(-undef|-nostdinc*|-I*|-D*|-U*|-E|-P|-C)
--		case $cf_add_cflags in
--		(-D*)
--			cf_tst_cflags=`echo ${cf_add_cflags} |sed -e 's/^-D[^=]*='\''\"[^"]*//'`
--
--			test "x${cf_add_cflags}" != "x${cf_tst_cflags}" \
--				&& test -z "${cf_tst_cflags}" \
--				&& cf_fix_cppflags=yes
--
--			if test $cf_fix_cppflags = yes ; then
--				cf_new_extra_cppflags="$cf_new_extra_cppflags $cf_add_cflags"
--				continue
--			elif test "${cf_tst_cflags}" = "\"'" ; then
--				cf_new_extra_cppflags="$cf_new_extra_cppflags $cf_add_cflags"
--				continue
--			fi
--			;;
--		esac
--		case "$CPPFLAGS" in
--		(*$cf_add_cflags)
--			;;
--		(*)
--			case $cf_add_cflags in
--			(-D*)
--				cf_tst_cppflags=`echo "x$cf_add_cflags" | sed -e 's/^...//' -e 's/=.*//'`
--
--CPPFLAGS=`echo "$CPPFLAGS" | \
--	sed	-e 's/-[UD]'"$cf_tst_cppflags"'\(=[^ 	]*\)\?[ 	]/ /g' \
--		-e 's/-[UD]'"$cf_tst_cppflags"'\(=[^ 	]*\)\?$//g'`
--
--				;;
--			esac
--			cf_new_cppflags="$cf_new_cppflags $cf_add_cflags"
--			;;
--		esac
--		;;
--	(*)
--		cf_new_cflags="$cf_new_cflags $cf_add_cflags"
--		;;
--	esac
--	;;
--(yes)
--	cf_new_extra_cppflags="$cf_new_extra_cppflags $cf_add_cflags"
--
--	cf_tst_cflags=`echo ${cf_add_cflags} |sed -e 's/^[^"]*"'\''//'`
--
--	test "x${cf_add_cflags}" != "x${cf_tst_cflags}" \
--		&& test -z "${cf_tst_cflags}" \
--		&& cf_fix_cppflags=no
--	;;
--esac
--done
--
--if test -n "$cf_new_cflags" ; then
--
--	CFLAGS="$CFLAGS $cf_new_cflags"
--fi
--
--if test -n "$cf_new_cppflags" ; then
--
--	CPPFLAGS="$CPPFLAGS $cf_new_cppflags"
--fi
--
--if test -n "$cf_new_extra_cppflags" ; then
--
--	EXTRA_CPPFLAGS="$cf_new_extra_cppflags $EXTRA_CPPFLAGS"
--fi
--
--			;;
--		(*)
--			CC="$CC $cf_arg"
--			;;
--		esac
--	done
--	test -n "$verbose" && echo "	resulting CC: '$CC'" 1>&6
--
--echo "${as_me:-configure}:2051: testing resulting CC: '$CC' ..." 1>&5
--
--	test -n "$verbose" && echo "	resulting CFLAGS: '$CFLAGS'" 1>&6
--
--echo "${as_me:-configure}:2055: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
--
--	test -n "$verbose" && echo "	resulting CPPFLAGS: '$CPPFLAGS'" 1>&6
--
--echo "${as_me:-configure}:2059: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
--
--	;;
--(*)
--	echo "$as_me:2063: result: ok" >&5
--echo "${ECHO_T}ok" >&6
--	;;
--esac
--
- echo "$as_me:2068: checking whether ${MAKE-make} sets \${MAKE}" >&5
- echo $ECHO_N "checking whether ${MAKE-make} sets \${MAKE}... $ECHO_C" >&6
- set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,./+-,__p_,'`
--- 
-2.8.3
-
diff --git a/meta/recipes-extended/byacc/byacc/byacc-open.patch b/meta/recipes-extended/byacc/byacc/byacc-open.patch
deleted file mode 100644
index 005831130b3..00000000000
--- a/meta/recipes-extended/byacc/byacc/byacc-open.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Ubuntu defaults to passing _FORTIFY_SOURCE=2 which breaks byacc as it doesn't
-pass enough arguments to open():
-
- inlined from 'open_tmpfile' at byacc-20150711/main.c:588:5:
- /usr/include/x86_64-linux-gnu/bits/fcntl2.h:50:24: error: call to '__open_missing_mode' declared with attribute error:
- open with O_CREAT in second argument needs 3 arguments
-
-Add a mode of 0666 to fix this.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/main.c b/main.c
-index 620ce3f..82071a4 100644
---- a/main.c
-+++ b/main.c
-@@ -526,7 +526,7 @@ my_mkstemp(char *temp)
-     }
-     if ((name = tempnam(dname, fname)) != 0)
-     {
--	fd = open(name, O_CREAT | O_EXCL | O_RDWR);
-+      fd = open(name, O_CREAT | O_EXCL | O_RDWR, 0666);
- 	strcpy(temp, name);
-     }
-     else
diff --git a/meta/recipes-extended/byacc/byacc_20161202.bb b/meta/recipes-extended/byacc/byacc_20161202.bb
deleted file mode 100644
index 755f8ab515c..00000000000
--- a/meta/recipes-extended/byacc/byacc_20161202.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-# Sigh. This is one of those places where everyone licenses it differently. Someone
-# even apply UCB to it (Free/Net/OpenBSD). The maintainer states that:
-# "I've found no reliable source which states that byacc must bear a UCB copyright."
-# Setting to PD as this is what the upstream has it as.
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=74533d32ffd38bca4cbf1f1305f8bc60"
-require byacc.inc
-
-
-SRC_URI[md5sum] = "48ef38447f2cc864c70ef864b26cf817"
-SRC_URI[sha256sum] = "30dc58cfcdb708eea7ba022db29b41d2d392f20727491b956954366f2f2117f0"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index d8975f21572..9379fb91998 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -110,7 +110,6 @@ RDEPENDS_packagegroup-core-full-cmdline-extended = "\
     "
 
 RDEPENDS_packagegroup-core-full-cmdline-dev-utils = "\
-    byacc \
     diffutils \
     m4 \
     make \
-- 
2.11.0


