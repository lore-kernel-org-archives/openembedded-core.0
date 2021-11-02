Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB1EC433FE
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:45:13 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web08.458.1635871511923037907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="294769963"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="294769963"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:50 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575244"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:49 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 19/24] spdx.py: Add annotation to relationship
Date: Wed,  3 Nov 2021 00:44:07 +0800
Message-Id: 
 <37a29bd732cb917da4930ef624da72f5196732cc.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:45:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157780

From: Saul Wold <Saul.Wold@windriver.com>

Having annotations on relationship can provide additional information
about the relationship such as how it was derived.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d98585aa89e1d3819f8139a07fb7376ef89b37f8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/spdx.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 4416194e06..9e7ced5a15 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -196,6 +196,7 @@ class SPDXRelationship(SPDXObject):
     relatedSpdxElement = _String()
     relationshipType = _String()
     comment = _String()
+    annotations = _ObjectList(SPDXAnnotation)
 
 
 class SPDXExternalReference(SPDXObject):
@@ -300,7 +301,7 @@ class SPDXDocument(SPDXObject):
     def from_json(cls, f):
         return cls(**json.load(f))
 
-    def add_relationship(self, _from, relationship, _to, *, comment=None):
+    def add_relationship(self, _from, relationship, _to, *, comment=None, annotation=None):
         if isinstance(_from, SPDXObject):
             from_spdxid = _from.SPDXID
         else:
@@ -320,6 +321,9 @@ class SPDXDocument(SPDXObject):
         if comment is not None:
             r.comment = comment
 
+        if annotation is not None:
+            r.annotations.append(annotation)
+
         self.relationships.append(r)
 
     def find_by_spdxid(self, spdxid):
-- 
2.31.1


