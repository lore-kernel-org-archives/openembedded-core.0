Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TkwB0-0007Fc-5r
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:21:41 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Dec 2012 04:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="235641352"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2012 04:06:54 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 14:06:52 +0200
Message-Id: <1355832412-1333-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] matchbox-session-sato: use a proper schema file
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
X-List-Received-Date: Tue, 18 Dec 2012 12:21:41 -0000

Also, inheriting gconf.bbclass will allow for the schema registration to
be done at do_rootfs time.

[YOCTO #3603]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../matchbox-session-sato.schemas                  |   53 ++++++++++++++++++++
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |   21 +++-----
 2 files changed, 60 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-sato/matchbox-session-sato/matchbox-session-sato.schemas

diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/matchbox-session-sato.schemas b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/matchbox-session-sato.schemas
new file mode 100644
index 0000000..f5b770b
--- /dev/null
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/matchbox-session-sato.schemas
@@ -0,0 +1,53 @@
+<?xml version="1.0"?>
+<gconfschemafile>
+<schemalist>
+
+  <schema>
+    <key>/schemas/desktop/poky/interface/theme</key>
+    <applyto>/desktop/poky/interface/theme</applyto>
+    <type>string</type>
+    <owner>matchbox-session-sato</owner>
+    <default>Sato</default>
+    <locale name="C">
+      <short>Desktop theme</short>
+      <long>The theme name for Matchbox and Sato to use.</long>
+    </locale>
+  </schema>
+
+  <schema>
+    <key>/schemas/desktop/poky/interface/icon_theme</key>
+    <applyto>/desktop/poky/interface/icon_theme</applyto>
+    <type>string</type>
+    <owner>matchbox-session-sato</owner>
+    <default>Sato</default>
+    <locale name="C">
+      <short>Desktop icon theme</short>
+      <long>The icon theme name for Matchbox and Sato.</long>
+    </locale>
+  </schema>
+
+  <schema>
+    <key>/schemas/desktop/poky/interface/touchscreen</key>
+    <applyto>/desktop/poky/interface/touchscreen</applyto>
+    <type>bool</type>
+    <owner>matchbox-session-sato</owner>
+    <default>true</default>
+    <locale name="C">
+      <short>Activate touchscreen</short>
+    </locale>
+  </schema>
+
+  <schema>
+    <key>/schemas/desktop/poky/interface/font_name</key>
+    <applyto>/desktop/poky/interface/font_name</applyto>
+    <type>string</type>
+    <owner>matchbox-session-sato</owner>
+    <default>Sans 9</default>
+    <locale name="C">
+      <short>Font name</short>
+    </locale>
+  </schema>
+
+</schemalist>
+</gconfschemafile>
+
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 10fd5b4..2d34754 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -16,7 +16,9 @@ PR = "r29"
 # based on the machine architecture.
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "file://session"
+SRC_URI = "file://session \
+           file://matchbox-session-sato.schemas \
+          "
 S = "${WORKDIR}"
 
 do_install() {
@@ -34,18 +36,9 @@ do_install() {
 	install -d ${D}/${sysconfdir}/matchbox
 	sed -f "$SCRIPT" ${S}/session > ${D}/${sysconfdir}/matchbox/session
         chmod +x ${D}/${sysconfdir}/matchbox/session
-}
-
-pkg_postinst_${PN} () {
-#!/bin/sh -e
-if [ "x$D" != "x" ]; then
-    exit 1
-fi
 
-. ${sysconfdir}/init.d/functions
-
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/theme Sato
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/icon_theme Sato
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type bool --set /desktop/poky/interface/touchscreen true
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/font_name "Sans 9"
+	install -d ${D}/${sysconfdir}/gconf/schemas
+	install -m 664 ${S}/matchbox-session-sato.schemas ${D}/${sysconfdir}/gconf/schemas
 }
+
+inherit gconf
-- 
1.7.9.5



