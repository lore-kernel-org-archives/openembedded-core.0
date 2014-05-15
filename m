Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (unknown [74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id B92EA65EE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 14:01:17 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id u57so1127278wes.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 07:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JXkC8BMF1gSmPwvb+VmfV7hpNNF1cwLkKLIvSErkOuo=;
	b=HHZ6b5tJl4AFBffe+YH1+r/2qTdpZD2i1WVgu2h9+cWXC9avZHIW/cG8oGZGEzC5L0
	fRmxUXI/drccsS9dF41Nw0lKyCKOI5OJN+cLglmG707h4z/JoVA5JEAGGOBKBi/O2x1t
	36loWRA85XeTX76fOU+Lqls24AKFpo+R8j2hVBy0P95CtI2Tjo/pDtztsPQoKd+CCtfh
	EWSEMI9AYKnhUcXIYBvj6/heAdZgwh8v2ApAl6tKIXHxSO4yklESvxi+F55pbGxk7wbg
	icvHP9VzrWs1BGW2RrwdOHJ3OaPoWGZsW5V1JioXv5Th8l1c/yc0bzg0rD64nE4vmQAm
	fvig==
X-Gm-Message-State: ALoCoQmyQo2PVy/bNTRzB8w9K3XpnUyYDpYlsxRKbstkycYtDPhWmuwXvIEbbUvihsGfg61v8U7F
X-Received: by 10.180.72.204 with SMTP id f12mr3807153wiv.54.1400162477917;
	Thu, 15 May 2014 07:01:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gt4sm10042143wib.11.2014.05.15.07.01.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 May 2014 07:01:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 May 2014 15:01:07 +0100
Message-Id: <1400162467-25491-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] pango: enable ptest
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
X-List-Received-Date: Thu, 15 May 2014 14:01:25 -0000

Install the test suite for ptest.  The test suite needs some fonts to be present
to depend on liberation-fonts.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango.inc            |   21 +++++++++++++++++++--
 meta/recipes-graphics/pango/pango/no-tests.patch |   15 ---------------
 meta/recipes-graphics/pango/pango/run-ptest      |    3 +++
 meta/recipes-graphics/pango/pango_1.36.3.bb      |    2 +-
 4 files changed, 23 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/no-tests.patch
 create mode 100644 meta/recipes-graphics/pango/pango/run-ptest

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 4f79315..c02d8c0 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -12,8 +12,11 @@ LICENSE = "LGPLv2.0+"
 X11DEPENDS = "virtual/libx11 libxft"
 DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo harfbuzz qemu-native"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'ptest', '', d)}"
+
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,${X11DEPENDS}"
+PACKAGECONFIG[ptest] = "--enable-installed-tests,--disable-installed-tests,glib-2.0-native"
 
 BBCLASSEXTEND = "native"
 DEPENDS_class-native = "glib-2.0-native cairo-native harfbuzz-native"
@@ -22,7 +25,8 @@ PACKAGES_DYNAMIC += "^pango-module-.*"
 
 RRECOMMENDS_${PN} = "pango-module-basic-fc"
 
-inherit gnomebase gtk-doc qemu
+inherit gnomebase gtk-doc qemu ptest
+
 # Create a pango-modules package
 ALLOW_EMPTY_${BPN}-modules = "1"
 PACKAGES += "${BPN}-modules"
@@ -60,6 +64,13 @@ if [ "x$D" != "x" ]; then
 fi
 }
 
+# This binary needs to be compiled for the host architecture.  This isn't pretty!
+do_compile_prepend () {
+	if ${@base_contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
+		make CC="${BUILD_CC}" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
+	fi
+}
+
 do_install_append () {
 	if [ "${MLPREFIX}" != "" ]; then
 		mv ${D}/${bindir}/pango-querymodules ${D}/${bindir}/${MLPREFIX}pango-querymodules 
@@ -78,3 +89,9 @@ python populate_packages_prepend () {
 FILES_${PN} = "${sysconfdir}/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
+
+FILES_${PN}-ptest += "${libexecdir}/pango/installed-tests/* \
+                      ${datadir}/installed-tests/pango"
+FILES_${PN}-dbg += "${libexecdir}/pango/installed-tests/.debug"
+
+RDEPENDS_${PN}-ptest += "gnome-desktop-testing liberation-fonts"
diff --git a/meta/recipes-graphics/pango/pango/no-tests.patch b/meta/recipes-graphics/pango/pango/no-tests.patch
deleted file mode 100644
index ddfc126..0000000
--- a/meta/recipes-graphics/pango/pango/no-tests.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Signed-off-by: Radu Moisan <radu.moisan@intel.com>
-Upstream-Status: Pending
-
-Index: pango-1.30.0/Makefile.am
-===================================================================
---- pango-1.30.0.orig/Makefile.am	2011-08-16 04:11:08.000000000 +0300
-+++ pango-1.30.0/Makefile.am	2012-08-06 12:48:27.000000000 +0300
-@@ -1,6 +1,6 @@
- ## Process this file with automake to create Makefile.in.
- 
--SUBDIRS= pango modules pango-view examples docs tools tests build
-+SUBDIRS= pango modules pango-view examples docs tools build
- 
- EXTRA_DIST = 			\
- 	autogen.sh		\
diff --git a/meta/recipes-graphics/pango/pango/run-ptest b/meta/recipes-graphics/pango/pango/run-ptest
new file mode 100644
index 0000000..fa87a75
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner pango
diff --git a/meta/recipes-graphics/pango/pango_1.36.3.bb b/meta/recipes-graphics/pango/pango_1.36.3.bb
index 938af34..7782f92 100644
--- a/meta/recipes-graphics/pango/pango_1.36.3.bb
+++ b/meta/recipes-graphics/pango/pango_1.36.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 GNOME_COMPRESS_TYPE="xz"
 
-SRC_URI += "file://no-tests.patch \
+SRC_URI += "file://run-ptest \
             file://multilib-fix-clean.patch \
 "
 
-- 
1.7.10.4


