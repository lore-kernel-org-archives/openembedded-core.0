Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE6C6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 13:16:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 04 Oct 2016 06:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,295,1473145200"; d="scan'208";a="1049318805"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2016 06:16:46 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 16:16:42 +0300
Message-Id: <1475587002-30057-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gtk+3: Backport treeview focus fix
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
X-List-Received-Date: Tue, 04 Oct 2016 13:16:48 -0000

Treeview did not grab focus properly on mouse click, leading to e.g.
multifile selection with click/shift-click not working in the
filechooser. Backport a fix.

Fixes [YOCTO #10273].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...Redo-focus-handling-in-treeview-once-more.patch | 39 ++++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb            |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-Redo-focus-handling-in-treeview-once-more.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-Redo-focus-handling-in-treeview-once-more.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-Redo-focus-handling-in-treeview-once-more.patch
new file mode 100644
index 0000000..e819add
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/0001-Redo-focus-handling-in-treeview-once-more.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Backport [29faa2db]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+From 29faa2db44b04b9cf7f4d96e32691f424490c730 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Sun, 11 Sep 2016 11:47:55 -0400
+Subject: [PATCH] Redo focus handling in treeview once more
+
+The fix for bug 767468 had some unintended side-effects. This is
+an attempt at doing the same fix (don't grab focus when we are
+grab-shadowed), while avoiding the breakage, by using GTK+'s
+internal tracking for grab-shadowed-ness.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=770508
+---
+ gtk/gtktreeview.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/gtk/gtktreeview.c b/gtk/gtktreeview.c
+index a7463cc..73d3557 100644
+--- a/gtk/gtktreeview.c
++++ b/gtk/gtktreeview.c
+@@ -3050,11 +3050,10 @@ static void
+ grab_focus_and_unset_draw_keyfocus (GtkTreeView *tree_view)
+ {
+   GtkWidget *widget = GTK_WIDGET (tree_view);
+-  GtkWidget *grab_widget = gtk_grab_get_current ();
+ 
+   if (gtk_widget_get_can_focus (widget) &&
+       !gtk_widget_has_focus (widget) &&
+-      (!grab_widget || grab_widget == widget))
++      !_gtk_widget_get_shadowed (widget))
+     gtk_widget_grab_focus (widget);
+ 
+   tree_view->priv->draw_keyfocus = 0;
+-- 
+2.9.3
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb b/meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb
index 9a0bfc4..38e095a 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
            file://0004-configure.ac-Fix-wayland-protocols-path.patch \
+           file://0001-Redo-focus-handling-in-treeview-once-more.patch \
           "
 SRC_URI[md5sum] = "cc76cac5e18c772c6784bf19a3dff08b"
 SRC_URI[sha256sum] = "83a609ba2f3424b5509e73967c49c67833af466d6f91081b24ee5c64fce6ac17"
-- 
2.1.4


