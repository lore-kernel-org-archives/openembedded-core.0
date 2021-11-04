Return-Path: <abeltran@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C62C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 16:49:22 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.333.1636044561138964039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 09:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Hu7TFj7v;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: abeltran@linux.microsoft.com)
Received: from
 abeltran-ubuntu18-dev.memva0x40hnu5lyn52qddymqwe.xx.internal.cloudapp.net
 (unknown [20.94.235.175])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3CAF420ABA92;
	Thu,  4 Nov 2021 09:49:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3CAF420ABA92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1636044560;
	bh=NIbp2/itM7EyLejG3Dcu89xjcs3COnL71SLpOg2FfTQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Hu7TFj7v5YhLtUNdxiuE2E6jfmC+QVx0d+Lb+vT1XrbqVjk2u99TNT1fGDyf8Jls0
	 9j1hS4rGkpdhy50KsgD+BnxYPdgdyJHosU/6y9zCNSzsaiBjpJHMuHDiCAeTTWVCXd
	 E8ya5YX3lVR0e3lpKrBayc7d/baHepxTvJ7MZvxM=
From: Andres Beltran <abeltran@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Andres Beltran <abeltran@linux.microsoft.com>
Subject: [PATCH] create-spdx: Set the Organization field via a variable
Date: Thu,  4 Nov 2021 16:48:56 +0000
Message-Id: <20211104164856.2835-1-abeltran@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 16:49:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157854

Currently, the "Organization" field for SBOMs is hard-coded in
create-spdx. Create a new variable SPDX_ORG to make this field more
generic.

Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
---
 meta/classes/create-spdx.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index c35dbe11849..eb1d446f3fb 100644
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
2.17.1


