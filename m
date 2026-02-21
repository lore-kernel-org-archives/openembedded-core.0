Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA31CC61CE0
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:43 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14933.1771650643236808456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LIrxhC7u;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-4358fb60802so2015739f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650641; x=1772255441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Md0UM8fLP7onI7AYUrltQQfh1doknoNKc5VRGgnDgHU=;
        b=LIrxhC7ub5LftdvNzmt8lNzUFchAwZEzO0jpEK62vWJfUM9aYAMKUXSUxbKVjzwerU
         78ynfky76DzEBhEaNQIcrAQ0nWW/mbgUNgVbYKpdVJhfGzvVoPy7ZISacJigqGRkaBql
         Tmgw4Oas1jo/02+zlHdnRPcQaDcK5Pq2iuhObVEQVGg4LHQUNhgH128QbyJBA/qcfZhu
         whRjsXnEffKZ0sX6fWT6vm9nxjKUvlWnarUNmJaUc1Yj4WDZcrx6oOP3gMk90xqK5Y+9
         uMM/Zgj9dhVfwrzdhoQHrpwwADKakjuLtfK6Nw52SBBvv8etMVcFx5aJ3olz7xuM73mG
         Lexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650641; x=1772255441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Md0UM8fLP7onI7AYUrltQQfh1doknoNKc5VRGgnDgHU=;
        b=crxHjGZbhKui8jwoPFkEEbE2XaZMFBmd1lKoiYSsJZzr6giL7RX4PuG0cIA1G8Nn/I
         irUCx4E1GtzypvdG7KnSJRR0/lR/lzOub5XxkHWEMg3zUiEXefx6JQwt9Zqd3QsJt+Ob
         t5E3iZpENR8WQTsbQsvte6bWmiuxCgg6tBvNNkNzZoNnXVIH4T5PTCCzJ3Q7rUYw4dNS
         ILVURN+1fM9GRCwWgiebGnTBdvT9/GxUSASP+XKH4MP1W6ZZrYfWIEzZqbpQ4bixmHh8
         GY8EVdDXyas0KGLzOXdT/cU0IfpY+08o0Jf5v7HGuyQMMujQ8eFeakNMGXW6OZe3OGfO
         OR5A==
X-Gm-Message-State: AOJu0YyEFywQoi+9Hn9b6LBqQB0jMQXoQZmhRvT6JDZrtP7QiyIMbDVV
	5r8kzZ8q0VX1YzHNz55Utn9cibnMZCUuSy+B2JRxV/FnXqedfZICUftKRQRLSmv6
X-Gm-Gg: AZuq6aL6OgrZH1Guf/97Q+0xDE5M8Q3jCGHD8xzHV+jc1KDe6CK09fJa3wEuX3UfRzK
	38fXtlnF1erKqPNgwaP14k7MvabHMn/+En1oArchu0I5wzbqJmEIPROoEVRkNh47WCqlb+8jYfE
	4qqarrV/inwlZHB7TE3W0JsH8ZyT2MuqViKegu013Y/mIwKrYj6Mhf7UTofeYHCyA4AhcGkMsus
	l3lhrvSl2e1zEPG3Y/SPNCiEFcm6ALfI5RPw/yAgk/X4c2z1cYI5PCPRZcQX1X76z2AZcR6EjK4
	Quqha4Y6RIrZ4uP2zyX96bk/Lz0W6JAjJsukX7pX+7kH1PGz2pTYwxYwgSkWoI8rOVzKF9BOkEl
	FH9N/Lpl4EKPsk3uiVlxXkwNlsO8kH1yw3JoTL6RVptxRt//uZSk9BzQxcDO21iCCJVvq9gHQLh
	1u3qWOcexD69Pqr4Ug2d8MEm7ln/yUv/EMyGk=
X-Received: by 2002:a05:6000:26ce:b0:435:9e32:2b85 with SMTP id ffacd0b85a97d-4396274eee6mr14229706f8f.29.1771650641242;
        Fri, 20 Feb 2026 21:10:41 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:40 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 18/18] spdx-common: Clarify documentation and make SPDX_LICENSES extensible
Date: Sat, 21 Feb 2026 06:10:06 +0100
Message-ID: <20260221051006.335141-19-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231598

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
---
 meta/classes/spdx-common.bbclass | 13 +++++++++----
 meta/lib/oe/spdx_common.py       | 31 +++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 3d13650962..a6872fb55b 100644
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


