Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A5609702A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:01:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2014 01:01:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,663,1400050800"; d="scan'208";a="569954767"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.85])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2014 01:01:31 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 11:00:49 +0300
Message-Id: <1405411250-10594-6-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
References: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
Subject: [PATCH 6/9] weston: consider --disable-compat-libs in systemd
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
X-List-Received-Date: Tue, 15 Jul 2014 08:01:50 -0000

Since version 209 of systemd, libsystemd-login has been merged
into libsystemd.so.
This patch handles the case when systemd is built
without --enable-compat-libs (e.g. no libsystemd-login).

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 ...c-consider-disable-compat-libs-in-systemd.patch | 47 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.5.0.bb      |  3 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-configure.ac-consider-disable-compat-libs-in-systemd.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-configure.ac-consider-disable-compat-libs-in-systemd.patch b/meta/recipes-graphics/wayland/weston/0001-configure.ac-consider-disable-compat-libs-in-systemd.patch
new file mode 100644
index 0000000..f195520
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-configure.ac-consider-disable-compat-libs-in-systemd.patch
@@ -0,0 +1,47 @@
+From 2273fb9cfb978c0e0cbb877475462d72d85138da Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Fri, 4 Jul 2014 16:11:19 +0300
+Subject: [PATCH] configure.ac: consider --disable-compat-libs in systemd
+
+Since version 209 of systemd, libsystemd-login has been merged
+into libsystemd.so.
+
+http://lists.freedesktop.org/archives/systemd-devel/2014-February/017146.html
+
+This patch handles the case when systemd is built
+without --enable-compat-libs (e.g. no libsystemd-login).
+
+Upstream-Status: Submitted [wayland-devel]
+
+Signed-off-by: Valentin Popa <valentin.popa@intel.com>
+---
+ configure.ac | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f55cea8..2638d8a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -346,13 +346,15 @@ AS_IF([test "x$enable_resize_optimization" = "xyes"],
+       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
+ 
+ PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd-login >= 198],
+-                  [have_systemd_login=yes], [have_systemd_login=no])
++                  [have_systemd_login_198=yes have_systemd_login_209=no], [
++  PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd >= 209],
++                  [have_systemd_login_209=yes have_systemd_login_198=no], [have_systemd_login_209=no have_systemd_login_198=no])
++])
++AS_IF([test "x$have_systemd_login_198" = "xyes" -o "x$have_systemd_login_209" = "xyes"],
++      [have_systemd_login=yes], [have_systemd_login=no])
+ AS_IF([test "x$have_systemd_login" = "xyes"],
+       [AC_DEFINE([HAVE_SYSTEMD_LOGIN], [1], [Have systemd-login])])
+ AM_CONDITIONAL(HAVE_SYSTEMD_LOGIN, test "x$have_systemd_login" = "xyes")
+-
+-PKG_CHECK_MODULES(SYSTEMD_LOGIN_209, [libsystemd-login >= 209],
+-                  [have_systemd_login_209=yes], [have_systemd_login_209=no])
+ AS_IF([test "x$have_systemd_login_209" = "xyes"],
+       [AC_DEFINE([HAVE_SYSTEMD_LOGIN_209], [1], [Have systemd-login >= 209])])
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/wayland/weston_1.5.0.bb b/meta/recipes-graphics/wayland/weston_1.5.0.bb
index 4a8584f..0c7cb0a 100644
--- a/meta/recipes-graphics/wayland/weston_1.5.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.5.0.bb
@@ -11,7 +11,8 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://disable-wayland-scanner-pkg-check.patch \
            file://make-lcms-explicitly-configurable.patch \
            file://make-libwebp-explicitly-configurable.patch \
-"
+           file://0001-configure.ac-consider-disable-compat-libs-in-systemd.patch"
+
 SRC_URI[md5sum] = "8eb40d230efc2411f083c20656534780"
 SRC_URI[sha256sum] = "06388ba04ac79aa72d685cc1a8e646ddb2b8cfe11fcc742294f9addac48b7684"
 
-- 
1.9.1


