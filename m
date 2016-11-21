Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE076071F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 15:07:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2016 07:07:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; d="scan'208";a="789098715"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2016 07:07:13 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 17:07:10 +0200
Message-Id: <1479740831-661-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1479740831-661-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1479740831-661-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] busybox: don't manage sysv init script with update-alternatives
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
X-List-Received-Date: Mon, 21 Nov 2016 15:07:20 -0000

This has proved to be a bad idea. Some package srciptlet
(preinst/postinst/prerm/postrm) seems to break whatever we try to do.
Basically the failures happend because the expeceted init script is not
present when the scriptlet tries to run update-rc.d or start or stop the
service. Another indication that it is a bad idea is that no other
system service package seems to manage init scripts with
update-alternatives.

The patch also adds a new virtual package, i.e. VIRTUAL-RUNTIME_syslog.

[YOCTO #10433]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/conf/distro/include/default-providers.inc |  1 +
 meta/recipes-core/busybox/busybox.inc          | 26 +++++++-------------------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ece4d8b..b1d245f 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -28,6 +28,7 @@ VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
 VIRTUAL-RUNTIME_wireless-tools ?= "iw wireless-tools"
 VIRTUAL-RUNTIME_base-utils ?= "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
+VIRTUAL-RUNTIME_syslog ?= "busybox-syslog"
 
 #
 # Default recipe providers
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b2f1960..cbcff9e 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -23,6 +23,8 @@ EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
+RCONFLICTS_${PN}-syslog = "sysklogd"
+
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
 FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfdir}/mdev/*"
@@ -45,7 +47,7 @@ SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
-RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
+RRECOMMENDS_${PN} = "${VIRTUAL-RUNTIME_syslog} ${PN}-udhcpc"
 
 inherit cml1 systemd update-rc.d ptest
 
@@ -238,9 +240,9 @@ do_install () {
 	fi
 
 	if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
-		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${BPN}
-		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf.${BPN}
-		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf.${BPN}
+		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog
+		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf
+		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf
 	fi
 	if grep "CONFIG_CROND=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
@@ -312,7 +314,7 @@ do_install () {
 
     # Remove the sysvinit specific configuration file for systemd systems to avoid confusion
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
-	rm -f ${D}${sysconfdir}/syslog-startup.conf.${BPN}
+	rm -f ${D}${sysconfdir}/syslog-startup.conf
     fi
 }
 
@@ -326,20 +328,6 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "50"
 
-ALTERNATIVE_${PN}-syslog += "syslog-conf"
-ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
-
-python () {
-    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
-        d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-init')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (d.getVar('sysconfdir', True)))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
-        d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-startup-conf')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-startup-conf', '%s/syslog-startup.conf' % (d.getVar('sysconfdir', True)))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-startup-conf', '%s/syslog-startup.conf.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
-}
-
 python do_package_prepend () {
     # We need to load the full set of busybox provides from the /etc/busybox.links
     # Use this to see the update-alternatives with the right information
-- 
2.6.6


