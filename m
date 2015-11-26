Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 150C0601D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574575"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:03 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:09 +0200
Message-Id: <0660fb178a5d671eb8fb4fd7db00a3cf4cf67a06.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/29] avahi-ui: remove the dependency on python-pygtk by disabling avahi-discover
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:02 -0000

python-pygtk is removed in a separate commit; the reasons for
that are explained in that commit's message.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
index 0d42b90..11066e2 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
@@ -19,11 +19,11 @@ SRC_URI[sha256sum] = "8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a
 
 DEPENDS += "avahi gtk+ libglade"
 
-AVAHI_GTK = "--enable-gtk --disable-gtk3"
+AVAHI_GTK = "--enable-gtk --disable-gtk3 --disable-pygtk"
 
 S = "${WORKDIR}/avahi-${PV}"
 
-PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc python-avahi avahi-discover avahi-discover-standalone"
+PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc python-avahi avahi-discover"
 
 FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
 FILES_${PN}-dbg += "${libdir}/.debug/libavah-ui*"
@@ -33,13 +33,11 @@ FILES_${PN}-staticdev += "${libdir}/libavahi-ui.a"
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
2.6.2


