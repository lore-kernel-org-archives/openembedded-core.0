Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJ4-0001c9-Er
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 May 2011 16:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="429934508"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2011 16:44:29 -0700
Message-Id: <a082d5309481962f55c0a7ce4955563457157be8.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Thu, 28 Apr 2011 11:05:26 -0600
Date: Tue, 03 May 2011 16:44:28 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 06/33] Fix matchbox-panel-2 compile error
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
X-List-Received-Date: Tue, 03 May 2011 23:47:06 -0000

From: Gary Thomas <gary@mlbassoc.com>

This patch is needed when building with GCC-4.6.0

--
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

From 7337ecd4970f7d94080ad70b912bdb2742d2d7aa Mon Sep 17 00:00:00 2001
From: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 28 Apr 2011 11:03:44 -0600
Subject: [PATCH] matchbox-panel: fix compile error with GCC-4.6.0

Upstream-Status: Pending

[sgw: added Upstream-Status]
Signed-off-by: Gary Thomas <gary@mlbassoc.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../matchbox-panel-2/gcc-4.6.0-compile.patch       |   51 ++++++++++++++++++++
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    5 +-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch

diff --git a/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch b/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch
new file mode 100644
index 0000000..54ca74d
--- /dev/null
+++ b/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch
@@ -0,0 +1,51 @@
+diff -ur git.ORIG/applets/startup/startup.c git/applets/startup/startup.c
+--- git.ORIG/applets/startup/startup.c	2011-04-28 08:13:25.000000000 -0600
++++ git/applets/startup/startup.c	2011-04-28 09:36:48.521990746 -0600
+@@ -210,9 +210,8 @@
+ {
+         XEvent *xevent;
+         xevent = (XEvent *) gdk_xevent;
+-        gboolean ret;
+ 
+-        ret = sn_display_process_event (applet->sn_display, xevent);
++        sn_display_process_event (applet->sn_display, xevent);	
+ 
+         return GDK_FILTER_CONTINUE;
+ }
+@@ -223,7 +222,6 @@
+ {
+         StartupApplet *applet;
+         Display *xdisplay;
+-        SnMonitorContext *context;
+ 
+         /* Create applet data structure */
+         applet = g_slice_new0 (StartupApplet);
+@@ -248,7 +246,7 @@
+ 
+         applet->sn_display = sn_display_new (xdisplay, NULL, NULL);
+ 
+-        context = sn_monitor_context_new (applet->sn_display,
++        sn_monitor_context_new (applet->sn_display,
+                                           DefaultScreen(xdisplay),
+                                           monitor_event_func,
+                                           (void *) applet,
+diff -ur git.ORIG/applets/startup-notify/startup.c git/applets/startup-notify/startup.c
+--- git.ORIG/applets/startup-notify/startup.c	2011-04-28 08:05:46.000000000 -0600
++++ git/applets/startup-notify/startup.c	2011-04-28 09:42:17.793864786 -0600
+@@ -305,7 +305,6 @@
+   StartupApplet *applet;
+   GtkWidget *widget;
+   Display *xdisplay;
+-  SnMonitorContext *context;
+   
+   applet = g_slice_new0 (StartupApplet);
+ 
+@@ -317,7 +316,7 @@
+     
+     applet->sn_display = sn_display_new (xdisplay, NULL, NULL);
+     
+-    context = sn_monitor_context_new (applet->sn_display,
++    sn_monitor_context_new (applet->sn_display,
+                                       DefaultScreen (xdisplay),
+                                       monitor_event_func,
+                                       applet, NULL);
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 9e1a297..9c1aa01 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -13,13 +13,14 @@ DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 PV = "0.0+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \	
+	   file://gcc-4.6.0-compile.patch \
            file://startup_fix.diff;patch=1"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
-- 
1.7.4.1



