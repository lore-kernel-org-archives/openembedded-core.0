Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E8A7B6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 14:27:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2018 06:27:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,396,1511856000"; d="scan'208";a="195294733"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 22 Jan 2018 06:27:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 16:21:19 +0200
Message-Id: <20180122142119.39020-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] json-glib: fix meson flags for introspection and documentation
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
X-List-Received-Date: Mon, 22 Jan 2018 14:27:20 -0000

Upstream has renamed them all, and folded manpages building
into the overall 'docs' option.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.4.2.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
index fad0a2df36d..dd67a8907bd 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
@@ -14,21 +14,20 @@ SRC_URI[archive.md5sum] = "35107e23a7bbbc70f31c34f7b9adf1c3"
 SRC_URI[archive.sha256sum] = "2d7709a44749c7318599a6829322e081915bdc73f5be5045882ed120bb686dc8"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase lib_package gobject-introspection gtk-doc manpages gettext
+inherit gnomebase lib_package gobject-introspection gtk-doc gettext
 
-GTKDOC_ENABLE_FLAG = "-Denable-gtk-doc=true"
-GTKDOC_DISABLE_FLAG = "-Denable-gtk-doc=false"
+# This builds both API docs (via gtk-doc) and manpages
+GTKDOC_ENABLE_FLAG = "-Ddocs=true"
+GTKDOC_DISABLE_FLAG = "-Ddocs=false"
 
-GI_ENABLE_FLAG = "-Ddisable_introspection=false"
-GI_DISABLE_FLAG = "-Ddisable_introspection=true"
+GI_ENABLE_FLAG = "-Dintrospection=true"
+GI_DISABLE_FLAG = "-Dintrospection=false"
 
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
                                                                                     '${GI_DISABLE_FLAG}', d)} "
 
-PACKAGECONFIG[manpages] = "-Denable-man=true, -Denable-man=false, libxslt-native xmlto-native"
-
 do_install_append() {
     # FIXME: these need to be provided via ptest
     rm -rf ${D}${datadir}/installed-tests ${D}${libexecdir}
-- 
2.15.1


