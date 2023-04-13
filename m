Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102ABC77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 09:16:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.8160.1681377370950981804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 02:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=bgJOVBWd;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id o29so2429743wro.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 02:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681377369; x=1683969369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=leLauVfTmEctIlc1LiNcZAqBED7+J7jXJPOdM5zaONM=;
        b=bgJOVBWd+9sgWVLKKKSM3+IbA0cKfKQZ7t5AckugafxPQvr/n5DRqN7Ca2Lp1kAAwm
         Cn+VYX+xMRkXh+cmhlY15JXBpfz1pEk2bA627js5CYA/rQpIpB58RMyDqPoi9uACH8GB
         qJ1zRbjt/df7RkzprTbjFQXgWdsR3CJ+47LWh5Z4d/alejknAZ3Kymu0JBkw354VodMe
         aclwDox4ml4W7uaeR3vTOG/8RxcUoKyy8DMDvzDjNlm+wcCeu9gPLWiI+R216ZmQYPK3
         6zRQwNhifNpQOTlVP7To3GX8TqnRBFSZSmvkKKIL7RrwTyu6xG3THxUC1umClvKFwWiI
         5JWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681377369; x=1683969369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leLauVfTmEctIlc1LiNcZAqBED7+J7jXJPOdM5zaONM=;
        b=dmBA7jEplJ4nsuwv0MvsEs5HUgya+IAOZgKkHUDSJECQBLnkedG11bP7QDdAGp0DkJ
         ZYCqU1MPhDZJ2rrO5aj0F8eAUq4kkMgD7Pcr51RZxy0F87lKzxb21NbmANEp5xoTj9Ty
         X5FUns/hWiCyH01fl+K6/J/k5srCHpoWU4k55GYU8G6ABDRGDaTIe1t7mHk+WnjZFgYG
         37AQ1MXfsOq2klHzpuNWQwFZI4p30M/7JOtIpeYnTK1DgY30zNViW09Doi/dKpF1KW+o
         LJAgocEuJHG2wJBhVGJwW81xu5wYECtUIkaM33YzUMUcaciUwYTrwvexgwJHDCXfuddt
         DGLg==
X-Gm-Message-State: AAQBX9fZWCApXJ6d/oSSHd1J2QJVAeGdz4JYVRaOwnGn3pPQuMaR0DOW
	23PEkQgwhWzQWqwisPZpaA2Pbw==
X-Google-Smtp-Source: AKy350aMq7VLn2oszwtC8MW6FAiz71/AxkatHXFPUjr4/RSYCUr1hLgRzrBZmRN9VIqqKENjy+gv4A==
X-Received: by 2002:adf:e3cb:0:b0:2f5:9146:701c with SMTP id k11-20020adfe3cb000000b002f59146701cmr1005848wrm.52.1681377369389;
        Thu, 13 Apr 2023 02:16:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:814c:fc8a:da02:39ad])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm851479wru.20.2023.04.13.02.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:16:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 0/5] python3: fix run-time availability of python3-build
Date: Thu, 13 Apr 2023 11:15:52 +0200
Message-Id: <20230413091557.10659-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 09:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179961

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

python3-build cannot be used in self-hosted images due to missing
run-time dependencies in several packages. This series adds required
RDEPENDS to python3-packaging and python3-pyproject-hooks, extends the
manifest to include standard tomllib and ensurepip package and finally
fixes run-time dependencies of python3-build itself.

Bartosz Golaszewski (5):
  python3-pyproject-hooks: add missing run-time dependencies
  python3-packaging: add missing run-time dependencies
  python3-manifest: add tomllib
  python3-manifest: add ensurepip
  python3-build: add missing run-time dependencies

 .../python/python3-build_0.10.0.bb            | 11 ++++-
 .../python/python3-packaging_23.0.bb          |  1 +
 .../python/python3-pyproject-hooks_1.0.0.bb   |  2 +
 .../python/python3/python3-manifest.json      | 40 +++++++++++++++++++
 4 files changed, 53 insertions(+), 1 deletion(-)

-- 
2.37.2


