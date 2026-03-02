Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305FCEA4E2F
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:01:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.163887.1772467296564465941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gPdSetnL;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b2965d4bso1434085f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 08:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467295; x=1773072095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1Pk5rMJmkxxq6vIyCdsXfCuU0SPqRy84+9NGf9MCTY=;
        b=gPdSetnLK/bJC6QhQAPNoCFDMVJG/UooWaPLaV1JXn//ugdaMY0Cs1XK7X7mi+nbZd
         tjPMCykWeHf2FNp2R7XGlbJT9gN1yIJAuQ7HeEMflo8jNS1OXCrBLcCxDYVfc2rfrNiM
         g1Az7/LiS61nIruaqR2zxe2mx0r00jlo22wLtcpzqyAnQ1u+1zp3OvXlKC9Mq62XjkBE
         l+2AIOas3DVH7Y+/Mq2BRemwi+FckyJzFY2v2jzKdn9XpMYTyKFyV9GxKw2AYf2wjYhq
         91SAQ2s4lTmePmDfcs7YAVUdnXfmBgwZqhlmWyirxjiIXJiz58IgWqOftQSmTtU9+7VJ
         UUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467295; x=1773072095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1Pk5rMJmkxxq6vIyCdsXfCuU0SPqRy84+9NGf9MCTY=;
        b=DTZ4ln5eIKSfPzRi21zOrmBl7mYXDAGvB+CNGwPAnIEOy8ByCPKUYWkAImtEXkQiT+
         jAxfrQrySrvy2NQIfqW57pbQ/+iTPKCPIanqcf3K2rDGuUiCvo81/Ew/lmMj+k33e5mE
         rd1kdT3nU/F7R3ntThUMFaj8Ebmh7b+Pb5LImwkVrdXMuAFI58mH7dVjvHRT5CCgANpF
         ZkbVV9scT/N7Ks+5CCRGWC5R8zjVUWOT7AEfQsfdCVsOeRe83gjRsvcaUcFRk+EzN/2d
         1A4GhMNr6dt8zX+L8HxWJCSHD+wUsOMIaiPJMipc4aZzIUh4R9wtIelM3dlCaaYwTHu5
         HJWw==
X-Gm-Message-State: AOJu0Yz8UhqNvePEg73ckMhxiM2VCPuMR99/XtieYwF0jVq95H7jK5vg
	LIvJN9tFdgZl9GfdaDn2dw1IxVM8GzsEM3GO8gZjJgWS8axNsBHncjL7zel0hw==
X-Gm-Gg: ATEYQzyh7DgcRl7JF6GeOlzcL5+Gp/Zq3zeFsaIfUkRap546fofdAwdqT4BA7JMmD+C
	k/lGh7NJhFX+J8e8i8a3tZku0/CHT54FTSHTGcKIZKJ/j2QZv9pyWWSaxZZbOKD7uernfZgci0z
	t7aSEyWyu23+uqCNYvIPe4Sn6tNKMs2ZB1IV9QpZ++dGW7kw9XOSy8VzWqf1BJD2MpfydfO43us
	0hOoIUFkIBINPOS/ArFI/UN7nCfQEMIfv8x2Asvyzf5Tq3dzUmr5c12INGHSbnsMbQkZQ+DiKor
	JeiMbhHkpb+N0ADdYeotExUL9FJ5EQvvCcLe2ryCvJE0wtIXHdYpnMnrpphE+t5hHFPFbrpm7IQ
	eO/fvDHGHissXqzfRQa3/r2XoHJrXKz+vBGFP0nEL48tD2vypwM6TlUJpcUfRyn4RSq5sdtXrZ2
	QgPOkv19BKpGui02c+WQggRbH0vCulDkgpWbMqZk0DEev9Hm8qhqKi8W1LrLiNge7wzuO8AL83T
	qlAGS8PYAhTQxEFm97w
X-Received: by 2002:a05:6000:4024:b0:439:af49:38c5 with SMTP id ffacd0b85a97d-439af4938e2mr12140076f8f.15.1772467294429;
        Mon, 02 Mar 2026 08:01:34 -0800 (PST)
Received: from fedora (mob-194-230-144-8.cgn.sunrise.net. [194.230.144.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm28390097f8f.7.2026.03.02.08.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 08:01:33 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH v5 04/10] spdx30: Add version extraction from SRCREV for Git source components
Date: Mon,  2 Mar 2026 17:01:08 +0100
Message-ID: <20260302160114.46884-5-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232212

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


