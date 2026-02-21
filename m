Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAF6C5DF7A
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14436.1771647868169470695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fwbhNnq7;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48371bb515eso34744525e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647866; x=1772252666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiKPaFhKIlhWNRsvvgzgRXA9mRpOwoVZLSYE7VwsNdE=;
        b=fwbhNnq7JkmzKep85OZcwd0QiW22rhU1uaVYgCrNbAFlIfJs7mT/6/Tt7HPxs2o7qC
         3+xS89woFM96wMo8YBcmDrbUUujWZn/zue52Rwt65xuU/9imyvRWUHoj02H7Dleq9Mj3
         3FMw11NO6aAX6OAGnCRty1ZO2Oa1YPU8F7UbVfNf4DlrKVZsKcFt0gXeZ1aVK4mBlhq2
         ODvRE0ZorV+dBscTfL7iwukm2QQc9v/TE83es0KE/uBF5wl8cL0Utj/vN5sQY5wRYJcX
         PW8vCzw/wq0zPgMCiZWhoMNhJgVpXC/+UmPXCcdstLzx4HfSmTL5uOgLlAqajZdx4wJ0
         eDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647866; x=1772252666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wiKPaFhKIlhWNRsvvgzgRXA9mRpOwoVZLSYE7VwsNdE=;
        b=A9XmXC+yt5xkjhj1HWM8rPVuW+Hed9Z/g++zOw1YSJXEeY2Ktj6oPKTgtbLzz1AHAL
         AYNHJ9KKkAiKrhRYvjxAB+SRVvQFPitQUeZbR0oGdtbcxNJ8JhdUkP/pcXLSG5eB8t8N
         xnJgeQoWHg8GHmPbXsQxI09kl7hGuU9OCOQH5ewDyyihN1wz3KVzyHX2wbyZjj3Oa2Ow
         iSO/UFNsoK8gxfuUCEP/HPZXJGQT+tC8DrcqtfmJs7GCIYzrM6l/gFJ+zTkWGovlQm46
         g0pnIVh7Dot0BiCmK47Q9D444KoakMRHWW83ZaHu3dRkGbcKt7dKl86HtUOgTnfWNmVm
         9KxQ==
X-Gm-Message-State: AOJu0YxF2XnnLR19n+fptYAAUlwUeJ7EZ9zUWJGvOHitPeqdyneEFUko
	WHxm0QWQnH0bbL1ugI9B+gG7eulv06U+6G2gZCZk7m7aeRLWb2nqiQM8FJ/YaQ==
X-Gm-Gg: AZuq6aLI/VfKDRlzqnN9Xw2T/Uj36PcIgKiGWVx+uO2Xn5nTclIsUtKy4VoYCmmPnoL
	LeqSSO1sV2xFKsYB0jZhldme4huOb+RnWV7khSCC6Sp1fi0DsyL/bcYqlmSjjkYvt+YgkUGJy/m
	EDQ0IDRjA9Ikc5E2H+Ovfk3xp6AcozoH3VBkiLThk8yIQmDDdv59UuSb2n8YnlT6drgNAoYW+P5
	VvQJuN5pvJZ568IT3ivFmJ8gygSKuWbHr9lgPJ7cN92JAbZGI5trNaSP7lY1UpyOTOcMvNnrIOZ
	UuEPumb0d5KytElpBUfJT3j7cRNCZFYS23zbBDSfEjphT21EJrG+ei1eMFPskfIvyQHooHs4wGt
	/9Sq8SjiPGce938X1arNG7WNod3tCd4GvRjNFxoj5j62iialG3Ywet5Go+yz/0Q7WSU0onR2Fu9
	L8pPstsNYRguXkq0nxW2jCfqZnRkfKAcwS5Fc=
X-Received: by 2002:a05:600c:4e46:b0:483:a8e9:201b with SMTP id 5b1f17b1804b1-483a95a3851mr28405035e9.0.1771647866063;
        Fri, 20 Feb 2026 20:24:26 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:24 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 04/14] spdx30: Add version extraction from SRCREV for Git source components
Date: Sat, 21 Feb 2026 05:24:08 +0100
Message-ID: <20260221042418.317535-5-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231560

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
index 0ee39ffcd5..970921e986 100644
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


