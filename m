Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D47C65E1A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Sep 2014 02:59:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8S2xYss020309
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 19:59:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sat, 27 Sep 2014 19:59:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 28 Sep 2014 11:00:18 +0800
Message-ID: <93b7f4a3eb8312a9c1e397fab00e37feed90d151.1411721793.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411721793.git.Qi.Chen@windriver.com>
References: <cover.1411721793.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 2/4] busybox: fix for syslog service in systemd
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
X-List-Received-Date: Sun, 28 Sep 2014 02:59:35 -0000
Content-Type: text/plain

This patch includes the following changes:
1. Explicitly set StandardOutput of the log daemon to null.
   This would avoid creating a feedback loop of the syslog service.
   See link below for more information.
   http://www.freedesktop.org/wiki/Software/systemd/syslog/

2. Use ALTERNATIVE machanism to manage the syslog service file.
   This is because that other package may also provide a syslog
   implementation.

3. Make the syslog daemon socket activated only. Otherwise, things
   would crash if we install busybox-syslog and other syslog packages
   together in one image.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc                     | 9 +++++++--
 meta/recipes-core/busybox/files/busybox-klogd.service.in  | 4 +---
 meta/recipes-core/busybox/files/busybox-syslog.service.in | 7 +++----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index bd66e4f..a6b205a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -274,13 +274,12 @@ do_install () {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
             install -d ${D}${systemd_unitdir}/system
-            sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
+            sed -e 's,@base_sbindir@,${base_sbindir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' < ${WORKDIR}/busybox-syslog.service.in \
 		> ${D}${systemd_unitdir}/system/busybox-syslog.service
             if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
 		install -d ${D}${sysconfdir}/default
 		install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
             fi
-            ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
         fi
         if grep -q "CONFIG_KLOGD=y" ${B}/.config; then
             install -d ${D}${systemd_unitdir}/system
@@ -311,6 +310,12 @@ python () {
         d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-startup-conf')
         d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-startup-conf', '%s/syslog-startup.conf' % (d.getVar('sysconfdir', True)))
         d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-startup-conf', '%s/syslog-startup.conf.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
+
+    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+        pn = d.getVar('PN', True)
+        d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-service')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/busybox-syslog.service' % (d.getVar('systemd_unitdir', True)))
 }
 
 python do_package_prepend () {
diff --git a/meta/recipes-core/busybox/files/busybox-klogd.service.in b/meta/recipes-core/busybox/files/busybox-klogd.service.in
index d7c7755..90cfc50 100644
--- a/meta/recipes-core/busybox/files/busybox-klogd.service.in
+++ b/meta/recipes-core/busybox/files/busybox-klogd.service.in
@@ -3,6 +3,4 @@ Description=Kernel Logging Service
 
 [Service]
 ExecStart=@base_sbindir@/klogd -n
-
-[Install]
-WantedBy=multi-user.target
+StandardOutput=null
diff --git a/meta/recipes-core/busybox/files/busybox-syslog.service.in b/meta/recipes-core/busybox/files/busybox-syslog.service.in
index 2e04321..c84edaf 100644
--- a/meta/recipes-core/busybox/files/busybox-syslog.service.in
+++ b/meta/recipes-core/busybox/files/busybox-syslog.service.in
@@ -1,13 +1,12 @@
 [Unit]
 Description=System Logging Service
 Wants=busybox-klogd.service
+Requires=syslog.socket
 
 [Service]
-EnvironmentFile=-/etc/default/busybox-syslog
+EnvironmentFile=-@SYSCONFDIR@/default/busybox-syslog
 ExecStart=@base_sbindir@/syslogd -n $OPTIONS
-Sockets=syslog.socket
+StandardOutput=null
 
 [Install]
-WantedBy=multi-user.target
 Also=busybox-klogd.service
-Alias=syslog.service
-- 
1.9.1


