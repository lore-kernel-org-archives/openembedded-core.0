Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QwxNt-0007fz-OM
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 16:27:49 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QwxJH-0007gk-9Q
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 16:23:03 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2011 15:23:02 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314368583.19905.92.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] pango: make x11 support conditional on DISTRO_FEATURES
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
X-List-Received-Date: Fri, 26 Aug 2011 14:27:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This allows pango to build on DISTROs which don't enable x11.  
Also adjust the SECTION since pango isn't really an X library.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-graphics/pango/pango.inc       |   10 ++++++----
 meta/recipes-graphics/pango/pango_1.28.4.bb |    2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 5a8a5ae..a8e99e2 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -6,14 +6,15 @@ been done in the context of the GTK+ widget toolkit. Pango forms the \
 core of text and font handling for GTK+-2.x."
 HOMEPAGE = "http://www.pango.org/"
 BUGTRACKER = "http://bugzilla.gnome.org"
-SECTION = "x11/libs"
+SECTION = "libs"
 LICENSE = "LGPL"
 
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv virtual/libx11 libxft gtk-doc-native cairo"
+X11DEPENDS = "virtual/libx11 libxft"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 
 PACKAGES_DYNAMIC = "pango-module-*"
 
-RRECOMMENDS_${PN} = "pango-module-basic-x pango-module-basic-fc" 
+RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc" 
 
 inherit gnome
 
@@ -24,7 +25,8 @@ FULL_OPTIMIZATION_arm = "-O2"
 
 EXTRA_OECONF = "--disable-glibtest \
 		--enable-explicit-deps=no \
-	        --disable-debug"
+	        --disable-debug \
+		${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.6.0"
diff --git a/meta/recipes-graphics/pango/pango_1.28.4.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
index 600f00b..68ab700 100644
--- a/meta/recipes-graphics/pango/pango_1.28.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
@@ -2,7 +2,7 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://no-tests.patch"
 
-- 
1.7.4.1





