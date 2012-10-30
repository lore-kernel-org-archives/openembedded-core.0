Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TT8Lq-0002rX-1h
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:43:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9U9TcIA028868
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:29:38 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 30 Oct 2012 02:29:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2012 17:33:48 +0800
Message-ID: <30a31f2a20fb5618a9fc842fc062039e7678f00b.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1351496696.git.liezhi.yang@windriver.com>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 07/11] recipes-graphics: replace virtclass-native(sdk) with class-native(sdk)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 09:43:14 -0000
Content-Type: text/plain

The overrides virtclass-native and virtclass-nativesdk are deprecated,
which should be replaced by class-native and class-nativesdk.

[YOCTO #3297]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/freetype/freetype_2.4.10.bb   | 4 ++--
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb       | 2 +-
 meta/recipes-graphics/pango/pango.inc               | 2 +-
 meta/recipes-graphics/xcb/xcb-proto.inc             | 2 +-
 meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb   | 2 +-
 meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb | 2 +-
 meta/recipes-graphics/xorg-font/font-util_1.3.0.bb  | 4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.4.10.bb b/meta/recipes-graphics/freetype/freetype_2.4.10.bb
index cf2a78e..9365475 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.10.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.10.bb
@@ -27,7 +27,7 @@ inherit autotools pkgconfig binconfig
 
 LIBTOOL = "${S}/builds/unix/${HOST_SYS}-libtool"
 EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
-EXTRA_OEMAKE_virtclass-native = ""
+EXTRA_OEMAKE_class-native = ""
 EXTRA_OECONF = "--without-zlib --without-bzip2"
 
 do_configure() {
@@ -40,7 +40,7 @@ do_configure() {
 	oe_runconf
 }
 
-do_configure_virtclass-native() {
+do_configure_class-native() {
 	(cd builds/unix && gnu-configize) || die "failure running gnu-configize"
 	oe_runconf
 }
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index d5c127d..e25c597 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -16,7 +16,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
-DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
+DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
 PR = "r1"
 
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index b361978..839c00d 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -16,7 +16,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
 
 BBCLASSEXTEND = "native"
-DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
+DEPENDS_class-native = "glib-2.0-native cairo-native"
 
 PACKAGES_DYNAMIC += "^pango-module-.*"
 
diff --git a/meta/recipes-graphics/xcb/xcb-proto.inc b/meta/recipes-graphics/xcb/xcb-proto.inc
index feb9e4d..2e1b57b 100644
--- a/meta/recipes-graphics/xcb/xcb-proto.inc
+++ b/meta/recipes-graphics/xcb/xcb-proto.inc
@@ -21,5 +21,5 @@ FILES_python-xcbgen = "${libdir}/python*"
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
-DEPENDS_append_virtclass-native = " python-native"
+DEPENDS_append_class-native = " python-native"
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
index 6637326..a453e24 100644
--- a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
@@ -12,7 +12,7 @@ PE = "1"
 PR = "${INC_PR}.0"
 
 RDEPENDS_${PN} += "mkfontscale"
-RDEPENDS_${PN}_virtclass-native += "mkfontscale-native"
+RDEPENDS_${PN}_class-native += "mkfontscale-native"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
index a212f19..2c51cbb 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
@@ -13,7 +13,7 @@ SRC_URI += "file://nocompiler.patch"
 
 DEPENDS = "util-macros-native"
 RDEPENDS_${PN} = "encodings font-util"
-RDEPENDS_${PN}_virtclass-native = "font-util-native"
+RDEPENDS_${PN}_class-native = "font-util-native"
 
 inherit allarch
 
diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
index 180c7dd..723cb0c 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c0067273d90f6336008cb2504e14bd32 \
                     file://map-ISO8859-1;beginline=9;endline=23;md5=1cecb984063248f29ffe5c46f5c04f34"
 
 DEPENDS = "encodings util-macros"
-DEPENDS_virtclass-native = "util-macros-native"
+DEPENDS_class-native = "util-macros-native"
 RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
-RDEPENDS_${PN}_virtclass-native = "mkfontdir-native mkfontscale-native"
+RDEPENDS_${PN}_class-native = "mkfontdir-native mkfontscale-native"
 
 PR = "${INC_PR}.0"
 
-- 
1.7.11.2



