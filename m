Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11921.1625242814841293130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043428"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043428"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:16 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776343"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:15 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/22] linux-yocto/5.10: cgroup1: fix leaked context root causing sporadic NULL deref in LTP
Date: Sat,  3 Jul 2021 00:19:45 +0800
Message-Id: <7d453c460572c86531bb6f84171a2ee9be002efb.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    ab49d2db98bd cgroup1: fix leaked context root causing sporadic NULL deref in LTP

PaulG tracked down the AB intermittent issues and generated a kernel
patch.

See: https://lore.kernel.org/lkml/20210616125157.438837-1-paul.gortmaker@windriver.com/

While we wait for it to loop through mainline, we'll integrate it into
our 5.10 branches.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a16dff746dd7ffd48ee8d1a17babef682168ead)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index d1ff473e3c..877e8d2946 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f458a6a097da0e7c535361dd30037499a48699f7"
-SRCREV_meta ?= "7fab6536c164fd743f17c52bc56a65867e30903a"
+SRCREV_machine ?= "6186341e981ad4fd3941c7c9af509923bbe2a2a5"
+SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 19aa7ab7d5..b44deb6f32 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e2c5237e9be3f4c69e86d7b990347454e2b8dff2"
-SRCREV_machine ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_meta ?= "7fab6536c164fd743f17c52bc56a65867e30903a"
+SRCREV_machine_qemuarm ?= "9c63dda7dd5834bf731747d6ae03ae13d48e20e3"
+SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 7205df2a61..f99782c1be 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "592f67240407a1f071d1b90e0af74df07deac519"
-SRCREV_machine_qemuarm64 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemumips ?= "0f474718e48ea5732875db2b71cf3f5dd3293e31"
-SRCREV_machine_qemuppc ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemuriscv64 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemuriscv32 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemux86 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemux86-64 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemumips64 ?= "a3c3c412a703def1f5c8f94f2c0fcc2cb908693a"
-SRCREV_machine ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_meta ?= "7fab6536c164fd743f17c52bc56a65867e30903a"
+SRCREV_machine_qemuarm ?= "2fc3409cf8c2a6d684929576fd409949060a0bd9"
+SRCREV_machine_qemuarm64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemumips ?= "5cec6d1ab35feb99f023b233871cafa29e3c3682"
+SRCREV_machine_qemuppc ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemuriscv64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemuriscv32 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemux86 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemux86-64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemumips64 ?= "769a7118662a2256e20df60be9c9727f9c5878b0"
+SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.31.1

