Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6D7E61005
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 21:32:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8RLWSAq010634
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 14:32:28 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 27 Sep 2013 14:32:28 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2013 16:32:00 -0500
Message-ID: <1380317520-2111-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [v2 PATCH] kernel.bbclass: Allow INITRAMFS_TASK to trigger copy initramfs code
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
X-List-Received-Date: Fri, 27 Sep 2013 21:32:28 -0000
Content-Type: text/plain

Activating the INITRAMFS_TASK can cause circular dependencies, but
that is up to the end user to resolve in recipes.  The INITRAMFS_TASK
should also trigger immediate linking of the cpio task in the first
compile pass.  This was a subtle regression introduced by: 609d5a9ab
(kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency
and bundling).

This patch restores the previous behavior and only affects the
INITRAMFS_TASK which is not set by any of the default build profiles
in oe-core.

Reviewed-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/kernel.bbclass |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8cf66ce..4acfb7e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -83,6 +83,8 @@ KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.g
 
 copy_initramfs() {
 	echo "Copying initramfs into ./usr ..."
+	# In case the directory is not created yet from the first pass compile:
+	mkdir -p ${B}/usr
 	# Find and use the first initramfs image archive type we find
 	rm -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
 	for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
@@ -156,6 +158,12 @@ kernel_do_compile() {
 	# different initramfs image.  The way to do that in the kernel
 	# is to specify:
 	# make ...args... CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
+	if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] ; then
+		# The old style way of copying an prebuilt image and building it
+		# is turned on via INTIRAMFS_TASK != ""
+		copy_initramfs
+		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
+	fi
 	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
 		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
-- 
1.7.9.5


