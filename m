Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA6EFC593E
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:18:40 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68795.1772108316972856442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LsmpBIqb;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4837907f535so7510675e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108314; x=1772713114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=meumi0axU6vKsOOCsVM8g2Sr1vRrqaKSZmDxKRjJUQ8=;
        b=LsmpBIqbm5wejMP29W3BlGddwN34lAG1NqUA4qd5P95CR7wW4dL8ct9SkqU8vfnUvX
         gqE09Kd8r7jkcnMr4iF0ZQdsXOu/4xKi9qWSBAi0AUiPDfLQi7f+RwDqWv91NyfU7MXw
         GluZaSCcCNsKKfy7n4nSqbMGDzmklnYF1auQEZ0fYnl1X65A/TMogQcnCjmfc/fk40uY
         MJSoLPZfPbXHtC1ErTmaDjCZt19s4YJjgF4UJeJildKlQ99qAAX2AaXwBsW7ebVHU20L
         QT3dys6vef1x1oDDPySImHha6RV8kEGvskx7B+CBkb7QtlOUk4sPkx6ZawL9RXBzxJzV
         QS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108314; x=1772713114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meumi0axU6vKsOOCsVM8g2Sr1vRrqaKSZmDxKRjJUQ8=;
        b=gB+jKBjiKh+vJMPnwuJjA+WjN7QVOWRZDz6x8OBNtJWT6UsUvNiUXN39Pp+fe/DQ0e
         eBFhEzuECCnGH5ojcspJyqFiAPKk7XToWbjGjk/AaBREe4otzFo8SEctwtWphGA9YqRn
         /Zv+F1Bk4+T6s+8s/HPcLd8rYdOp8U95f2RW43PNrf8lXknYZRqGxlNzl4zNq2T2ADoE
         raySGvzsRruXN4KdInU8ZlX0BMFw8QMAxbeFerr+1YAnr80yeQXm4PpMhEB6vUeQcORC
         9k4Xv7fEDBTn9P4+wQaa5WIK3W55ykd4F8ktXjvNR/uG2+I+vDZUbty9ytzPCuYDXNX+
         pwwQ==
X-Gm-Message-State: AOJu0YzcGYqlAPnuaJEUDaPheTmXiBqdFAdQlTkpaL338ZZqfb8WNNEq
	z4FwvCYOk/esXtqFLqC9qNFy0SIeNKEKzcQZlhGfAt/+Tra1Mw6RLNuNjaMjET7U
X-Gm-Gg: ATEYQzx9byCU4xVGxy2EzVnx83RCUl2ik79XYPDnzi0RayUvP1GbbFco1sRvYZPC3Lg
	8temytvjuzAsvKapgHQ6Wt0RiuyX+iYfCTpu6I9nhkgdM87YZkccFHDMdi4G82ODBCHCuB0PHma
	mIvp33ZHCO16qhMjHd/+6FjrJqeKKp6F9n8EZaR/tNhOWXax5Zz8314VTGLQOhahvVlWmdQ/7ge
	c6+J5FOFN634dJX2291eu1+zJKYN6BT78l5l4oJ8r3MvFC0tMM+ITE1TPY/+ezbbSmyTqJ0++rx
	MV5N4nOwgoVmFx4k4eTJL6XJYXMApyMxg0T3kQx2M658+YwPHMg4MkxGEoBGZ6W73myXUwU5Int
	QK7STThBXwLHBcDWVLToOhfuUGKCKCUHU4+qfPfhqvA0I8NVnfqmjiYXYa7VwAvKW30HkH5VMzB
	62PLj1sw==
X-Received: by 2002:a05:600c:6098:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-483c21b31b0mr65991025e9.33.1772108313367;
        Thu, 26 Feb 2026 04:18:33 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:31 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 00/11] spdx30: SBOM enrichment and documentation
Date: Thu, 26 Feb 2026 13:18:12 +0100
Message-ID: <20260226121823.149327-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232005

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This v4 fixes the recipetool/devtool selftest failures reported by
Mathieu Dubois-Briand (Bootlin) on the v3 autobuilder run.

Changes since v3:
  - Fixed "AUTOREV/SRCPV set too late for the fetcher to work properly"
    errors that caused ~17 recipetool/devtool selftest failures (04/11)
  - Removed d.getVar('SRCREV') fallback in version extraction code;
    this reference caused bitbake's signature generator to trace the
    SRCREV -> AUTOREV dependency chain during recipe finalization,
    triggering fatal errors for non-git temp recipes used by
    recipetool/devtool with HTTP sources
  - fd.revision is always available for git sources after fetch, so
    the fallback was unnecessary

Root cause details:
  spdx30_tasks.py is registered via BBIMPORTS (oe/__init__.py), which
  means bb.codeparser.add_module_functions() parses all its public
  functions for variable references. The d.getVar('SRCREV') call caused
  SRCREV to be tracked as a dependency. During siggen.finalise(),
  expanding SRCREV -> ${AUTOREV} -> ${@bb.fetch2.get_autorev(d)} set
  __BBAUTOREV_SEEN. Combined with __BBSRCREV_SEEN (from
  fetcher_hashes_dummyfunc), the sanity check at ast.py:550-551 fired
  for non-git recipes where __BBAUTOREV_ACTED_UPON was never set.

Verified locally:
  - recipetool create (HTTP tarball): PASSED
  - recipetool create (git URL): PASSED
  - oe-selftest recipetool.RecipetoolCreateTests.test_recipetool_create_simple: PASSED
  - oe-selftest recipetool.RecipetoolCreateTests.test_recipetool_create_cmake: PASSED
  - oe-selftest devtool.DevtoolAddTests.test_devtool_add_fetch_simple: PASSED
  - All SPDX selftests: PASSED

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
 meta/lib/oe/spdx30_tasks.py          | 341 ++++++++++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/spdx.py |  75 ++++++
 5 files changed, 529 insertions(+), 7 deletions(-)

-- 
2.53.0

