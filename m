Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 01E8D733B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 09:07:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1C97hGE007562
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:07:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 01:07:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 01:07:38 -0800
Message-ID: <ac1236b9b575849bae2399e6010d0343708f4984.1423732000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423732000.git.liezhi.yang@windriver.com>
References: <cover.1423732000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] btrfs-tools: fix for parallel build
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
X-List-Received-Date: Thu, 12 Feb 2015 09:07:43 -0000
Content-Type: text/plain

Fixed:
mkfs.c:300:46: error: 'BTRFS_BUILD_VERSION' undeclared (first use in this function)
  fprintf(stderr, "mkfs.btrfs, part of %s\n", BTRFS_BUILD_VERSION);

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../btrfs-tools/btrfs-tools/fix-parallel.patch     |   32 ++++++++++++++++++++
 .../btrfs-tools/btrfs-tools_git.bb                 |    5 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch
new file mode 100644
index 0000000..65c31a4
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch
@@ -0,0 +1,32 @@
+From 373eb51328b5e10529763cad441210e6b0efb24e Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 11 Feb 2015 22:08:41 -0800
+Subject: [PATCH] Makefile: fix for parallel build
+
+Fixed:
+mkfs.c:300:46: error: 'BTRFS_BUILD_VERSION' undeclared (first use in this function)
+  fprintf(stderr, "mkfs.btrfs, part of %s\n", BTRFS_BUILD_VERSION);
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 9c69ada..30c6f06 100644
+--- a/Makefile
++++ b/Makefile
+@@ -118,7 +118,7 @@ else
+ 	AM_CFLAGS += -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
+ endif
+ 
+-%.o.d: %.c
++%.o.d: %.c version.h
+ 	$(Q)$(CC) -MM -MG -MF $@ -MT $(@:.o.d=.o) -MT $(@:.o.d=.static.o) -MT $@ $(AM_CFLAGS) $(CFLAGS) $<
+ 
+ .c.o:
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index ef85057..d800426 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -13,7 +13,10 @@ SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
 
 SRCREV = "44cdb62d3478c834f41c87ea79d261b9c8982dce"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
+           file://fix-parallel.patch \
+"
+
 S = "${WORKDIR}/git"
 
 PV = "3.14.2+git${SRCPV}"
-- 
1.7.9.5


