Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83FD56F877
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:25:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2RIPNAo026224
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 11:25:23 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 11:25:22 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Mar 2014 14:25:03 -0400
Message-ID: <c55534a79ca8d5122aaf6362abb956bbb6102ea2.1395944068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395944068.git.bruce.ashfield@windriver.com>
References: <cover.1395944068.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 08/13] linux-yocto/3.10: fix drm build failure
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
X-List-Received-Date: Thu, 27 Mar 2014 18:25:25 -0000
Content-Type: text/plain

Andrea Adami reported the following build failure:

    .../drm/drm_mm.h:105:2: error: implicit declaration of function
    'BUG_ON' [-Werror=implicit-function-declaration]
    |   BUG_ON(!hole_node->hole_follows);
    |   ^
    |   CC      drivers/pci/setup-res.o
    |   CC      drivers/gpu/drm/i915/i915_drv.o
    | cc1: some warnings being treated as errors
    | make[6]: *** [drivers/gpu/drm/ttm/ttm_agp_backend.o] Error 1
    | make[5]: *** [drivers/gpu/drm/ttm] Error 2

Cherry picking mainline commit 86e81f0e6 [drm/mm: include required headers in drm_mm.h]
fixes the build problems.

cc: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 9b0c5d3e23ac..fe6773a5ece3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "f121a3aa028df37b8050779adaa239d29aaa2edd"
-SRCREV_machine_qemuppc ?= "7172d3cbc73584e724b61ef5d13fc3519720f4c0"
+SRCREV_machine ?= "f4351616572c6ad5a8b71b1becf02c3e779b85b8"
+SRCREV_machine_qemuppc ?= "a6dfc85e99633d739068a03d2551e39847628551"
 SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index baa82fd88664..123f3070d9f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.34"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
+SRCREV_machine ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
 SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 56fbd07c211f..49dd13db6877 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,13 +11,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e18e8c2c7cad913a25342f9f860eeeefce24b8aa"
-SRCREV_machine_qemumips ?= "6f191aaecfdbebda450cec4a1f30fb0d1a2ed889"
-SRCREV_machine_qemuppc ?= "ba2e16160c7f910de432511ca0008101a7b2263b"
-SRCREV_machine_qemux86 ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
-SRCREV_machine_qemux86-64 ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
-SRCREV_machine_qemumips64 ?= "e05f0378e9c21d689eed8aacb306d2c1a044e0d0"
-SRCREV_machine ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
+SRCREV_machine_qemuarm ?= "0e99eabbe5b3bec853ace496f94612bc37800260"
+SRCREV_machine_qemumips ?= "b6b20f49e9a169a0672b7cc2d7b93d6652ca7873"
+SRCREV_machine_qemuppc ?= "d71b782615b802c78e1586494b94dd40531775c8"
+SRCREV_machine_qemux86 ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
+SRCREV_machine_qemux86-64 ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
+SRCREV_machine_qemumips64 ?= "88abb1eb327f4e3c711d19a228cb153fdd9b3506"
+SRCREV_machine ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
 SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


