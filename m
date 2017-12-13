Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EABE78704
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 02:46:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBD2kABq005437
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 18:46:10 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 12 Dec 2017 18:46:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Dec 2017 10:45:52 +0800
Message-ID: <ba274d3c3832b5add3e599a5f350aafeb81c3cfb.1513133105.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513133105.git.liezhi.yang@windriver.com>
References: <cover.1513133105.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] image-live.bbclass: add MLPREFIX to core-image-minimal-initramfs
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
X-List-Received-Date: Wed, 13 Dec 2017 02:46:09 -0000
Content-Type: text/plain

The 32bit core-image-minimal-initramfs should be built when build lib32-iso, e.g.:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
IMAGE_FSTYPES += "iso"

$ bitbake lib32-core-image-minimal
Exception: FileExistsError: [Errno 17] File exists: '/path/to/tmp/sysroots-components/core2-64/qemuwrapper-cross/usr/bin/crossscripts/qemuwrapper' -> '/path/to/tmp/work/qemux86_64-pokymllib32-linux/lib32-core-image-minimal/1.0-r0/lib32-recipe-sysroot/usr/bin/crossscripts/qemuwrapper'

This was because:
lib32-core-image-minimal -> core-image-minimal-initramfs
core-image-minimal-initramfs -> qemuwrapper-cross
lib32-core-image-minimal -> lib32-qemuwrapper-cross

So we got the error, build lib32-core-image-minimal-initramfs can fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image-live.bbclass                          | 2 +-
 meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 7a388d5..9f8ff79 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -40,7 +40,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
 
 LABELS_LIVE ?= "boot install"
 ROOT_LIVE ?= "root=/dev/ram0"
-INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
+INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
 INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
 
 LIVE_ROOTFS_TYPE ?= "ext4"
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 5794a25..c446e87 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -8,7 +8,7 @@ PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-ins
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
 
-export IMAGE_BASENAME = "core-image-minimal-initramfs"
+export IMAGE_BASENAME = "${MLPREFIX}core-image-minimal-initramfs"
 IMAGE_LINGUAS = ""
 
 LICENSE = "MIT"
-- 
2.7.4


