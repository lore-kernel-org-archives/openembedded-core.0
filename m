Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5D08F7C087
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 08:43:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2018 00:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,376,1539673200"; d="scan'208";a="112046156"
Received: from lwong-mobl2.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.137.224])
	by orsmga003.jf.intel.com with ESMTP; 20 Dec 2018 00:43:40 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 16:43:34 +0800
Message-Id: <20181220084336.7294-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181220084336.7294-1-anuj.mittal@intel.com>
References: <20181220084336.7294-1-anuj.mittal@intel.com>
Subject: [PATCH 3/5] atk: upgrade 2.28.1 -> 2.30.0
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
X-List-Received-Date: Thu, 20 Dec 2018 08:43:40 -0000

* For changes, see:
https://github.com/GNOME/atk/blob/ATK_2_30_0/NEWS

* Change in doc and introspection switches and patch refresh.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ld-enable-introspection-for-cross-compile.patch | 14 +++++++-------
 .../atk/{atk_2.28.1.bb => atk_2.30.0.bb}           | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-support/atk/{atk_2.28.1.bb => atk_2.30.0.bb} (79%)

diff --git a/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch b/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
index c604a984a4..1d814ccdb7 100644
--- a/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
+++ b/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
@@ -1,4 +1,4 @@
-From 3838757d29590cc1ef99c97f7268377322fc17e9 Mon Sep 17 00:00:00 2001
+From c3eb5b2e74c38bb8374bc027f84e42d7e94f62f8 Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Fri, 6 Apr 2018 12:04:00 +0800
 Subject: [PATCH] meson.build: enable introspection for cross-compile
@@ -14,15 +14,15 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/atk/meson.build b/atk/meson.build
-index 7b5a683..855e28f 100644
+index 616a3e6..941ded8 100644
 --- a/atk/meson.build
 +++ b/atk/meson.build
-@@ -139,7 +139,7 @@ libatk_dep = declare_dependency(link_with: libatk,
+@@ -137,7 +137,7 @@ libatk_dep = declare_dependency(link_with: libatk,
+                                 dependencies: gobject_dep,
+                                 sources: atk_enum_h)
  
- disable_introspection = get_option('disable_introspection')
- 
--if not meson.is_cross_build() and not disable_introspection
-+if not disable_introspection
+-if not meson.is_cross_build() and get_option('introspection')
++if get_option('introspection')
    gnome.generate_gir(libatk,
                       sources: atk_sources + atk_headers + [ atk_enum_h ] + [ atk_version_h ],
                       namespace: 'Atk',
diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-support/atk/atk_2.30.0.bb
similarity index 79%
rename from meta/recipes-support/atk/atk_2.28.1.bb
rename to meta/recipes-support/atk/atk_2.30.0.bb
index 26b13b69d7..c950862b6f 100644
--- a/meta/recipes-support/atk/atk_2.28.1.bb
+++ b/meta/recipes-support/atk/atk_2.30.0.bb
@@ -14,11 +14,11 @@ DEPENDS = "gettext-native glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
-GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
+GTKDOC_ENABLE_FLAG = "-Ddocs=true"
+GTKDOC_DISABLE_FLAG = "-Ddocs=false"
 
-GI_ENABLE_FLAG = "-Ddisable_introspection=false"
-GI_DISABLE_FLAG = "-Ddisable_introspection=true"
+GI_ENABLE_FLAG = "-Dintrospection=true"
+GI_DISABLE_FLAG = "-Dintrospection=false"
 
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
                                                                                        '${GI_DISABLE_FLAG}', d)} "
@@ -30,8 +30,8 @@ SRC_URI_append = " \
                    file://0001-meson.build-enable-introspection-for-cross-compile.patch \
                    file://0001-Switch-from-filename-to-basename.patch \
                    "
-SRC_URI[archive.md5sum] = "dfb5e7474220afa3f4ca7e45af9f3a11"
-SRC_URI[archive.sha256sum] = "cd3a1ea6ecc268a2497f0cd018e970860de24a6d42086919d6bf6c8e8d53f4fc"
+SRC_URI[archive.md5sum] = "769c85005d392ad17ffbc063f2d26454"
+SRC_URI[archive.sha256sum] = "dd4d90d4217f2a0c1fee708a555596c2c19d26fef0952e1ead1938ab632c027b"
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1


