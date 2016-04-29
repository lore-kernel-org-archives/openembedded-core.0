Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 133AB77011
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 12:42:27 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=from:to:cc:subject:date:message-id; 
	b=F8iwFDJOk2L1WLJCS8DklXt2k7xsvAS+MztPDotGp7ug7v6xJBjQz+LtqvZauR61k8p4qbz8Po9Z
	GOcnveE5NRpFvVCkN9CAxSZnpxzHz+TrMZ1TNsYPKRKe5yGlrmXqnSzAYhFRNWZ4lEPjxT2C6X16
	uIRQPdM0sWE62SmCCiA=  
Received: from cephei.geekcentral.local
	(pool-173-62-237-112.phlapa.fios.verizon.net [173.62.237.112])
	by mx.zohomail.com with SMTPS id 1461933740381751.9442016809606;
	Fri, 29 Apr 2016 05:42:20 -0700 (PDT)
From: Ian Reinhart Geiser <geiseri@geekcentral.pub>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2016 08:41:49 -0400
Message-Id: <1461933709-22049-1-git-send-email-geiseri@geekcentral.pub>
X-Mailer: git-send-email 2.8.1
X-ZohoMail: Z_60737559 SPT_1 Z_60732476 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
Subject: [PATCH v2] Allow different filesystems to be used for VM images.
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
X-List-Received-Date: Fri, 29 Apr 2016 12:42:28 -0000

This allows for things like btrfs to be used vs just ext4.
The default value of ext4 is kept so there is no functional
change unless VM_ROOTFS_TYPE is set in the inherting recipe.

Signed-off-by: Ian Reinhart Geiser <geiseri@geekcentral.pub>
---
 meta/classes/image-vm.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 47f7326..2bbd9d3 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -23,16 +23,17 @@ do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
                                syslinux-native:do_populate_sysroot \
                                parted-native:do_populate_sysroot \
                                mtools-native:do_populate_sysroot \
-                               ${PN}:do_image_ext4 \
+                               ${PN}:do_image_${VM_ROOTFS_TYPE} \
                                "
 
-IMAGE_TYPEDEP_vmdk = "ext4"
-IMAGE_TYPEDEP_vdi = "ext4"
-IMAGE_TYPEDEP_qcow2 = "ext4"
-IMAGE_TYPEDEP_hdddirect = "ext4"
+IMAGE_TYPEDEP_vmdk = "${VM_ROOTFS_TYPE}"
+IMAGE_TYPEDEP_vdi = "${VM_ROOTFS_TYPE}"
+IMAGE_TYPEDEP_qcow2 = "${VM_ROOTFS_TYPE}"
+IMAGE_TYPEDEP_hdddirect = "${VM_ROOTFS_TYPE}"
 IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect"
 
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
+VM_ROOTFS_TYPE ?= "ext4"
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}"
 
 # Used by bootloader
 LABELS_VM ?= "boot"
-- 
2.8.1



