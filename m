Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQL-00047i-CL
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="154476589"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2012 16:36:59 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbClJ006507 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:13 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbCCc006506
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:12 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:36:49 -0700
Message-Id: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
MIME-Version: 1.0
Subject: [Consolidated Pull 01/22] systemtap: Unbreak build for systems with nss headers installed
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

* discussed on [1]
* patch sent to systemtap [2]

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-June/023377.html
[2] http://sourceware.org/ml/systemtap/2012-q2/msg00202.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 ...prun-configure.ac-support-without-nss-for.patch |   50 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   10 +---
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 3 files changed, 54 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch b/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
new file mode 100644
index 0000000..fbe7b70
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
@@ -0,0 +1,50 @@
+From fa81ccd4f92e5cb15a11a81a7e656bfe01745afb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 5 Jun 2012 10:22:23 +0200
+Subject: [PATCH] runtime/staprun/configure.ac: support --without-nss for
+ staprun
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream status: pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ runtime/staprun/configure.ac |   20 +++++++++++++++-----
+ 1 files changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/runtime/staprun/configure.ac b/runtime/staprun/configure.ac
+index 8fd1b42..7b05f73 100644
+--- a/runtime/staprun/configure.ac
++++ b/runtime/staprun/configure.ac
+@@ -67,11 +67,21 @@ AS_IF([test "x$enable_sdt_probes" != xno], [
+             [Define to 1 to enable process.mark probes in staprun, stapio.])
+ ])
+ 
+-PKG_CHECK_MODULES([nss], [nss >= 3], [have_nss=yes], [have_nss=no])
+-AM_CONDITIONAL([HAVE_NSS], [test $have_nss = yes])
+-AS_IF([test $have_nss = yes], [
+-  AC_DEFINE([HAVE_NSS], [1], [Define to 1 if you have the nss libraries.])
+-])
++dnl See if we have the nss/nspr headers and libraries
++AC_ARG_WITH([nss],
++  AS_HELP_STRING([--without-nss],
++    [Do not use NSS even if present]))
++
++AS_IF([test "x$with_nss" != "xno"], [
++  PKG_CHECK_MODULES([nss], [nss >= 3],
++    [have_nss=yes
++     AC_DEFINE([HAVE_NSS], [1], [Define to 1 if you have the nss libraries.])
++    ], [have_nss=no])
++], [have_nss=no])
++
++AM_CONDITIONAL([HAVE_NSS], [test "${have_nss}" = "yes"])
++
++
+ AC_ARG_ENABLE([nls], [AS_HELP_STRING([--enable-nls], [enable translating program messages])])
+ AS_IF([test "x$enable_nls" != xno], [
+ AC_DEFINE([ENABLE_NLS], [1], [Define to 1 if program messages should be translated.])
+-- 
+1.7.6.5
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 4d340fc..7ed5fcd 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,19 +6,15 @@ DEPENDS = "elfutils sqlite3 systemtap-native"
 DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
 DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
 
-PR = "r4"
+PR = "r5"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
 export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
-	     ac_cv_file__usr_include_nss=no \
-	     ac_cv_file__usr_include_nss3=no \
-	     ac_cv_file__usr_include_nspr=no \
-	     ac_cv_file__usr_include_nspr4=no \
-	     ac_cv_file__usr_include_avahi_client=no \
-	     ac_cv_file__usr_include_avahi_common=no "
+            --without-nss --without-avahi \
+            --disable-server --disable-grapher "
 
 STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 9f4feee..5f2987b 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,6 +7,7 @@ PV = "1.7+git${SRCPV}"
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
            file://docproc-build-fix.patch \
            file://systemtap_fix_for_automake_1.12.patch \
+           file://runtime-staprun-configure.ac-support-without-nss-for.patch \
           "
 
 FILESPATH = "${FILE_DIRNAME}/systemtap"
-- 
1.7.5.4



