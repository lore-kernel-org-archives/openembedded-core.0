Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A90FC72D2
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:14:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2731.1774372491501612998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lubQWkSG;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48538c5956bso916785e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372489; x=1774977289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMX+t4F6Amb+GzrS7BV1nHB/fJ4dSMO10/ahoKaS84M=;
        b=lubQWkSGDzCGOYIjw1YhIzCzGn0ILfcpqmS/0yUhOuof1ypEzuCPpTTcPeZ1+9Vxsi
         lVsOb6vWv1Jl/qUAXL0cX1bC/8o/j934zfoniEJX1B4zP6SbGRePelZscLbharcc6pnp
         yfbpHcUiwtvHoLLEoSagonVENzBCXQfgtmPwayE6S6srYoDtkwqNzAyZ+9wN6e2XkdeB
         TD+fYUnrzoli5mU8lN/nMH8nkvBFSPpMZ8axIJgXLT3LzIBgWEVHX2NqPYGAgZPJjVr7
         na4pqLjfzK+xslmbW3PEZyyiZ+9zvbDr3ogIV5TEfE7kPiwZITsffpHnijXw97+gR2Fy
         xR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372489; x=1774977289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DMX+t4F6Amb+GzrS7BV1nHB/fJ4dSMO10/ahoKaS84M=;
        b=An/tTYJj2paDc1SCpsaF7eZEcLIrtW8A9Ab/unFcg+NloaZt1rNCLhzQfN3ttdfISI
         zyo7O87/cycFyGGxF8fFvQyxbBxMy0kHzBeIEdLcs0+MRkL1Uboflaq1ntZNXeM6FtSq
         MzK6IyCheeqEC0of56pH9xmVZJ1iXK8b/SlIEDrhC10f9jgnccbrCuLysJB/3JgokXw9
         OVe8GgqLXwxJPsHtzqvG+tHlg0JxHEAC0gAfBMh8n9muSkPQcNalt0ZL+aOYHYsd+zQn
         oreLsWTctMr0HenMVprJZW4VL5HPTltt0SNGlkX/CADOtVkOkkYn9A3Ep5Az1ant1btJ
         aLsQ==
X-Gm-Message-State: AOJu0YwGPov+0gxCDqCrJfaMGiHdXk0UjWhBaK8S0XWN8b+8sXJLugS0
	Wf98QKfaXuPy74GLNLwMzJKF70ugh9VCrTgXB1bzDec54V4cJG1dqQHHfgxq+2Dt
X-Gm-Gg: ATEYQzzDdoBvMTWDSypgqUC9/TBLvghsV21brvhHIs8LO3po9RoDBSPnBlLhmYy9kSI
	XlmI3dQbtmimYXpaaZ+fReVIfiH0oj38sgs4w+WCleLkdxAx5pzoolpP42hYq+marmNSOSp2Pc9
	OjfqPtJ99Un6DJIkDWkCePQybVMLvw4jc1L8M2a2jOC1kBSeipHYDdAiWGyqAbp+7IaMiYW2Hhw
	mgayw5eWv9GBXw7Mf1akdVioHqHrf1gNH5+EFMw/x7mzrKhxrJr1S0egE7Q6O3CqeyIR8j7fr6j
	aIJD519tPE4YHZpBV6MjvPqvTEQ4vBgZZky6+9FNgbNQ4iqFtXSLLFEykjkZCTpCiV30UM9KIPT
	8RZrHtyricSE88troOCD2lu/YC1vxLEDwMrElOWzhOqJ+Whsy6zgVLv/1M5MG1z7mQUcANKSxka
	QDlbLJGtPCTTMzgNVZVZScFRN6vIpPI3Hc6Jzsf+euTYMCS7m4plTtC0t168vBo9nZ8JGASX9de
	IgaptrTqNravt/UP47/cOqFkQ==
X-Received: by 2002:a05:600c:888c:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-4871608eb93mr6389665e9.12.1774372489052;
        Tue, 24 Mar 2026 10:14:49 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165e8e0csm1089275e9.1.2026.03.24.10.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:14:48 -0700 (PDT)
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
Date: Tue, 24 Mar 2026 18:12:45 +0100
Message-ID: <20260324171246.686862-5-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233812

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


