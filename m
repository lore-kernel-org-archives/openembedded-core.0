Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCyNp-0006gF-SF
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 20:13:42 +0200
Received: by mail-ww0-f43.google.com with SMTP id 17so2008439wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:11:20 -0700 (PDT)
Received: by 10.216.121.130 with SMTP id r2mr210792weh.96.1303409477977;
	Thu, 21 Apr 2011 11:11:17 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f30sm1079107wef.31.2011.04.21.11.11.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:11:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 20:10:51 +0200
Message-Id: <1303409452-19263-9-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1303409452-19263-8-git-send-email-koen@dominion.thruhere.net>
References: <1303409452-19263-1-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-2-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-3-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-4-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-5-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-6-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-7-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-8-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome 09/10] libgtkstylus: import from oe-core rev 0a6f77f549c095692045825f4b5c4c5a2edff73c
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
X-List-Received-Date: Thu, 21 Apr 2011 18:13:42 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-gnome/libgtkstylus/files/gtkstylus.sh  |    5 ++++
 .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |   24 ++++++++++++++++++++
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libgtkstylus/files/gtkstylus.sh
 create mode 100644 meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb

diff --git a/meta-gnome/recipes-gnome/libgtkstylus/files/gtkstylus.sh b/meta-gnome/recipes-gnome/libgtkstylus/files/gtkstylus.sh
new file mode 100644
index 0000000..b1302ed
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgtkstylus/files/gtkstylus.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+GTK_MODULES=libgtkstylus.so
+
+export GTK_MODULES
diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
new file mode 100644
index 0000000..f614048
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "GTK plugin for stylus based systems"
+SECTION = "libs"
+DEPENDS = "gtk+"
+LICENSE = "LGPL"
+PR = "r2"
+
+inherit autotools
+
+SRC_URI = "http://burtonini.com/temp/${PN}-${PV}.tar.gz \
+	file://gtkstylus.sh"
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/X11/Xsession.d
+	install -m 755 ${WORKDIR}/gtkstylus.sh ${D}/${sysconfdir}/X11/Xsession.d/45gtkstylus
+}
+
+# Horrible but rpm falls over if you use '*'
+GTKVER = "2.10.0"
+
+FILES_${PN} = "${sysconfdir} \
+               ${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.so.*"
+FILES_${PN}-dbg += "${libdir}/gtk-2.0/${GTKVER}/modules/.debug"
+FILES_${PN}-dev += "${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.so \
+                    ${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.*a"
-- 
1.6.6.1



