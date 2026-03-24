Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC95FEC0EA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:15:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2748.1774372520937031572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lKURBq8z;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so41767685e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372519; x=1774977319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMX+t4F6Amb+GzrS7BV1nHB/fJ4dSMO10/ahoKaS84M=;
        b=lKURBq8zSigzVrd3Ftr/p2/L/bHg40MUYx3hNzaJtTHAM61DTLFhVfRkfMvFA16/5h
         pA9AV1pyMWzm1tm5uKExaUnEs7FcLnRqQA2Nm2GTyORX3qdyHwxBwvaM61NGbakBvLdA
         kxNbbGITJ3WgWxRvW9CNl3NjmTpJeb+LOHSoH265bsPt7lEX9W2E7CNSIp3wDQifAElw
         PaWW9XkHBUzJGR2xpzbGTJcQHnOK+HCiwdIIiDj8KeIl011y1Wsvz5W1g9Xw78xVvOdv
         jXq15wK78RZmntuo/UP8bOOxr0trH1pLK/+39ThxK2BRINUvf9RZWvptQ/e2ag0zSynz
         2XUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372519; x=1774977319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DMX+t4F6Amb+GzrS7BV1nHB/fJ4dSMO10/ahoKaS84M=;
        b=MiYM9dxbM87A09Pr46lG/cqCOXUdrPNlTH4cGpWRlKUxnhST51WBWDfD075rRbpnyK
         ToGwswUQ0s+78Tk9115B5/KnfHWXj1JBpBmG27z6C8wSmy4mhtyiBGErNXtt7Ieb8Q6p
         inU+dZnmjdMmHHYG2BtZROfpgw385a8xroDf5CcapZUlkek5ykhNcT5TLFOUfZburFB6
         FUZGU50p6AqRHM0m1cxub1A1aL0N4Tojl91XqWzrGLhvHlbwYyn9BMqmhNHAMUdV3bAC
         +52cyVIL3V9Q0Ii8QuceVrvYuBQZi9loXU/SBBgODxdasmaniUV5L9qNQSvjDm/tT+Jw
         J6Pw==
X-Gm-Message-State: AOJu0Yw95J2cHxR/T8TDLMlQVPxcBZd83YLKMG8xVSMYYVATHgW8MfrC
	PczLI6oOZxfrQu9JZ2t2sZzshbVMYh55ghb6fl+BsD3dzfwtgb91eJedoxGwNyBm
X-Gm-Gg: ATEYQzzORAyaYGN40xA38YRyiUM1pMl/BkJwBXrxT4OAFdcph2nxeayWR0SB4SSvi3r
	D3OoB9VnLnyvtyegi46AOR8Rc7HtESQdO2XruN1v21DoQTBUBDiMjPdVDI+NH3SlI1jOX5RwI54
	8dGvPzSkdpqxTBwW+iXcA2HaV/ybfm71dHvsYBF/cF4QDb9urspEpac+hhjrYWdcp0zw/buy4ba
	OL3ncpXKZrDZjI5SGVWwMwT7/IO9tr5oXiw7lN7niHS/eMJdr7fkDnfmZ2K/+W1lmkn878mH92J
	ep8pQtWSY3SkpM1BTNWYrtYvObEwum87DkQVN8cUYsE2FatdVAZt1LLspzAHOZsXMiPc/yM+VWt
	Azb8xqCGPG/OjPDeKOzh/odbm8IUqXGAlxbppWGTBJGePaygrLBA85m/XxOYVCvVepVKYSoHfWq
	0AHRxC2LpT2fs7zkClPx8M5Bs14+ebrWzxbURyEKK6xTX2FxOAKrWNkkV+nBnW51AbOhmSQ2/o2
	HyY5eGTM9rWeSv2qxzGQT7NAA==
X-Received: by 2002:a05:600c:8106:b0:485:34b3:8589 with SMTP id 5b1f17b1804b1-487160a5deamr8704745e9.31.1774372518873;
        Tue, 24 Mar 2026 10:15:18 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165bea11sm2168665e9.1.2026.03.24.10.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:15:18 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v16 4/5] spdx30: Add Git version and PURL to source downloads
Date: Tue, 24 Mar 2026 18:15:01 +0100
Message-ID: <20260324171502.689012-5-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233818

Enrich Git source download packages in the SPDX 3.0 output with:
- software_packageVersion set to the full SHA-1 commit hash
- software_packageUrl set to a PURL for known Git hosting services
- VCS external reference pointing to the repository URL

The PURL generation recognizes github.com by default and supports
additional hosting services via the SPDX_GIT_PURL_MAPPINGS variable
(format: 'domain:purl_type', e.g. 'gitlab.example.com:pkg:gitlab').

Only Git source downloads are enriched. Non-Git downloads are left
unchanged since their ecosystem PURLs are already set on the recipe
package by SPDX_PACKAGE_URLS from the previous patch.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass |   7 ++
 meta/lib/oe/spdx30_tasks.py          | 102 +++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 9a6606dce6..432adb14cd 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -156,6 +156,13 @@ SPDX_RECIPE_SBOM_NAME ?= "${PN}-recipe-sbom"
 SPDX_RECIPE_SBOM_NAME[doc] = "The name of output recipe SBoM when using \
     create_recipe_sbom"
 
+SPDX_GIT_PURL_MAPPINGS ??= ""
+SPDX_GIT_PURL_MAPPINGS[doc] = "A space separated list of domain:purl_type \
+    mappings to configure PURL generation for Git source downloads. \
+    For example, 'gitlab.example.com:pkg:gitlab' maps repositories hosted \
+    on gitlab.example.com to the pkg:gitlab PURL type. \
+    github.com is always mapped to pkg:github by default."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 51e10befba..cd9672c18e 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -14,6 +14,7 @@ import oe.spdx_common
 import oe.sdk
 import os
 import re
+import urllib.parse
 
 from contextlib import contextmanager
 from datetime import datetime, timezone
@@ -384,6 +385,105 @@ def collect_dep_sources(dep_objsets, dest):
             index_sources_by_hash(e.to, dest)
 
 
+
+def _generate_git_purl(d, download_location, srcrev):
+    """Generate a Package URL for a Git source from its download location.
+
+    Parses the Git URL to identify the hosting service and generates the
+    appropriate PURL type. Supports github.com by default and custom
+    mappings via SPDX_GIT_PURL_MAPPINGS.
+
+    Returns the PURL string or None if no mapping matches.
+    """
+    if not download_location or not download_location.startswith('git+'):
+        return None
+
+    git_url = download_location[4:]  # Remove 'git+' prefix
+
+    # Default handler: github.com
+    git_purl_handlers = {
+        'github.com': 'pkg:github',
+    }
+
+    # Custom PURL mappings from SPDX_GIT_PURL_MAPPINGS
+    # Format: "domain1:purl_type1 domain2:purl_type2"
+    custom_mappings = d.getVar('SPDX_GIT_PURL_MAPPINGS')
+    if custom_mappings:
+        for mapping in custom_mappings.split():
+            parts = mapping.split(':', 1)
+            if len(parts) == 2:
+                git_purl_handlers[parts[0]] = parts[1]
+                bb.debug(2, f"Added custom Git PURL mapping: {parts[0]} -> {parts[1]}")
+            else:
+                bb.warn(f"Invalid SPDX_GIT_PURL_MAPPINGS entry: {mapping} (expected format: domain:purl_type)")
+
+    try:
+        parsed = urllib.parse.urlparse(git_url)
+    except Exception:
+        return None
+
+    hostname = parsed.hostname
+    if not hostname:
+        return None
+
+    for domain, purl_type in git_purl_handlers.items():
+        if hostname == domain:
+            path = parsed.path.strip('/')
+            path_parts = path.split('/')
+            if len(path_parts) >= 2:
+                owner = path_parts[0]
+                repo = path_parts[1].replace('.git', '')
+                return f"{purl_type}/{owner}/{repo}@{srcrev}"
+            break
+
+    return None
+
+
+def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
+    """Enrich a Git source download package with version, PURL, and external refs.
+
+    For Git sources, extracts the full SHA-1 from SRCREV as the version,
+    generates PURLs for known hosting services, and adds VCS external
+    references.
+    """
+    version = None
+    purl = None
+
+    if fd.type == "git":
+        # Use full SHA-1 from fd.revision
+        srcrev = getattr(fd, 'revision', None)
+        if srcrev and srcrev not in {'${AUTOREV}', 'AUTOINC', 'INVALID'}:
+            version = srcrev
+
+        # Generate PURL for Git hosting services
+        download_location = getattr(dl, 'software_downloadLocation', None)
+        if version and download_location:
+            purl = _generate_git_purl(d, download_location, version)
+
+    if version:
+        dl.software_packageVersion = version
+
+    if purl:
+        dl.software_packageUrl = purl
+
+    # Add VCS external reference for Git repositories
+    download_location = getattr(dl, 'software_downloadLocation', None)
+    if download_location and isinstance(download_location, str):
+        if download_location.startswith('git+'):
+            git_url = download_location[4:]
+            if '@' in git_url:
+                git_url = git_url.split('@')[0]
+
+            dl.externalRef = dl.externalRef or []
+            dl.externalRef.append(
+                oe.spdx30.ExternalRef(
+                    externalRefType=oe.spdx30.ExternalRefType.vcs,
+                    locator=[git_url],
+                )
+            )
+
+
+
 def add_download_files(d, objset):
     inputs = set()
 
@@ -447,6 +547,8 @@ def add_download_files(d, objset):
                 )
             )
 
+            _enrich_source_package(d, dl, fd, file_name, primary_purpose)
+
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
                 for checksum_id in ["sha256", "sha1"]:
-- 
2.53.0


