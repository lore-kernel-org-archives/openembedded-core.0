Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DB2C4167B
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:02 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.26743.1646662439326190152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=TLEnaf22;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662441; x=1678198441;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=wo1QxwZ1J0aMJ0rS14xBH7pDxR5r1amHiFv9alYWpKo=;
  b=TLEnaf22XAkp9ynbzVrSpHNCBM9cUxZW3VOmiMAqX67ReroRopF9Kbmk
   tRNnP5SSwI/PtictUAgkigl2GrX1d82D++UEwOJZlEoqVsxPNvt505N58
   w68XwhQUYp3cziabal8x906oNYEiWskfrki+OIrWFJu78Ood3sk32cvx4
   j6L8oxZI7UlDG08l0SIlXDFLqhhWg5XybHCxYV9melGq+c3+WxRR7ov84
   wh4XQjQdzlmxxq1g5Ua2tqM6mL72ck3sm/reJ7MkzHiQ85SwRQaqiBzDA
   Qlsq80v1kgUeAsRdRWfDDLQGItjJbxx1kZNubARcM2Zaech1ujemYGrdL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112566"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112566"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070873"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 16/25] selftest: recipetool: Correct the URI for
 socat
Date: Mon,  7 Mar 2022 22:09:52 +0800
Message-Id: 
 <66b681900630acd6eb1336275325c2d3b1eb7dc7.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162837

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The URI to the socat tarball used in the
recipetool.RecipetoolCreateTests.test_recipetool_create_simple test has
been moved to an "Archive" directory.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e8b716e1377ad49f1451cbabe7c9961cc507731)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 8dc00ac10e..814a03191b 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -375,7 +375,7 @@ class RecipetoolTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         pv = '1.7.4.1'
-        srcuri = 'http://www.dest-unreach.org/socat/download/socat-%s.tar.bz2' % pv
+        srcuri = 'http://www.dest-unreach.org/socat/download/Archive/socat-%s.tar.bz2' % pv
         result = runCmd('recipetool create %s -o %s' % (srcuri, temprecipe))
         dirlist = os.listdir(temprecipe)
         if len(dirlist) > 1:
-- 
2.35.1


