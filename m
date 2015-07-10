Return-Path: <pau.espin@aweurope.be>
Received: from barracuda.aweurope.be (barracuda.aweurope.be [212.166.56.147])
	by mail.openembedded.org (Postfix) with ESMTP id 94DC275CB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:04:30 +0000 (UTC)
X-ASG-Debug-ID: 1436537070-041f750f9050fc0001-7zcVdP
Received: from localhost.localdomain ([172.23.1.67]) by barracuda.aweurope.be
	with ESMTP id Ac67sso62YYz795b;
	Fri, 10 Jul 2015 16:04:30 +0200 (CEST)
X-Barracuda-Envelope-From: pau.espin@aweurope.be
X-Barracuda-RBL-Trusted-Forwarder: 172.23.1.67
X-ASG-Whitelist: Client
From: Pau Espin Pedrol <pau.espin@aweurope.be>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2015 16:04:16 +0200
X-ASG-Orig-Subj: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if
	enabled in DISTRO_FEATURES
Message-Id: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
X-Mailer: git-send-email 1.9.1
X-Barracuda-Connect: UNKNOWN[172.23.1.67]
X-Barracuda-Start-Time: 1436537070
X-Barracuda-URL: http://172.23.0.12:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at aweurope.be
X-Barracuda-BRTS-Status: 1
Cc: Pau Espin Pedrol <pau.espin@aweurope.be>
Subject: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 10 Jul 2015 14:04:31 -0000

Signed-off-by: Pau Espin Pedrol <pau.espin@aweurope.be>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index b309d26..5c37413 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -35,7 +35,9 @@ EXTRA_OECONF = "\
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                   "
 PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4 sbc"
 PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 sbc"
 PACKAGECONFIG[ofono] = "--enable-bluez5-ofono-headset,--disable-bluez5-ofono-headset,ofono"
@@ -94,7 +96,7 @@ FILES_${PN}-dbg += "${libexecdir}/pulse/.debug \
 FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala ${libdir}/cmake"   
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
-FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules"
+FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules ${libdir}/systemd/user/*"
 
 #SYSTEMD_PACKAGES = "${PN}-server"
 SYSTEMD_SERVICE_${PN}-server = "pulseaudio.service"
-- 
1.9.1


