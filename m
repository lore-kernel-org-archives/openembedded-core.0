Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0A2C43217
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:17 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.505.1635871635257964071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509725"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509725"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:36 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575165"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:35 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/24] linux-yocto/5.14: common-pc: enable
 CONFIG_ATA_PIIX as built-in
Date: Wed,  3 Nov 2021 00:43:58 +0800
Message-Id: 
 <32f484d445eedadb9d1f2428398a4ec64ac7e4eb.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157796

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Jacob Kroon reported that generic/custom x86 kernels would no
longer boot out of the box since the IDE options were removed
and the PATA migration happened.

To re-enable that use case, we grab the following kernel
configuration change:

    common-pc*/qemux86*: set CONFIG_ATA_PIIX as built-in

    Since the IDE options were made obselete in the kernel, and the
    PATA driver is the replacement, we haven't had one of the commonly
    used qemu boot devices enabled in our kernel by default.

    We change CONFIG_ATA_PIIX to built-in, to re-enable use cases that
    boot from default qemu 'hardware'.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Reported-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 341707513a7c3cfcd797f6631b8daf09ddf5bae8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.14.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 245ea46ceb..3d53a32d40 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "cddeec4e197612a11f5a3d746a15825c66040830"
-SRCREV_meta ?= "6f8d397886b014e8c7ef4ffb08a489fd7b6a0a3f"
+SRCREV_meta ?= "dc308bdf001acd203ed912852bafbf779696d507"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index c98a5fa428..0683912eb2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "ace292aaba53e26d1888bebda95bbadfd417c2a5"
 SRCREV_machine ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_meta ?= "6f8d397886b014e8c7ef4ffb08a489fd7b6a0a3f"
+SRCREV_meta ?= "dc308bdf001acd203ed912852bafbf779696d507"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index fe7244399a..2d4600746c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
 SRCREV_machine:qemux86-64 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
 SRCREV_machine:qemumips64 ?= "b8f18794a5a6bb9c6d0190a2006dfbd82f0f5916"
 SRCREV_machine ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_meta ?= "6f8d397886b014e8c7ef4ffb08a489fd7b6a0a3f"
+SRCREV_meta ?= "dc308bdf001acd203ed912852bafbf779696d507"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.31.1


