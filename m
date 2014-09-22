Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id AAF0B6FD28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 11:36:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id A71533162576;
	Mon, 22 Sep 2014 13:36:20 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Sep 2014 13:35:20 +0200
Message-Id: <1411385721-22264-9-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 8/9] wic: add sdimage-bootpart kickstart file
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
X-List-Received-Date: Mon, 22 Sep 2014 11:36:20 -0000

Add kickstart for generating a SD card image that should cover most use
case scenarios. The layout is as follows:
- 16MB vfat partition that IMAGE_BOOT_FILES will be copied to, 4k
  alignment
- ext4 rootfs, 4k alignment

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/image/canned-wks/sdimage-bootpart.wks | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 scripts/lib/image/canned-wks/sdimage-bootpart.wks

diff --git a/scripts/lib/image/canned-wks/sdimage-bootpart.wks b/scripts/lib/image/canned-wks/sdimage-bootpart.wks
new file mode 100644
index 0000000..7ffd632
--- /dev/null
+++ b/scripts/lib/image/canned-wks/sdimage-bootpart.wks
@@ -0,0 +1,6 @@
+# short-description: Create SD card image with a boot partition
+# long-description: Creates a partitioned SD card image. Boot files
+# are located in the first vfat partition.
+
+part /boot --source bootimg-partition --ondisk mmcblk --fstype=vfat --label boot --active --align 4 --size 16
+part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4
-- 
1.9.0


