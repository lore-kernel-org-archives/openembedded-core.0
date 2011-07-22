Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QkCjT-0002TT-4s
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 12:13:23 +0200
Received: by wwi18 with SMTP id 18so1694103wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 03:09:13 -0700 (PDT)
Received: by 10.216.235.83 with SMTP id t61mr1039079weq.112.1311329353657;
	Fri, 22 Jul 2011 03:09:13 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id j54sm1422276wed.47.2011.07.22.03.09.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 03:09:12 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 12:09:08 +0200
Message-Id: <1311329348-25568-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gnome-keyring 2.32.1: fix PAM support and make it conditional on DISTRO_FEATURES
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
X-List-Received-Date: Fri, 22 Jul 2011 10:13:23 -0000

The plugin got installed into the wrong dir leading to:

gdm-session-worker[515]: PAM unable to dlopen(/lib/security/pam_gnome_keyring.so): /lib/security/pam_gnome_keyring.so: cannot open shared object file: No such file or directory

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index 3f38401..cc97225 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,14 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools gnome pkgconfig
 
-DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf"
+DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "libgnome-keyring"
 
-EXTRA_OECONF = "--disable-gtk-doc"
+EXTRA_OECONF = "--disable-gtk-doc ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
 
 SRC_URI += "file://org.gnome.keyring.service"
 
@@ -30,6 +30,6 @@ do_install_append () {
 	install -m 0644 ${WORKDIR}/org.gnome.keyring.service ${D}${datadir}/dbus-1/services
 }
 
-FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr ${libdir}/security/*.so"
-FILES_${PN}-dbg += "${libdir}/gnome-keyring/standalone/.debug/"
-FILES_${PN}-dbg += "${libdir}/gnome-keyring/devel/.debug/"
+FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr ${base_libdir}/security/*.so"
+FILES_${PN}-dbg += "${libdir}/gnome-keyring/standalone/.debug/ ${base_libdir}/security/*.la"
+FILES_${PN}-dbg += "${libdir}/gnome-keyring/devel/.debug/ ${base_libdir}/security/.debug"
-- 
1.6.6.1



