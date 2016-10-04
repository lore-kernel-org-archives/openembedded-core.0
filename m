Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6C16E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 11:27:39 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 04 Oct 2016 04:27:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,295,1473145200"; d="scan'208";a="176174303"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2016 04:27:39 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 14:27:25 +0300
Message-Id: <0bc1f93e6de65bcffee5c5b02033eb1f5cdb713b.1475503407.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475503407.git.jussi.kukkonen@intel.com>
References: <cover.1475503407.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1475503407.git.jussi.kukkonen@intel.com>
References: <cover.1475503407.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] Revert "connman-gnome: StatusIcon adapts to size changes"
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

The aim of the original commit was to make connman-gnome load the icons
at the exact size of the systray. There are two problems with this:
* There are not enough icon sizes provided to make the scaling
  look good at most sizes (including current panel size)
* Both connman-gnome and mb-panel have bugs in the icon size update
  code and using scaling to exact size makes these much more visible
  (See bug 9995 for example).

The problems the original commit tried to fix can be worked around
with better packing in matchbox-panel-2.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../connman/connman-gnome/0001-Port-to-Gtk3.patch  | 136 +++------------------
 1 file changed, 15 insertions(+), 121 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch b/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch
index 279ca05..c93e9b4 100644
--- a/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch
+++ b/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch
@@ -1,11 +1,10 @@
-From 092fe0793b39c6feb6464bfbd568b050960d62c0 Mon Sep 17 00:00:00 2001
+From a59b0fac02e74a971ac3f08bf28c17ce361a9526 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Mar 2016 15:47:49 +0200
 Subject: [PATCH] Port to Gtk3
 
 Some unused (or not useful) code was removed, functionality should stay
-the same, although applet now loads icons based on actual size available
-to it.
+the same.
 
 Code still contains quite a few uses of deprecated API.
 
@@ -13,13 +12,13 @@ Upstream-Status: Submitted
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
  applet/agent.c        |  3 +--
- applet/main.c         | 43 ------------------------------
- applet/status.c       | 74 +++++++++++++++++++++++++++++++++------------------
+ applet/main.c         | 43 -------------------------------------------
+ applet/status.c       |  8 --------
  configure.ac          |  3 +--
- properties/ethernet.c | 14 +++++-----
+ properties/ethernet.c | 14 +++++++-------
  properties/main.c     |  2 +-
- properties/wifi.c     | 12 ++++-----
- 7 files changed, 64 insertions(+), 87 deletions(-)
+ properties/wifi.c     | 12 ++++++------
+ 7 files changed, 16 insertions(+), 69 deletions(-)
 
 diff --git a/applet/agent.c b/applet/agent.c
 index 65bed08..04fe86a 100644
@@ -43,7 +42,7 @@ index 65bed08..04fe86a 100644
  	label = gtk_label_new(_("Please provide some network information:"));
  	gtk_misc_set_alignment(GTK_MISC(label), 0.0, 0.0);
 diff --git a/applet/main.c b/applet/main.c
-index c7b3c7f..f2ce46b 100644
+index f12d371..cd16285 100644
 --- a/applet/main.c
 +++ b/applet/main.c
 @@ -157,46 +157,6 @@ static void name_owner_changed(DBusGProxy *proxy, const char *name,
@@ -104,26 +103,10 @@ index c7b3c7f..f2ce46b 100644
  			"copyright", "Copyright \xc2\xa9 2008 Intel Corporation",
  			"comments", _("A connection manager for the GNOME desktop"),
 diff --git a/applet/status.c b/applet/status.c
-index aed6f1e..6ecbf3a 100644
+index aed6f1e..015ff29 100644
 --- a/applet/status.c
 +++ b/applet/status.c
-@@ -30,13 +30,14 @@
- static gboolean available = FALSE;
- 
- static GtkStatusIcon *statusicon = NULL;
-+static gint icon_size = 0;
- 
- static GdkPixbuf *pixbuf_load(GtkIconTheme *icontheme, const gchar *name)
- {
- 	GdkPixbuf *pixbuf;
- 	GError *error = NULL;
- 
--	pixbuf = gtk_icon_theme_load_icon(icontheme, name, 22, 0, &error);
-+	pixbuf = gtk_icon_theme_load_icon(icontheme, name, icon_size, 0, &error);
- 
- 	if (pixbuf == NULL) {
- 		g_warning("Missing icon %s: %s", name, error->message);
-@@ -102,8 +103,6 @@ static void icon_animation_start(IconAnimation *animation,
+@@ -102,8 +102,6 @@ static void icon_animation_start(IconAnimation *animation,
  {
  	available = TRUE;
  
@@ -132,7 +115,7 @@ index aed6f1e..6ecbf3a 100644
  	animation->start = start;
  	animation->end = (end == 0) ? animation->count - 1 : end;
  
-@@ -120,8 +119,6 @@ static void icon_animation_stop(IconAnimation *animation)
+@@ -120,8 +118,6 @@ static void icon_animation_stop(IconAnimation *animation)
  {
  	available = TRUE;
  
@@ -141,96 +124,7 @@ index aed6f1e..6ecbf3a 100644
  	if (animation->id > 0)
  		g_source_remove(animation->id);
  
-@@ -190,6 +187,42 @@ static GdkPixbuf *pixbuf_none;
- static GdkPixbuf *pixbuf_wired;
- static GdkPixbuf *pixbuf_signal[5];
- 
-+static void
-+load_icons (gint size)
-+{
-+        // educated guess to preload correct size
-+        if (size == 0)
-+                size = 34;
-+
-+        if (icon_size == size)
-+                return;
-+
-+        icon_size = size;
-+
-+        if(pixbuf_none)
-+                status_cleanup();
-+
-+        g_debug ("Loading icons at size %d", icon_size);
-+        animation = icon_animation_load(icontheme, "connman-connecting", 33);
-+        pixbuf_signal[0] = pixbuf_load(icontheme, "connman-signal-01");
-+        pixbuf_signal[1] = pixbuf_load(icontheme, "connman-signal-02");
-+        pixbuf_signal[2] = pixbuf_load(icontheme, "connman-signal-03");
-+        pixbuf_signal[3] = pixbuf_load(icontheme, "connman-signal-04");
-+        pixbuf_signal[4] = pixbuf_load(icontheme, "connman-signal-05");
-+
-+        pixbuf_none = pixbuf_load(icontheme, "connman-type-none");
-+        pixbuf_wired = pixbuf_load(icontheme, "connman-type-wired");
-+        pixbuf_notifier = pixbuf_load(icontheme, "connman-notifier-unavailable");
-+}
-+
-+static gboolean
-+size_changed_cb (GtkStatusIcon *statusicon,
-+                 gint           size,
-+                 gpointer       user_data)
-+{
-+        load_icons (size);
-+}
-+
- int status_init(StatusCallback activate, GtkWidget *popup)
- {
- 	GdkScreen *screen;
-@@ -204,17 +237,9 @@ int status_init(StatusCallback activate, GtkWidget *popup)
- 
- 	gtk_icon_theme_append_search_path(icontheme, ICONDIR);
- 
--	animation = icon_animation_load(icontheme, "connman-connecting", 33);
--
--	pixbuf_signal[0] = pixbuf_load(icontheme, "connman-signal-01");
--	pixbuf_signal[1] = pixbuf_load(icontheme, "connman-signal-02");
--	pixbuf_signal[2] = pixbuf_load(icontheme, "connman-signal-03");
--	pixbuf_signal[3] = pixbuf_load(icontheme, "connman-signal-04");
--	pixbuf_signal[4] = pixbuf_load(icontheme, "connman-signal-05");
--
--	pixbuf_none = pixbuf_load(icontheme, "connman-type-none");
--	pixbuf_wired = pixbuf_load(icontheme, "connman-type-wired");
--	pixbuf_notifier = pixbuf_load(icontheme, "connman-notifier-unavailable");
-+	g_signal_connect (statusicon, "size-changed",
-+			  G_CALLBACK(size_changed_cb), NULL);
-+	load_icons (gtk_status_icon_get_size (statusicon));
- 
- 	if (activate != NULL)
- 		g_signal_connect(statusicon, "activate",
-@@ -231,17 +256,18 @@ void status_cleanup(void)
- 	int i;
- 
- 	icon_animation_free(animation);
-+	animation = NULL;
- 
- 	for (i = 0; i < 5; i++)
--		g_object_unref(pixbuf_signal[i]);
-+		g_clear_object(&pixbuf_signal[i]);
- 
--	g_object_unref(pixbuf_none);
--	g_object_unref(pixbuf_wired);
--	g_object_unref(pixbuf_notifier);
-+	g_clear_object(&pixbuf_none);
-+	g_clear_object(&pixbuf_wired);
-+	g_clear_object(&pixbuf_notifier);
- 
--	g_object_unref(icontheme);
-+	g_clear_object(&icontheme);
- 
--	g_object_unref(statusicon);
-+	g_clear_object(&statusicon);
- }
- 
- void status_unavailable(void)
-@@ -251,8 +277,6 @@ void status_unavailable(void)
+@@ -251,8 +247,6 @@ void status_unavailable(void)
  	available = FALSE;
  
  	gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_notifier);
@@ -239,7 +133,7 @@ index aed6f1e..6ecbf3a 100644
  
  	gtk_status_icon_set_visible(statusicon, TRUE);
  }
-@@ -299,7 +323,6 @@ static void set_ready(gint signal)
+@@ -299,7 +293,6 @@ static void set_ready(gint signal)
  
  	if (signal < 0) {
  		gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_wired);
@@ -247,7 +141,7 @@ index aed6f1e..6ecbf3a 100644
  		return;
  	}
  
-@@ -311,7 +334,6 @@ static void set_ready(gint signal)
+@@ -311,7 +304,6 @@ static void set_ready(gint signal)
  		index = 4;
  
  	gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_signal[index]);
@@ -379,5 +273,5 @@ index bd325ef..a5827e0 100644
  		}
  		break;
 -- 
-2.1.4
+2.8.1
 
-- 
2.1.4


