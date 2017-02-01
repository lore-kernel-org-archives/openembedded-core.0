Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14EB47735A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:30:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v11FUlIa026968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Feb 2017 07:30:48 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 1 Feb 2017 07:30:47 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Feb 2017 10:30:36 -0500
Message-ID: <58245344b178052e11a0e8b97100e154b1f4d83c.1485962567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1485962567.git.bruce.ashfield@windriver.com>
References: <cover.1485962567.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] linux-yocto/4.9: yaffs2 fixes
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
X-List-Received-Date: Wed, 01 Feb 2017 15:30:48 -0000
Content-Type: text/plain

Merging three fixes to yaffs2, which adjust to mainline changes in the
vfs subsystem:

  4700f2f8b9db fs: yaffs2: fix the prototype of function yaffs_rename()
  56e654cab1db fs: yaffs2: switch to the generic xattr handler
  102082f3c245 fs/yaffs2: adjust to the change of inode_change_ok()

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index b2986e32afd8..8eaec528d62b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "35cfaa68bf6ceaf59cf2bcd020d4e66155e19c46"
-SRCREV_meta ?= "3715fc90f7b69de59ca0870f6c7cda27cdc0f895"
+SRCREV_machine ?= "71569cd064e02564211737430c31a4b0e9c810fb"
+SRCREV_meta ?= "6fd9dcbb3f0becf90c555a1740d21d18c331af99"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index a9d17549d6dd..5510b0f8ff3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.9.6"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
-SRCREV_meta ?= "3715fc90f7b69de59ca0870f6c7cda27cdc0f895"
+SRCREV_machine ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
+SRCREV_meta ?= "6fd9dcbb3f0becf90c555a1740d21d18c331af99"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index e5f6064fc939..a7593848f61c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9dc59f0efe6cd1dd806b5b6089faf803db9018a4"
-SRCREV_machine_qemuarm64 ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
-SRCREV_machine_qemumips ?= "0ed887a8c24e2c2a8a2f136b9ef5031bdf6cde8c"
-SRCREV_machine_qemuppc ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
-SRCREV_machine_qemux86 ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
-SRCREV_machine_qemux86-64 ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
-SRCREV_machine_qemumips64 ?= "06fff8284bbec52a36fb3d054354db2f593376ac"
-SRCREV_machine ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
-SRCREV_meta ?= "3715fc90f7b69de59ca0870f6c7cda27cdc0f895"
+SRCREV_machine_qemuarm ?= "103383d270939399bc73365c31cd6f93c567114f"
+SRCREV_machine_qemuarm64 ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
+SRCREV_machine_qemumips ?= "c8425cad333ec85f61d63054051fe17df53ece29"
+SRCREV_machine_qemuppc ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
+SRCREV_machine_qemux86 ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
+SRCREV_machine_qemux86-64 ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
+SRCREV_machine_qemumips64 ?= "42fe7d605fc92985c8ba10363de487ea06bd068a"
+SRCREV_machine ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
+SRCREV_meta ?= "6fd9dcbb3f0becf90c555a1740d21d18c331af99"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


