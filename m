Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9620EF3C9BB
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24464.1771950609897924283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k69byEDG;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806bf39419so50232555e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950608; x=1772555408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfxqDr/0sUDFrawR4jb6iKd2thoodmrXWfbO71sdE5M=;
        b=k69byEDG/BfcS3iXMpMK/iJVAXlxCwWAc8NTXQCq6tRzynHD2XfqkblTEQrpadE1xV
         j7kGOmr1TdDKr1nsvkePoxC1a/4UKhJUKnOm+3zLJpzIHZEFpkuLB1j0o9JcbzsMZJfe
         +c2VxOrtaXQT3xsO+JQqskKuwPvgKlLTRBIN1wXWs8/uIPtppDf0YGeHAqhCcgrlPX4F
         tQPgOG5DvcAm9bYhyFiqY/RqfViUg1SOBUYL0K56B6rBKr4tkDbxIGVZpSQp4xZ5TX8N
         BjJJVbyORk6x/QlujX0TqwUYY9K+KEYQ7TH6qHBBb3BrqD/ko3j8p+BRTw9VeA5UqMi/
         I7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950608; x=1772555408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bfxqDr/0sUDFrawR4jb6iKd2thoodmrXWfbO71sdE5M=;
        b=RAAihQZuoeCvljlTDWAIFujYNmvLEEA3hOZQrNhsPYFwIqoN2AxrAXkGA6gqq3pVkA
         SudfAmsBAst/FECY9rY/8ATXpUDyJzMCduGBEHPCjyc3g/Og+jP58YPU3haQYFKgyHtR
         2VGV5u2Y8kw6robZdyyRizIsJWa2kYR5ZiCOkPn06gvwr59Th0cEU6JoFnJgRBBuFGrv
         FT2OlKcCTfNdufYw9m3WYsZdBPVfvaPZ/RY+q6TplKNRP+qWhd0jFb3gOc3vZzlbsSRx
         7eiV0jyJZ9c0f7sdvxXXXplHkOY2y707CiqzWA57ywWBAqdesBZL1u28LBqILA2LEZMP
         ZmDQ==
X-Gm-Message-State: AOJu0YxMvJQG1xV63m/1ZU3DdvWcPKu1+s+XaZe2felDgBhDiYuvej5T
	HTK+lQpXisBSk7mwVmgCLW+6xS7Oz4MIFI6i6CUcXHtRfMMac/VD3znuWlPbXw==
X-Gm-Gg: AZuq6aKUTD8uIHgorP9pN8gS2CNEHveal/0Paa4VXRD9k1/YEy8RUcoxCCd5YVF7sLF
	NCq1zvi5G1lSydyd6RcZtTq8pd8jsdEFlSplxKCy5wGLgmcpZOP3Kqudwyc6ZLKZLwHjGwoZg2w
	6Ch51g5gV0VsUJxT8JAj72sQqgDMbhxwzhFCCd23Wlj1g3bYsAy8vYAmJCk9RNTXxhuZ7kyHyVA
	H+cvBm5tYBE6S2Ip1Yia/oVcuJttwC5gl9xCIo7eKDE6oWbDKYrEBhBwOzTZcVuJ/6CaJaf8dhb
	UpUc5kWzqV+eUrfN2atltXyBd7EJTgbAC9VDex4wHNNQ/a736ki+hvNYUzoo7CINDQ84mlXRSHc
	Be9Vv3O4mJoFZVb7GYHCS0MmqfjjoyDYmJQuXQSmj4d3d8syjfM4JGtN+LeQX0oi8Zj4UHqC+qG
	0jKk14EpNshMBHN6Lz/YH5JzxPaUiz8a4i+MmX+d6BBjtpqVASqq12Fw8szZCts/x7SHVtxd9Ec
	EF7Mc70
X-Received: by 2002:a05:600c:818d:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-483bd75e25fmr9151165e9.17.1771950607246;
        Tue, 24 Feb 2026 08:30:07 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:06 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 04/11] spdx30: Add version extraction from SRCREV for Git source components
Date: Tue, 24 Feb 2026 17:29:39 +0100
Message-ID: <20260224162946.4000445-5-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224162946.4000445-1-stondo@gmail.com>
References: <20260224162946.4000445-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231881

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

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
 meta/lib/oe/spdx30_tasks.py | 79 +++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 11945a622d..4493b6e5e1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -569,6 +569,85 @@ def add_download_files(d, objset):
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
+                # Fallback to general SRCREV variable
+                if not srcrev:
+                    srcrev = d.getVar('SRCREV')
+                    if srcrev:
+                        bb.debug(1, f"SPDX: Using SRCREV variable for {file_name}: {srcrev}")
+
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


