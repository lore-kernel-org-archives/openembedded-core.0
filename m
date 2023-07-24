Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D87C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 02:33:48 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.39765.1690166022792389531
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 19:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iG9T8nhg;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.49, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1bb29ae5975so1447940fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 19:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690166021; x=1690770821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBckbgiMlPTGcnOMkXFK0oIRnzoXlrN8+aWKpkDSoNg=;
        b=iG9T8nhgQSvgOdT55W8/Fxi5iLSnbQtfAItmv1Dccr3umA3yfk8Kf7yB7+nJAkbpLa
         xtcu+QNcMZzPVqC7gmq+bwoh1Gv/O671n4CtuCtajTbProxlOip5BgP1DLeIUHJ+efCF
         9pwqZCAGjEgxR1rRQubtrONcAUSlc4irDcyR2+O6AQJwuTEcGONfDLEd7ggSE7aKvInB
         72Z4zra9CWpyTiNq9H6ereCy2aOg4JwJw+h8Nu/tWgzuL9Ofsbz093M5C7S5SH1L0tzD
         N1TXgb5SVQDe1ylJsqtoD2ghVt0lfa48MlZifmHc/rHxZbm1A7VP06rpTJmR7yMANsz0
         k++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690166021; x=1690770821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBckbgiMlPTGcnOMkXFK0oIRnzoXlrN8+aWKpkDSoNg=;
        b=R4Kzery9iSGlkfh/6no5obtoOZOkiSOHpYM3c40MzFyTH8+79iFaD+Ivx6BOfdxj8T
         5mNA03oEsTpVwCHeAFi+cIdfoX4eNXydWXqrFQEd7N87cP52aWZR7lnU6cJa2SymVJj6
         SV1KLzVF+LyCKL85xWJ6xaB0GWEIiSUDW7NAEezyJoBOVwhT75CT50Z6shw0eDyY7+HG
         l1dC1yLIpkmKHJVqjKDs1ODhTc85bVscS639vHxtdYafdDGo07wPb8G/zd1bXwhDWPCH
         a/7cUAGEedGFkUpkGL2zr33n+1nijzFqyN4TxJx58ZwSWNIosLpAuoSVKT6QcoMC5Uvx
         rmyA==
X-Gm-Message-State: ABy/qLaeuzR0Zm/EfjUArhVFLteAFe7W3awOhqQ7IUeD70uvlvBoMr5T
	TKAQWnsvlemwJmd+sldCaVvh8fHDFn6CASgzSjRmag==
X-Google-Smtp-Source: APBJJlH9FfgNNFzg3VpWx54WzvMUzG2FTuE5XAInLGazYNz9GtoWThWPyI8rmq75C5mAD7emH/rIMQ==
X-Received: by 2002:a05:6870:e313:b0:1a9:c186:398d with SMTP id z19-20020a056870e31300b001a9c186398dmr10137487oad.21.1690166021635;
        Sun, 23 Jul 2023 19:33:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j1-20020aa783c1000000b0063f00898245sm1024174pfn.146.2023.07.23.19.33.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 19:33:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Sun, 23 Jul 2023 16:33:25 -1000
Message-Id: <cover.1690165924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 02:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184769

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5638

The following changes since commit d877d5f07772ec4a05332068ddc03cf387313036:

  cmake: Fix CMAKE_SYSTEM_PROCESSOR setting for SDK (2023-07-17 04:45:01 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (1):
  ghostscript: fix CVE-2023-36664

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.119
  linux-yocto/5.15: update to v5.15.120

Richard Purdie (1):
  gcc-testsuite: Fix ppc cpu specification

Ross Burton (2):
  gcc: don't pass --enable-standard-branch-protection
  machine/arch-arm64: add -mbranch-protection=standard

Vijay Anusuri (1):
  qemu: backport Debian patch to fix CVE-2023-0330

Xiangyu Chen (1):
  package.bbclass: moving field data process before variable process in
    process_pkgconfig

 meta/classes/package.bbclass                  |  12 +-
 meta/conf/machine/include/arm/arch-arm64.inc  |   5 +
 .../gcc/gcc-configure-common.inc              |   1 -
 meta/recipes-devtools/gcc/gcc-testsuite.inc   |   5 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-0330.patch             |  75 +++++++++
 .../ghostscript/CVE-2023-36664-0001.patch     | 146 ++++++++++++++++++
 .../ghostscript/CVE-2023-36664-0002.patch     |  60 +++++++
 .../ghostscript/ghostscript_9.55.0.bb         |   2 +
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 ++--
 12 files changed, 317 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-0002.patch

-- 
2.34.1


