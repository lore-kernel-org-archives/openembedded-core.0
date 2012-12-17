Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tka6U-000879-0U
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 13:47:33 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Dec 2012 04:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="235056374"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 17 Dec 2012 04:32:46 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 14:32:42 +0200
Message-Id: <1355747563-17504-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355747563-17504-1-git-send-email-laurentiu.palcu@intel.com>
References: <1355747563-17504-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] gconf: add gconftool-2 native wrapper
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
X-List-Received-Date: Mon, 17 Dec 2012 12:47:33 -0000

This is needed when sstate cache is fetched from another build server.
In this case, the postinstall will fail because the backend libraries
path will be from the build server.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/gconf.bbclass              |    1 -
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |    7 ++++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index 38097bc..cc01bca 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -15,7 +15,6 @@ export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL = "1"
 
 gconf_postinst() {
 if [ "x$D" != "x" ]; then
-	export GCONF_BACKEND_DIR=${STAGING_LIBDIR_NATIVE}/GConf/2
 	export GCONF_CONFIG_SOURCE="xml::$D${sysconfdir}/gconf/gconf.xml.defaults"
 else
 	export GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source`
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index f80c910..ef21624 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -9,7 +9,7 @@ POLKIT_libc-uclibc = ""
 DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native ${POLKIT} gobject-introspection-stub"
 DEPENDS_class-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native gobject-introspection-stub-native"
 
-PR = "r12"
+PR = "r13"
 
 inherit gnomebase gtk-doc
 
@@ -37,6 +37,11 @@ do_install_append() {
 	rm -f ${D}${libdir}/gio/*/*.*a
 }
 
+do_install_append_class-native() {
+	create_wrapper ${D}/${bindir}/gconftool-2 \
+		GCONF_BACKEND_DIR=${STAGING_LIBDIR_NATIVE}/GConf/2
+}
+
 # disable dbus-x11 when x11 isn't in DISTRO_FEATURES
 RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
 RDEPENDS_${PN}_class-native = ""
-- 
1.7.9.5



