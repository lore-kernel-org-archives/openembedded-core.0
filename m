Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B3478619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 14:00:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2013 06:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,668,1367996400"; d="scan'208";a="370495582"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.64])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2013 07:00:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 14:00:43 +0100
Message-Id: <1373893243-15418-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] qt-mobility: tighten up config generation and use PACKAGECONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2013 14:00:28 -0000

* Add DEPENDS on util-linux (for libblkid) and gstreamer (was likely
  always being auto-detected since it is currently an unconditional
  dependency of Qt itself in our Qt recipes)
* Use PACKAGECONFIG to allow individual configuration of pulseaudio and
  bluetooth features rather than additional variables
* Generate a static platform configuration and tell the configure script
  to use that instead of running compile tests during do_configure. This
  should avoid the issue of camerabin sometimes being built and failing
  as seen on the Yocto Project autobuilder.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc | 41 ++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index 2ce9ca2..b9367a8 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -1,6 +1,10 @@
 HOMEPAGE = "http://qt-project.org/"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
+DEPENDS = "gstreamer util-linux"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
+PACKAGECONFIG[bluetooth] = ",,bluez4"
+PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
@@ -34,7 +38,6 @@ qtm_imports	:= "/usr/lib/${qtm_dir}/imports"
 
 QTM_MODULES_LIST ?= "bearer contacts gallery location publishsubscribe messaging multimedia \
 systeminfo serviceframework sensors versit organizer feedback connectivity"
-qtm_bluezflag ?= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'yes', 'no', d)}"
 
 do_configure_prepend() {
 	cp qtmobility.pro qtmobility.pro.old
@@ -47,7 +50,35 @@ do_configure_prepend() {
 	cp staticconfig.pri staticconfig.pri.old
 	echo "include(${STAGING_DATADIR}/${qtm_dir}/mkspecs/qconfig.pri)" >staticconfig.pri
 	cat staticconfig.pri.old >>staticconfig.pri
-	./configure -qmake-exec qmake2 -prefix /usr -examples -demos -modules "${QTM_MODULES_LIST}"
+
+        cat > features/platformconfig/oe.pri <<EOF
+qmf_enabled = no
+networkmanager_enabled = no
+corewlan_enabled = no
+immersion_enabled = no
+meegotouchfeedback_enabled = no
+maemo-icd_enabled = no
+maemo-icd-network-wlan_enabled = no
+maemo5-contacts_enabled = no
+maemo5-calendar_enabled = no
+maemo6-landmarks_enabled = no
+bme_enabled = no
+bluez_enabled = ${@base_contains('PACKAGECONFIG', 'bluetooth', 'yes', 'no', d)}
+proj_enabled = no
+gstreamer-photography_enabled = no
+gstreamer-appsrc_enabled = yes
+blkid_enabled = yes
+pulseaudio_enabled = ${@base_contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}
+udev_enabled = yes
+iphb_enabled = no
+nfc_symbian_enabled = no
+sensord_enabled = no
+geoclue-master_enabled = no
+gypsy_enabled = no
+${qtm_extra_config}
+EOF
+
+	./configure -qmake-exec qmake2 -prefix /usr -staticconfig oe -examples -demos -modules "${QTM_MODULES_LIST}"
 	echo QT_MOBILITY_BIN = ${qtm_bin} >>./config.pri
 	echo QT_MOBILITY_LIB = ${qtm_lib} >>./config.pri
 	echo QT_MOBILITY_INCLUDE = ${qtm_include} >>./config.pri
@@ -55,8 +86,6 @@ do_configure_prepend() {
 	echo QT_MOBILITY_EXAMPLES = ${qtm_examples} >>./config.pri
 	echo QT_MOBILITY_DEMOS = ${qtm_demos} >>./config.pri
 	echo QT_CONFIG ${qtm_glflags} >>./config.pri
-	echo bluez_enabled = ${qtm_bluezflag} >>./config.pri
-	echo ${qtm_extra_config} >>./config.pri
 	echo CONFIG += ${qtm_embedded} >>./config.pri
 }
 
-- 
1.8.1.2


