Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5055A71A92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 10:58:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 11 Oct 2016 03:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,329,1473145200"; d="scan'208";a="1063245663"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 11 Oct 2016 03:58:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 13:58:02 +0300
Message-Id: <1476183482-28112-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1476171581-17393-1-git-send-email-jussi.kukkonen@intel.com>
References: <1476171581-17393-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [PATCH] vte: Build without vala by default
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
X-List-Received-Date: Tue, 11 Oct 2016 10:58:09 -0000

vala.bbclass DEPENDS on vala and vala-native: Drop the inherit so
that these dependencies can be added on-demand based on vte
PACKAGECONFIG. Add relevant items from vala class into the recipe.

Add copy of vapigen.m4 so building without vala actually succeeds.

Make building without vala the default PACKAGECONFIG.

Fixes [YOCTO #10386].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes since the earlier vte patch:
 * Make it clear this changes default to "without vala"
 * Remove some lines copied from vala.bbclass that are not actually
   used in vte
 * Fix (unrelated) girepository-1.0/Vte-2.91.typelib packaging


Original comment follows:

This patch is performance-driven: it shaved 0.7% from
core-image-sato build time (3.5 mins user time) and
0.8% (270MB) from TMPDIR size.

Patch is also quite ugly. Alternative ways to achieve the same will
be appreciated.

Thanks,
 Jussi


 .../vte/vte/0001-Add-m4-vapigen.m4.patch           | 119 +++++++++++++++++++++
 meta/recipes-support/vte/vte_0.44.2.bb             |  25 ++++-
 2 files changed, 139 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/0001-Add-m4-vapigen.m4.patch

diff --git a/meta/recipes-support/vte/vte/0001-Add-m4-vapigen.m4.patch b/meta/recipes-support/vte/vte/0001-Add-m4-vapigen.m4.patch
new file mode 100644
index 0000000..1c5630e
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-Add-m4-vapigen.m4.patch
@@ -0,0 +1,119 @@
+From 08ca1c48b25c332b75bba2a6b5d757da006e955b Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 7 Oct 2016 16:27:57 +0300
+Subject: [PATCH] Add m4/vapigen.m4
+
+Building without vala will fail if we don't have a vapigen.m4.
+
+Upstream-Status: Pending
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ m4/vapigen.m4 | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 96 insertions(+)
+ create mode 100644 m4/vapigen.m4
+
+diff --git a/m4/vapigen.m4 b/m4/vapigen.m4
+new file mode 100644
+index 0000000..f2df12f
+--- /dev/null
++++ b/m4/vapigen.m4
+@@ -0,0 +1,96 @@
++dnl vapigen.m4
++dnl
++dnl Copyright 2012 Evan Nemerson
++dnl
++dnl This library is free software; you can redistribute it and/or
++dnl modify it under the terms of the GNU Lesser General Public
++dnl License as published by the Free Software Foundation; either
++dnl version 2.1 of the License, or (at your option) any later version.
++dnl
++dnl This library is distributed in the hope that it will be useful,
++dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
++dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++dnl Lesser General Public License for more details.
++dnl
++dnl You should have received a copy of the GNU Lesser General Public
++dnl License along with this library; if not, write to the Free Software
++dnl Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
++
++# VAPIGEN_CHECK([VERSION], [API_VERSION], [FOUND-INTROSPECTION], [DEFAULT])
++# --------------------------------------
++# Check vapigen existence and version
++#
++# See http://live.gnome.org/Vala/UpstreamGuide for detailed documentation
++AC_DEFUN([VAPIGEN_CHECK],
++[
++  AC_BEFORE([GOBJECT_INTROSPECTION_CHECK],[$0])
++  AC_BEFORE([GOBJECT_INTROSPECTION_REQUIRE],[$0])
++
++  AC_ARG_ENABLE([vala],
++    [AS_HELP_STRING([--enable-vala[=@<:@no/auto/yes@:>@]],[build Vala bindings @<:@default=]ifelse($4,,auto,$4)[@:>@])],,[
++      AS_IF([test "x$4" = "x"], [
++          enable_vala=auto
++        ], [
++          enable_vala=$4
++        ])
++    ])
++
++  AS_CASE([$enable_vala], [no], [enable_vala=no],
++      [yes], [
++        AS_IF([test "x$3" != "xyes" -a "x$found_introspection" != "xyes"], [
++            AC_MSG_ERROR([Vala bindings require GObject Introspection])
++          ])
++      ], [auto], [
++        AS_IF([test "x$3" != "xyes" -a "x$found_introspection" != "xyes"], [
++            enable_vala=no
++          ])
++      ], [
++        AC_MSG_ERROR([Invalid argument passed to --enable-vala, should be one of @<:@no/auto/yes@:>@])
++      ])
++
++  AS_IF([test "x$2" = "x"], [
++      vapigen_pkg_name=vapigen
++    ], [
++      vapigen_pkg_name=vapigen-$2
++    ])
++  AS_IF([test "x$1" = "x"], [
++      vapigen_pkg="$vapigen_pkg_name"
++    ], [
++      vapigen_pkg="$vapigen_pkg_name >= $1"
++    ])
++
++  PKG_PROG_PKG_CONFIG
++
++  PKG_CHECK_EXISTS([$vapigen_pkg], [
++      AS_IF([test "$enable_vala" = "auto"], [
++          enable_vala=yes
++        ])
++    ], [
++      AS_CASE([$enable_vala], [yes], [
++          AC_MSG_ERROR([$vapigen_pkg not found])
++        ], [auto], [
++          enable_vala=no
++        ])
++    ])
++
++  AC_MSG_CHECKING([for vala])
++
++  AS_CASE([$enable_vala],
++    [yes], [
++      VAPIGEN=`$PKG_CONFIG --variable=vapigen vapigen`
++      VAPIGEN_MAKEFILE=`$PKG_CONFIG --variable=datadir vapigen`/vala/Makefile.vapigen
++      AS_IF([test "x$2" = "x"], [
++          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir vapigen`
++        ], [
++          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir_versioned vapigen`
++        ])
++    ])
++
++  AC_MSG_RESULT([$enable_vala])
++
++  AC_SUBST([VAPIGEN])
++  AC_SUBST([VAPIGEN_VAPIDIR])
++  AC_SUBST([VAPIGEN_MAKEFILE])
++
++  AM_CONDITIONAL(ENABLE_VAPIGEN, test "x$enable_vala" = "xyes")
++])
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/vte/vte_0.44.2.bb b/meta/recipes-support/vte/vte_0.44.2.bb
index a1204a3..a0b671e 100644
--- a/meta/recipes-support/vte/vte_0.44.2.bb
+++ b/meta/recipes-support/vte/vte_0.44.2.bb
@@ -5,24 +5,39 @@ DEPENDS = "glib-2.0 gtk+3 intltool-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-inherit gnomebase gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection
+inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject-introspection
 
-SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch"
+# vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
+SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
+            ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
+            "
 SRC_URI[archive.md5sum] = "eca8f8a9d9f9bb8e9d592d0acfeec015"
 SRC_URI[archive.sha256sum] = "a1ea594814bb136a3a9a6c7656b46240571f6a198825c1111007fe99194b0949"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
+# Instead of "inherit vala" we do the relevant settings here so we can
+# set DEPENDS based on PACKAGECONFIG.
+
+# Our patched version of Vala looks in STAGING_DATADIR for .vapi files
+export STAGING_DATADIR
+# Upstream Vala >= 0.11 looks in XDG_DATA_DIRS for .vapi files
+export XDG_DATA_DIRS = "${STAGING_DATADIR}"
+
+# Package additional files
+FILES_${PN}-dev += "${datadir}/vala/vapi/*"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[vala] = "--enable-vala,--disable-vala,vala-native vala"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 
 CFLAGS += "-D_GNU_SOURCE"
 
-# Enable vala only if gobject-introspection is enabled
-EXTRA_OECONF = "--enable-vala=auto --disable-test-application"
+EXTRA_OECONF = "--disable-test-application"
 
 # libtool adds "-nostdlib" when g++ is used. This breaks PIE builds.
 # Use libtool-cross (which has a hack to prevent that) instead.
 EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
 PACKAGES =+ "libvte"
-FILES_libvte = "${libdir}/*.so.*"
+FILES_libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
-- 
2.1.4


