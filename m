Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8474B77EFE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 09:50:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v859oKjg015676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Sep 2017 02:50:20 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Sep 2017 02:50:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Sep 2017 17:55:26 +0800
Message-ID: <525b2dfca474ce1c20264f616f595ece8554543b.1504604362.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1504604362.git.Qi.Chen@windriver.com>
References: <cover.1504604362.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] busybox: fix syslog related meta data
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
X-List-Received-Date: Tue, 05 Sep 2017 09:50:19 -0000
Content-Type: text/plain

Set RCONFLICTS to disallow multiple syslog daemon providers to be installed
on the target at the same time,  and remove codes which dealt with such
situation.

Supporting multiple syslog daemons on the same image doesn't have much sense.
rsyslog and syslog-ng in meta-oe have set RCONFLICTS to disallow this. And
we do the same for busybox.

Also, remove the line of creating a meaningless symlink of
/lib/systemd/syslog.service to /dev/null.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 735b1f6..48910ca 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -41,7 +41,9 @@ INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
 SYSTEMD_PACKAGES = "${PN}-syslog"
 SYSTEMD_SERVICE_${PN}-syslog = "${@bb.utils.contains('SRC_URI', 'file://syslog.cfg', 'busybox-syslog.service', '', d)}"
 
-CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
+CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf"
+RCONFLICTS_${PN}-syslog = "rsyslog sysklogd syslog-ng"
+
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
@@ -248,9 +250,9 @@ do_install () {
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
@@ -311,7 +313,6 @@ do_install () {
 		install -d ${D}${sysconfdir}/default
 		install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
             fi
-            ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
         fi
         if grep -q "CONFIG_KLOGD=y" ${B}/.config; then
             install -d ${D}${systemd_unitdir}/system
@@ -322,7 +323,7 @@ do_install () {
 
     # Remove the sysvinit specific configuration file for systemd systems to avoid confusion
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
-	rm -f ${D}${sysconfdir}/syslog-startup.conf.${BPN}
+	rm -f ${D}${sysconfdir}/syslog-startup.conf
     fi
 }
 
@@ -336,20 +337,6 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "50"
 
-ALTERNATIVE_${PN}-syslog += "${@bb.utils.contains('SRC_URI', 'file://syslog.cfg', 'syslog-conf', '', d)}"
-ALTERNATIVE_LINK_NAME[syslog-conf] = "${@bb.utils.contains('SRC_URI', 'file://syslog.cfg', "${sysconfdir}/syslog.conf", '', d)}"
-
-python () {
-    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN')
-        d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-init')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (d.getVar('sysconfdir')))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir'), d.getVar('BPN')))
-        d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-startup-conf')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-startup-conf', '%s/syslog-startup.conf' % (d.getVar('sysconfdir')))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-startup-conf', '%s/syslog-startup.conf.%s' % (d.getVar('sysconfdir'), d.getVar('BPN')))
-}
-
 python do_package_prepend () {
     # We need to load the full set of busybox provides from the /etc/busybox.links
     # Use this to see the update-alternatives with the right information
-- 
1.9.1


