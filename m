Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0C477296
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 09:24:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1O9O0Mv010740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 01:24:00 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Feb 2016 01:24:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Feb 2016 01:23:57 -0800
Message-ID: <78cf7d00ef861d0053070a2e9ea154e055e0fbd9.1456304688.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1456304688.git.liezhi.yang@windriver.com>
References: <cover.1456304688.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] boot-directdisk.bbclass: drop IS_VM chechking
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
X-List-Received-Date: Wed, 24 Feb 2016 09:24:00 -0000
Content-Type: text/plain

The IS_VM was used for making menus for vmdk, vdi and qcow2, except
hddimg, there is no reason to not make menus for hddimg, so drop it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/boot-directdisk.bbclass |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index ce637b8..89007e3 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -62,8 +62,6 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_TIMEOUT ?= "10"
 
-IS_VM = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2"], "true", "false", d)}'
-
 boot_direct_populate() {
 	dest=$1
 	install -d $dest
@@ -102,12 +100,10 @@ build_boot_dd() {
 		efi_hddimg_populate $HDDDIR
 	fi
 
-	if [ "${IS_VM}" = "true" ]; then
-		if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
-			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 $HDDDIR/${SYSLINUXDIR}/
-			if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
-				install -m 0644 ${SYSLINUX_SPLASH} $HDDDIR/${SYSLINUXDIR}/splash.lss
-			fi
+	if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
+		install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 $HDDDIR/${SYSLINUXDIR}/
+		if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
+			install -m 0644 ${SYSLINUX_SPLASH} $HDDDIR/${SYSLINUXDIR}/splash.lss
 		fi
 	fi
 
-- 
1.7.9.5


