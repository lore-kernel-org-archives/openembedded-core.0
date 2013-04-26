Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UVfoy-0005Lo-37
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 12:24:05 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2013 11:06:11 +0100
Message-Id: <1366970771-9959-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2.1
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] connman: make tist functionallity a PACKAGECONFIG option
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
X-List-Received-Date: Fri, 26 Apr 2013 10:24:06 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---

Runtime tested on beaglebone armv7a, with and without tist PACKAGECONFIG

 meta/recipes-connectivity/connman/connman.inc | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 589ece8..eb9d145 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,10 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r19"
-
-TIST = "--enable-tist"
-TIST_powerpc = ""
+INC_PR = "r20"
 
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
@@ -32,8 +29,8 @@ EXTRA_OECONF += "\
     --enable-threads \
     --enable-loopback \
     --enable-ethernet \
-    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'wifi', '--enable-wifi', '--disable-wifi', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'bluetooth', '--enable-bluetooth', '--disable-bluetooth', d)} \
     ${@base_contains('DISTRO_FEATURES', '3g', '--enable-ofono', '--disable-ofono', d)} \
     --enable-tools \
     --enable-test \
@@ -43,6 +40,10 @@ EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
 "
 
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[tist] = "--enable-tist,,"
+
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
-- 
1.8.2.1



