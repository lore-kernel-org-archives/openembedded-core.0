Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by mail.openembedded.org (Postfix) with ESMTP id 325ED6007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 15:03:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7EF39dZ011561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 10:03:09 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7EF39s9028412
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 10:03:09 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 14 Aug 2013 10:03:09 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7EF3681030298;
	Wed, 14 Aug 2013 10:03:07 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 10:32:17 -0500
Message-ID: <1376494338-11646-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] kernel.bbclass: Create symbolic link to add ${KERNEL_IMAGETYPE} to boot package
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
X-List-Received-Date: Wed, 14 Aug 2013 15:03:10 -0000
Content-Type: text/plain

* By default for some platforms U-boot assumes the kernel image is located in
  the boot directory of the root filesystem.
* The kernel.bbclass already includes the kernel image in the /boot directory
  but adds a version number to the file name.
* Create a symbolic link that names the kernel image in the exact way that
  U-boot expects.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e039dfc..248ee71 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -109,6 +109,7 @@ kernel_do_install() {
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
 	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
+	ln      -s ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
-- 
1.7.0.4


