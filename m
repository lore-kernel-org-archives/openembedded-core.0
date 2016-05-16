Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3397327F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:23:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977873572"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 06:23:06 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:49 +0300
Message-Id: <b63ddcdad9483fb148edd2b5fc9f4d9c856112f4.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
References: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463404035.git.jussi.kukkonen@intel.com>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
Subject: [PATCH 12/13] wayland-protocols: Add recipe
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
X-List-Received-Date: Mon, 16 May 2016 13:23:06 -0000

wayland-protocols is a collection of Wayland protocols split
out from weston. It is a build dependency for Weston 1.10.
* Added a patch to enable allarch build.
* Use HTTPS for tarball uri.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../wayland-protocols/dont-use-AC_CANONICAL.patch  | 29 ++++++++++++++++++++++
 .../wayland/wayland-protocols_1.3.bb               | 20 +++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch
 create mode 100644 meta/recipes-graphics/wayland/wayland-protocols_1.3.bb

diff --git a/meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch b/meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch
new file mode 100644
index 0000000..6cc0f3b
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch
@@ -0,0 +1,29 @@
+Check autoconfs $cross_compiling instead as AC_CANONICAL_HOST call
+will fail if the host cpu is not recognised (which can happen when
+e.g. Yocto builds for "allarch").
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Backport [cc276dfa41]
+
+diff --git a/configure.ac b/configure.ac
+index 5b48b1a..3d45a4b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,13 +15,10 @@ AC_CONFIG_MACRO_DIR([m4])
+ 
+ AC_SUBST([WAYLAND_PROTOCOLS_VERSION], [wayland_protocols_version])
+ 
+-AC_CANONICAL_HOST
+-AC_CANONICAL_BUILD
+-
+ AC_ARG_VAR([wayland_scanner], [The wayland-scanner executable])
+ AC_PATH_PROG([wayland_scanner], [wayland-scanner])
+ if test x$wayland_scanner = x; then
+-        if test x$host = x$build; then
++        if test "x$cross_compiling" != "xyes"; then
+                 PKG_CHECK_MODULES(WAYLAND_SCANNER, [wayland-scanner])
+                 wayland_scanner=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
+         else
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.3.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.3.bb
new file mode 100644
index 0000000..86e89b5
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Collection of additional Wayland protocols"
+DESCRIPTION = "Wayland protocols that add functionality not \
+available in the Wayland core protocol. Such protocols either add \
+completely new functionality, or extend the functionality of some other \
+protocol either in Wayland core, or some other protocol in \
+wayland-protocols."
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
+                    file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
+
+SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://dont-use-AC_CANONICAL.patch"
+SRC_URI[md5sum] = "88b5e3dce52908c7e74fad3e2cf8abb0"
+SRC_URI[sha256sum] = "6bcd0633fdf9225ef1c7d2831f542e947f7d79811c79fc37f57b2e5375ded82f"
+
+inherit allarch autotools pkgconfig
+
+PACKAGES = "${PN}"
+FILES_${PN} += "${datadir}/pkgconfig/wayland-protocols.pc"
-- 
2.1.4


