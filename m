Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52C4073281
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 07:15:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u387FP8r022209
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Apr 2016 00:15:25 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Apr 2016 00:15:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Apr 2016 00:15:21 -0700
Message-ID: <f96dbce37e925c8d8f87a7c10168d3412df77b78.1460099653.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460099653.git.liezhi.yang@windriver.com>
References: <cover.1460099653.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] image_types.bbclass: fix elf
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

Fixed:
| DEBUG: Executing shell function do_image_elf
| Cannot open `/path/to/tmp/sysroots/qemux86-64/usr/src/kernel/bzImage': (null)
| WARNING: exit code 1 from a shell command.

The bzImage is in DEPLOY_DIR_IMAGE

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image_types.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index caa4dbb..0683c47 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -111,13 +111,14 @@ IMAGE_CMD_cpio () {
 	fi
 }
 
-ELF_KERNEL ?= "${STAGING_DIR_HOST}/usr/src/kernel/${KERNEL_IMAGETYPE}"
+ELF_KERNEL ?= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
 ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
 
 IMAGE_CMD_elf () {
 	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf && rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf
 	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
 }
+
 IMAGE_TYPEDEP_elf = "cpio.gz"
 
 MKUBIFS_ARGS ?= "-m 1KiB -e 128KiB -c $ROOTFS_SIZE"
-- 
2.7.4


