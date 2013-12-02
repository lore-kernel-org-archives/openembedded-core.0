Return-Path: <ulf@emagii.com>
Received: from smtprelay-b32.telenor.se (smtprelay-b32.telenor.se
	[213.150.131.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8CA6DD10
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 21:42:21 +0000 (UTC)
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b32.telenor.se (Postfix) with ESMTP id C8699E97DB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 22:42:19 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvRgAK/9nFJT4zlmPGdsb2JhbABZJoJgAQE3shKHKIElFwMBAQEBODWCJQFRAQojMB9LCiQJiAUBCLR+AYsQjwiEOgOYFIEwlA07
X-IronPort-AV: E=Sophos;i="4.93,813,1378850400"; d="scan'208";a="683928207"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	hexagon.bredbandsbolaget.se) ([83.227.57.102])
	by ipb2.telenor.se with ESMTP; 02 Dec 2013 22:42:19 +0100
From: ulf@emagii.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 19:36:14 +0100
Message-Id: <1386009374-29047-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH v2] curlpp: add curl c++ bindings
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
X-List-Received-Date: Mon, 02 Dec 2013 21:42:22 -0000

From: Ulf Samuelsson <ulf@emagii.com>

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 .../curlpp/curlpp/pkgconfig_fix.patch              |   38 +++++++++
 meta/recipes-support/curlpp/curlpp_0.7.3.bb        |   89 ++++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-support/curlpp/curlpp/pkgconfig_fix.patch
 create mode 100644 meta/recipes-support/curlpp/curlpp_0.7.3.bb

diff --git a/meta/recipes-support/curlpp/curlpp/pkgconfig_fix.patch b/meta/recipes-support/curlpp/curlpp/pkgconfig_fix.patch
new file mode 100644
index 0000000..ad73c00
--- /dev/null
+++ b/meta/recipes-support/curlpp/curlpp/pkgconfig_fix.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Inappropriate [packaging]
+
+
+Index: curl-7.20.0/libcurl.pc.in
+===================================================================
+--- curl-7.20.0.orig/libcurl.pc.in	2009-11-17 18:11:07.000000000 +0000
++++ curl-7.20.0/libcurl.pc.in	2010-03-25 12:13:26.814051066 +0000
+@@ -35,6 +35,7 @@
+ URL: http://curl.haxx.se/
+ Description: Library to transfer files with ftp, http, etc.
+ Version: @CURLVERSION@
+-Libs: -L${libdir} -lcurl @LIBS@
+-Libs.private: @LIBCURL_LIBS@ @LIBS@
++Requires.private: @GNUTLS_REQUIRED@
++Libs: -L${libdir} -lcurl
++Libs.private: -ldl -lz
+ Cflags: -I${includedir}
+Index: curl-7.20.0/configure.ac
+===================================================================
+--- curl-7.20.0.orig/configure.ac	2010-02-04 21:41:46.000000000 +0000
++++ curl-7.20.0/configure.ac	2010-03-25 12:12:18.673129001 +0000
+@@ -1668,6 +1668,7 @@
+        AC_SUBST(USE_GNUTLS, [1])
+        GNUTLS_ENABLED=1
+        USE_GNUTLS="yes"
++       GNUTLS_REQUIRED="gnutls"
+        curl_ssl_msg="enabled (GnuTLS)"
+        ],
+        [
+@@ -1696,6 +1697,8 @@
+ 
+ fi dnl OPENSSL != 1
+ 
++AC_SUBST(GNUTLS_REQUIRED)
++
+ dnl ----------------------------------------------------
+ dnl NSS. Only check if GnuTLS and OpenSSL are not enabled
+ dnl ----------------------------------------------------
diff --git a/meta/recipes-support/curlpp/curlpp_0.7.3.bb b/meta/recipes-support/curlpp/curlpp_0.7.3.bb
new file mode 100644
index 0000000..2d6dc39
--- /dev/null
+++ b/meta/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -0,0 +1,89 @@
+DESCRIPTION = "C++ library for client-side URL transfers."
+HOMEPAGE = "http://code.google.com/p/curlpp/"
+SECTION = "console/network"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+DEPENDS = "curl boost"
+DEPENDS_class-native = "curl-native"
+PR = "r1"
+
+SRC_URI = "http://curlpp.googlecode.com/files/curlpp-${PV}.tar.gz \
+	"
+
+SRC_URI[md5sum] = "ccc3d30d4b3b5d2cdbed635898c29485"
+SRC_URI[sha256sum] = "e3f9427b27c5bddf898d383d45c0d3d5397e2056ff935d9a5cdaef6a9a653bd5"
+
+inherit autotools pkgconfig binconfig
+
+EXTRA_OECONF = "--prefix=${STAGING_DIR} \
+		--with-boost=${STAGING_DIR} \
+		"
+
+
+do_install() {
+	install -d ${D}/${includedir}/curlpp
+	cp -r include/curlpp/* 					${D}${includedir}/curlpp
+
+	install -d ${D}${includedir}/utilspp
+	cp -r include/utilspp/* 				${D}${includedir}/utilspp
+
+	install -d ${D}/${libdir}
+	install	-m 664 src/curlpp/.libs/libcurlpp.a		${D}/${libdir}
+	install	-m 664 src/curlpp/.libs/libcurlpp.lai		${D}/${libdir}/libcurlpp.la
+
+	install	-m 775 src/curlpp/.libs/libcurlpp.so.0.0.2	${D}/${libdir}
+
+	install	-m 664 src/utilspp/.libs/libutilspp.a		${D}/${libdir}
+	install	-m 664 src/utilspp/.libs/libutilspp.lai		${D}/${libdir}/libutilspp.la
+
+	install	-m 664 src/utilspp/.libs/libutilspp.so.0.0.0	${D}/${libdir}
+
+	install -d ${D}/${libdir}/pkgconfig
+	install	-m 664 curlpp.pc				${D}/${libdir}/pkgconfig
+
+	install -d ${D}/${bindir}
+	install	-m 755 curlpp-config 				${D}/${bindir}
+
+	install -d ${D}/${includedir}/curlpp
+	install -d ${D}/${includedir}/curlpp/internal
+	install -d ${D}/${includedir}/utilspp
+	install -d ${D}/${includedir}/utilspp/functor
+	install -d ${D}/${includedir}/utilspp/singleton
+
+	install	-m 664 include/curlpp/config*			${D}/${includedir}/curlpp
+	install	-m 664 include/curlpp/*.h*			${D}/${includedir}/curlpp
+	install	-m 664 include/curlpp/*.inl			${D}/${includedir}/curlpp
+
+	install	-m 664 include/curlpp/internal/*.h*		${D}/${includedir}/curlpp/internal
+	install	-m 664 include/curlpp/internal/*.inl		${D}/${includedir}/curlpp/internal
+
+	install	-m 664 include/utilspp/*.h*			${D}/${includedir}/utilspp
+	install	-m 664 include/utilspp/*.inl			${D}/${includedir}/utilspp
+
+	install	-m 664 include/utilspp/functor/*.h*		${D}/${includedir}/utilspp/functor
+	install	-m 664 include/utilspp/singleton/*.h*		${D}/${includedir}/utilspp/singleton
+	install	-m 664 include/utilspp/singleton/*.inl		${D}/${includedir}/utilspp/singleton
+	install -m 755 curlpp-config				${D}/${bindir}
+}
+
+pkg_postinst_${PN}() {
+	ln	-sf	libcurlpp.so.0.0.2			/usr/lib/libcurlpp.so.0
+	ln	-sf	libcurlpp.so.0.0.2			/usr/lib/libcurlpp.so
+	ln	-sf	libutilspp.so.0.0.0			/usr/lib/libutilspp.so.0
+	ln	-sf	libutilspp.so.0.0.0			/usr/lib/libutilspp.so
+}
+
+PACKAGES =+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
+
+FILES_lib${BPN} = "${libdir}/lib*.so.* \
+		"
+
+FILES_lib${BPN}-dev = "${includedir} \
+                      ${libdir}/lib*.la \
+                      ${libdir}/pkgconfig \
+                      ${bindir}/*-config"
+
+FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5


