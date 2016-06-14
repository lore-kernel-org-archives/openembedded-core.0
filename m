Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 78DE3731BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718727857"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:10 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:32 +0300
Message-Id: <04d959ce991abec839d6b96f2ef8e6bad6d9f9e9.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 08/30] matchbox-keyboard: Enable GTK+3 IM module
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:10 -0000

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


