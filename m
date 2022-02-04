Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273E7C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:03 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=i4ABhb0b;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983982; x=1675519982;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BSYI98KiQMyMW7XS2DsiQyEjaKwfV8m17DD6/MVP9Kc=;
  b=i4ABhb0boUHQNN4teBjRrpcRAXkUrSTqiszd9NMd1lmGlNOJZivNNPeS
   dvkzXDrL3L/hTiD6vDATh6iQ5U4iK7Tq8WcLIx4VXd8nh25cU+XPbz8cu
   QlYmZ3pD6RIp6ZnYyz9DR/3Y9bfqkVbdCyBHKqNDFtUn9qP20lPflx5o8
   ohvomrl395kKrGmyuYnyzf0g7z0rX9LO6b47JDZu6J6inZyvN8G9xiGsw
   rWfEAanpCUOCOavIdjLDhuH39HwQJ4R2NsBCE2oOdMK9646qv2Xddac29
   rY98tLJtm0LxytYzEtn97i8aJc0ScoYwuye9i0tdjvo6RkHckem9l9Yrz
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321610"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321610"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750063"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/17] icu: fix make_icudata dependencies
Date: Fri,  4 Feb 2022 22:12:33 +0800
Message-Id: 
 <18a43fe970b691250fbf48f39ed5f4f7ad121b75.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161354

From: Kory Maincent <kory.maincent@bootlin.com>

The make_icudata task is set before the configure task then the
dependencies for this task are not populate yet.

Fixed it by adding do_prepare_recipe_sysroot task dependency to the
make_icudata task.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c134f62062a6359d2d5831ba4cb9694035e4f25a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/icu/icu_69.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_69.1.bb b/meta/recipes-support/icu/icu_69.1.bb
index 4daf0fe82e..848ae9ab19 100644
--- a/meta/recipes-support/icu/icu_69.1.bb
+++ b/meta/recipes-support/icu/icu_69.1.bb
@@ -147,4 +147,4 @@ do_make_icudata() {
     :
 }
 
-addtask make_icudata before do_configure after do_patch
+addtask make_icudata before do_configure after do_patch do_prepare_recipe_sysroot
-- 
2.34.1


