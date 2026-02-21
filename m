Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A9AC5DF96
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14945.1771650618490836259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dZZrsf2A;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so1755751f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650616; x=1772255416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiKPaFhKIlhWNRsvvgzgRXA9mRpOwoVZLSYE7VwsNdE=;
        b=dZZrsf2AsAMiLyCTt3DA1FC7Vkt0tcpkvsakhgbgFftS6wcYCDZic7DVLWK036TknU
         uXhtEomZuhGQnWcGXr3DAdC56mBbjdX0C2YyucsPxcrkiyoNmfPr0K5riPB7d6ZCE1yN
         K8zY2mppPYTaCszZw/8Q+b1nO1NY4q6EvzbkU3k2ooEEmBKgPrpTzT/c9LUmV9B59zSY
         IwJj+Ltvr3XVvGqGz+TuoBhh5SLWaNGXD8O8q0Wy8NzMs7LDlGjpnufb0tqu1LIj+5PS
         0/esTRleD4dvyzpi/0mCU4gT2AHK6TONR9nkljNP8yJir0d5XlTjs2yJ3hDcr+PmBqay
         xTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650616; x=1772255416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wiKPaFhKIlhWNRsvvgzgRXA9mRpOwoVZLSYE7VwsNdE=;
        b=bTd7jNZQEV3FGaxL6p80jJxwIvyJCIWENLR4M6UQdIhgJa8iROvF/0YTEs0a3PwF81
         sJE3lTNZAaCA4Sp6SRPPfyeBq9S+K8rkbUNnuUpfh5JD4+ntzDNPYH+jKWkswWt+PEYq
         mCoWAdjA7cZehkykGbHIA4d3Sc+IyIFfX+Tq5w+QSWKmFaqwAAQQTOl3H1vqGIAbaiBn
         PSd+cTsOq3ydeQFAMBkDhVlj1ABwYX9m9zoxWNhc90KO01GkboLPEvut3tFmiT2XSjXF
         eawfLM0A/e+KZZOfM4C5ai7zeTaOSMRNPcgtbDgzEbN7oQRjGGYnO0AL4eq8I/j40fr8
         tp7g==
X-Gm-Message-State: AOJu0Yxuyw0blbXmP6q1PP52VjTbCnDDHyrsMpdpdtdJQxzSRfIBH221
	pA+3GVB4RYxseGZK5bQH2+gKn7LWVHst2Rq5zTUz0zYYu5KXV0j6JAMyfKekBg==
X-Gm-Gg: AZuq6aISNUVqK/ncerq4IxoI1HOXWP6aDHmGFFutbaV85rK/Z1lFisLpZK0StL2w1eU
	GmkaIWGAZiZAMMNKaziON01i4HN3kl13Xpqr+MoWI0oPYSCWDCCmSELY/T/iZag2ukPkEeOes15
	qQgJDz7qqlBpnd0ILjgcr/8zOmD5n9Wh6WYr1uGc1itsNbhwXPLKWPCcPpb/lqPqFe0v279RY7y
	+9Ur0nkTaSqm9IwktYYwTA9qqeECbmao0tdGfod+Fs6DlJ1+mSyLha0uUbuLsdoOQzMbRuqHogE
	TDmlop/IJms8NfGYaDLLTpwmzi+dNklOEm5gc88226226pKN8Y8RxNp0v6ATryk1G2IrSPr0DJN
	X6Oo0ODyYtA7GKZCRd5g3861dQpdRxT10WTATFRexeIbiYdp5yeuOlmWprhP9dR5C5AiWwwTYgg
	+5vOdH/uhWwf6esa3VUXkAbgFiHbD/+o6Ljoo=
X-Received: by 2002:a05:6000:1883:b0:435:a3b9:9b8 with SMTP id ffacd0b85a97d-4396f15b030mr3782187f8f.24.1771650616441;
        Fri, 20 Feb 2026 21:10:16 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:15 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 04/18] spdx30: Add version extraction from SRCREV for Git source components
Date: Sat, 21 Feb 2026 06:09:52 +0100
Message-ID: <20260221051006.335141-5-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231584

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


