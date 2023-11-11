Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48958C4167B
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:14 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.53354.1699714990851718585
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=flTVXAVR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc0e78ec92so20455975ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699714989; x=1700319789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Exly/WPW3Gs/aVB5+3/D3npHVgX29t7bdtDb/iEZ5CQ=;
        b=flTVXAVRffFYHXIDAAwJAi2WdashUhuVcQlnwYmNs4FUU/Co+RX5cRaJD4nIV2M0LP
         plEo7FPOs8f2wqrYn6hTtyEemTUPsjBpWfliFQYmKYRRiO+tQoh2ASFV3xKSSOn4K3zo
         9OGNcdWhTStnSsvWrYnVEqlgOMOSurpaYUaIo3eB7pXl/0dvsdDi5H35vDzLd4zAg5EF
         1+X7NW9o1FdoooCxiD4xGwX1sGbis9hzJ45sa4fNPmjjGkgO8w2Wi8deK4EU+tWz6RtI
         QtXRJg9ZWcRgpnh5Z5RoUwZjOwxvFmtAL8OEreFPLcm9jnOuybG0yHg9qIdvrtJbAwe8
         8etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699714989; x=1700319789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Exly/WPW3Gs/aVB5+3/D3npHVgX29t7bdtDb/iEZ5CQ=;
        b=cUo0ecnargw9NWXe6eXAC2Bl5iskQVKis1qJIz8F6pmtmQC/PrL5961gu5sQjjR1Lv
         f2suTa1b0dnyuCvryJdYu4B3HeCfPh0/sQaeFyl1DwiPzwIj9qqzZjmV2rWIyRQxA3fc
         tS7RSTwiC1P/hkwBVZgrLUsPxARAQRN4LFzMNNRws5qQ/BABLblKWaiGhN3CH0mr+u0G
         A/3FPTcw4odyTOh410/mbVZU6giBOlEBoFYibKctiYqZxpLprVum8Nt9K9x2S+oy6d5a
         BWJKLP9woCHOcO3Dhg9Q1Q4w1/K8LTkRUZxnTAT/7JkAehNzsMRC6Eu+c7VbLNQWjp8M
         B8Fg==
X-Gm-Message-State: AOJu0YxLL4ImWcTTueGQONReXFw4tSuJq4xB7+8Wz6sYG+xs9ZqPIQJB
	swp9QPpclt5rvfL0dAFzmph0V8SyeyO5+aWUmnoVbg==
X-Google-Smtp-Source: AGHT+IEFRCc35ZFvBt14Ky1I/ZqLEw8TXwWTax9ptBdbiBlrA3JhVWKaTLROumjYMKqdT/l5SHWBFg==
X-Received: by 2002:a17:902:e809:b0:1cc:6101:2086 with SMTP id u9-20020a170902e80900b001cc61012086mr1970917plg.11.1699714989100;
        Sat, 11 Nov 2023 07:03:09 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/15] Patch review
Date: Sat, 11 Nov 2023 05:02:49 -1000
Message-Id: <cover.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190415

Please review this set of changes for dunfell and have comments back by
end of day Tuesday, November 14

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6174

The following changes since commit 0dbf3a15321b8033ff8ed86c6aa261fdb9c3d5bb:

  build-appliance-image: Update to dunfell head revision (2023-10-27 04:22:17 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Ashish Sharma (1):
  zlib: Backport fix for CVE-2023-45853

Hitendra Prajapati (1):
  tiff: Security fix for CVE-2023-40745

Lee Chee Yang (1):
  kexec-tools: Ignore Fedora/RedHat specific CVE-2021-20269

Mikko Rapeli (1):
  lz4: use CFLAGS from bitbake

Naveen Saini (2):
  assimp: Explicitly use nobranch=1 in SRC_URI
  resolvconf: Fix fetch error

Peter Marko (1):
  glibc: ignore CVE-2023-4527

Ross Burton (3):
  cve-check: sort the package list in the JSON report
  cve-check: slightly more verbose warning when adding the same package
    twice
  cve-check: don't warn if a patch is remote

Soumya Sambu (1):
  libwebp: Fix CVE-2023-4863

Steve Sakoman (2):
  Revert "qemu: Backport fix for CVE-2023-0330"
  lz4: specify gnu17 in CFLAGS to fix reproducibility issues

Vijay Anusuri (2):
  tiff: CVE patch correction for CVE-2023-3576
  xserver-xorg: Fix for CVE-2023-5367 and CVE-2023-5380

 meta/classes/cve-check.bbclass                |   2 +
 meta/lib/oe/cve_check.py                      |  13 +-
 .../resolvconf/resolvconf_1.82.bb             |   2 +-
 meta/recipes-core/glibc/glibc_2.31.bb         |   7 +
 .../zlib/zlib/CVE-2023-45853.patch            |  40 ++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 ...-2023-0330_1.patch => CVE-2023-0330.patch} |   0
 .../qemu/qemu/CVE-2023-0330_2.patch           | 135 ------------------
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   2 +-
 .../xserver-xorg/CVE-2023-5367.patch          |  84 +++++++++++
 .../xserver-xorg/CVE-2023-5380.patch          | 102 +++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   2 +
 .../kexec/kexec-tools_2.0.20.bb               |   3 +
 ...-2023-3618-1.patch => CVE-2023-3576.patch} |   3 +-
 ...-2023-3618-2.patch => CVE-2023-3618.patch} |   0
 .../libtiff/files/CVE-2023-40745.patch        |  34 +++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   5 +-
 ...23-5129.patch => CVE-2023-4863-0001.patch} |  27 ++--
 .../webp/files/CVE-2023-4863-0002.patch       |  53 +++++++
 meta/recipes-multimedia/webp/libwebp_1.1.0.bb |   3 +-
 meta/recipes-support/lz4/lz4_1.9.2.bb         |   3 +-
 22 files changed, 358 insertions(+), 166 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
 rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330_1.patch => CVE-2023-0330.patch} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
 rename meta/recipes-multimedia/libtiff/files/{CVE-2023-3618-1.patch => CVE-2023-3576.patch} (93%)
 rename meta/recipes-multimedia/libtiff/files/{CVE-2023-3618-2.patch => CVE-2023-3618.patch} (100%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
 rename meta/recipes-multimedia/webp/files/{CVE-2023-5129.patch => CVE-2023-4863-0001.patch} (95%)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch

-- 
2.34.1


