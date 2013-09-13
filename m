Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-wv.mentorg.com [192.94.38.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7530960842
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 11:48:42 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8DBmd2i016729; 
	Fri, 13 Sep 2013 06:48:41 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2013 16:50:02 +0500
Message-Id: <1379073002-19032-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] connman: Fix EXTRA_OECONF
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
X-List-Received-Date: Fri, 13 Sep 2013 11:48:42 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

- --enable-threads and --enable-fake are obsolete, unrecognized options
now.
- --enable-bluetooth,wifi,ofono just build these technologies as plugins
and these plugins need to be installed explicitly. Our intention here
is to make these technologies available by default, if enabled. For
this we need --enable-bluetooth,wifi,ofono=builtin.
- If bluetooth is getting disabled then disable dundee as well, which
is enabled by default.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-connectivity/connman/connman.inc |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 37ce3ec..71ecce2 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -21,14 +21,12 @@ EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
     ac_cv_path_PPPD=${sbindir}/pppd \
     --enable-debug \
-    --enable-threads \
     --enable-loopback \
     --enable-ethernet \
     --enable-tools \
     --enable-test \
     --disable-polkit \
     --enable-client \
-    --enable-fake \
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
 "
 
@@ -42,9 +40,9 @@ PACKAGECONFIG ??= "wispr \
 # local.conf or distro config
 # PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
 
-PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
-PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
-PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
+PACKAGECONFIG[wifi] = "--enable-wifi=builtin, --disable-wifi, wpa-supplicant"
+PACKAGECONFIG[bluetooth] = "--enable-bluetooth=builtin, --disable-bluetooth --disable-dundee, bluez4"
+PACKAGECONFIG[3g] = "--enable-ofono=builtin, --disable-ofono, ofono"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
 PACKAGECONFIG[vpnc] = "--enable-vpnc --with-vpnc=${sbindir}/vpnc,--disable-vpnc,,vpnc"
-- 
1.7.9.5


