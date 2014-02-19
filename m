Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A4BC16EFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 17:13:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2014 09:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,506,1389772800"; d="scan'208";a="485944796"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2014 09:13:08 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 19:13:08 +0200
Message-Id: <1392829988-5737-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] gtk+3: upgrade to 3.10.7
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
X-List-Received-Date: Wed, 19 Feb 2014 17:13:48 -0000

(*) removed patches that were already
    commited upstream
(*) added new patch to solve the build issue
(*) changed the package URL because
    the old one is unreliable.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../fix-build-when-wayland-backend-enabled.patch   | 42 ++++++++++++++++++++++
 .../gtk+/gtk+3/no-x11-in-wayland.patch             | 32 -----------------
 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch | 42 ----------------------
 .../gtk+/{gtk+3_3.8.2.bb => gtk+3_3.10.7.bb}       |  9 +++--
 4 files changed, 46 insertions(+), 79 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.8.2.bb => gtk+3_3.10.7.bb} (61%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch b/meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch
new file mode 100644
index 0000000..c28e223
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch
@@ -0,0 +1,42 @@
+Fix build when wayland backend enabled
+
+Author: Emilio Pozuelo Monfort
+Upstream-status: pending
+https://bugzilla.gnome.org/show_bug.cgi?id=710584
+
+--- gtk+-3.10.7/gtk/gtkapplication.c
++++ gtk+-3.10.7/gtk/gtkapplication.c
+@@ -144,7 +144,6 @@
+ 
+   gboolean register_session;
+ 
+-#ifdef GDK_WINDOWING_X11
+   guint next_id;
+ 
+   GDBusConnection *session_bus;
+@@ -161,7 +160,6 @@
+   GDBusProxy *client_proxy;
+   gchar *app_id;
+   gchar *client_path;
+-#endif
+ 
+ #ifdef GDK_WINDOWING_QUARTZ
+   GMenu *combined;
+@@ -299,6 +297,8 @@
+   g_free (application->priv->client_path);
+ }
+ 
++#endif
++
+ const gchar *
+ gtk_application_get_app_menu_object_path (GtkApplication *application)
+ {
+@@ -311,8 +311,6 @@
+   return application->priv->menubar_path;
+ }
+ 
+-#endif
+-
+ #ifdef GDK_WINDOWING_QUARTZ
+ 
+ typedef struct {
diff --git a/meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch b/meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
deleted file mode 100644
index df0921a..0000000
--- a/meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-The Wayland backend was including X11 headers, which won't work in a no-X11
-distro.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 875b1d07ded377b20acbf1a10cae847f56de05b4 Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Thu, 23 May 2013 12:26:26 -0400
-Subject: [PATCH] Don't include X11 headers in wayland
-
-The include of X11/keysyms.h in gdkdevice-wayland.c was just
-a leftover.
----
- gdk/wayland/gdkdevice-wayland.c |    1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/gdk/wayland/gdkdevice-wayland.c b/gdk/wayland/gdkdevice-wayland.c
-index c258be3..cd4a695 100644
---- a/gdk/wayland/gdkdevice-wayland.c
-+++ b/gdk/wayland/gdkdevice-wayland.c
-@@ -32,7 +32,6 @@
- #include "gdkdevicemanagerprivate.h"
- 
- #include <xkbcommon/xkbcommon.h>
--#include <X11/keysym.h>
- 
- #include <sys/time.h>
- #include <sys/mman.h>
--- 
-1.7.10.4
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch b/meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
deleted file mode 100644
index fa0d0e6..0000000
--- a/meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Wayland 1.1 is enforcing the protocol whereas 1.0 was lenient.  Backport a patch
-from git to fix repainting.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-
-From 0d2c4617203c8fe907c722c9cb53c0345e0405e7 Mon Sep 17 00:00:00 2001
-From: Scott Moreau <oreaus@gmail.com>
-Date: Sun, 10 Mar 2013 10:51:01 -0600
-Subject: [PATCH] wayland: Always attach buffer before committing
-
-With recent changes in attach semantics, we always need to attach before
-committing. Without this changes to the window contents to not get reflected
-in the content of the surface.
-
-Signed-off-by: Rob Bradford <rob@linux.intel.com>
----
- gdk/wayland/gdkwindow-wayland.c |    7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/gdk/wayland/gdkwindow-wayland.c b/gdk/wayland/gdkwindow-wayland.c
-index 112a1f4..fa01e90 100644
---- a/gdk/wayland/gdkwindow-wayland.c
-+++ b/gdk/wayland/gdkwindow-wayland.c
-@@ -327,13 +327,6 @@ gdk_wayland_window_attach_image (GdkWindow *window)
-   if (GDK_WINDOW_DESTROYED (window))
-     return;
- 
--  /* The "drawn to" Cairo surface is the same as the Cairo surface from which
--   * we are driving the buffer for the Wayland surface. Therefore we don't
--   * need to do anything here
--   */
--  if (impl->server_surface == impl->cairo_surface)
--    return;
--
-   /* The wayland surface is attached to a buffer that is from the old "drawn
-    * to" surface. Unref the surface and restore the state.
-    */
--- 
-1.7.10.4
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
similarity index 61%
rename from meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
index 5db3745..9f8c6ab 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
@@ -2,13 +2,12 @@ require gtk+3.inc
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "http://download.gnome.org/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
+SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
-           file://no-x11-in-wayland.patch \
-           file://wayland-attach.patch"
+           file://fix-build-when-wayland-backend-enabled.patch"
 
-SRC_URI[md5sum] = "8e878e18fc385f2b813419dc7b40a968"
-SRC_URI[sha256sum] = "1ca80c9c15a1df95d74cefb8c2afe4682ba272a4b489106f04877be2a7aff297"
+SRC_URI[md5sum] = "18a81944a8506231529a76bf2b68372b"
+SRC_URI[sha256sum] = "b7e9de15385031cff43897e7e59f6692eaabf500f36eef80e6b9d6486ad49427"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
1.8.3.2


