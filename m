Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60893C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:21:29 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.8577.1646749288672106420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Le4ssB0F;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749288; x=1678285288;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xgweQEOKGa7MRB5Hcn5K3zEOy94hiS3dK+s6gEowgIE=;
  b=Le4ssB0F5JJYCs56cGaB9AspEIy7tSbyJXXqtlrqmxeFuBNEYB3N6lb6
   fRBPMVl+tK6RX4hP1vC6Gar04fJHrtdO67sRWskDQzFAE8ldUA+vZK8Wf
   hvTl0jwxhgSgQI38RDMFqGSlVF5rUzT1Pa9cfXS12qrViM2GukBu8aEh1
   2exzA4STpkUjflkapJBw6LxuQiiRykMKLoVZey0Y4UYXY9B6gn8oZMw13
   XNYmDJzm5/QeSunAhyF2dNOq3pndfgD0H5kkTCFo8Ow+sbVdlUAwezXZu
   kAOJXHoz2WygnbS+dGZ3pc+I9sIrhK0caxhbp9EmozP78VVEhHGa2W6gS
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="242130119"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="242130119"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="513119998"
Received: from sktoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.176])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:51 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/15] linux-yocto/5.10: fix dssall build error
 with binutils 2.3.8
Date: Tue,  8 Mar 2022 22:20:01 +0800
Message-Id: 
 <a8d750cfa894abd9e260c5225f8ad3cd93db5194.1646748870.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/162917

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
index a13f17d092..edc1a957bb 100644
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
index e34f8e3cd9..5380dcb029 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "5e7b4957ac1a94fdaaa719f6b62b80856e8a55e6"
-SRCREV_machine ?= "24a50caea8c65c2af4987c60067dc55ef737ebca"
-SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
+SRCREV_machine_qemuarm ?= "9a8497a8761a22b3086cab63d18698024a69a410"
+SRCREV_machine ?= "317635e1feaecfd8aa29bc94d8d03ba873190414"
+SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index a71119c3f0..d2d1b0bd5a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7f5de9bc153963749c9a566828b59d4e63796432"
-SRCREV_machine_qemuarm64 ?= "c5bed4d604e64e8ce795a28576e341a2e790b4de"
-SRCREV_machine_qemumips ?= "0361229f491eec312e503cf7e58931571e53503f"
-SRCREV_machine_qemuppc ?= "2d7e10b0e0bab9b364e7612caf81b318f1d28b27"
-SRCREV_machine_qemuriscv64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine_qemuriscv32 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine_qemux86 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine_qemux86-64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine_qemumips64 ?= "931424f9c84cc440e8f154465062e71e2bdc2f03"
-SRCREV_machine ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
+SRCREV_machine_qemuarm ?= "5c9de82973348b40bfdcecc0623f488d9443038e"
+SRCREV_machine_qemuarm64 ?= "8c841836837414c6d07fa08ef8482162760fc27a"
+SRCREV_machine_qemumips ?= "d8287fdfbe460acdd62cf57e351411c992101514"
+SRCREV_machine_qemuppc ?= "f436ec6dd3942a87331abf39805e791460e499ef"
+SRCREV_machine_qemuriscv64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine_qemuriscv32 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine_qemux86 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine_qemux86-64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine_qemumips64 ?= "ae7887fe8d4da06d2d0d0a5071d09155899de26c"
+SRCREV_machine ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.35.1


