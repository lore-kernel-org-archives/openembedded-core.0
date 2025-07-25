Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F57C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:47 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.26731.1753469078006353655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QXNy1RET;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23636167b30so23433075ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469077; x=1754073877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T2Q1sCZcSlce+uGftjsED5FoBH5avvKrAL52Qesqqzc=;
        b=QXNy1RETHyUUmyXdNPNXI1+zN6Y9ZSkfswQsCqB38DpF2n+Y7XevFYBRcijvc3e+PS
         QDmYBILCkX8tYxqRFkHUFoM8dMPK0YUNpDiQvBePtiRICCbu+XZtwf29iS3S+06wFwiB
         Z7ZnS1byct6bwG95drW9M5qP9AsBZCP+L3I5wNkRGn8VLqt6lMhGK+7M3GH348IijmBy
         t6y1GKad2SmSLS/0h8RInkDD6rVTEzRPp6v5cpqZvUMVDyncIgxlNw3JXx8Nu1uvxLv5
         /uHECNUIXGr6GGzGEF4KEVn5GqrC5Fszo7PxIS9qOg93oRXF1kM9mODpMwTaSOBJAobE
         ZhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469077; x=1754073877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2Q1sCZcSlce+uGftjsED5FoBH5avvKrAL52Qesqqzc=;
        b=CEJKTanzP5R6XRxxm5utAdqVFte7ro0muh3z3DtDEMW0jpfWBSGO8eGRkgbhulHYza
         USiZKx3GoQypkkT8DsrN+cCTMaI6zAzfCFaH4URdYwnkg4tAhDSsNlUuAptjA/FDi4vl
         uFhcej8kK3RIp7T1lDHl8ERsl9tLXXX0QKn5meOjLdDWcasepraW9RWOM1pLDRh1O6sn
         17M6StVxwG2CFmQSz5X2VqqbhkpGSPYEdIgPIqWFfjzQxNvL3+1HhEB8VtWyUiEuCGbW
         qN4Q1i/fU3YiWqj0zq6dBjWL9esd4lWiT6OD3/Nijp4iwnYoxv5MBKh6/mF1TKUCHcvm
         vogQ==
X-Gm-Message-State: AOJu0Yx3ELe4lhjrIuQOEKsJEw6h1KZoXO+YZWk1ILtzAcQWCZs9jltS
	k5sp2JeWPEE5DwypsVC2tgVBoyWYWTDOVyR/YV5CdZj63CPo4v3l9JTMF443Py8nro0bPaVP8wQ
	WUmAf
X-Gm-Gg: ASbGncvi3q/BzU6xISIv6GHGftSg55oHbmgLia7xnckkifFYipOZai1jfUv06XyA3nn
	RIR16AvqIT68KrTz8xXt8fjxvpoSK4f3kmI7yhp5KPD9DaS+cBlyN0185TxDYBFe1I5tlWaw3dM
	wE6pfztSGKMc92YO+LvplwZyxUBbu26r6Gc6krDmnjkYAucT/sLPMcv3J6TJvMS570tXbiWk8sp
	gsIBB4f6VHJrydYkUl7TzZAuU0Z2oIpGfPPf54F17Su59vnujq8oQQSDA0fXbgnDZoEj7/KjUY9
	SDSVq/1AyzmC82zE5SKOt5FwAWxISaT00gv7M2Om7tch5Nu8pqlJzejvGD+2D4fY+AyUkKpAFtG
	KJ/9T5uU7pL76mQ==
X-Google-Smtp-Source: AGHT+IETyB4LhgaM2pRK1x+VrcUud6IPjQJ4eGxf5e3UH2jLebrmuLWdTv3q90cMqId8a4Yttkoxqg==
X-Received: by 2002:a17:902:d501:b0:23d:e2fc:6fe5 with SMTP id d9443c01a7336-23fb312a3ebmr49156535ad.49.1753469076770;
        Fri, 25 Jul 2025 11:44:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 00/16] Patch review
Date: Fri, 25 Jul 2025 11:44:14 -0700
Message-ID: <cover.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220916

Please review this set of changes for scarthgap and have comments back by
end of day Monday, July 28

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2091

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


