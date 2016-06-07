Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 63E91771D6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 01:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174740"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:42 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:50 +0300
Message-Id: <7c411414412cb766d0f2f01ec7d84800e13578ab.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 32/37] matchbox-session-sato: Update session startup
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:49 -0000

* Use Adwaita Gtk+ theme
* sato-gtk-engine is no longer needed with Adwaita
* GTK_CSD tricks are no longer needed since the panel
  does not draw on top windows
* Add meta-theme index file: it used to be provided by gtk-sato-engine
  and is used by matchbox-config-gtk only (to be able to show a single
  selection for Gtk+, icon and Matchbox themes). This is a more
  logical place for it.
* Set matchbox-theme gconf key (just to be explicit, this is the
  default already)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../matchbox-sato/matchbox-session-sato/index.theme           |  7 +++++++
 meta/recipes-sato/matchbox-sato/matchbox-session-sato/session |  9 ++-------
 meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb  | 11 ++++++++---
 3 files changed, 17 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-sato/matchbox-session-sato/index.theme

diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/index.theme b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/index.theme
new file mode 100644
index 0000000..c9260cf
--- /dev/null
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/index.theme
@@ -0,0 +1,7 @@
+[X-GNOME-Metatheme]
+Encoding=UTF-8
+Type=X-GNOME-Metatheme
+Name=Sato
+GtkTheme=Adwaita
+IconTheme=Sato
+MatchboxTheme=Sato
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
index 42ce483..f6313bd 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
@@ -14,11 +14,6 @@ else
     KEYBOARD_APPLET="keyboard"
 fi
 
-# Tell GTK+3 we really want server side decorations, even with
-# GtkHeaderBar using applications: Without that mb-panel will render
-# on top of the client side decorations.
-export GTK_CSD=0
-
 matchbox-desktop &
 
 # Lines containing feature-[foo] are removed at build time if the machine
@@ -28,6 +23,6 @@ START_APPLETS=showdesktop,windowselector
 END_APPLETS=clock,battery,$KEYBOARD_APPLET,systray,startup-notify,notify
 END_APPLETS=openmoko-panel-gsm,$END_APPLETS # feature-phone
 
-matchbox-panel --titlebar --start-applets $START_APPLETS --end-applets $END_APPLETS &
+matchbox-panel --start-applets $START_APPLETS --end-applets $END_APPLETS &
 
-exec matchbox-window-manager -theme Sato -use_desktop_mode decorated -use_cursor $SHOWCURSOR $@
+exec matchbox-window-manager -theme Sato -use_cursor $SHOWCURSOR $@
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 76de18a..fb4750b 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be6
 
 SECTION = "x11"
 DEPENDS = "gconf-native"
-RDEPENDS_${PN} = "formfactor gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato matchbox-session gconf"
+RDEPENDS_${PN} = "formfactor matchbox-theme-sato matchbox-panel-2 matchbox-desktop-sato matchbox-session gconf"
 PR = "r30"
 
 # This package is architecture specific because the session script is modified
@@ -19,9 +19,12 @@ inherit distro_features_check
 # The matchbox-theme-sato requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "file://session"
+SRC_URI = "file://session \
+           file://index.theme"
 S = "${WORKDIR}"
 
+FILES_${PN} += "${datadir}/themes/Sato/index.theme"
+
 do_install() {
 	# This is the set of machine features that the script has markers for
 	FEATURES="phone"
@@ -34,6 +37,7 @@ do_install() {
 		fi
 	done
 
+	install -D ${S}/index.theme ${D}/${datadir}/themes/Sato/index.theme
 	install -d ${D}/${sysconfdir}/matchbox
 	sed -f "$SCRIPT" ${S}/session > ${D}/${sysconfdir}/matchbox/session
         chmod +x ${D}/${sysconfdir}/matchbox/session
@@ -44,7 +48,8 @@ pkg_postinst_${PN} () {
 		#type, name, value
 		gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type $1 --set /desktop/poky/interface/$2 "$3"
 	}
-	set_value string theme Sato
+	set_value string theme Adwaita
+	set_value string matchbox_theme Sato
 	set_value string icon_theme Sato
 	set_value bool touchscreen true
 	set_value string font_name "Sans 9"
-- 
2.1.4


