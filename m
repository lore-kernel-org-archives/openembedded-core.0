Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C8EC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 23:15:04 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.4305.1648077303003847235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=o8HzUNHT;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648077303;
  x=1679613303;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u6exFUmOI967kelStVjHdgluYA/4Js6X78naO8SAzag=;
  b=o8HzUNHTedPMYAiQYFxtQsAtBXY+XJkWZ4ZIVidZiIomYvekExRSXFUY
   nzYmEScXGpBVjrX4aGGntosaJrBac0BndpaltuoGSIoiA5vUPx7YJWDGR
   U/7REL+OBNtApfgU8RwVJLBHRUgp0UhIuQ8574SYQhFz8EA6C7cMvhAFX
   OM2eg6xTaGh0SKUNm1kGhHoMaJ4zlwuEZRvAuYiIYTvVkWIQfHiwY42FS
   gmT8Abu7Y1GkiI7WXW1t4m+lO2hTLkNcFpHksVFpFjgFdx4Qh+QD/yx8c
   NsCu5tH7P+NJZuAwoZjaE4ZfqMBGr84dLi6wwyhq4xa8v4E9qDRjpJ+Mj
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] create-spdx.bbclass: Simplify extraction of license text
Date: Thu, 24 Mar 2022 00:14:57 +0100
Message-ID: <20220323231458.22671-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 23:15:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163598

There is no reason to first search for all available licenses using
avail_licenses() and then search through the same paths looking for
the actual license texts. Just look for the license texts directly
instead.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/create-spdx.bbclass | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 1a4804a7c5..cae8cccd8d 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -94,7 +94,6 @@ def convert_license_to_spdx(lic, document, d, existing={}):
     from pathlib import Path
     import oe.spdx
 
-    avail_licenses = available_licenses(d)
     license_data = d.getVar("SPDX_LICENSE_DATA")
     extracted = {}
 
@@ -112,8 +111,8 @@ def convert_license_to_spdx(lic, document, d, existing={}):
         if name == "PD":
             # Special-case this.
             extracted_info.extractedText = "Software released to the public domain"
-        elif name in avail_licenses:
-            # This license can be found in COMMON_LICENSE_DIR or LICENSE_PATH
+        else:
+            # Seach for the license in COMMON_LICENSE_DIR and LICENSE_PATH
             for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar('LICENSE_PATH') or '').split():
                 try:
                     with (Path(directory) / name).open(errors="replace") as f:
@@ -122,18 +121,14 @@ def convert_license_to_spdx(lic, document, d, existing={}):
                 except FileNotFoundError:
                     pass
             if extracted_info.extractedText is None:
-                # Error out, as the license was in avail_licenses so should
-                # be on disk somewhere.
-                bb.error("Cannot find text for license %s" % name)
-        else:
-            # If it's not SPDX, or PD, or in avail_licenses, then NO_GENERIC_LICENSE must be set
-            filename = d.getVarFlag('NO_GENERIC_LICENSE', name)
-            if filename:
-                filename = d.expand("${S}/" + filename)
-                with open(filename, errors="replace") as f:
-                    extracted_info.extractedText = f.read()
-            else:
-                bb.error("Cannot find any text for license %s" % name)
+                # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be set
+                filename = d.getVarFlag('NO_GENERIC_LICENSE', name)
+                if filename:
+                    filename = d.expand("${S}/" + filename)
+                    with open(filename, errors="replace") as f:
+                        extracted_info.extractedText = f.read()
+                else:
+                    bb.error("Cannot find any text for license %s" % name)
 
         extracted[name] = extracted_info
         document.hasExtractedLicensingInfos.append(extracted_info)

