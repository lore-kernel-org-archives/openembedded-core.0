Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F3F086FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:07:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083638"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:55 +0200
Message-Id: <92f6f1a954b922454b86988c2198265cc863abed.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/24] avahi-ui: remove the dependency on python-pygtk by disabling avahi-discover
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
X-List-Received-Date: Wed, 09 Mar 2016 15:07:21 -0000

python-pygtk is removed in a separate commit; the reasons for
that are explained in that commit's message.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
index aafb52e..eb8a35e 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
@@ -17,11 +17,11 @@ SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc
 
 DEPENDS += "avahi gtk+ libglade"
 
-AVAHI_GTK = "--enable-gtk --disable-gtk3"
+AVAHI_GTK = "--enable-gtk --disable-gtk3 --disable-pygtk"
 
 S = "${WORKDIR}/avahi-${PV}"
 
-PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc python-avahi avahi-discover avahi-discover-standalone"
+PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc python-avahi avahi-discover"
 
 FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
 FILES_${PN}-dev += "${libdir}/libavahi-ui${SOLIBSDEV}"
@@ -30,13 +30,11 @@ FILES_${PN}-staticdev += "${libdir}/libavahi-ui.a"
 FILES_${PN}-utils = "${bindir}/b* ${datadir}/applications/b*"
 
 FILES_python-avahi = "${PYTHON_SITEPACKAGES_DIR}/avahi ${PYTHON_SITEPACKAGES_DIR}/avahi_discover"
-FILES_avahi-discover = "${bindir}/avahi-discover \
-                        ${datadir}/applications/avahi-discover.desktop \
-                        ${datadir}/avahi/interfaces/avahi-discover*"
-FILES_avahi-discover-standalone = "${bindir}/avahi-discover-standalone \
-                                   ${datadir}/avahi/interfaces/avahi-discover.glade"
+FILES_avahi-discover = "${datadir}/applications/avahi-discover.desktop \
+                        ${datadir}/avahi/interfaces/avahi-discover* \
+                        ${bindir}/avahi-discover-standalone \
+                        ${datadir}/avahi/interfaces/avahi-discover.glade"
 
-RDEPENDS_avahi-discover = "python-avahi python-pygtk"
 RDEPENDS_python-avahi = "python-core python-dbus"
 
 
-- 
2.7.0


