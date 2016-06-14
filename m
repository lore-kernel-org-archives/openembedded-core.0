Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1C15473216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718727979"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:17 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:38 +0300
Message-Id: <74df5ae0f6ed5a75ff680ce0241d752b855bddf4.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 14/30] matchbox-config-gtk: Upgrade to 0.2
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:17 -0000

New version supports Gtk+3.
Rebase the patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../matchbox-config-gtk/files/no-handed.patch      | 26 +++++++++++++---------
 ...onfig-gtk_git.bb => matchbox-config-gtk_0.2.bb} | 11 +++++----
 2 files changed, 20 insertions(+), 17 deletions(-)
 rename meta/recipes-sato/matchbox-config-gtk/{matchbox-config-gtk_git.bb => matchbox-config-gtk_0.2.bb} (80%)

diff --git a/meta/recipes-sato/matchbox-config-gtk/files/no-handed.patch b/meta/recipes-sato/matchbox-config-gtk/files/no-handed.patch
index 8256949..1cb184f 100644
--- a/meta/recipes-sato/matchbox-config-gtk/files/no-handed.patch
+++ b/meta/recipes-sato/matchbox-config-gtk/files/no-handed.patch
@@ -1,10 +1,13 @@
 Upstream-Status: Inappropriate [configuration]
+---
+ appearance/mb-appearance.c | 4 ++++
+ 1 file changed, 4 insertions(+)
 
-Index: appearance/mb-appearance.c
-===================================================================
---- appearance/mb-appearance.c	(revision 1614)
-+++ appearance/mb-appearance.c	(working copy)
-@@ -300,11 +300,13 @@
+diff --git a/appearance/mb-appearance.c b/appearance/mb-appearance.c
+index 6af8376..71fd57b 100644
+--- a/appearance/mb-appearance.c
++++ b/appearance/mb-appearance.c
+@@ -317,11 +317,13 @@ on_gconf_value_changed (GConfClient* client, const gchar* key, GConfValue* value
      gtk_font_button_set_font_name (GTK_FONT_BUTTON (font_button),
                                     gconf_value_get_string (value));
    } else if (strcmp (key, HANDED_KEY) == 0) {
@@ -18,18 +21,19 @@ Index: appearance/mb-appearance.c
    }
  }
  
-@@ -395,12 +397,13 @@
-   gtk_container_add (GTK_CONTAINER (align), font_button);
+@@ -408,10 +410,12 @@ main (int argc, char **argv) {
  
    /* Left/Right Handed */
--  
+   
 +#if 0
-   frame = new_frame (_("Orientation"), &align);
-   gtk_box_pack_start (GTK_BOX (box), frame, TRUE, TRUE, 0);
    handed_check = gtk_check_button_new_with_mnemonic (_("_Left-handed"));
+   frame = new_frame (_("Orientation"),handed_check);
+   gtk_box_pack_start (GTK_BOX (box), frame, TRUE, TRUE, 0);
    g_signal_connect (handed_check, "toggled", G_CALLBACK (on_handed_set), NULL);
-   gtk_container_add (GTK_CONTAINER (align), handed_check);
 +#endif
  
    gconf_client_add_dir (gconf, INTERFACE_DIR, GCONF_CLIENT_PRELOAD_ONELEVEL, NULL);
    g_signal_connect (gconf, "value-changed", G_CALLBACK (on_gconf_value_changed), NULL);
+-- 
+2.8.1
+
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
similarity index 80%
rename from meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
rename to meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index 5f73a4c..3ca5989 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -6,17 +6,16 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://appearance/mb-appearance.c;endline=25;md5=ea92333cf8a6802639d62d874c114a28"
 
-DEPENDS = "gconf gtk+"
+DEPENDS = "gconf gtk+3"
 RDEPENDS_${PN} = "settings-daemon"
 
-SRCREV = "3ed74dfb7c57be088a5ab36e446c0ccde9fa1028"
-PV = "0.0+git${SRCPV}"
+# SRCREV tagged 0.2
+SRCREV = "ef2192ce98d9374ffdad5f78544c3f8f353c16aa"
+SRC_URI = "git://git.yoctoproject.org/${BPN} \
+           file://no-handed.patch"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
-        file://no-handed.patch;striplevel=0"
-
 inherit autotools pkgconfig distro_features_check
 
 # The settings-daemon requires x11 in DISTRO_FEATURES
-- 
2.1.4


