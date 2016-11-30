Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4197471B12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 23:36:55 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 45ECBB89A3D; Thu,  1 Dec 2016 00:36:52 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 00:36:49 +0100
Message-Id: <1480549011-12168-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480549011-12168-1-git-send-email-obi@opendreambox.org>
References: <1480549011-12168-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 3/5] kernel.bbclass: Avoid wildcards for kernel images
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
X-List-Received-Date: Wed, 30 Nov 2016 23:36:56 -0000

With multiple kernel images enabled starting with 'vmlinux', e.g.
vmlinux.gz and vmlinux.bin, all files landed inside the
kernel-vmlinux package.

On top of that, even initramfs images were included, e.g.
vmlinux.gz-initramfs-*.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0e7ebd4..634553c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -48,7 +48,7 @@ python __anonymous () {
 
         d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
 
-        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type + '*')
+        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type + '-${KERNEL_VERSION_NAME}')
 
         d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
 
@@ -486,7 +486,7 @@ FILES_${PN} = ""
 FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = ""
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
-FILES_kernel-vmlinux = "/boot/vmlinux*"
+FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
 FILES_kernel-modules = ""
 RDEPENDS_kernel = "kernel-base"
 # Allow machines to override this dependency if kernel image files are
-- 
2.7.4


