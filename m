Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDB4C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:26 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=OdZWoDMR;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444885; x=1670980885;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EDwGvCsEtUu0rSIa34YZH0YNw5geBnZyzmtAdgskLis=;
  b=OdZWoDMRaZqAKsO7YqNEdPl7TvfS0PGoeTuBvDd0rGUD9rI093GLk1WG
   SVtSRUHUvOb42sZ8JgaJuhRxlEcnTj9f2iFLi27pigNRDfZ+oH/NpTjh0
   K/+ggQkfaXpIgDuTZ+sUwAH27DVNN8zZDmeCotOu3n4t0djs1DDf9iF2x
   oLY1uhtlbATzYkEjRCxVbLs4YGF12DSy4pbwc+fL7p32u2FJqDR94gvaA
   TKMzTxfTymwrc7kF8V0faLNFGBXzMvupe5JetCy/BbFkvsWlfvVhtJVX/
   zvKhsdlYt0T0EEyJMLiAbHWYVeuBSOlxH3lruj6Iasz+N4uZR+x86s9Go
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682562"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682562"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869237"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:24 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 16/17] oe/license: implement
 ast.NodeVisitor.visit_Constant
Date: Tue, 14 Dec 2021 09:20:51 +0800
Message-Id: 
 <c96241ac8e18f4ae87ec05b722a0bbfb017df578.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159678

From: Ross Burton <ross@burtonini.com>

Since Python 3.8 visit_Num(), visit_Str() and so on are all deprecated
and replaced with visit_Constant.  We can't yet remove the deprecated
functions until we require 3.8, but we can implement visit_Constant to
silence the deprecation warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/license.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 665d32ecbb..b5d378a549 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -74,6 +74,9 @@ class FlattenVisitor(LicenseVisitor):
     def visit_Str(self, node):
         self.licenses.append(node.s)
 
+    def visit_Constant(self, node):
+        self.licenses.append(node.value)
+
     def visit_BinOp(self, node):
         if isinstance(node.op, ast.BitOr):
             left = FlattenVisitor(self.choose_licenses)
@@ -227,6 +230,9 @@ class ListVisitor(LicenseVisitor):
     def visit_Str(self, node):
         self.licenses.add(node.s)
 
+    def visit_Constant(self, node):
+        self.licenses.add(node.value)
+
 def list_licenses(licensestr):
     """Simply get a list of all licenses mentioned in a license string.
        Binary operators are not applied or taken into account in any way"""
-- 
2.33.1


