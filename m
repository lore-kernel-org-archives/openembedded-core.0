Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6859731C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 16:57:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6RGvFGN010394
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jul 2016 09:57:16 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jul 2016 09:57:15 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jul 2016 12:57:08 -0400
Message-ID: <20acc30a644a7ca14f1be77567507584e63eaabc.1469638333.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1469638333.git.bruce.ashfield@windriver.com>
References: <cover.1469638333.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/4.4: mousedev and printk configuation streamlining
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
X-List-Received-Date: Wed, 27 Jul 2016 16:57:15 -0000
Content-Type: text/plain

Integrating two changes to the 4.4 kernel:

mousedev: fix warning err caused by __cpu_to_le16p()

    mousedev: fix warning err caused by __cpu_to_le16p()

    following warning msg is found when compiling the kernel for qemumips:
    .../drivers/input/mousedev.c:749:15: warning: passing argument 1 of
    '__cpu_to_le16p' from incompatible pointer type [-Wincompatible-pointer-types]

    convert the function's parameter to (__u16 *) to fix this warning.

    Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>

printk.scc: don't include kernel-debug.scc

    There is no need to include kernel-debug.scc into printk.scc as
    options from printk.cfg don't depend on CONFIG_DEBUG* options from
    kernel-debug.cfg

    Moreover, enabling CONFIG_DEBUG* options makes kernel much bigger,
    increases build time and consumed a lot of additional disk space.

    Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index ec573083c111..447f431ac90c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "4789b41c5605189902d2c1a674f8616d41ee218d"
+SRCREV_meta ?= "d3cc76c3cb20247b16c16b2367decf08b5fb90fa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 635d91ca3ad7..557f17c9b4b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_meta ?= "4789b41c5605189902d2c1a674f8616d41ee218d"
+SRCREV_meta ?= "d3cc76c3cb20247b16c16b2367decf08b5fb90fa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 036a5b1550e3..55ef6fdc22af 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -13,13 +13,13 @@ KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
 SRCREV_machine_qemuarm ?= "c2507bd62854f90030433307a3d783474332f821"
 SRCREV_machine_qemuarm64 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_machine_qemumips ?= "8d0a4875a93017329b32b42ce7d67b02f63a173b"
+SRCREV_machine_qemumips ?= "e42198f28a2c3e57ef64a0f5ccfdeed906d1c257"
 SRCREV_machine_qemuppc ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
 SRCREV_machine_qemux86 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
 SRCREV_machine_qemux86-64 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_machine_qemumips64 ?= "df3ba701aa1fa3b2faadc5445003e7577aa4f016"
+SRCREV_machine_qemumips64 ?= "2d0080f2350e088bdc6129c376eb9e2654a0448a"
 SRCREV_machine ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_meta ?= "4789b41c5605189902d2c1a674f8616d41ee218d"
+SRCREV_meta ?= "d3cc76c3cb20247b16c16b2367decf08b5fb90fa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


