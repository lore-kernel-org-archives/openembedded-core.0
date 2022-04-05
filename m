Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F47BC35296
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=QCIstaPV;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169708; x=1680705708;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=A6MoBxmenDmEM2cmVvfCiuW/giXDaNa/+kPFvRW4LKc=;
  b=QCIstaPVRLJcLponMJqP9/oLnPcEkVfJmL+JCengi859IxaPQ7SLWms0
   35LDgqW3YGgCOZxnX0rWlj9TBBnS1OXJJwSiIHnh7juh6NiFCsRBbF3Ch
   dyIFRBbbMEIrZSTHh4fwe+1icytR43fe9SxDc1BW938qY1m2LVndn8adf
   DaY5zY9IZ6TjXnxZPhDJ/HhuPbKWKrWNA1f3qxO24slqtza/eLJlCE4Nu
   TPQOptqgHYYjOUEWMi5h1u9kGp6N599u8O0pPYMH7zGqlSjNa4q/Bnaeb
   ktKV2h30Aq2aiWGvRSMvq20sfB8SqwuysDbSS1K9Sd8Yjelolf2C9dCFt
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348657"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348657"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:48 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953506"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:46 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/22] conf/machine: fix QEMU x86 sound options
Date: Tue,  5 Apr 2022 22:41:20 +0800
Message-Id: 
 <28db8a73fc08e53206f442b3f6fbea9a8c33e46e.1649169646.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164019

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This updates the QEMU sounds options for x86 emulation,
when "runqemu" is called with the "audio" argument,
to fix the below error:

runqemu - ERROR - Failed to run qemu: qemu-system-x86_64: warning: '-soundhw ac97' is deprecated, please use '-device AC97' instead

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b802a5dd1a79c7be3bc790223a733ebc9be4f117)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/qemuboot.bbclass                  | 2 +-
 meta/conf/machine/include/x86/qemuboot-x86.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 5e7e7c0659..2bde12748d 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -29,7 +29,7 @@
 #
 # QB_AUDIO_DRV: qemu audio driver, e.g., "alsa", set it when support audio
 #
-# QB_AUDIO_OPT: qemu audio option, e.g., "-soundhw ac97,es1370", used
+# QB_AUDIO_OPT: qemu audio option, e.g., "-device AC97", used
 #               when QB_AUDIO_DRV is set.
 #
 # QB_RNG: Pass-through for host random number generator, it can speedup boot
diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index d3b91070a8..b7b6428e44 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -8,7 +8,7 @@ QB_CPU:x86-64 = "-cpu IvyBridge -machine q35"
 QB_CPU_KVM:x86-64 = "-cpu IvyBridge -machine q35"
 
 QB_AUDIO_DRV = "alsa"
-QB_AUDIO_OPT = "-soundhw ac97,es1370"
+QB_AUDIO_OPT = "-device AC97"
 QB_KERNEL_CMDLINE_APPEND = "oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 
-- 
2.35.1


