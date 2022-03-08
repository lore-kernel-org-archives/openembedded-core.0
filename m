Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C797C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:21:22 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.8485.1646749280809201859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=PEJ9/P0G;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749281; x=1678285281;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=yx9ytNSgezqcgnx2UXhEghdvSuVZorIISY6TulhNl9M=;
  b=PEJ9/P0G8Pm/MllZU+vbF0Y6rtXaador3rbuJfeLmSnYUMp4/fTwbuKQ
   RqIO3JyIgigUC4yuwOVM8jlHDBOaooPHh54UdKQrjwrXD1qspvHH30SO3
   GxIs5wWjiqAyuzG6WyOGrCoY0UW8lVUIn4TgUUxPkgMUVkqdw39/vKkdQ
   F3eXhVWLZ5Lp6j0WILwpAS1xvM5y3T+jT6474dI8xFZoM+vxe2jVmd33x
   Ibctl0od1wlQPIwm24BT/6DNEqKdCTI+szQkG9bKT912j/FK1d6Yj2lRp
   9Dc0rA58Pp1Y5U2IHV1PeFOEBZb7sLajqmfjAjL0B3x9baR1zRPJ71nXc
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="242130088"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="242130088"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:48 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="513119937"
Received: from sktoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.176])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:47 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/15] selftest: recipetool: Correct the URI for
 socat
Date: Tue,  8 Mar 2022 22:19:58 +0800
Message-Id: 
 <fc185aeecfd35f7a6ab86964b04f1667f3a84208.1646748870.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646748869.git.anuj.mittal@intel.com>
References: <cover.1646748869.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:21:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162913

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
index 3621492998..4f283cdc03 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -375,7 +375,7 @@ class RecipetoolTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         pv = '1.7.3.0'
-        srcuri = 'http://www.dest-unreach.org/socat/download/socat-%s.tar.bz2' % pv
+        srcuri = 'http://www.dest-unreach.org/socat/download/Archive/socat-%s.tar.bz2' % pv
         result = runCmd('recipetool create %s -o %s' % (srcuri, temprecipe))
         dirlist = os.listdir(temprecipe)
         if len(dirlist) > 1:
-- 
2.35.1


