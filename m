Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36BFC5DF92
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:13 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14918.1771650611138525048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YsHBA6Jw;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-436356740e6so2873130f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650609; x=1772255409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=whKfnyoxUEyHQgifIlu7bUpszQl0RLgQegJticbDyOU=;
        b=YsHBA6JwgQb+DB9CQz1GIEykAb6EjKi1Tta2Hu4oDulBGcQct53r5olZK0Og+45Ep4
         dsQ4BWWuWAXYQzTxyxjVQmvrxyfLxr+EXNm+7s+9MXQzdXMYimpNW5bsKeDzFQiTWxUw
         dGAF4s94QaC4z1SuHdrmeNrELk5GvftC5BTF2TKQ0gNKFy/YvAMRIsNGCdNJtbk6WOB9
         anWSrArby++cfvp0r6dfSy8itguwWH8gP8Brn5Qqa1BkQ4VZTA6XPNEwc4+xPJhnsri1
         xhaakT2w3V18Lb7FjCCLEsf/4Uc4q9nP8g/kNs/axr+MfTS3xiWv6jNDAi/L7cMNmG6w
         u3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650609; x=1772255409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whKfnyoxUEyHQgifIlu7bUpszQl0RLgQegJticbDyOU=;
        b=prx0Hu1mJrSUdUyzJhhmWRDDsYcQzeCLzmCYL4sJsvwghQz9L7GvQgQi8vADI37NOQ
         s1JxUVkDiaJDYeOYDl4Ohvhz2fYz58ZwCOLtNxEWRdJUABrxLPyRCPfcvxaVvWPWVB7W
         wO5zRm050Q+fY6iYLY5AqEiZcN80QblVu6FhL7btDOOjpqDqJvD/3Phgjo1bgIEukXbp
         NZO5iGHvudk343LODFn48wBdRAlHLg4tN85ngngqsxY/e+9fU4bvIVqYQ2OzD3YvX5lT
         njWEB/KY1Nzhvo8eiu3Gmjxpl10VtPYErON5vSnjgOTzvrDzJf0vWtYW7gQB0a+MQ+vu
         BOMg==
X-Gm-Message-State: AOJu0YwwQ6yTkX9GKrf6Qg9t91JuZ2dKRmlRdaTEg/r20y20YBduD9PJ
	fa65HYvd0K7R4newOFn2rpZ2IiqsB0eH4xOJqaPC4gOh+svfg7+cVDkzfCs1vKxL
X-Gm-Gg: AZuq6aJhhZ1QbfoE2mkM6qCMabr3jdTLlojBP7ypfJLdubL5PJOGmiuOB10uFbUMHbN
	0itIH79x3Phth9THO4W57aYqsLGA8V0eMtRXHRfgf4A/kqJuazdI99pRqxEEyhcxo++ASD2hiL4
	N2jRnAeJY7Ac7W6Def31u2rWZsmIQ6Tm+jgQgaJSHkHLNjmazA+w78FmjO8rVSdnkGiKC5fGkse
	ptOImyplKrXt3bRFt924YzCGTuLx88MUfg7PAZAfGpaSsh6bt0YvK5TjqiIjGFEVAvJMEa2akMX
	JZ/MJbA8I1J5H9zUkLI+YGoj2hE/SwvbISJ5IpvghCLCTWWhXv2qzgFQwc6aSJb4/WCPwnv0F+k
	vFf2vr8QVmTvHtnEfDrSrTB3CzqAUFJly71OtkuvNBpCdHdUlmpY1fqssQ6PjRUKxyfUqnZfUw6
	83ZEeWn1yP2Jo9BKduwlMYpDje4LUATyE/RWk=
X-Received: by 2002:a5d:5c84:0:b0:437:6d8c:c08b with SMTP id ffacd0b85a97d-4396f17fc6fmr3434150f8f.49.1771650608815;
        Fri, 20 Feb 2026 21:10:08 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:07 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 00/18] spdx30: SBOM enrichment, lifecycle scope, and documentation
Date: Sat, 21 Feb 2026 06:09:48 +0100
Message-ID: <20260221051006.335141-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231580

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This v2 consolidates three separate patch series I sent earlier into
a single unified series. No functional changes from v1 -- this is
purely a reorganization for easier review.

Changes since v1:
  - Consolidated three separate series into one unified series
  - Rebased documentation patches on top of the full series

This series enhances the SPDX 3.0 SBOM generation with improvements
focused on Package URL (PURL) coverage, source metadata enrichment,
lifecycle scope classification, and variable documentation.

Patches 01-14: SBOM enrichment (PURL, metadata, compliance)

  - Configurable file filtering to reduce SBOM size
  - Supplier metadata support for image and SDK SBOMs
  - Ecosystem-specific PURL generation (Cargo, Go, PyPI, NPM, etc.)
  - Git source version extraction and GitHub PURL generation
  - External references (VCS, distribution, homepage) for sources
  - Image root metadata package with describes/contains relationships
  - Rootfs version and dependency scope classification
  - Object deduplication fix preserving complete metadata
  - CPE 2.3 special character escaping for SBOM validators
  - Two selftest cases for download_location and version extraction

Patches 15-16: Lifecycle scope override variables

  - SPDX_FORCE_BUILD_SCOPE, SPDX_FORCE_TEST_SCOPE,
    SPDX_FORCE_RUNTIME_SCOPE bbclass variable declarations
  - Selftest for lifecycle scope classification

Patches 17-18: SPDX variable documentation

  - Documentation strings for 8 undocumented SPDX variables
  - SPDX_LICENSES made extensible (space-separated file list)

Total: 7 files changed, 797 insertions(+), 16 deletions(-)

Stefano Tondo (18):
  spdx30: Add configurable file filtering support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Add ecosystem-specific PURL generation
  spdx30: Add version extraction from SRCREV for Git source components
  spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
  sbom30: Fix object deduplication to preserve complete data
  spdx30: Enrich source downloads with external refs and PURLs
  spdx30: Include recipe base PURL in package external identifiers
  spdx30: Add image root metadata package with describes relationship
  spdx30_tasks: Fix non-deterministic BUILDNAME in image package version
  spdx30: Add rootfs version and dependency scope classification
  oeqa/selftest: Add test for download_location defensive handling
  spdx.py: Add test for version extraction patterns
  cve_check: Escape special characters in CPE 2.3 formatted strings
  spdx-common: Declare SPDX_FORCE_*_SCOPE override variables
  oeqa/selftest: Add test for lifecycle scope classification
  spdx-common: Add documentation for undocumented SPDX variables
  spdx-common: Clarify documentation and make SPDX_LICENSES extensible

 meta/classes/create-spdx-3.0.bbclass |  20 ++
 meta/classes/spdx-common.bbclass     |  81 +++++
 meta/lib/oe/cve_check.py             |  37 +-
 meta/lib/oe/sbom30.py                |  47 ++-
 meta/lib/oe/spdx30_tasks.py          | 483 ++++++++++++++++++++++++++-
 meta/lib/oe/spdx_common.py           |  31 +-
 meta/lib/oeqa/selftest/cases/spdx.py | 114 +++++++
 7 files changed, 797 insertions(+), 16 deletions(-)

-- 
2.53.0


