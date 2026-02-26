Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255D4FD4600
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:18:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68605.1772108325017930413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SISOLPOZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4837907f535so7511925e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108322; x=1772713122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYETikDmQO0rcauO0ohwgSZs7tYudkJZbytV1IAj1FQ=;
        b=SISOLPOZK7C5FmT5khqhLQfuag7Y8Vn5EIQXiB5ITfQqCcLYrcUtGpN27qKSo0VeLf
         j/JBLyLAbHpw5fn7eYkzt5b5qLPWhIOlW8XNXiPY5sHSraod/SsV/MNk2cfQrP6aWMGS
         xyJKCAV5fDpnGpIV+f1QSeRBHncKLzIqFF1IxyfNbHJjnKDCsWC88EVM/n2bCF1Hr/Pq
         tj1NWoY6N5JU0SkcYxnYdkwA6/cw4zZjq12jQPsq/csFmhDxRLV1X0EjtBrmCUhBl5od
         9SKkoyzZFMl08/Id0k6wlHZrttnzjZc4fPm4899i2wWnBkKREsaC4qFpdJII9sPQ8Gwb
         tBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108322; x=1772713122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wYETikDmQO0rcauO0ohwgSZs7tYudkJZbytV1IAj1FQ=;
        b=sGalOGuzMZT1U/7W+K6a5+WatrZfyDOwBT6No5tWu2utxDDVSsrGFeV7QPqT3IoQ3L
         6bNDYl4mSiqzJ6iQsBTpaZ9qJzP5Q4icmf/DrdKZyrHHtUu42ox/G+roBLA3N4MwBt3j
         L8ROH1TYXOe6bRGiH7RT15MobcjxCCZQV+3JgpAQrc4oORDVvqXxSL1vhlm8JmKJfGJl
         xH1l8P40LX05UMvZsww0ZAI3E3Mt7Mz/2cVV3deqT4rbkAC/fHz3kRbhSnITUfNguCxR
         SYtIg7/UCd/HWc96wt+cfQpUy1EZ0uQ3If6pTjz2To2ClnaF/VMM2Kp5lKrq8nf8GgQy
         hg1w==
X-Gm-Message-State: AOJu0YxZOBXkcX8Ex9bsqQwKIq4thWxBKYMcMA3Q8B7DrJuawu9VwR5I
	QwWZWt+2mYch+fjCLEsaxLMwfGKXulISUy8Em7i6rlD53acajQYTZklw7qE2dQ==
X-Gm-Gg: ATEYQzzaH2mn5ENqOT2398ZWcE0VWp7C4Mq0eCZzzfZtdF4M19Nn8VDt8jzjl1f/VWl
	IchPK8eYY6fDSCmRPimp5Vrh6Es4oZvHVbvBnknWIMxum7qGuzhraHu7SBu0ARqHKef2ZeygXww
	401PVnPjMQa6GLbE+paNrmmW6FQCH9FuY/6daMP2PjRmykvj+5EVEwNb2J4Ve0L+mKaVUE17VF9
	YbxJYg1sfcXTUvNSYxUe7OosQ+vbsqLUk1hK0sHMiHLuJoO3jg32elryxESncGPWkRBLPY2zrEm
	1MnFdxYGMrdj5EF7XxiKokRBNYuoiAScGroseZO1eyStavTZlSG2Vy9VvVkg8T119ZVOwgXwZT1
	O1Asq1v6Mp+I3lC6rP7jgjLjAWIU00ayYocfftKbOXdT4VcpJpmFx5yQiYVyb6jHVd08xMD+xnZ
	sXHB0ctA==
X-Received: by 2002:a05:600c:19cf:b0:483:702f:4633 with SMTP id 5b1f17b1804b1-483c21691d4mr68661825e9.4.1772108322290;
        Thu, 26 Feb 2026 04:18:42 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:40 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 04/11] spdx30: Add version extraction from SRCREV for Git source components
Date: Thu, 26 Feb 2026 13:18:16 +0100
Message-ID: <20260226121823.149327-5-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232009

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
- Uses fd.revision only (not d.getVar SRCREV) to avoid AUTOREV errors
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


