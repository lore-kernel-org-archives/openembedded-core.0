Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rt3J4-0005GE-V5
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 21:30:59 +0100
Received: by eekd41 with SMTP id d41so767548eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 12:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8cnfihRjjjxWrZ930qD30tTLycct7NIdpzKB4jHOV7U=;
	b=wWQXOrdvl9RGWrbG4RH4uYqAxmpXsgc2lmrFHM7Dzx1TVZlUPhPQo8LlcYevn9/NNH
	xQwNYGk0eaboGhQ2jTPQC60we2YXT5wluPMTSUN+vt2c1klYniIRiavo+UnSQLpwEMU1
	EwzDhkl5un8mJsAc8Y+q26FAFrEa6Kq4QXicA=
Received: by 10.14.135.140 with SMTP id u12mr1344731eei.73.1328214181974;
	Thu, 02 Feb 2012 12:23:01 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id a58sm13006686eeb.8.2012.02.02.12.23.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 12:23:01 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 21:20:53 +0100
Message-Id: <1328214053-6737-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] gtk+: Add patch for iconview segfault.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Feb 2012 20:30:59 -0000

https://bugzilla.gnome.org/show_bug.cgi?id=663138

* Run tested on netbookpro.
* Resolves problem with lxapperance crashing on startup.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../gtk+-2.24.8/gtk_icon_view_layout-crash.patch   |   30 ++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch
new file mode 100644
index 0000000..3ca24d5
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch
@@ -0,0 +1,30 @@
+From 5c3bb1839cac52828756f9ddb98f49d586853991 Mon Sep 17 00:00:00 2001
+From: Cosimo Cecchi <cosimoc@gnome.org>
+Date: Wed, 16 Nov 2011 22:38:45 +0000
+Subject: Revert "iconview: layout items immediately when setting a GtkTreeModel"
+
+It makes GtkIconView segfault on GTK 2.24.
+
+gtk_icon_view_expose() calls gtk_icon_view_layout() first thing if
+there's a layout queued anyway, so we wouldn't end up in the same
+situation causing the crash the original patch is supposed to fix.
+
+This reverts commit 5a03f4a6a50237d86959f596dda143dfc2f040d1.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=663138
+---
+diff --git a/gtk/gtkiconview.c b/gtk/gtkiconview.c
+index 62877fa..54b3f3b 100644
+--- a/gtk/gtkiconview.c
++++ b/gtk/gtkiconview.c
+@@ -5423,7 +5423,7 @@ gtk_icon_view_set_model (GtkIconView *icon_view,
+
+       gtk_icon_view_build_items (icon_view);
+
+-      gtk_icon_view_layout (icon_view);
++      gtk_icon_view_queue_layout (icon_view);
+     }
+
+   g_object_notify (G_OBJECT (icon_view), "model");
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index ec827a7..4e5b66f 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
            file://toggle-font.diff;striplevel=0 \
            file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
            file://doc-fixes.patch \
+           file://gtk_icon_view_layout-crash.patch \
 	  "
 
 # TO MERGE
@@ -27,7 +28,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
 SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"
-- 
1.7.3.4



