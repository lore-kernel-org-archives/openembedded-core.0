Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81AFF54AB6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:30:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19484.1774359011228216734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 06:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fb3iAUM5;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso3827114f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 06:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359009; x=1774963809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcjGYbgOncjEyUWtKTBORnQa6X/YFPdhQK+330CD+EQ=;
        b=fb3iAUM5LoHjmGKzBGRUMm1kpulLObwGb7z7eCtExB8TpkDOwFoEM+hMkFGJ/7E344
         PUTBN6iX+CrCM+njaZQgjx/IkmXK8JCyfm7AdSklFJ+7XbGYH/vPGrZqy3zTT6F4rRWr
         gBwxcP7+9R95sFYPlv/o0Y5V4L2UT+A1ucJ4bJZe+Zo7Mds6++lDGJFXaTSP2fIFgsBA
         +0oKyPuEs+XgVK4hRmmYPNGsyRRuW7AxqBlkWvrG2IomO9hv5rwZy4RK0JVGvA5NgHKh
         GowlnoCqQdhkTQDGB29WpijzfhbYoEL6WmkT6Xg2htZT3H+keJoH15Ond2JKGay3ywqt
         dTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359009; x=1774963809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RcjGYbgOncjEyUWtKTBORnQa6X/YFPdhQK+330CD+EQ=;
        b=T1yT+6YRRgfVebHfQTNBo/G+H6O65Uh5s1/YaTvpL/aaJadEqjnHsAftqci7kUZ0AY
         ULNZRLWneHqaSMjOZOVS5C3hwfJyOWPB3CqytzqrXtqI+u/p9fJ25gRjDzC8DfxGmfK+
         kP8vjN5TyJwjrw5W30AJ+1qqIkNZmc/Rv3E3B9wPx6hhTMpPmeD2U747OQLvW/arcuBY
         8Q7eMN721VIZbsG/uCkLk4EXHc3PuJMR6CfTz2ou53UI93Kln69V/QyJET/Fq91vCFh4
         Ki83c06yKfqvvZIZNX56A5gftVlTH6FSS4hPLN8cRkI0USSDQnC5toWkaHDPLwA88DC3
         GQOA==
X-Gm-Message-State: AOJu0Yz14VUWte1tflVtkFUbrGS/VE3k3aB+7XPUlU7YcEHCVQ8Ldk8Y
	CRM7J7+Uh92bvNlKKLcPXnY1crOzMJtZHoNGuVxkGKi49lhxegb3Eq/KQVRz3Qtf
X-Gm-Gg: ATEYQzxgPfYnkAYa1zJHgPhBciMXmxiNINF28o4oUji2iJbHHnKKvBm450IwOwbcZVv
	MG4wMLk6IyZTozrZWlib/jAlPzVAqZvfhSBQXOrk1zXCC6/xVf0LbHKjLhDZg0/9r01W0AVk1/g
	emdI9YRMcnIMIuO5I8FX3YGsCdPI8PFms8+Bm5pTSww5n/1uaUHOOz8KHxrrNf0zJFI7pWrE0TE
	1PHbIoLFH+QhfvnYykVa+MrV30w0wrudcJxZPp6I2HiQGam6TdIjMszOu+ysZMXA9bieI9l0gy2
	xXuSMo1qjLcLG0WffE1AafddC5Uqy9X51E/NAs+Mz55lRJOxUPvwX+VjjwT3WueLEjQEHVERdcv
	d8isjTkj/nvlSXvB1dGkO8WQIIVxJoChGmQ4omqKGroCOy+ivFdpDs4S6z7qqvEOVecQw/Mr1vb
	vxDDTrveInAYlm84LhhVZCJQ3pAD1vCuBWVkc+C3u+0+BKRNg3GJ8+wJxtpNEkiW5eXXMkmAlN2
	TJbYmm7
X-Received: by 2002:a05:600c:8184:b0:485:3f58:da2 with SMTP id 5b1f17b1804b1-4870f22497fmr51359825e9.16.1774359008959;
        Tue, 24 Mar 2026 06:30:08 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48710fa0e35sm47494875e9.3.2026.03.24.06.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:30:08 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v14 0/4] SPDX 3.0 SBOM enrichment and compliance improvements
Date: Tue, 24 Mar 2026 14:29:54 +0100
Message-ID: <20260324132958.2316491-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 13:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233797

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This series enhances SPDX 3.0 SBOM generation with enriched
metadata and compliance-oriented controls for current master.

Changes since v13:

  - Fixed patch 4/4: reverted incorrect modifications to existing SPDX
    selftests that broke test_custom_annotation_vars,
    test_gcc_include_source, and test_kernel_config_spdx on the
    autobuilder (wrong SPDX output paths and task names).
    Patch 4 now only appends two new test methods without touching any
    existing upstream tests.
  - Patches 1-3 are unchanged from v13.

Validated with:

  oe-selftest -r \
    spdx.SPDX30Check.test_download_location_defensive_handling \
    spdx.SPDX30Check.test_version_extraction_patterns

Stefano Tondo (4):
  spdx30: Add configurable file exclusion pattern support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Enrich source downloads with version and PURL
  oeqa/selftest: Add tests for source download enrichment

 meta/classes-recipe/cargo_common.bbclass |   3 +
 meta/classes-recipe/cpan.bbclass         |  11 +
 meta/classes-recipe/go-mod.bbclass       |   6 +
 meta/classes-recipe/npm.bbclass          |   7 +
 meta/classes-recipe/pypi.bbclass         |   6 +-
 meta/classes/create-spdx-3.0.bbclass     |  17 ++
 meta/classes/spdx-common.bbclass         |   7 +
 meta/lib/oe/spdx30_tasks.py              | 278 +++++++++++++++++------
 meta/lib/oeqa/selftest/cases/spdx.py     |  76 +++++++
 9 files changed, 338 insertions(+), 73 deletions(-)

-- 
2.53.0


