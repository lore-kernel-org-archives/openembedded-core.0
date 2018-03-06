Return-Path: <pab@pabigot.com>
X-Greylist: delayed 439 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Mar 2018 14:09:08 UTC
Received: from p3plsmtpa08-05.prod.phx3.secureserver.net
	(p3plsmtpa08-05.prod.phx3.secureserver.net [173.201.193.106])
	by mail.openembedded.org (Postfix) with ESMTP id D6F5878987
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:09:08 +0000 (UTC)
Received: from lilith.pab ([24.118.100.205]) by :SMTPAUTH: with SMTP
	id tDA5eXMTYESJQtDA6ezHZn; Tue, 06 Mar 2018 07:01:50 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 08:01:46 -0600
Message-Id: <1520344906-29881-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 2.7.4
X-CMAE-Envelope: MS4wfD64pZ+8l4D5t65tbDGZtSnCvl4ifw33FkpVSBSIjqjWKFtO4i0Q3BEs5+H6hUXxBhnA3FsQaj+VLpLdSdglVj/4ArJVpxfNNqWGXp8slyR5BqZiZsdJ
	WUHMqiVMOYMMmM5r+kVpjzbuGmi69gZV35oPl0+A0Mx0nWoRl3ppNsw+QFdX0fZS2JStmETBDIs8S+xJ21mEguy1B5pvJMbob3fV6XZdzEcpf0VP+Ys5H+dC
	XFWyguNF/P3bMDo4LYBbuA==
Cc: "Peter A . Bigot" <pab@pabigot.com>,
	Drew Moseley <drew.moseley@northern.tech>
Subject: [rocko][PATCH] beaglebone: Find /boot partition on mmcblk0
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
X-List-Received-Date: Tue, 06 Mar 2018 14:09:09 -0000

From: Drew Moseley <drew.moseley@northern.tech>

After commit edcf39820f94c84b29c95a0d7b16b8d36857e87b the beaglebone
builds fail to mount the boot partition as it is specified in
/etc/fstab with the device node /dev/mmcblkp1.  With systemd in
particular this is considered an error and the system drops into
emergency mode.

Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---

This was originally submitted by Drew Moseley, but AFAICT it never
made it to patchwork.

See: https://lists.yoctoproject.org/pipermail/poky/2017-October/011129.html

 meta-yocto-bsp/wic/beaglebone.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/wic/beaglebone.wks b/meta-yocto-bsp/wic/beaglebone.wks
index 0c09a95..967cad7 100644
--- a/meta-yocto-bsp/wic/beaglebone.wks
+++ b/meta-yocto-bsp/wic/beaglebone.wks
@@ -2,5 +2,5 @@
 # long-description: Creates a partitioned SD card image for Beaglebone.
 # Boot files are located in the first vfat partition.
 
-part /boot --source bootimg-partition --ondisk mmcblk --fstype=vfat --label boot --active --align 4 --size 16
+part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4 --size 16
 part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4
-- 
2.7.4


