Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvR-0004HK-FD
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206437"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:45 -0800
Message-Id: <7eae02f47a08587cf5be3d39df0184cf346cbaea.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/35] gconf, consolekit: Avoid polkit when compiling with uclibc
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:13 -0000

From: Khem Raj <raj.khem@gmail.com>

polkit uses netdb functionality from glibc which is not
available in uclibc therefore we avoid polkit when compiling
for uclibc systems.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    9 +++++++--
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   11 ++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index 412f01c..a0b8d0c 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -3,10 +3,13 @@ SECTION = "x11/gnome"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "glib-2.0 gtk+ dbus dbus-glib libxml2 intltool-native polkit"
+POLKIT = "polkit"
+POLKIT_libc-uclibc = ""
+
+DEPENDS = "glib-2.0 gtk+ dbus dbus-glib libxml2 intltool-native ${POLKIT}"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
 
-PR = "r5"
+PR = "r6"
 
 inherit gnomebase
 
@@ -21,6 +24,8 @@ S = "${WORKDIR}/GConf-${PV}"
 
 POLKIT_OECONF = "--enable-defaults-service"
 POLKIT_OECONF_virtclass-native = "--disable-defaults-service"
+POLKIT_OECONF_libc-uclibc = "--disable-default-service"
+
 GTKOECONF = "--with-gtk=2.0 --enable-gtk"
 GTKOECONF_virtclass-native = "--disable-gtk"
 EXTRA_OECONF = "--disable-gtk-doc --enable-shared --disable-static --enable-debug=yes \
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index 45f6ad3..3ded6df 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,13 +2,18 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r7"
+PR = "r8"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
 
-DEPENDS = "glib-2.0 dbus polkit ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+POLKIT = "polkit"
+POLKIT_libc-uclibc = ""
+POLKITCONF = ""
+POLKITCONF_libc-uclibc = "--disable-policykit"
+
+DEPENDS = "glib-2.0 dbus ${POLKIT} ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += "base-files"
 
 inherit gnome
@@ -20,7 +25,7 @@ SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b22368
 
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
-EXTRA_OECONF = "--with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+EXTRA_OECONF = "${POLKITCONF} --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
                "
 
-- 
1.7.6.5



