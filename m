Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D070C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:07:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.12123.1647356821113804643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=AgaOLyF1;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647356827; x=1678892827;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HFVkjfqprCTFvvPLU3IOWJd9htUpAXn9y2EEsY3NQUo=;
  b=AgaOLyF1RrM0btBNN22mwtvoRjmmpzGDcE30uY+qoMH2dIS3EWGUYAbD
   4ru7IoyVIpMOroYf3l2it0hECRAbtGmshrgv/q17qy8Jk5DakXwLPxAHD
   jh8cWI0j0QRN6LpABx+ziclODsvuYbDR/Tp/6IjF9BCfQdQ43YcdkMSDs
   XtzazFPaaIvRuSvYSyPfKVgprLSTrNlA5SC0lCTcUEkznY+3MBOLY4v3K
   ft6t0aFljvGzxFhKiiIdajcww5kVwZG9D9e81zV/nqbpLYSTpmwZaHR7v
   V51KoWDWaQtnVzIrPZrt839N/Pgw8kgAN6n2qIml+hjGSOJlyWjnnUVrk
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="281098950"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400";
   d="scan'208";a="281098950"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:05:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400";
   d="scan'208";a="634616179"
Received: from ezulkifl-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.233.253])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:05:37 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 6/6] wic: Use custom kernel path if provided
Date: Tue, 15 Mar 2022 23:05:21 +0800
Message-Id: 
 <bcef80623f015c006778edee5cf40dad063e51db.1647356478.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647356478.git.anuj.mittal@intel.com>
References: <cover.1647356478.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 15:07:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163302

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
index 6547abe0e9..c0bc0e6fe8 100755
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


