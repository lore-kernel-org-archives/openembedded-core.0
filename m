Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7461EFCE5C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:00:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69773.1772805614221857073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 06:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CXqly3Dj;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48371119eacso109924085e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805612; x=1773410412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04Q4BQ7wy1cxwg/nFU3i8C2rtjJZO9c7dk0np1qTgEw=;
        b=CXqly3Djrw+STSTC0emuShl7vyMtKFoXrl36z6yiB+2QYosQ7o2y3EzlBAaG1bO7Y+
         cZqcSNkwC+hndlRVf+DkAooA8azoq77DjBWADxP+/YA997jV5dx4OsJplyDBY70MCz09
         WrB7/qK/78fMFamuO7LGRLNYOlXN0m8P+iO7V80xAv6jvPWrl4LKvKuBnBKuyySdSxVT
         L8+eIMHjGqJNq7KPHiECdNKhQA6g/XOFXc7ABTbe2d7i+K3q932rLUiMGS0DmnxPrYbv
         cGI7gztpJ+MBS0myF0Mbiyk+DgVJtrw1ykfdu+7adUqiJGABnVNLrFzXfgjpmgk6jujP
         EbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805612; x=1773410412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=04Q4BQ7wy1cxwg/nFU3i8C2rtjJZO9c7dk0np1qTgEw=;
        b=ZJdTIFy/RHyot7pgrnkrJd1UmYcJw5OGiAhE2mKFY2fXqNC15qlnqVeIGquuZ9AX8H
         ZOWolOYZpYFoxL+Bc9KdCq07tuS345BvB7xaSITl1KiOgzUx0WcoLllqNPCtXsDpl6V+
         Hy40dmR9qa1u+N//Omf3J/VvjxnFIAaxB4NvDUFU1xVuFNULuVW0Nql1mG3T9Ow2WFCE
         C2S6CAndakYOte5Q7j5XeWU7F06G4fxXGXLXAEc7QC3Pws5L/bhAe7uFor54xt5Zlvpn
         8oQwr0TUbqCEprmbYYkCya7T5Cw7JqDgu808KSUNZgTFDWBHeQDGn8g1mT5oy4kseKOW
         bXxw==
X-Gm-Message-State: AOJu0YyRXENe5TuByc343pQwttt5I6WVfSiRwbJXZG7lctJC5VdQ9uEA
	1r6SnI/ijuVkZ3zXCroqmx9cB+aO5yvD+Q1QUBTkgpq+0F7nqV9xd84LyorCkw==
X-Gm-Gg: ATEYQzzBZAQuE/hlvEHW+UsdH+8WykQ/Q1GExul9gPCdTxdmhOdan/SWwdUbS57JG8h
	AjgzkBAXRA9r9lCKFkE+36jW8JMfPe1KjQ9HOmF4MeWOmEeURMWjnLQCaQwQd7N2CB1VWBJaXIv
	x/1TveIMbSs+W2taLWxUajFOEP8vkSqT5zlf6bsd5Mir+HrdMlY4eIXefFopXlCAPEh94lopsxg
	UYKkGTnAxV8tT6dJ7j2U4R1PJY+aR2/fyLFCztoW6rbPzS4yo4IRg4aR3e06e5UNlozHyka1V/I
	3Ts/K9+pOoyDrcvHxQCRYNtmYv5xpyfcU3/pcCkBtBNNldTas8zcIWM+dfPGmpQHaVOI2elwz3z
	+SU00JvkjNK+kOZFFKXrC5nXftBeOUtMQ/BxkG7z7QSc545J+XFuMxAJCfwp+woECC2OW/RykTG
	43wzxKO/gZLEjdikYBfMfPDYtwnj0+udw8g/yu0pRQjPX8ABSi55z9
X-Received: by 2002:a05:600c:45d1:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4852697844emr35513495e9.32.1772805611888;
        Fri, 06 Mar 2026 06:00:11 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb4257csm187098845e9.15.2026.03.06.06.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:00:11 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	joshua.watt@garmin.com,
	ross.burton@arm.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v7 06/10] spdx30: Enrich source downloads with external refs and PURLs
Date: Fri,  6 Mar 2026 14:59:58 +0100
Message-ID: <387d3edf78fc6381bc876445de23cab95d63f224.1772805096.git.stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 14:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232572

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
 meta/lib/oe/spdx30_tasks.py | 178 +++++++++++++++++++++++++-----------
 1 file changed, 126 insertions(+), 52 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 78d1dfd250..b82015341b 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -20,7 +20,6 @@ from datetime import datetime, timezone
 from pathlib import Path
 
 
-
 def extract_dependency_metadata(d, file_name):
     """Extract ecosystem-specific PURL for dependency packages.
 
@@ -573,15 +572,29 @@ def add_download_files(d, objset):
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
                     bb.debug(1, f"SPDX: Found fd.revision for {file_name}: {srcrev}")
+                    version_source = "fd.revision"
 
                 # Note: We intentionally do NOT fall back to d.getVar('SRCREV')
                 # because referencing SRCREV in BBIMPORTS-registered module code
@@ -590,65 +603,127 @@ def add_download_files(d, objset):
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
@@ -665,7 +740,6 @@ def add_download_files(d, objset):
                         )
                     )
 
-            inputs.add(dl)
 
     return inputs
 
-- 
2.53.0


