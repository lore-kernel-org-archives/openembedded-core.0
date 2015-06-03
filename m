Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DDA1675742
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 18:08:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2015 11:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,548,1427785200"; d="scan'208";a="581512592"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 03 Jun 2015 11:09:01 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Wed,  3 Jun 2015 11:07:27 -0700
Message-Id: <1433354849-16843-6-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
References: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 5/7] boot-direct.bbclass: Add support for VDI images
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
X-List-Received-Date: Wed, 03 Jun 2015 18:08:59 -0000

Same treatment for both  VMDK and VDI images.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/boot-directdisk.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 44f738b..c576523 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -63,7 +63,7 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_TIMEOUT ?= "10"
 
-IS_VMDK = '${@bb.utils.contains("IMAGE_FSTYPES", "vmdk", "true", "false", d)}'
+IS_VM = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk" ,"vdi"], "true", "false", d)}'
 
 boot_direct_populate() {
 	dest=$1
@@ -101,7 +101,7 @@ build_boot_dd() {
 		efi_hddimg_populate $HDDDIR
 	fi
 
-	if [ "${IS_VMDK}" = "true" ]; then
+	if [ "${IS_VM}" = "true" ]; then
 		if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
 			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 $HDDDIR/${SYSLINUXDIR}/
 			if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
-- 
1.9.1


