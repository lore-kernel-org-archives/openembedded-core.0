Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D93A073232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:07:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 11 Mar 2016 05:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907975219"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 05:07:00 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:24 +0200
Message-Id: <3fcf14cf543d8afa82b5439d5166ff5f278ff615.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
References: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Subject: [RFC PATCH 05/12] matchbox-panel-2: Upgrade to JKU
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
X-List-Received-Date: Fri, 11 Mar 2016 13:07:04 -0000

This is the GTK3 version.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../matchbox-panel-2/files/silence-warnings.patch  | 64 ----------------------
 .../matchbox-panel-2/matchbox-panel-2_git.bb       | 12 ++--
 2 files changed, 6 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch

diff --git a/meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch b/meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch
deleted file mode 100644
index 45ba9a0..0000000
--- a/meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Don't warn if the machine doesn't actually have a battery, or if the applets
-string contains consecutive separators.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/applets/battery/battery-acpi.c b/applets/battery/battery-acpi.c
-index 6515cb0..c44dd12 100644
---- a/applets/battery/battery-acpi.c
-+++ b/applets/battery/battery-acpi.c
-@@ -14,8 +14,6 @@ int batt_state, ac_state;
- int pm_support(void)
- {
- 	if(check_acpi_support() == NOT_SUPPORTED){
--		g_warning("No ACPI support\n");
--
- 		return 0;
- 	}
- 
-@@ -32,8 +30,9 @@ const char* pm_battery_icon(void)
- 	const char *icon;
- 	battery_t *binfo;
- 
-+        /* No battery available (not present, disabled, or something
-+           else. Silently do nothing. */
- 	if (batt_state != SUCCESS) {
--		g_warning("Couldnt initialize ACPI battery\n");
- 		return NULL;
- 	}
- 
-diff --git a/applets/battery/battery-apm.c b/applets/battery/battery-apm.c
-index 5467438..2f39cb6 100644
---- a/applets/battery/battery-apm.c
-+++ b/applets/battery/battery-apm.c
-@@ -10,8 +10,6 @@
- int pm_support(void)
- {
- 	if (1 == apm_exists ()) {
--                g_warning ("No APM support");
--
-                 return 0;
-         }
- 
-diff --git a/matchbox-panel/mb-panel.c b/matchbox-panel/mb-panel.c
-index 2d8cafd..828a36d 100644
---- a/matchbox-panel/mb-panel.c
-+++ b/matchbox-panel/mb-panel.c
-@@ -110,10 +110,15 @@ load_applets (const char    *applets_desc,
-         applets = g_strsplit (applets_desc, ",", -1);
- 
-         for (i = 0; applets[i]; i++) {
-+                char *s;
-                 char **bits;
-                 GtkWidget *applet;
- 
--                bits = g_strsplit (applets[i], ":", 2);
-+                s = applets[i];
-+                if (s == NULL || s[0] == '\0')
-+                        continue;
-+
-+                bits = g_strsplit (s, ":", 2);
- 
-                 applet = load_applet (bits[0],
-                                       bits[1],
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 61d9e30..5bd629f 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -5,24 +5,23 @@ BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://matchbox-panel/mb-panel.h;endline=10;md5=0b7db28f4b6863fb853d0467e590019a \
-                    file://applets/startup/startup.c;endline=22;md5=b0a64fbef3097d79f8264e6907a98f03"
+                    file://applets/startup/startup.c;endline=22;md5=7cbcea60b667f609495222faf3e07917"
 
-DEPENDS = "gnome-common gtk+ startup-notification dbus dbus-glib"
+DEPENDS = "gnome-common gtk+3 startup-notification dbus dbus-glib"
 DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
 DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 # The startup-notification requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRCREV = "26a3a67b41c50e0ae163d8fe86ccf7a0f0a671ae"
+SRCREV = "96c8a89b264a9c19faaa70750c40f3448beb4df2"
 PV = "2.0+git${SRCPV}"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
-           file://silence-warnings.patch"
+SRC_URI = "git://github.com/jku/matchbox-panel-2.git;branch=gtk3"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
@@ -32,7 +31,8 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} += "${libdir}/matchbox-panel/*.so \
                 ${datadir}/matchbox-panel/brightness/*.png \
-                ${datadir}/matchbox-panel/startup/*.png "
+                ${datadir}/matchbox-panel/startup/*.png \
+                ${datadir}/icons/"
 FILES_${PN}-dev += "${libdir}/matchbox-panel/*.la"
 
 inherit autotools pkgconfig distro_features_check
-- 
2.1.4


