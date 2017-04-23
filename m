Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 36993606D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Apr 2017 09:23:58 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z129so12004949wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Apr 2017 02:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=i5ATl2rhesPCByC3OIjPIJTQNpHubapJeve2xIz8ujo=;
	b=TmAGoLfbVQpyTQYY/lq7SkjHq5VRGvBKlNS3rsXa4+cq3/jJAROjIEjI9NcuJjOfbv
	hlUd8pax8rEDuTFs4wPpnzkRDJ4htBBAE/qZ/obXGHgyhPmTMyXTwFjUtqLPYXbC/DQ9
	MVzqP4ZwFXcSu9QEKOdx0QO6F4BeZF0xUrTZaI+1q8HZq33U8mv/Bnkym/6TlO6I+s/V
	PqCgd8y9wPz0ipLac5NbtSNTaQD/NbmWDBFXL84FRV7WE/INmJ2+eqVlu6ouSLVHXXW3
	8BVEvpzLCcfiXDW7/FaPQVwt6HOX3nRd4PHvtbf9/MI3/jY/0osQ2DApVri9Zeyx0Gng
	oHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=i5ATl2rhesPCByC3OIjPIJTQNpHubapJeve2xIz8ujo=;
	b=NL8p3coSWE1+YLFNKiJgBlacs9+gkzdUwDiSqFAss/Np8gxTa19NIZP/mM4uv0ZUXI
	DUkbGPtz6BJzVe+qtHM7q0sACSnwjGr6DZvzWYOot/0/BFaIAuh2MqOo5LkHTINcwFXa
	kCYo8VAkTl4wrrlsi6ad0T3UEusKzCmxIaMqTK0Dx00L/0BKpgj3GwZ/EYOPCcYRGSyG
	ydgzleFsGEdBal+Eru4CprKUKd5BFJUE+vr4NrQckORwVWC/gaeSlUCHZ9MVlGqBrXrk
	toAqRiYOH/Rzd4y86SmNLhTTIW0R8KEu3YdmUMwqDS1jrxEbQMaGp07DGjec1c1nifhT
	dlyQ==
X-Gm-Message-State: AN3rC/7yLiUXAeyj2dMxNfD0Nc+2fTVpsTm/iOr6qOnRWryc1srL5wJ1
	xRg8NrEjJFiHGDcM
X-Received: by 10.80.146.25 with SMTP id i25mr110760eda.18.1492939439633;
	Sun, 23 Apr 2017 02:23:59 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.154]) by smtp.gmail.com with ESMTPSA id
	b45sm2455961edb.36.2017.04.23.02.23.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Apr 2017 02:23:59 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Apr 2017 11:22:59 +0200
Message-Id: <1492939379-23498-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] classes/image_live: allow different filesystems to be used for live images
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
X-List-Received-Date: Sun, 23 Apr 2017 09:23:59 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The idea is copied from commit df0b217f3df2c36a32e5c4afaec36a28bfc77bbb:
[ classes/image_vm: allow different filesystems to be used for VM images ]

The same logic should apply to image_live.bbclass, to allow other
filesystems to be used vs just ext4. The default value of ext4 is kept
so there is no functional change unless LIVE_ROOTFS_TYPE is set in the
inherting recipe.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image-live.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index a3d1b4e..3a6e5f0 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -34,7 +34,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         ${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot \
                         ${@oe.utils.ifelse(d.getVar('COMPRESSISO', False),'zisofs-tools-native:do_populate_sysroot','')} \
-                        ${PN}:do_image_ext4 \
+                        ${PN}:do_image_${LIVE_ROOTFS_TYPE} \
                         "
 
 
@@ -43,11 +43,12 @@ ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
 INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
 
-ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.ext4"
+LIVE_ROOTFS_TYPE ?= "ext4"
+ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"
 
-IMAGE_TYPEDEP_live = "ext4"
-IMAGE_TYPEDEP_iso = "ext4"
-IMAGE_TYPEDEP_hddimg = "ext4"
+IMAGE_TYPEDEP_live = "${LIVE_ROOTFS_TYPE}"
+IMAGE_TYPEDEP_iso = "${LIVE_ROOTFS_TYPE}"
+IMAGE_TYPEDEP_hddimg = "${LIVE_ROOTFS_TYPE}"
 IMAGE_TYPES_MASKED += "live hddimg iso"
 
 python() {
-- 
2.7.4


