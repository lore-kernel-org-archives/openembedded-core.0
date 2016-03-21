Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8926FFC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 19:43:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 21 Mar 2016 12:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,373,1455004800"; d="scan'208";a="673362620"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2016 12:43:20 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 21:43:17 +0200
Message-Id: <8ee737433c7c8a18d3ee295aa66ea379ad309989.1458587440.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1458587440.git.jussi.kukkonen@intel.com>
References: <cover.1458587440.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] matchbox-panel-2: Fix Home-button icon load issue
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
X-List-Received-Date: Mon, 21 Mar 2016 19:43:22 -0000

Home (showdesktop) button sometimes did not load the icon because
the active state was never initialized. Backport fix for this issue.

[YOCTO #9026]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...top-Make-sure-active-state-is-initialized.patch | 50 ++++++++++++++++++++++
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-sato/matchbox-panel-2/files/0001-showdesktop-Make-sure-active-state-is-initialized.patch

diff --git a/meta/recipes-sato/matchbox-panel-2/files/0001-showdesktop-Make-sure-active-state-is-initialized.patch b/meta/recipes-sato/matchbox-panel-2/files/0001-showdesktop-Make-sure-active-state-is-initialized.patch
new file mode 100644
index 0000000..3bab6d2
--- /dev/null
+++ b/meta/recipes-sato/matchbox-panel-2/files/0001-showdesktop-Make-sure-active-state-is-initialized.patch
@@ -0,0 +1,50 @@
+From a0b5fca04da208990f3c40e65dbb045da4cdb35e Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Sun, 20 Mar 2016 13:24:37 +0200
+Subject: [PATCH] showdesktop: Make sure active state is initialized
+
+There are cases (in qemu at least) where set_active()
+is never called on startup. Make sure we initialize the active
+state so the icon gets loaded and the applet is not confused
+about the current state.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+
+Upstream-Status: Backport
+---
+ applets/showdesktop/showdesktop.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/applets/showdesktop/showdesktop.c b/applets/showdesktop/showdesktop.c
+index 61dd5c2..33c13e1 100644
+--- a/applets/showdesktop/showdesktop.c
++++ b/applets/showdesktop/showdesktop.c
+@@ -181,6 +181,12 @@ button_clicked_cb (GtkButton         *button,
+ 	            &xev);
+ }
+ 
++static void
++realize_cb (GtkWidget *button, ShowDesktopApplet *applet)
++{
++        sync_applet (applet);
++}
++
+ G_MODULE_EXPORT GtkWidget *
+ mb_panel_applet_create (const char    *id,
+                         GtkOrientation orientation)
+@@ -216,6 +222,10 @@ mb_panel_applet_create (const char    *id,
+                           "clicked",
+                           G_CALLBACK (button_clicked_cb),
+                           applet);
++        g_signal_connect (button,
++                          "realize",
++                          G_CALLBACK (realize_cb),
++                          applet);
+ 
+         g_object_weak_ref (G_OBJECT (button),
+                            (GWeakNotify) show_desktop_applet_free,
+-- 
+2.7.0
+
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 61d9e30..98c3ae4 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -22,6 +22,7 @@ RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
+           file://0001-showdesktop-Make-sure-active-state-is-initialized.patch \
            file://silence-warnings.patch"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
-- 
2.1.4


