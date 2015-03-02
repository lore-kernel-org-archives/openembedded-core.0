Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id E432E73841
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 11:44:14 +0000 (UTC)
Received: by widem10 with SMTP id em10so13393826wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2015 03:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=LOcGXL+uOzVzRYTxFVtC88e2VnBgC9Z9j2oTWiw+Hnc=;
	b=F+44Ifv7Q0wPy6o/RqQdeKvGXir0JTgPmVJdhQFW4iBpx8FspQR4HNosAwY6JQinRb
	eMf5e7qmlfyrVOBLzq72fW8OvGiaUusPNyCGgzDFtqdngJOXh58nX/GdmEL5VlKkezWu
	TOWTJf67JIrQL2eniJyBd56qJ9lZTJ+IOWDOhecEIWG0MtcihNWWzNMfFTJqyD/RQCRw
	2r4TpAKnWXwd7MsdJuQJCHniJSt5qXQI3DEMICUkGjiR9SfnAIwUvW0F58RlIDEgOQ/9
	WyO/jYD3pm56ecJ8cIMGep/JoPJrIg4ExDFGyp8GrtRcTN+WjXD+FxlUw5URnPEfgAii
	v5AQ==
X-Gm-Message-State: ALoCoQleqRxRhJyZSIUH8kyy/+FkXL/sNe9YSHaJ4euQKPHnKvYJf80vCrRFmcyt/0CRzB8A3TNt
X-Received: by 10.181.8.225 with SMTP id dn1mr35841167wid.55.1425296655865;
	Mon, 02 Mar 2015 03:44:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id l6sm556359wjx.33.2015.03.02.03.44.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 03:44:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 11:41:47 +0000
Message-Id: <1425296507-5896-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gst-player: port to GTK+ 2
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
X-List-Received-Date: Mon, 02 Mar 2015 11:44:17 -0000

Whilst Sato still uses GTK+ 2 we don't want the overhead of building both GTK+ 2
and GKT+ 3.  Luckily gtk-play is a simple application and it's just a small
patch away from building with GTK+ 2.

When Sato is ported to GTK+ 3 (the mythical Shuku proposal) this patch can be
removed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/gst-player/gtk2.patch                |   71 ++++++++++++++++++++
 .../recipes-multimedia/gstreamer/gst-player_git.bb |    3 +-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch b/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
new file mode 100644
index 0000000..2cd18bb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
@@ -0,0 +1,71 @@
+As the rest of Sato is GTK+ 2, patch gtk-play to use GTK+ 2.  When the rest of
+Sato has been ported to GTK+ 3 this patch can be dropped.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+
+diff --git a/configure.ac b/configure.ac
+index b8af13b..90ab74c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -60,7 +60,7 @@ AC_SUBST(GLIB_PREFIX)
+ GST_PREFIX="`$PKG_CONFIG --variable=prefix gstreamer-1.0`"
+ AC_SUBST(GST_PREFIX)
+ 
+-PKG_CHECK_MODULES(GTK, [gtk+-3.0], [have_gtk="yes"], [have_gtk="no"])
++PKG_CHECK_MODULES(GTK, [gtk+-2.0], [have_gtk="yes"], [have_gtk="no"])
+ AM_CONDITIONAL(HAVE_GTK, test "x$have_gtk" != "xno")
+ 
+ GOBJECT_INTROSPECTION_CHECK([1.31.1])
+diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
+index f015077..954d6fb 100644
+--- a/gtk/gtk-play.c
++++ b/gtk/gtk-play.c
+@@ -34,6 +34,46 @@ typedef struct
+   gulong seekbar_value_changed_signal_id;
+ } GtkPlay;
+ 
++/* Compat stubs */
++GtkWidget *
++gtk_box_new (GtkOrientation orientation,
++             gint spacing)
++{
++  switch (orientation) {
++  case GTK_ORIENTATION_HORIZONTAL:
++    return gtk_hbox_new (FALSE, spacing);
++  case GTK_ORIENTATION_VERTICAL:
++    return gtk_vbox_new (FALSE, spacing);
++  }
++}
++
++GtkWidget*
++gtk_button_new_from_icon_name (const gchar *icon_name,
++                               GtkIconSize  size)
++{
++  GtkWidget *button;
++  GtkWidget *image;
++
++  image = gtk_image_new_from_icon_name (icon_name, size);
++  button =  g_object_new (GTK_TYPE_BUTTON,
++                         "image", image,
++                         NULL);
++  return button;
++}
++
++GtkWidget *
++gtk_scale_new_with_range (GtkOrientation orientation,
++                          gdouble min,
++                          gdouble max,
++                          gdouble step)
++{
++  switch (orientation) {
++  case GTK_ORIENTATION_HORIZONTAL:
++    return gtk_hscale_new_with_range (min, max, step);
++  case GTK_ORIENTATION_VERTICAL:
++    return gtk_vscale_new_with_range (min, max, step);
++  }
++}
+ 
+ static void
+ set_title (GtkPlay * play, const gchar * title)
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index cd96d77..988c407 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -3,10 +3,11 @@ SUMMARY="GStreamer playback helper library and examples"
 LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
 
-DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+3"
+DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+"
 
 SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://filechooser.patch \
+           file://gtk2.patch \
            file://gst-player.desktop"
 
 SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
-- 
1.7.10.4


