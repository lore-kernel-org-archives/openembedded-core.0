Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B15FEC0E4
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:15:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2744.1774372514353154288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JNkKxfJn;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso14665005e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372512; x=1774977312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDEXEw1gUc5V0+ICcJOwfXbcUJuQQlU0DKyxREQ6Cow=;
        b=JNkKxfJn5m6PNuqrFkBiL7+vxG7VD+zaZqY5yWspdKohIfTbz/PlqtD8XuQm5ihaxH
         E1Vu2J3tRIG/doDb0aLKgYi8qvMyBLprUZ9LOR6aB09BwnqA8i5DQffIK0dPctaZfxIQ
         C3AMmMHtDRkmjvUubW0v64QY4s5HctxT3imO31nfRlTBsPHvHGHEAWRiuHVR1h0GSRBY
         0J0o7BFLNMqwrIRaIu5lHKc+sa210ueqYO8FFrwQ1oAVl4Ef0dJAMkr2rhkSiN+nt2tj
         DT3T9B9EiMm4RjaGTTNL2+fErjAZYTWhkyijPgv7Rm0TTt4bcR4KOKo7MNQOo0P0DYaM
         WDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372512; x=1774977312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DDEXEw1gUc5V0+ICcJOwfXbcUJuQQlU0DKyxREQ6Cow=;
        b=WLYfqHkHnKT3ve3mf8C/QQYOtFyF09Cv/usAkxe/xQmgMgU4SzbqD+I+XhPhU/Mp2h
         efHMXuXuT2yN1jQGB7Clrnns5zPwxTtay5+nGJlIaae6SCGB3YFVxHprkEn4ITNXk4Ad
         tfWrcgXtYGmv3GK+d612uuR+0w5AwZhhhEF7JEAtR6pIwdgmgD9g/4M2OHiWmJgFx+uA
         G8v1RZfB4XVzi6EZiHULePRqYAlkyosTPd+4JvJr2TtVFX4UTD+uPIC4syyWKczpOINj
         NMgNq6qLe62YHPtg7yRflRVdnTKX2gOy5YVuHsKCLgLaurgeAo+hiMNpemteXRoYzdy+
         OztA==
X-Gm-Message-State: AOJu0YyjGBqUbYP6vuge83rbqneDCWa+ZeuhhVwHK2Zm8FaOcq8d6R9L
	Ub42B3/wQIkZf/kJrr6XTIIFc4tIIPxWQGcojB0ftOZCSJfxwGnFZe+EyElDiRyM
X-Gm-Gg: ATEYQzxK21/2xIXfNJbLYwX7eCMANbnGvp5DkIhmswqg4RMyOyh7/4IjePMIVgADq/Q
	zSs1rLMTRFfQnO9N83bD1EPdnm6AzHJ99aQcyIpklg5n/vJ78J4PxGRg1vk9FhZmhNU05uMYyER
	NkXyBuMU4e0a2NBHBsprVhfYBWP06smqMkacw4AsZaxztWKEece3fXOEkW+FLFqNsJtQcVkuWdT
	bp5xm796dealZ+f3TB96ZE1RZdwlDI+Fi2GdNS7m6VkjeUHlsGF4zmcYF93+59sXaDn4pciHe1o
	V2CW1rtPVKTREK4/7M6cFn2RC1cd+sQ9ynXn2ITZNxMD9yEwFS+WzB/66RPqmrxV9l9dko+2OoM
	72mLWdR2Fe8toREWEllA98Fp8Ez8E9k73fs46JCZBlsHvcTGr1yNton4HWnsnsRYhDfBsN1padg
	T+fP4c30Km7i3BTrGwQ3BUTA7ILrpJ6iuRNjeWShMbUrbgLEKoILrQzlHuc3b80oQbi57sWUpul
	l6fzBDcFoNC6nxaoU+A9OpIgg==
X-Received: by 2002:a05:600c:1548:b0:487:716:2fa9 with SMTP id 5b1f17b1804b1-48715ff7a16mr9451325e9.13.1774372512180;
        Tue, 24 Mar 2026 10:15:12 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165bea11sm2168665e9.1.2026.03.24.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:15:11 -0700 (PDT)
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
Date: Tue, 24 Mar 2026 18:14:57 +0100
Message-ID: <20260324171502.689012-1-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233814

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


