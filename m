Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F0B5F7422C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:07:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 11 Mar 2016 05:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907975238"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 05:07:01 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:25 +0200
Message-Id: <9f3553e7d4f345289f8ce4681d3fdb5bc1f661a0.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
References: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Subject: [RFC PATCH 06/12] matchbox-session-sato: Update session startup
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

* Use Adwaita Gtk+ theme
* sato-gtk-engine is no longer needed with Adwaita
* GTK_CSD tricks are no longer needed since the panel
  does not draw on top windows

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/matchbox-sato/matchbox-session-sato/session | 9 ++-------
 meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb  | 4 ++--
 2 files changed, 4 insertions(+), 9 deletions(-)

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
index 76de18a..d5bdd19 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be6
 
 SECTION = "x11"
 DEPENDS = "gconf-native"
-RDEPENDS_${PN} = "formfactor gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato matchbox-session gconf"
+RDEPENDS_${PN} = "formfactor matchbox-theme-sato matchbox-panel-2 matchbox-desktop-sato matchbox-session gconf"
 PR = "r30"
 
 # This package is architecture specific because the session script is modified
@@ -44,7 +44,7 @@ pkg_postinst_${PN} () {
 		#type, name, value
 		gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type $1 --set /desktop/poky/interface/$2 "$3"
 	}
-	set_value string theme Sato
+	set_value string theme Adwaita
 	set_value string icon_theme Sato
 	set_value bool touchscreen true
 	set_value string font_name "Sans 9"
-- 
2.1.4


