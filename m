Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9575BEED607
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:22:05 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.23114.1694791317664072963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OrHFm8wM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2746af1b835so1565119a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694791317; x=1695396117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zlCzdza+SXdPmMuY2VCVB2pbJ0VTaLsa1L1cVwj+m18=;
        b=OrHFm8wMhN0pNee1BTHN9gADrfgmJIgN3UJdHbvq1il9OHEiVosRj/IYcqEt3jGePt
         lDzIUkm3n8rsiytQnEGIh07RfZxTD3l42YghDX8dJejHOJURVxtIJs2Oask1xfnvVo1r
         UtrtvVjh8QFS9Ka93xYzVWjvxFTWzODG9FrCLGOy/DoOd2wsxbBVhRJljlSnSq2eO3xI
         yHqoXMDX5og++zgYKoBF3CUqzF3rdlaCfUqnk1v/gJzLxLGf1K0yRr1ZU1reMQRJkM0E
         /T7PmEjkYJ2ejS3yIBcnXDL9hUcL5Q65H8uiMaitZFBgQE0NP94TvwZdEDVpvaVCbnih
         R1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791317; x=1695396117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zlCzdza+SXdPmMuY2VCVB2pbJ0VTaLsa1L1cVwj+m18=;
        b=l4c7DVKtgZrWQee88Zu9NrT+x/7ln/NatgE63M2V4BpRUQ9rbd5qCCgwF4edv7F3/9
         iY15U81/HcdQurVdKKugjHo9SffnP9NLcpbm4otryg3r9hj2B9JZdl+uFI/oTrZ5yswT
         PEyLrCrtiHOD6H1uV0WfhSmWJCHxVLkAmw9mj6yrsvLryy4/7eH3lWNR9fgxvQZAqfL3
         cOqBrObz46z6/e6IyLExLIPBVGl9f6H4T+bhsphxnCAwmMmMZO96P6QSnvIarXndiKx1
         2c3YOP6soFmtPX9SOVDe+yUHdK6YLhcorAlR9VyHYI4CNWQvoULgQAxsrpGN5hCWlt9X
         jCZg==
X-Gm-Message-State: AOJu0YzLI8792xg1nxSl1CGik8DjtFCAI4eWSb2CNXVqWkQeGyMUd7jU
	q0Y8Mb50RVBrkLhHA33P87v2flkiCFNMYKqwIks=
X-Google-Smtp-Source: AGHT+IEdeY2zvZIyzSTjNvnxgxUM0MlsefLxHrp2SnSKjYgH1x/+sAr6vn9TDVB4nTxliVmGwTqTjg==
X-Received: by 2002:a17:90b:1952:b0:268:14a0:f8a with SMTP id nk18-20020a17090b195200b0026814a00f8amr1834622pjb.39.1694791316599;
        Fri, 15 Sep 2023 08:21:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090ae29500b002749ae93778sm1375398pjz.23.2023.09.15.08.21.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:21:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 0/8] Patch review
Date: Fri, 15 Sep 2023 05:21:38 -1000
Message-Id: <cover.1694790288.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187668

Please review this set of changes for mickledore and have comments bacak by
end of day Tuesday, September 19.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5889

The following changes since commit 055b7acd73a591cb529629a780558cc0f5b19456:

  yocto-uninative: Update to 4.3 (2023-09-07 15:56:52 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Archana Polampalli (1):
  vim: upgrade 9.0.1592 -> 9.0.1664

Chen Qi (1):
  cmake.bbclass: fix allarch override syntax

Richard Purdie (1):
  vim: Upgrade 9.0.1664 -> 9.0.1894

Ross Burton (1):
  gcc: Fix -fstack-protector issue on aarch64

Sanjana (1):
  binutils: Fix CVE-2023-39128

Siddharth Doshi (1):
  gdb: Fix CVE-2023-39128

Yogita Urade (2):
  dropbear: fix CVE-2023-36328
  qemu: fix CVE-2023-3354

 meta/classes-recipe/cmake.bbclass             |    8 +-
 .../dropbear/dropbear/CVE-2023-36328.patch    |  144 +
 .../recipes-core/dropbear/dropbear_2022.83.bb |    1 +
 .../binutils/binutils-2.40.inc                |    1 +
 .../binutils/0017-CVE-2023-39128.patch        |   74 +
 meta/recipes-devtools/gcc/gcc-12.3.inc        |    1 +
 .../gcc/gcc/CVE-2023-4039.patch               | 3093 +++++++++++++++++
 meta/recipes-devtools/gdb/gdb.inc             |    1 +
 .../gdb/gdb/0009-CVE-2023-39128.patch         |   75 +
 meta/recipes-devtools/qemu/qemu.inc           |    1 +
 .../qemu/qemu/CVE-2023-3354.patch             |   88 +
 meta/recipes-support/vim/vim.inc              |    6 +-
 12 files changed, 3486 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2023-39128.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0009-CVE-2023-39128.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch

-- 
2.34.1


