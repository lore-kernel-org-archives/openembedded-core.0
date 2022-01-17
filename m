Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B7FC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:10:55 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=XMblj2C+;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385454; x=1673921454;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=K8MTeN9jCmCS//IHRJfbpaDkpF7ZKmBqXgF1wbRzZew=;
  b=XMblj2C+JU/OenpWgIWrZPF04UfIGNDvXnAdihhZ+0AqybjiYkx8ryRk
   Ld48Kex4HtOe4L4QzeTiDYQNJZX+Mc19hbgg+dBWOixuV4O8T1qDbaFBw
   5PjX4icYTL7AFIeCkvMxu9YECGbqEDui7kG0GOjwrNL/LwlTgjnD7YZPg
   X3ukU5M/f1rlgTSOrO9gcOhJQHd4akrDdVpHpd2Tz0y9tIChO+8MUYd09
   ImSREf3CtHZ9FXQMXdGMBdc8KDBQBr4k4rwztLkB1VSqXksGFBwBAV3Xu
   ZVrIs7fEvjenOLOxmghsAHMxWHaN6Vn7NiTfL1x9Xh2CXXm8FbcNouAPn
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094250"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094250"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220720"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/12] linux-yocto/5.14: fix arm 32bit -rt warnings
Date: Mon, 17 Jan 2022 10:10:28 +0800
Message-Id: 
 <182332fd5c2080942dd53862e76459677194347b.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:10:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160627

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

f9e349e1745 preempt-rt.scc: arm should come after ftrace
25f5db372ac drivers-zynq.cfg: update CONFIG_NET_CADENCE option

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 704720e28f67e880998d4dab85b366cb7f1a4ce3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.14.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 7dcab51f01..6f22173b1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b18aaa90f5ce15336aacf4cc24c7a086aeb4bc84"
-SRCREV_meta ?= "4f4ad2c8083408bb303e110090dcf5ca0ad447dd"
+SRCREV_meta ?= "f9e349e174542980f72dcd087445d0106b7a5e75"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 23062df3b0..d44fac6094 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "159f57f8e022351d5193e51c02c951f2e255db1a"
 SRCREV_machine ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_meta ?= "4f4ad2c8083408bb303e110090dcf5ca0ad447dd"
+SRCREV_meta ?= "f9e349e174542980f72dcd087445d0106b7a5e75"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index aa7bf53682..b5be96b7c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
 SRCREV_machine:qemux86-64 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
 SRCREV_machine:qemumips64 ?= "f6646a344afbf6cacc91cbeaaec4240b372dd192"
 SRCREV_machine ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_meta ?= "4f4ad2c8083408bb303e110090dcf5ca0ad447dd"
+SRCREV_meta ?= "f9e349e174542980f72dcd087445d0106b7a5e75"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


