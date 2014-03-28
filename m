Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61CD06DF25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:44:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9iAU3004554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:44:10 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:44:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:50 +0800
Message-ID: <1bd8b836f086e173f9fdbbfede744025938de5b8.1395996410.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996410.git.hongxu.jia@windriver.com>
References: <cover.1395996410.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/5] kernel.bbclass: handles symbolic KERNEL_OUTPUT in bundle_initramfs task
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
X-List-Received-Date: Fri, 28 Mar 2014 09:44:09 -0000
Content-Type: text/plain

From: Ming Liu <ming.liu@windriver.com>

In many cases, KERNEL_OUTPUT is a symbolic link to the real bootable image,
but in bundle_initramfs task, it's not considered so that the KERNEL_OUTPUT
is being renamed/restored as a regular file, this leads it finally point to
a incorrect target, or even worse, break the bundle_initramfs task for
KERNEL_OUTPUT is not going to be regenerated in case it is a symbolic link
to vmlinux.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/kernel.bbclass | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 19b159b..b5e5a85 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -128,13 +128,28 @@ do_bundle_initramfs () {
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
1.8.1.2


