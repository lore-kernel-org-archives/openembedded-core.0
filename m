Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66030C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31654.1653878172131745638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=A+w0iws8;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878175; x=1685414175;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Ni80yvfeW4KYS7w7q6TVcVGVQ7XQZ5qm6Cvqmns+FWk=;
  b=A+w0iws8nmjRNbeSLzqjlHgN2hAZWR3ZCZMsYgpO7z8m/bTctppwNObF
   g7/Ecocw1qyEQHfuAMv/sqBcPQQavRZAxFjvMUDXrRVDlZ3wRRuy3LllF
   8586pNxrElQ8b9Ynid3JtLhFr+CjcdXdvosHSmzUDQL58cCQCIqiGCldk
   LnaUzq2uCYoIOEu+Vv0KRrd8sWMsd9vVMSpnqfljlTiUrfQEBbxEUdVqU
   Wnr58Ecb5P0pxgY4WNecruFSr1fxzRsMTqSgNtHIljX0brIlzvK04DTc7
   TB1TImHOUMh3awOXQZy+vuTLzqh1r/RlBCrJmGzmtaQ+PDKfgpne+xWWR
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876435"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876435"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313543"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:14 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/12] linux-yocto/5.10: base: enable kernel crypto
 userspace API
Date: Mon, 30 May 2022 10:35:55 +0800
Message-Id: 
 <34cd4341833a130e7e468876b5ece1ac10da8632.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653877872.git.anuj.mittal@intel.com>
References: <cover.1653877872.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166249

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    bddb0e4921f base.cfg: enable kernel crypto userspace API

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a08c1c7dba66a1d12e029906d86f4f84e9166232)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index b8a280a615..9731a738b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "c11f8738640c3c52f4ffc2adf9aa8f6c097e4a4e"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index bafa486d23..f75c0d70d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "3851408a9f5d9d4531f29340056a1089debd5b58"
 SRCREV_machine ?= "0a47fd76cb0f7e22d47afcb88bf884c750ba5d92"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 72293768dd..a7485be1de 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "a275cd6839513c72ceae989a575b6accbb262016"
 SRCREV_machine:qemux86-64 ?= "a275cd6839513c72ceae989a575b6accbb262016"
 SRCREV_machine:qemumips64 ?= "36a2d17167ee66a2feda5fb1efee0a2ee2dc4740"
 SRCREV_machine ?= "a275cd6839513c72ceae989a575b6accbb262016"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.35.3


