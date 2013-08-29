Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 110FE6BD4D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 02:36:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7T2aMTR027720
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 19:36:23 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 28 Aug 2013 19:36:21 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2013 10:36:17 +0800
Message-ID: <f48a576c2a1e09f0fec53aedf6dca5ca001047bd.1377674089.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1377674089.git.jackie.huang@windriver.com>
References: <cover.1377674089.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] syslinux.bbclass: pull files from correct places for multilib
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
X-List-Received-Date: Thu, 29 Aug 2013 02:36:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

syslinux files isolinux.bin, ldlinux.sys and vesamenu.c32 are used
when building hdd/iso image, but in multilib case, STAGING_DATADIR
points to ${MLPREFIX}${MACHINE} in sysroot which is not correct
for pulling syslinux files, fix it to ${MACHINE}.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/syslinux.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 501bc6d..a9eba59 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -40,9 +40,9 @@ syslinux_populate() {
 
 syslinux_iso_populate() {
 	syslinux_populate ${ISODIR} ${ISOLINUXDIR} isolinux.cfg
-	install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
+	install -m 0644 ${STAGING_DIR}/${MACHINE}/${datadir}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
 	if [ "${AUTO_SYSLINUXMENU}" = 1 ] ; then
-		install -m 0644 ${STAGING_DATADIR}/syslinux/vesamenu.c32 ${ISODIR}${ISOLINUXDIR}/vesamenu.c32
+		install -m 0644 ${STAGING_DIR}/${MACHINE}/${datadir}/syslinux/vesamenu.c32 ${ISODIR}${ISOLINUXDIR}/vesamenu.c32
 		if [ "${SYSLINUX_SPLASH}" != "" ] ; then
 			install -m 0644 ${SYSLINUX_SPLASH} ${ISODIR}${ISOLINUXDIR}/splash.lss
 		fi
@@ -51,9 +51,9 @@ syslinux_iso_populate() {
 
 syslinux_hddimg_populate() {
 	syslinux_populate ${HDDDIR} ${SYSLINUXDIR} syslinux.cfg
-	install -m 0444 ${STAGING_DATADIR}/syslinux/ldlinux.sys ${HDDDIR}${SYSLINUXDIR}/ldlinux.sys
+	install -m 0444 ${STAGING_DIR}/${MACHINE}/${datadir}/syslinux/ldlinux.sys ${HDDDIR}${SYSLINUXDIR}/ldlinux.sys
 	if [ "${AUTO_SYSLINUXMENU}" = 1 ] ; then
-		install -m 0644 ${STAGING_DATADIR}/syslinux/vesamenu.c32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
+		install -m 0644 ${STAGING_DIR}/${MACHINE}/${datadir}/syslinux/vesamenu.c32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
 		if [ "${SYSLINUX_SPLASH}" != "" ] ; then
 			install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR}${SYSLINUXDIR}/splash.lss
 		fi
-- 
1.7.4.1


