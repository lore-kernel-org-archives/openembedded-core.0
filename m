Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.8127.1630503930057232067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xftdw3OT;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so3492367otf.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oRJXqSoYVbf1v6TquJl+NRkt9a1BtoOM8n+GCfoMtoo=;
        b=Xftdw3OT2VKFC7YI/kOchm7xSCvtfVQ/3tmyNPBF5tLTq3KjmXj6KeDQgY1oAl0uld
         RIGUuChZjKaQBhQHWsHHQMnRiCnllJgmGTaJCQgrfEUTNhO+t/OS6dPfV7kU+ph7/rx7
         mZ7y6+qROllBtYhBJv7i+jE55u61xr8pnrG4vq8scSsohYkyS8G9cEggyGuAukIJ8ixq
         WTTRGwIYH18lCfvLyDZTIFMZU3JPLBGdjhjAUTCsqyuXg2iUUBTUQpiKn0Vklmf1z2Zt
         sv27o2RxxJDW3wLm9RkIKBY+1CRTz0z2bhdNtwIsQ3gSWM2VcCaiK5vI+sejOEvLBT2Z
         IKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oRJXqSoYVbf1v6TquJl+NRkt9a1BtoOM8n+GCfoMtoo=;
        b=GgD/EBSxqdmMB6UdlfCLFXT0aP6unDU+ZLINhPBFW/448jvwiwoLUu4nNiLOiQilRI
         oJc0/ZweyIS4ftzuNORGG25mmiNX8Lmjcwrmd9Wos2TuKOdMv7g4BiZsmAp6mrZiflV+
         g+hZYnMfOX4QBv3D/GoC4VAqYZVz6N0dCSON6OTJJdxvZFF4n1b5aKMPClLqf+HAmx+v
         fLZEXrGTVdRKeElLl7Iv5aF0Q6y2t8fKhz6unAiW+giBV/NTIMdLkGGAwdge1/AqflfW
         n+Kh9HGmscJLf89oXpVImx+oHy7g7nfacFhHMsVVV75rVT6ArniUJ9jPsWkeLEreIAmW
         SiSg==
X-Gm-Message-State: AOAM533ornwWBJlGNRFwTJpn+BzGDRF/QgWk/zW8cJHNaWomt5pzdYgm
	j7VzfoHgaf3zleU63VmiyJpoTub0RlA=
X-Google-Smtp-Source: ABdhPJzRf98CrGFczBn/R0Vkfai/Hm1SrzzUuxZEr8yOw7Q7RZvzP0RkzyijRPT+SNz26YcjcWpxMQ==
X-Received: by 2002:a05:6830:25d3:: with SMTP id d19mr28604899otu.357.1630503929042;
        Wed, 01 Sep 2021 06:45:29 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:28 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 11/31] classes/create-spdx: Fix up license reporting
Date: Wed,  1 Sep 2021 08:44:50 -0500
Message-Id: <20210901134510.29561-12-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Licenses reported in the SPDX documents should be either:
 A) A valid SPDX identifier cross referenced from the SPDX license
    database
 B) A "LicenseRef" to a license described in the SPDX document

The licensing code will now add a placeholder extracted license with
corresponding "LicenseRef" for any licenses that are not matched to the
SPDX database

Parenthesis in the license expression are now handled correctly

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 55 +++++++++++++++++++++++++++-----
 meta/lib/oe/spdx.py              |  8 +++++
 2 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 72c1385feb..2e13b19b5b 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -23,6 +23,8 @@ SPDX_ARCHIVE_PACKAGED ??= "0"
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
 
+SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
+
 do_image_complete[depends] = "virtual/kernel:do_create_spdx"
 
 def get_doc_namespace(d, doc):
@@ -36,21 +38,54 @@ def is_work_shared(d):
     return bb.data.inherits_class('kernel', d) or pn.startswith('gcc-source')
 
 
-def convert_license_to_spdx(lic, d):
+python() {
+    import json
+    if d.getVar("SPDX_LICENSE_DATA"):
+        return
+
+    with open(d.getVar("SPDX_LICENSES"), "r") as f:
+        d.setVar("SPDX_LICENSE_DATA", json.load(f))
+}
+
+def convert_license_to_spdx(lic, document, d):
+    import oe.spdx
+
+    license_data = d.getVar("SPDX_LICENSE_DATA")
     def convert(l):
+        if l == "(" or l == ")":
+            return l
+
         if l == "&":
             return "AND"
 
         if l == "|":
             return "OR"
 
-        spdx = d.getVarFlag('SPDXLICENSEMAP', l)
-        if spdx is not None:
-            return spdx
+        spdx_license = d.getVarFlag("SPDXLICENSEMAP", l) or l
+        for lic_data in license_data["licenses"]:
+            if lic_data["licenseId"] == spdx_license:
+                return spdx_license
+
+        spdx_license = "LicenseRef-" + l
+        for spdx_lic in document.hasExtractedLicensingInfos:
+            if spdx_lic.licenseId == spdx_license:
+                return spdx_license
+
+        bb.warn("No SPDX License found for %s. Creating a place holder" % l)
+
+        spdx_lic = oe.spdx.SPDXExtractedLicensingInfo()
+        spdx_lic.name = l
+        spdx_lic.licenseId = spdx_license
+        # TODO: Extract the actual license text from the common license files
+        spdx_lic.extractedText = "This software is licensed under the %s license" % l
+
+        document.hasExtractedLicensingInfos.append(spdx_lic)
+
+        return spdx_license
 
-        return l
+    lic_split = lic.replace("(", " ( ").replace(")", " ) ").split()
 
-    return ' '.join(convert(l) for l in lic.split())
+    return ' '.join(convert(l) for l in lic_split)
 
 
 def process_sources(d):
@@ -334,6 +369,7 @@ python do_create_spdx() {
     doc.documentNamespace = get_doc_namespace(d, doc)
     doc.creationInfo.created = creation_time
     doc.creationInfo.comment = "This document was created by analyzing recipe files during the build."
+    doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
     doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
     doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
     doc.creationInfo.creators.append("Person: N/A ()")
@@ -353,7 +389,7 @@ python do_create_spdx() {
 
     license = d.getVar("LICENSE")
     if license:
-        recipe.licenseDeclared = convert_license_to_spdx(license, d)
+        recipe.licenseDeclared = convert_license_to_spdx(license, doc, d)
 
     summary = d.getVar("SUMMARY")
     if summary:
@@ -422,6 +458,7 @@ python do_create_spdx() {
         package_doc.documentNamespace = get_doc_namespace(d, package_doc)
         package_doc.creationInfo.created = creation_time
         package_doc.creationInfo.comment = "This document was created by analyzing packages created during the build."
+        package_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
         package_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
         package_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
         package_doc.creationInfo.creators.append("Person: N/A ()")
@@ -441,7 +478,7 @@ python do_create_spdx() {
         spdx_package.SPDXID = oe.sbom.get_package_spdxid(pkg_name)
         spdx_package.name = pkg_name
         spdx_package.versionInfo = d.getVar("PV")
-        spdx_package.licenseDeclared = convert_license_to_spdx(package_license, d)
+        spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d)
 
         package_doc.packages.append(spdx_package)
 
@@ -561,6 +598,7 @@ python do_create_runtime_spdx() {
         runtime_doc.documentNamespace = get_doc_namespace(localdata, runtime_doc)
         runtime_doc.creationInfo.created = creation_time
         runtime_doc.creationInfo.comment = "This document was created by analyzing package runtime dependencies."
+        runtime_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
         runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
         runtime_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
         runtime_doc.creationInfo.creators.append("Person: N/A ()")
@@ -720,6 +758,7 @@ python image_combine_spdx() {
     doc.documentNamespace = get_doc_namespace(d, doc)
     doc.creationInfo.created = creation_time
     doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
+    doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
     doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
     doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
     doc.creationInfo.creators.append("Person: N/A ()")
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 3f569c6862..9814fbfd66 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -189,6 +189,13 @@ class SPDXExternalDocumentRef(SPDXObject):
     checksum = _Object(SPDXChecksum)
 
 
+class SPDXExtractedLicensingInfo(SPDXObject):
+    name = _String()
+    comment = _String()
+    licenseId = _String()
+    extractedText = _String()
+
+
 class SPDXDocument(SPDXObject):
     spdxVersion = _String(default="SPDX-" + SPDX_VERSION)
     dataLicense = _String(default="CC0-1.0")
@@ -200,6 +207,7 @@ class SPDXDocument(SPDXObject):
     files = _ObjectList(SPDXFile)
     relationships = _ObjectList(SPDXRelationship)
     externalDocumentRefs = _ObjectList(SPDXExternalDocumentRef)
+    hasExtractedLicensingInfos = _ObjectList(SPDXExtractedLicensingInfo)
 
     def __init__(self, **d):
         super().__init__(**d)
-- 
2.32.0

