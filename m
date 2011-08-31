Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qymts-0006aq-F3
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 17:40:24 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QympA-00068j-2K
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 17:35:32 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Aug 2011 16:35:31 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314804932.19905.169.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
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
X-List-Received-Date: Wed, 31 Aug 2011 15:40:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This allows pango to be installed in an image with read-only-rootfs.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-graphics/pango/pango.inc       |   11 +++++++----
 meta/recipes-graphics/pango/pango_1.28.4.bb |    2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index a8e99e2..ff3f5dd 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,13 +10,13 @@ SECTION = "libs"
 LICENSE = "LGPL"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo qemu-native ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 
 PACKAGES_DYNAMIC = "pango-module-*"
 
 RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc" 
 
-inherit gnome
+inherit gnome qemu
 
 EXTRA_AUTORECONF = ""
 
@@ -33,9 +33,12 @@ LIBV = "1.6.0"
 
 postinst_prologue() {
 if [ "x$D" != "x" ]; then
-  exit 1
+	if [ ! -f "$D${sysconfdir}/pango/pango.modules" ]; then
+		mkdir -p $D${sysconfdir}/pango
+		PSEUDO_RELOADED=YES ${@qemu_target_binary(d)} -L $D $D${bindir}/pango-querymodules > "$D${sysconfdir}/pango/pango.modules"
+	fi
+	exit 0
 fi
-
 }
 
 python populate_packages_prepend () {
diff --git a/meta/recipes-graphics/pango/pango_1.28.4.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
index 68ab700..33eac21 100644
--- a/meta/recipes-graphics/pango/pango_1.28.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
@@ -2,7 +2,7 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r1"
+PR = "r4"
 
 SRC_URI += "file://no-tests.patch"
 
-- 
1.7.4.1





