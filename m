Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF82073281
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 07:15:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u387FPS0021292
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Apr 2016 00:15:25 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Apr 2016 00:15:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Apr 2016 00:15:22 -0700
Message-ID: <98fa634dc85e9a59a86f63d53c59040c0df93254.1460099653.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460099653.git.liezhi.yang@windriver.com>
References: <cover.1460099653.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] image-vm.bbclass/image_types.bbclass: IMAGE_NAME -> IMAGE_LINK_NAME
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
X-List-Received-Date: Fri, 08 Apr 2016 07:15:24 -0000
Content-Type: text/plain

If we create hdddirect in the first time, and run bitbake to create
vmimg in the second time, then the previouse created
${IMAGE_LINK_NAME}.hdddirect may can not be found since it contains the
data string which are different. Use IMAGE_LINK_NAME to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image-vm.bbclass    | 2 +-
 meta/classes/image_types.bbclass | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 2cd2640..47f7326 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -146,7 +146,7 @@ DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
 
 run_qemu_img (){
     type="$1"
-    qemu-img convert -O $type ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.$type
+    qemu-img convert -O $type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.$type
     ln -sf ${IMAGE_NAME}.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
 }
 create_vmdk_image () {
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 0683c47..b702bc1 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -116,7 +116,7 @@ ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
 
 IMAGE_CMD_elf () {
 	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf && rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf
-	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
+	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
 }
 
 IMAGE_TYPEDEP_elf = "cpio.gz"
-- 
2.7.4


