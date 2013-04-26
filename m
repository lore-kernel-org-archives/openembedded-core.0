Received: from mail-wg0-f51.google.com ([74.125.82.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVgTt-0002J3-5R
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 13:06:27 +0200
Received: by mail-wg0-f51.google.com with SMTP id b12so2073868wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 03:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=e+Ilu9Jh7HqjKCxeVDncg6PG1oQWIBKqZnciALo1G7A=;
	b=TAtkpTngzTFMnJfJxiI9fCT4qabhclVIA+AH9/mRhnb187DvDCvIj1uTsVFh7dfO9B
	44Pa4nGgkAPifuCD+umQF6x7zj3dk5yGm10TRu0AYtCU3NtDILQLNIaYgCRTWX70vxGC
	ppS8jDGMg6qK/OoFsEJwcvvQN2w9yRSHRfMXFwlqfF93r3F9HinGnxI/lSV1qkcZt9lf
	Zajnvu1kk4FO//QZVpTkxaBQJuuUt9wPFV57Fdt1gng/W5XsAGUmi/dDvuyO15gykwaK
	wxAU5EWgcsAXcabz+c/XO1IPnpGEPWjpSSPRvPlMfhRNoyq+mDgqwIVtKLU+Um51k0HA
	Dm4g==
X-Received: by 10.181.13.74 with SMTP id ew10mr3206417wid.9.1366973316158;
	Fri, 26 Apr 2013 03:48:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id s2sm2971999wib.4.2013.04.26.03.48.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 03:48:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2013 11:45:38 +0100
Message-Id: <1366973139-8746-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnCQovNWUe5JnZytMsbT2l/gL3MyjkIf2jtE2DiiF57wtnE1ngNPtLRnpzV8d6ebwPEsmz4
Subject: [PATCH] matchbox-panel-2: bump srcrev to fix compile warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 11:06:28 -0000

The older versions of matchbox-panel were naively using -Werror which causes
warnings with gcc 4.6 (which were patched away) and again more with gcc 4.8.
I'd already fixed this upstream so bump the srvrev and drop the patch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../matchbox-panel-2/gcc-4.6.0-compile.patch       |   53 --------------------
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    7 ++-
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2/gcc-4.6.0-compile.patch

diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2/gcc-4.6.0-compile.patch b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2/gcc-4.6.0-compile.patch
deleted file mode 100644
index 71a4727..0000000
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2/gcc-4.6.0-compile.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Upstream-Status: Inappropriate [other] - need clean up
-
-diff -ur git.ORIG/applets/startup/startup.c git/applets/startup/startup.c
---- git.ORIG/applets/startup/startup.c	2011-04-28 08:13:25.000000000 -0600
-+++ git/applets/startup/startup.c	2011-04-28 09:36:48.521990746 -0600
-@@ -210,9 +210,8 @@
- {
-         XEvent *xevent;
-         xevent = (XEvent *) gdk_xevent;
--        gboolean ret;
- 
--        ret = sn_display_process_event (applet->sn_display, xevent);
-+        sn_display_process_event (applet->sn_display, xevent);	
- 
-         return GDK_FILTER_CONTINUE;
- }
-@@ -223,7 +222,6 @@
- {
-         StartupApplet *applet;
-         Display *xdisplay;
--        SnMonitorContext *context;
- 
-         /* Create applet data structure */
-         applet = g_slice_new0 (StartupApplet);
-@@ -248,7 +246,7 @@
- 
-         applet->sn_display = sn_display_new (xdisplay, NULL, NULL);
- 
--        context = sn_monitor_context_new (applet->sn_display,
-+        sn_monitor_context_new (applet->sn_display,
-                                           DefaultScreen(xdisplay),
-                                           monitor_event_func,
-                                           (void *) applet,
-diff -ur git.ORIG/applets/startup-notify/startup.c git/applets/startup-notify/startup.c
---- git.ORIG/applets/startup-notify/startup.c	2011-04-28 08:05:46.000000000 -0600
-+++ git/applets/startup-notify/startup.c	2011-04-28 09:42:17.793864786 -0600
-@@ -305,7 +305,6 @@
-   StartupApplet *applet;
-   GtkWidget *widget;
-   Display *xdisplay;
--  SnMonitorContext *context;
-   
-   applet = g_slice_new0 (StartupApplet);
- 
-@@ -317,7 +316,7 @@
-     
-     applet->sn_display = sn_display_new (xdisplay, NULL, NULL);
-     
--    context = sn_monitor_context_new (applet->sn_display,
-+    sn_monitor_context_new (applet->sn_display,
-                                       DefaultScreen (xdisplay),
-                                       monitor_event_func,
-                                       applet, NULL);
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index dbe1fad..1160b87 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://matchbox-panel/mb-panel.h;endline=10;md5=0b7db28f4b6863fb853d0467e590019a \
                     file://applets/startup/startup.c;endline=22;md5=b0a64fbef3097d79f8264e6907a98f03"
 
-DEPENDS = "gtk+ startup-notification dbus dbus-glib"
+DEPENDS = "gnome-common gtk+ startup-notification dbus dbus-glib"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
-SRCREV = "cdf7a22716b87468f10573f622d5c7a58a684e35"
+SRCREV = "c03234512784b78a95b5aa9ca445d05836b9d51a"
 PV = "2.0+git${SRCPV}"
 PR = "r0"
 
@@ -19,8 +19,7 @@ RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \	
-	   file://gcc-4.6.0-compile.patch"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@base_contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
-- 
1.7.10.4



