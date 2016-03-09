Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C7AF36FFEA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:07:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083660"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:57 +0200
Message-Id: <a5e66c4ddf4c0a9c5f01223d5c03eab3ed01cccd.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/24] avahi: enable gobject-introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:07:23 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb |  2 ++
 meta/recipes-connectivity/avahi/avahi.inc          | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
index eb8a35e..7f5dfb3 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
@@ -64,5 +64,7 @@ do_install_append () {
 	rm ${D}${mandir}/man1/a*
 	rm ${D}${mandir}/man5 -rf
 	rm ${D}${mandir}/man8 -rf
+        rm ${D}${libdir}/girepository-1.0/ -rf
+        rm ${D}${datadir}/gir-1.0/ -rf
 }
 
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index faa8ee8..cd5c804 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -34,10 +34,9 @@ USERADD_PARAM_avahi-autoipd = "--system --home /var/run/avahi-autoipd \
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
@@ -63,8 +62,14 @@ LDFLAGS_append_uclinux-uclibc = " -lintl"
 
 do_configure_prepend() {
     sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
+
+    # This m4 file will get in the way of our introspection.m4 with special cross-compilation fixes
+    rm "${S}/common/introspection.m4" || true
 }
 
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
+}
 
 PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
 
@@ -77,7 +82,7 @@ FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/udhcpc.d/00avahi-autoipd \
                        ${sysconfdir}/udhcpc.d/99avahi-autoipd"
 FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
-FILES_libavahi-core = "${libdir}/libavahi-core.so.*"
+FILES_libavahi-core = "${libdir}/libavahi-core.so.* ${libdir}/girepository-1.0/AvahiCore*.typelib"
 FILES_avahi-daemon = "${sbindir}/avahi-daemon \
                       ${sysconfdir}/avahi/avahi-daemon.conf \
                       ${sysconfdir}/avahi/hosts \
@@ -94,7 +99,7 @@ FILES_avahi-dnsconfd = "${sbindir}/avahi-dnsconfd \
                         ${sysconfdir}/avahi/avahi-dnsconfd.action \
                         ${sysconfdir}/init.d/avahi-dnsconfd"
 FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
-FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
+FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*  ${libdir}/girepository-1.0/Avahi*.typelib"
 FILES_avahi-utils = "${bindir}/avahi-*"
 
 RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
-- 
2.7.0


