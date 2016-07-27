Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 496D77016E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 16:57:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6RGvDKA010949
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jul 2016 09:57:13 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jul 2016 09:57:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jul 2016 12:57:06 -0400
Message-ID: <59036a39f7251dd496054e44cfafceda69e0171e.1469638333.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1469638333.git.bruce.ashfield@windriver.com>
References: <cover.1469638333.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/4.1: bug fixes and configuration changes
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
X-List-Received-Date: Wed, 27 Jul 2016 16:57:13 -0000
Content-Type: text/plain

Integrating the following two commits:

  44af90071620 4.1.28 Fix bad backport of 8f182270dfec "mm/swap.c: flush lru pvecs on compound page arrival"
  99c37e1500a6 i2c: ismt: Add Intel DNV PCI ID

And the following two meta-data changes:

  afbc6bd00e6f bsp/axxiaarm64: Enable Axxia NCR and PEI drivers
  6a2047c00450 common-pc: enforce 32 bit

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 3be43fe238ea..49157902ab59 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cb1593933f5defcebb668a1ca655a24394b9c27e"
-SRCREV_meta ?= "98729aff41208eed09dc232254d7a1305237fdbe"
+SRCREV_machine ?= "0b68498784da5defb7658675e37d9bc615cd4c50"
+SRCREV_meta ?= "afbc6bd00e6fa854ae10eb67ab8c3be5112f6f41"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 41a0bb089a61..9187f8542975 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.28"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
-SRCREV_meta ?= "98729aff41208eed09dc232254d7a1305237fdbe"
+SRCREV_machine ?= "44af900716206d4cae283aa74e92f4118720724a"
+SRCREV_meta ?= "afbc6bd00e6fa854ae10eb67ab8c3be5112f6f41"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 248faf892e9c..fb10f40811a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "aa956be29cf5247a0870728b177ae056bc9f62be"
-SRCREV_machine_qemuarm64 ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
-SRCREV_machine_qemumips ?= "931c8308f3327ea0a882349321989be6db3b22a9"
-SRCREV_machine_qemuppc ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
-SRCREV_machine_qemux86 ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
-SRCREV_machine_qemux86-64 ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
-SRCREV_machine_qemumips64 ?= "33eebd8a461ae8c619ece37a1de02e48893e0b12"
-SRCREV_machine ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
-SRCREV_meta ?= "98729aff41208eed09dc232254d7a1305237fdbe"
+SRCREV_machine_qemuarm ?= "460340f28dd4ed608fd66692bcbac0bb24fe4aaf"
+SRCREV_machine_qemuarm64 ?= "44af900716206d4cae283aa74e92f4118720724a"
+SRCREV_machine_qemumips ?= "9b9337aa156bd3bcf3e813455e4bbdc2895c4da1"
+SRCREV_machine_qemuppc ?= "44af900716206d4cae283aa74e92f4118720724a"
+SRCREV_machine_qemux86 ?= "44af900716206d4cae283aa74e92f4118720724a"
+SRCREV_machine_qemux86-64 ?= "44af900716206d4cae283aa74e92f4118720724a"
+SRCREV_machine_qemumips64 ?= "cb03bb92ed4d45c55e7a8ecfcca714f9897da96b"
+SRCREV_machine ?= "44af900716206d4cae283aa74e92f4118720724a"
+SRCREV_meta ?= "afbc6bd00e6fa854ae10eb67ab8c3be5112f6f41"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.5.0


