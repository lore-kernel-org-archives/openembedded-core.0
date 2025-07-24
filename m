Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A332C87FCA
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:35:50 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.5112.1753392940463771243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TUFPk4lu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74b52bf417cso1088078b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392940; x=1753997740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tT3LZwEVS4Wi3/5Kan1ZrKjUp7V3Q/VT6zvmmkgMX0I=;
        b=TUFPk4luUudfkKtjRr4+13vllWSrNoNjLQ8VEmMcv6m6/VIhFCDd23K0UOQiJeOKq+
         8gZyk15GEJwvi3uOZ35PowK4yrprP6ZcS2J4gTGrhxspa7m3PN/rbkQWcDzdRLoWiQD5
         RV7f84c7RhaykT5D0nMQkyOsiinCpZNlvKPdNoWxsIC3WQeX303CKe0znVScNwS7vbiu
         89tUUD7USYDjabjttFGggB7VbyKKiRH33NZr9Wi6p05TQ8RjzQfVyEii69gtP4FzIO3n
         G3YosZWus9WnHiSr79mDE+zyzbaPe7ZraOxHo4m7nCcNHSRK+1k7CO/Z/94mX+DBKnik
         +YaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392940; x=1753997740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tT3LZwEVS4Wi3/5Kan1ZrKjUp7V3Q/VT6zvmmkgMX0I=;
        b=RDmUl8y1i/uugfnQ2Sk55XRVj8PiA+l5DHIhy+qt4Ohqpog3OOPFlnPdME4LybFlda
         NCsYzNAJ4XSGn2k7kbfSP5feDxb0oLFBLJIsM9LtcpI1Gp0s89mkDwf4wela5Wek+9zB
         Of6B4xF5Ph3o88oOJDcbGQBRi70rY6QYxHpYaXpHSqaR7Wrt5SSv5ouf2sO2N8oM99JG
         F0krUODaHy0HejH+IvxRpI5X+fE4J7I5ig9yp4QjvySN8S/6jSXTZS6wV00lKeFlJpqf
         EaHeED4x89ekFqbiyC4uy4z+bjEGFrcvj8TykXNDLhcrZtY7P3D8z5QXertfNramRO1i
         nFGg==
X-Gm-Message-State: AOJu0Yzm6Og+FADfpYh791KIfz35Q+FaOSDSdGjgyMfy+5hxq5OeI7N1
	NsFwh/rrk+zPvpZ53IzHx8t0PmWTYuLUKmOAf0ijIEsqHwWN8vGFvpOezMgA2AsOBDN9GnjxWTw
	kTlvc
X-Gm-Gg: ASbGncspKiji8EgFFOGQrMHdv8RzHTv3w1PlqrxPxpLwduyl51A+TG1BhkHLqoHmybw
	lCQPD4JsfXczTlLLVWJCMAqX2jAA/NGi/FqoSCUad5jQ0i8A7lPR6USnnfWSyQ2Gkov8gprFik5
	i+PjD0/kwF2PqkpNO6zDjok+A6R4JeQjhhUc/YW4uB70dWVa6H/sgOYb4zjteB069iTrccl/xTm
	MwXyARYUTnfb9gaBiesW1hwM5aNUK8qcw6jzjd5A7U4zONGXI665tmj+8U2gRfIc1BpH+ZF+Nfo
	lvBQbCYc3hsSs814/i/3RWBS2L5W+/RLUtBjlnoSl7Pdd5ruscxKz5eVP9DdsNe7WNaeD/CPuRW
	5PkHLlHZ7p9Mg
X-Google-Smtp-Source: AGHT+IGh2pKhwSwb8SokG7UD3Ghch1mJ1rAFdDi3w0RupyzGxKIzCawoaQi+FJmfPS3BvMufWHrUBg==
X-Received: by 2002:a05:6a00:1ad3:b0:75a:c415:7804 with SMTP id d2e1a72fcca58-760340133c6mr14740676b3a.8.1753392939493;
        Thu, 24 Jul 2025 14:35:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.35.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:35:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/16] Patch review
Date: Thu, 24 Jul 2025 14:35:16 -0700
Message-ID: <cover.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220873

Please review this set of changes for scarthgap and have comments back by
end of day Monday, July 28

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2084

The following changes since commit 24c0ab18045920bb5c1e965c0ea6d176fd6de234:

  oe-debuginfod: add option for data storage (2025-07-16 14:09:39 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (1):
  mtools: upgrade 4.0.43 -> 4.0.44

Archana Polampalli (1):
  openssl: CVE-2024-41996

Deepesh Varatharajan (2):
  binutils: Fix CVE-2025-7545
  glibc: stable 2.39 branch updates

Hitendra Prajapati (1):
  libpam: fix CVE-2025-6020

Jinfeng Wang (1):
  mtools: upgrade 4.0.48 -> 4.0.49

Peter Marko (2):
  orc: set CVE_PRODUCT
  openssl: patch CVE-2025-27587

Richard Purdie (1):
  mtools: upgrade 4.0.46 -> 4.0.47

Roland Kovacs (2):
  libxml2: fix CVE-2025-49795
  sqlite3: fix CVE-2025-6965

Vijay Anusuri (1):
  xserver-xorg: upgrade 21.1.6 -> 21.1.18

Wang Mingyu (3):
  mtools: upgrade 4.0.44 -> 4.0.45
  mtools: upgrade 4.0.45 -> 4.0.46
  mtools: upgrade 4.0.47 -> 4.0.48

Yash Shinde (1):
  binutils: Fix CVE-2025-7546

 .../openssl/openssl/CVE-2024-41996.patch      |   44 +
 .../openssl/openssl/CVE-2025-27587-1.patch    | 1918 +++++++++++++++++
 .../openssl/openssl/CVE-2025-27587-2.patch    |  129 ++
 .../openssl/openssl_3.2.4.bb                  |    3 +
 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 .../libxml/libxml2/CVE-2025-49795.patch       |   92 +
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |    1 +
 .../binutils/binutils-2.42.inc                |    2 +
 .../binutils/0023-CVE-2025-7545.patch         |   39 +
 .../binutils/0023-CVE-2025-7546.patch         |   58 +
 .../mtools/mtools/clang_UNUSED.patch          |   19 +-
 .../mtools/disable-hardcoded-configs.patch    |    7 +-
 .../mtools/mtools/mtools-makeinfo.patch       |   19 +-
 .../{mtools_4.0.43.bb => mtools_4.0.49.bb}    |    2 +-
 meta/recipes-devtools/orc/orc_0.4.40.bb       |    3 +
 .../libpam/0001-pam-inline-pam-asprintf.patch |  101 +
 .../libpam/0002-pam-namespace-rebase.patch    |  750 +++++++
 .../pam/libpam/CVE-2025-6020-01.patch         | 1128 ++++++++++
 .../pam/libpam/CVE-2025-6020-02.patch         |  187 ++
 .../pam/libpam/CVE-2025-6020-03.patch         |   35 +
 meta/recipes-extended/pam/libpam_1.5.3.bb     |    5 +
 ...org_21.1.16.bb => xserver-xorg_21.1.18.bb} |    2 +-
 .../sqlite/sqlite3/CVE-2025-6965.patch        |  112 +
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |    1 +
 24 files changed, 4636 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-27587-1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-27587-2.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7546.patch
 rename meta/recipes-devtools/mtools/{mtools_4.0.43.bb => mtools_4.0.49.bb} (93%)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam-inline-pam-asprintf.patch
 create mode 100644 meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-02.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-03.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb} (92%)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch

-- 
2.43.0


