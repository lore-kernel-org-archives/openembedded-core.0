Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C27C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 16:22:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.15664.1690388543744120259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 09:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=I6Vf546K;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690388545; x=1721924545;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=E8tr38ov4hzLNE0e+1wOHtrA7VLo5g2OwBmJeFvpQUY=;
  b=I6Vf546KTOq/gQEPpB+267sr4IKNMf/ydVru7vhasXpCHU6uTDYNRuaW
   AT9d5Gx5gnXNqyA1ufrNYaRjjmr8gMrYQmAgk6+a8bHewbbWscgvcL7ux
   P0TRbRQ/LDfBpRhMugs85M6uY1WKGwsNQkpYQd2JYcV7LawWcHfO+jc1u
   llQzDMJHnF1CPuoylLug5vL55wv3kfHXBNnKZETN6OoFH+/V/sIgtaca/
   FdsQjggVNcXqZWtTzBFizAny/9aPqou34j5nn+aogDe3Z0HF6RuMUiPmX
   6MqM6ZZ1Z6+KTnWVMrlbwmS0jKZ/NEQ1gJmpa8VZSrsVkx+rrIoL9J+7w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347676128"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="347676128"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816745734"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="816745734"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.246])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:22:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] selftest/cases/glibc.py: increase the memory for testing
Date: Thu, 27 Jul 2023 00:22:07 +0800
Message-ID: <20230726162209.131855-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162209.131855-1-anuj.mittal@intel.com>
References: <20230726162209.131855-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 16:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184893

Some of the tests trigger OOM and fail. Increase the amount of memory
available so we dont run into these issues.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 4ec4b85d67..c300aef913 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -65,7 +65,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             bitbake("core-image-minimal")
 
             # start runqemu
-            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic"))
+            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 1024"))
 
             # validate that SSH is working
             status, _ = qemu.run("uname")
-- 
2.41.0


