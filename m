Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QruDX-0007dG-5m
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:04:15 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qru9A-0000fu-LL
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 17:59:44 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2011 16:59:43 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313164784.6733.165.camel@phil-desktop>
Mime-Version: 1.0
Subject: dbus: only use x11 if DISTRO_FEATURES has selected it
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
X-List-Received-Date: Fri, 12 Aug 2011 16:04:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This makes it possible to include dbus in a non-X11-equipped DISTRO.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/dbus/dbus.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 6b76cba..a8ecda8 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -5,7 +5,8 @@ SECTION = "base"
 LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
-DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
+X11DEPENDS = "virtual/libx11 libsm"
+DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
 
@@ -22,7 +23,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib ${PN}-x11 ${PN}-systemd"
+PACKAGES =+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}"
 
 FILES_${PN}-x11 = "${bindir}/dbus-launch"
 RDEPENDS_${PN}-x11 = "${PN}"
@@ -73,7 +74,7 @@ pkg_postinst_dbus() {
 	fi
 }
 
-EXTRA_OECONF_X = "--with-x"
+EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
 EXTRA_OECONF_X_virtclass-native = "--without-x"
 
 EXTRA_OECONF = "--disable-tests \
-- 
1.7.4.1





