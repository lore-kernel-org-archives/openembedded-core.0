Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 753F56098F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 21:10:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4TLAGSV022654
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 14:10:16 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 14:10:15 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 16:16:25 -0500
Message-ID: <1369862187-29613-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 9/21 v2] syslinux.bbclass: pull ldlinux.sys and isolinux.bin from correct places
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
X-List-Received-Date: Wed, 29 May 2013 21:10:14 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

ldlinux.sys is used when building an hdd image, and
isolinux.bin when building an iso bootimage.  In both
cases, we want to look in the sysroot for MACHINE,
not in the one for the multilib we might be using.

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/syslinux.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 501bc6d..2c7ecf6 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -38,11 +38,13 @@ syslinux_populate() {
 	install -m 0644 ${SYSLINUXCFG} ${DEST}${BOOTDIR}/${CFGNAME}
 }
 
+# we want to pull isolinux.bin and ldlinux.sys from the MACHINE sysroot
+#
 syslinux_iso_populate() {
 	syslinux_populate ${ISODIR} ${ISOLINUXDIR} isolinux.cfg
-	install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
+	install -m 0644 ${STAGING_DIR}/${MACHINE}/${libdir}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
 	if [ "${AUTO_SYSLINUXMENU}" = 1 ] ; then
-		install -m 0644 ${STAGING_DATADIR}/syslinux/vesamenu.c32 ${ISODIR}${ISOLINUXDIR}/vesamenu.c32
+		install -m 0644 ${STAGING_DIR}/${MACHINE}/${libdir}/syslinux/vesamenu.c32 ${ISODIR}${ISOLINUXDIR}/vesamenu.c32
 		if [ "${SYSLINUX_SPLASH}" != "" ] ; then
 			install -m 0644 ${SYSLINUX_SPLASH} ${ISODIR}${ISOLINUXDIR}/splash.lss
 		fi
@@ -51,9 +53,9 @@ syslinux_iso_populate() {
 
 syslinux_hddimg_populate() {
 	syslinux_populate ${HDDDIR} ${SYSLINUXDIR} syslinux.cfg
-	install -m 0444 ${STAGING_DATADIR}/syslinux/ldlinux.sys ${HDDDIR}${SYSLINUXDIR}/ldlinux.sys
+	install -m 0444 ${STAGING_DIR}/${MACHINE}/${libdir}/syslinux/ldlinux.sys ${HDDDIR}${SYSLINUXDIR}/ldlinux.sys
 	if [ "${AUTO_SYSLINUXMENU}" = 1 ] ; then
-		install -m 0644 ${STAGING_DATADIR}/syslinux/vesamenu.c32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
+		install -m 0644 ${STAGING_DIR}/${MACHINE}/${libdir}/syslinux/vesamenu.c32 ${ISODIR}${ISOLINUXDIR}/vesamenu.c32
 		if [ "${SYSLINUX_SPLASH}" != "" ] ; then
 			install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR}${SYSLINUXDIR}/splash.lss
 		fi
-- 
1.8.1.2.545.g2f19ada


