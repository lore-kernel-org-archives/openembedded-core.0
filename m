Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FFB1067054
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:38:53 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24657.1773329931126838203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jvd+2jKP;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so13529065e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773329929; x=1773934729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5lzioOC1FVjAkI2mkZ8ZrbnT2KuR4UZkEAIxyFXGeE=;
        b=Jvd+2jKPwweYUmjX8C/exVDbmWY8lrzPrrv7ZJmTfmG22nmiIWfRUru7oCf6MFix+5
         enOkepGVqL2kjXa/l8FceUgnDOg7KJYqOpK9u+anxtM/lJVzvnZgDF0fICj1uLVvtUx0
         eg0HLqTSM5AZwCctoMsC/3VvfsozIGASLZ5GoFgK7F9gTPQyD6kU9vs+YaSuscii3rCX
         sFkzDpHv9Xi4ia0GIK4vg+VpVyWiAx4MhAMG41CbU79c5RgMmGe/mWove3iwdmm19Lkc
         nuEElEXE0Ia7xfxNYkOp3X7pgp5gVvWks6odauaEmOGBrkgbT5r17kY8V4OgfH0rFsH4
         KM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329929; x=1773934729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i5lzioOC1FVjAkI2mkZ8ZrbnT2KuR4UZkEAIxyFXGeE=;
        b=qMZXCiq4kviFKGwOZVbujRAc4YEZ6fmcjIZz4QP52qwZu1ItajavIopAO/3MxWoIru
         f8hERswko+9gM/L3ZadSMyXEviRZuqf7j++7wZXAdW4jBxUzW5TRIoT7BBo5r+ht+jJC
         G0aHbp2PPa13v/PZWFuomJVEzIzMIyIc/b7XPtOoFxgC6HLIUHVXGQwX8R/AoEc44GRP
         Rwb/hVi5Ym37KVROoeNWK99X6dJSgOpOvaQQklTPBcOrW1StnAwKJQi51UH8NmDlfC9/
         yjA1Fe1nggyGahD+aBd+nKEb0NQcXkR9vPWjBpEsVEK2adqCDbBoFuLKXykqLcUi9PEx
         KRQw==
X-Gm-Message-State: AOJu0YxUWgEaOC6WnKVHRbfay4cKpm4wdYOtqvnOSdG3QrNR8NoCCu2z
	3PdRvg6IOmFyBQodRsFOnx8EgXDZO7BxDbsEZM8ws44ecbHwjmdEtv2CsnRFTw==
X-Gm-Gg: ATEYQzxA0w7HSN31BdfkcK+7xwfSVjn6e03M5GYVsfEI05eg+/1QKpuCtuaPmB2moos
	CbPYkjb8qd05sCZOFSo6LwlJ88alr206lIsXnPKgss1kn2d0ObzNkZ0kBArlMAg6WMqMfR1/PHB
	/stlNEo8zkmehQRxGYpVOn3yv2/71CiJBS6UQ0Pa6aQzYFhCUs9Drm3DimYYFTvNCg8m8Y8YEEM
	86d+tpP/q9BvjxfceNLjDSCqHYeVvaE/nsAhHXhGsx37jv/8ocOGP4yfpLqn0z5IlzKtbcZi5dA
	yncMGQ/yLExOd4ga0zPM8MzFLeRz7gy9jr4gFvBouSzXppfvgG279tUQm02Ces7n23pPUABQPn1
	hmtsZ3u8ajz0e2uh5r1vSvz9dO2yfm8415543qnhVyedyYsy7SgO+6j/QH+wLlYpRZ/hl6xx8b2
	dyv1UelRrl+v6s++jptQRU28PxpVHGs1rPGcg=
X-Received: by 2002:a05:600c:46d1:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-4854b1484b1mr115605255e9.28.1773329928498;
        Thu, 12 Mar 2026 08:38:48 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dcf2asm74857385e9.8.2026.03.12.08.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:38:47 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v9 0/7] SPDX 3.0 SBOM enrichment and compliance improvements
Date: Thu, 12 Mar 2026 16:38:38 +0100
Message-ID: <20260312153845.164369-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309132854.128375-1-stondo@gmail.com>
References: <20260309132854.128375-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232973

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This series enhances SPDX 3.0 SBOM generation with enriched
metadata, ecosystem-specific Package URLs, and compliance
improvements.

Changes since v8 (addressing Joshua Watt's review):

  1/7: File exclusion now uses re.compile() for proper regex
       matching instead of substring matching. Excluded files
       are tracked in a set() returned from add_package_files()
       and passed to get_package_sources_from_debug() for
       precise cross-checking.

  2/7: Unchanged (Reviewed-by added).

  3/7: Fixed npm_spdx_name() to use bpn[5:] instead of bpn[4:]
       since "node-" is 5 characters.

  4/7: Dropped PV fallback for non-Git source versions since
       the recipe version does not necessarily match individual
       downloaded file versions. Ecosystem PURLs (which include
       version) from SPDX_PACKAGE_URLS are still used.

  5/7: Renamed recipe-m4/recipe-tar to build-m4/build-tar in
       tests to align with upstream rename.

  6/7: Unchanged (Reviewed-by added).

  7/7: Unchanged (Reviewed-by added).

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
 meta/classes/spdx-common.bbclass         |  33 +++++
 meta/lib/oe/cve_check.py                 |  38 ++++-
 meta/lib/oe/spdx30_tasks.py              | 175 +++++++++++++++++++++--
 meta/lib/oeqa/selftest/cases/spdx.py     |  71 ++++++++-
 10 files changed, 351 insertions(+), 10 deletions(-)

-- 
2.53.0


