Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R0zUv-00037C-0u
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 19:31:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2011 10:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,339,1312182000"; d="scan'208";a="49562718"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.39])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2011 10:26:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 10:26:21 -0700
Message-Id: <88d4647ffb27c7b2ae452f809ab0a6047735a09f.1315329511.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 1/5] pango: use qemu to generate pango.modules during rootfs construction
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
X-List-Received-Date: Tue, 06 Sep 2011 17:31:45 -0000

From: Phil Blundell <philb@gnu.org>

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
1.7.6



