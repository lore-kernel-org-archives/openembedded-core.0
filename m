Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1ECDD71A0B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 11:27:41 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 04 Oct 2016 04:27:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,295,1473145200"; d="scan'208";a="176174315"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2016 04:27:41 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 14:27:26 +0300
Message-Id: <a9e4da3cfb4611f33cac3b3b2a4cf6526d40c1bd.1475503407.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0bc1f93e6de65bcffee5c5b02033eb1f5cdb713b.1475503407.git.jussi.kukkonen@intel.com>
References: <cover.1475503407.git.jussi.kukkonen@intel.com>
	<0bc1f93e6de65bcffee5c5b02033eb1f5cdb713b.1475503407.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1475503407.git.jussi.kukkonen@intel.com>
References: <cover.1475503407.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] matchbox-panel-2: Fix small systray icon drawing
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
X-List-Received-Date: Tue, 04 Oct 2016 11:27:42 -0000

Add patch to pack systray icons so that their drawing area is the
size they expect (otherwise GtkStatusIcon based systray items can
end up drawing "tiled", looking like 1.5 icons instead of a single
icon).

Fixes [YOCTO #9995]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...applets-systray-Allow-icons-to-be-smaller.patch | 34 ++++++++++++++++++++++
 .../matchbox-panel-2/matchbox-panel-2_2.11.bb      |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow-icons-to-be-smaller.patch

diff --git a/meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow-icons-to-be-smaller.patch b/meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow-icons-to-be-smaller.patch
new file mode 100644
index 0000000..d13dd3d
--- /dev/null
+++ b/meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow-icons-to-be-smaller.patch
@@ -0,0 +1,34 @@
+From f83a9179696b2d060ee4860733dafbf38bbd4b87 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 28 Sep 2016 15:05:41 +0300
+Subject: [PATCH] applets/systray: Allow icons to be smaller
+
+Don't expand/fill the systray items, align them in the center of the
+systray panel. This makes sure the icons are drawn at the size they
+expect.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted
+---
+ applets/systray/systray.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/applets/systray/systray.c b/applets/systray/systray.c
+index 39698a8..94a5753 100644
+--- a/applets/systray/systray.c
++++ b/applets/systray/systray.c
+@@ -29,8 +29,9 @@ on_realize (GtkWidget *widget, gpointer user_data)
+   tray = (GtkWidget *)na_tray_new_for_screen (screen, orientation);
+ 
+   gtk_widget_show (tray);
+-
+-  gtk_container_add (GTK_CONTAINER (widget), tray);
++  gtk_widget_set_valign (tray, GTK_ALIGN_CENTER);
++  gtk_widget_set_halign (tray, GTK_ALIGN_CENTER);
++  gtk_box_pack_start (GTK_BOX (widget), tray, FALSE, FALSE, 0);
+ }
+ 
+ G_MODULE_EXPORT GtkWidget *
+-- 
+2.1.4
+
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
index a387073..d38e7f6 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
@@ -21,7 +21,9 @@ RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN} \
+           file://0001-applets-systray-Allow-icons-to-be-smaller.patch \
+           "
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
-- 
2.1.4


