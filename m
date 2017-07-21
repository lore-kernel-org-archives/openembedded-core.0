Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8108A78441
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 22:05:23 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id y8so1415122ywi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 15:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UOAyhspYJgb5n2hjmNolrd/TwC30OLRfwA3WFRxqhkI=;
	b=ph96ZS9f+M9uoHFOVncxc/5wN83O2n9EV7ayHe4G4gVS5wjlzEwN/BmyT2+CSTCJ0o
	CCuY433mVu3g7bhh3M412pnQnpt5boFhqn86QLb6ZLcT1pqsUU+Cz1U2/m0EgWU/8gt7
	aP4Pz8y8CjWIGI2n1oxTcNBIYp8jZ7o+feBfsc8mAQiOs1kp76TUOFqaIgHNrA+tU8gp
	bpL59PqUM9oMbkKHFZDryVPWz11HfINyfGfhMoPdQvKyvBb2nAruBDBELH1egw8EsAlv
	4x+Rk1SSp93SXDlfw2xn14vVcdR7hrx1P6Rz+NEuIqi1TJS+8QGCuWr6I56EAW3d+rPx
	oaug==
X-Gm-Message-State: AIVw1130iSSDHxs60CfdyoWYhoq77smQzkaT91qKpNOlbqRoPs5/Hzye
	paXYLS5A3H4YtAzz
X-Received: by 10.129.96.85 with SMTP id u82mr7425017ywb.384.1500674723847;
	Fri, 21 Jul 2017 15:05:23 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58])
	by smtp.gmail.com with ESMTPSA id p5sm2061427ywl.48.2017.07.21.15.05.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Jul 2017 15:05:23 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 18:06:33 -0400
Message-Id: <1500674794-23258-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] image.bbclass: Correct chaining compression support
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
X-List-Received-Date: Fri, 21 Jul 2017 22:05:23 -0000

When chaining of compression/conversion types was added, we had a new
way to handle doing things like "ext4.bz2.sha256sum" or
"ext2.gz.u-boot".  However, because the U-Boot image class isn't
included normally, it wasn't properly converted at the time.  After the
support was added the "clean" argument that the .u-boot code uses no
longer functions.  The fix for this inadvertently broke chaining
compression/conversion.  First, correct the u-boot conversion code.

Fixes: 46bc438374de ("image.bbclass: do exact match for rootfs type")
Cc: Zhenhua Luo <zhenhua.luo@nxp.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
This change is fairly important and, imho, innocuous and should be
populated to pyro/etc, once merged to master.  The next part of the
series is clean-up and while with my U-Boot hat on, I would say should
be pushed more widely, I am biased.
---
 meta/classes/image.bbclass             |  2 +-
 meta/classes/image_types_uboot.bbclass | 13 +++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index de535ce6fcff..bd6a5b7b810a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -453,7 +453,7 @@ python () {
         rm_tmp_images = set()
         def gen_conversion_cmds(bt):
             for ctype in ctypes:
-                if bt[bt.find('.') + 1:] == ctype:
+                if bt.endswith("." + ctype):
                     type = bt[0:-len(ctype) - 1]
                     if type.startswith("debugfs_"):
                         type = type[8:]
diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 5dfa39287dab..8db436efb14b 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -3,9 +3,6 @@ inherit image_types kernel-arch
 oe_mkimage () {
     mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
         -d ${IMGDEPLOYDIR}/$1 ${IMGDEPLOYDIR}/$1.u-boot
-    if [ x$3 = x"clean" ]; then
-        rm $1
-    fi
 }
 
 CONVERSIONTYPES += "gz.u-boot bz2.u-boot lz4.u-boot lzma.u-boot lzo.u-boot u-boot"
@@ -14,19 +11,19 @@ CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
 CONVERSION_CMD_u-boot      = "oe_mkimage ${IMAGE_NAME}.rootfs.${type} none"
 
 CONVERSION_DEPENDS_gz.u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_gz.u-boot      = "${CONVERSION_CMD_gz}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.gz gzip clean"
+CONVERSION_CMD_gz.u-boot      = "${CONVERSION_CMD_gz}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.gz gzip"
 
 CONVERSION_DEPENDS_bz2.u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_bz2.u-boot      = "${CONVERSION_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.bz2 bzip2 clean"
+CONVERSION_CMD_bz2.u-boot      = "${CONVERSION_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.bz2 bzip2"
 
 CONVERSION_DEPENDS_lz4.u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_lz4.u-boot      = "${CONVERSION_CMD_lz4_legacy}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lz4 lz4 clean"
+CONVERSION_CMD_lz4.u-boot      = "${CONVERSION_CMD_lz4_legacy}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lz4 lz4"
 
 CONVERSION_DEPENDS_lzma.u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_lzma.u-boot      = "${CONVERSION_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma clean"
+CONVERSION_CMD_lzma.u-boot      = "${CONVERSION_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma"
 
 CONVERSION_DEPENDS_lzo.u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_lzo.u-boot      = "${CONVERSION_CMD_lzo}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzo lzo clean"
+CONVERSION_CMD_lzo.u-boot      = "${CONVERSION_CMD_lzo}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzo lzo"
 
 IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot cpio.gz.u-boot"
 
-- 
1.9.1


