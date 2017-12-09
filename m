Return-Path: <Kexin.Hao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFE1A71984
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 02:43:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB82he2b025169
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Dec 2017 18:43:40 -0800 (PST)
Received: from pek-lpgbuild2.wrs.com (128.224.153.30) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 7 Dec 2017 18:43:40 -0800
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Dec 2017 10:45:46 +0800
Message-ID: <20171209024546.16918-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20171209024546.16918-1-kexin.hao@windriver.com>
References: <20171209024546.16918-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] wic: plugins: rawcopy: Add support to download the raw image from a http server
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
X-List-Received-Date: Fri, 08 Dec 2017 02:43:40 -0000
Content-Type: text/plain

Some firmwares are critical for the basic functions of the board, and may
be used by the bootloader. Due to the license issue, we can't integrate
it. But we do need it when creating a booting image by using WIC.
So add the support for the WIC to download a raw file from http
server and write it to a specific part. In order to restrict the
downloading behaviour, we introduce a "WKS_ALLOW_DOWNLOAD" variable and
only do the downloading when this variable is set.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/classes/image_types_wic.bbclass      |  2 +-
 scripts/lib/wic/plugins/source/rawcopy.py | 13 +++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 222ae004338d..70858ad5d7a1 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -3,7 +3,7 @@
 WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
-           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
+           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS WKS_ALLOW_DOWNLOAD"
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index baf991fe8d5d..808c279aed4c 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -50,8 +50,17 @@ class RawCopyPlugin(SourcePlugin):
         if 'file' not in source_params:
             raise WicError("No file specified")
 
-        src = os.path.join(kernel_dir, source_params['file'])
-        dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
+        if source_params['file'].startswith('http://') or source_params['file'].startswith('https://'):
+            # Only download the image from remote site when explicilty requesting so
+            if get_bitbake_var("WKS_ALLOW_DOWNLOAD") != "1":
+                return
+            src = os.path.join(cr_workdir, "%s" % source_params['file'].rsplit('/',1)[-1])
+            dst = "%s.dst" % src
+            download_cmd = "wget -r -O %s %s" %(src, source_params['file'])
+            exec_cmd(download_cmd)
+        else:
+            src = os.path.join(kernel_dir, source_params['file'])
+            dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
 
         skip = 0 if 'skip' not in source_params else int(source_params['skip'])
         seek = 0 if 'seek' not in source_params else int(source_params['seek'])
-- 
2.9.3


