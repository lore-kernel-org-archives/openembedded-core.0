Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1115C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 02:03:01 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.22151.1647223378479367004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 19:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=cdN14fD0;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647223380; x=1678759380;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=o77z8jn3lC5hlXtRsJkjSSvldjWnT28/+NzPz8Hjgms=;
  b=cdN14fD0Qfc7VopmWrTWppWHE1U2M02BRWWAH4ReGfDtpB5MSV2rzaMe
   J/e77mBjGlzob4Uf/pXYIAqqa9Rfuyd6pEkwMQtoJJTgKSwyNG5nQMqpQ
   gJDkzjkir0+97inWpVlMhVFHAFVBG0ZI48EqFRs6RBweQ9+sJEDVg1Peu
   RAU8HzjwdhPADGILmhE6t55HOoFVzzITKgbJ4Q5pKXB/x2epJ8pjowIwN
   zhX9I3Rs2ph1tjfCvYQzmoPAfrQkJ5GD25rkJyrCHZvuz80wukoSuzdgm
   O6seO3DX2nZGZfoxPfRhBPt487N1Z7YR9Wu2x62N3KQf1kz8WuK3QlDVt
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="316641515"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="316641515"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="515229491"
Received: from lsim7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.229.232])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 3/6] wic: Use custom kernel path if provided
Date: Mon, 14 Mar 2022 10:02:02 +0800
Message-Id: 
 <bced1ddc2358350a5df5b397be7a3ab7d64b08f6.1647222224.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647222224.git.anuj.mittal@intel.com>
References: <cover.1647222224.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 02:03:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163118

From: Bill Pittman <bill.pittman@ni.com>

If the custom kernel path is provided in options, then
use that path instead of the default path.

Signed-off-by: Bill Pittman <bill.pittman@ni.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1068102216a894c467f71f6046fdb37d5577545c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/wic | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 4bcff8f79c..aee63a45aa 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -159,6 +159,9 @@ def wic_create_subcommand(options, usage_str):
                            "(Use -e/--image-name to specify it)")
         native_sysroot = options.native_sysroot
 
+    if options.kernel_dir:
+        kernel_dir = options.kernel_dir
+
     if not options.vars_dir and (not native_sysroot or not os.path.isdir(native_sysroot)):
         logger.info("Building wic-tools...\n")
         subprocess.check_call(["bitbake", "wic-tools"])
-- 
2.35.1


