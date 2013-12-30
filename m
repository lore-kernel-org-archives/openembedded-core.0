Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA006B58D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 02:00:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBU20PsV021068
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 18:00:25 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 29 Dec 2013 18:00:25 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Dec 2013 18:02:27 +0800
Message-ID: <8b2f4049b5e5602f931fc8ec3632c975ea097532.1388397582.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388397582.git.liezhi.yang@windriver.com>
References: <cover.1388397582.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] autogen-native: upgrade to 5.18.2
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
X-List-Received-Date: Mon, 30 Dec 2013 02:00:24 -0000
Content-Type: text/plain

* Upgrade from 5.17.4 to 5.18.2
* Rename files -> autogen

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...n-native_5.17.4.bb => autogen-native_5.18.2.bb} |  6 +--
 .../autogen/{files => autogen}/guile.patch         | 48 +++++++++++++---------
 .../increase-timeout-limit.patch                   |  0
 3 files changed, 31 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/autogen/{autogen-native_5.17.4.bb => autogen-native_5.18.2.bb} (88%)
 rename meta/recipes-devtools/autogen/{files => autogen}/guile.patch (89%)
 rename meta/recipes-devtools/autogen/{files => autogen}/increase-timeout-limit.patch (100%)

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
similarity index 88%
rename from meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
rename to meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
index 28d82b0..c7950c3 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
@@ -6,14 +6,14 @@ DESCRIPTION = "AutoGen is a tool designed to simplify the creation and\
 HOMEPAGE = "http://www.gnu.org/software/autogen/"
 SECTION = "devel"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://guile.patch \
            file://increase-timeout-limit.patch"
 
-SRC_URI[md5sum] = "09f074cba57610bf4ef1147e01c8ae90"
-SRC_URI[sha256sum] = "cd2585f4794d0e9d7f2cb0b9af4f2bd429946e718473edf1cf8c49f081ca71ed"
+SRC_URI[md5sum] = "117c4bc5613c57e1b97d760a5d1910a4"
+SRC_URI[sha256sum] = "cc2702dec21ba5b01144865163f6d1a54268d2b72aafc5520ad0e0cb57104068"
 
 DEPENDS = "guile-native libtool-native libxml2-native"
 
diff --git a/meta/recipes-devtools/autogen/files/guile.patch b/meta/recipes-devtools/autogen/autogen/guile.patch
similarity index 89%
rename from meta/recipes-devtools/autogen/files/guile.patch
rename to meta/recipes-devtools/autogen/autogen/guile.patch
index 8a77dba..332e5aa 100644
--- a/meta/recipes-devtools/autogen/files/guile.patch
+++ b/meta/recipes-devtools/autogen/autogen/guile.patch
@@ -1,14 +1,24 @@
-Disable the autoconf macros that use dpkg (!) and guile-config to determine what 
-version and where guile is installed, and just use pkg-config directly (guile-config is a deprecated wrapper around pkg-config). 
- 
- Signed-off-by: Ross Burton <ross.burton@intel.com> 
- Upstream-Status: Pending (should be submitted)
+remove dpkg and guile-config
+
+Disable the autoconf macros that use dpkg (!) and guile-config to
+determine what version and where guile is installed, and just use
+pkg-config directly (guile-config is a deprecated wrapper around
+pkg-config).
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Uprade to  5.18.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Upstream-Status: Pending [should be submitted]
+---
+ config/ag_macros.m4 | 151 +++-------------------------------------------------
+ 1 file changed, 8 insertions(+), 143 deletions(-)
 
 diff --git a/config/ag_macros.m4 b/config/ag_macros.m4
-index 9914a65..b6db97a 100644
+index c05073e..a8e96da 100644
 --- a/config/ag_macros.m4
 +++ b/config/ag_macros.m4
-@@ -175,123 +175,12 @@ return 0;],
+@@ -180,118 +180,13 @@ return 0;],
  
  
  AC_DEFUN([AG_WITHLIB_GUILE],[
@@ -26,7 +36,12 @@ index 9914a65..b6db97a 100644
 -    ag_cv_with_libguile_cflags=no
 -    ag_cv_with_libguile_libs=no
 -  else
--
++  PKG_PROG_PKG_CONFIG
++  PKG_CHECK_MODULES(LIBGUILE, [guile-2.0])
++  case "${LIBGUILE_LIBS}" in *-L* )
++    LIBGUILE_PATH=`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L[   ]*//;s/[  ].*//'`
++  ;; * ) LIBGUILE_PATH='' ;; esac
+ 
 -  AC_ARG_WITH([libguile-cflags],
 -    AS_HELP_STRING([--with-libguile-cflags], [libguile compile flags]),
 -    [ag_cv_with_libguile_cflags=${with_libguile_cflags}],
@@ -109,14 +124,10 @@ index 9914a65..b6db97a 100644
 -  AC_MSG_RESULT([${ag_cv_with_libguile}])
 -    AC_SUBST([LIBGUILE_CFLAGS])
 -    AC_SUBST([LIBGUILE_LIBS])
--    AC_SUBST([LIBGUILE_PATH])
 -  if test "X${ag_cv_with_libguile}" != Xno
 -  then[
 -      LIBGUILE_CFLAGS="${ag_cv_with_libguile_cflags}"
--      LIBGUILE_LIBS="${ag_cv_with_libguile_libs}"
--      case "${LIBGUILE_LIBS}" in *-L* )
--        LIBGUILE_PATH=`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L[ 	]*//;s/[ 	].*//'`
--      ;; * ) LIBGUILE_PATH='' ;; esac]
+-      LIBGUILE_LIBS="${ag_cv_with_libguile_libs}"]
 -          CPPFLAGS="@S|@{ag_save_CPPFLAGS}"
 -      LIBS="@S|@{ag_save_LIBS}"
 -  else
@@ -124,20 +135,14 @@ index 9914a65..b6db97a 100644
 -    LIBS="${ag_save_LIBS}"
 -      LIBGUILE_CFLAGS=''
 -      LIBGUILE_LIBS=''
--      LIBGUILE_PATH=''
 -      AC_MSG_ERROR([Cannot find libguile.  libguile is required.  Perhaps you need to install guile-devel?])
 -  fi
-+  PKG_PROG_PKG_CONFIG
-+  PKG_CHECK_MODULES(LIBGUILE, [guile-2.0])
-+  case "${LIBGUILE_LIBS}" in *-L* )
-+    LIBGUILE_PATH=`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L[   ]*//;s/[  ].*//'`
-+  ;; * ) LIBGUILE_PATH='' ;; esac
    AC_SUBST([AG_GUILE])
 -
  ]) # end of AC_DEFUN of AG_WITHLIB_GUILE
  
  
-@@ -311,40 +200,10 @@ AC_DEFUN([AG_WITHCONF_GUILE_VER],[
+@@ -311,40 +206,10 @@ AC_DEFUN([AG_WITHCONF_GUILE_VER],[
  
  
  AC_DEFUN([AG_TEST_GUILE_VERSION],[
@@ -181,3 +186,6 @@ index 9914a65..b6db97a 100644
    AC_MSG_RESULT([${ag_cv_test_guile_version}])
    if test "X${ag_cv_test_guile_version}" != Xno
    then
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/autogen/files/increase-timeout-limit.patch b/meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch
similarity index 100%
rename from meta/recipes-devtools/autogen/files/increase-timeout-limit.patch
rename to meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch
-- 
1.8.3.1


