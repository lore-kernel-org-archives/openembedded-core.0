Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44666C43217
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:54 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13729.1645542530232186642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Brb9jcUq;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542533; x=1677078533;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QCm2vO3V1bfm3vFYVah1ZZBLivrrb4jyZ+fR06MaLZs=;
  b=Brb9jcUqU4rmiKCbGOjjb9wpCt4RorZE4wAzrwvtGrXmKl/eTbD7p4/Q
   vRI2532BBpp9jplk05LH8YNmEBynNp8/slCVMAxTpBvJZTtgfTSxdGR4h
   Mz5KcEXJ7xzpnGAvxFID9muksWiCw+xSoboco2yuW921YoHSicayAgTZT
   JKZBK3E/Z0bQ/zlZ01hvf6GsVJ9ITArR2V69cqUDDfUAjFOH1ayOZXlzO
   VFFt7RIgwYWQjkVuODJeFE7fLUgK7H4wJKvLGY9Qh4JYRvn4EnSuyXTlF
   ODvsBl2sFUsw+9OWcrkKuuPZJKxIEhzt+BFEi/qdQwoHiCi558Zw6ZJwx
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305316"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305316"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258805"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 32/38] linux-yocto/5.10: fix dssall build error with
 binutils 2.3.8
Date: Tue, 22 Feb 2022 23:07:33 +0800
Message-Id: 
 <f15172e85fdb212f9791be86e6724d35517d831c.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162168

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    c0b313d988a1 powerpc/mm: Switch obsolete dssall to .long

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b063ee0529c02f8b31a1034289ea1a202e496d0b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 4315ef6fa3..8a8a7eabe9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c8061a9f265a0d314e5b780a651662f462e4b287"
-SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
+SRCREV_machine ?= "e5b266bc6b15dc8852649b7d2a31395195dc7b3a"
+SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index c968d404d0..bf7662eed3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "5e7b4957ac1a94fdaaa719f6b62b80856e8a55e6"
-SRCREV_machine ?= "24a50caea8c65c2af4987c60067dc55ef737ebca"
-SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
+SRCREV_machine:qemuarm ?= "9a8497a8761a22b3086cab63d18698024a69a410"
+SRCREV_machine ?= "317635e1feaecfd8aa29bc94d8d03ba873190414"
+SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index ae607d721b..ecb2d03949 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7f5de9bc153963749c9a566828b59d4e63796432"
-SRCREV_machine:qemuarm64 ?= "c5bed4d604e64e8ce795a28576e341a2e790b4de"
-SRCREV_machine:qemumips ?= "0361229f491eec312e503cf7e58931571e53503f"
-SRCREV_machine:qemuppc ?= "2d7e10b0e0bab9b364e7612caf81b318f1d28b27"
-SRCREV_machine:qemuriscv64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine:qemuriscv32 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine:qemux86 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine:qemux86-64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine:qemumips64 ?= "931424f9c84cc440e8f154465062e71e2bdc2f03"
-SRCREV_machine ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
+SRCREV_machine:qemuarm ?= "5c9de82973348b40bfdcecc0623f488d9443038e"
+SRCREV_machine:qemuarm64 ?= "8c841836837414c6d07fa08ef8482162760fc27a"
+SRCREV_machine:qemumips ?= "d8287fdfbe460acdd62cf57e351411c992101514"
+SRCREV_machine:qemuppc ?= "f436ec6dd3942a87331abf39805e791460e499ef"
+SRCREV_machine:qemuriscv64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine:qemuriscv32 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine:qemux86 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine:qemux86-64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine:qemumips64 ?= "ae7887fe8d4da06d2d0d0a5071d09155899de26c"
+SRCREV_machine ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.35.1


