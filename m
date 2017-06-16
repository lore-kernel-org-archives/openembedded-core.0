Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EA2D47845C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279560"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:38 +0300
Message-Id: <e0d056271df37a77ebd8224522b59f86c11579ac.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/32] autogen-native: remove the recipe
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:26 -0000

With grub no longer requiring it, there's nothing else in oe-core or meta-oe
that does.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../autogen/autogen-native_5.18.12.bb              | 40 ----------------------
 ...pts.m4-regenerate-it-from-config-libopts..patch | 39 ---------------------
 ...2-autoopts-mk-tpl-config.sh-fix-perl-path.patch | 32 -----------------
 .../fix-script-err-when-processing-libguile.patch  | 37 --------------------
 .../autogen/autogen/increase-timeout-limit.patch   | 30 ----------------
 ...ig.sh-force-exit-value-to-be-0-in-subproc.patch | 30 ----------------
 6 files changed, 208 deletions(-)
 delete mode 100644 meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
 delete mode 100644 meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
 delete mode 100644 meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch
 delete mode 100644 meta/recipes-devtools/autogen/autogen/fix-script-err-when-processing-libguile.patch
 delete mode 100644 meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch
 delete mode 100644 meta/recipes-devtools/autogen/autogen/mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
deleted file mode 100644
index 853477cf7c1..00000000000
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "Automated text and program generation tool"
-DESCRIPTION = "AutoGen is a tool designed to simplify the creation and\
- maintenance of programs that contain large amounts of repetitious text.\
- It is especially valuable in programs that have several blocks of text\
- that must be kept synchronized."
-HOMEPAGE = "http://www.gnu.org/software/autogen/"
-SECTION = "devel"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
-           file://increase-timeout-limit.patch \
-           file://mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch \
-           file://fix-script-err-when-processing-libguile.patch \
-           file://0001-config-libopts.m4-regenerate-it-from-config-libopts..patch \
-           file://0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch \
-"
-
-SRC_URI[md5sum] = "551d15ccbf5b5fc5658da375d5003389"
-SRC_URI[sha256sum] = "805c20182f3cb0ebf1571d3b01972851c56fb34348dfdc38799fd0ec3b2badbe"
-
-UPSTREAM_CHECK_URI = "http://ftp.gnu.org/gnu/autogen/"
-UPSTREAM_CHECK_REGEX = "rel(?P<pver>\d+(\.\d+)+)/"
-
-DEPENDS = "guile-native libtool-native libxml2-native"
-
-inherit autotools texinfo native pkgconfig
-
-# autogen-native links against libguile which may have been relocated with sstate
-# these environment variables ensure there isn't a relocation issue
-export GUILE_LOAD_PATH = "${STAGING_DATADIR_NATIVE}/guile/2.0"
-export GUILE_LOAD_COMPILED_PATH = "${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache"
-
-export POSIX_SHELL = "/usr/bin/env sh"
-
-do_install_append () {
-	create_wrapper ${D}/${bindir}/autogen \
-		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
-		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
-}
diff --git a/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch b/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
deleted file mode 100644
index a14018e339a..00000000000
--- a/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 45040e7d268329ebc40e6cb237c64a6637cfab5c Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 13 Mar 2017 20:22:10 -0700
-Subject: [PATCH] config/libopts.m4: regenerate it from config/libopts.def
-
-It was out of date compared to config/libopts.def, so regenerate it via
-"autogen config/libopts.def" command.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- config/libopts.m4 | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/config/libopts.m4 b/config/libopts.m4
-index c7ba4f3..51e6a39 100644
---- a/config/libopts.m4
-+++ b/config/libopts.m4
-@@ -2,7 +2,7 @@ dnl  -*- buffer-read-only: t -*- vi: set ro:
- dnl
- dnl DO NOT EDIT THIS FILE   (libopts.m4)
- dnl
--dnl It has been AutoGen-ed
-+dnl It has been AutoGen-ed  March 13, 2017 at 08:21:21 PM by AutoGen 5.18
- dnl From the definitions    libopts.def
- dnl and the template file   conftest.tpl
- dnl
-@@ -114,6 +114,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
-   AC_PROG_SED
-   [while :
-   do
-+      test -x "$POSIX_SHELL" && break
-       POSIX_SHELL=`which bash`
-       test -x "$POSIX_SHELL" && break
-       POSIX_SHELL=`which dash`
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch b/meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch
deleted file mode 100644
index d5fe143ce44..00000000000
--- a/meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9f69f3f5ef22bf1bcffb0e651efc260889cfaa46 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 13 Mar 2017 20:33:30 -0700
-Subject: [PATCH] autoopts/mk-tpl-config.sh: fix perl path
-
-Use "which perl" as shebang doesn't work when it is longer than
-BINPRM_BUF_SIZE which is 128 usually. So use "/usr/bin/env perl" to
-instead of.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- autoopts/mk-tpl-config.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/autoopts/mk-tpl-config.sh b/autoopts/mk-tpl-config.sh
-index 093e808..8dfc6dd 100755
---- a/autoopts/mk-tpl-config.sh
-+++ b/autoopts/mk-tpl-config.sh
-@@ -98,7 +98,7 @@ fix_scripts() {
-         st=`sed 1q $f`
- 
-         case "$st" in
--        *perl ) echo '#!' `which perl`
-+        *perl ) echo '#!/usr/bin/env perl'
-                  sed 1d $f
-                  ;;
- 
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/autogen/autogen/fix-script-err-when-processing-libguile.patch b/meta/recipes-devtools/autogen/autogen/fix-script-err-when-processing-libguile.patch
deleted file mode 100644
index 694a3953eac..00000000000
--- a/meta/recipes-devtools/autogen/autogen/fix-script-err-when-processing-libguile.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-autogen-native: fix script err when processing libguile
-
-do_configure for autogen will fail if project directory path
-contains '-I' character, which is caused by the unsuitable sed
-script when processing libguile.
-
-Upstream-Status: Pending
-
-Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
-diff --git a/config/ag_macros.m4 b/config/ag_macros.m4
-index 58186b6..58ed2ad 100644
---- a/config/ag_macros.m4
-+++ b/config/ag_macros.m4
-@@ -32,7 +32,7 @@ AC_DEFUN([INVOKE_AG_MACROS_LAST],[
-   GUILE_FLAGS
-   [ag_gv=`gdir=\`pkg-config --cflags-only-I \
-   guile-${GUILE_EFFECTIVE_VERSION} | \
--  sed 's/-I *//;s/ *-I.*/ /g'\`
-+  sed 's/ *-I *\// \//g'\`
-   for d in $gdir
-   do  test -f "$d/libguile/version.h" && gdir=$d && break
-   done
-diff --git a/config/misc.def b/config/misc.def
-index 490d361..6e183ef 100644
---- a/config/misc.def
-+++ b/config/misc.def
-@@ -342,7 +342,7 @@ do-always = <<- _END_ALWAYS_
- 	GUILE_FLAGS
- 	[ag_gv=`gdir=\`pkg-config --cflags-only-I \
- 			guile-${GUILE_EFFECTIVE_VERSION} | \
--			sed 's/-I *//;s/ *-I.*/ /g'\`
-+			sed 's/ *-I *\// \//g'\`
- 		test -z "$gdir" && gdir=/usr/include
- 		for d in $gdir
- 		do  test -f "$d/libguile/version.h" && gdir=$d && break
diff --git a/meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch b/meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch
deleted file mode 100644
index 9efd7e5587b..00000000000
--- a/meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Subject: [PATCH] autogen: increase timeout limit for shell commands
-
-On some overloaded hosts, shell commands of autogen may can not
-finish in 5 secs. This has caused many build failures, so increase
-the timeout limit to fix this.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
----
- configure.ac |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 58a848b..170dd9e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -178,9 +178,9 @@ time_delta=`expr ${config_end_time} - ${config_start_time} 2>/dev/null`
- if test -z "${AG_TIMEOUT}"
- then
-   if test -z "${time_delta}"
--  then time_delta=10
--  elif test ${time_delta} -lt 5
--  then time_delta=5 ; fi
-+  then time_delta=60
-+  elif test ${time_delta} -lt 30
-+  then time_delta=30 ; fi
- 
-   AG_TIMEOUT=${time_delta}
- fi
diff --git a/meta/recipes-devtools/autogen/autogen/mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch b/meta/recipes-devtools/autogen/autogen/mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch
deleted file mode 100644
index e56da7b1da7..00000000000
--- a/meta/recipes-devtools/autogen/autogen/mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Pending
-
-mk-tpl-config.sh: force exit value to be 0 in subprocess
-
-The return value of statement list=`<subcommands>` is the exit value of the
-subcommands. So if the subcommands fails, the compilation fails. This is obviously
-not intended. In the normal case, we expect the grep command to fail as there should
-be no 'noreturn' word in the libguile files.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- autoopts/mk-tpl-config.sh |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/autoopts/mk-tpl-config.sh b/autoopts/mk-tpl-config.sh
-index 926f5ab..6b4a0fb 100755
---- a/autoopts/mk-tpl-config.sh
-+++ b/autoopts/mk-tpl-config.sh
-@@ -202,7 +202,7 @@ fix_guile() {
- 
-     list=`set +e ; exec 2>/dev/null
-         find ${libguiledir}/libguile* -type f | \
--            xargs grep -l -E '\<noreturn\>'`
-+            xargs grep -l -E '\<noreturn\>' ; exit 0`
- 
-     test -z "$list" && exit 0
- 
--- 
-1.7.9.5
-
-- 
2.11.0


