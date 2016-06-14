Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DDBCA731FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718728127"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:31 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:49 +0300
Message-Id: <d3f71b24a09bd00a20aee25918ad074f6f242a19.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 25/30] matchbox-desktop: Add Sato folder configuration
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

matchbox-desktop folder configuration for Sato was in a separate
project 'matchbox-desktop-sato'. Skip the extra overhead: remove
matchbox-desktop-sato and include the files here.

Drop Utilities folder and include those icons in the Applictions
folder in an effort to make the common case a little more useful:
Now e.g. Terminal icon should be visible on startup.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../matchbox-desktop-sato_git.bb                   | 22 ----------------------
 .../matchbox-desktop/files/vfolders/All.directory  |  5 +++++
 .../files/vfolders/Applications.directory          |  6 ++++++
 .../files/vfolders/Games.directory                 |  9 +++++++++
 .../matchbox-desktop/files/vfolders/Root.order     |  4 ++++
 .../files/vfolders/Settings.directory              |  8 ++++++++
 .../matchbox-desktop/matchbox-desktop_2.1.bb       | 11 ++++++++++-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |  2 +-
 8 files changed, 43 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/vfolders/All.directory
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/vfolders/Applications.directory
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/vfolders/Games.directory
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/vfolders/Root.order
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/vfolders/Settings.directory

diff --git a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
deleted file mode 100644
index 1979cbb..0000000
--- a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Matchbox desktop folders for the Sato environment"
-HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-SECTION = "x11"
-DEPENDS = ""
-RCONFLICTS_${PN} = "matchbox-common"
-
-SRCREV = "810b0b08eb79e4685202da2ec347b990bb467e07"
-PV = "0.1+git${SRCPV}"
-PR = "r1"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "${datadir}"
diff --git a/meta/recipes-sato/matchbox-desktop/files/vfolders/All.directory b/meta/recipes-sato/matchbox-desktop/files/vfolders/All.directory
new file mode 100644
index 0000000..dfa41e3
--- /dev/null
+++ b/meta/recipes-sato/matchbox-desktop/files/vfolders/All.directory
@@ -0,0 +1,5 @@
+[Desktop Entry]
+Name=All
+Icon=mbfolder.png
+Type=Directory
+Match=meta-all
diff --git a/meta/recipes-sato/matchbox-desktop/files/vfolders/Applications.directory b/meta/recipes-sato/matchbox-desktop/files/vfolders/Applications.directory
new file mode 100644
index 0000000..a7e3501
--- /dev/null
+++ b/meta/recipes-sato/matchbox-desktop/files/vfolders/Applications.directory
@@ -0,0 +1,6 @@
+[Desktop Entry]
+Name=Applications
+Comment=Applications
+Icon=gnome-applications.png
+Type=Directory
+Match=AudioVideo;Audio;Video;Graphics;Network;Office;Utility;System;Development;meta-fallback;
diff --git a/meta/recipes-sato/matchbox-desktop/files/vfolders/Games.directory b/meta/recipes-sato/matchbox-desktop/files/vfolders/Games.directory
new file mode 100644
index 0000000..1b0928c
--- /dev/null
+++ b/meta/recipes-sato/matchbox-desktop/files/vfolders/Games.directory
@@ -0,0 +1,9 @@
+[Desktop Entry]
+Name=Games
+Name[de]=Spiele
+Comment=Games of all kind
+Comment[de]=Spiele aller Art
+Icon=mbfolder.png
+Type=Directory
+Match=Game
+
diff --git a/meta/recipes-sato/matchbox-desktop/files/vfolders/Root.order b/meta/recipes-sato/matchbox-desktop/files/vfolders/Root.order
new file mode 100644
index 0000000..01a86d2
--- /dev/null
+++ b/meta/recipes-sato/matchbox-desktop/files/vfolders/Root.order
@@ -0,0 +1,4 @@
+Applications
+Games
+Settings
+All
diff --git a/meta/recipes-sato/matchbox-desktop/files/vfolders/Settings.directory b/meta/recipes-sato/matchbox-desktop/files/vfolders/Settings.directory
new file mode 100644
index 0000000..5dde365
--- /dev/null
+++ b/meta/recipes-sato/matchbox-desktop/files/vfolders/Settings.directory
@@ -0,0 +1,8 @@
+[Desktop Entry]
+Name=Settings
+Name[de]=Einstellungen
+Comment=Settings for your handheld computer
+Comment[de]=Einstellungen für Ihren Handheld-Computer
+Icon=mbfolder.png
+Type=Directory
+Match=Settings
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb
index d6c53b0..d9a2f22 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb
@@ -12,7 +12,9 @@ SECTION = "x11/wm"
 
 # SRCREV tagged 2.1
 SRCREV = "c8473519a0f37488b8b3e839e275b000cdde0b80"
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2"
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2 \
+           file://vfolders/* \
+           "
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
@@ -22,3 +24,10 @@ inherit autotools pkgconfig distro_features_check
 
 # The startup-notification requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
+
+do_install_append() {
+    install -d ${D}${datadir}/matchbox/vfolders/
+    install -m 0644 ${WORKDIR}/vfolders/* ${D}${datadir}/matchbox/vfolders/
+}
+
+FILES_${PN} += "${datadir}/matchbox/vfolders/"
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index fb4750b..42c742f 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be6
 
 SECTION = "x11"
 DEPENDS = "gconf-native"
-RDEPENDS_${PN} = "formfactor matchbox-theme-sato matchbox-panel-2 matchbox-desktop-sato matchbox-session gconf"
+RDEPENDS_${PN} = "formfactor matchbox-theme-sato matchbox-panel-2 matchbox-desktop matchbox-session gconf"
 PR = "r30"
 
 # This package is architecture specific because the session script is modified
-- 
2.1.4


