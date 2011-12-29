Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RgBKb-0000pz-UW
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 09:27:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Dec 2011 00:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="91185455"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Dec 2011 00:20:06 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2011 16:09:18 +0800
Message-Id: <5bb86b44a3c34b39ee2e34c6d8f5ca15335a2d2f.1325145929.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1325145929.git.edwin.zhai@intel.com>
References: <cover.1325145929.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1325145929.git.edwin.zhai@intel.com>
References: <cover.1325145929.git.edwin.zhai@intel.com>
Subject: [PATCH 1/2] gnome-keyring: fix gsettings_data_convert seg fault
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
X-List-Received-Date: Thu, 29 Dec 2011 08:27:25 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

gsttings_data_convert cause seg fault as gnome-keyring's schema is not
installed properly. As a fix, running glib-compile-schemas from glib-utils to
made "gschemas.compiled".

[YOCTO #1779] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index cc97225..c40044f 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r3"
+PR = "r4"
 
 inherit autotools gnome pkgconfig
 
 DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} = "libgnome-keyring"
+RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
 
 EXTRA_OECONF = "--disable-gtk-doc ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
 
@@ -30,6 +30,14 @@ do_install_append () {
 	install -m 0644 ${WORKDIR}/org.gnome.keyring.service ${D}${datadir}/dbus-1/services
 }
 
+pkg_postinst_${PN} () {
+	if [ "x$D" != "x" ]; then
+		exit 1
+	fi
+
+	test -x ${bindir}/glib-compile-schemas && glib-compile-schemas  ${datadir}/glib-2.0/schemas
+}
+
 FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr ${base_libdir}/security/*.so"
 FILES_${PN}-dbg += "${libdir}/gnome-keyring/standalone/.debug/ ${base_libdir}/security/*.la"
 FILES_${PN}-dbg += "${libdir}/gnome-keyring/devel/.debug/ ${base_libdir}/security/.debug"
-- 
1.7.1



