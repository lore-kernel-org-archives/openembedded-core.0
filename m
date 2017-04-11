Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F17A77CEE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:21:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3B9Lbua028334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 02:21:37 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Apr 2017 02:21:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Apr 2017 02:21:30 -0700
Message-ID: <2f158465f49798552c61d96c7b8275ea4b168e93.1491902179.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491902179.git.liezhi.yang@windriver.com>
References: <cover.1491902179.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] wic-image-minimal.wks: vda -> sda
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
X-List-Received-Date: Tue, 11 Apr 2017 09:21:37 -0000
Content-Type: text/plain

Previously, runqemu grep root=/dev/sd or root=/dev/hd on the image, and
would use vda if no grep result, now we have set QB_DRIVE_TYPE to
"/dev/sd" by default, and the device will be /dev/sda, so use sda to
replace vda in the test case.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks b/meta-selftest/recipes-test/images/wic-image-minimal.wks
index d55075d503..3e08cf4e43 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
@@ -2,9 +2,9 @@
 # long-description: This image contains boot partition and 3 rootfs partitions
 # created from core-image-minimal and wic-image-minimal image recipes.
 
-part /boot --source bootimg-pcbios --ondisk vda --label boot --active --align 1024
-part / --source rootfs --ondisk vda --fstype=ext4 --label platform --align 1024 --use-uuid
-part /mnt --source rootfs --rootfs-dir=core-image-minimal --ondisk vda --fstype=ext4 --label core --align 1024
-part backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk vda --fstype=ext4 --label backup --align 1024
+part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+part /mnt --source rootfs --rootfs-dir=core-image-minimal --ondisk sda --fstype=ext4 --label core --align 1024
+part backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label backup --align 1024
 
 bootloader --ptable gpt --timeout=0  --append="rootwait console=tty0"
-- 
2.11.0.rc2.dirty


