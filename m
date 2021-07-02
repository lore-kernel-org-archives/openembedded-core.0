Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11921.1625242814841293130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043494"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043494"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:30 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776444"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:28 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/22] linux-yocto/5.10: rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock
Date: Sat,  3 Jul 2021 00:19:55 +0800
Message-Id: <9fc93ac6fdc3b12eed7fe4cc96ccbef3d5bb31b7.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    139fe7d68413 rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63b4761cb1f44aaad4bd0948dc586a90b53049d3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb               |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb  | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ea2c854649..f511f233b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "74f60bcd7323d243e0f3d3db34021ae624afb61a"
+SRCREV_machine ?= "4a59bc57b2be77da9394b10eb37067da7d63b7a4"
 SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d73b1d0305..f5ade2992c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "20eb193a68fbdaa56ed9a49b97aef6a0eb9fbdea"
-SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemuarm ?= "dd1f9602f3e4e9dc177421ba12ce073ad2099a58"
+SRCREV_machine ?= "139fe7d68413054f850e206ab749f97a968867a8"
 SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index c3342da193..dd4aef7f89 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "efa48180fd02b074a2c9e18958fc9b7e4c9f1c00"
+SRCREV_machine_qemuarm ?= "17e89ca08f67fdcbaf0a3ae4c429602f76463923"
 SRCREV_machine_qemuarm64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
-SRCREV_machine_qemumips ?= "aa324c158a84601d99949b7cfa5c376b9691cddc"
-SRCREV_machine_qemuppc ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemuriscv64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemuriscv32 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemux86 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemux86-64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_machine_qemumips64 ?= "7bc9a08bf3b92db4fdb0225fdd23836c8f5c037f"
-SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemumips ?= "bdcaaee7b7ce0e865670a2cee55b1974eb67357b"
+SRCREV_machine_qemuppc ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemuriscv64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemuriscv32 ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemux86 ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemux86-64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemumips64 ?= "2f11a726a60ad9e8a48de6bc2101a993b461e8d1"
+SRCREV_machine ?= "139fe7d68413054f850e206ab749f97a968867a8"
 SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.31.1

