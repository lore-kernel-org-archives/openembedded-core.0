Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6327BC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:21:29 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.8277.1646749287697300201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=J3sR0GVG;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749287; x=1678285287;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=W14lKXVyTLcZVv5IrbzxQu3CKkEG4HWK+YeUPWQBCC8=;
  b=J3sR0GVGZ0T6wiAaDWUKo1EnSfhjDpd7tJIxdKYg4zt/Gvhib38MT7Wz
   JyH/zoJleRVDeJ9XRmIYfltCRuwrT1i6LjKe/rReYXfodxpNs9RsGNkNE
   aWJg5QeAibqYIFyR7VQ0sVgfiJ1COyA+JwLwNOTnoF/3A32gkwhO4U0bI
   ZtMP4cBqvkQGVVZCd6nPzw4Dfw6L3utwe68xTXICPaLWwed8dLokBuzpm
   FhhojmIyPeYeK9Jqfmh+wqhZHTbdXpjNuIY7BRYiSISvd9nMiErVWQK59
   4nUNSQoCCke+ONAuQXx+F/TLLAAoT58e1sLnYb+kS/mAFjhB/+N0SYHPc
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="242130117"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="242130117"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:52 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="513119976"
Received: from sktoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.176])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:50 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/15] linux-yocto/5.10: ppc/riscv: fix build with
 binutils 2.3.8
Date: Tue,  8 Mar 2022 22:20:00 +0800
Message-Id: 
 <0ce1742dd22bfd62a446bffee58c2918ef7e4a1e.1646748870.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646748869.git.anuj.mittal@intel.com>
References: <cover.1646748869.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:21:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162916

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    1bd813fe8d0e riscv: fix build with binutils 2.38
    835a2d1b24c6 powerpc/lib/sstep: fix 'ptesync' build error

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8279495332f560902a9c264939da50b8302828b6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f142da66ab..a13f17d092 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "53a27dc510c8d9152ffa4d2d95b888db7d3d97b6"
+SRCREV_machine ?= "c8061a9f265a0d314e5b780a651662f462e4b287"
 SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8e33e703f7..e34f8e3cd9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "b7823b6ac25671f8dc5ee2c4cf74af3be88207cf"
-SRCREV_machine ?= "7558a33fc5b60d4327b683c3376c5352cba11ed1"
+SRCREV_machine_qemuarm ?= "5e7b4957ac1a94fdaaa719f6b62b80856e8a55e6"
+SRCREV_machine ?= "24a50caea8c65c2af4987c60067dc55ef737ebca"
 SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 9c6ba1cb5e..a71119c3f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c3a59bad41cefbe15d6bcde0ec2fe5c7ea28ba2b"
-SRCREV_machine_qemuarm64 ?= "07ca3e3c85445f2c31bd081b27741c9680536168"
-SRCREV_machine_qemumips ?= "10ae40d47f14b3c05dd6506c70576383c5474670"
-SRCREV_machine_qemuppc ?= "bc2a7c884103143e0a4360518247fe01bf2c13d3"
-SRCREV_machine_qemuriscv64 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
-SRCREV_machine_qemuriscv32 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
-SRCREV_machine_qemux86 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
-SRCREV_machine_qemux86-64 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
-SRCREV_machine_qemumips64 ?= "13998bd0244737548a21a17d1969ca65af0712b1"
-SRCREV_machine ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_machine_qemuarm ?= "7f5de9bc153963749c9a566828b59d4e63796432"
+SRCREV_machine_qemuarm64 ?= "c5bed4d604e64e8ce795a28576e341a2e790b4de"
+SRCREV_machine_qemumips ?= "0361229f491eec312e503cf7e58931571e53503f"
+SRCREV_machine_qemuppc ?= "2d7e10b0e0bab9b364e7612caf81b318f1d28b27"
+SRCREV_machine_qemuriscv64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
+SRCREV_machine_qemuriscv32 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
+SRCREV_machine_qemux86 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
+SRCREV_machine_qemux86-64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
+SRCREV_machine_qemumips64 ?= "931424f9c84cc440e8f154465062e71e2bdc2f03"
+SRCREV_machine ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
 SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.35.1


