Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F73EA4E36
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:01:56 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.163899.1772467309121868041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kcRtCU2l;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4399851b14bso3288545f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467307; x=1773072107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKvzeelvcmzwHmJAdmzJqzIDPLCUSdhS8qFrouJh3hM=;
        b=kcRtCU2lgRhFzhEFBg60ZBW203L+wbWPKJlzd0/yPJdLdvESl/ZNAyPU2E9BZ+yB+0
         OhvFqqDxmkq/9wputSLtc0neTwErCbiH63ZttQ3otV7OThpA5an8M/g8PA7LdQv3olQj
         t93jebMgMdm1mi//msTsTRc+ZG/Yh8k1pr8Y4NoBdHb5zUA1Qlc1CHxEILN0i620DR9h
         qUn9TAbLZxyVHQuQRcDFrGeI5tMEhlV23azAX+roaaGB4Plnf9SQNTULiD7melvczLtx
         pEVsymryHEGXihXz9zOgSVbEQY46g1bwGB3Kgmvp5+sxcJGsIpTJz0KmOXX1Es2BKFjI
         PHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467307; x=1773072107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eKvzeelvcmzwHmJAdmzJqzIDPLCUSdhS8qFrouJh3hM=;
        b=HoZA8SVE/c5sL2BapNTMNafRiIKpSiISBjPXb+pX9mzcTn95imbPJVuDkDnOTnUDmY
         ygZ+WmilziC5UGrinwv+g9647TotXIrQTuuKrorCzYeyzBtaR48yVPaS/imqHj6O3p0m
         BleHJ+Qesn1Et5kFvw9d6qHnfseGE64pyLGJ0oFxDunEWxJpVUTdP0DFcpMA+lly3XI0
         B6NS7zT/hV6Cshvu5KBTAw6h2lR/9R7gGOxyokTOAGf/apstOlzDsVfStAR42+xAsKmq
         l3lpHKreitLrKzoC9npVXJR2PJWU98qcf39vnYd8wvh0I3CVP9OrrzWsZHIERG5Dq/Aq
         KRlQ==
X-Gm-Message-State: AOJu0YynGOQgDryGeetzG1/tneeCsQS8+FGLp67vV0Dnx7YtHqkn7G7n
	EtWHV53/WYVYAk3qMuGThfQFQN/acHDlrP97RM44Qy8XLv3ib9l24BxwF2Zn4g==
X-Gm-Gg: ATEYQzwZrH+1wse4ifMQygCbTsMm+bS2HNX1hhW6ApPIVt+3qCJ1OTRaz1ApFX0PgIk
	B8hfcgnjThajlpCpSlBbARWKJYwmODskNbe6nzZhG4aszjd4kLFLVVLQJnSvKc/e2dBy0rZMunP
	g/e4btXdAm41Y86QYxjCrZYUDe7ZPPGG6eby0NPF6vyzC6C9sBvvi1FlPBFmyvFenZbLF1yFojj
	+3OWx1kN8Vh7sEwJDaws3/9hoZF7nh+9PDjJPZP+nIeeOHFvzP5ePQBIyokDFNyLrPw4q6BC99P
	AeUmWynXA5vOMDiKGm+60MBhn9WEZPwBKqGxOuo4s4pqGqg8jC0GJoY2HyGsVYhRsOhYG0Aomx9
	DasUqkRyMS0UqCJgM6vdxQoV64l2XEgAiGHi/bpYa52rUDqgiBRVU54QZSx613c+j5SCkHBVrMO
	soxVBZRtBPGq0HhsCTX9OkaQvVekwf4Q//ilzBYpRhVvqRRSRLGK34Cigx09OKIrU3zy3dp8caz
	kNeCh6u0NlgAiFmsHBj
X-Received: by 2002:a5d:5f46:0:b0:439:b1be:81ad with SMTP id ffacd0b85a97d-439b1be82a6mr11049715f8f.21.1772467301603;
        Mon, 02 Mar 2026 08:01:41 -0800 (PST)
Received: from fedora (mob-194-230-144-8.cgn.sunrise.net. [194.230.144.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm28390097f8f.7.2026.03.02.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 08:01:40 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH v5 06/10] spdx30: Enrich source downloads with external refs and PURLs
Date: Mon,  2 Mar 2026 17:01:10 +0100
Message-ID: <20260302160114.46884-7-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232216

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
 meta/lib/oe/spdx30_tasks.py | 187 +++++++++++++++++++++++++-----------
 1 file changed, 129 insertions(+), 58 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 4493b6e5e1..7fc831225a 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -20,7 +20,6 @@ from datetime import datetime, timezone
 from pathlib import Path
 
 
-
 def extract_dependency_metadata(d, file_name):
     """Extract ecosystem-specific PURL for dependency packages.
 
@@ -573,81 +572,154 @@ def add_download_files(d, objset):
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
-                # Fallback to general SRCREV variable
-                if not srcrev:
+                    version_source = "fd.revision"
+                # Fallback to SRCREV variable
+                if not dep_version and not srcrev:
                     srcrev = d.getVar('SRCREV')
                     if srcrev:
-                        bb.debug(1, f"SPDX: Using SRCREV variable for {file_name}: {srcrev}")
-
-                if srcrev and srcrev not in ['${AUTOREV}', 'AUTOINC', 'INVALID']:
-                    # Use first 12 characters of Git commit as version (standard Git short hash)
+                        version_source = "SRCREV"
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
@@ -664,7 +736,6 @@ def add_download_files(d, objset):
                         )
                     )
 
-            inputs.add(dl)
 
     return inputs
 
-- 
2.53.0


