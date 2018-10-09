Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 6FBB8794BE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 07:39:24 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w997dPSo009016
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2018 09:39:25 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.93])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w997dPIU019891;
	Tue, 9 Oct 2018 09:39:25 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 23CD89550DC;
	Tue,  9 Oct 2018 09:39:25 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 09:38:47 +0200
Message-Id: <20181009073848.8492-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181009073848.8492-1-andrej.valek@siemens.com>
References: <20181009073848.8492-1-andrej.valek@siemens.com>
In-Reply-To: <CAMKF1souez4aWHQx3pgKjoqAuhh0xQ0cyYSPWiwmo4spqB+_mw@mail.gmail.com>
References: <CAMKF1souez4aWHQx3pgKjoqAuhh0xQ0cyYSPWiwmo4spqB+_mw@mail.gmail.com>
Subject: [PATCH v2 2/3] busybox: do not write grep outputs into log
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
X-List-Received-Date: Tue, 09 Oct 2018 07:39:25 -0000

Make grep quiet for prevent to write information into logs.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/busybox/busybox.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 7b427ab0f7..97b73c1dc0 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -278,32 +278,32 @@ do_install () {
 		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf
 		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf
 	fi
-	if grep "CONFIG_CROND=y" ${B}/.config; then
+	if grep -q "CONFIG_CROND=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HTTPD=y" ${B}/.config; then
+	if grep -q "CONFIG_HTTPD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-httpd ${D}${sysconfdir}/init.d/
 		install -d ${D}/srv/www
 	fi
-	if grep "CONFIG_UDHCPD=y" ${B}/.config; then
+	if grep -q "CONFIG_UDHCPD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HWCLOCK=y" ${B}/.config; then
+	if grep -q "CONFIG_HWCLOCK=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_UDHCPC=y" ${B}/.config; then
+	if grep -q "CONFIG_UDHCPC=y" ${B}/.config; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
 		install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
 		sed -i "s:/SBIN_DIR/:${base_sbindir}/:" ${D}${sysconfdir}/udhcpc.d/50default
 		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
 	fi
-	if grep "CONFIG_INETD=y" ${B}/.config; then
+	if grep -q "CONFIG_INETD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
 		sed -i "s:/usr/sbin/:${sbindir}/:" ${D}${sysconfdir}/init.d/inetd.${BPN}
 		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
 	fi
-        if grep "CONFIG_MDEV=y" ${B}/.config; then
+        if grep -q "CONFIG_MDEV=y" ${B}/.config; then
                install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
                if grep "CONFIG_FEATURE_MDEV_CONF=y" ${B}/.config; then
                        install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
@@ -312,7 +312,7 @@ do_install () {
                        install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
                fi
 	fi
-        if grep "CONFIG_INIT=y" ${B}/.config; then
+        if grep -q "CONFIG_INIT=y" ${B}/.config; then
                 install -D -m 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
                 install -D -m 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
         fi
-- 
2.11.0


