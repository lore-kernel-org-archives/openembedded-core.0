Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9509EDA697
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:05:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23517.1772643952315496535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VKW+hQxE;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso59890545e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 09:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643950; x=1773248750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecAzM+rinuiiLRIleyCzXUsXKLx/YWTVTQjxZEeZpU8=;
        b=VKW+hQxEmcktXHUQ68PWI96UHcuqCzXy5KiQNy22VKqpFoysloLEnnh5zd7TP0I9Sn
         noRl1btJak1wX7Sx8K5EkDaBg4/yegy3I/QHSi1TOnBTDPgQdIFTlRSwsx/64m9HStHz
         2Kvo3ntgnjpj4yjJmFrvsiDyAeNX8uduiy5jD8FBHH2i8p/gu2zhkILn9CjmpN4wmvgT
         s6KRnuSbTrSQoqZ5Lcg3ZU8VjTwGQ8FpqQkz0PSDAc1GqU9Saz87Jl9EFdLPGe1s4c4K
         FNizNSdP72p+M168/hP+rsk7z0w7Uk+BwTpGK9c+11yYTnL1gl+5jh3Qip5v9pfMAvXo
         /HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643950; x=1773248750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecAzM+rinuiiLRIleyCzXUsXKLx/YWTVTQjxZEeZpU8=;
        b=ICIg0ykPsCuTC6eS2CWl56MCOw8/1DU1yh9S03jslXfDDbFBKeD7uVk3iAUkAQMcSm
         arsyPgwISTtlqu1IPtC0BAjxTJDxqXok1ZvN7PaJsyBlKFLrRYRFOanM0VJyNBv7X2h9
         k2uO3eXovunKS9YWfYLIrdKNMxQvZr5QztXQ8mJeUiq4R+WbORNQ+mqnwmImD9a3sGFY
         +VPslnfbjduduX5/tSN2GvCScVEOXjKa+cSqEOoB7KfCu/XjqLL3SUQz/m7yxZ2ntz3x
         uW8r5ADjx2bOCc7VCm+OMzzTcvHJHJhriU4kp3yzLyOLDf2qpnQ7uKVY9B9uxwuFtVKY
         Tqnw==
X-Gm-Message-State: AOJu0Yx5jOKWl8fDb1Kjk1dAB/4vHfU0yHctxnqElyGdelPCzfdcDGH5
	+nMQp6uQ1a5Fvww2q4EbCy7pw6VAYetnTi30oZPYuqg2LGXhzt96Yqcm0YXzMg==
X-Gm-Gg: ATEYQzyiebGA53Y3XuO0RcQGUe+6CtMOb6/Afj3vNPQopgmO89DXS38Vgx+0ADjDTkE
	A3+JQ8EJFTMEkMvm1M4yTtoZZYyE/axugTBQG9b2hhnJ2i4eTcwWBzKCZ5StFC2UNteLVWSsMUy
	Y7Xc9QWFxUZHgDLUDCWKmAGZEiX4weuW+lEOz8+dXhnEUwtXqRal4cb1MT+XiiyXuMDhtE5ZCH2
	v0Jsg0GJotIlMuDTkvnhW+V7U215tOpCQuplI5hWglATQZUN3139cliE6a+LDoOZuuiRDKQX++i
	HAsdVXXZNBYvleewcDxfjd6aExLgOnDo2uDIw9bl7UMEe0B7OrHPiBP59DglgcrLJIkF4byjRee
	fmOzJKemTSpV7cnBoMLM5mV6XLTu3hJVZsXIssYaKZngCtfVlZ6lTq+FA97FUKBdMlWqWzY4ROG
	9PFRpHVtAJXptwSyQaOdsrJxk=
X-Received: by 2002:a05:600c:3e18:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-48519862e45mr47610225e9.11.1772643950216;
        Wed, 04 Mar 2026 09:05:50 -0800 (PST)
Received: from fedora ([165.225.94.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm78557395e9.12.2026.03.04.09.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:05:48 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v6 04/10] spdx30: Add version extraction from SRCREV for Git source components
Date: Wed,  4 Mar 2026 18:05:35 +0100
Message-ID: <20260304170541.180868-5-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232407

Extract version information for Git-based source components in SPDX 3.0
SBOMs to improve SBOM completeness and enable better supply chain tracking.

Problem:
Git repositories fetched as SRC_URI entries currently appear in SBOMs
without version information (software_packageVersion is null). This makes
it difficult to track which specific revision of a dependency was used,
reducing SBOM usefulness for security and compliance tracking.

Solution:
- Extract SRCREV for Git sources and use it as packageVersion
- Use fd.revision attribute (the resolved Git commit)
- Fallback to SRCREV variable if fd.revision not available
- Use first 12 characters as version (standard Git short hash)
- Generate pkg:github PURLs for GitHub repositories (official PURL type)
- Add comprehensive debug logging for troubleshooting

Impact:
- Git source components now have version information
- GitHub repositories get proper PURLs (pkg:github/owner/repo@commit)
- Enables tracking specific commit dependencies in SBOMs

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 80 +++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 11945a622d..78d1dfd250 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -569,6 +569,86 @@ def add_download_files(d, objset):
                 )
             )
 
+            # Extract version and PURL for source packages
+            dep_version = None
+            dep_purl = None
+
+            # For Git repositories, extract version from SRCREV
+            if fd.type == "git":
+                srcrev = None
+
+                # Try to get SRCREV for this specific source URL
+                # Note: fd.revision (not fd.revisions) contains the resolved revision
+                if hasattr(fd, 'revision') and fd.revision:
+                    srcrev = fd.revision
+                    bb.debug(1, f"SPDX: Found fd.revision for {file_name}: {srcrev}")
+
+                # Note: We intentionally do NOT fall back to d.getVar('SRCREV')
+                # because referencing SRCREV in BBIMPORTS-registered module code
+                # causes bitbake's signature generator to trace the SRCREV ->
+                # AUTOREV dependency chain during recipe finalization, triggering
+                # "AUTOREV/SRCPV set too late" errors for non-git temp recipes
+                # used by recipetool/devtool with HTTP sources.
+                # fd.revision is always available for git sources after fetch.
+                if srcrev and srcrev not in ['${AUTOREV}', 'AUTOINC', 'INVALID']:
+                    # Use first 12 characters of Git commit as version (standard Git short hash)
+                    dep_version = srcrev[:12] if len(srcrev) >= 12 else srcrev
+                    bb.debug(1, f"SPDX: Extracted Git version for {file_name}: {dep_version}")
+
+                    # Generate PURL for Git hosting services
+                    # Reference: https://github.com/package-url/purl-spec/blob/master/PURL-TYPES.rst
+                    download_location = oe.spdx_common.fetch_data_to_uri(fd, fd.name)
+                    if download_location and download_location.startswith('git+'):
+                        git_url = download_location[4:]  # Remove 'git+' prefix
+
+                        # Build Git PURL handlers from default + custom mappings
+                        # Format: 'domain': ('purl_type', lambda to extract path)
+                        # Can be extended in meta-siemens or other layers via SPDX_GIT_PURL_MAPPINGS
+                        git_purl_handlers = {
+                            'github.com': ('pkg:github', lambda parts: f"{parts[0]}/{parts[1].replace('.git', '')}" if len(parts) >= 2 else None),
+                            # Note: pkg:gitlab is NOT in official PURL spec, so we omit it by default
+                            # Other Git hosts can be added via SPDX_GIT_PURL_MAPPINGS
+                        }
+
+                        # Allow layers to extend PURL mappings via SPDX_GIT_PURL_MAPPINGS variable
+                        # Format: "domain1:purl_type1 domain2:purl_type2"
+                        # Example: SPDX_GIT_PURL_MAPPINGS = "gitlab.com:pkg:gitlab git.example.com:pkg:generic"
+                        custom_mappings = d.getVar('SPDX_GIT_PURL_MAPPINGS')
+                        if custom_mappings:
+                            for mapping in custom_mappings.split():
+                                try:
+                                    domain, purl_type = mapping.split(':')
+                                    # Use simple path handler for custom domains
+                                    git_purl_handlers[domain] = (purl_type, lambda parts: f"{parts[0]}/{parts[1].replace('.git', '')}" if len(parts) >= 2 else None)
+                                    bb.debug(2, f"SPDX: Added custom Git PURL mapping: {domain} -> {purl_type}")
+                                except ValueError:
+                                    bb.warn(f"SPDX: Invalid SPDX_GIT_PURL_MAPPINGS entry: {mapping} (expected format: domain:purl_type)")
+
+                        for domain, (purl_type, path_handler) in git_purl_handlers.items():
+                            if f'://{domain}/' in git_url or f'//{domain}/' in git_url:
+                                # Extract path after domain
+                                path_start = git_url.find(f'{domain}/') + len(f'{domain}/')
+                                path = git_url[path_start:].split('/')
+                                purl_path = path_handler(path)
+                                if purl_path:
+                                    dep_purl = f"{purl_type}/{purl_path}@{srcrev}"
+                                    bb.debug(1, f"SPDX: Generated {purl_type} PURL: {dep_purl}")
+                                break
+
+            # Fallback: use parent package version if no other version found
+            if not dep_version:
+                pv = d.getVar('PV')
+                if pv and pv not in ['git', 'AUTOINC', 'INVALID', '${PV}']:
+                    dep_version = pv
+                    bb.debug(1, f"SPDX: Using parent PV for {file_name}: {dep_version}")
+
+            # Set version and PURL if extracted
+            if dep_version:
+                dl.software_packageVersion = dep_version
+
+            if dep_purl:
+                dl.software_packageUrl = dep_purl
+
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
                 for checksum_id in ["sha256", "sha1"]:
-- 
2.53.0


