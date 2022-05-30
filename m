Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF91C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31654.1653878172131745638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fRncQ7rM;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878184; x=1685414184;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7DC03jZu0qD5XwhCYf3W0P7fTMDhTnnHtjol6zWH1Z8=;
  b=fRncQ7rM5orQlvvH7AIof1j1DvvkO0jtkFWKCnuLNWFfEedTHa7Vc84m
   DzntUNirZohSx3ql20BjGzGLRr7ZbaqkaDliguQvzhbeBV6szaz2Mu4ri
   bshgM8ZB3KDeQsZCvzYbIdYk3f/sXLsOiyNznTerjYT7+ghwAonn+0yz/
   qNC1hjsmSrmJshXzUANZdG1K9++qKD9hv08O+U7YerIdnXcXKFlqExAFR
   5jqBMEdrPWplyQuskNIKiAN9V+rbutTDnbljlJQoJrKEyMtX1frSDMpMR
   e0GCnLelUSjwzuIHaeFN8MT2ZyoESGGkjXGEdnUnsM1/EaFWyXBCVc8/4
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876489"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876489"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313604"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:22 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/12] linux-yocto: Enable powerpc-debug fragment
 for ppc64 LE
Date: Mon, 30 May 2022 10:36:01 +0800
Message-Id: 
 <29c6faa9140de94c5730c8258cbb0985ee94e642.1653877872.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166255

From: Khem Raj <raj.khem@gmail.com>

qemuppc64 is LE by default, this fixes kernel build for qemuppc64 with
gcc12

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1674f1aeff5d2b3b2e79cc68ce1156f79eed548)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 3dfaeca208..bdeecd1bc8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -55,6 +55,7 @@ KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
-- 
2.35.3


