Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1PyKZK-0001GA-V0
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Mar 2011 09:53:03 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Mar 2011 00:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,307,1297065600"; d="scan'208";a="719368337"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2011 00:50:07 -0800
From: Yu Ke <ke.yu@intel.com>
To: poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Sat, 12 Mar 2011 16:55:54 +0800
Message-Id: <33b37f44fd44062eabef18f8f8c0e0c51e7225ad.1299919648.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1299919648.git.ke.yu@intel.com>
References: <cover.1299919648.git.ke.yu@intel.com>
Subject: [PATCH 1/1] matchbox-desktop: add configure event handler to fix bug 658
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
X-List-Received-Date: Sat, 12 Mar 2011 08:53:03 -0000

Bug658 - "the bottom icons on Applications and All screen are cut-off in qemu"

the reason is that desktop work area is not resized after window manager
decoration. so add configure event handler to resize the desktop work area
can fix this issue.

[YOCTO #658]

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../matchbox-desktop/files/window-resize-fix.patch |   48 ++++++++++++++++++++
 .../matchbox-desktop/matchbox-desktop_git.bb       |    5 +-
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch

diff --git a/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch b/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
new file mode 100644
index 0000000..87fbd50
--- /dev/null
+++ b/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
@@ -0,0 +1,48 @@
+commit 2ef9a98cbda46b5a52e20ce292eebd6ba1f3c3a8
+Author: Yu Ke <ke.yu@intel.com>
+Date:   Sun Mar 6 17:58:45 2011 +0800
+
+    desktop: Add configure event handler for desktop resize
+    
+    desktop need to resize its work area when window manager decorate its
+    window. Originally it is done by the hook in root window PropertyNotify
+    event handler, i.e. net_workarea_changed () routine. However, for unknown
+    reason, the PropertyNotify event does not deliver to the root window,
+    thus this routine does not work.
+    
+    this patch fix this issue from another side. Since window manager will also
+    send configure event to desktop window after decoration, it also works to do
+    it in configure event handler.
+    
+    Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+diff --git a/src/desktop.c b/src/desktop.c
+index d4fc2fb..5aa2cfc 100644
+--- a/src/desktop.c
++++ b/src/desktop.c
+@@ -130,6 +130,15 @@ workarea_changed (int x, int y, int w, int h)
+   gtk_fixed_move (GTK_FIXED (fixed), box, x, y);
+ }
+ 
++static gboolean
++desktop_configure_callback(GtkWindow *window,
++		GdkEvent *event, gpointer data)
++{
++	gtk_widget_set_size_request (box, event->configure.width, event->configure.height);
++	gtk_widget_queue_resize (box);
++	return FALSE;
++}
++
+ GtkWidget *
+ create_desktop (void)
+ {
+@@ -176,6 +185,9 @@ create_desktop (void)
+   /* Set a sane default in case there is no work area defined yet */
+   workarea_changed (0, 0, screen_w, screen_h);
+ 
++  g_signal_connect(G_OBJECT(window), "configure-event",
++		  G_CALLBACK(desktop_configure_callback), NULL);
++
+ #ifdef STANDALONE
+   /* TODO: fake workarea_changed calls on window resize */
+ #else
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index 09f7913..38d2d69 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -11,10 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "gtk+ startup-notification dbus"
 SECTION = "x11/wm"
 PV = "2.0+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.pokylinux.org/${PN}-2;protocol=git \
-           file://dso_linking_change_build_fix.patch"
+           file://dso_linking_change_build_fix.patch \
+           file://window-resize-fix.patch"
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
-- 
1.7.0.4



