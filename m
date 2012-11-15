Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TZ19m-0002aA-At
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 16:15:07 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2012 07:01:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,258,1352102400"; d="scan'208";a="218219849"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by azsmga001.ch.intel.com with ESMTP; 15 Nov 2012 07:01:06 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2012 17:01:03 +0200
Message-Id: <1352991663-31177-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <96e8a890aa256c71895cabe5f36c3c42edc1a086.1352898505.git.laurentiu.palcu@intel.com>
References: <96e8a890aa256c71895cabe5f36c3c42edc1a086.1352898505.git.laurentiu.palcu@intel.com>
Subject: [PATCH v4 04/12] xkeyboard-config: upgrade to 2.7
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
X-List-Received-Date: Thu, 15 Nov 2012 15:15:07 -0000

A few extra changes:
 * changed the SRC_URI to the new, valid, one
 * added dependency of gettext (do_qa_configure detected is needed)
 * disable runtime dependency checks at configure time

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-lib/xkeyboard-config_2.1.bb               |   34 --------------------
 .../xorg-lib/xkeyboard-config_2.7.bb               |   34 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.7.bb

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
deleted file mode 100644
index 1b28208..0000000
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Keyboard configuration database for X Window"
-
-DESCRIPTION = "The non-arch keyboard configuration database for X \
-Window.  The goal is to provide the consistent, well-structured, \
-frequently released open source of X keyboard configuration data for X \
-Window System implementations.  The project is targeted to XKB-based \
-systems."
-
-HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
-BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config"
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
-
-SRC_URI = "http://people.freedesktop.org/~svu/xkeyboard-config-${PV}.tar.bz2"
-SRC_URI[md5sum] = "6ce65480445fb2d9c071ad1f002a7675"
-SRC_URI[sha256sum] = "e293aa4b0dd259dbb4f0e7f56fdd95db5047d052c7b3b80922fe5663923a805d"
-
-SECTION = "x11/libs"
-DEPENDS = "intltool-native xkbcomp-native glib-2.0"
-
-PR = "r2"
-
-EXTRA_OECONF = "--with-xkb-rules-symlink=xorg"
-
-RDEPENDS_${PN} += "xkbcomp"
-FILES_${PN} += "${datadir}/X11/xkb"
-
-inherit autotools pkgconfig
-
-do_install_append () {
-    install -d ${D}${datadir}/X11/xkb/compiled
-    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
-}
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.7.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.7.bb
new file mode 100644
index 0000000..08d03a5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.7.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Keyboard configuration database for X Window"
+
+DESCRIPTION = "The non-arch keyboard configuration database for X \
+Window.  The goal is to provide the consistent, well-structured, \
+frequently released open source of X keyboard configuration data for X \
+Window System implementations.  The project is targeted to XKB-based \
+systems."
+
+HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
+BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config"
+
+LICENSE = "MIT & MIT-style"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
+
+SRC_URI="${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "6ad7b43062f123eacf8ff0eb3a4e0678"
+SRC_URI[sha256sum] = "e43478a12fb0fe6757a7bad3a04fd3747ec53e53d5af22a9d9829dfb9aac8321"
+
+SECTION = "x11/libs"
+DEPENDS = "intltool-native xkbcomp-native glib-2.0 virtual/gettext"
+
+PR = "r0"
+
+EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
+
+RDEPENDS_${PN} += "xkbcomp"
+FILES_${PN} += "${datadir}/X11/xkb"
+
+inherit autotools pkgconfig
+
+do_install_append () {
+    install -d ${D}${datadir}/X11/xkb/compiled
+    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
+}
-- 
1.7.9.5



