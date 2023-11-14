Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96057C4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 21:04:24 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.4594.1699995861574497397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 13:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HfqiF+fx;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c595f5dc84so2182881fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 13:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699995859; x=1700600659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kspQeSwglukoYiLU5JSRp+YZ/TlBa+HtuNWeDhE4pOQ=;
        b=HfqiF+fxNymSCOT5ddU2yft8YCSfoFbs3TunPmmfFJv3kG2YbDEblZSo6PzRJ/0hnc
         QCPQWfg/Kyge9bG+H6QXdczfnOrruEsNpErLrpA+/kqRG1UUyuxah0rqW2G2PdeJUzya
         a+daK5m/l4injl6++egZzAI7aXRoa22X3VZk+S5Z4KOBnWFvRiBaB0NvtGgZ9gxuy8aq
         /QkNkRjBEUcdeIxObsCFxw9S4Cg1cywwOSpYJnFWQ4RtNFQ5RekX0F/8rN1e5eanm6Qo
         fw7q1TQpcccCiAQJGDWZ5Bmm7b3/zPDLEmVW4FMkF0UgoaP6BN1jT7hui85rYfz5pNiz
         SaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699995859; x=1700600659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kspQeSwglukoYiLU5JSRp+YZ/TlBa+HtuNWeDhE4pOQ=;
        b=LTj/iymhr/yh5G15hNGLI2ekyR430n685F4FP+zLlGeRSl12WBE8dyg+5xQauJUoUY
         CtBGgFVdebNJDoMGAyDEx/D+2kwWJyGzBpd4+FoFdzRjlrmDz0NX2QaQC5FJ7MosqxmQ
         iHFZtQWMzaYKbUQHCxfeZtevKcgD9h8npc6JhlkrCWCR27jijssDCYFzEXK4oALug39a
         Ct0OhsJA89xa1yzPRA+FkWKDAWGFKmlIUDsEuf26i5z3FCzA5/yXuJ6ZkLBk4U66UYTD
         WqkDhuZSQYW+asjHTMoyuns6y8xnNO53LOtKjvIFUe/ow4bQsRCaRoMPweZS/DRpHa1X
         VQQg==
X-Gm-Message-State: AOJu0YxWhtuW3TXJ7qK3QTNAiqGzIrynHqmxYsFw695E0/XEzjQWC2zj
	K4eLYhVZcMV/gV2+dQ8W9QJF8HWrPav8a5uAGsQ=
X-Google-Smtp-Source: AGHT+IGcICbfWmWSYsi0PvOubM+u4ESBCN1rpZhRy0ce8TcrqX/DIJOW2nrHG0ZEOMxIc7/tOU9N6A==
X-Received: by 2002:a2e:a784:0:b0:2c4:fdfa:41c with SMTP id c4-20020a2ea784000000b002c4fdfa041cmr1654076ljf.0.1699995859185;
        Tue, 14 Nov 2023 13:04:19 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a05651c210800b002c001e57e1asm1437856ljq.73.2023.11.14.13.04.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 13:04:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/2] add sparse image format support
Date: Wed, 15 Nov 2023 00:04:16 +0300
Message-Id: <20231114210418.1323819-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 21:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190519

Typically the generated filesystem image contains a lot of free space,
which is filled with zeroes. Android ecosystem has come up with the
'sparse' image formwat, which basically drops all irrelevant data blocks
instead of storing them. This way the generated image consumes less
space when stored and takes less time to be flashed (as there is no need
to transfer sequences of zeroes). For example, bootloaders implementing
fastboot protocol natively support writing such images.

The meta-oe repository already supports sparse format. However keeping
it in meta-oe means that it can not be used for BSP layers. Moving it
directly to OE-Core is not possible, since meta-oe uses android-tools, a
huge beast, to support this kind of conversion. Instead of that, use the
simple Rust crate to implement sparse <-> raw image conversion.

Changes since v1:
- Epanded patch description and added cover letter to describe sparse
  images and the reasons for bringing their support into OE-Core.

Dmitry Baryshkov (2):
  rust-android-sparse: add lightweight simg2img/img2simg implementation
  image_types.bbclass: add support for sparse images

 meta/classes-recipe/image_types.bbclass       |  4 +-
 .../rust-android-sparse-crates.inc            | 98 +++++++++++++++++++
 .../rust-android-sparse_0.6.0.bb              | 20 ++++
 3 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/rust-android-sparse/rust-android-sparse-crates.inc
 create mode 100644 meta/recipes-extended/rust-android-sparse/rust-android-sparse_0.6.0.bb

-- 
2.39.2


