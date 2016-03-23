Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 05A996E688
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 08:59:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 23 Mar 2016 01:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,381,1455004800"; d="scan'208";a="674289542"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2016 01:59:14 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 10:59:08 +0200
Message-Id: <98ac38eade961b51ec6ada39ea8d66afd4cca30b.1458723078.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ecd54a3428d17f605d310010d1213c4c6cb1cd8f.1458723078.git.jussi.kukkonen@intel.com>
References: <ecd54a3428d17f605d310010d1213c4c6cb1cd8f.1458723078.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1458723078.git.jussi.kukkonen@intel.com>
References: <cover.1458723078.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 3/3] glib-2.0: Fix packaging
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
X-List-Received-Date: Wed, 23 Mar 2016 08:59:13 -0000

* move gdbus-codegen to ${PN}-codegen
* move other development tools and data files to ${PN}-dev
* remove references to non-existent paths

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index bce3ce7..3a03191 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -22,10 +22,9 @@ DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' dbus', '', d)}"
 DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
 DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib glib-2.0-native"
 
-PACKAGES =+ "${PN}-utils ${PN}-codegen"
+PACKAGES += "${PN}-codegen ${PN}-utils"
 
 LEAD_SONAME = "libglib-2.0.*"
-FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
 
 inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache
 
@@ -51,14 +50,21 @@ do_configure_prepend() {
 FILES_${PN} = "${libdir}/lib*${SOLIBS} \
                ${libdir}/gio \
                ${libexecdir}/*gio-querymodules \
-               ${datadir}/glib-2.0/schemas \
-               ${datadir}/glib-2.0/gettext/mkinstalldirs \
-               ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
+               ${datadir}/glib-2.0/schemas"
 FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
-                    ${libdir}/gio/modules/*.la"
+                    ${libdir}/gio/modules/*.la \
+                    ${bindir}/glib-genmarshal \
+                    ${bindir}/glib-gettextize \
+                    ${bindir}/glib-mkenums \
+                    ${bindir}/glib-compile-schemas \
+                    ${bindir}/glib-compile-resources \
+                    ${datadir}/glib-2.0/gettext/po/Makefile.in.in \
+                    ${datadir}/glib-2.0/schemas/gschema.dtd"
 FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
-FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py"
+FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py \
+                       ${bindir}/gdbus-codegen"
+FILES_${PN}-utils = "${bindir}/*"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.1.4


