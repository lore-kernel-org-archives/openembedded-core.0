Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E20C5DF8E
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:25:43 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14462.1771647938315894173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=atd5Ks4L;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-483703e4b08so21402945e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647936; x=1772252736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UYYWdsKr2SkvqX4m0uGeBX4aucuRtJ9r6NizJ+089I=;
        b=atd5Ks4LRT7bKkjxksYC2aiK1HLd4aRTja2ish6vXV5ySfTmPSzox+MnCXUpSxDUm7
         veyIQyvFfBlh9kpRpkiR2rpKcU3VkTI1vSXxJqQ0iCKtTzL/Pff+6LrOQRkiF1ZarMWl
         eMFczcvwMJ9r5oYiFr05B4lToPs1mHvJDf5lvMs1aC0MSRUwQ8zUjWyPGHM5iOuTwnLG
         x52vp2jZuolOFqNGLOieZji6xJPZuD8fj3caXISsvrYAGPXSGc7i7MONTwwVXYAkEw96
         ofyKWY+n6A+Bfq6o/1XFiM7D0LB2SKV949qgSezEhBXxJMPd7V219ibgjvhGiydpeKoP
         8ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647936; x=1772252736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/UYYWdsKr2SkvqX4m0uGeBX4aucuRtJ9r6NizJ+089I=;
        b=S4gHw9uUrTmBF/18HjTAMaJd2o9Zb0RIoP0vHYPeV2jPfU2YhtlC8QfyMMXjdQB6SI
         1EWgdAJX8vSInFU6ZB/CMZQuYpNmznL6p915aUryEZ0qoy5BpWHNaynx8CMJEII5Ty0R
         GBy9ykuSMxbsSDW0cXjUntarY9QvCNCIQeNRnH0EkeVakKChqTyDSxy34emJWTTjW006
         1leGhDcrpVm/SsaqvGMQKuqOcQHaScpdjknkDZSlIBSF7b/OKemYEdszeiprXn4vlgz2
         VHMiglD3kwaSbragmVpCp7WpRDEUlisyGTmXYYwVpZOm/Y3vkGdC5xNvUOlvM94TpNdw
         IOqA==
X-Gm-Message-State: AOJu0YySQ+UOS4tXDQK9ANaZ29xOqnXFUsJuSiFMFYuxdhYQwODhVzLr
	PnDlNqCwFgUrYtSg6QwmtnlzT4g4Nseda/g4yR46IexRwhYOvcxJk2qLjTdebTTN
X-Gm-Gg: AZuq6aIrXA4DxhOxs7yHlEjnn/0B6pRzbTe+/3hJpN3CD5X6R2r4Nr2n5K237q16hcd
	CrwPPqsN73S117Glg4VNfcL2TLiXPZKXhCdtUDXvuRd1MNDZTlv0kuxEMeo6ymsyZaFD52KStMZ
	byCfSQZ/QZxSZ5AjODb6ABPOqltnkzklM/7J6VbmNpDlDHI9tPKunGzpZKqv5BQwx5xUt23aaTA
	3kfPHU4TIbz0rP3HLW5YOIbiLQnmR8KSFhrd9G/VqEUmEX7ac8Mixm8BsARA+l+iG8lj/zlO8e8
	zjjU3GxMnSdV7I7azrrWsXGsV0rl8UGbxu9hmfKm8Mf7fcUDynGte1+DWvau/zukLAbSfTomnjJ
	3dNw5GgCGhP29vHz7XwnWFu47bBcKB7ZtBq/6aDmZeo3UK3CplGqDpfd8nG0tXjDgkyebo6BqOa
	kN5wgBhUqNMPwMXJj5wm76BCYXZGzV9wgPZy8=
X-Received: by 2002:a05:600c:4513:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-483a94e0c15mr27489065e9.17.1771647936325;
        Fri, 20 Feb 2026 20:25:36 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb3f31sm26800745e9.13.2026.02.20.20.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:25:35 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 2/2] spdx-common: Clarify documentation and make SPDX_LICENSES extensible
Date: Sat, 21 Feb 2026 05:25:30 +0100
Message-ID: <20260221042530.318125-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042530.318125-1-stondo@gmail.com>
References: <20260221042530.318125-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231575

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This commit improves the SPDX variable documentation and enhances
SPDX_LICENSES to support layer-based license extensions.

1. SPDX_NAMESPACE_PREFIX documentation clarification:
   - Clarify that this should be organization-specific
   - Explain the default is for compatibility only
   - Provide example of production override
   - Make it consistent with SPDX_UUID_NAMESPACE guidance

2. SPDX_LICENSES documentation enhancement:
   - Clarify when this variable needs to be set
   - Document the new list behavior
   - Provide example usage with += operator

3. SPDX_LICENSES implementation as extensible list:
   - Change from single file to space-separated list of files
   - Support layer-based license extensions without file copying
   - Later files override earlier ones for duplicate license IDs
   - Backward compatible (single file path still works)
   - Add error handling for missing/invalid files

This enhancement allows layers to add custom licenses without
maintaining a copy of the base spdx-licenses.json file:

  SPDX_LICENSES += "${LAYERDIR}/files/custom-licenses.json"

This is particularly useful for organizations with proprietary or
custom licenses that need to be tracked in SBOMs.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
Cc: "Ross Burton" <Ross.Burton@arm.com>
---
 meta/classes/spdx-common.bbclass | 13 +++++++++----
 meta/lib/oe/spdx_common.py       | 31 +++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index b8961262f9..024f24c837 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -42,7 +42,10 @@ SPDX_UUID_NAMESPACE[doc] = "The namespace used for generating UUIDs in SPDX \
 
 SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
 SPDX_NAMESPACE_PREFIX[doc] = "The URI prefix used for SPDX document namespaces. \
-    Combined with other identifiers to create unique document URIs."
+    This should be a domain name or URI prefix unique to your organization to ensure \
+    globally unique document URIs. The default 'http://spdx.org/spdxdocs' is provided \
+    for compatibility but should be overridden in production environments (e.g., \
+    'https://sbom.example.com')."
 
 SPDX_PRETTY ??= "0"
 SPDX_PRETTY[doc] = "If set to '1', generate human-readable formatted JSON output \
@@ -50,9 +53,11 @@ SPDX_PRETTY[doc] = "If set to '1', generate human-readable formatted JSON output
     Pretty formatting makes files larger but easier to read."
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
-SPDX_LICENSES[doc] = "Path to the JSON file containing SPDX license identifier \
-    mappings. This file maps common license names to official SPDX license \
-    identifiers."
+SPDX_LICENSES[doc] = "Space-separated list of JSON files containing SPDX license \
+    identifier mappings. Files are processed in order, with later entries overriding \
+    earlier ones. This allows layers to extend the base license set without copying \
+    the entire file. Set this variable in your layer when using licenses not known \
+    to oe-core (e.g., 'SPDX_LICENSES += \"${LAYERDIR}/files/custom-licenses.json\"')."
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 SPDX_CUSTOM_ANNOTATION_VARS[doc] = "Space-separated list of variable names whose \
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 72c24180d5..8a6cf70fc1 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -42,10 +42,33 @@ def is_work_shared_spdx(d):
 
 
 def load_spdx_license_data(d):
-    with open(d.getVar("SPDX_LICENSES"), "r") as f:
-        data = json.load(f)
-        # Transform the license array to a dictionary
-        data["licenses"] = {l["licenseId"]: l for l in data["licenses"]}
+    """
+    Load SPDX license data from one or more JSON files.
+    SPDX_LICENSES can be a space-separated list of files.
+    Later files override earlier ones for duplicate license IDs.
+    """
+    license_files = d.getVar("SPDX_LICENSES").split()
+
+    # Initialize with empty structure
+    data = {"licenses": {}}
+
+    # Load and merge each file
+    for license_file in license_files:
+        try:
+            with open(license_file, "r") as f:
+                file_data = json.load(f)
+                # Transform the license array to a dictionary and merge
+                if "licenses" in file_data:
+                    for lic in file_data["licenses"]:
+                        data["licenses"][lic["licenseId"]] = lic
+                # Copy over other top-level keys from the last file
+                for key in file_data:
+                    if key != "licenses":
+                        data[key] = file_data[key]
+        except FileNotFoundError:
+            bb.warn(f"SPDX license file not found: {license_file}")
+        except json.JSONDecodeError as e:
+            bb.warn(f"Invalid JSON in SPDX license file {license_file}: {e}")
 
     return data
 
-- 
2.53.0


