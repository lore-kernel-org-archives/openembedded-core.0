Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6F2C5DF7B
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:32 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14433.1771647862983138751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F4hXvviU;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so24829095e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647861; x=1772252661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lWPj8rnHdpM6k+2fSNMEeIKh9j1yTzLYp1j66ywsYr0=;
        b=F4hXvviUFrJTN2TZ26C3Bi920nT6eN0Ds+H2j+bfsUE1EPF0GRdbfTAanRi+D73O+a
         tuNV/BdBWZhIrrJGyN/mgMNqdg/DtwzASUr6GxkHOpBbYsfZN51KQXlxiWSsTEKa6EXL
         vUfblPEg49RoasprUr4HLaQiGE19uUftHBzEbUFEdeMOw+FdAO+8xbd7ZuflM+rIbg6e
         Kzjxz3Yj80ITE4I8FSwpJ2gj/T8LEejExSVVhE2mVP5aDoP1KGxdiIlu3SEL3x/uPbbl
         ZkIFT63J6Ox2i1MJ76lalPZiVMoBS8a3NvpE0Z80jKsUjgpNs1Ts1kh6hMJRjo34ogxs
         8p/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647861; x=1772252661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWPj8rnHdpM6k+2fSNMEeIKh9j1yTzLYp1j66ywsYr0=;
        b=SAYZ31h7ECfiacsFAcjD+2oOTbmgM7dClZE6uEKaleo3lWdwUwnoqdKDgFMyoIbRE9
         Ergbo68sSODC6saiO+B/GtEnN9FREiDVNZOeedTcV7LgTBrXOi4SPzo5nO3CmNKHMMnS
         OPisvq/TdcHLs8s2YhIhC0DjKM1zZ1VFYWsKu/pqjBmTE/UhxX2rqjGAYGde4Ug8jr9b
         n9m8se1FDkxeep/tvkcMvTxmvsYgM0t8HSeWoHpdR40NHbvQX7ZJFFjRgocLtefcZGkK
         4S4p9a8bJpT2OV/HxKKTyTpVLSY9PkBqJKeNx/9Mjiy3tX6y/M3ZKGewFxuTYuIMxIlt
         NNKg==
X-Gm-Message-State: AOJu0Yx/7RSOx0TQeywHCJL8VfaMuvOdBJyj0hwvEFa0h0GQ4j9ohy2d
	1l+N4ceQavtb8ph+PSclHxADgLUG2s/xH8Xw62b6SLApXscyo11qIoZugl6UEg==
X-Gm-Gg: AZuq6aLMzkA1DIdQS8v3g5Z9zOwssVhC1ctwj2+H26PCe9gpTTfHi14Fjysde6OV3rZ
	CYQsNXAPC5byUwbyhyT0eaDhoKIReSMfduOTuz6+b9FmMd7iVIGPLxwyXnxhJ03ug3HZLG1aDDz
	31qeM+ijfzDrYXekP54yXyPKQjlN0avoqziHn7PcRA+oTol74hXXgcG7Stjjbv5YIZ+UZ8s/Yle
	ad1w3IIWUaSLCXT1LxYnk4oDYYgiwDFa2f9Hhmlo91NQOAPCs8MOSOkl+zjrDJDlYZnKytpzs09
	j1mWHdFylV3StnULVdOxVoYu0olKQWvWNIXGiWPaExgNyblx6KqLfcYrORryP9b2QlaoXEDUu3M
	o5+h3JrgKCGBByjm3x0N0pHJ1rXkJKdKNtnt2AYf3U5S3svi0HuEnJP9LX9rdeuBEnA0ZQYwQuX
	NTUwnmDL/diRTcNsuYYMYPLns5StR1Z5Jb/uU=
X-Received: by 2002:a05:600c:46c9:b0:483:a21:774c with SMTP id 5b1f17b1804b1-483a95eab7cmr28905705e9.25.1771647860653;
        Fri, 20 Feb 2026 20:24:20 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:19 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 00/14] spdx30: SBOM enrichment for PURL, metadata, and compliance
Date: Sat, 21 Feb 2026 05:24:04 +0100
Message-ID: <20260221042418.317535-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231556

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This series enhances the SPDX 3.0 SBOM generation with improvements
focused on Package URL (PURL) coverage, source metadata enrichment,
and compliance tooling integration.

Key changes:

  - Configurable file filtering to reduce SBOM size
  - Supplier metadata support for image and SDK SBOMs
  - Ecosystem-specific PURL generation (Cargo, Go, PyPI, NPM, etc.)
  - Git source version extraction and GitHub PURL generation
  - External references (VCS, distribution, homepage) for source packages
  - Image root metadata package with describes/contains relationships
  - Rootfs version and dependency scope classification (runtime/build/test)
  - Object deduplication fix preserving complete metadata
  - CPE 2.3 special character escaping for SBOM validators
  - Two selftest cases for download_location and version extraction

Total: 6 files changed, 687 insertions(+), 12 deletions(-)

Stefano Tondo (14):
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

 meta/classes/create-spdx-3.0.bbclass |  20 ++
 meta/classes/spdx-common.bbclass     |  37 ++
 meta/lib/oe/cve_check.py             |  37 +-
 meta/lib/oe/sbom30.py                |  47 ++-
 meta/lib/oe/spdx30_tasks.py          | 483 ++++++++++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/spdx.py |  75 +++++
 6 files changed, 687 insertions(+), 12 deletions(-)

-- 
2.53.0


