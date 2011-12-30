Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RgYKe-0007zy-QX
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 10:00:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2011 00:53:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="92836559"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga002.jf.intel.com with ESMTP; 30 Dec 2011 00:53:39 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 16:53:35 +0800
Message-Id: <45a638168b7b1e71158eae1ff9740bf779ecd72b.1325234092.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1325234092.git.dexuan.cui@intel.com>
References: <cover.1325234092.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1325234092.git.dexuan.cui@intel.com>
References: <cover.1325234092.git.dexuan.cui@intel.com>
Subject: [PATCH 1/6] mdadm: upgrade to the latest version 3.2.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Dec 2011 09:00:57 -0000

deleted 1 patch since it's in new version now.

made LICENSE field more accurate.
updated chksum of COPYING: only working change; no actual license change.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../0001-mdadm-fix-build-failures-ppc64.patch      |   52 --------------------
 .../mdadm/{mdadm_3.2.2.bb => mdadm_3.2.3.bb}       |   13 ++---
 2 files changed, 6 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.2.2.bb => mdadm_3.2.3.bb} (65%)

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
deleted file mode 100644
index f573bbc..0000000
--- a/meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Upstream-Status: Pending
-
-From 19986c721c9ac4b353c8592998d70d0dc8860bfd Mon Sep 17 00:00:00 2001
-From: Milan Broz <mbroz@redhat.com>
-Date: Thu, 14 Jul 2011 13:58:36 +1000
-Subject: [PATCH] mdadm: fix build failures (ppc64)
-
-This patch fixes these build issues:
-
-super-intel.c: In function 'getinfo_super_imsm_volume':
-super-intel.c:2327:4: error: format '%llu' expects argument of type 'long long
-unsigned int', but argument 3 has type '__u64' [-Werror=format]
-
-super-intel.c: In function 'imsm_reshape_super':
-super-intel.c:8665:7: error: 'devnum' may be used uninitialized in this function [-Werror=uninitialized]
-
-Signed-off-by: Milan Broz <mbroz@redhat.com>
-Signed-off-by: NeilBrown <neilb@suse.de>
----
- super-intel.c |    9 ++++++---
- 1 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/super-intel.c b/super-intel.c
-index 5ea3b36..70cf993 100644
---- a/super-intel.c
-+++ b/super-intel.c
-@@ -2326,7 +2326,9 @@ static void getinfo_super_imsm_volume(struct supertype *st, struct mdinfo *info,
- 
- 			dprintf("IMSM: General Migration checkpoint : %llu "
- 			       "(%llu) -> read reshape progress : %llu\n",
--				units, blocks_per_unit, info->reshape_progress);
-+				(unsigned long long)units,
-+				(unsigned long long)blocks_per_unit,
-+				info->reshape_progress);
- 
- 			used_disks = imsm_num_data_members(dev, 1);
- 			if (used_disks > 0) {
-@@ -8661,8 +8663,9 @@ static int imsm_reshape_super(struct supertype *st, long long size, int level,
- 		dprintf("imsm: info: Volume operation\n");
- 		/* find requested device */
- 		while (dev) {
--			imsm_find_array_minor_by_subdev(dev->index, st->container_dev, &devnum);
--			if (devnum == geo.dev_id)
-+			if (imsm_find_array_minor_by_subdev(
-+				    dev->index, st->container_dev, &devnum) == 0
-+			    && devnum == geo.dev_id)
- 				break;
- 			dev = dev->next;
- 		}
--- 
-1.7.6.1
-
diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb b/meta/recipes-extended/mdadm/mdadm_3.2.3.bb
similarity index 65%
rename from meta/recipes-extended/mdadm/mdadm_3.2.2.bb
rename to meta/recipes-extended/mdadm/mdadm_3.2.3.bb
index 02109e3..17cdd41 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.3.bb
@@ -2,21 +2,20 @@ DESCRIPTION = " A tool for managing Soft RAID under Linux"
 HOMEPAGE = "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
 BUGTRACKER = "n/a"
 
-#A few files are GPLv2+ while most files are GPLv2.
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+# Some files are GPLv2+ while others are GPLv2.
+LICENSE = "GPLv2 & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
-	    file://0001-mdadm-fix-build-failures-ppc64.patch \
 	    file://mdadm-3.2.2_fix_for_x32.patch \
 	  "
 
-SRC_URI[md5sum] = "12ee2fbf3beddb60601fb7a4c4905651"
-SRC_URI[sha256sum] = "0d1a04e688b082bc88846e3f524abd50bc782b6ffc06123140f7d358c8f9b906"
+SRC_URI[md5sum] = "d789d6ecb9c1d5ebcc64f0fc52bca92f"
+SRC_URI[sha256sum] = "0ff49a04c6250834ce1b5be5a1581532e70e2221a87e1eedec46d6656b37ab40"
 
 CFLAGS += "-fno-strict-aliasing"
 
-- 
1.7.6



