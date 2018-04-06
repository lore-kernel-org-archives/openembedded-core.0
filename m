Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EBEA375084
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 04:35:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 21:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,413,1517904000"; d="scan'208";a="29951547"
Received: from anmitta2-mobl1.png.intel.com ([10.221.16.247])
	by fmsmga007.fm.intel.com with ESMTP; 05 Apr 2018 21:35:19 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 12:35:14 +0800
Message-Id: <1522989314-7798-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] atk: make sure that introspection is enabled
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
X-List-Received-Date: Fri, 06 Apr 2018 04:35:20 -0000

Fix the meson flags to make sure that introspection files are built
when it is enabled.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ld-enable-introspection-for-cross-compile.patch | 28 ++++++++++++++++++++++
 meta/recipes-support/atk/atk_2.28.1.bb             |  3 +++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch

diff --git a/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch b/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
new file mode 100644
index 0000000..c604a98
--- /dev/null
+++ b/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
@@ -0,0 +1,28 @@
+From 3838757d29590cc1ef99c97f7268377322fc17e9 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Fri, 6 Apr 2018 12:04:00 +0800
+Subject: [PATCH] meson.build: enable introspection for cross-compile
+
+It works fine in OE-core and doesn't need to be disabled. Let the user decide
+if it should be disabled or not.
+
+Upstream-Status: Pending
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ atk/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/atk/meson.build b/atk/meson.build
+index 7b5a683..855e28f 100644
+--- a/atk/meson.build
++++ b/atk/meson.build
+@@ -139,7 +139,7 @@ libatk_dep = declare_dependency(link_with: libatk,
+ 
+ disable_introspection = get_option('disable_introspection')
+ 
+-if not meson.is_cross_build() and not disable_introspection
++if not disable_introspection
+   gnome.generate_gir(libatk,
+                      sources: atk_sources + atk_headers + [ atk_enum_h ] + [ atk_version_h ],
+                      namespace: 'Atk',
diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-support/atk/atk_2.28.1.bb
index bb47916..8107df9 100644
--- a/meta/recipes-support/atk/atk_2.28.1.bb
+++ b/meta/recipes-support/atk/atk_2.28.1.bb
@@ -13,6 +13,9 @@ DEPENDS = "glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
+SRC_URI_append = " \
+                   file://0001-meson.build-enable-introspection-for-cross-compile.patch \
+                   "
 SRC_URI[archive.md5sum] = "dfb5e7474220afa3f4ca7e45af9f3a11"
 SRC_URI[archive.sha256sum] = "cd3a1ea6ecc268a2497f0cd018e970860de24a6d42086919d6bf6c8e8d53f4fc"
 
-- 
2.7.4


