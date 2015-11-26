Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF64605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574647"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:05 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:11 +0200
Message-Id: <7eb04ecd70414c80f28c0b17c88ea51be60d1628.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/29] avahi: enable gobject-introspection
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:04 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb |  2 ++
 meta/recipes-connectivity/avahi/avahi.inc          | 12 +++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
index 11066e2..5dabbae 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
@@ -67,5 +67,7 @@ do_install_append () {
 	rm ${D}${mandir}/man1/a*
 	rm ${D}${mandir}/man5 -rf
 	rm ${D}${mandir}/man8 -rf
+        rm ${D}${libdir}/girepository-1.0/ -rf
+        rm ${D}${datadir}/gir-1.0/ -rf
 }
 
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 825197d..14f487e 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -40,10 +40,9 @@ USERADD_PARAM_avahi-autoipd = "--system --home /var/run/avahi-autoipd \
                               -c \"Avahi autoip daemon\" \
                               avahi-autoipd"
 
-inherit autotools pkgconfig update-rc.d gettext useradd
+inherit autotools pkgconfig update-rc.d gettext useradd gobject-introspection
 
-EXTRA_OECONF = "--disable-introspection \
-             --with-avahi-priv-access-group=adm \
+EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
              --disable-stack-protector \
              --disable-gdbm \
              --disable-mono \
@@ -70,6 +69,9 @@ do_configure_prepend() {
     sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
 }
 
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
+}
 
 PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
 
@@ -82,7 +84,7 @@ FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/udhcpc.d/00avahi-autoipd \
                        ${sysconfdir}/udhcpc.d/99avahi-autoipd"
 FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
-FILES_libavahi-core = "${libdir}/libavahi-core.so.*"
+FILES_libavahi-core = "${libdir}/libavahi-core.so.* ${libdir}/girepository-1.0/AvahiCore*.typelib"
 FILES_avahi-daemon = "${sbindir}/avahi-daemon \
                       ${sysconfdir}/avahi/avahi-daemon.conf \
                       ${sysconfdir}/avahi/hosts \
@@ -99,7 +101,7 @@ FILES_avahi-dnsconfd = "${sbindir}/avahi-dnsconfd \
                         ${sysconfdir}/avahi/avahi-dnsconfd.action \
                         ${sysconfdir}/init.d/avahi-dnsconfd"
 FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
-FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
+FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*  ${libdir}/girepository-1.0/Avahi*.typelib"
 FILES_avahi-utils = "${bindir}/avahi-*"
 
 RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
-- 
2.6.2


