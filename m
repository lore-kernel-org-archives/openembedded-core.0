Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F51C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456806"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456806"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:21 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617169"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:20 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/36] libxml2: Use python3targetconfig to fix
 reproducibility issue
Date: Wed, 27 Oct 2021 23:16:25 +0800
Message-Id: 
 <4d1a5093675d365a3f8d2b3117062adc623d6488.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157533

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing pthread being linked sometimes and not others leading to
non-reproducible target binaries. The reason is mixing the native python
config with the target one. We should use the target one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1bc5378db760963e2ad46542f2907dd6a592eb66)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/libxml/libxml2_2.9.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index ce4f9a3340..cabf911816 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -47,7 +47,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 inherit autotools pkgconfig binconfig-disabled ptest
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
 
 RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell  python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
-- 
2.31.1


