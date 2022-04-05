Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E34C47085
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IU9Bcc/5;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169719; x=1680705719;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/4GV7bmQu9epgwXV/LRw0drDt5JygCUHyNyYQdQxdXk=;
  b=IU9Bcc/54nOk072OvgD64VO8hxYjF55NKRWIEXdV8VdHWQ2PleC3+To4
   fJy1G00uPkcVjFf/ciFU1BMDtOpEuCni2zL3z9R9/rhqcHsEw8B+cyjIK
   rlEY2/cqJ/GFDBAYA+Tka01cgtQBIU0RVVNcZ2dbDhZC+8xI2fjJ0NaXa
   yrviULYCAkxTseXZ/JRN6tSiDpNHsVtNtyPb6UbLaemv7XN8MIZz+HD33
   3uLre/v/hlNzPJgxWO0AEpb/4t7jntOwwukDg6MUT05BNlRwV69HcnKsm
   Dl9GWRJDKzH81OP7pvFUMY3lK3pf4SnJOvytI8/GM4HilS35s44BKuLtZ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348711"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348711"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953571"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:57 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/22] linux-yocto: nohz_full boot arg fix
Date: Tue,  5 Apr 2022 22:41:27 +0800
Message-Id: 
 <e94f82fe9be6d429b6788ee19544c6b2908d6cac.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164026

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
index 70b572e808..36eb86f8c1 100644
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
index 9e954e45de..2c46c665a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "682b9a24accb1e3a305957dec28f7f565db95369"
-SRCREV_machine ?= "5e844e753c3e1f153af9dfee6b88e5dc1e57f30f"
+SRCREV_machine:qemuarm ?= "38f8b1b5b87959e6cb9367151e233d27befe015d"
+SRCREV_machine ?= "cc70f051e56005acda2e6ea994cadfb2538e66f6"
 SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 86d9559469..3d3ee6d623 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "56cfcfb12870782355bacaf8bcde9e268f422140"
-SRCREV_machine:qemuarm64 ?= "3aab5bb12bc180d582a6f82e4a085f45a7b0c283"
-SRCREV_machine:qemumips ?= "d76ec4c19a876a3235567ab2cee2e33f2875f79a"
-SRCREV_machine:qemuppc ?= "513a8885de593e8b1f3c24595c015bb9b1d55563"
-SRCREV_machine:qemuriscv64 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine:qemuriscv32 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine:qemux86 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine:qemux86-64 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine:qemumips64 ?= "b63b87635569c07343f25194abf008f1e27c0bca"
-SRCREV_machine ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
+SRCREV_machine:qemuarm ?= "74469c4b03f62e4b4da066e52785ed74b1d121ae"
+SRCREV_machine:qemuarm64 ?= "69f185342f516efa8a9233e31d2c3f8356b3a388"
+SRCREV_machine:qemumips ?= "d97607700b2fba19af10b2110b99c448ed9a88e9"
+SRCREV_machine:qemuppc ?= "090085d4bb6181c3b972d82c9f8f7ed88c90ad6b"
+SRCREV_machine:qemuriscv64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine:qemuriscv32 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine:qemux86 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine:qemux86-64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine:qemumips64 ?= "a1b43f69bce61143dd4d6d637f619eadd3fabb6e"
+SRCREV_machine ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.35.1


