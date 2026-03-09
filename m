Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A32F3C25C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:29:26 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14156.1773062958512145936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G8IviiPZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: stondo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79907171da2so2925507b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773062957; x=1773667757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tGs98uy8Neks0w5XX342Cr5zI1u8Xh6ZbFuCmEetg8=;
        b=G8IviiPZqPyCki5IFkOnYhcHs66aDbGDbDT6rRBMIKDvNl1EDyLMom3Gc/uVyP6g0Y
         3UWtprDlYJ9c9ZTcIvTDaapGx7+AQvA9Hwzy+YrfMwFHBgu40iGjaFk+DfzblXGx0nHn
         XTQsgMnx54bTnvNzwX//PDk6KLLFGDVK2I4+jATEjfwZsxFFhVIkE4+y+ZxiH1SevOOH
         qYcUdtC4P5QpCsQ3kwIIfJ03lAg3zMJavF7jC4sF2j9XozHjsE/3KUC4uVspjPOmcrAm
         bzwW2zCmjYdYYBdHBvu18/TnAFVzySJsWydq51GHrRTUzoRiMR5k7Ck1ldK6aVwBoOKk
         asvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062957; x=1773667757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/tGs98uy8Neks0w5XX342Cr5zI1u8Xh6ZbFuCmEetg8=;
        b=UvrAZzjAKpveHSG4Tupipvz9Z1XuaYC0McTBei/j3GIlKrjrLFZwZRFS5vDpdgWrl9
         4eE9u+qFl9fboRcfB7LUQINfa6yhOb3UPo4maIvdXsodUBftFWEhD26o77QeENQD3KwH
         WuOdcwiswCCsDE7BNKeZdYLzjEDUKFdiIP2Mpl3TvF4UKlx1zq+bRqpo/e9idLnwEU47
         79HpuKPnzkleXBQe66rMILOnmtJPbYBx/WntqNVST+msg3za/gY1XYaytcZ9IovgfFiB
         s8bKJVMcQ9IAGCAPdGf3uo5w3vmrmvDHxiErYF7qgWA+XZWgIzKCmhQRoDkldC4Phw92
         FLLw==
X-Gm-Message-State: AOJu0Yz4crYpMpCVl2gqTg/9zVkRlqW/d4gYEp6acai/kdStMFmPTWCV
	g31jzSuEfxmu7OEgNXHtWCWtDbD4ZmQMicQmOwvxc/1bo3MlYZauIiZa7ullZw==
X-Gm-Gg: ATEYQzy9LEtP0BSe7KY/ELqoTSypbnYHoiqtzZn3JhlHIZpIwS7VTXEFu5NstSsJxLh
	rvHjlEKPSQzBPQtJcj9Rp2BGUiUHR4KHBaZiKz1nBwbjmy2WyjtpISdCe60ObleAZRXi/BXcDGD
	Q3LcgdDZQKuLqTdSi82OBCGa3DcC3X35ekIyEqCh20TQNORtniRaO150TZHyH5DbMoZY5s+ljc8
	Vvczxo1YBNgb19H2d06hkwCNpUYeGFqcR+0MB6CG7NNaS9Nwhm4BdxA9mQ3+QvH0hIB3yWyX/0H
	XQw7LYGBuiCWFVLPpAkovux1snX7Zt13j4RlT9f1uMTN7Vl31h6FXoAJqxMzstRFOZl7ntlrfzS
	SE9FbKiaSHhVubipGYE+X6tC5KszRuq4YZhlPdEXhu7FBZg6jXFXRHnNdpa+jRWJsZuxltNT6Ri
	gDUI++lE6jowLeUFvomaw0VWD4BRmpcnxJDMpSes6EaVOSIL9NN+EYTFSILDybbXQvoqn4ZYUfy
	SxEBTXE
X-Received: by 2002:a05:690c:6905:b0:798:68d8:4aa4 with SMTP id 00721157ae682-798dd6ceb4dmr102433327b3.24.1773062957423;
        Mon, 09 Mar 2026 06:29:17 -0700 (PDT)
Received: from fedora (mob-194-230-161-149.cgn.sunrise.net. [194.230.161.149])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee6afd5sm44299437b3.45.2026.03.09.06.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:29:17 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v8 4/7] spdx30: Enrich source downloads with version and PURL
Date: Mon,  9 Mar 2026 14:28:51 +0100
Message-ID: <20260309132854.128375-5-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309132854.128375-1-stondo@gmail.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232713

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add version extraction, PURL generation, and external references
to source download packages in SPDX 3.0 SBOMs:

- Extract version from SRCREV for Git sources (full SHA-1)
- Generate PURLs for Git sources on github.com by default
- Support custom mappings via SPDX_GIT_PURL_MAPPINGS variable
  (format: "domain:purl_type", split(':', 1) for parsing)
- Use ecosystem PURLs from SPDX_PACKAGE_URLS for non-Git
- Add VCS external references for Git downloads
- Add distribution external references for tarball downloads
- Parse Git URLs using urllib.parse
- Extract logic into _generate_git_purl() and
  _enrich_source_package() helpers

The SPDX_GIT_PURL_MAPPINGS variable allows configuring PURL
generation for self-hosted Git services (e.g., GitLab).
github.com is always mapped to pkg:github by default.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass |   7 ++
 meta/lib/oe/spdx30_tasks.py          | 122 +++++++++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index def2dacbc3..9e912b34e1 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -152,6 +152,13 @@ SPDX_PACKAGE_URLS[doc] = "A space separated list of Package URLs (purls) for \
     Override this variable to replace the default, otherwise append or prepend \
     to add additional purls."
 
+SPDX_GIT_PURL_MAPPINGS ??= ""
+SPDX_GIT_PURL_MAPPINGS[doc] = "A space separated list of domain:purl_type \
+    mappings to configure PURL generation for Git source downloads. \
+    For example, "gitlab.example.com:pkg:gitlab" maps repositories hosted \
+    on gitlab.example.com to the pkg:gitlab PURL type. \
+    github.com is always mapped to pkg:github by default."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c3a23d7889..1f6c84628d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -13,6 +13,7 @@ import oe.spdx30
 import oe.spdx_common
 import oe.sdk
 import os
+import urllib.parse
 
 from contextlib import contextmanager
 from datetime import datetime, timezone
@@ -377,6 +378,125 @@ def collect_dep_sources(dep_objsets, dest):
             index_sources_by_hash(e.to, dest)
 
 
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
+    """Enrich a source download package with version, PURL, and external refs.
+
+    Extracts version from SRCREV for Git sources, generates PURLs for
+    known hosting services, and adds external references for VCS,
+    distribution URLs, and homepage.
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
+    else:
+        # For non-Git sources, use recipe PV as version
+        pv = d.getVar('PV')
+        if pv and pv not in {'git', 'AUTOINC', 'INVALID', '${PV}'}:
+            version = pv
+
+        # Use ecosystem PURL from SPDX_PACKAGE_URLS if available
+        package_urls = (d.getVar('SPDX_PACKAGE_URLS') or '').split()
+        for url in package_urls:
+            if not url.startswith('pkg:yocto'):
+                purl = url
+                break
+
+    if version:
+        dl.software_packageVersion = version
+
+    if purl:
+        dl.software_packageUrl = purl
+
+    # Add external references
+    download_location = getattr(dl, 'software_downloadLocation', None)
+    if download_location and isinstance(download_location, str):
+        dl.externalRef = dl.externalRef or []
+
+        if download_location.startswith('git+'):
+            # VCS reference for Git repositories
+            git_url = download_location[4:]
+            if '@' in git_url:
+                git_url = git_url.split('@')[0]
+
+            dl.externalRef.append(
+                oe.spdx30.ExternalRef(
+                    externalRefType=oe.spdx30.ExternalRefType.vcs,
+                    locator=[git_url],
+                )
+            )
+        elif download_location.startswith(('http://', 'https://', 'ftp://')):
+            # Distribution reference for tarball/archive downloads
+            dl.externalRef.append(
+                oe.spdx30.ExternalRef(
+                    externalRefType=oe.spdx30.ExternalRefType.altDownloadLocation,
+                    locator=[download_location],
+                )
+            )
+
+
 def add_download_files(d, objset):
     inputs = set()
 
@@ -440,6 +560,8 @@ def add_download_files(d, objset):
                 )
             )
 
+            _enrich_source_package(d, dl, fd, file_name, primary_purpose)
+
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
                 for checksum_id in ["sha256", "sha1"]:
-- 
2.53.0


