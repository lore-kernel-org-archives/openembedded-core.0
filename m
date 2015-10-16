Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED4BF77120
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 05:57:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G5vkA2000049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 22:57:46 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 15 Oct 2015 22:57:45 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Oct 2015 01:57:43 -0400
Message-ID: <6de991e55463cce5bac0bcc3d9af46cbd044b062.1444974811.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1444974811.git.wenzong.fan@windriver.com>
References: <cover.1444974811.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] mdadm: fix CFLAGS and ptest issue
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
X-List-Received-Date: Fri, 16 Oct 2015 05:57:47 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* Pass global CFLAGS to build:

The CFLAGS does not pass to build at all since it was redefined by
mdadm Makefile:

  CFLAGS = $(CWFLAGS) $(CXFLAGS) ...

This could be done by setting 'CXFLAGS="${CFLAGS}"'.

* Also fix ptest build error caused by global CFLAGS:

  raid6check.c: In function 'check_stripes':
  raid6check.c:315:8: error: 'stripe_buf' may be used uninitialized \
  in this function [-Werror=maybe-uninitialized]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../mdadm/files/mdadm-fix-ptest-build-error.patch  | 34 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-error.patch

diff --git a/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-error.patch b/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-error.patch
new file mode 100644
index 0000000..b2495c0
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-error.patch
@@ -0,0 +1,34 @@
+From d062030a36faa77193ac66b498a1ec704013dbb1 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Thu, 10 Sep 2015 03:52:20 -0400
+Subject: [PATCH] mdadm: fix ptest build error
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
+ raid6check.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/raid6check.c b/raid6check.c
+index cb8522e..e4a9ff0 100644
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
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
index 1198167..ed56b11 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://gcc-4.9.patch \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
            file://0001-Fix-typo-in-comparision.patch \
+           file://mdadm-fix-ptest-build-error.patch \
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


