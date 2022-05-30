Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4785EC433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31654.1653878172131745638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=apztKJjf;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878182; x=1685414182;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xN5wYbtijV874sM8CRx1PK17n/zslusaafW2OLhrA1U=;
  b=apztKJjfa4hclXLDmnC6LiVmVOD0ZXMjMZQAogQJ9OURPv1Y6surxmke
   Pjr1TBhbVNn1HD6pVarNbS1npahuNXAAVZ2gcf0Bzxq+Z1+UVwaVLy5W9
   Jc76os0sXjck/V8KSHPP8J2WcPgAPz8xTYYVE3BicKb3wMNlAethap0x7
   9Nz6WKyKTo86hLAUJTedqWQDrNwLK8j/Ty5zNbN6SGJCxUfE4kJekZXg1
   fosIEv6C4uVTVtDwHJWKF1ws0ava8mmG+I8L0c0zNs59lq1ovi2gNTJ7e
   jHwEuAHHrsz8K8xqhN5MRbsbKaMY7ZOcka//g+p3zM7mXRACPNa2O+6V9
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876479"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876479"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313600"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:21 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/12] linux-yocto: enable powerpc debug fragment
Date: Mon, 30 May 2022 10:36:00 +0800
Message-Id: 
 <31b15e5f7f4f6b53af5ad1a44af10bed914d454a.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653877872.git.anuj.mittal@intel.com>
References: <cover.1653877872.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166254

From: Bruce Ashfield <bruce.ashfield@gmail.com>

gcc12 generates some warnings with arch/powerpc, and we know that
these warnings are understood/non-fatal at runtime.

This fragment allows testing to continue, while upstream powerpc
looks at removing warnings.

We only enable it for 5.10/5.15 standard kernels for now, since
this gets us enough coverage to continue working with gcc12.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 992d9d41642981152a387fe59733cc6a77ea3528)
[Make changes only for 5.10 kernel]
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 3048a3e66b..4c55a27abf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "bd6e7290bc766ef13e42a1e37f75e6e708b4e317"
-SRCREV_meta ?= "2311a54750b6d9e0315e4f316b640e4e73945342"
+SRCREV_meta ?= "19e7547dd6617760d6094b7a42da1a718b5a96ee"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d37d39488e..42d5c105b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "ab911ca906ec6d1551ba12373d4133ccaf7f83cc"
 SRCREV_machine ?= "aadc46b05e5c77328bd3461578c770af3efa8944"
-SRCREV_meta ?= "2311a54750b6d9e0315e4f316b640e4e73945342"
+SRCREV_meta ?= "19e7547dd6617760d6094b7a42da1a718b5a96ee"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 5ff5d5d69c..3dfaeca208 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
 SRCREV_machine:qemux86-64 ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
 SRCREV_machine:qemumips64 ?= "a005c07acd278c86ddab4cd8bc7a1bfae4638414"
 SRCREV_machine ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
-SRCREV_meta ?= "2311a54750b6d9e0315e4f316b640e4e73945342"
+SRCREV_meta ?= "19e7547dd6617760d6094b7a42da1a718b5a96ee"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -53,6 +53,8 @@ KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
-- 
2.35.3


