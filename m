Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8E0CA0EE5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 20:49:33 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.7044.1755118165473956269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 13:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h2KsU64k;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70a928c3686so3879176d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755118164; x=1755722964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKJLNxazlwPR+wDlYT8VTPriA1s47HW7lr8zrW7jl/M=;
        b=h2KsU64kPHNGXkh+hK6UOX63gw+375vWxfwYCUSSeiKUPfiaD//Nahf5VzQIlv7LZT
         N0F/YQ2Ds9LdTBwaFWpB+3n6M9vg3OMFjJzv3ddVLbaL6y9ShTXH8z4HEOmK+c8BPY8f
         3iCGEBL+FcIuC0zviWazrCP3+tWirpeMvFeq3mAQqFeADp4EJnSLppXqctLJWmxMJSaE
         N6/5HBc3pFGgAuBck9x8DIPageowITX4XWd/kwSB4Jmgn/3//SqgoogzrHjM19mUv5gB
         uwtROWMwxlI5A1Gk7/s3HpmqZ9kyVFZenFphGoBx9IlQ2WXxy8Z92ggJ16woPXqFxqGF
         VpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755118164; x=1755722964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKJLNxazlwPR+wDlYT8VTPriA1s47HW7lr8zrW7jl/M=;
        b=MkL0iL5xoZSyX1NtQdohbhHyZ8ieNYS7pf5DleldqSfVLOSc2tmYDRkPv+VaQKR3a2
         wxtWq6khU/4cVtGv73ThTaJBf0zxp3//eFuzpoj0OSSMaPnclTuHxhfC3dzxybqsUvM3
         tcZTx7BO7COxmLkZQj2WJo4pgSHPe1Zprd9y46Dfkz1iyPYWddCgaiLL/zN9jx+N45uA
         cDYhwkiiZ3IcukwAeXmkAH8kv/jY1UHAR967WtZFYZASPr9CVbWLqgM4GgTL/FHJmTB8
         SiC9iJzeJjK5vNSUitK3Bun2cx1VUVdBBCAPHAJBUBPKnkrV0C+xzDze9TuqowBRTIvb
         78SQ==
X-Gm-Message-State: AOJu0Yz22HeURL+lUwFTl8MeM9ppKHHnfJifg9HCvC6X+mIs4654Jw5x
	YuXY9j1RBixfjFZOgK8PJ5yHDtVhhGgVsLqCQUgx2G6UE5KM1KpQEb3vdPVtM3aB
X-Gm-Gg: ASbGncuTredcl/6mEXVQMvEtR4XU9xrHyrKQDNP+z53z4BRzan8VmJ35PoGvFW44ZFe
	chTBuBeoh4q3cVgzBUvdnwYVYUFfT0ZhwwfOl21VgjnVmeHzw4YCk5/3GjYRgBDOPL/6GDjc2zt
	VQRaLpOzIFTguTKItTAl5HiHa3/JIgphfXo/YcHhDTfeyYw2Ebtb50dYY90kwR+NoSCIsBNGJRz
	I8qHdLo/ZO654Bla4hXVmbG+Bj0aWaiJjH1tUCg2xQMl+FmQiPlFZhV1SdKduYz2ZhwK4TMK1JI
	NQBIqeJ+qFgGkN80eiBs+cLImMIVJf1i1AsUwY6f2MrNHDpESjFHkPOJoUn1qEaPpRaztGS9/yH
	r4XYwkLmCdHtBAX2qq/ZD42/AsP4TprKwVk1JWlzVh6aW2JhavIdLGJGFgwIqbXsPScjNvE0mvm
	MZeZR6ibJbtaeTfCOa0SLSMpE=
X-Google-Smtp-Source: AGHT+IFMFEBMqMUd3gZU8R8Uj8K4w2hnGxoUaHA+ZzKpzzsviWkNA5Hb7nr7dRhi8m01TK4YEGMwmA==
X-Received: by 2002:ad4:5ca7:0:b0:707:6409:d016 with SMTP id 6a1803df08f44-70b98212633mr2174216d6.9.1755118164372;
        Wed, 13 Aug 2025 13:49:24 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5b07658sm3326516d6.43.2025.08.13.13.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:49:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] kernel: consolidated pull request
Date: Wed, 13 Aug 2025 16:49:14 -0400
Message-Id: <cover.1755118020.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 20:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221820

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of updates as I move towards making 6.16 the
default / reference kernel.

linux-yocto-dev is fully done, but now that lttng-modules is building
I can complete sanity testing.

I don't want to sit on those while I finish that testing, let's get
the libc-headers soaking and in the next day or two, I'll get 6.16
out for AB testing.

Bruce


The following changes since commit 3b2f9c31dc17c3ba5f6a9971413afed3d450d826:

  poky.yaml.in: increase required disk space to 140G (2025-08-08 23:41:11 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/6.12: update to v6.12.39
  linux-yocto/6.12: update CVE exclusions (6.12.39)
  linux-yocto/6.12: update to v6.12.40
  linux-yocto/6.12: update CVE exclusions (6.12.40)
  linux-libc-headers: update to v6.16
  lttng-modules: update to v2.14.0
  linux-yocto/6.12: update to v6.12.41
  linux-yocto/6.12: update CVE exclusions (6.12.41)

 ...ers_6.15.bb => linux-libc-headers_6.16.bb} |   2 +-
 .../linux/cve-exclusion_6.12.inc              | 362 +++++++++++++--
 .../linux/linux-yocto-rt_6.12.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |  28 +-
 ...x-sigaction-build-without-CONFIG_COM.patch |  35 --
 ...e-missing-CONFIG_TRACEPOINTS-to-warn.patch |  18 +-
 ...mentation-Add-missing-provider-name-.patch |  45 ++
 ...pose-__percpu-tag-as-a-named-address.patch | 438 ++++++++++++++++++
 ...les_2.13.19.bb => lttng-modules_2.14.0.bb} |   8 +-
 10 files changed, 845 insertions(+), 103 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.15.bb => linux-libc-headers_6.16.bb} (80%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-writeback-instrumentation-Add-missing-provider-name-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-percpu-repurpose-__percpu-tag-as-a-named-address.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.19.bb => lttng-modules_2.14.0.bb} (81%)

-- 
2.39.2


