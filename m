Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B715C5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 15:40:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.8793.1748619600525379443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 08:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZRMWMdhR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234488c2ea6so23532055ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748619600; x=1749224400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pPXRSPFR15lSnkPaCq95AA2tP+CZGB687C2jySM2IvA=;
        b=ZRMWMdhRcngY69o2UkKRImHAa+1T8aSPLeB1ThzSmIFou5RdFN/6Nx0qhSAF3Wl4mc
         8TKYsmM01KpWDgo8zlsABfpVQZPVVCMsldKiQOr7WabGQg3/OpFwZQXxAhxBAgxCYBcn
         gS+HfS3Fgs48vwyS8HxEisOgSAHO0n+hnckkOv9V+F6lEKPMnfG2v6WeWkZBwvvfZ0FY
         ZzoUHgw92BzrPKQZyiKiZj982yJ3WnnKgCZQcnt4DVGczpOZIpMGbN0XOoM/twjQGA9F
         654tkMyOVLy1HzKK5ES+Hjaf8+irmOs9gGjVsWTXXURaTsOqIdFpSN0auNz5jjILjCz0
         isvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619600; x=1749224400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPXRSPFR15lSnkPaCq95AA2tP+CZGB687C2jySM2IvA=;
        b=jDkXOOODukC7bhuUpS2a+OdlJ1EbAw5EvH7jYGVZ3A7XCGQLAkPIK7g86to2MT3Stk
         RY591P/K9jWk2YXapampWt9OkbtsToFKrJ/CcJE1N2GtAiPx0+Uvt05g5iN4Vzdj9p2d
         P9kMAmoE2bCKlD5cBBuX4EzhvdYZXQcXjeTgNXhelFvpjWOoSJydkxWVGYkzjz0a+6Qm
         WufOxPt9YbnBw4NW0I1G9FQT8uENmcCn+mKkKK7MXxg4ovQ0GuGYUsBrsGbCCvOkoT2y
         85q7aZ0ONOB6q3JH2a5pC85MUVj3bjDyTL1vAADFrQnwoR/brMirooa43/tBnoG8Pdmq
         LNMw==
X-Gm-Message-State: AOJu0YyrZP7Wr7nFrnUtpfsxDGace1UEp+ztHf1Rjl62bds8KtVGbdiA
	tJwzVBVw1XQVs/P7c5CoKNLemb7rzY4ZPQFlzssf9mBahjOP7eNwK+Atgeyvc04pbZuzgEHQtsS
	vycts
X-Gm-Gg: ASbGncu+S2bxOaWGsdktzBrym8D0uBF7VvEwBhLgZfGAXquCNipW3vz+QbSYKb9cmPK
	KS30WsoJsm7tnsfLME5GHQWgAw5lQurtkKXR/jKNyss9HDQczL+yPOz7Q0glFTw5AtnrfvM5IZB
	GH9FPSsIxnf0LFoGrlIV0xeoocJKmiO06hsFyRM4Qe7FwNEcazq2UKets47UOL2bq1cSL2oR8dp
	kVcGYYxDi6MblnGwp5Wdk4NldkICuXWjXOtiDSErs0oXQJRoVYOrEo77nAU7v9UiEzRY5tZ0gBF
	OcPpjn6skHll503FV6pBxsOAvbsJvdwfUbF78DD5pRJIRD/USQIJ3Q==
X-Google-Smtp-Source: AGHT+IHYCuTIdn4rR2MQjz4lCUzEl4K9l+xYc0jSzcRWq63cu4H96Vf93fKtaBWAjQ2jT71SAH4L2w==
X-Received: by 2002:a17:903:40cf:b0:22e:5d9b:2ec3 with SMTP id d9443c01a7336-235395a1e5emr32312405ad.30.1748619599365;
        Fri, 30 May 2025 08:39:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf9116sm29903075ad.200.2025.05.30.08.39.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:39:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Fri, 30 May 2025 08:39:43 -0700
Message-ID: <cover.1748619488.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 15:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217510

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, June 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1684

The following changes since commit a99a65632116955dc69809a14bf536b22582de72:

  gcc: AArch64 - Fix strict-align cpymem/setmem (2025-05-23 08:27:24 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (5):
  linux-yocto/5.15: update to v5.15.180
  linux-yocto/5.15: update to v5.15.181
  linux-yocto/5.15: update to v5.15.182
  linux-yocto/5.15: update to v5.15.183
  linux-yocto/5.15: update to v5.15.184

Guocai He (1):
  sysstat: correct the SRC_URI

Harish Sadineni (2):
  binutils: Fix CVE-2025-1182
  binutils: fix CVE-2025-1180

Hitendra Prajapati (1):
  screen: Fix CVE-2025-46805

NeilBrown (1):
  nfs-utils: don't use signals to shut down nfs server.

 .../nfs-utils/nfs-utils/nfsserver             |  28 +--
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0040-CVE-2025-1180.patch         | 164 ++++++++++++++++++
 .../binutils/0040-CVE-2025-1182.patch         |  31 ++++
 .../screen/screen/CVE-2025-46805.patch        | 121 +++++++++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |   1 +
 meta/recipes-extended/sysstat/sysstat.inc     |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 10 files changed, 344 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1180.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46805.patch

-- 
2.43.0


