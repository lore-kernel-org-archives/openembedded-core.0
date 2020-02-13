Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9EBAB608CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 02:44:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01D2iN7R001048
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 18:44:44 -0800
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 12 Feb 2020 18:44:21 -0800
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Feb 2020 10:31:41 +0800
Message-ID: <20200213023141.1657-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.25.0.191.gde93cc14ab7e
MIME-Version: 1.0
Subject: [PATCH] wic: Honor APPEND
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
X-List-Received-Date: Thu, 13 Feb 2020 02:44:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

APPEND is used to add additional parameters to kernel by features, such
as read-only-rootfs. So we should honor this variable when we compose
the kernel parameter in wic. I know we also can resolve this kind of
issue by using the .wks.in template introduced by commit 42e870c5ed4b
("image_types.bbclass: support template .wks.in files for wic"), but the
APPEND is needed by all the wks, it would seems pretty ridiculous to me
to change all the .wks to .wks.in and then foist the APPEND into them.
So the APPEND is definitely deserved to export to the wic directly.

[Yocto #12809]

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 scripts/lib/wic/ksparser.py          | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index fc9b106a9a81..b83308b45cb5 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -4,7 +4,7 @@ WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
            ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
-           KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME"
+           KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND"
 
 inherit ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
 
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 707a2e801962..650b976223e0 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -246,6 +246,11 @@ class KickStart():
                     elif line.startswith('bootloader'):
                         if not self.bootloader:
                             self.bootloader = parsed
+                            # Concatenate the strings set in APPEND
+                            append_var = get_bitbake_var("APPEND")
+                            if append_var:
+                                self.bootloader.append = ' '.join(filter(None, \
+                                                         (self.bootloader.append, append_var)))
                         else:
                             err = "%s:%d: more than one bootloader specified" \
                                       % (confpath, lineno)
-- 
2.25.0.191.gde93cc14ab7e


