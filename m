Return-Path: <Kexin.Hao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84F55799B1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:10:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T7A3QJ003437
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:10:03 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 29 Sep 2018 00:10:02 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 15:01:47 +0800
Message-ID: <20180929070147.88203-5-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180929070147.88203-1-kexin.hao@windriver.com>
References: <20180929070147.88203-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] wic: Set the right bootimg_dir when building a multilib image
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
X-List-Received-Date: Sat, 29 Sep 2018 07:10:02 -0000
Content-Type: text/plain

When building a multilib image (such as lib32-xxx), we do want the
bootloader to be build in the 64bit mode. So it will be installed into
a directory like:
  .../lib32-core-image-minimal/1.0-r0/recipe-sysroot/usr/share/

In this case, we need to set the bootimg_dir to use the value of
STAGING_ALT_DATADIR.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 scripts/wic                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 5b40a9e919f2..241e52b3e9f2 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -3,7 +3,7 @@
 WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
-           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
+           ROOTFS_SIZE STAGING_ALT_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
diff --git a/scripts/wic b/scripts/wic
index 7392bc4e7f49..067acaabf030 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -166,7 +166,7 @@ def wic_create_subcommand(options, usage_str):
 
         rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
         kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
-        bootimg_dir = get_bitbake_var("STAGING_DATADIR", options.image_name)
+        bootimg_dir = get_bitbake_var("STAGING_ALT_DATADIR", options.image_name)
 
         native_sysroot = options.native_sysroot
         if options.vars_dir and not native_sysroot:
-- 
2.14.4


