Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CCB7577150
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174425"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:08 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:27 +0300
Message-Id: <7ecc446309e1c0368ff482dce7f7978cff3fd6d7.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/37] matchbox-keyboard: Enable GTK+3 IM module
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:32 -0000

* Build GTK+3 im module (and no GTK+2 by default)
* Fix FILES for this case

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index fb4c6e9..c7870cf 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -26,7 +26,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "--disable-cairo"
 
-PACKAGECONFIG ??= "gtk2-im applet"
+PACKAGECONFIG ??= "gtk3-im applet"
 PACKAGECONFIG[applet] = "--enable-applet,--disable-applet,matchbox-panel-2"
 PACKAGECONFIG[gtk2-im] = "--enable-gtk-im,--disable-gtk-im,gtk+"
 PACKAGECONFIG[gtk3-im] = "--enable-gtk3-im,--disable-gtk3-im,gtk+3"
@@ -39,7 +39,8 @@ FILES_${PN} = "${bindir}/ \
 	       ${datadir}/pixmaps \
 	       ${datadir}/matchbox-keyboard"
 
-FILES_${PN}-im = "${libdir}/gtk-2.0/*/immodules/*.so"
+FILES_${PN}-im = "${libdir}/gtk-2.0/*/immodules/*.so \
+                  ${libdir}/gtk-3.0/*/immodules/*.so"
 
 FILES_${PN}-applet = "${libdir}/matchbox-panel/*.so"
 
@@ -49,6 +50,7 @@ do_install_append () {
 	install -m 755 ${WORKDIR}/80matchboxkeyboard.sh ${D}/${sysconfdir}/X11/Xsession.d/
 
 	rm -f ${D}${libdir}/gtk-2.0/*/immodules/*.la
+	rm -f ${D}${libdir}/gtk-3.0/*/immodules/*.la
 	rm -f ${D}${libdir}/matchbox-panel/*.la
 }
 
-- 
2.1.4


