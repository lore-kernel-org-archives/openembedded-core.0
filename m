Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UVh1P-0006Al-6p
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 13:41:03 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2013 12:22:40 +0100
Message-Id: <1366975360-10990-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2.1
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCHv4] connman: add PACKAGECONFIG options
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
X-List-Received-Date: Fri, 26 Apr 2013 11:41:18 -0000
X-List-Received-Date: Fri, 26 Apr 2013 11:41:18 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

- change TIST from being explicitly built, to a PACKAGECONFIG
- move wifi, 3g and bluetooth to PACKAGECONFIG
- change RDEPENDS and RPROVIDES to check PACKAGECONFIG rather 
  than DISTRO_FEATURES

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---

v4
- exlicityly disable tist

v3
- change RDEPENDS and RPROVIDES to check PACKAGECONFIG rather 
  than DISTRO_FEATURES

v2
- move wifi, 3g and bluetooth to PACKAGECONFIG

v1
- change TIST from being explicitly built, to a PACKAGECONFIG

 meta/recipes-connectivity/connman/connman.inc | 38 +++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 589ece8..afc361c 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -13,17 +13,9 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=d6a1ac98a6791c5294e8a7f176ecd66d"
 
-# we need to define the depends here, the dynamic stuff is too late
-DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
-            ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
-            ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
-            ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
-            "
+DEPENDS  = "dbus glib-2.0 ppp iptables gnutls"
 
-INC_PR = "r19"
-
-TIST = "--enable-tist"
-TIST_powerpc = ""
+INC_PR = "r20"
 
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
@@ -32,9 +24,6 @@ EXTRA_OECONF += "\
     --enable-threads \
     --enable-loopback \
     --enable-ethernet \
-    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
-    ${@base_contains('DISTRO_FEATURES', '3g', '--enable-ofono', '--disable-ofono', d)} \
     --enable-tools \
     --enable-test \
     --disable-polkit \
@@ -43,6 +32,17 @@ EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
 "
 
+PACKAGECONFIG ??= "\
+                   ${@base_contains('DISTRO_FEATURES', 'wifi','wifi', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', '3g','3g', '', d)} \
+"
+
+PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
+PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
+PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
+PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
+
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
@@ -92,16 +92,16 @@ do_install_append() {
 RPROVIDES_${PN} = "\
 	connman-plugin-loopback \
 	connman-plugin-ethernet \
-	${@base_contains('DISTRO_FEATURES', 'bluetooth','connman-plugin-bluetooth', '', d)} \
-	${@base_contains('DISTRO_FEATURES', 'wifi','connman-plugin-wifi', '', d)} \
-	${@base_contains('DISTRO_FEATURES', '3g','connman-plugin-ofono', '', d)} \
+	${@base_contains('PACKAGECONFIG', 'bluetooth','connman-plugin-bluetooth', '', d)} \
+	${@base_contains('PACKAGECONFIG', 'wifi','connman-plugin-wifi', '', d)} \
+	${@base_contains('PACKAGECONFIG', '3g','connman-plugin-ofono', '', d)} \
 	"
 
 RDEPENDS_${PN} = "\
 	dbus \
-	${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
-	${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
-	${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
+	${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
+	${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
+	${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
 	"
 
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
-- 
1.8.2.1



