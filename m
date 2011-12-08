Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RYaY7-0001Ke-E0
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 10:45:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB89d507025040
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 01:39:05 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 8 Dec 2011 01:39:05 -0800
Message-ID: <3f3996880b8e8639d2018cdf6cb95f852acc3a5a.1323327959.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323327959.git.xiaofeng.yan@windriver.com>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 5 Dec 2011 15:08:16 +0800
Date: Thu, 8 Dec 2011 17:34:14 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] pango: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Thu, 08 Dec 2011 09:45:57 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

pango run over x11 at current OE-core. If pango want to run over directfb, then \
the configuration related to x11 should be disabled and directfb should be enabled.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/pango/pango.inc |   19 ++++++++++++++-----
 1 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 6d94e02..4fc2aa8 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,13 +10,24 @@ SECTION = "libs"
 LICENSE = "LGPL"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo "
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
+PACKAGECONFIG[directfb] = ",,directfb"
+
 
 PACKAGES_DYNAMIC = "pango-module-*"
 
 RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc" 
 
 inherit gnome
+# Create a pango-modules package
+ALLOW_EMPTY_${BPN}-modules = "1"
+PACKAGES += "${BPN}-modules"
+RRECOMMENDS_${BPN}-modules =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("pango-module") != -1])}"
+
 
 EXTRA_AUTORECONF = ""
 
@@ -25,8 +36,7 @@ FULL_OPTIMIZATION_arm = "-O2"
 
 EXTRA_OECONF = "--disable-glibtest \
 		--enable-explicit-deps=no \
-	        --disable-debug \
-		${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
+	        --disable-debug"
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.6.0"
@@ -35,7 +45,6 @@ postinst_prologue() {
 if [ "x$D" != "x" ]; then
   exit 1
 fi
-
 }
 
 python populate_packages_prepend () {
@@ -46,6 +55,6 @@ python populate_packages_prepend () {
 	do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + 'pango-querymodules > /etc/pango/pango.modules')
 }
 
-FILES_${PN} = "/etc ${bindir}/* ${libdir}/libpango*${SOLIBS}"
+FILES_${PN} = "/etc/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
-- 
1.7.0.4



