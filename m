Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id 22C266B0CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 18:14:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KIECTb027785
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 13:14:12 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KIEC5n025950
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 13:14:12 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 13:14:12 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7KIE9DM016281;
	Tue, 20 Aug 2013 13:14:10 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 13:45:21 -0500
Message-ID: <1377024321-6230-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v2] kernel.bbclass: Create symbolic link to add ${KERNEL_IMAGETYPE} to boot package
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
X-List-Received-Date: Tue, 20 Aug 2013 18:14:16 -0000
Content-Type: text/plain

* By default for some platforms U-boot assumes the kernel image is located in
  the boot directory of the root filesystem.
* The kernel.bbclass already includes the kernel image in the /boot directory
  but adds a version number to the file name.
* Create a symbolic link that names the kernel image in the exact way that
  U-boot expects.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Change "ln -s" to "ln -sf" based on Bruce's comment.

 meta/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e039dfc..6e7d994 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -109,6 +109,7 @@ kernel_do_install() {
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
 	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
+	ln      -sf ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
-- 
1.7.0.4


