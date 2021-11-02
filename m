Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE87C4332F
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:45:13 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.462.1635871513077249826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="294769968"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="294769968"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:52 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575247"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:50 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 20/24] create-spdx: add create_annotation function
Date: Wed,  3 Nov 2021 00:44:08 +0800
Message-Id: 
 <a56b50ada5d1aba57e901684af6a3761f74f6674.1635871270.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/157781

From: Saul Wold <Saul.Wold@windriver.com>

This allows code reuse and future usage with relationship annotations

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1f8fdb7dc9d02d0ee3c42674ca16e03f0ec18cba)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/create-spdx.bbclass | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 739b46e9b3..aa9514121d 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -35,6 +35,17 @@ def get_doc_namespace(d, doc):
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
     return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), doc.name, str(uuid.uuid5(namespace_uuid, doc.name)))
 
+def create_annotation(d, comment):
+    from datetime import datetime, timezone
+
+    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
+    annotation = oe.spdx.SPDXAnnotation()
+    annotation.annotationDate = creation_time
+    annotation.annotationType = "OTHER"
+    annotation.annotator = "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION"))
+    annotation.comment = comment
+    return annotation
+
 def recipe_spdx_is_native(d, recipe):
     return any(a.annotationType == "OTHER" and
       a.annotator == "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION")) and
@@ -412,12 +423,7 @@ python do_create_spdx() {
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
     if bb.data.inherits_class("native", d):
-        annotation = oe.spdx.SPDXAnnotation()
-        annotation.annotationDate = creation_time
-        annotation.annotationType = "OTHER"
-        annotation.annotator = "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION"))
-        annotation.comment = "isNative"
-        recipe.annotations.append(annotation)
+        recipe.annotations.append(create_annotation(d, "isNative"))
 
     for s in d.getVar('SRC_URI').split():
         if not s.startswith("file://"):
-- 
2.31.1


