Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1U8gY6-00014p-8X
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 01:32:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1LMkVAO000031
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 14:46:31 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 21 Feb 2013 14:46:30 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jeff.polk@windriver.com>
Date: Thu, 21 Feb 2013 14:46:30 -0800
Message-ID: <1361486790-19403-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [oe-core PATCH] pull ldlinux.sys and isolinux.bin from correct places
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Feb 2013 00:32:13 -0000
Content-Type: text/plain

ldlinux.sys is used when building an hdd image, and
isolinux.bin when building an iso bootimage.  In both
cases, we want to look in the sysroot for MACHINE,
not in the one for the multilib we might be using.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/syslinux.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index c4596bf..666ffd6 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -39,14 +39,16 @@ syslinux_populate() {
 	fi
 }
 
+# we want to pull isolinux.bin and ldlinux.sys from the MACHINE sysroot
+#
 syslinux_iso_populate() {
 	syslinux_populate ${ISODIR} ${ISOLINUXDIR} isolinux.cfg
-	install -m 0644 ${STAGING_LIBDIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
+	install -m 0644 ${STAGING_DIR}/${MACHINE}/${libdir}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
 }
 
 syslinux_hddimg_populate() {
 	syslinux_populate ${HDDDIR} ${SYSLINUXDIR} syslinux.cfg
-	install -m 0444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}${SYSLINUXDIR}/ldlinux.sys
+	install -m 0444 ${STAGING_DIR}/${MACHINE}/${libdir}/syslinux/ldlinux.sys ${HDDDIR}${SYSLINUXDIR}/ldlinux.sys
 }
 
 syslinux_hddimg_install() {
-- 
1.7.3.4



