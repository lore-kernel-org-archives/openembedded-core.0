Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE777F3C25C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:29:16 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14250.1773062948445823913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UQg1GMfK;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: stondo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79800183233so156650857b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773062947; x=1773667747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JPBO3nGZ3LSmhoDkTOt9wctIrXJtpIaEHjnPkYXYUk=;
        b=UQg1GMfKJwIAsmgnD+oburtkAlpV3ny0Krds8G83ddQxVJPIgbWOGH43iFwBevscY9
         aF/GYschxL9PcRLfErDuybB5V/jsaNyL8t++BKE+EBZ0qLc2CEHWqicFtdflnoeG8aag
         Omh/SC78yyhbo3WFJa99U5nv6h5dx7fx7xxi4207piBVGZXbeW3L7E9bPyIe1URFvjMo
         4A1PyvOjgdoyT3dxXwBlG7Z/P/lHAt+R0xjDoqCSAkHGc4dpyeWPN5mOXxp5SD0UulsW
         UABTttYMD73jHBpQPBTXIxpgazRMRDtKIzAIgLR/V4eN0ZmgK8pbj4wUGYrsdX0Xb6ze
         ACag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062947; x=1773667747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2JPBO3nGZ3LSmhoDkTOt9wctIrXJtpIaEHjnPkYXYUk=;
        b=h3Oq3R9rpGf4OtCU6ee19+2Y1LyB7Eoa9m3RZyTJwjO9of0Zx4CPX5y2+bHkN069sx
         yfcGqcHzqPKeFv21V1URDynu6r46cfuftW3o9P5p3fj0Bre/MB88cFYt4e5buOaqNVbS
         m/vvGMrnH/SOtDa7v7wErUnChlywRj0pnrHmAzjYHrldo7ltXjCdzWbdWF3X7+c4niSi
         fkVAp9zgaOOAwuOKMJJMRHKdwwwKuwtqWW1/WcRABkMrzDXJ7LmYbVpFOvb0KI3bix5K
         tEn7p8o9kTe+8TUD4yn0Nn3OvVVJdAQkGWbxZJbGDxDSoQXiMffG9/YrJQDLY47aYz6m
         DlTg==
X-Gm-Message-State: AOJu0Yzd4h6w3DkjUSbNA3AlRKW0iKcx+fakxs0PSTBg3aItlPQCuUXs
	nTAM4sIek7C9a2wWqKMEN4WKSXf3+oyRp6gquWf5uAY7uhUakHA8iYMY4ityag==
X-Gm-Gg: ATEYQzwHFluY83IhAe+NuUHo0Xu0qxDDR7mvmgmfqSoNO45xuhvDXBlkbh5NbN7CwPI
	0QJIpgfg92kh9gONvrxo9/XV+vQa9/JqutoYO5y6n03LOsmp2nozjpWoXzzQo4MH7YzV6zmlmcD
	tOepncS6EFPdGcjcpuPDvTcmKx05eJWzzX+gR/rtUmc+l9vJJIrf0m19FDH97gnUxLZYGmDNDUK
	TjNlozTtvdHvWgI1joM5KNGo+Z2zLYul9K/WeqGX7Ff5LKB5EixgrmqFJbaMW3ozB8hVXweNphb
	+kTkqzjq3dnFIpqipdHGfv3mE2YYlEc97h7PMqMhMbqmxdTc30ZuhusyGLKFeKynIR2ra5iabAv
	Tsq21JT1wkg0X+vpfumeNF217LM5HH5SASywXx0I/EU3PTeWZWVx26/DXq/5ASNloJba3lYS8Ub
	ddlSPBKmhqz+y/h8eKVGRyOTyoPkgQJxNLIRjyZmzgfI/jUAjo7J3tcSmpRVuk7BVHtYOltAKHp
	64vYJRd
X-Received: by 2002:a05:690c:c4cb:b0:798:1be:1c34 with SMTP id 00721157ae682-798d1eebd1dmr118863427b3.26.1773062947184;
        Mon, 09 Mar 2026 06:29:07 -0700 (PDT)
Received: from fedora (mob-194-230-161-149.cgn.sunrise.net. [194.230.161.149])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee6afd5sm44299437b3.45.2026.03.09.06.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:29:06 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v8 0/7] SPDX 3.0 SBOM enrichment and compliance improvements
Date: Mon,  9 Mar 2026 14:28:47 +0100
Message-ID: <20260309132854.128375-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232709

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This series enhances SPDX 3.0 SBOM generation with enriched
metadata, ecosystem-specific Package URLs, and compliance
improvements. It addresses all feedback from Joshua Watt's
review of the v7 series.

Changes since v7:
- Patch 1: Dropped tri-state SPDX_FILES_INCLUDED, replaced
  with simple SPDX_FILE_EXCLUDE_PATTERNS (no-op when empty).
  Removed SBOM_COMPONENT_*/SBOM_SUPPLIER_* variables.
- Patch 2: Cleaned up supplier support, no variable renames.
- Patch 3: Redesigned ecosystem PURL generation. Each bbclass
  (pypi, npm, cargo, go-mod, cpan) sets its own PURL by
  prepending to SPDX_PACKAGE_URLS. No bb.data.inherits_class()
  from SPDX code.
- Patch 4: Squashed v7 patches 4+5+6. Full SHA-1 for versions.
  urllib.parse for Git URL parsing. split(':', 1) for mappings.
  Extracted _generate_git_purl()/_enrich_source_package().
  Dropped tag-to-version heuristic and archive format check.
  Preserved inputs.add(dl). HOMEPAGE ref at recipe level only.
- Patch 5: Merged v7 patches 7+8. Dropped SPDX_NAMESPACE_PREFIX
  and hasattr() per review feedback.
- Patches 6-7: Unchanged from v7 (LGTM with Reviewed-by).

v7: https://lists.openembedded.org/g/openembedded-core/message/209863

Stefano Tondo (7):
  spdx30: Add configurable file exclusion pattern support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Add ecosystem-specific PURL generation via bbclasses
  spdx30: Enrich source downloads with version and PURL
  oeqa/selftest: Add tests for source download enrichment
  cve_check: Escape special characters in CPE 2.3 strings
  spdx-common: Add documentation for undocumented SPDX variables

 meta/classes-recipe/cargo_common.bbclass |   3 +
 meta/classes-recipe/cpan.bbclass         |  11 ++
 meta/classes-recipe/go-mod.bbclass       |   3 +
 meta/classes-recipe/npm.bbclass          |   7 +
 meta/classes-recipe/pypi.bbclass         |   3 +
 meta/classes/create-spdx-3.0.bbclass     |  17 +++
 meta/classes/spdx-common.bbclass         |  32 +++++
 meta/lib/oe/cve_check.py                 |  38 ++++-
 meta/lib/oe/spdx30_tasks.py              | 170 ++++++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/spdx.py     |  69 +++++++++
 10 files changed, 348 insertions(+), 5 deletions(-)

-- 
2.53.0


