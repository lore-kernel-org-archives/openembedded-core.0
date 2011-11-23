Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RT6kr-00061r-JH
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 07:56:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAN6nrG7013611
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 22:49:53 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 Nov 2011 22:49:53 -0800
Message-ID: <5afaf93938ee01adad03c22f3d35c1ef0467baad.1322028165.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322028165.git.xiaofeng.yan@windriver.com>
References: <cover.1322028165.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 23 Nov 2011 13:31:46 +0800
Date: Wed, 23 Nov 2011 14:48:01 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] pango: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 06:56:26 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

pango run over x11 at current OE-core. If pango want to run over directfb, then \
the configuration related to x11 should be disabled and directfb should be enabled.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/pango/pango.inc |   19 +++++++++++++++----
 1 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 6d94e02..6822694 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,14 +10,24 @@ SECTION = "libs"
 LICENSE = "LGPL"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo "
 
 PACKAGES_DYNAMIC = "pango-module-*"
 
 RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc" 
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
+PACKAGECONFIG[directfb] = ",,directfb"
+
 inherit gnome
 
+# Create a pango-modules package
+ALLOW_EMPTY_${BPN}-modules = "1"
+PACKAGES += "${BPN}-modules"
+RRECOMMENDS_${BPN}-modules =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("pango-module") != -1])}"
+
 EXTRA_AUTORECONF = ""
 
 # seems to go wrong with default cflags
@@ -25,17 +35,18 @@ FULL_OPTIMIZATION_arm = "-O2"
 
 EXTRA_OECONF = "--disable-glibtest \
 		--enable-explicit-deps=no \
-	        --disable-debug \
-		${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
+	        --disable-debug"
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.6.0"
 
+# No "etc" in "${D}" except for "usr", So add "/etc/pango" in the following function. \
+# Because "prologue + 'pango-querymodules > /etc/pango/pango.modules'" use this directory.
 postinst_prologue() {
 if [ "x$D" != "x" ]; then
   exit 1
 fi
-
+    [ ! -d "/etc/pango" ] && mkdir -p /etc/pango/
 }
 
 python populate_packages_prepend () {
-- 
1.7.0.4



