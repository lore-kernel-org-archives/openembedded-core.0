Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11253C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:10 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.26624.1646662445881657083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=OAwEqS3J;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662449; x=1678198449;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kzXcZDtMbMwP4trFY/9jC6e/tPxcgXupuvEQl5k8tLg=;
  b=OAwEqS3JDS07Gv7JSVgQ7MtxMjPFevn1dnpxcIX3pty/g7+c/zfTTzsC
   ZIpwEJ+E6BMxXX9juf+5IlDCFt/5bpi3f/rvRPmaQv5MHNu/ejy00irnx
   7nNqKH5kmIOT4fXIL0c0AJacydel/HgEMXDfz4keEmrc5lx6BhItSvLe2
   aJYzCMni8jy2ZE/5eea9sFgOecFqeB7buRH2Jp518pvfwoOwVZpK5BTBx
   TywCSxsUGR96RuQj1SOj+eeTu6gorq7qQewKmoH1OrNybqQ5WIO5/Xaya
   EKdyoJxkxRXWN8/7OHOekk4QwhTPINSEDMROKESvPIWAbJIl80UYHItSJ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112598"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112598"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:43 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070946"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 23/25] linux-yocto/5.10: Fix ramoops/ftrace
Date: Mon,  7 Mar 2022 22:09:59 +0800
Message-Id: 
 <c1c35b7ed3a3748f959a5b7039aa932637b09508.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162844

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    253c752ed120 pstore/ftrace: Add and use ftrace_test_recursion_trylock_safe
    356e8a12bd66 pstore/ftrace: Add recursion protection to the ftrace callback
    334706a1e873 ftrace: Add ftrace_test_recursion_trylock() helper function
    78c260d7f60b ftrace: Move the recursion testing into global headers

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b848a47033f492eaa0d5a02e42374b493734473e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ec4dea033c..d9e91856ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5c627c3d0740ef68beef456aaf7ef104315a8f7f"
-SRCREV_meta ?= "ff60a2ddb31e54be0f8ac63a28247e58f9c8cd23"
+SRCREV_machine ?= "b8dfdbe4d5a7b790bd2ecdb2889846e036469d25"
+SRCREV_meta ?= "f323785b54712f92ad8cae06e2711a01d66d4fdf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 3414c55740..dbc0a6e90d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "ce4e423e88244adab0deef2f9d021b2bf6d492ba"
-SRCREV_machine ?= "cc09c000260f49e35e85a96853dd01404e6aa80a"
-SRCREV_meta ?= "ff60a2ddb31e54be0f8ac63a28247e58f9c8cd23"
+SRCREV_machine:qemuarm ?= "e6fb3720c9823cc706e8c6441cfd382b52bf7ae5"
+SRCREV_machine ?= "57631093be11dd9606bbe8916b9f35bc9b6fe130"
+SRCREV_meta ?= "f323785b54712f92ad8cae06e2711a01d66d4fdf"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 0437274009..bbca0ffed5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "54d10cbfb44b9449f3962d962c6ec0d2e31017e8"
-SRCREV_machine:qemuarm64 ?= "1048394a0538b9b282c1f36f4de7e4ab814c90bf"
-SRCREV_machine:qemumips ?= "0214a416a56f01fed65e4b7818470139dc2b1286"
-SRCREV_machine:qemuppc ?= "b678c6d8d47e6e67aefa985fea85fe3026f2c809"
-SRCREV_machine:qemuriscv64 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
-SRCREV_machine:qemuriscv32 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
-SRCREV_machine:qemux86 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
-SRCREV_machine:qemux86-64 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
-SRCREV_machine:qemumips64 ?= "8d571427e05d1a8c7f7b0d32f291941429865ada"
-SRCREV_machine ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
-SRCREV_meta ?= "ff60a2ddb31e54be0f8ac63a28247e58f9c8cd23"
+SRCREV_machine:qemuarm ?= "778c2d4c9a4798b90ed3b5609ccbc2fa8b785778"
+SRCREV_machine:qemuarm64 ?= "6c6e9a984aa0a6bb2a11528c27023c588064422d"
+SRCREV_machine:qemumips ?= "3bcde31e0d5e48a2fd21f7d6300a7b5d625e5760"
+SRCREV_machine:qemuppc ?= "20fb5e330325ade20c8c3c2de7a64d9994298af6"
+SRCREV_machine:qemuriscv64 ?= "253c752ed120276124a8463d996b30af0db6f547"
+SRCREV_machine:qemuriscv32 ?= "253c752ed120276124a8463d996b30af0db6f547"
+SRCREV_machine:qemux86 ?= "253c752ed120276124a8463d996b30af0db6f547"
+SRCREV_machine:qemux86-64 ?= "253c752ed120276124a8463d996b30af0db6f547"
+SRCREV_machine:qemumips64 ?= "89e951f3655bd59f7564bd09c106186833702f12"
+SRCREV_machine ?= "253c752ed120276124a8463d996b30af0db6f547"
+SRCREV_meta ?= "f323785b54712f92ad8cae06e2711a01d66d4fdf"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.35.1


