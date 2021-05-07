Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gW7LZPSnuZdXl2rVxcbdPvdWHd/1WCyslvGaNFL79n4qGCWGObRA3V0+30csGdzo4Omy3sBlEb
 z6+BwjeTmSsQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794733"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794733"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:05 -0700
IronPort-SDR: c3fmP4J7zaXXrJJPmmeRfsw6dnRFwl/p815Fbu+oVb/JmIEWIwhWymuNXlmKrL89fAQ42tTJBp
 uCe7gWghdt9Q==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331583"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:04 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/31] linux-yocto/5.10: aufs fixes
Date: Fri,  7 May 2021 15:02:23 +0800
Message-Id: <98ae1dd5c60a8f6ca30e80726c81f9fa0fc5d4cb.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It was reported that aufs was behaving incorrectly on arm/x86. Although
we don't have an exact fix for the issues, the Wind River guys were able
to come up with a minimal patch set to fix just the core issue, versus
a full aufs uprev.

We didn't have time to get this in before the release, but picking it up
in a dot release is sufficient. (given that it took several months for
the issue to be noticed).

Integrating the following commit(s) to linux-yocto/5.10:

    a8808e541750 aufs: linux-v5.10-rc1, no more f_op->read() and ->write()
    cb1c41dac775 for aufs: linux-v5.10-rc1, no more vfs_(read|write)f_t
    a5805df6583f aufs: linux-v5.10-rc1, no more set_fs()
    64e145dcca8c Revert "aufs: initial port to v5.10"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c290adec4e27f5d7987193e9a0749082f3ed3e20)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index dacff74bce..c491eed163 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ac98a75ef2bc550f67454bd738ede581c8846ff3"
-SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
+SRCREV_machine ?= "196677064883beeaacb68de437512a0e4ee07050"
+SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 21a2e89115..0e3771461b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ee7efde0c94e8b2eba1a5a2709f2d21874ac7525"
-SRCREV_machine ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
+SRCREV_machine_qemuarm ?= "bcb76d132fb1e90f6db0a598b3c46b180a9b71ea"
+SRCREV_machine ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e6859a2319..2221e99f3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4f13e8499f2bfc9d95dcc70b981ea16351ff088b"
-SRCREV_machine_qemuarm64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemumips ?= "64f8949180b1a6375abef20eebf735e853701c71"
-SRCREV_machine_qemuppc ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemuriscv64 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
-SRCREV_machine_qemuriscv32 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
-SRCREV_machine_qemux86 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
-SRCREV_machine_qemux86-64 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
-SRCREV_machine_qemumips64 ?= "6bf49ed9b223173d918b7c0140b8d0561bc2674c"
-SRCREV_machine ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
-SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
+SRCREV_machine_qemuarm ?= "68066f8eb689b650bc95dd5abbba2336e11ca896"
+SRCREV_machine_qemuarm64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemumips ?= "e609eb0cc21b9037f0adf73dfb524d4e44d0f51c"
+SRCREV_machine_qemuppc ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemuriscv64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemuriscv32 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemux86 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemux86-64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemumips64 ?= "f89a64b85a068ac96ccd69f5170b2fbe957d4162"
+SRCREV_machine ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.30.2

