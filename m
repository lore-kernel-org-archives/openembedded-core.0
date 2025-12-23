Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C26E6FE2F
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:22:46 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109339.1766524959915213649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VY0SGTLH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a110548cdeso75301855ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524959; x=1767129759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d5QSXrYyKFXrHS18ByJyH3cA1rYhyvVzYD1PYuCCOQ8=;
        b=VY0SGTLHLV4q5DwOUxtuP8CO7nQMBLjz63jyb5T4iW3mGRabJTJ0nCptVtgEvZOyTK
         BbGvi9dpuFw4fokCbFF4SrcgE9n+K1RNwHkd1OMe6ojkm1+7+Lg/fO9Pn2n3iP7BPevk
         dyXNs37eFcUbbwUdVzK147ZBhN8VQv0WPqJDJ04esqogtmPJ9DoJMuw2IINAvrELRk/H
         L5PcrBSLrbe71EWBYMUo+DFCpXugbhh8D6avYL8jBTp9GqvOdpPoy9uBUogwzQVa6QGr
         l6sqvgyVHkuElzlxfksNduWrykP6w1doCDlVmkRch0LAQf65hbAaLU0i5aJ2Pnf/zGuw
         utpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524959; x=1767129759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5QSXrYyKFXrHS18ByJyH3cA1rYhyvVzYD1PYuCCOQ8=;
        b=bkoNCvJWWhG8dkAouvVB2kF5iArx6G/+I8LZXM1erKviypXKqG7UKG83zNKX5ZWeTq
         ev5hOTgIyUGAy7uniSD4RkKQkJuUTTTtlTyLO0N9T5FN+wtL2msvktvUpdXF8rRdjZuD
         TFI91v0L5nESu4XHFB9+V4l8Z3RBZqSA9US4pw+iK8T7v5FRe8Vv6KJ2l68wig5tfYY8
         AavkuKIHjHEyb97TpY/tcr26C/7Y4z9VOOG9nbGRfHeQcT5G68NuMLlYyS+fUweqsecL
         mqIBP0ztmnfwIzmZRkGUxggyQT9tRloMtpyLFURzrQeO8qQksaNfVW4RIIb+hcsyDriB
         Unsg==
X-Gm-Message-State: AOJu0YzrshBNhYYWZss9czobFYLg3BC7l+pNOwOaXW1H7v4gyxJsoJGE
	zSEjcrMV1RDjfi8EUNjg4goIIUREhxlml3i/Tq6PDHGP4wsSIFHcuw5xtZ3fUqy71LRJzjGEzUT
	e9p3Y
X-Gm-Gg: AY/fxX7+IXfcFkSSYhhFktQSr9T8cGHgDEJCock5tIBne8g/4iRlwEprRD1tkRU1Ct8
	qPJs6alTVlGE/hzKoyAqV5+NYc+poa+ltupSxmg1QUDliO8yS1aZuHp3bAn1UmZmcuwLN9PaPWc
	lipQ3y/Kd+B0DKHgjvdI+PeNftvq6Yn1whxQyBf1XHHQDVFuKGME5RNeTHmJij2g6XcXIWYX+io
	iMAJIb4J7AwsoZBRZCaVEevDN1qSiPxfFv9oEBQ06JyTcXWl52J5blfaRdMpBv22AhLSMd73FiJ
	6lhpVQd7D7ztVoj/LXmV6hUYrcapdpudIS8T2kVCxY6MXhi4L/uFE0wMl0tM24NcFOPsnUcNoIJ
	zH2h2kT2SLPnish3XkJJOa5+zDAjyVbtbp0dSf+3OFOvw822ylwqemf22HCYGpvtKqjFzhB2Er7
	eK6sqjAWY8kv0c
X-Google-Smtp-Source: AGHT+IECciZElvphIcy7RwMPx1zBylhiDEnH2scg1s7texPrsabXYAvL8wcrdER/gwgXr8BULoOihw==
X-Received: by 2002:a17:903:3d0d:b0:295:28a4:f0be with SMTP id d9443c01a7336-2a2f2212882mr152781675ad.10.1766524958988;
        Tue, 23 Dec 2025 13:22:38 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.22.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:22:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/18] Patch review
Date: Tue, 23 Dec 2025 13:22:06 -0800
Message-ID: <cover.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228474

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, December 30

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2919

The following changes since commit 2b3d2b671a149cbeea2bdc9ba42192da2015c3b7:

  Revert "lib/oe/go: document map_arch, and raise an error on unknown architecture" (2025-12-11 13:41:59 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Adarsh Jagadish Kamini (1):
  rsync: fix CVE-2025-10158

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.0.14

Daniel Turull (1):
  cmake-native: fix CVE-2025-9301

Deepak Rathore (2):
  cups 2.4.11: Fix CVE-2025-58436
  cups 2.4.11: Fix CVE-2025-61915

Deepesh Varatharajan (1):
  binutils: Fix CVE-2025-11494

Enrico Jörns (1):
  cml1.bbclass: use consistent make flags for menuconfig

Jiaying Song (1):
  python3-urllib3: fix CVE-2025-66418 CVE-2025-66471

Kai Kang (1):
  qemu: fix CVE-2025-12464

Kamel Bouhara (Schneider Electric) (3):
  kernel.bbclass: Add task to export kernel configuration to SPDX
  spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX
  oeqa/selftest: oe-selftest: Add SPDX tests for kernel config and
    PACKAGECONFIG

Martin Jansa (1):
  cross.bbclass: Propagate dependencies to outhash

Mingli Yu (2):
  libxslt: Fix CVE-2025-11731
  ruby: Upgrade 3.3.5 -> 3.3.10

Moritz Haase (1):
  curl: Use host CA bundle by default for native(sdk) builds

Yash Shinde (2):
  binutils: fix CVE-2025-11839
  binutils: fix CVE-2025-11840

 meta/classes-recipe/cml1.bbclass              |   2 +-
 meta/classes-recipe/cross.bbclass             |  36 +
 meta/classes-recipe/kernel.bbclass            |  67 +-
 meta/classes/create-spdx-3.0.bbclass          |  11 +
 meta/lib/oe/spdx30_tasks.py                   |  20 +
 meta/lib/oeqa/selftest/cases/spdx.py          |  57 ++
 .../binutils/binutils-2.42.inc                |   3 +
 .../binutils/0028-CVE-2025-11494.patch        |  43 ++
 .../binutils/0029-CVE-2025-11839.patch        |  32 +
 .../binutils/0030-CVE-2025-11840.patch        |  37 +
 .../cmake/cmake-native_3.28.3.bb              |   1 +
 .../python3-urllib3/CVE-2025-66418.patch      |  80 +++
 .../python3-urllib3/CVE-2025-66471.patch      | 585 ++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2025-12464.patch            |  70 ++
 .../rsync/files/CVE-2025-10158.patch          |  36 +
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
 .../ruby/ruby/CVE-2025-27219.patch            |  31 -
 .../ruby/ruby/CVE-2025-27220.patch            |  78 ---
 .../ruby/ruby/CVE-2025-27221-0001.patch       |  57 --
 .../ruby/ruby/CVE-2025-27221-0002.patch       |  73 --
 .../ruby/{ruby_3.3.5.bb => ruby_3.3.10.bb}    |   6 +-
 meta/recipes-extended/cups/cups.inc           |   2 +
 .../cups/cups/CVE-2025-58436.patch            | 635 ++++++++++++++++++
 .../cups/cups/CVE-2025-61915.patch            | 491 ++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  11 +-
 .../libxslt/files/CVE-2025-11731.patch        |  42 ++
 .../recipes-support/libxslt/libxslt_1.1.43.bb |   3 +-
 scripts/install-buildtools                    |   4 +-
 30 files changed, 2263 insertions(+), 254 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0028-CVE-2025-11494.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0029-CVE-2025-11839.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0030-CVE-2025-11840.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
 rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb => ruby_3.3.10.bb} (95%)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58436.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-61915.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2025-11731.patch

-- 
2.43.0


