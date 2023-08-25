Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FFAC88CB2
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:47:52 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.5797.1692931667183945716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uN4WTG+j;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a99eeb95aaso327524b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931666; x=1693536466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+1511gvIiCGkokG51tF0aDQfyip3KkxuLKujqGZ64U4=;
        b=uN4WTG+j3p4XWLzmU+np3kAn8fK64y8E7sQs6lOdRIyMGA9Jatmbr7M6Jp+evvx0fl
         O0N/kURw46a69nX/4rykG9Ur89DC9o9iGl05IBEib5J/JwOtUHRfq8DMkzZFjNflzkKf
         etuivXduDOxmkeBcIUdgrZIpArkd4wpyb4IKJ35RE1hlS+sRneAddyps/Q+2DStznSUM
         do8owmrLetJHRJd2od7emUOiCjvfsuXzNqr6eGd1q7bFKWXNcHDh1K0UUWEY1CBfIwHt
         fLNJrQetnIjF1d+sdoBqDvGBK6745DrSoZgPtWnCQygDBpj4Tdw9qT1grPlNB/gGcdI0
         xaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931666; x=1693536466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1511gvIiCGkokG51tF0aDQfyip3KkxuLKujqGZ64U4=;
        b=cp6KnvjPMV9+XBvD0ckKV8tKh7aSXPi+aBcE6kMwbZVuVj0seXSfo6iiCe89iYzd76
         m8Gmm3ipYggKiALTdMjrch/Ah72PrO7CPHvnsQUWZUbFqdGBu7TyK+Alef8c1dgUqt/x
         dYkqKnnCJsDphWpoXwA+VLElcNiDX0SzvI90DU7ZBGowFAZ7pMyal5wRc9qgMKVtv57e
         ZziLVRGX8HvqaKnMhpyA59e+7hZzKzOr9tNuZ8GC3gaxibDs2Sk+PsFqc5hEr2Cmm9Y9
         3B7StVP3wvG7PudxzcN2fAef1LSSSTePCO6ZrdiMZfPGiU6aUW+Kyx0Q/qsscZ6Pj9qq
         c/rQ==
X-Gm-Message-State: AOJu0YxeCg8N0Scv/C5KFGdKNCZW2TwsWM5erMGeuURbC26WHNo03z3E
	21a8+aNzq9QFJQks3UT7k79XOXO2d4tgAcycmfA=
X-Google-Smtp-Source: AGHT+IHD3uU3NtTbY46AHojl93kbeVukm39mexAHf8kEC+JBYvcayRpBYxZFlbEm8cWcKGZQY6aeYw==
X-Received: by 2002:aca:6502:0:b0:3a7:8fcd:3325 with SMTP id m2-20020aca6502000000b003a78fcd3325mr1626958oim.17.1692931665974;
        Thu, 24 Aug 2023 19:47:45 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.47.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:47:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Thu, 24 Aug 2023 16:47:24 -1000
Message-Id: <cover.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186673

Please review this set of changes for dunfell and have comments back by
end of day Satuday, August 26.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5779

The following changes since commit b70a8333a7467162b9d148b99f5970c0af2a531f:

  kernel: skip installing fitImage when using Initramfs bundles (2023-08-12 05:38:11 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Ashish Sharma (1):
  curl: Backport fix CVE-2023-32001

BELOUARGA Mohamed (1):
  linux-firmware : Add firmware of RTL8822 serie

Chee Yang Lee (1):
  tiff: CVE-2022-3599.patch also fix CVE-2022-4645 CVE-2023-30774

Dmitry Baryshkov (2):
  linux-firmware: package firmare for Dragonboard 410c
  linux-firmware: split platform-specific Adreno shaders to separate
    packages

Jasper Orschulko (1):
  cve_check: Fix cpe_id generation

Kai Kang (1):
  grub2.inc: remove '-O2' from CFLAGS

Michael Halstead (2):
  yocto-uninative: Update hashes for uninative 4.1
  yocto-uninative: Update to 4.2 for glibc 2.38

Ross Burton (1):
  oeqa/runtime/cases/rpm: fix wait_for_no_process_for_user failure case

Trevor Gamblin (1):
  linux-firmware: upgrade 20230515 -> 20230625

Vijay Anusuri (1):
  elfutils: Backport fix for CVE-2021-33294

Wang Mingyu (1):
  libnss-nis: upgrade 3.1 -> 3.2

Yoann Congal (1):
  recipetool: Fix inherit in created -native* recipes

 meta/conf/distro/include/yocto-uninative.inc  | 10 +--
 meta/lib/oe/cve_check.py                      |  2 +-
 meta/lib/oeqa/runtime/cases/rpm.py            |  4 +-
 meta/recipes-bsp/grub/grub2.inc               |  2 +
 .../elfutils/elfutils_0.178.bb                |  1 +
 .../elfutils/files/CVE-2021-33294.patch       | 72 +++++++++++++++++++
 .../recipes-extended/libnss-nis/libnss-nis.bb |  4 +-
 ...20230515.bb => linux-firmware_20230625.bb} | 37 +++++++---
 .../libtiff/files/CVE-2022-3599.patch         |  2 +-
 .../curl/curl/CVE-2023-32001.patch            | 38 ++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 scripts/lib/recipetool/create.py              |  4 ++
 12 files changed, 158 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2021-33294.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230515.bb => linux-firmware_20230625.bb} (96%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

-- 
2.34.1


