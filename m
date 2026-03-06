Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5632CF01839
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:00:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69532.1772805607279559127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 06:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jqsl1Cfo;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso101205415e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805605; x=1773410405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ptc8yOHQ9vGd8saVcLYWE/oQTTyOjA9RI/dVUvYNyJ0=;
        b=Jqsl1CfoDRUFo0jU9f0wVpzSlrw4QocvxKFWhDX0NWXjTBU+EQutrCshV6MC06XQy9
         uIQ48cDBDdZ9OEeLijoBr2u9R/I3lbYcQYv1COw6jj769iOUb4zzuXCj0eo55c94ccKZ
         72+qbzpcI40bQQzk2U/DVgUhJVlWS6VdlgTUve6in3Hd66xm0dqXCQS5OqLSbgV/+V5B
         CLQloEiIcE2f6zJh2/5fQM3DG7a2OrBv0O0McwrXshUbgU47U8Nf45kxjQdSFIMKYynQ
         oJY4oE+LsZPGKWDScMukLuqXoh1FG9Iw4GmrW7OS76HE+69oU3ZWcrwFqwHh/VSXHsvj
         HPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805605; x=1773410405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ptc8yOHQ9vGd8saVcLYWE/oQTTyOjA9RI/dVUvYNyJ0=;
        b=ZCiKTVfMjQWGSvHW3bOemFYgpcRmv5LB2Otycaq1co/fXvMp00gFh3reRULi20Ilk+
         Ny2oV6ruor4ERm9n44njjznXuhJT797ODxg/0h2ae/jw1EDqUXd4bodpYFWMWv9Pbfix
         2KHwM8B7IOJ4BaTxFhyCZezKVCe4aW0SGNIMpzDSGFtkFp92goet2/UyhFiEezwJZT/z
         PL8Q/AefC5KHe3hSRj8Bkw07ABWyXe+Fy1wXjmeU4aTQ2sWKYNZTd261ybF4gGVwTins
         wRXeaJXgX1cSHeQnCCoK4IkvqC3sSXxcpPjHa0z0g434e+r/j+diESCHZ9KdoSXLnkbY
         Z8RQ==
X-Gm-Message-State: AOJu0Yx7yd/S4a2vyc9js7GA2Jmy+oC8pFadnlHP5DqnCNHtb1oGC+TX
	rwDHunL4SDDiQLawKPWJtnKBs7knKx/rBuxYN9I3M9Q23HSzzHRyCzeXMDi3Qg==
X-Gm-Gg: ATEYQzz0bGJreOfg84WB7oXKIWPWsQAzXGtFIzB++2+i2LuJkEApy35xD+6knPbe6HI
	8NQe9QqS4hCiMkCYVlWK0owr1+4KQV5k6fjY2jBYbF0e2Ozdd2l8OtxrCyXPTFtypmm1m0AoHfK
	FhoYjUC/oyOsVjR5Ok0TjlVkN6eUFBF0RnpzKEA5HTAu3oLX9x/NNWc1lpaIjY567mfj8sIilOa
	i3Px87PdHxIXT2WFydrVty5toHRr3mbSAsGgCy59F8xkUx/cwl0iZv2dlqLA/onNS/WNjsvKPpA
	RCvkn4tZW3S0MrIuV6Yzo/hhMXs8mLEEmRUY9Nch11E7m/6VFcQuOQPsteg/GGHgNi8+VSRCugH
	V118z/ExoqoX7utGwr9/YXuUEitgOETAL7pYbveKJdXT0osb02/SoPQcIrHhEUEUcVgSOOgVWDM
	ai1QQHgWe78Zuv5Av8CPiMwQZsSMbwXUHEj3IJqCcjUJ01V0kfqlmJ
X-Received: by 2002:a05:600c:1986:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-4852695b649mr36918775e9.17.1772805604700;
        Fri, 06 Mar 2026 06:00:04 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb4257csm187098845e9.15.2026.03.06.06.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:00:03 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	joshua.watt@garmin.com,
	ross.burton@arm.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v7 00/10] spdx30: SBOM enrichment and documentation
Date: Fri,  6 Mar 2026 14:59:52 +0100
Message-ID: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
References: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 14:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232566

This v7 fixes two SPDX selftest failures reported by Mathieu Dubois-Briand
on the ARM autobuilder (oe-selftest-armhost builder 23/3458):

  - test_download_location_defensive_handling: recipe-m4.spdx.json does not exist
  - test_version_extraction_patterns: recipe-tar.spdx.json does not exist

Root cause: On the autobuilder, oe-selftest runs with parallel workers (-j 15).
All SPDX30Check tests land on the same worker but share sstate with prior tests
that use different configurations. Tests without unique extraconf may find
do_create_spdx satisfied by stale sstate stamps from earlier tests with
different SPDX configuration, causing the task to be skipped without deploying
the SPDX file to DEPLOY_DIR_SPDX.

The fix adds a unique SPDX_NAMESPACE_PREFIX to both tests, following the
established pattern from test_extra_opts which documents: "Many SPDX variables
do not trigger a rebuild... change the namespace prefix to include the hash
of the extra configuration." This ensures do_create_spdx always runs fresh
and deploys the expected recipe SPDX file.

Changes since v6:
  - 07/10: Added SPDX_NAMESPACE_PREFIX extraconf to
    test_download_location_defensive_handling to ensure do_create_spdx
    runs fresh on autobuilder workers with shared sstate.
  - 08/10: Added SPDX_NAMESPACE_PREFIX extraconf to
    test_version_extraction_patterns (same fix).

Changes since v5:
  - 04/10: Removed reintroduced d.getVar('SRCREV') fallback that caused
    25+ devtool/recipetool selftest failures on autobuilder. Added safety
    comment explaining the BBIMPORTS/AUTOREV constraint.

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
 meta/lib/oeqa/selftest/cases/spdx.py |  87 +++++++
 5 files changed, 534 insertions(+), 6 deletions(-)

-- 
2.53.0


