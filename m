Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DD3A061039
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 17:32:59 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so5064631wgg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 09:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XIW7/kRkvBE2ZjwLVQW4MuEmx5W0eK4pq9Hbi28MmEg=;
	b=eHt2vIxV+QiezEYaFlJBJs0J/szVSbGEqjVtGP53kjxaBR9Cj9WoeNzmhgW/WfOONn
	tXvrDTGuiMBRmcYpwnsOHOMEmeEX0orX4DYi77QJ241vBPdDf4dVSZNvA041RBMYa82T
	vseMmOXgCG30o1xPA42xA+vfCfrt0p7sDCBZwvdTCsn/B50H9kl9xwieVTZ2wYZyXWn+
	JSFAiRTRQesdc1KO6JjrAMM21/5fMiVTFtLdpXslcOklnQwEcKwceMwINc//VGIml0rz
	liz2L2eXp51h8105YZ1nax5NqJa90Tg/Efn9SExoAdSDJ+nAPhz92oEe4CdmdHJ8GO9A
	Nr+Q==
X-Gm-Message-State: ALoCoQl2EpH9RDsmfJ/2+ELNIPLcG/ow264P3SzUnxjl4tsO18+Ym862laOiAQeNDgwM5+R5cRQ2
X-Received: by 10.194.48.33 with SMTP id i1mr492035wjn.93.1387819980424;
	Mon, 23 Dec 2013 09:33:00 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id c1sm10460870wje.4.2013.12.23.09.32.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Dec 2013 09:32:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 17:32:55 +0000
Message-Id: <1387819976-28691-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] dbus: use PACKAGECONFIG for X11 and systemd
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
X-List-Received-Date: Mon, 23 Dec 2013 17:33:00 -0000

Instead of several variables and overrides, use PACKAGECONFIG to respect X11 and
systemd DISTRO_FEATURES.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus.inc |   25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 343079c..625e975 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -5,10 +5,7 @@ SECTION = "base"
 LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
-X11DEPENDS = "virtual/libx11 libsm"
-DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-DEPENDS_class-native = "expat-native virtual/libintl-native"
-DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl"
+DEPENDS = "expat virtual/libintl"
 RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
 RDEPENDS_dbus_class-native = ""
 RDEPENDS_dbus_class-nativesdk = ""
@@ -70,21 +67,23 @@ pkg_postinst_dbus() {
 	fi
 }
 
-EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_class-native = "--without-x --disable-x11-autolaunch"
-# TODO: would like to --enable-systemd but that's a circular build-dependency
-# between systemd<->dbus
-EXTRA_OECONF_SYSTEMD = "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
-
 EXTRA_OECONF = "--disable-tests \
                 --disable-checks \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-xml=expat \
-                --disable-systemd \
-                ${EXTRA_OECONF_SYSTEMD} \
-                ${EXTRA_OECONF_X}"
+                --disable-systemd"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
+# Would like to --enable-systemd but that's a circular build-dependency between
+# systemd<->dbus
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
+PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 
 do_install() {
 	autotools_do_install
-- 
1.7.10.4


