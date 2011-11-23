Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RT6kk-0005yb-2C
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 07:56:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAN6nkM0013593
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 22:49:46 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 Nov 2011 22:49:45 -0800
Message-ID: <063bc393a0f76dcd694c02e4a66277a21be79721.1322028165.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322028165.git.xiaofeng.yan@windriver.com>
References: <cover.1322028165.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 23 Nov 2011 13:28:46 +0800
Date: Wed, 23 Nov 2011 14:47:54 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] gtk.inc: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 06:56:18 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

gtk run over x11 at current OE-core. If gtk want to run over directfb, then \
the configuration related to x11 should be disabled and directfb should be enabled.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc |   20 ++++++++++++++++----
 1 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 0e5c45c..926f7dd 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -9,13 +9,20 @@ LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SECTION = "libs"
-DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
-           gtk-doc-native docbook-utils-native libxrandr libgcrypt \
-           libxdamage libxrender libxcomposite cairo gdk-pixbuf"
+X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
+
+DEPENDS = "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native \
+           libgcrypt cairo gdk-pixbuf"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+
+PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
+PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
 
 inherit autotools pkgconfig
 
-PACKAGES += "libgail"
+PACKAGES += "libgail gtk-demo"
 
 FILES_${PN} = "${bindir}/gtk-update-icon-cache \
 	${bindir}/gtk-query-immodules-2.0 \
@@ -40,6 +47,11 @@ FILES_${PN}-dbg += " \
 	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
 	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
 
+FILES_gtk-demo = " \
+        ${datadir}/gtk-2.0/demo/* \
+        ${bindir}/gtk-demo \
+        "
+
 FILES_libgail = " \
 	${libdir}/gtk-2.0/modules/libgail.so \
 	${libdir}/gtk-2.0/modules/libferret.so \
-- 
1.7.0.4



