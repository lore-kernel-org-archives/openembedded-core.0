Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1EFC433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:38 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IxT2FHSZ;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118397; x=1674654397;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vij3WhfwMaXQQlzJ5Ffz1jH/po512SXNtsnI9OiQeW0=;
  b=IxT2FHSZrxW9BNAna7gOuUJHoPDd1LbxxwfGCax22F75Ks1Bqi5HJLeU
   WebSnyxJ9Ly3B3/DDgBt6xks1ZgL/1FyhswukELzAx1beAeEmFw1yyqHz
   pmakU2ZTzjRXGEE+GPsyr99oDUM8tCk+arocNWqlcCFV2oea69GiO4pG5
   upQjsAA+8iZxZtr98V5TnN4n7x/DPnpjTPzG3eED1DVrPHoNaIDlteG2I
   dYTII5b4YquWsWoimGhN4NEwuvwkIiajzTMShMHkbA01QMkF2tED075wQ
   n1v3grzMRNjRl4ht371C6tZ5tSDKbry3+m45e+RQ5I1eFAKUwo770cjHa
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016457"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016457"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494320"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/13] linux-yocto/5.10: amdgpu: updates for
 CVE-2021-42327
Date: Tue, 25 Jan 2022 21:45:57 +0800
Message-Id: 
 <8e8c21e25c831f2279a2dbdc0bcc90cd7661d174.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643113252.git.anuj.mittal@intel.com>
References: <cover.1643113252.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160924

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    fd84b99a8ccb drm/amd/display: Don't allow partial copy_from_user
    024f4ff63d55 drm/amdgpu: Fix even more out of bound writes from debugfs

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5488466ea1b332a0bfc0d27dcc5378edd842d16)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 52ba3b9f61..75beee3a04 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e137d5d92c05530840f2e191ec471f8f0ea2d62e"
-SRCREV_meta ?= "65d66ac9789372923b42be0683a87955e52705a5"
+SRCREV_machine ?= "fbed4064df813f01c1a862548f28b2050ee9b09e"
+SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d0166f6c4f..c8787085fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "c0774ebd6bc1c7541deb4f9a649a1a6bfa42853f"
-SRCREV_machine ?= "ab201bf6e3f9d187c7c26a0ec6537fadb41de918"
-SRCREV_meta ?= "65d66ac9789372923b42be0683a87955e52705a5"
+SRCREV_machine:qemuarm ?= "ca2928bf9b108b45a8ecfe6c76ae9d66b9527f0c"
+SRCREV_machine ?= "5d7922b2755129e1066944a25675a4f9bdbbe706"
+SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 43274a318f..9bc6511ec2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d9597fe71e155c5a96452d23694188d6d4091673"
-SRCREV_machine:qemuarm64 ?= "210fcd9ee603afb731beaa5833e7e3f1d1918786"
-SRCREV_machine:qemumips ?= "8688d3707cea38bd7ed115a12005079c2215f77d"
-SRCREV_machine:qemuppc ?= "933b47667b7549bb36a809cca90bc372a7182620"
-SRCREV_machine:qemuriscv64 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
-SRCREV_machine:qemuriscv32 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
-SRCREV_machine:qemux86 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
-SRCREV_machine:qemux86-64 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
-SRCREV_machine:qemumips64 ?= "25fcfe4f5c4be9bbb67498f09b2dd088f8bb6dfd"
-SRCREV_machine ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
-SRCREV_meta ?= "65d66ac9789372923b42be0683a87955e52705a5"
+SRCREV_machine:qemuarm ?= "dbf49e7b0801b1b92994f7bc3c6bba943340e273"
+SRCREV_machine:qemuarm64 ?= "0b092f0c4e3471ef22aef0343477519b0ba8b533"
+SRCREV_machine:qemumips ?= "1806335706c3549985836385bb400c1d80819d73"
+SRCREV_machine:qemuppc ?= "270ee670f95ad200c7c32bf8a8ffbf6ed43d7964"
+SRCREV_machine:qemuriscv64 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
+SRCREV_machine:qemuriscv32 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
+SRCREV_machine:qemux86 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
+SRCREV_machine:qemux86-64 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
+SRCREV_machine:qemumips64 ?= "ea456bce3f1ed65b1ab00a0cf8cf551b5967aec3"
+SRCREV_machine ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
+SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.34.1


