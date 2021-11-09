Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC13C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:38:25 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.12976.1636468691816879860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229915892"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229915892"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956866"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:23 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/26] create-spdx: Set the Organization field via a
 variable
Date: Tue,  9 Nov 2021 22:37:46 +0800
Message-Id: 
 <e370039febe601127347da977ff9b7e5c7470315.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:38:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158032

From: Andres Beltran <abeltran@linux.microsoft.com>

Currently, the "Organization" field for SBOMs is hard-coded in
create-spdx. Create a new variable SPDX_ORG to make this field more
generic.

Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f239814f3f5d9bd54de54b0f2a5081067336e32b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/create-spdx.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index c35dbe1184..eb1d446f3f 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -28,6 +28,8 @@ SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
+SPDX_ORG ??= "OpenEmbedded ()"
+
 do_image_complete[depends] = "virtual/kernel:do_create_spdx"
 
 def get_doc_namespace(d, doc):
@@ -415,7 +417,7 @@ python do_create_spdx() {
     doc.creationInfo.comment = "This document was created by analyzing recipe files during the build."
     doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
     doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
-    doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
+    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
     doc.creationInfo.creators.append("Person: N/A ()")
 
     recipe = oe.spdx.SPDXPackage()
@@ -519,7 +521,7 @@ python do_create_spdx() {
             package_doc.creationInfo.comment = "This document was created by analyzing packages created during the build."
             package_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
             package_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
-            package_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
+            package_doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
             package_doc.creationInfo.creators.append("Person: N/A ()")
             package_doc.externalDocumentRefs.append(recipe_ref)
 
@@ -653,7 +655,7 @@ python do_create_runtime_spdx() {
             runtime_doc.creationInfo.comment = "This document was created by analyzing package runtime dependencies."
             runtime_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
             runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
-            runtime_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
+            runtime_doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
             runtime_doc.creationInfo.creators.append("Person: N/A ()")
 
             package_ref = oe.spdx.SPDXExternalDocumentRef()
@@ -813,7 +815,7 @@ python image_combine_spdx() {
     doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
     doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
     doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
-    doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
+    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
     doc.creationInfo.creators.append("Person: N/A ()")
 
     image = oe.spdx.SPDXPackage()
-- 
2.31.1


