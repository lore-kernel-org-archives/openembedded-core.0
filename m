Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB8AE6D67A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 05:41:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAD5f52a011502
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 21:41:06 -0800 (PST)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 21:41:05 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 13:41:00 +0800
Message-ID: <1384321260-30303-2-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1384321260-30303-1-git-send-email-ming.liu@windriver.com>
References: <1384321260-30303-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 2/2] kernel.bbclass: handles symbolic KERNEL_OUTPUT in bundle_initramfs task
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
X-List-Received-Date: Wed, 13 Nov 2013 05:41:04 -0000
Content-Type: text/plain

In many cases, KERNEL_OUTPUT is a symbolic link to the real bootable image,
but in bundle_initramfs task, it's not considered so that the KERNEL_OUTPUT
is being renamed/restored as a regular file, this leads it finally point to
a incorrect target, or even worse, break the bundle_initramfs task for
KERNEL_OUTPUT is not going to be regenerated in case it is a symbolic link
to vmlinux.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/kernel.bbclass | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 966066f..cc4a490 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -123,13 +123,28 @@ do_bundle_initramfs () {
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		echo "Creating a kernel image with a bundled initramfs..."
 		copy_initramfs
-		if [ -e ${KERNEL_OUTPUT} ] ; then
+		# Backuping kernel image relies on its type(regular file or symbolic link)
+		linkpath=""
+		realpath=""
+		if [ -h ${KERNEL_OUTPUT} ] ; then
+			linkpath=`readlink -n ${KERNEL_OUTPUT}`
+			realpath=`readlink -fn ${KERNEL_OUTPUT}`
+			mv -f $realpath $realpath.bak
+		elif [ -f ${KERNEL_OUTPUT} ]; then
 			mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
 		fi
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
 		kernel_do_compile
-		mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
-		mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
+		# Restoring kernel image
+		if [ -n "$realpath" ]; then
+			mv -f $realpath $realpath.initramfs
+			mv -f $realpath.bak $realpath
+			cd ${B}/$(dirname ${KERNEL_OUTPUT})
+			ln -sf $linkpath.initramfs
+		else
+			mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
+			mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
+		fi
 		# Update install area
 		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
 		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
-- 
1.8.4.1


