Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C57C04A94
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 16:22:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.15664.1690388543744120259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 09:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=kH6jbr4h;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690388544; x=1721924544;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Z/3uymY/U31mw8WJWRMpzmQAS0FyuE1M+8j+r1+QVcs=;
  b=kH6jbr4hvXP+sPYdaOnmGoDYB9oj703j7v0IFcSmnq07fbFg0h43XnCH
   79k5AAgc9T3kGD4/qGSWk1qOvnSO1Pc8K0RNnttNBLFjCfmo+HNwnlmYg
   cuMcuQTWmgHiLG01zxG0RMP4x4eEVJ0IFehY1tq2DcjAYYpyrViAbMPuM
   Ey1B+TvTGTOxS3sWAWwVOrZiEmuFDhbedg+XndwWSKwID8ThwaTmWDUeg
   BcJELe9GnCnxp6DgIY0AsD1uodEDNDTvbtDvt68aUHbRSIYHRs0Iqu0Z0
   w37zzhaWa4vBXIKr3imLSVRU8cCt6l1O21SWLLckWNIXxFdV6v/8tXhTA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347676109"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="347676109"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816745732"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="816745732"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.246])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:22:23 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] glibc/check-test-wrapper: don't emit warnings from ssh
Date: Thu, 27 Jul 2023 00:22:06 +0800
Message-ID: <20230726162209.131855-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162209.131855-1-anuj.mittal@intel.com>
References: <20230726162209.131855-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 16:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184892

Dont fill up the test log with ssh warning about having added the host
to list of known hosts.

Also helps fix a test case failure where stderr log was being compared
to a known value.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glibc/glibc/check-test-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc/check-test-wrapper b/meta/recipes-core/glibc/glibc/check-test-wrapper
index 6ec9b9b29e..5cc993f718 100644
--- a/meta/recipes-core/glibc/glibc/check-test-wrapper
+++ b/meta/recipes-core/glibc/glibc/check-test-wrapper
@@ -58,7 +58,7 @@ elif targettype == "ssh":
     user = os.environ.get("SSH_HOST_USER", None)
     port = os.environ.get("SSH_HOST_PORT", None)
 
-    command = ["ssh", "-o", "UserKnownHostsFile=/dev/null", "-o", "StrictHostKeyChecking=no"]
+    command = ["ssh", "-o", "UserKnownHostsFile=/dev/null", "-o", "StrictHostKeyChecking=no", "-o", "LogLevel=quiet"]
     if port:
         command += ["-p", str(port)]
     if not host:
-- 
2.41.0


