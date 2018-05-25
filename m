Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E209E74DCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:40:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4P2eJYO026202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:40:34 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:40:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:12 +0800
Message-ID: <9b87ab3eace2ab844f292848d7feb95d31e7553a.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/24] busybox: handle syslog
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
X-List-Received-Date: Fri, 25 May 2018 02:40:43 -0000
Content-Type: text/plain

From: "Yadi.hu" <yadi.hu@windriver.com>

If CONFIG_KLOGD is not enabled, then the related service file should
not be installed, The error message is below:

    Cannot add dependency job for unit busybox-klogd.service,
    ignoring: Unit busybox-klogd.service failed to load:
    No such file or directory.

So we should first check the configuration before we install these
service files.

Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index d1675c3..8c6dbba 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -315,20 +315,24 @@ do_install () {
         fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        if grep -q "CONFIG_KLOGD=y" ${B}/.config; then
+            install -d ${D}${systemd_unitdir}/system
+            sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
+            > ${D}${systemd_unitdir}/system/busybox-klogd.service
+        fi
+
         if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
             install -d ${D}${systemd_unitdir}/system
             sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
 		> ${D}${systemd_unitdir}/system/busybox-syslog.service
+            if  [ ! -e ${D}${systemd_unitdir}/system/busybox-klogd.service ] ; then
+                sed -i '/klog/d' ${D}${systemd_unitdir}/system/busybox-syslog.service
+            fi
             if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
 		install -d ${D}${sysconfdir}/default
 		install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
             fi
         fi
-        if grep -q "CONFIG_KLOGD=y" ${B}/.config; then
-            install -d ${D}${systemd_unitdir}/system
-            sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
-		> ${D}${systemd_unitdir}/system/busybox-klogd.service
-        fi
     fi
 
     # Remove the sysvinit specific configuration file for systemd systems to avoid confusion
-- 
2.7.4


