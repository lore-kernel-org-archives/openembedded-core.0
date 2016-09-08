Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCFD7721A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 01:08:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8818v3a005763
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Sep 2016 18:08:57 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 18:08:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 7 Sep 2016 21:08:49 -0400
Message-ID: <430cc6333ba435d2afbc7bc7881771da35fc2d57.1473296553.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1473296553.git.bruce.ashfield@windriver.com>
References: <cover.1473296553.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/4.4/4.8: uvesafb: provide option to specify timeout for task completion
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
X-List-Received-Date: Thu, 08 Sep 2016 01:08:58 -0000
Content-Type: text/plain

Integrating the following patch:

[
   We try to make this change a generic extension, but it is
   actually for a corner case. When a VM (qemu) gets a very limited
   cpu bandwidth from host, which could be under a heavy load, the
   existing 5000 ms timeout could occur and trigger error messages
   in the task function's callers.

   This change adds a new timeout parameter so that we can tweak
   the value as a workaround or for troubleshooting purposes. In
   the infinite wait case, A warning message is printed at 5000ms
   interval.

   In real world, the current 5 sec is generous enough for a video
   request in my opinion, so this change could not be very useful.

   Upstream Status: Inappropriate

   Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index fc0e2a431e0a..e7057005d115 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9135adcfb01432abe4a95a50fca5d0395239f798"
-SRCREV_meta ?= "698835841165b68089604398f68fd8bc3f79cb65"
+SRCREV_machine ?= "a52822c864c50cc5e42939d217a8559fbf853fde"
+SRCREV_meta ?= "59290c5f6192da2eccf478d37a8f9f88134822b3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 1334a8606e34..e73754519c6a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
-SRCREV_meta ?= "698835841165b68089604398f68fd8bc3f79cb65"
+SRCREV_machine ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
+SRCREV_meta ?= "59290c5f6192da2eccf478d37a8f9f88134822b3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 8661452c74fa..6e5a7c7920ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "81cae0bb962c278b7fd616ce94b0a1ea21b9a938"
-SRCREV_machine_qemuarm64 ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
-SRCREV_machine_qemumips ?= "92bae966ed0bdf4bd8c8343978f83b80b8fa9981"
-SRCREV_machine_qemuppc ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
-SRCREV_machine_qemux86 ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
-SRCREV_machine_qemux86-64 ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
-SRCREV_machine_qemumips64 ?= "aa125473aef74e7731b14f6b56c1b50589fcd668"
-SRCREV_machine ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
-SRCREV_meta ?= "698835841165b68089604398f68fd8bc3f79cb65"
+SRCREV_machine_qemuarm ?= "2505d9c2441eb638d55b330144988d1730065074"
+SRCREV_machine_qemuarm64 ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
+SRCREV_machine_qemumips ?= "544caf9c03c40c2de6b93db9a767e568e0baaa8f"
+SRCREV_machine_qemuppc ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
+SRCREV_machine_qemux86 ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
+SRCREV_machine_qemux86-64 ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
+SRCREV_machine_qemumips64 ?= "c1b45251a5fabfb0f2aba3a0168d8a952a2cd827"
+SRCREV_machine ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
+SRCREV_meta ?= "59290c5f6192da2eccf478d37a8f9f88134822b3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


