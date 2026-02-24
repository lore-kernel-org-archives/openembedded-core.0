Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE94F3C9B7
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24303.1771950612532763929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lqXQcOlE;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-480706554beso69126855e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950611; x=1772555411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Inbr2Ezomsm8cTHwRIkMSDqgmgubAfoNMG9knCBTvco=;
        b=lqXQcOlEiKdC7cHZRfZFfQkEf60dUWJgNSgLAyrn1UnJmHQKFz06NGF1aL1/WucJyE
         N/o80yvS1xOji4QbDku2z+r38QtJ6o2VPIS2P2AyU01psIwSr6gxByWsSLgJ2WhZl9CM
         pCScFlmvY+slL4bmSOHRP6s8n48XidlVri/hiBkgQDWLMnes7biT8uTtaOOP4huwbDh2
         3UM+EGqF0iLGlEBsfXeC/Y3VmsPxOOQzrWOTUa+s48GsJCnnO4CjQLpY4Wnch8TSgMWf
         bmaaL4iZTzM2N2JS/78H46C4XCy/oTx6PyDPUX36iYcgy+HyJTJRuI3HpxEPQHJOTiXi
         fWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950611; x=1772555411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Inbr2Ezomsm8cTHwRIkMSDqgmgubAfoNMG9knCBTvco=;
        b=lP5UjYKWEqFvE/RUQhg/vaKcy97Y4cR1JulWauVrY2/6bCxVv5lLWZ8ZZ+D82fIyhA
         q2Nnq6YDNDSwPaMZgc5nGC/D8uNZspPSee/k6ZeXE9pc03VOfGvmMDWpYCUIMjlz1mn2
         hnjPgWLw8EnaA48tjhcCLxBJY+DS5dNWo3PdjY5mMnjnFPO94SpcJkrBpuOiyOYNHBwd
         0MaZd4UkJ5H0ntp2KjZPju03xml+RMMjDwMU0gRaRjoKmfl2OiY13tPsW6CRhtilLiex
         0JcR2ejP2bFMMzRgOw1MKlLSHdLs6e46o3f6jnoP90auoqaF7hhNc8yNN84OV4FqohDj
         EvAg==
X-Gm-Message-State: AOJu0Yzap0kuPIg79MAyuq9c75EPIZLxu9lDj4kBSR4DviaVwU9FIqv/
	F5bzc5+etLhIi0JkWE2yPsgTzZD9xvTpRbJZj6sAh5nUSMb+2WBFTvZo8ZzPbg==
X-Gm-Gg: AZuq6aI+qRAesgoLZeRIARSz/7SnvF6MvTNNcedThjNglZ3NSeEJZglJk1BKT9QL83W
	3I8kZtejJ5i8pSGYuYxDiGj19k7VrQ4jrh3G1DuB/yYyOcSMnghVG4Qs4bwkVGPg2ZFR2mgC0sa
	Kg88NTqr4gcW96GM6mNf67yXR7CyCk/4WuZZh/JyexQs2+bFthGFmfsl6lSERAQ4Rkzcj/hiSGC
	a11hVgd/h+39ZJOYrTF4Ey8nqo37S0rSr+XJ82gm5z7QfX5nRB3KA3xlNWLhYVV6C0g32hjHItq
	D8/VJaR7r+xJUFs2eTBafaVfetC2LHYgfryDfa8jTnsj3NqxXMHOXULFRWlI69ZgEiRDP3MB7ix
	KD6/spL+HTZze1hwS/FASxikz96QxKuefWjWQYUG5vPeOGhe7aT8Zt/oGnpryO+CfvnjE6BXiki
	nFLA2RrReyMCgdWokcfd0+BikVjsmRflodsewYomTs0RuBtwcJ6T99dpiAfsgVz1itvFLmU7YBy
	TLqNc0O
X-Received: by 2002:a05:600c:c4a5:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-483a95eb500mr180326025e9.3.1771950610075;
        Tue, 24 Feb 2026 08:30:10 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:09 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 06/11] spdx30: Enrich source downloads with external refs and PURLs
Date: Tue, 24 Feb 2026 17:29:41 +0100
Message-ID: <20260224162946.4000445-7-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224162946.4000445-1-stondo@gmail.com>
References: <20260224162946.4000445-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231883

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


