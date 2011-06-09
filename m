Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUdTt-0005fi-JT
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 13:32:57 +0200
Received: by wye20 with SMTP id 20so1145269wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 04:29:37 -0700 (PDT)
Received: by 10.227.200.3 with SMTP id eu3mr661892wbb.94.1307618977432;
	Thu, 09 Jun 2011 04:29:37 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm1147124wbh.21.2011.06.09.04.29.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 04:29:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 13:29:33 +0200
Message-Id: <1307618973-32608-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] librsvg 2.32.1: fix loader packaging when using gtk >2.20
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2011 11:32:57 -0000

When using the gtk+ from OE-core you would get:

WARNING: the following files were installed but not shipped in any package:
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-svg.so

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 56c8800..a47afc6 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/utils"
 DEPENDS = "gtk+ libcroco cairo libxml2 popt"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools pkgconfig gnome
 
@@ -30,8 +30,9 @@ FILES_${PN} = "${libdir}/*.so.*"
 FILES_rsvg = "${bindir}/rsvg \
 	      ${bindir}/rsvg-view \
 	      ${bindir}/rsvg-convert \
-	      ${datadir}/pixmaps/svg-viewer.svg"
-FILES_librsvg-gtk = "${libdir}/gtk-2.0/*/*/*.so"
+	      ${datadir}/pixmaps/svg-viewer.svg \
+	      ${datadir}/themes"
+FILES_librsvg-gtk = "${libdir}/gtk-2.0/*/*/*.so ${libdir}/gdk-pixbuf-2.0/*/*/*.so"
 FILES_librsvg-gtk-dev += "${libdir}/gtk-2.0/*.*a \
 			  ${libdir}/gtk-2.0/*/loaders/*.*a \
 			  ${libdir}/gtk-2.0/*/engines/*.*a"
-- 
1.6.6.1



