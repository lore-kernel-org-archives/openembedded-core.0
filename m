Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F86F54ADF
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:14:53 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2647.1774372484301055961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ILQpZAyw;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-487035181a7so23592435e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372482; x=1774977282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDEXEw1gUc5V0+ICcJOwfXbcUJuQQlU0DKyxREQ6Cow=;
        b=ILQpZAywRSRGdeHRzNyiZaei8rBwXdLAzjvmbdq3GhcutT91emPXwvzOTxesx97hOo
         c0jmqenuCPAFM5hz3sOw5QRvbtfhw1KXJuSg+B/FsDcOu60CUV+FkNFIEiX+I4Wd/P5r
         46YxIs5m/68wquWr1jSe3z6G3SVF0s+XSH72fkIWeltYbNcZEWEOswscqXuu/VdEAwGJ
         BJ72wJ0nTLehKH+HMs5GTyIfEWZ+ksAJI+msGdtjdUmEDKmr6ZJh2ODESKXCkilkMX69
         QiNXfrgtFzdXP5zl3OJW9hlVX2u25vyqUNb9YHXqAhllkymoWCAiOcYs3/AKQZZfgh5V
         YXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372482; x=1774977282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DDEXEw1gUc5V0+ICcJOwfXbcUJuQQlU0DKyxREQ6Cow=;
        b=sq1nwYDlPMvIHlOU2Zq9upPb8lwUT7uGDpGZbcTztYdkU5KYdp9ZHHGqJkS5UTauPh
         0EG/XpRya+as491+yVYn6elfj8WVQCvqol6Eq91t3GZEFzsVRXZez9aK0dc9jQCqMApl
         6/fS8VDTDYxdfVlad9z7/oX3VY2t86rKjAQfpHofwEbEcDgZG69amZHvres8TQG6aB6f
         uDwxQVKlIDiBwULYVrDGSHTK7zIXP7ukKFC22kdsv5LCL5tM6U8Vpp5bn5qtn2VSw0B0
         BWsxFdqOBhODRdB39lFC605vsBY70yTs9UxIMvJtjcomOYZ23g8SWwxpEn/fyMHVyOPP
         GdpQ==
X-Gm-Message-State: AOJu0YxO3em6BRza4+gsJEgV4MBk99m+Jen+lP8cH375efXR+avealki
	mXWpXa0+PVVXXNodY0e7iLnC/ktMeDEowlNyvsXs6OpGDVaiOCoOUzHCzHqzyLW7
X-Gm-Gg: ATEYQzxRABsvUc0zQzWf0FF+1HryI8AIUgH27AExL31hmaZHE+MnYdpqi2WUrwR3l1z
	DhZZEb85Cc5oddlS3sIzX4SV52z/YelFjf/AXVtww+Z2X9BC+OPiQQoYdrdReGE+st/YzE2cceF
	gnGktp6Kz6ozF4HPjlFq13e+IvehVFw0k6I2pb92IW4cbM4mtLh54KSQfL3/TimWydeVtAHqLKf
	VON4eYxA3Zm6kGBAAOVStT7/rfM0amwfGd6h5kewpPyqQx4DubcDd+0InDYP3fqEjOylwWmtvJ/
	st/WnY10vAjY/JYUmW+qKc7Xr8MaNFdIfEggtSJxPrrfGH47pv7UM6DPQstfIofOpP5byZNKBCa
	6jP2CADZE/jHeV6aBn1bU39V2sppII0QQ/XMZdvma2hAjfEHIPt1GmnGuZguMd0dZfPnmmdei7f
	yBJvn28l3SGRDypiBuyY+M+4Du0tpCKYZhaEIGmbDOIGRtO+VGqsm6jDffjmCZWM59ZzGSqaqn7
	xdiBklTsPNC2jhlu7sxWoCWsw==
X-Received: by 2002:a05:600c:83c6:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48715fcc5acmr8137005e9.8.1774372481998;
        Tue, 24 Mar 2026 10:14:41 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165e8e0csm1089275e9.1.2026.03.24.10.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:14:41 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v16 0/5] spdx30: PURL and source download enrichment
Date: Tue, 24 Mar 2026 18:12:41 +0100
Message-ID: <20260324171246.686862-1-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233808

This series enhances Yocto's SPDX 3.0 output with ecosystem-specific
Package URLs, Git source version tracking, and configurable SBOM
generation improvements.

Changes since v14 (addressing Joshua's review of v14 patches 3/4 and 4/4):
- Split the monolithic "Enrich source downloads" patch into two focused
  patches: ecosystem PURLs (patch 3, bbclass-only) and Git download
  enrichment (patch 4, spdx30_tasks.py additions-only)
- Removed ALL extraneous changes: formatting, comment removals,
  blank-line deletions, variable removals, and off-topic refactors
- Fixed go-mod.bbclass duplicate SPDX_PACKAGE_URLS line
- Reverted pypi.bbclass UPSTREAM_CHECK_PYPI_PACKAGE change
- Removed the else-branch that copied recipe ecosystem PURLs to
  non-git download files (per Joshua's feedback)
- Reverted do_create_spdx -> do_create_package_spdx change in
  collect_build_package_inputs
- Reverted bb.note -> bb.fatal for missing SPDX providers
- Restored all removed TODO comments and blank lines
- Patches 2-5 are now strictly additions-only (0 deletions)
- Tests unchanged (additions-only, all 12 master tests preserved)

Stefano Tondo (5):
  spdx30: Add configurable file exclusion pattern support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Add ecosystem PURLs for recipe classes
  spdx30: Add Git version and PURL to source downloads
  oeqa/selftest: Add tests for source download enrichment

 meta/classes-recipe/cargo_common.bbclass |   3 +
 meta/classes-recipe/cpan.bbclass         |  11 ++
 meta/classes-recipe/go-mod.bbclass       |   3 +
 meta/classes-recipe/npm.bbclass          |   7 +
 meta/classes-recipe/pypi.bbclass         |   3 +
 meta/classes/create-spdx-3.0.bbclass     |  17 ++
 meta/classes/spdx-common.bbclass         |   7 +
 meta/lib/oe/spdx30_tasks.py              | 202 ++++++++++++++++++++---
 meta/lib/oeqa/selftest/cases/spdx.py     |  76 +++++++++
 9 files changed, 302 insertions(+), 27 deletions(-)

-- 
2.53.0


