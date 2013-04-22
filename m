Received: from mail-wg0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUGPc-0003H8-PS
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 15:04:06 +0200
Received: by mail-wg0-f49.google.com with SMTP id x12so914539wgg.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 05:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=uffhNY9TntcQWPNdbfMMtDSI1xUG4tUtt2xbhpukjFo=;
	b=GcUfJbg2yN+kpQD6linTSaM+FCDn4UnE3GnAzotAVKaKahGKkKHSnOh04lLyIumkgU
	Kj1Zk9NoN7RLdIIclD59Q9mXeijZV1Qc0SEbHOtYaPPVMsFUSHbwxmYXbBOSTTs6SjUh
	kWkP3XtOZYhfAdyFcEY6dGtePYAhDubAxbXyQz86OV5R2/1wBAwsvMXISz+BsTbof2kT
	tnWXTwB5TTUT0y5wcX2B6P9eDDthRE8kkztV26mpeA+P/JbM13IGpbAlSCpegHuZDWG6
	MdGNT6m8ukeGd+EMBMBZv//ojyrnE0CnxAa9568DjJYrJxvKHYkPMkEPgcUavFEvoNWV
	+HYA==
X-Received: by 10.194.8.99 with SMTP id q3mr51651848wja.34.1366634785770;
	Mon, 22 Apr 2013 05:46:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id t14sm20552147wib.0.2013.04.22.05.46.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 05:46:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2013 13:43:32 +0100
Message-Id: <1366634612-3453-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlW2TtCBhsUx56ZNt182OsY8h/daP8k1pMWOpwloH7QSvTpkPxruT41QY1UCpXcQaMiJSQm
Subject: [PATCH] matchbox-session-sato: install GConf values directly instead of using schemas
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
X-List-Received-Date: Mon, 22 Apr 2013 13:04:07 -0000

Because both matchbox-session-sato and settings-daemon were attempting to
install their preferred values though schemas there was a race as to which ones
were used.

Revert matchbox-session-sato back to writing the values directly, adding a
dependency on gconf-native so that this can happen on the host.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../matchbox-session-sato.schemas                  |   53 --------------------
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |   21 +++++---
 2 files changed, 13 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-sato/matchbox-session-sato/matchbox-session-sato.schemas

diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/matchbox-session-sato.schemas b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/matchbox-session-sato.schemas
deleted file mode 100644
index f5b770b..0000000
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/matchbox-session-sato.schemas
+++ /dev/null
@@ -1,53 +0,0 @@
-<?xml version="1.0"?>
-<gconfschemafile>
-<schemalist>
-
-  <schema>
-    <key>/schemas/desktop/poky/interface/theme</key>
-    <applyto>/desktop/poky/interface/theme</applyto>
-    <type>string</type>
-    <owner>matchbox-session-sato</owner>
-    <default>Sato</default>
-    <locale name="C">
-      <short>Desktop theme</short>
-      <long>The theme name for Matchbox and Sato to use.</long>
-    </locale>
-  </schema>
-
-  <schema>
-    <key>/schemas/desktop/poky/interface/icon_theme</key>
-    <applyto>/desktop/poky/interface/icon_theme</applyto>
-    <type>string</type>
-    <owner>matchbox-session-sato</owner>
-    <default>Sato</default>
-    <locale name="C">
-      <short>Desktop icon theme</short>
-      <long>The icon theme name for Matchbox and Sato.</long>
-    </locale>
-  </schema>
-
-  <schema>
-    <key>/schemas/desktop/poky/interface/touchscreen</key>
-    <applyto>/desktop/poky/interface/touchscreen</applyto>
-    <type>bool</type>
-    <owner>matchbox-session-sato</owner>
-    <default>true</default>
-    <locale name="C">
-      <short>Activate touchscreen</short>
-    </locale>
-  </schema>
-
-  <schema>
-    <key>/schemas/desktop/poky/interface/font_name</key>
-    <applyto>/desktop/poky/interface/font_name</applyto>
-    <type>string</type>
-    <owner>matchbox-session-sato</owner>
-    <default>Sans 9</default>
-    <locale name="C">
-      <short>Font name</short>
-    </locale>
-  </schema>
-
-</schemalist>
-</gconfschemafile>
-
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 70cf7a9..2d18c66 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -6,16 +6,15 @@ LICENSE = "GPLv2.0+"
 LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be63"
 
 SECTION = "x11"
-RDEPENDS_${PN} = "formfactor gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato matchbox-session"
+DEPENDS = "gconf-native"
+RDEPENDS_${PN} = "formfactor gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato matchbox-session gconf"
 PR = "r30"
 
 # This package is architecture specific because the session script is modified
 # based on the machine architecture.
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "file://session \
-           file://matchbox-session-sato.schemas \
-          "
+SRC_URI = "file://session"
 S = "${WORKDIR}"
 
 do_install() {
@@ -33,9 +32,15 @@ do_install() {
 	install -d ${D}/${sysconfdir}/matchbox
 	sed -f "$SCRIPT" ${S}/session > ${D}/${sysconfdir}/matchbox/session
         chmod +x ${D}/${sysconfdir}/matchbox/session
-
-	install -d ${D}/${sysconfdir}/gconf/schemas
-	install -m 664 ${S}/matchbox-session-sato.schemas ${D}/${sysconfdir}/gconf/schemas
 }
 
-inherit gconf
+pkg_postinst_${PN} () {
+	set_value() {
+		#type, name, value
+		gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type $1 --set /desktop/poky/interface/$2 "$3"
+	}
+	set_value string theme Sato
+	set_value string icon_theme Sato
+	set_value bool touchscreen true
+	set_value string font_name "Sans 9"
+}
-- 
1.7.10.4



