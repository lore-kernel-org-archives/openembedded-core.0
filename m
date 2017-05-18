Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F01D77EA9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 13:01:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4ID116A007964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 18 May 2017 06:01:01 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 18 May 2017 06:01:00 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 May 2017 09:01:00 -0400
Message-ID: <1495112460-1991-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] linux-yocto/4.1: fix gcc7 compilation and v4.1.39
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
X-List-Received-Date: Thu, 18 May 2017 13:01:01 -0000
Content-Type: text/plain

Porting the mainline commit, to fix gcc7 builds:

  474c90156c [give up on gcc ilog2() constant optimizations]

We also integrate the 4.1.39 -stable update to pick up additional
fixes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 21cc635bf4f8..d69b9ade2ce1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f793c71d51277bdb14d6854c8cbcc09b4f5936b4"
-SRCREV_meta ?= "7140ddb86e4b01529185e6d4a606001ad152b8f3"
+SRCREV_machine ?= "ec0bfadaeac24cc63fa05521c6608b79b26a5e5d"
+SRCREV_meta ?= "82aa97b3ebb3cd7eec8296a7cb090dfc67c2d382"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.38"
+LINUX_VERSION ?= "4.1.39"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index ce8aea628b2c..f7c969a1bece 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.38"
+LINUX_VERSION ?= "4.1.39"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2ce56d130ddff67f43ec857cc51cd347666a0078"
-SRCREV_meta ?= "7140ddb86e4b01529185e6d4a606001ad152b8f3"
+SRCREV_machine ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
+SRCREV_meta ?= "82aa97b3ebb3cd7eec8296a7cb090dfc67c2d382"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index bf7f266ee6f2..c6cdcab95030 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4d2c95e78cdc7d312b7ab231ce90dce317f45df9"
-SRCREV_machine_qemuarm64 ?= "2ce56d130ddff67f43ec857cc51cd347666a0078"
-SRCREV_machine_qemumips ?= "81454f95166056a253c8950980e025ee243d8074"
-SRCREV_machine_qemuppc ?= "42c41e606b70fd73a202f4146c0480f5624b0a0e"
-SRCREV_machine_qemux86 ?= "2ce56d130ddff67f43ec857cc51cd347666a0078"
-SRCREV_machine_qemux86-64 ?= "2ce56d130ddff67f43ec857cc51cd347666a0078"
-SRCREV_machine_qemumips64 ?= "8a481005da41f82d2a40bf8cb40334547160ab5b"
-SRCREV_machine ?= "2ce56d130ddff67f43ec857cc51cd347666a0078"
-SRCREV_meta ?= "7140ddb86e4b01529185e6d4a606001ad152b8f3"
+SRCREV_machine_qemuarm ?= "3b0fd24797cb11aae54010b1bbc09dd2ae8a108e"
+SRCREV_machine_qemuarm64 ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
+SRCREV_machine_qemumips ?= "7420516ff545f8ab3e2471cf08bf851744264a6a"
+SRCREV_machine_qemuppc ?= "6952f5a70bc8a84a4c4d926cdec93e7a39878f32"
+SRCREV_machine_qemux86 ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
+SRCREV_machine_qemux86-64 ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
+SRCREV_machine_qemumips64 ?= "59727538774860381f42bcfb6ec05fe21facd319"
+SRCREV_machine ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
+SRCREV_meta ?= "82aa97b3ebb3cd7eec8296a7cb090dfc67c2d382"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.38"
+LINUX_VERSION ?= "4.1.39"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


