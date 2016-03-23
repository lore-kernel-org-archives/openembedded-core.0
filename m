Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE2362136
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 11:17:31 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 23 Mar 2016 04:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,382,1455004800"; d="scan'208";a="71745894"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2016 04:17:30 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 13:17:25 +0200
Message-Id: <1458731845-3554-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] matchbox-desktop: Do not close desktop on alt-F4
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
X-List-Received-Date: Wed, 23 Mar 2016 11:17:33 -0000

There are cases where user can close the desktop with a
well timed alt-F4: prevent this from happening

[YOCTO #2063]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

This commit also available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/desktop-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/desktop-fix


 ...thing-on-delete-event-when-not-STANDALONE.patch | 60 ++++++++++++++++++++++
 .../matchbox-desktop/matchbox-desktop_git.bb       |  4 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/0001-Do-nothing-on-delete-event-when-not-STANDALONE.patch

diff --git a/meta/recipes-sato/matchbox-desktop/files/0001-Do-nothing-on-delete-event-when-not-STANDALONE.patch b/meta/recipes-sato/matchbox-desktop/files/0001-Do-nothing-on-delete-event-when-not-STANDALONE.patch
new file mode 100644
index 0000000..46397dc
--- /dev/null
+++ b/meta/recipes-sato/matchbox-desktop/files/0001-Do-nothing-on-delete-event-when-not-STANDALONE.patch
@@ -0,0 +1,60 @@
+From 5fe37ef38500f858a22ecdf9bf69bf06e213bf68 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 22 Mar 2016 12:41:35 +0200
+Subject: [PATCH] Do nothing on delete-event when not STANDALONE
+
+This prevents an opportunistic alt-F4 from closing the desktop.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+
+Upstream-Status: Backport
+---
+ src/desktop.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/desktop.c b/src/desktop.c
+index d4fc2fb..94b4ddf 100644
+--- a/src/desktop.c
++++ b/src/desktop.c
+@@ -122,6 +122,15 @@ load_items (TakuMenu *menu)
+ 
+ }
+ 
++#ifndef STANDALONE
++static gboolean
++delete_event_cb (GtkWidget *widget, GdkEvent *event, gpointer user_data)
++{
++  /* prevent default handler from destroying the window */
++  return TRUE;
++}
++#endif
++
+ static void
+ workarea_changed (int x, int y, int w, int h)
+ {
+@@ -144,11 +153,11 @@ create_desktop (void)
+   gtk_icon_size_register ("taku-icon", 64, 64);
+ 
+   window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
+-  g_signal_connect (window, "delete-event", G_CALLBACK (gtk_main_quit), NULL);
+   gtk_widget_set_name (window, "TakuWindow");
+   gtk_window_set_title (GTK_WINDOW (window), _("Desktop"));
+ 
+ #ifndef STANDALONE
++  g_signal_connect (window, "delete-event", G_CALLBACK (delete_event_cb), NULL);
+   gtk_window_set_type_hint (GTK_WINDOW (window), GDK_WINDOW_TYPE_HINT_DESKTOP);
+   gtk_window_set_skip_taskbar_hint (GTK_WINDOW (window), TRUE);
+ 
+@@ -156,6 +165,7 @@ create_desktop (void)
+   screen_w = gdk_screen_get_width (screen);
+   screen_h = gdk_screen_get_height (screen);
+ #else
++  g_signal_connect (window, "delete-event", G_CALLBACK (gtk_main_quit), NULL);
+   screen_w = 640;
+   screen_h = 480;
+ #endif
+-- 
+2.7.0
+
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index 318d2e0..dbe8c11 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -13,7 +13,9 @@ SECTION = "x11/wm"
 SRCREV = "71e3e6e04271e9d5a14f1c231ef100c7f320134d"
 PV = "2.0+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2"
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2 \
+           file://0001-Do-nothing-on-delete-event-when-not-STANDALONE.patch \
+           "
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
-- 
2.1.4


