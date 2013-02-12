Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5Ik8-0000zN-Js
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:30:06 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284742095"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:12:59 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:44 +0200
Message-Id: <f97d53d1d2d4479e82b6d3d7e283cace88f6f2f2.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
Subject: [PATCH 09/11] gnome-keyring: compile schemas on host
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
X-List-Received-Date: Tue, 12 Feb 2013 16:30:19 -0000

gsettings.bbclass offers just that.

[YOCTO #3854]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb |   12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index 92e0e1b..a1cd8f9 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r10"
+PR = "r11"
 
-inherit autotools gnome gtk-doc pkgconfig
+inherit autotools gnome gtk-doc pkgconfig gsettings
 
 DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
@@ -30,14 +30,6 @@ do_install_append () {
 	install -m 0644 ${WORKDIR}/org.gnome.keyring.service ${D}${datadir}/dbus-1/services
 }
 
-pkg_postinst_${PN} () {
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	test -x ${bindir}/glib-compile-schemas && glib-compile-schemas  ${datadir}/glib-2.0/schemas
-}
-
 FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr"
                 
 
-- 
1.7.9.5



