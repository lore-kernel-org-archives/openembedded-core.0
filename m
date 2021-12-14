Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC1BC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:28 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=U5tNswVH;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444887; x=1670980887;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bliz9PME4stYWmJb4/fh/XNrZQlTw/cMIP8VIEKEbWw=;
  b=U5tNswVHKyGzsMAbE9FWHVGUCwQYtt1JWFgB/eZ2LRSJhxN1ihhbf9Dq
   cbFPbyasW7fMato49kZ//rf0EnBZyE2H4eiVwLMWeEcJ24b1Gebgno4TD
   oTJVqHJiLtX6Cx8vL2xWD4XlVIbvXpJwOl3fDs6QHJ1iWCAoK3YnkJ+Mi
   ebyXlgbHy/jLYOLyjJYrKOubMH6KZ1+o2u51uA6ylDQoA0Vb2obhWajZ5
   ryGTxWrzzaOLmj6P8ETHPkX1mGRcUfGi9S/Zr2BoxckZgsVi051qoaoOa
   6PHQqW08nQfoE1/6p5t0ZBRt7M9Fs5lLMY/Ar63j7BlmkrfOzi/973jFn
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682566"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682566"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869239"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:25 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 17/17] license.bbclass: implement
 ast.NodeVisitor.visit_Constant
Date: Tue, 14 Dec 2021 09:20:52 +0800
Message-Id: 
 <067fbe5e12a81225cf3ff436837af6a6d23040a6.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159679

From: Ross Burton <ross@burtonini.com>

Since Python 3.8 visit_Num(), visit_Str() and so on are all deprecated
and replaced with visit_Constant.  We can't yet remove the deprecated
functions until we require 3.8, but we can implement visit_Constant to
silence the deprecation warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/license.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 45d912741d..7a34e185c7 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -145,6 +145,10 @@ def find_license_files(d):
             find_license(node.s.replace("+", "").replace("*", ""))
             self.generic_visit(node)
 
+        def visit_Constant(self, node):
+            find_license(node.value.replace("+", "").replace("*", ""))
+            self.generic_visit(node)
+
     def find_license(license_type):
         try:
             bb.utils.mkdirhier(gen_lic_dest)
-- 
2.33.1


