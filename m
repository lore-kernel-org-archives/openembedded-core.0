Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58010605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 09:49:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4C9n0U7015414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 02:49:01 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 May 2016 02:49:00 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 May 2016 05:48:56 -0400
Message-ID: <1f37fe5af2c41d0a4e1aa5543466a48d3ae41ddc.1463045021.git.zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1463045020.git.zhe.he@windriver.com>
References: <cover.1463045020.git.zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v4 2/2] kernel: Make symbol link to vmlinuz in boot directory
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
X-List-Received-Date: Thu, 12 May 2016 09:49:03 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Rename do_kernel_link_vmlinux to do_kernel_link_images and make a
symbol link to vmlinuz(if exists) for reference in arch/$arch/boot
directory.

Signen-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/classes/kernel.bbclass               | 13 ++++++++-----
 meta/conf/documentation.conf              |  2 +-
 meta/recipes-kernel/linux/linux-yocto.inc |  2 +-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 775c827..28d0936 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -474,15 +474,18 @@ python split_kernel_packages () {
 }
 
 # Many scripts want to look in arch/$arch/boot for the bootable
-# image. This poses a problem for vmlinux based booting. This 
-# task arranges to have vmlinux appear in the normalized directory
-# location.
-do_kernel_link_vmlinux() {
+# image. This poses a problem for vmlinux and vmlinuz based
+# booting. This task arranges to have vmlinux and vmlinuz appear
+# in the normalized directory location.
+do_kernel_link_images() {
 	if [ ! -d "${B}/arch/${ARCH}/boot" ]; then
 		mkdir ${B}/arch/${ARCH}/boot
 	fi
 	cd ${B}/arch/${ARCH}/boot
 	ln -sf ../../../vmlinux
+	if [ -f ../../../vmlinuz ]; then
+		ln -sf ../../../vmlinuz
+	fi
 }
 
 do_strip() {
@@ -512,7 +515,7 @@ do_strip() {
 }
 do_strip[dirs] = "${B}"
 
-addtask do_strip before do_sizecheck after do_kernel_link_vmlinux
+addtask do_strip before do_sizecheck after do_kernel_link_images
 
 # Support checking the kernel size since some kernels need to reside in partitions
 # with a fixed length or there is a limit in transferring the kernel to memory
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index dcc324c..c0025f5 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -28,7 +28,7 @@ do_install_ptest_base[doc] = "Copies the runtime test suite files from the compi
 do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto style kernel"
 do_kernel_configcheck[doc] = "Validates the kernel configuration for a linux-yocto style kernel"
 do_kernel_configme[doc] = "Assembles the kernel configuration for a linux-yocto style kernel"
-do_kernel_link_vmlinux[doc] = "Creates a symbolic link in arch/$arch/boot for vmlinux kernel images"
+do_kernel_link_images[doc] = "Creates a symbolic link in arch/$arch/boot for vmlinux and vmlinuz kernel images"
 do_listtasks[doc] = "Lists all defined tasks for a target"
 do_menuconfig[doc] = "Runs 'make menuconfig' for the kernel"
 do_package[doc] = "Analyzes the content of the holding area and splits it into subsets based on available packages and files"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 6b161fc..fd68786 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -52,6 +52,6 @@ do_install_append(){
 }
 
 # extra tasks
-addtask kernel_link_vmlinux after do_compile before do_install
+addtask kernel_link_images after do_compile before do_install
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
-- 
2.8.1


