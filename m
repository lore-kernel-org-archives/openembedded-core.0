Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 512E37864F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 15:39:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB4FdUJo026455
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Dec 2017 07:39:31 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Dec 2017 07:39:30 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 4 Dec 2017 10:39:20 -0500
Message-ID: <0a99c9cbd4bbd3db4c50df49b4388134e42550e1.1512401707.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1512401707.git.bruce.ashfield@windriver.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto/4.12: iwlwifi calltrace fixes and configuration warning cleanups
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
X-List-Received-Date: Mon, 04 Dec 2017 15:39:31 -0000
Content-Type: text/plain

Merging the following upstream backports to fix a iwlwifi calltrace:

  0b17e1b52f99 iwlwifi: mvm: support new flush API
  89025056c0d1 iwlwifi: mvm: avoid variable shadowing
  d6dc077966e7 iwlwifi: mvm: add and use iwl_mvm_device_running()
  5dfb593df8f0 iwlwifi: add wait for tx queue empty
  0e8726bf748a iwlwifi: mvm: wait for the flushed queue only
  8e2d37ae55a7 iwlwifi: mvm: flush per station for DQA mode

Also merging the following configuration changes to cleanup kernel audit
warnings:

  9f1f122a7d87 features/dca/dca.cfg: fix CONFIG_IXGBE_DCA can not enble if build ixgbe in kernel
  d355f082c54d features/iommu/iommu.cfg: remove CONFIG_INTEL_IOMMU_DEFAULT_ON=n
  9399ae045c72 features/tpm/tpm.cfg: set CONFIG_HW_RANDOM_TPM as module

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 983c1cc758d6..abd25a87f85b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2143b758ad622a73c7c0b3fc8890b81000187635"
-SRCREV_meta ?= "cebe198870d781829bd997a188cc34d9f7a61023"
+SRCREV_machine ?= "55000a68d7b8ba26ce1733d48f9efa384528e67c"
+SRCREV_meta ?= "b9735e238841b9932bb324e8b4d9fb536d812ed1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 658ecc0d6ddf..68d5a8ad85a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.14"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
-SRCREV_meta ?= "cebe198870d781829bd997a188cc34d9f7a61023"
+SRCREV_machine ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
+SRCREV_meta ?= "b9735e238841b9932bb324e8b4d9fb536d812ed1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index a7dd7635131f..a45d90bfaf2c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "03489013c6844bf3f911e51c5b8cd3bd5c1dc6e9"
-SRCREV_machine_qemuarm64 ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
-SRCREV_machine_qemumips ?= "c22264e2e3340eb8affa9a9fc0b86decb2be26c6"
-SRCREV_machine_qemuppc ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
-SRCREV_machine_qemux86 ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
-SRCREV_machine_qemux86-64 ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
-SRCREV_machine_qemumips64 ?= "ead3f1c16e85d1b1074acdd13084b5cdf1104e23"
-SRCREV_machine ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
-SRCREV_meta ?= "cebe198870d781829bd997a188cc34d9f7a61023"
+SRCREV_machine_qemuarm ?= "b6b85e6055b8af3ef9a8e74f4edb5c0a69bd031b"
+SRCREV_machine_qemuarm64 ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
+SRCREV_machine_qemumips ?= "788655446537fbf4a7c7cb720b4ea3dfa0ca9d20"
+SRCREV_machine_qemuppc ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
+SRCREV_machine_qemux86 ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
+SRCREV_machine_qemux86-64 ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
+SRCREV_machine_qemumips64 ?= "d3f5808a2f7787e02057df9fea1fa97fb939fd6c"
+SRCREV_machine ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
+SRCREV_meta ?= "b9735e238841b9932bb324e8b4d9fb536d812ed1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


