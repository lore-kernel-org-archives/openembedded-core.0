Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A31F3C9B0
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:04 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24293.1771950603224130172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EYUVKCAh;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4837584120eso40160655e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950601; x=1772555401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Qk7Rjvbl5D3sUwzio5VbRbngSILDJ6xfzAlu+8Vz/Q=;
        b=EYUVKCAhmiHy9aOy4MVSBB7FHbNmrL1o8EMpmKX8XcPlR5J9ZW4eeArANwn+Bx7Otx
         lwYl6G5yRLqiOkBCPutQrRNimSMZ0YpPJY/PYmlgImm7QNVCtbKTzHfcORG0Kraxojlm
         3+xiRGgzHzaMoSoRFmwRp+9oXaya4OspNE/vMeSedraK+TonhWHaGU5FmGbvvQUec4B/
         UwT0PS3jUr0fZxh86e1ayJRMZi3Fo/AapHjdnpq8ccwImZvhlfNDKPKtnYRyA6Fv2T8n
         xTULhwANe6gpN8wP5EgG5gVtV0qk2HJZ4s49A1GeW9fSsattlbPBN3dBOesJ9Mu07uZ9
         C16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950601; x=1772555401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qk7Rjvbl5D3sUwzio5VbRbngSILDJ6xfzAlu+8Vz/Q=;
        b=GXH/opAzLeRbfBV7cSba6V8sWpGnEchJCM7F1KL/pEhEkQWXo1bPsKkAjIV/sQgd2n
         RSjQIZW+t63zN7Y3V19/BKS9yMIxVJBycTXknP3Kl3dKT1euJYRk8lsbbxpdrQO/TVsI
         4biqKHl/9TniokEM5Vfi9yRzDZ0R0BlDDBd2986eS+WB92qkz9C4PddMBuSpEGgvqtOu
         RukWAY+mHx1bQ+bKCn8DSW4QLMwbsDIjewrLmF+mfgWEGJReYAKbZYatB+k1bdLZRT0I
         Qrf2YT57rFyMlfsumi1xQcJx2Gs9/glv0Ut/pGc84eVsF3RcyXadgf6Xm6ORoqbkn+1q
         lPyg==
X-Gm-Message-State: AOJu0Yxn90L2p8P58W0wmCmGHDZrgJRittd625iFitf/w47Fg6Gj1gOv
	+OSo9fJV2btC1IegwZL7aKcGHYVpGIkL4Ydye6Mg7jFrgBrUpg6YcKv9mdbmr5uG
X-Gm-Gg: AZuq6aLUauuQ3Dmoi3fkPmPJToeQJe8FMbsyyimx615fIntNNd2lksoGtbp6TVw5aXS
	YwMJc/b9ceyzh6FSDrx8EBe9ok4g0mvx31DSSmdW7C8f4Ixl4Sjvhvnv51kNo0vNuQ2W8f9HBCZ
	dtixfBiFCG2uBaIl2XVXp2D4wV1S2sJ7FAWaGETuF5TuNmMSQLpXg9cIz85EFPIalgE1WeaXFFX
	5IUM95Mnr/Ax2O32ZIickfOv/WAvwNiyFBvprJ0srX+nQEc0pB+SCKPnXD4DcnjmsnJeFm3TBbt
	xk1sxy47SjIdU+MPDE5hJvTYcgnP4EL+yknw2TAUkpyt/9DFMpjecCV6JAPcguOu4Mdla6ESAQO
	aeHyNcSg5gKTMaKwNqAlAjYwB1LVAxUbLo4oEeeKlVpjgiWfs3gu9uroKYaBm8aw57z8R5Rp4k0
	pTlSEKAhss8Bs/jWX4tDGtscmaH2XjhyPHgKOzK9nh8n9+PAI+4xWxerRRbbUJMeFVk8V5BdD1s
	4/QW+tJ
X-Received: by 2002:a05:600c:4f94:b0:480:1c53:2085 with SMTP id 5b1f17b1804b1-483a95eb365mr194135485e9.19.1771950600564;
        Tue, 24 Feb 2026 08:30:00 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:00 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 00/11] spdx30: SBOM enrichment and documentation
Date: Tue, 24 Feb 2026 17:29:35 +0100
Message-ID: <20260224162946.4000445-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231877

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This v3 addresses Joshua Watt's feedback by dropping patches that
conflict with his planned upstream changes and fixing test failures
reported on the autobuilder.

Changes since v2:
  - Dropped 7 patches based on reviewer feedback and autobuilder
    test results (18 -> 11 patches)
  - Fixed supplier agent creation to use direct variable pattern
    instead of broken indirection (02/11)
  - Fixed test to handle ListProxy type for ExternalRef.locator
    instead of assuming plain list (08/11)
  - Fixed test to use correct SPDX 3.0 attribute name
    software_packageVersion instead of version (09/11)

Dropped patches (with rationale):
  - sbom30: Fix object deduplication (v2 06/18)
    Joshua: elements should have unique spdxid in single document;
    if not, it's a bug to fix differently
  - spdx30: Add image root metadata package (v2 09/18)
    Joshua: his recipe SPDX changes will eliminate the need;
    primaryPurpose=container is wrong regardless
  - spdx30_tasks: Fix non-deterministic BUILDNAME (v2 10/18)
    Depended on the dropped image root metadata patch
  - spdx30: Add rootfs version and dependency scope (v2 11/18)
    test_lifecycle_scope_dependencies failed on autobuilder
  - spdx-common: Declare SPDX_FORCE_*_SCOPE variables (v2 15/18)
    Depended on the dropped lifecycle scope infrastructure
  - oeqa/selftest: Test for lifecycle scope (v2 16/18)
    Tests the dropped lifecycle scope feature
  - spdx-common: Make SPDX_LICENSES extensible (v2 18/18)
    Joshua: license list is specified by SPDX spec, not us;
    custom licenses should use LicenseRef

Remaining patches focus on PURL coverage, source metadata enrichment,
CPE escaping, and variable documentation.

All oe-selftest SPDX tests pass locally:
  - test_base_files: PASSED
  - test_extra_opts: PASSED
  - test_download_location_defensive_handling: PASSED
  - test_version_extraction_patterns: PASSEDJoshua Watt's feedback by dropping patches that
conflict with his planned upstream changes and fixing test failures
reported on the autobuilder.

Changes since v2:
  - Dropped 7 patches based on reviewer feedback and autobuilder
    test results (18 -> 11 patches)
  - Fixed supplier agent creation to use direct variable pattern
    instead of broken indirection (02/11)
  - Fixed test to handle ListProxy type for ExternalRef.locator
    instead of assuming plain list (08/11)
  - Fixed test to use correct SPDX 3.0 attribute name
    software_packageVersion instead of version (09/11)

Dropped patches (with rationale):
  - sbom30: Fix object deduplication (v2 06/18)
    Joshua: elements should have unique spdxid in single document;
    if not, it's a bug to fix differently
  - spdx30: Add image root metadata package (v2 09/18)
    Joshua: his recipe SPDX changes will eliminate the need;
    primaryPurpose=container is wrong regardless
  - spdx30_tasks: Fix non-deterministic BUILDNAME (v2 10/18)
    Depended on the dropped image root metadata patch
  - spdx30: Add rootfs version and dependency scope (v2 11/18)
    test_lifecycle_scope_dependencies failed on autobuilder
  - spdx-common: Declare SPDX_FORCE_*_SCOPE variables (v2 15/18)
    Depended on the dropped lifecycle scope infrastructure
  - oeqa/selftest: Test for lifecycle scope (v2 16/18)
    Tests the dropped lifecycle scope feature
  - spdx-common: Make SPDX_LICENSES extensible (v2 18/18)
    Joshua: license list is specified by SPDX spec, not us;
    custom licenses should use LicenseRef

Remaining patches focus on PURL coverage, source metadata enrichment,
CPE escaping, and variable documentation.

All oe-selftest SPDX tests pass locally:
  - test_base_files: PASSED
  - test_extra_opts: PASSED
  - test_download_location_defensive_handling: PASSED
  - test_version_extraction_patterns: PASSED

Stefano Tondo (11):
  spdx30: Add configurable file filtering support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Add ecosystem-specific PURL generation
  spdx30: Add version extraction from SRCREV for Git source components
  spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
  spdx30: Enrich source downloads with external refs and PURLs
  spdx30: Include recipe base PURL in package external identifiers
  oeqa/selftest: Add test for download_location defensive handling
  spdx.py: Add test for version extraction patterns
  cve_check: Escape special characters in CPE 2.3 formatted strings
  spdx-common: Add documentation for undocumented SPDX variables

 meta/classes/create-spdx-3.0.bbclass |  20 ++
 meta/classes/spdx-common.bbclass     |  63 +++++
 meta/lib/oe/cve_check.py             |  37 ++-
 meta/lib/oe/spdx30_tasks.py          | 339 ++++++++++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/spdx.py |  75 ++++++
 5 files changed, 527 insertions(+), 7 deletions(-)

-- 
2.53.0


