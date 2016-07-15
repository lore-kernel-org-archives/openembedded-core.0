Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BF4F0606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:41:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2016 03:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,367,1464678000"; d="scan'208";a="1017432527"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2016 03:41:51 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 13:41:40 +0300
Message-Id: <5370c4cd06d5adfa68cf7ed2f577a7a1b3df4c4c.1468578590.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
References: <8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468578590.git.jussi.kukkonen@intel.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/8] wayland-protocols: Upgrade 1.3 -> 1.4
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
X-List-Received-Date: Fri, 15 Jul 2016 10:41:51 -0000

Remove backported patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../wayland-protocols/dont-use-AC_CANONICAL.patch  | 29 ----------------------
 ...d-protocols_1.3.bb => wayland-protocols_1.4.bb} |  6 ++---
 2 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.3.bb => wayland-protocols_1.4.bb} (80%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch b/meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch
deleted file mode 100644
index 6cc0f3b..0000000
--- a/meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Check autoconfs $cross_compiling instead as AC_CANONICAL_HOST call
-will fail if the host cpu is not recognised (which can happen when
-e.g. Yocto builds for "allarch").
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Backport [cc276dfa41]
-
-diff --git a/configure.ac b/configure.ac
-index 5b48b1a..3d45a4b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -15,13 +15,10 @@ AC_CONFIG_MACRO_DIR([m4])
- 
- AC_SUBST([WAYLAND_PROTOCOLS_VERSION], [wayland_protocols_version])
- 
--AC_CANONICAL_HOST
--AC_CANONICAL_BUILD
--
- AC_ARG_VAR([wayland_scanner], [The wayland-scanner executable])
- AC_PATH_PROG([wayland_scanner], [wayland-scanner])
- if test x$wayland_scanner = x; then
--        if test x$host = x$build; then
-+        if test "x$cross_compiling" != "xyes"; then
-                 PKG_CHECK_MODULES(WAYLAND_SCANNER, [wayland-scanner])
-                 wayland_scanner=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
-         else
--- 
-cgit v0.10.2
-
diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.3.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.4.bb
similarity index 80%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.3.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.4.bb
index 86e89b5..fcc156f 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.3.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.4.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           file://dont-use-AC_CANONICAL.patch"
-SRC_URI[md5sum] = "88b5e3dce52908c7e74fad3e2cf8abb0"
-SRC_URI[sha256sum] = "6bcd0633fdf9225ef1c7d2831f542e947f7d79811c79fc37f57b2e5375ded82f"
+           "
+SRC_URI[md5sum] = "fd8089abf13a1d04e4baa6509ee72baf"
+SRC_URI[sha256sum] = "014a9a23c21ed14f49b1005b3e8efa66d6337d4ceafc97f7b0d6707e7e3df572"
 
 inherit allarch autotools pkgconfig
 
-- 
2.1.4


