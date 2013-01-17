Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tvs0r-00034e-PD
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 17:08:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jan 2013 07:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,486,1355126400"; d="scan'208";a="278139836"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jan 2013 07:52:56 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 17:53:39 +0200
Message-Id: <1358438019-24046-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] pango: use qemu_run_binary instead of pango-native
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
X-List-Received-Date: Thu, 17 Jan 2013 16:08:48 -0000

- use qemu_run_binary from qemu.bbclass to run pango-querymodules
- remove pango-native from DEPENDS in order to do not create
unbuildable dependency chains (e.g. ['gtk+', 'pango', 'pango-native',
'cairo-native', 'directfb-native'])

[YOCTO #3642]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-graphics/pango/pango.inc       | 26 ++++++++------------------
 meta/recipes-graphics/pango/pango_1.32.5.bb |  2 +-
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index ce5caf6..f622903 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.0+"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils pango-native harfbuzz"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils harfbuzz"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
@@ -22,7 +22,7 @@ PACKAGES_DYNAMIC += "^pango-module-.*"
 
 RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc" 
 
-inherit gnomebase gtk-doc
+inherit gnomebase gtk-doc qemu
 # Create a pango-modules package
 ALLOW_EMPTY_${BPN}-modules = "1"
 PACKAGES += "${BPN}-modules"
@@ -49,26 +49,16 @@ if ! [ -e $D${sysconfdir}/pango ] ; then
 fi
 
 if [ "x$D" != "x" ]; then
-pango-querymodules $(ls -d -1 $D${libdir}/pango/${LIBV}/modules/*.so|\
-    sed -e "s:$D:$NATIVE_ROOT:g") >\
-    $D${sysconfdir}/pango/${MLPREFIX}pango.modules \
-    2>$D${sysconfdir}/pango/${MLPREFIX}pango.err
-
-# pango-querymodules always returns 0, so we need to check if pango.err has
-# anything in it
-if [ -s $D${sysconfdir}/pango/${MLPREFIX}pango.err ]; then
-    rm $D${sysconfdir}/pango/${MLPREFIX}pango.err
-    exit 1
-fi
+	${@qemu_run_binary(d, '$D','/usr/bin/pango-querymodules')} \
+		$D${libdir}/pango/${LIBV}/modules/*.so \
+		> $D${sysconfdir}/pango/${MLPREFIX}pango.modules 2>/dev/null
 
-sed -i -e "s:$NATIVE_ROOT::g" $D${sysconfdir}/pango/${MLPREFIX}pango.modules
+	[ $? -ne 0 ] && exit 1
 
-# remove the empty pango.err
-rm $D${sysconfdir}/pango/${MLPREFIX}pango.err
+	sed -i -e "s:$D::" $D${sysconfdir}/pango/${MLPREFIX}pango.modules
 
-exit 0
+	exit 0
 fi
-
 }
 
 do_install_append () {
diff --git a/meta/recipes-graphics/pango/pango_1.32.5.bb b/meta/recipes-graphics/pango/pango_1.32.5.bb
index fe93b52..6219940 100644
--- a/meta/recipes-graphics/pango/pango_1.32.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.32.5.bb
@@ -2,7 +2,7 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r1"
+PR = "r2"
 
 GNOME_COMPRESS_TYPE="xz"
 
-- 
1.7.11.7



