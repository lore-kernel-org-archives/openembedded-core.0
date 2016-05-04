Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E743170100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:53:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u44HrPSD012618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 4 May 2016 10:53:26 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 4 May 2016 10:53:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 May 2016 13:53:12 -0400
Message-ID: <b33258a242e429bd9331a54e50f73c7e14f9531b.1462383941.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1462383941.git.bruce.ashfield@windriver.com>
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] linux-yocto/4.4: broxton enablement and refactoring
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
X-List-Received-Date: Wed, 04 May 2016 17:53:27 -0000
Content-Type: text/plain

Merging the following commits to refactor and add broxton support:

 0d73a3bf6129 bsp/intel-corei7-64: Add intel-telemetry feature
 cee29e6234c7 features: add intel-telemetry feature
 3a700d737b65 bsp/intel-common: Add broxton to supported SoCs in intel-core* BSPs
 f584a0c22a39 features: add broxton soc feature
 7c2c2bd1a6aa baytrail;valleyisland: Use designware-usb3 feature instead of config
 7216db4cc7a6 features/usb: Add usb-designware2 and 3 features
 ade182658359 cfg/sound.cfg: Add USB audio support
 18ee21d9fba8 features/i915: Add CONFIG_KMS_FB_HELPER=y
 b3fa745962c2 features/soc/skylake: Refactor and comment config fragment

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 05397850e38e..89c6fff5a4b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "fcabc089b516e760d00a066893f9772d1535785c"
-SRCREV_meta ?= "082c2ea9f6bffa9b2bfa8f1e10b88046b8f064fd"
+SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 4c5aa63a2d7e..345e2d577889 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
-SRCREV_meta ?= "082c2ea9f6bffa9b2bfa8f1e10b88046b8f064fd"
+SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index de67e0187950..f02e0189f21f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
 SRCREV_machine_qemux86-64 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
 SRCREV_machine_qemumips64 ?= "6519e6317cc72e380bc1b7543e614ac0032a80ae"
 SRCREV_machine ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
-SRCREV_meta ?= "082c2ea9f6bffa9b2bfa8f1e10b88046b8f064fd"
+SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


