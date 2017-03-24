Return-Path: <ejo@pengutronix.de>
X-Greylist: delayed 993 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Mar 2017 11:32:15 UTC
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id C38AA72F7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 11:32:15 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
	(envelope-from <ejo@pengutronix.de>)
	id 1crNC3-0000di-G1; Fri, 24 Mar 2017 12:15:43 +0100
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.88)
	(envelope-from <ejo@pengutronix.de>)
	id 1crNC3-0001Si-14; Fri, 24 Mar 2017 12:15:43 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 12:15:02 +0100
Message-Id: <20170324111502.23474-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: uol@pengutronix.de, Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH] image_types: perform fsck on created ext image
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
X-List-Received-Date: Fri, 24 Mar 2017 11:32:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When performing a file system check, the image created with mkfs will
trigger Pass 3A ('Optimizing directories') which turns the file system
into state "changed" (EXT2_FLAG_CHANGED).

This will let fsck request a reboot by setting the return code flag "2".

The result of this is that each ext-image built with oe-core will
trigger a reboot during the first time an fsck is triggered.

A common case where this might occur is when fsck detects having
a future superblock write time. This always happens when booting a
newly created ext4 rootfs with a target that does not have a recent time
set.

This patch moves the initial fsck run that performs the optimization
from the target to the host system and thus prevents the target from
performing an avoidable reboot.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Ulrich Ölmann <uol@pengutronix.de>
---
 meta/classes/image_types.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 1ce8334e3a..52d3af0cc1 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -66,6 +66,8 @@ oe_mkext234fs () {
 	# Create a sparse image block
 	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
 	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
+	# Error codes 0-3 indicate successfull operation of fsck (no errors or errors corrected)
+	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]
 }
 
 IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
-- 
2.11.0


