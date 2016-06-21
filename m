Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CDC373172
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:20:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5LFKWfa017011
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 21 Jun 2016 08:20:32 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 21 Jun 2016 08:20:31 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Jun 2016 11:20:26 -0400
Message-ID: <36b40af6cec5c03452984fb3ce8f4ec0f4de30ef.1466522266.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1466522266.git.bruce.ashfield@windriver.com>
References: <cover.1466522266.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/4.1: pstate backports
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
X-List-Received-Date: Tue, 21 Jun 2016 15:20:32 -0000
Content-Type: text/plain

Backporting the following pstate changes:

  fb0153332a1f intel_pstate: Add SKY-S support
  7eb5c7e382a8 intel_pstate: enable HWP per CPU
  d73ee41f9786 x86/mm: Decouple <linux/vmalloc.h> from <asm/io.h>
  f447e3d661f7 intel_pstate: Force setting target pstate when required
  7db69b864737 intel_pstate: change some inconsistent debug information
  367ff9c73d83 intel_pstate: Add tsc collection and keep previous target pstate

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index c3f98540f63c..420fd74570e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f0e560d7f32007af6285a71925d4176228730349"
+SRCREV_machine ?= "65ea19da3cd94bb44de4b1dd5419ecc385e4e27d"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index fbe88fb98163..9cb41ba78102 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.26"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
+SRCREV_machine ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 22feae66cbff..44e9d202ea56 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2c7cd362fe082b15edd99231eed992e0006fea60"
-SRCREV_machine_qemuarm64 ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
-SRCREV_machine_qemumips ?= "1805e843d9cefe16b1465acb836f17d10ed8471a"
-SRCREV_machine_qemuppc ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
-SRCREV_machine_qemux86 ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
-SRCREV_machine_qemux86-64 ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
-SRCREV_machine_qemumips64 ?= "e501ea70ace778a2e44568e18b6d2928cf4db05d"
-SRCREV_machine ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
+SRCREV_machine_qemuarm ?= "a38cb0352686c01aabf2c81d2dfc823208635af0"
+SRCREV_machine_qemuarm64 ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
+SRCREV_machine_qemumips ?= "482dc5fa137bb48f4198c81825499c2d505a226c"
+SRCREV_machine_qemuppc ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
+SRCREV_machine_qemux86 ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
+SRCREV_machine_qemux86-64 ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
+SRCREV_machine_qemumips64 ?= "f5489ee8c9420f67d91e95e19f57deda989bc829"
+SRCREV_machine ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


