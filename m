Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C49BFCE063
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:19:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68607.1772108330301042529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EsbMbv9U;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso7553615e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108328; x=1772713128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLkA5uun3Hvu/RL/d8vFTxjeT4/B/G3tV4FDmTnhcFc=;
        b=EsbMbv9UH0FAkLUN6wnhm7y9aKcLCWIumkN9wvQkzsTY+xJ8XkDlxy10ynoaBKoti2
         bd59inUsfzLhko6VkGuit7hE49ZsYis8F0jjH7UBk1caVDzyL5eCRFhXepNMR9VqkLeY
         GAkAZ4BpzefdPApadHMGkFrLBEoqTfocbVwWFFfxMzQu/m1NkraI1O5C6JTMfb8THEjN
         bjcB6TdrkJ6VbESMu5iEqgELXRoiEOQw0e03h3+8OAUU4OAFujQhVFUY1LeKt/cbNFMQ
         MjEXV1n0g/+5mBNE/0zNS1FSs7vDdkalEZo6iKO53/9WbgsMDp8uMc80pupgrDOa6YNT
         Sh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108328; x=1772713128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLkA5uun3Hvu/RL/d8vFTxjeT4/B/G3tV4FDmTnhcFc=;
        b=il9AkUQo2HEZuaZfl0HhlpNYbM5XjADeiTVY0Dshe3jxx2ay5oqGIagj7VlBBI5Ufq
         pzT+PH4Ja2oyBPookshUBxl0TCkW6xHI2BYKqPBYh7nDLV1CPTOEBC/O9xM0faBJ/mte
         1L0wgX8QTuKAjOZJhPaQ+BUXy7miVscVTkqP72hi0zZR4dheBpG3tnbvxjLqMFRCLkIx
         zOExgVNWNwsPptAcNASC6iSG8fW4/opHFHWAQUFnkqO1OLxbWMpMpbCMYACC8kRaJBTr
         7XuvzUH1IwbbIGWtolEjCB/S++ympCoO6XWMqHSBWlrzuyQu5iGrl4IIrwW77sa2vDtF
         tWAg==
X-Gm-Message-State: AOJu0YyU4gya9+hBeOpoHumvEaVUTzKhgLkhyJJbZuWNWeosikOYES5L
	fu9SVtdenWmTKa+OO0B1rPL1AlJfUl5eRbf+H0ZKsGY7ZgKGzXMxPpkGgPBc7Q==
X-Gm-Gg: ATEYQzwC26Wu9pPHobRgnBjaTgtuVoJog13+kZFeiUFQNtMvptRRcPdo/uSD8Wy4neu
	BWV3voHYl8OkTLqkHoYLT/c2JNDgizjHLdcAX9KHAGJUOesL631iiydcrKrYXLH6e1dYEQairkj
	j+ZxW77cBSOqUC6gxrAPmcDtE/k9XDTVeyuhwgN6vEmIXXq8gmmgrx3TgwkCmsc/HFhUJjSbHiB
	/sbngDjcXxPS7Uz15XGJbU1EEi3GsVUvhHJI6LHTMZP9Zbwp90CvBIhgOBSNN7XBSMgOvGsHPQy
	5syr+/ubDiRZoImiFeTNYO/YezXhvfSMl7Sl+7mlZ3VXMvVVUz9HTAuag9YM1udzTvGuO9xCFGF
	xZV2LQsckhBHU86KeAAptRg8wwFyycZhy7Zh/XmGl074+oBDVpysYtv0XsgV40Fp8MTEIEw1MHY
	LdGFPf9g==
X-Received: by 2002:a05:600c:8b12:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-483c3de6861mr32245965e9.16.1772108327534;
        Thu, 26 Feb 2026 04:18:47 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:44 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 06/11] spdx30: Enrich source downloads with external refs and PURLs
Date: Thu, 26 Feb 2026 13:18:18 +0100
Message-ID: <20260226121823.149327-7-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232011

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Enrich source download packages in SPDX SBOMs with comprehensive
source tracking metadata:

External references:
- VCS references for Git repositories (ExternalRefType.vcs)
- Distribution references for HTTP/HTTPS/FTP archive downloads
- Homepage references from HOMEPAGE variable

Source PURL qualifiers:
- Add ?type=source qualifier for recipe source tarballs to
  distinguish them from built runtime packages
- Only applied to pkg:yocto or pkg:generic PURLs (ecosystem-specific
  PURLs like pkg:npm already have their own semantics)

Version extraction with priority chain:
- Priority 1: ;tag= parameter from SRC_URI (preferred, provides
  meaningful versions like '1.2.3')
- Priority 2: fd.revision (resolved Git commit hash)
- Priority 3: SRCREV variable
- Priority 4: PV from recipe metadata

PURL generation:
- Generate pkg:github PURLs for GitHub-hosted repositories
- Extensible via SPDX_GIT_PURL_MAPPINGS for other hosting services
- Ecosystem-specific version and PURL integration for Rust crates,
  Go modules, PyPI, NPM packages

Also add defensive error handling for download_location retrieval
and wire up extract_dependency_metadata() for non-Git sources.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 180 +++++++++++++++++++++++++-----------
 1 file changed, 126 insertions(+), 54 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 78d1dfd250..8e1492ef20 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -20,7 +20,6 @@ from datetime import datetime, timezone
 from pathlib import Path
 
 
-
 def extract_dependency_metadata(d, file_name):
     """Extract ecosystem-specific PURL for dependency packages.
 
@@ -573,16 +572,28 @@ def add_download_files(d, objset):
             dep_version = None
             dep_purl = None
 
-            # For Git repositories, extract version from SRCREV
+            # Get download location for external references
+            download_location = None
+            try:
+                download_location = oe.spdx_common.fetch_data_to_uri(fd, fd.name)
+            except Exception as e:
+                bb.debug(1, f"Could not get download location for {file_name}: {e}")
+
+            # For Git repositories, extract version from SRCREV or tag
             if fd.type == "git":
                 srcrev = None
 
-                # Try to get SRCREV for this specific source URL
+                # Prefer ;tag= parameter from SRC_URI
+                if hasattr(fd, 'parm') and fd.parm and 'tag' in fd.parm:
+                    tag = fd.parm['tag']
+                    if tag and tag not in ['${AUTOREV}', 'AUTOINC', 'INVALID']:
+                        dep_version = tag[1:] if tag.startswith('v') else tag
+                        version_source = "tag"
+                # Try fd.revision for resolved SRCREV
                 # Note: fd.revision (not fd.revisions) contains the resolved revision
-                if hasattr(fd, 'revision') and fd.revision:
+                if not dep_version and hasattr(fd, 'revision') and fd.revision:
                     srcrev = fd.revision
-                    bb.debug(1, f"SPDX: Found fd.revision for {file_name}: {srcrev}")
-
+                    version_source = "fd.revision"
                 # Note: We intentionally do NOT fall back to d.getVar('SRCREV')
                 # because referencing SRCREV in BBIMPORTS-registered module code
                 # causes bitbake's signature generator to trace the SRCREV ->
@@ -590,65 +601,127 @@ def add_download_files(d, objset):
                 # "AUTOREV/SRCPV set too late" errors for non-git temp recipes
                 # used by recipetool/devtool with HTTP sources.
                 # fd.revision is always available for git sources after fetch.
-                if srcrev and srcrev not in ['${AUTOREV}', 'AUTOINC', 'INVALID']:
-                    # Use first 12 characters of Git commit as version (standard Git short hash)
+                if not dep_version and srcrev and srcrev not in ['${AUTOREV}', 'AUTOINC', 'INVALID']:
                     dep_version = srcrev[:12] if len(srcrev) >= 12 else srcrev
-                    bb.debug(1, f"SPDX: Extracted Git version for {file_name}: {dep_version}")
-
-                    # Generate PURL for Git hosting services
-                    # Reference: https://github.com/package-url/purl-spec/blob/master/PURL-TYPES.rst
-                    download_location = oe.spdx_common.fetch_data_to_uri(fd, fd.name)
-                    if download_location and download_location.startswith('git+'):
-                        git_url = download_location[4:]  # Remove 'git+' prefix
-
-                        # Build Git PURL handlers from default + custom mappings
-                        # Format: 'domain': ('purl_type', lambda to extract path)
-                        # Can be extended in meta-siemens or other layers via SPDX_GIT_PURL_MAPPINGS
-                        git_purl_handlers = {
-                            'github.com': ('pkg:github', lambda parts: f"{parts[0]}/{parts[1].replace('.git', '')}" if len(parts) >= 2 else None),
-                            # Note: pkg:gitlab is NOT in official PURL spec, so we omit it by default
-                            # Other Git hosts can be added via SPDX_GIT_PURL_MAPPINGS
-                        }
-
-                        # Allow layers to extend PURL mappings via SPDX_GIT_PURL_MAPPINGS variable
-                        # Format: "domain1:purl_type1 domain2:purl_type2"
-                        # Example: SPDX_GIT_PURL_MAPPINGS = "gitlab.com:pkg:gitlab git.example.com:pkg:generic"
-                        custom_mappings = d.getVar('SPDX_GIT_PURL_MAPPINGS')
-                        if custom_mappings:
-                            for mapping in custom_mappings.split():
-                                try:
-                                    domain, purl_type = mapping.split(':')
-                                    # Use simple path handler for custom domains
-                                    git_purl_handlers[domain] = (purl_type, lambda parts: f"{parts[0]}/{parts[1].replace('.git', '')}" if len(parts) >= 2 else None)
-                                    bb.debug(2, f"SPDX: Added custom Git PURL mapping: {domain} -> {purl_type}")
-                                except ValueError:
-                                    bb.warn(f"SPDX: Invalid SPDX_GIT_PURL_MAPPINGS entry: {mapping} (expected format: domain:purl_type)")
-
-                        for domain, (purl_type, path_handler) in git_purl_handlers.items():
-                            if f'://{domain}/' in git_url or f'//{domain}/' in git_url:
-                                # Extract path after domain
-                                path_start = git_url.find(f'{domain}/') + len(f'{domain}/')
-                                path = git_url[path_start:].split('/')
-                                purl_path = path_handler(path)
-                                if purl_path:
-                                    dep_purl = f"{purl_type}/{purl_path}@{srcrev}"
-                                    bb.debug(1, f"SPDX: Generated {purl_type} PURL: {dep_purl}")
-                                break
-
-            # Fallback: use parent package version if no other version found
+                    bb.debug(1, f"Extracted Git version for {file_name}: {dep_version} (from {version_source})")
+
+                # Generate PURL for Git hosting services
+                # Reference: https://github.com/package-url/purl-spec/blob/master/PURL-TYPES.rst
+                if dep_version and download_location and isinstance(download_location, str) and download_location.startswith('git+'):
+                    git_url = download_location[4:]  # Remove 'git+' prefix
+
+                    # Default Git PURL handler (github.com)
+                    git_purl_handlers = {
+                        'github.com': ('pkg:github', lambda parts: f"{parts[0]}/{parts[1].replace('.git', '')}" if len(parts) >= 2 else None),
+                        # Note: pkg:gitlab is NOT in official PURL spec, so we omit it by default
+                    }
+
+                    # Custom PURL mappings from SPDX_GIT_PURL_MAPPINGS
+                    # Format: "domain1:purl_type1 domain2:purl_type2"
+                    # Example: SPDX_GIT_PURL_MAPPINGS = "gitlab.com:pkg:gitlab git.example.com:pkg:generic"
+                    custom_mappings = d.getVar('SPDX_GIT_PURL_MAPPINGS')
+                    if custom_mappings:
+                        for mapping in custom_mappings.split():
+                            try:
+                                domain, purl_type = mapping.split(':')
+                                git_purl_handlers[domain] = (purl_type, lambda parts: f"{parts[0]}/{parts[1].replace('.git', '')}" if len(parts) >= 2 else None)
+                                bb.debug(2, f"Added custom Git PURL mapping: {domain} -> {purl_type}")
+                            except ValueError:
+                                bb.warn(f"Invalid SPDX_GIT_PURL_MAPPINGS entry: {mapping} (expected format: domain:purl_type)")
+
+                    for domain, (purl_type, path_handler) in git_purl_handlers.items():
+                        if f'://{domain}/' in git_url or f'//{domain}/' in git_url:
+                            path_start = git_url.find(f'{domain}/') + len(f'{domain}/')
+                            path = git_url[path_start:].split('/')
+                            purl_path = path_handler(path)
+                            if purl_path:
+                                purl_version = dep_version if version_source == "tag" else (srcrev if srcrev else dep_version)
+                                dep_purl = f"{purl_type}/{purl_path}@{purl_version}"
+                                bb.debug(1, f"Generated {purl_type} PURL: {dep_purl}")
+                            break
+
+            # Fallback to recipe PV
             if not dep_version:
                 pv = d.getVar('PV')
                 if pv and pv not in ['git', 'AUTOINC', 'INVALID', '${PV}']:
                     dep_version = pv
-                    bb.debug(1, f"SPDX: Using parent PV for {file_name}: {dep_version}")
+            # Non-Git: try ecosystem-specific PURL
+            if fd.type != "git":
+                ecosystem_version, ecosystem_purl = extract_dependency_metadata(d, file_name)
+
+                if ecosystem_version and not dep_version:
+                    dep_version = ecosystem_version
+                if ecosystem_purl and not dep_purl:
+                    dep_purl = ecosystem_purl
+                    bb.debug(1, f"Generated ecosystem PURL for {file_name}: {dep_purl}")
 
-            # Set version and PURL if extracted
             if dep_version:
                 dl.software_packageVersion = dep_version
 
             if dep_purl:
                 dl.software_packageUrl = dep_purl
 
+            # Add ?type=source qualifier for source tarballs
+            if (primary_purpose == oe.spdx30.software_SoftwarePurpose.source and
+                fd.type != "git" and
+                file_name.endswith(('.tar.gz', '.tar.bz2', '.tar.xz', '.zip', '.tgz'))):
+
+                current_purl = dl.software_packageUrl
+                if current_purl:
+                    purl_type = current_purl.split('/')[0] if '/' in current_purl else ''
+                    if purl_type in ['pkg:yocto', 'pkg:generic']:
+                        source_purl = f"{current_purl}?type=source"
+                        dl.software_packageUrl = source_purl
+                else:
+                    recipe_purl = oe.purl.get_base_purl(d)
+                    if recipe_purl:
+                        base_purl = recipe_purl
+                        source_purl = f"{base_purl}?type=source"
+                        dl.software_packageUrl = source_purl
+            # Add external references
+
+            # VCS reference for Git repositories
+            if fd.type == "git" and download_location and isinstance(download_location, str) and download_location.startswith('git+'):
+                git_url = download_location[4:]  # Remove 'git+' prefix
+                # Clean up URL (remove commit hash if present)
+                if '@' in git_url:
+                    git_url = git_url.split('@')[0]
+
+                dl.externalRef = dl.externalRef or []
+                dl.externalRef.append(
+                    oe.spdx30.ExternalRef(
+                        externalRefType=oe.spdx30.ExternalRefType.vcs,
+                        locator=[git_url],
+                    )
+                )
+
+            # Distribution reference for tarball/archive downloads
+            elif download_location and isinstance(download_location, str) and (
+                    download_location.startswith('http://') or
+                    download_location.startswith('https://') or
+                    download_location.startswith('ftp://')):
+                dl.externalRef = dl.externalRef or []
+                dl.externalRef.append(
+                    oe.spdx30.ExternalRef(
+                        externalRefType=oe.spdx30.ExternalRefType.altDownloadLocation,
+                        locator=[download_location],
+                    )
+                )
+
+            # Homepage reference if available
+            homepage = d.getVar('HOMEPAGE')
+            if homepage:
+                homepage = homepage.strip()
+                dl.externalRef = dl.externalRef or []
+                # Only add if not already added as distribution reference
+                if not any(homepage in ref.locator for ref in dl.externalRef):
+                    dl.externalRef.append(
+                        oe.spdx30.ExternalRef(
+                            externalRefType=oe.spdx30.ExternalRefType.altWebPage,
+                            locator=[homepage],
+                        )
+                    )
+
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
                 for checksum_id in ["sha256", "sha1"]:
@@ -665,7 +738,6 @@ def add_download_files(d, objset):
                         )
                     )
 
-            inputs.add(dl)
 
     return inputs
 
-- 
2.53.0


