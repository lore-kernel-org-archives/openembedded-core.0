Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF6C476294
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 01:26:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA91QOaK014911
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Nov 2015 17:26:24 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 8 Nov 2015 17:26:23 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 8 Nov 2015 20:26:20 -0500
Message-ID: <62e12719721f7f368e7f109ae1a90cee089ca866.1447031701.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447031701.git.wenzong.fan@windriver.com>
References: <cover.1447031701.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] mdadm: fix CFLAGS and ptest issues
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
X-List-Received-Date: Mon, 09 Nov 2015 01:26:27 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* Pass global CFLAGS to build:

The CFLAGS does not pass to build at all since it was redefined by
mdadm Makefile:

  CFLAGS = $(CWFLAGS) $(CXFLAGS) ...

This could be done by setting 'CXFLAGS="${CFLAGS}"'.

* Also fix ptest build errors caused by global CFLAGS:

  raid6check.c:352:2: error: ignoring return value of posix_memalign, \
  declared with attribute warn_unused_result [-Werror=unused-result]

  raid6check.c:315:8: error: 'stripe_buf' may be used uninitialized \
  in this function [-Werror=maybe-uninitialized]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../mdadm/files/mdadm-fix-ptest-build-errors.patch | 50 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch

diff --git a/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch b/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
new file mode 100644
index 0000000..f7c5514
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
@@ -0,0 +1,50 @@
+From f3acf8499a4cc400206c5c56f0a6c69192ed55de Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Sat, 7 Nov 2015 04:21:17 -0500
+Subject: [PATCH] mdadm: fix ptest build errors
+
+Check return value for posix_memalign() to fix ptest build error:
+
+  raid6check.c:352:2: error: ignoring return value of posix_memalign, \
+  declared with attribute warn_unused_result [-Werror=unused-result]
+
+Initialize *stripe_buf as NULL to fix ptest build error:
+
+  raid6check.c: In function 'check_stripes':
+  raid6check.c:315:8: error: 'stripe_buf' may be used uninitialized \
+  in this function [-Werror=maybe-uninitialized]
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ raid6check.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/raid6check.c b/raid6check.c
+index cb8522e..9462bcf 100644
+--- a/raid6check.c
++++ b/raid6check.c
+@@ -312,7 +312,7 @@ int check_stripes(struct mdinfo *info, int *source, unsigned long long *offsets,
+ 	/* read the data and p and q blocks, and check we got them right */
+ 	int data_disks = raid_disks - 2;
+ 	int syndrome_disks = data_disks + is_ddf(layout) * 2;
+-	char *stripe_buf;
++	char *stripe_buf = NULL;
+ 
+ 	/* stripes[] is indexed by raid_disk and holds chunks from each device */
+ 	char **stripes = xmalloc(raid_disks * sizeof(char*));
+@@ -349,7 +349,9 @@ int check_stripes(struct mdinfo *info, int *source, unsigned long long *offsets,
+ 	if (!tables_ready)
+ 		make_tables();
+ 
+-	posix_memalign((void**)&stripe_buf, 4096, raid_disks * chunk_size);
++	if (posix_memalign((void**)&stripe_buf, 4096, raid_disks * chunk_size) != 0)
++		goto exitCheck;
++
+ 	block_index_for_slot += 2;
+ 	blocks += 2;
+ 	blocks_page += 2;
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
index 1198167..0993611 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://gcc-4.9.patch \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
            file://0001-Fix-typo-in-comparision.patch \
+           file://mdadm-fix-ptest-build-errors.patch \
            file://run-ptest \
 	  "
 SRC_URI[md5sum] = "7ca8b114710f98f53f20c5787b674a09"
@@ -22,7 +23,7 @@ CFLAGS += "-fno-strict-aliasing"
 
 inherit autotools-brokensep
 
-EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
+EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
 # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
 # prevents 64-bit userland from seeing this definition, instead defaulting
 # to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
-- 
1.9.1


