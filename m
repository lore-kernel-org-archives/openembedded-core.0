Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC2C6FD02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 05:41:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5D5fQDh013313
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 22:41:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 12 Jun 2014 22:41:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jun 2014 13:42:33 +0800
Message-ID: <0566f265bb79f9a10a3863ec7707c7267f512cb8.1402638116.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402638116.git.Qi.Chen@windriver.com>
References: <cover.1402638116.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: handle syslog related files properly
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
X-List-Received-Date: Fri, 13 Jun 2014 05:41:25 -0000
Content-Type: text/plain

If CONFIG_SYSLOGD is not enabled, then the related service file should
not be installed as it will always fail at system start-up. The error
message is as following.

	[FAILED] Failed to start System Logging Service.

The same logic applies to CONFIG_KLOGD.

So we should first check the configuration before we install these
service files.

[YOCTO #5302]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc |   25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index f6cb039..bd66e4f 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -272,18 +272,21 @@ do_install () {
 	fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
-            > ${D}${systemd_unitdir}/system/busybox-syslog.service
-        sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
-            > ${D}${systemd_unitdir}/system/busybox-klogd.service
-
-        if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
-            install -d ${D}${sysconfdir}/default
-            install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
+        if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
+            install -d ${D}${systemd_unitdir}/system
+            sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
+		> ${D}${systemd_unitdir}/system/busybox-syslog.service
+            if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
+		install -d ${D}${sysconfdir}/default
+		install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
+            fi
+            ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
+        fi
+        if grep -q "CONFIG_KLOGD=y" ${B}/.config; then
+            install -d ${D}${systemd_unitdir}/system
+            sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
+		> ${D}${systemd_unitdir}/system/busybox-klogd.service
         fi
-
-        ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
     fi
 
     # Remove the sysvinit specific configuration file for systemd systems to avoid confusion
-- 
1.7.9.5


