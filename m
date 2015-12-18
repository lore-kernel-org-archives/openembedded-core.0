Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE746FF77
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:44:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBIKids5026049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Dec 2015 12:44:39 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 18 Dec 2015 12:44:39 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 18 Dec 2015 15:44:32 -0500
Message-ID: <1eae81ffa224e969164974aabe8f5a09b03e5cb1.1450471022.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1450471022.git.bruce.ashfield@windriver.com>
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] yaffs2: fix checkpoint functionality
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
X-List-Received-Date: Fri, 18 Dec 2015 20:44:40 -0000
Content-Type: text/plain

Updating the linux-yocto SRCREVs to pull in the following change:

  Author: He Zhe <zhe.he@windriver.com>
  Date:   Wed Dec 2 01:31:31 2015 -0500

    fs/yaffs2: fix missing checkpoint on yaffs

    For yaffs file system, the mode of reading or writing is restricted
    at four pointer where are mnt->mnt_flags,mnt->mnt_sb->s_flags,mtd->flags and
    dev->read_only,the first three is used handle file and file
    system(eg,remount) operation, and last one(dev->read_only) almost is
    used handle checkpoint of yaffs2. However, in current code, the
    dev->read_only only can be changed at first time when the yaffs2
    file system is mounted, later it can't be changed again(eg,mount -o
    remount), the result is that the checkpoint's saving operation
    always can't succeed if you set readonly mode for yaffs2 file system
    when it is mounted at the first time.

    To fix this issue, we implement yaffs_remount_fs() which allows the
    rootfs to be remounted as r/w.

    Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
    Signed-off-by: He Zhe <zhe.he@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 6bb38f8c059b..1eb032bfe6ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "190c42da30140d227cc948ed5fa8fee8467d55f3"
-SRCREV_meta ?= "30c4b4bd79c5d774de6dcf23d0deab554e31f3d4"
+SRCREV_machine ?= "ed3fa3e6d62c1fb3411099478c69cef4e3d4f415"
+SRCREV_meta ?= "46bb64d605fd336d99fa05bab566b9553b40b4b4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index cd4f2acff69a..66c8a6575e5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.13"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
-SRCREV_meta ?= "30c4b4bd79c5d774de6dcf23d0deab554e31f3d4"
+SRCREV_machine ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
+SRCREV_meta ?= "46bb64d605fd336d99fa05bab566b9553b40b4b4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 776620261f60..12245295a3f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2494184ad34764bdfa1bfd9a57eabfb34d170c0e"
-SRCREV_machine_qemuarm64 ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
-SRCREV_machine_qemumips ?= "85a76c24f5aaa99618fdb15d5f3966a2e03cd572"
-SRCREV_machine_qemuppc ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
-SRCREV_machine_qemux86 ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
-SRCREV_machine_qemux86-64 ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
-SRCREV_machine_qemumips64 ?= "79181dc5284d9831d240d7ba58a2b574f6528b90"
-SRCREV_machine ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
-SRCREV_meta ?= "30c4b4bd79c5d774de6dcf23d0deab554e31f3d4"
+SRCREV_machine_qemuarm ?= "c19d15710a9e0a01a83a1ac03356390bc26a01f7"
+SRCREV_machine_qemuarm64 ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
+SRCREV_machine_qemumips ?= "ca7ddd2ce6e7c3fb599512bcc31a1de23ecb589d"
+SRCREV_machine_qemuppc ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
+SRCREV_machine_qemux86 ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
+SRCREV_machine_qemux86-64 ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
+SRCREV_machine_qemumips64 ?= "5945b7d7abce3ede46ae133a24420751d99ea55b"
+SRCREV_machine ?= "4e659b86ffcf20ece27f42a671853d5f42d52a6c"
+SRCREV_meta ?= "46bb64d605fd336d99fa05bab566b9553b40b4b4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.1.0


