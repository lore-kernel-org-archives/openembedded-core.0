Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12CAF33A92
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:00:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69536.1772805612129953712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 06:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OUN39z5D;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48371bb515eso137653845e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805610; x=1773410410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecAzM+rinuiiLRIleyCzXUsXKLx/YWTVTQjxZEeZpU8=;
        b=OUN39z5DJhYgkUocDZt3m4KsBKvFwFztxBQPgJmf+U1KaOK5+2puWaTlp42NN+Zuav
         dTuf/0gg1H2xmtm6NBTMAjuzsholmCYYKUyBWdAaE4Fwtjq4AWarC1oGY3JnWjLRO9RW
         B4snB4yUfGiOsWT/TDAdoSmuGIMwqugdRuyuwr9jCsmA3tS/biYQ8yFlBaiTPLHGDSfE
         Vz6maIIPScBhMQVAeris/9sady40WIx6xQgB25fFa6XZodSTgomrZXGrHKNTy/0Qvh2E
         w5Yn8iHgM5WpmTCTXIeNhvPREahVb9mCUu/n7+Txd12E70SjjY5CbTjdmI26XSlaVYFp
         mSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805610; x=1773410410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecAzM+rinuiiLRIleyCzXUsXKLx/YWTVTQjxZEeZpU8=;
        b=LuNyIUVaVZ8aU0sNetjBOjFx7X+HYn2pA0ZRk64hThxiV16TC5Sv+wtSMopVkouHNV
         wW8BPsTkMzBZnnOKkpTEn13y/BGQONWyjRBdldbHYHkcpmD+luq5XFEwB81NopM2Usf2
         InBuArmCyNzmF4cIiFOlUofvHXwV+E8YZja7UsfvBMfQz3lmaH/pSFpgppOG+o2897je
         M/zqvT0QLxYIVar5vHS6zEsciXiraZEk/il4q4hxaASe5UvhRmkUFWcpk57kngvUeWc8
         ++/QSJBM/FHbqfvKZbJ6QH0bieKXfOsG7VwSVr4b2VJ8KwfhWAh7r0E9bow8PLL/USzi
         nbIQ==
X-Gm-Message-State: AOJu0Yy7YYRcvRAazy4Y65p1kqTkh73F3OerhQGqaQqW6yq6cjtnO5lu
	dInl88SSJhSQPbon8EjrnQ892m6XJiRpAN0h7247Mvg3cSYwWUPKHl5CR/NVJg==
X-Gm-Gg: ATEYQzztW0iqjtalMvWuMGjMT3Bn4Libw8fRxeOdYbAzCu2LDeyjP1k0/2ntzrQjssQ
	tisHGbnQFdI1bTk9xKmWLRhT9VsbXdDHwgG4ooWCr25SZxbHlVM7K2lDOjAQoYp0ejJGw1oZR1k
	yAXsIf0XAUHJXZ13M+D0y2ldGdNATHfW7HHwU0s8IPkwZROmj+kYoSYrSAWUaaCLfsLwo6jriUO
	58ZXPfra6cwQ/icLTPtzWmJFbjYwgfyDuy4I2xmmhhzyymPOn78e/rJWlsq82cq2vio+Q7k/a4N
	73jFryDvQVEDfG4RWkDNrPsDQm4757Ik3s0G05rzyMDfOgbrSyQnjchU76ZFDiD434vCMotSAHI
	JU78SY8RchV4K3ndvGXHYL06KgEYnrTC5A84alsxa6F8L/CWX2dhlTtW9HpiQhfVUvvi5rOEAti
	ve0tJVQhHskyNEnWRkv8qBcBDd7CmdRpDvFJIyDo4C8nRmcX90A3OPp9nwt8i+6aI=
X-Received: by 2002:a05:600c:6299:b0:483:c12b:fe4b with SMTP id 5b1f17b1804b1-4852692397amr34744185e9.9.1772805609711;
        Fri, 06 Mar 2026 06:00:09 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb4257csm187098845e9.15.2026.03.06.06.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:00:09 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	joshua.watt@garmin.com,
	ross.burton@arm.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v7 04/10] spdx30: Add version extraction from SRCREV for Git source components
Date: Fri,  6 Mar 2026 14:59:56 +0100
Message-ID: <371d53717b0056f29cf706da78f4346b9e95511c.1772805096.git.stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 14:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232570

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


