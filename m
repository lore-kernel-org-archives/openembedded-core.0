Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8A3C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:47:57 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.7386.1648734471130321746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=SQtta5Nz;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734476; x=1680270476;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AiFoFfj76GsyifcYr6T0ySiq7ZVH512Aumy4RKEu9gg=;
  b=SQtta5NzEjmVe2THKJjP5FGdgZw8lkOlmsiWSTxfzQnay5achak/ao//
   lkw3pm14R9+OAh2fHh3tdha2tqgf0hH1ZCRxKg4zV2b/ZsvJU89JMMblx
   ycfqGwtWLpUU+/WrlJJv0AE/cOQBNnSHtGfj/VVsPvFZCjzyyYDSep4X4
   OmQQ1dPUMt+qR5P1ngMGlLtDSBwELVl6LGKJtsEZ1YlG+n60S7qwOa6d8
   r7hqSwi5+cFtwwJPO1cyFa50DnWqevTS6Gj4yIi9L2TVLrLGEWeCU0Fhp
   v9mMCblvyiC6avy/hBf0v6CQg9LXrIWWzASbbyNfLlZQgfDYw8/tRfw0h
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551823"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551823"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542200"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:46 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/20] linux-yocto: nohz_full boot arg fix
Date: Thu, 31 Mar 2022 21:47:16 +0800
Message-Id: 
 <f30d642b8e0ccf7ea005ec31818ff6fb98d9ab51.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:47:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163824

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 11de5ad0cfee5bf8bcdd28da6b27447280add2cf)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 8b10988438..4d75cf1b21 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "abd24ddc62072fcc5ecf12cf8feadd2e6fda59bd"
+SRCREV_machine ?= "e0d87d9831a6e0df20a370adc9aba0d032d91661"
 SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8564b5becf..8227d5d8cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "682b9a24accb1e3a305957dec28f7f565db95369"
-SRCREV_machine ?= "5e844e753c3e1f153af9dfee6b88e5dc1e57f30f"
+SRCREV_machine_qemuarm ?= "38f8b1b5b87959e6cb9367151e233d27befe015d"
+SRCREV_machine ?= "cc70f051e56005acda2e6ea994cadfb2538e66f6"
 SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2e12654fec..5a4939cf36 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "56cfcfb12870782355bacaf8bcde9e268f422140"
-SRCREV_machine_qemuarm64 ?= "3aab5bb12bc180d582a6f82e4a085f45a7b0c283"
-SRCREV_machine_qemumips ?= "d76ec4c19a876a3235567ab2cee2e33f2875f79a"
-SRCREV_machine_qemuppc ?= "513a8885de593e8b1f3c24595c015bb9b1d55563"
-SRCREV_machine_qemuriscv64 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine_qemuriscv32 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine_qemux86 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine_qemux86-64 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine_qemumips64 ?= "b63b87635569c07343f25194abf008f1e27c0bca"
-SRCREV_machine ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
+SRCREV_machine_qemuarm ?= "74469c4b03f62e4b4da066e52785ed74b1d121ae"
+SRCREV_machine_qemuarm64 ?= "69f185342f516efa8a9233e31d2c3f8356b3a388"
+SRCREV_machine_qemumips ?= "d97607700b2fba19af10b2110b99c448ed9a88e9"
+SRCREV_machine_qemuppc ?= "090085d4bb6181c3b972d82c9f8f7ed88c90ad6b"
+SRCREV_machine_qemuriscv64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine_qemuriscv32 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine_qemux86 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine_qemux86-64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine_qemumips64 ?= "a1b43f69bce61143dd4d6d637f619eadd3fabb6e"
+SRCREV_machine ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.35.1


