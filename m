Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6511EF9016
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:05:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23514.1772643945973586086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j7ICOy1T;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4837634de51so30401915e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 09:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643944; x=1773248744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhwOz7dXSkYuUagw2Zw+jZRFdE0Y/uRLdLQAIjSVuyI=;
        b=j7ICOy1TfvkHzGXjXt5i9bWjkD55TOivwn+cWYflcMSyItpXDRw/wBIwZebuhhKDsD
         6SBZklVLu5I1W7874E6hbTX3pfcoVYU3/CAb9s92N51PDSJndmUYrmCnZvgMbsAr9Dnf
         5M0zOk2r1FzgnG7lXlFcNnYrWUN2BqiDMkHtgRpHe38H8piPwwvpDdkQ/EeuiZEhYYRb
         rZxNcN3naJj2GkweMH8OLX/sVky5GuN0g0zbGQqTRhBBne8Ghyh2u/nsAT7Au/FkCChX
         WNMKvU+8/zfVs/D5uUqdupSNEiwvdJa7GB/iCihABrF4Sv8Yvjj/mL1a8R2a7bvs6DMC
         8/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643944; x=1773248744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fhwOz7dXSkYuUagw2Zw+jZRFdE0Y/uRLdLQAIjSVuyI=;
        b=QxrPwCC0MnzNFB5gGhhqDrtfIUObDJdKuo7HiMsBcNuU2LF3zwgo8tdbFlSPTl02/h
         2kjIRwjHcZniWSMnnu9eMaf5HusIAJkIV2k0V3lawJQ0T5U3zdJ3RLOTYQtWB9DzqYrL
         300yQjY3mdCyLvSxYTO5aIWGFoVb3Oli39Ejao8bGRXvlLE+ycz34kN+GYOt+iRbsHXz
         i7u6f1D8iBsfIsF19s+wvK3HQFWwFTeRpTV5qkigcI0JD4LFQbzcO+Azf7Ivj0tZb2re
         zQA/vfsZcZNprHAvhjY+5U5c3yLqG/V6ymBoKuw+jnvm3wiijFks5jZgU8Fc0PA8RPP0
         rspA==
X-Gm-Message-State: AOJu0YzqKNUjfePkFbnDnsoA35iKJ13d5taNpWk+qtQ2VYRsnfFSL3RU
	1T9oAWp7mfJzIlCCyko+ILe6+rZNLLRBxIGg5POYdDrdiA/OWPV3HvOJoa0UuA==
X-Gm-Gg: ATEYQzxiuRHW0+Qzl+c6VTSRzzxi88GjYPb7xyYjsYqEKsnYticEJCAMPnVDCK8z+xq
	RMgsBWhg30+N1kJzajZTXCHrB8vuayGk/uS+1ZEN/Aked53Ss9DQpuGWI1PESXYTIZAGmxbGlZt
	07aMm69eTsjn30SNiCtIY+1AbMnmUFfMrzqJT8RgbvRcDkhaXNSUWFoV4YWP0jq3biCz/ZKLvN5
	Tr5tgJkZ10Nb6ol8JBSXSL4oXSaKHjUxlUWu/98L1EUdJXqyWZeig4QdCoGnQv1FEscfXABcZkV
	PqrjF3bNilChJIOiYSdTyEcuQ33RXe2zoh6OTIwqcSpL1yLCnUJrqMRZSdOWAAY6yFeomLsK1u2
	4WKgJKqWqEAEDdo4Hn3AzlwZdo542OSJn4MOXTz/j433QtEPbCIAzW+mKihoOqY2J5nI9Mt9X7P
	asP9c2qxtLWAeYWcMbQvjcznI=
X-Received: by 2002:a05:600c:a51:b0:483:7ae2:1737 with SMTP id 5b1f17b1804b1-48519888e3cmr47997365e9.17.1772643943578;
        Wed, 04 Mar 2026 09:05:43 -0800 (PST)
Received: from fedora ([165.225.94.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm78557395e9.12.2026.03.04.09.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:05:42 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v6 00/10] spdx30: SBOM enrichment and documentation
Date: Wed,  4 Mar 2026 18:05:31 +0100
Message-ID: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232403

This v6 fixes the autobuilder selftest failures (25+ devtool/recipetool
tests) reported by Mathieu Dubois-Briand for v5. The root cause was a
reintroduced d.getVar('SRCREV') call in patch 04 ("Add version extraction
from SRCREV for Git source components") that was accidentally restored
during the v5 rebase/squash.

Because spdx30_tasks.py is registered via BBIMPORTS, bitbake's code parser
traces all variable references in its public functions. The d.getVar('SRCREV')
call caused the signature generator to follow the SRCREV -> AUTOREV
dependency chain during recipe finalization, triggering "AUTOREV/SRCPV set
too late" fatal errors for non-git temporary recipes used by recipetool
and devtool with HTTP sources.

The fix removes the d.getVar('SRCREV') fallback entirely, relying solely on
fd.revision which is always available for git sources after fetch. A safety
comment explains why d.getVar('SRCREV') must never be used in this context.

Changes since v5:
  - 04/10: Removed reintroduced d.getVar('SRCREV') fallback that caused
    25+ devtool/recipetool selftest failures on autobuilder. Added safety
    comment explaining the BBIMPORTS/AUTOREV constraint.
  - 06/10: Carried forward the version_source tracking from the SRCREV
    fix resolution (context change only, no functional change).

Changes since v4 (carried forward):
  - Dropped v4 07/11: "spdx30: Include recipe base PURL in package external
    identifiers" -- superseded by 874b2d301d (spdx: Add yocto PURLs,
    Joshua Watt, merged to master Jan 8 2026)

Stefano Tondo (10):
  spdx30: Add configurable file filtering support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Add ecosystem-specific PURL generation
  spdx30: Add version extraction from SRCREV for Git source components
  spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
  spdx30: Enrich source downloads with external refs and PURLs
  oeqa/selftest: Add test for download_location defensive handling
  spdx.py: Add test for version extraction patterns
  cve_check: Escape special characters in CPE 2.3 formatted strings
  spdx-common: Add documentation for undocumented SPDX variables

 meta/classes/create-spdx-3.0.bbclass |  20 ++
 meta/classes/spdx-common.bbclass     |  63 +++++
 meta/lib/oe/cve_check.py             |  37 ++-
 meta/lib/oe/spdx30_tasks.py          | 333 ++++++++++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/spdx.py |  75 ++++++
 5 files changed, 522 insertions(+), 6 deletions(-)

-- 
2.53.0


