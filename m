Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 361B7731DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718728103"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:28 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:46 +0300
Message-Id: <f0e9fe7730298c97a4d43f7ef271e530d7de648c.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 22/30] avahi-ui: Build with Gtk+3
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:28 -0000

Add patch to install GtkBuilder ui files for GTK+3.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb | 11 +++++----
 ...c-install-GtkBuilder-interface-files-for-.patch | 28 ++++++++++++++++++++++
 2 files changed, 34 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
index 1b3e918..c6f67f1 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
@@ -7,14 +7,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 require avahi.inc
 
 inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
+SRC_URI += "file://0001-configure.ac-install-GtkBuilder-interface-files-for-.patch"
 SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
 SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
 
-DEPENDS += "avahi gtk+ libglade"
+DEPENDS += "avahi gtk+3"
 
-AVAHI_GTK = "--enable-gtk --disable-gtk3 --disable-pygtk"
+AVAHI_GTK = "--disable-gtk --enable-gtk3 --disable-pygtk"
 
 S = "${WORKDIR}/avahi-${PV}"
 
@@ -27,9 +28,9 @@ FILES_${PN}-staticdev += "${libdir}/libavahi-ui.a"
 FILES_${PN}-utils = "${bindir}/b* ${datadir}/applications/b*"
 
 FILES_avahi-discover = "${datadir}/applications/avahi-discover.desktop \
-                        ${datadir}/avahi/interfaces/avahi-discover* \
+                        ${datadir}/avahi/interfaces/avahi-discover.ui \
                         ${bindir}/avahi-discover-standalone \
-                        ${datadir}/avahi/interfaces/avahi-discover.glade"
+                        "
 
 do_install_append () {
 	rm ${D}${sysconfdir} -rf
diff --git a/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch b/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
new file mode 100644
index 0000000..8ccef08
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
@@ -0,0 +1,28 @@
+From a59f13fab31a6e25bb03b2c2bc3aea576f857b6c Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Sun, 12 Jun 2016 18:32:49 +0300
+Subject: [PATCH] configure.ac: install GtkBuilder interface files for GTK+3
+ too
+
+Upstream-Status: Pending
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index aebb716..48bdf63 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -965,7 +965,7 @@ AC_SUBST(avahi_socket)
+ #
+ # Avahi interfaces dir
+ #
+-if test "x$HAVE_PYTHON_DBUS" = "xyes" -o "x$HAVE_GTK" = "xyes"; then
++if test "x$HAVE_PYTHON_DBUS" = "xyes" -o "x$HAVE_GTK" = "xyes" -o "x$HAVE_GTK3" = "xyes"; then
+ 	interfacesdir="${datadir}/${PACKAGE}/interfaces/"
+ 	AC_SUBST(interfacesdir)
+ fi
+-- 
+2.1.4
+
-- 
2.1.4


